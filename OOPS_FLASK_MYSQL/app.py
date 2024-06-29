from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
import logging
from config import DB_CONFIG

# Initialize the Flask application
app = Flask(__name__)

# Initialize the logger
logger = logging.getLogger(__name__)

def get_db_connection():
    """
    Establish a connection to the MySQL database.
    """
    logger.debug("Establishing database connection")
    try:
        connection = mysql.connector.connect(**DB_CONFIG)
        logger.debug("Database connection established")
        return connection
    except mysql.connector.Error as err:
        logger.error(f"Error connecting to database: {err}")
        raise

def init_db():
    """
    Initialize the database by creating the Students table if it doesn't exist.
    """
    logger.debug("Initializing database")
    db_connection = get_db_connection()
    cursor = db_connection.cursor()
    cursor.execute(''' 
    CREATE TABLE IF NOT EXISTS Students (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255),
        age INT,
        city VARCHAR(255)
    )
    ''')
    db_connection.close()
    logger.debug("Database initialized")

class Student:
    
    def __init__(self, name, age, city):
        self.name = name
        self.age = age
        self.city = city
        logger.debug(f"Created Student instance: {self}")

    def save_to_db(self):
        """
        Save the current Student instance to the database.
        """
        logger.debug(f"Saving student {self.name} to the database")
        db_connection = get_db_connection()
        cursor = db_connection.cursor()
        try:
            cursor.execute(
                "INSERT INTO Students (name, age, city) VALUES (%s, %s, %s)",
                (self.name, self.age, self.city)
            )
            db_connection.commit()
            logger.info(f"Student {self.name} saved to database")
        except mysql.connector.Error as err:
            logger.error(f"Error saving student {self.name} to database: {err}")
        finally:
            db_connection.close()
            logger.debug("Database connection closed")

    @staticmethod
    def fetch_from_db():
        """
        Fetch all student records from the database.
        """
        logger.debug("Fetching all students from the database")
        db_connection = get_db_connection()
        cursor = db_connection.cursor()
        try:
            cursor.execute("SELECT name, age, city FROM Students")
            students = cursor.fetchall()
            logger.info(f"Fetched {len(students)} students from database")
            return students
        except mysql.connector.Error as err:
            logger.error(f"Error fetching students from database: {err}")
            return []
        finally:
            db_connection.close()
            logger.debug("Database connection closed")

@app.route('/', methods=['GET', 'POST'])
def index():
    """
    Route to handle the main page where users can enter student details.
    """
    if request.method == 'POST':
        name = request.form['name']
        age = request.form['age']
        city = request.form['city']
        student = Student(name, age, city)
        student.save_to_db()
        return redirect(url_for('users'))
    return render_template('index.html')

@app.route('/users')
def users():
    """
    Route to display all students in the database.
    """
    students = Student.fetch_from_db()
    return render_template('users.html', students=students)

if __name__ == '__main__':
    
    # Initialize the database
    init_db()
   
    app.run(debug=True)
