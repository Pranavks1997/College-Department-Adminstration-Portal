from flask import Flask
from flask_restful import reqparse, abort, Api, Resource #change to webargs instead of reqparse(deprecated)
from flask_cors import CORS,cross_origin
from flaskext.mysql import MySQL
from passlib.hash import pbkdf2_sha256 as sha256
import passlib.handlers
from flask_jwt_extended import (create_access_token, create_refresh_token, jwt_required, jwt_refresh_token_required, get_jwt_identity, get_raw_jwt,get_jwt_claims, JWTManager)
import random, string



def generate_hash(password):
  return sha256.hash(password)

def verify_hash(password, hash):
  return sha256.verify(password, hash)

def add_revoked_token():
  pass

def check_if_revoked_token(jti):
  pass





class AccessToken(Resource):
  def get(self):
    return {get_jwt_identity():1}

  @jwt_refresh_token_required
  def post(self):
    current_user = get_jwt_identity()
    access_token = create_access_token(identity=current_user)
    return {'access_token':access_token}




#import resources
app = Flask(__name__)
api = Api(app)
cors = CORS(app)
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = None
app.config['MYSQL_DATABASE_DB'] = 'collegee'
app.config['MYSQL_DATABASE_HOST'] = '127.0.0.1'

app.config['JWT_SECRET_KEY'] = 'jwt-secret-string' #''.join(random.choice(string.ascii_uppercase + string.digits) for x in xrange(32))
jwt = JWTManager(app)
app.config['JWT_BLACKLIST_ENABLED'] = True
app.config['JWT_BLACKLIST_TOKEN_CHECKS'] = ['access', 'refresh']





@jwt.token_in_blacklist_loader
def check_if_token_in_blacklist(decrypted_token):
    jti = decrypted_token['jti']

    return is_jti_blacklisted(jti)

mysql.init_app(app)
conn = mysql.connect()
cursor =conn.cursor()
 #views, models,

parser = reqparse.RequestParser()
#making sure that the username and password keys won't be null (required = True)

parser.add_argument('t_name')
QUERY1 = "INSERT INTO `signup_and_login_users_table`(`dept_id`, `fullname`, `username`, `password`, `user_levels`) VALUES (1,'as','%s','%s',0)"
QUERY2 = "SELECT * FROM `signup_and_login_users_table` where username = '%s'"

@jwt_required
def add(jti):
  #jti = get_raw_jwt()['jti']
  QUERY4 = "INSERT INTO `revoked_tokens`( `jti`) VALUES ('%s')" %(jti)
  cursor.execute(QUERY4)
  conn.commit()
  #db.session.add(self)
  #db.session.commit()


@jwt.user_claims_loader
def add_claims_to_access_token(identity):
  QUERY = "select dept_id,user_levels from signup_and_login_users_table where username = '%s'"% identity
  b = cursor.execute(QUERY)
  conn.commit()
  for i in cursor:
    dept_id = i[0]
    user_level = i[1]
    break
  return {
    'dept' : dept_id,
    'user_level' : user_level
  }


def is_jti_blacklisted(jti):
  QUERY3 = "SELECT * FROM `revoked_tokens` WHERE jti = '%s'"%(jti)
  cursor.execute(QUERY3)
  #query = query.filter_by(jti=jti).first()
  if cursor.rowcount == 0:
    return False
  else:
    return True
class UserRegistration(Resource):
  def post(self):
    parser.add_argument('username', help='This field cannot be blanka', required=True)
    parser.add_argument('password', help='This field cannot be blank', required=True)

    data = parser.parse_args()
    username, password = data['username'], generate_hash(data['password'])
    try:
      cursor.execute(QUERY1 % (username,password))
      conn.commit()
      access_token = create_access_token(identity=data['username'])
      refresh_token = create_refresh_token(identity=data['username'])
      add_claims_to_access_token(username)
      return {
        (QUERY1) % (username, password): 'User {} was created'.format(data['username']),
        'access_token': access_token,
        'refresh_token': refresh_token
      }
    except:
      return {'message': (QUERY1)%(username,password)}, 500

class UserLogin(Resource):
  def post(self):
    parser.add_argument('username', help='This field cannot be blank', required=True)
    parser.add_argument('password', help='This field cannot be blank', required=True)
    data = parser.parse_args()
    username, password = data['username'], data['password']
    current_user = cursor.execute(QUERY2 % (username))
    #current_user = UserModel.find_by_username(data['username'])
    #return {cursor.fetchone()[4]:QUERY2 % (username)}
    if cursor.rowcount == 0 or cursor.rowcount == None:
      return {QUERY2 % (username): 'User {} doesn\'t exist'.format(data['username'])}
    result_set = cursor.fetchone()

    if verify_hash(data['password'], result_set[4]):
      access_token = create_access_token(identity=data['username'])
      refresh_token = create_refresh_token(identity=data['username'])
      return {
        'message': 'Logged in as {}'.format(result_set[3]),#current_user.username),
        'access_token': access_token,
        'refresh_token': refresh_token
      }
    else:
      return {'message': 'Wrong credentials'}
    return data


class UserLogoutAccess(Resource):
  @jwt_required
  def post(self):
    jti = get_raw_jwt()['jti']
    try:
      add(jti)
      #revoked_token = RevokedTokenModel(jti=jti)
      #revoked_token.add()
      return {'message': 'Access token has been revoked'}
    except:
      return {'message': 'Something went wrong'}, 500


class UserLogoutRefresh(Resource):
  @jwt_refresh_token_required
  def post(self):
    jti = get_raw_jwt()['jti']
    try:
      add(jti)
      #revoked_token = RevokedTokenModel(jti=jti)
      #revoked_token.add()
      return {'message': 'Refresh token has been revoked'}
    except:
      return {'message': 'Something went wrong'}, 500


class TokenRefresh(Resource):
  def post(self):
    return {'message': 'Token refresh'}


class AllUsers(Resource):
  def get(self):
    return {'message': 'List of users'}

  def delete(self):
    return {'message': 'Delete all users'}


class SecretResource(Resource):
  @jwt_required
  def get(self):
    claims = get_jwt_claims()
    return {

      'answer': get_jwt_identity(),
      1: get_raw_jwt()['jti'],
      2 : claims['dept'],
      3 : claims['user_level']

    }

class CollegeDepartments(Resource):
  def get(self):
    #retrieve all the department names
    QUERY = "SELECT d.dept_abbr, d.dept_name, sign.fullname FROM dept_info d, signup_and_login_users_table sign where d.dept_hod = sign.id"
    dept = cursor.execute(QUERY)
    res = {}
    for k,i in enumerate(cursor):
      res[k] = i
    return res
  def post(self):
    #TODO: give super admin access
    #able to add new department
    data = parser.parse_args()
    abbr, name= data['abbr'], data['name']
    QUERY = "INSERT INTO `dept_info`(`dept_abbr`, `dept_name`)VALUES('%s','%s')"%(abbr,name)
    res = {}
    try:
      cursor.execute(QUERY)
      conn.commit()
      for k, i in enumerate(cursor):
        res[k] = i
      return res
    except:
      res['err']='error'
      return res
  def put(self):
    #TODO: give super admin access
    #edit the department details
    return ''
  def delete(self):
    #todo: give super admin access
    #req specification: not sure  if deleting dept option is needed
    return ''

class Teacher(Resource):
  def get(self):
    #retrieve all the teachers of [the current logged in user's dept]
    return ''
  @jwt_required
  def post(self):
    #add new teacher to the department
    data = parser.parse_args()
    teacher_name = data['t_name']
    claims = get_jwt_claims()
    dept_id = claims['dept']
    temp_password = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(16))
    username = ''.join(random.choice(string.ascii_uppercase) for _ in range(8))
    cnt = 0
    res = {}
    try:
      if cnt != 4:
        QUERY = "INSERT INTO `ftlogin`(`dept_id`, `userlevel`, `name`, `username`, `pswd`) VALUES (%s,0,'%s','%s','%s')" % (dept_id,teacher_name,username,temp_password)
        cnt += 1
        cursor.execute(QUERY)
        conn.commit()
        res['msg'] = 'OK'
    except:
      res['msg'] = 'err'
    return res
  def put(self):
    #edit teacher information
    return ''
  def delete(self):
    #remove teacher information
    return ''

class HOD(Resource):
  def get(self):
    #retrieve all the HOD's of the college
    return ''
  def post(self):
    #add new HOD to the department
    return ''
  def put(self):
    #edit HOD information
    return ''
  def delete(self):
    #remove HOD information
    #req specification: not sure
    return ''

class Students(Resource):
  #TODO: Admin access
  def get(self):
    # retrieve all the students of [the current logged in user's dept]
    return ''
  @jwt_required
  def post(self):
    # add new student to the department
    parser.add_argument('student')
    parser.add_argument('usn', help = 'This field cannot be blank', required = True)
    data = parser.parse_args()
    student_name, usn = data['student'], data['usn']
    claims = get_jwt_claims()
    dept_id = claims['dept']
    res = {}
    try:
      #TODO: change the sem_id part later, separate class and the student tables
      QUERY = "INSERT INTO `students`(`dept_id`, `sem_id`, `usn`, `name`) VALUES (%s,1,'%s','%s')" % (dept_id,usn,student_name)
      cursor.execute(QUERY)
      conn.commit()
      res['msg'] = 'OK'
    except:
      res['msg'] = 'err'
    return res

  def put(self):
    # edit student information
    return ''
  def delete(self):
    # remove student information
    return ''

class StudentsAttendance(Resource):
  @jwt_required
  def get(self):
    #return attendance of all the students of ['dept'] ['sem'] ['sec']
    parser.add_argument('sem',required = True)
    parser.add_argument('sec', required = True)
    data = parser.parse_args()
    sem, sec = data['sem'], data['sec']
    claims = get_jwt_claims()
    dept_id = claims['dept']
    res={}
    try:
      #TODO:
      QUERYp1 = "SELECT stud.name,sub.sub_name, ia.*, held.total_classes,a.no_of_absent FROM iamarks ia, subjects sub, deptsemsec d, students stud, attendances a, total_classes_held held WHERE ia.sid = stud.sid AND ia.sub_id = sub.sub_id AND held.sub_id = a.sub_id AND a.sid = stud.sid AND d.dept_id = %s AND d.sem= %s AND d.sec= '%s' AND stud.sem_id=d.sem_id"%(dept_id,sem,sec)
      cursor.execute(QUERYp1)
      conn.commit()
      for k, i in enumerate(cursor):
        res[k] = i
    except:
      res['msg'] = 'err'
    #attendance query goes in here
    return res

class StudentsAttendanceEdit(Resource):
  @jwt_required
  def post(self):
    #update attendance for ['student'] ['subject']
    parser.add_argument('sem', required=True)
    parser.add_argument('sec', required=True)
    parser.add_argument('sub', required=True)
    parser.add_argument('usn', required=True)
    data = parser.parse_args()
    sem, sec ,sub , usn = data['sem'], data['sec'],data['sub'],data['usn']
    claims = get_jwt_claims()
    dept_id = claims['dept']
    res = {}
    try:
      # TODO:
      QUERYp2 = "SELECT stud.usn,stud.name FROM students stud, deptsemsec dept WHERE stud.sem_id=dept.sem_id AND dept.sem= %s AND dept.sec= '%s'"%(sem,sec)
      QUERYp3="UPDATE `total_classes_held` SET `total_classes`=total_classes+1 WHERE sub_id IN (SELECT subjects.sub_id FROM subjects WHERE subjects.sub_abbr='%s')"%(sub)
      QUERYp4="update attendances a set a.no_of_absent=a.no_of_absent+1 where a.sid IN(SELECT s.sid FROM students s WHERE s.usn='%s') and a.sub_id IN(SELECT s.sub_id FROM subjects s WHERE s.sub_abbr='%s' )"%(usn,sub)

      cursor.execute(QUERYp2)
      cursor.execute(QUERYp3)
      cursor.execute(QUERYp4)
      conn.commit()
    except:
      res['msg'] = 'err'
    # attendance query goes in here
    return res




class SubjectClasses(Resource):
  def get(self):
    #return all the subjects of all the sem and the number ofclasses
    return ''
  def put(self):
    #update a subject's total number of classes by one
    return ''

class IAMarks(Resource):
  @jwt_required
  def post(self):
    # return iamarks of all the students of ['dept'] ['sem'] ['sec']
    parser.add_argument('sem', required=True)
    parser.add_argument('sec', required=True)
    parser.add_argument('sub', required=True)
    #parser.add_argument('usn', required=True)
    data = parser.parse_args()
    sem, sec , sub = data['sem'], data['sec'], data['sub'] #, data['usn']
    claims = get_jwt_claims()
    dept_id = claims['dept']
    tempia= "SELECT sub_id FROM `subjects` WHERE sub_abbr='%s'"%(sub)
    cursor.execute(tempia)
    conn.commit()
    res1={}
    for k,i in enumerate(cursor):
      res1[k]=i
    sub_id=res1[0][0]
    #print(sub_id)
    res = {}
    try:
      # TODO:
      QUERYp8 = "SELECT s.usn,s.name,sub.sub_name,sub.sub_abbr,ia.* FROM iamarks ia, students s, subjects sub,deptsemsec d WHERE ia.sid = s.sid AND ia.sub_id = sub.sub_id AND s.sem_id=d.sem_id AND d.sem=%s AND d.sec='%s' AND ia.sub_id=%s AND d.dept_id=%s"%(sem,sec,sub_id,dept_id)
      #print(QUERYp8)
      cursor.execute(QUERYp8)
      #cursor.execute(QUERYp9)
      conn.commit()
      for k, i in enumerate(cursor):
        res[k] = i
    except:
      res['msg'] = 'err'
    return res



class IAMarksEdit(Resource):
  @jwt_required
  def post(self):
    parser.add_argument('sem', required=True)
    parser.add_argument('sec', required=True)
    parser.add_argument('sub', required=True)
    parser.add_argument('usn', required=True)
    parser.add_argument('inter', required=True)
    parser.add_argument('quiz', required=True)
    parser.add_argument('assign', required=True)
    parser.add_argument('intnum', required=True)

    data = parser.parse_args()
    sem, sec, sub, usn, inter ,quiz ,assign ,intnum  = data['sem'], data['sec'], data['sub'], data['usn'], data['inter'] ,data['quiz'], data['assign'],data['intnum']
    claims = get_jwt_claims()
    dept_id = claims['dept']
    res = {}
    #QUERYp5 = "SELECT sub.sub_abbr as subject,sub.sub_name, stud.usn,stud.name FROM signup_and_login_users_table ss, students stud, deptsemsec d, teachers_classes tc, subjects sub WHERE tc.tid = ss.id AND tc.sem_id = d.sem_id AND tc.subabbr = sub.sub_id AND stud.sem_id=d.sem_id AND ss.username ='%s' AND d.sem= %s AND d.sec='%s'" % (
    #tname, sem, sec)
    QUERYp6 = "UPDATE `iamarks` SET internals%s='%s',quiz%s='%s',assignment%s='%s' WHERE sub_id IN(SELECT ss.sub_id FROM subjects ss WHERE ss.sub_abbr='%s') AND sid IN (SELECT s.sid FROM students s WHERE s.usn ='%s')" % (
    intnum, inter , intnum , quiz, intnum ,assign , sub, usn)
    try:
      # TODO:

      #print(QUERYp5)
      #print(QUERYp6)
      #cursor.execute(QUERYp5)
      cursor.execute(QUERYp6)
      conn.commit()
    except:
      res['msg'] = 'err'
    # attendance query goes in here
    return res

  def put(self):
    #edit marks
    return ''




class Scheme(Resource):
  def get(self):
    #get a list of all the schemes
    return ''
  def post(self):
    #add new scheme, all the col of the table
    return ''
  def put(self):
    #edit the given scheme
    return ''


class Subject(Resource):
  def get(self):
    #get all the subjects of a given
    return ''
  def post(self):
    #add subjects
    return ''


api.add_resource(UserRegistration, '/registration')
api.add_resource(UserLogin, '/login')
api.add_resource(UserLogoutAccess, '/logout/access')
api.add_resource(UserLogoutRefresh, '/logout/refresh')
api.add_resource(TokenRefresh, '/token/refresh')
api.add_resource(AllUsers, '/users')
api.add_resource(SecretResource, '/secret')
api.add_resource(AccessToken,'/access')
api.add_resource(CollegeDepartments,'/departments')
api.add_resource(Teacher,'/teacher')
api.add_resource(Students,'/students')
api.add_resource(StudentsAttendance,'/studentsattendance')
api.add_resource(StudentsAttendanceEdit,'/studentsattendanceedit')
api.add_resource(IAMarks,'/iamarks')
api.add_resource(IAMarksEdit,'/iamarksedit')

if __name__ == '__main__':
    app.run(debug=True)