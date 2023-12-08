import sqlite3
from sqlite3 import Error

def openConnection(_dbFile):
    conn = None
    try:
        conn = sqlite3.connect(_dbFile)
    except Error as e:
        print(e)
    return conn

def closeConnection(_conn, _dbFile):
    try:    
        _conn.close()
    except Error as e:
        print(e)



def addInfo(_conn):
    u_username = input("Enter username: ")
    u_email = input("Enter email: ")
    u_password = input("Enter password: ")
    u_income = int(input("Enter income: "))
    u_ethnicity = input("Enter ethnicity: ")
    u_race = input("Enter race: ")
    u_age = int(input("Enter age: "))
    u_gender = input("Enter gender: ")
    u_sex = input("Enter sex: ")
    u_gpa = float(input("Enter GPA: "))
    u_schoolname = input("Enter school name: ")
    u_extracurriculars = input("Enter extracurriculars: ")

    try:
        cur = _conn.cursor()
        cur.execute('''
            INSERT INTO users (
                u_username, u_email, u_password, u_income, u_ethnicity,
                u_race, u_age, u_gender, u_sex, u_gpa, u_schoolname, u_extracurriculars
            )
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
        ''', (u_username, u_email, u_password, u_income, u_ethnicity, u_race,
              u_age, u_gender, u_sex, u_gpa, u_schoolname, u_extracurriculars))
        _conn.commit()
        print("User added successfully!")
        return u_username
    except sqlite3.Error as e:
        print(e)
        return 0
def fetchInfo(_conn):
    u_username = input("Enter username: ")
    u_password = input("Enter password: ")

    try:
        cur = _conn.cursor()
        cur.execute(
            '''SELECT * FROM users 
            WHERE u_username = ? AND u_password = ?;''',
            (u_username, u_password)
        )
        result = cur.fetchall()
        if result:
            print("User found!")
            return u_username
        else:
            print("User not found.")
            return 0
    except sqlite3.Error as e:
        print(e)
        return 0

def newApp(_conn, username):
    cur = _conn.cursor()
    schools = []  # user's input for schools is stored in a list
    recomm  = []
    # loop for the user to input schools until they enter 0 to stop
    while True:
        school_name = input("Enter school name (Enter 0 to finish): ")
        if school_name == "0":
            break
        else:
            schools.append(school_name)
    #get the recommender
    while True:
        prof = input("Enter your recommender  (Enter 0 to finish): ")
        if prof == "0":
            break
        else:
            employ = input("Enter your recommender's employment: ")
            recomm.append([prof,employ])
    #for all the school selected
    for school in schools:
        cur.execute(    
            '''SELECT m_type, m_degree, m_degreekey FROM major 
            WHERE m_schoolname = ?;''',
            (school,)
        )
        #print the degree
        print(school+": ")
        for pair in cur.fetchall():
            print(pair[0]+":"+pair[1]+":"+pair[2])
        #select the degree
        while True:
            major_key = input(f"Enter degree key for {school} (Enter 0 to finish): ")
            if major_key == "0":
                break
            else:
                try:
                    #get new appkey
                    cur.execute('''
                        SELECT max(a_appkey) FROM applications;
                    ''')
                    appkey = cur.fetchall()[0][0] + 1
                    #insert in to school
                    cur.execute('''
                        INSERT INTO applications (a_appkey, a_username, a_schoolname, a_majorkey)
                        VALUES (?, ?, ?, ?);
                    ''', (appkey, username, school, major_key))
                    #insert in to recommender
                    for recom in recomm:
                        cur.execute('''
                            INSERT INTO recommendations (r_professors, r_employment, r_appkey)
                            VALUES (?, ?, ?);
                        ''', (recom[0], recom[1], appkey))
                    _conn.commit()
                except sqlite3.Error as e:
                    print(e)
    print("Application submitted")


        
        


def oldApp(_conn, username):
    cur = _conn.cursor()
    cur.execute(    
        '''
        select * from applications where a_username = ?;
        ''',
        (username,)
    )
    applications = cur.fetchall()
    for app in applications:
        cur.execute(    
        '''
        select m_degree,m_type from major where m_degreekey = ?;
        ''',
        (app[3],)
        )
        degree = cur.fetchall()

        print(f"Application key: {app[0]} School: {app[2]} Degree: {degree[0][0]} Type: {degree[0][1]}")
    _conn.commit()     
def modifyApp(_conn, username):
    oldApp(_conn,username)
    cur = _conn.cursor()
    appkey = input("Enter appkey: ")
    majorkey = input("Enter majorkey: ")
    cur.execute(    
        '''
        update applications set a_majorkey = ? where a_appkey = ?        
        ''',
        (appkey,majorkey)
    )
    print("Done!")
    _conn.commit()


def main():
    database = "../application.sqlite"

    conn = openConnection(database)
    with conn:
        #login
        username = 0
        while(username == 0):
            new_user=int(input("New user enter 1. Old user enter 0: "))
            # print(appkey)
            if (new_user == 1):
                username = addInfo(conn)
            else :
                username = fetchInfo(conn)
        #action
        action = int(input("What do you want to do? New Application Enter 1. Edit pass application Enter 2. View pass application Enter 3. Quit Enter 0: "))
        while(action!= 0):
            if(action == 1):
                newApp(conn,username)
            elif (action == 2):
                oldApp(conn,username)
            elif(action ==3):
                modifyApp(conn,username)
            else:
                print("Invalid input")
            action = int(input("What do you want to do? New Application Enter 1. Edit pass application Enter 2. View pass application Enter 3. Quit Enter 0: "))
        print("Bye")
    closeConnection(conn, database)


if __name__ == '__main__':
    main()
