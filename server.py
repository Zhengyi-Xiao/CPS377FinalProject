from flask import Flask, render_template, request, session, url_for, redirect
import pymysql.cursors
import sys


#Initialize the app from Flask
app = Flask(__name__)

#Configure MySQL
conn = pymysql.connect(host='localhost',
                       user='root',
                       password='root',
                       port=8889,
                       db='FinalProject',
                       charset='utf8mb4',
                       cursorclass=pymysql.cursors.DictCursor)

@app.route('/')
def hello():
    cursor = conn.cursor()
    query = 'SELECT * FROM university' 
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()
    return render_template('index.html', schools = data)    

@app.route('/student_login')
def student_login():
	return render_template('student_login.html')

@app.route('/professor_login')
def prof_login():
	return render_template('professor_login.html')

@app.route('/studentLoginAuth', methods=['GET', 'POST'])
def studentLoginAuth():
    email = request.form['username']
    password = request.form['password']

    cursor = conn.cursor()
    query = 'SELECT university, first_name, last_name FROM  student WHERE student.email = %s and student.password = %s'
    cursor.execute(query, (email, password))
    data = cursor.fetchone()
    cursor.close()
    error = None
    if(data):
        session['university_name'] = data['university'] 
        session['first_name' ] = data['first_name']
        session['last_name'] = data['last_name']
        session['email'] = email
        cursor = conn.cursor()
        query1 = 'SELECT professor.email, professor.dept_name, professor.first_name,professor.last_name,professor.pronounce FROM student join advising on student.email = advising.student_email JOIN professor on professor.email = advising.prof_email where student.email = %s'
        cursor.execute(query1, email)
        data2 = cursor.fetchall()
        cursor.close()
        return render_template('student_home.html', professorInfor = data2)
    else:
        error = 'Invalid login or username'
        return render_template('student_login.html', error=error)

@app.route('/student_home')
def student_home():   
    cursor = conn.cursor()
    query1 = 'SELECT professor.email, professor.dept_name, professor.first_name,professor.last_name,professor.pronounce FROM student join advising on student.email = advising.student_email JOIN professor on professor.email = advising.prof_email where student.email = %s'
    cursor.execute(query1, session['email'])
    data2 = cursor.fetchall()
    print(data2)
    cursor.close()
    return render_template('student_home.html', professorInfor = data2)

@app.route('/student/classes')
def student_classes():   
    cursor = conn.cursor()
    query1 = 'SELECT course_code, section_id,overall_grade FROM taking WHERE student_email = %s'
    cursor.execute(query1, session['email'])
    data1 = cursor.fetchall()
    cursor.close()
    return render_template('/student/classes.html', classInfor = data1)

@app.route('/student/assignments')
def student_assignemnts():
    return render_template('/student/assignments.html')

@app.route('/findAssignment', methods=['GET', 'POST'])
def findAssignment():
    course = request.form['course']
    section = request.form['section']

    cursor = conn.cursor()
    query = "SELECT * FROM assignment WHERE course_code = %s and section_id = %s and student_email = %s"
    cursor.execute(query, (course,section,session['email']))
    assignment = cursor.fetchall()
    cursor.close()

    return render_template('/student/assignments.html', course = course, assignment = assignment)   

@app.route('/professor_home')
def prof_home():   
    cursor = conn.cursor()
    query1 = 'SELECT student.email, student.first_name, student.last_name,student.pronounce,student.major,student.GPA,student.AnticipateGrad FROM professor JOIN advising on professor.email = advising.prof_email join student on advising.student_email = student.email where professor.email = %s'
    cursor.execute(query1, session['email'])
    data2 = cursor.fetchall()
    cursor.close()
    return render_template('professor_home.html', studentInfor = data2)

@app.route('/prof/classes')
def prof_classes():   
    cursor = conn.cursor()
    query1 = 'SELECT student.email, student.first_name, student.last_name,student.pronounce,student.major,student.GPA,student.AnticipateGrad FROM professor JOIN advising on professor.email = advising.prof_email join student on advising.student_email = student.email where professor.email = %s'
    cursor.execute(query1, session['email'])
    data1 = cursor.fetchall()
    cursor.close()
    cursor = conn.cursor()
    query2 = 'SELECT teaching.course_code, teaching.section_id, section.section_time, section.room, section.building FROM section join teaching on teaching.course_code = section.course_code and teaching.section_id = section.section_id WHERE teaching.prof_email = %s'
    cursor.execute(query2, session['email'])
    data2 = cursor.fetchall()
    return render_template('/prof/classes.html', studentInfor = data1, classInfor = data2)

@app.route('/prof/assignments')
def prof_assignemnts():
    return render_template('/prof/assignments.html')

@app.route('/addAssignment', methods=['GET', 'POST'])
def addAssignment():
    course = request.form['course']
    section = request.form['section']
    hw = request.form['hw']
    ddl = request.form['ddl']

    cursor = conn.cursor()
    query = "SELECT student_email FROM taking WHERE course_code = %s and section_id = %s "
    cursor.execute(query, (course,section))
    student = cursor.fetchall()
    cursor.close()
    
    for email in student:
        print(ddl)
        cursor = conn.cursor()    
        #INSERT INTO Assignment VALUES("CPS101","01",1,"st123@fandm.edu",'2020-11-01',"A");

        query = 'INSERT INTO Assignment VALUES(%s,%s,%s,%s,%s, "-");'
        cursor.execute(query, (course,section,hw,email['student_email'],ddl))
        conn.commit()
        cursor.close()
    
    cursor = conn.cursor()
    query2 = 'SELECT assignment_num, student_email, deadline, grade FROM assignment WHERE course_code = %s and section_id = %s;'
    cursor.execute(query2, (course,section))
    data2 = cursor.fetchall()
    cursor.close()
    return render_template('/prof/assignments.html', course = course, assignment = data2)   

@app.route('/updateGrade', methods=['GET', 'POST'])
def updateGrade():
    course  = request.form['course']
    section = request.form['section']
    hw      = request.form['hw']
    email   = request.form['email']
    grade   = request.form['grade']

    cursor = conn.cursor()
    query = "UPDATE assignment set grade = %s WHERE course_code = %s and section_id = %s and assignment_num = %s and assignment.student_email = %s" 
    cursor.execute(query, (grade,course,section,hw ,"st123@fandm.edu" ))
    conn.commit()
    cursor.close()

    
    cursor = conn.cursor()
    query2 = 'SELECT assignment_num, student_email, deadline, grade FROM assignment WHERE course_code = %s and section_id = %s;'
    cursor.execute(query2, (course,section))
    data2 = cursor.fetchall()
    cursor.close()
    return render_template('/prof/assignments.html', course = course, assignment = data2)   

@app.route('/profLoginAuth', methods=['GET', 'POST'])
def profLoginAuth():
    email = request.form['email']
    password = request.form['password']

    cursor = conn.cursor()
    query = 'SELECT university_name, first_name, last_name FROM department natural join professor WHERE professor.email = %s and professor.password = %s'
    cursor.execute(query, (email, password))
    data = cursor.fetchone()
    cursor.close()
    error = None
    if(data):
        session['university_name'] = data['university_name']
        session['first_name' ] = data['first_name']
        session['last_name'] = data['last_name']
        session['email'] = email
        cursor = conn.cursor()
        query1 = 'SELECT student.email, student.first_name, student.last_name,student.pronounce,student.major,student.GPA,student.AnticipateGrad FROM professor JOIN advising on professor.email = advising.prof_email join student on advising.student_email = student.email where professor.email = %s'
        cursor.execute(query1, email)
        data2 = cursor.fetchall()
        cursor.close()
        return render_template('professor_home.html', studentInfor = data2)
    else:
        error = 'Invalid login or username'
        return render_template('professor_login.html', error=error)

@app.route('/logout_student')
def logout_student():
    session.pop('email')
    session.pop('university_name')
    session.pop('first_name')
    session.pop('last_name')
    return redirect('/student_login')

@app.route('/logout_professor')
def logout_professor():
    session.pop('email')
    session.pop('university_name')
    session.pop('first_name')
    session.pop('last_name')
    return redirect('/professor_login')   

app.secret_key = 'some key that you will never guess'
#Run the app on localhost port 5000
#debug = True -> you don't have to restart flask
#for changes to go through, TURN OFF FOR PRODUCTION
if __name__ == "__main__":
	app.run('127.0.0.1', 5004, debug = True)
