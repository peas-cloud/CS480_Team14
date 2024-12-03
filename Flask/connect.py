import os
from dotenv import load_dotenv
import mysql.connector
from mysql.connector import Error

# Load environment variables from the .env file
load_dotenv()

class DbConnection:
    def __init__(self):
        self.username = os.getenv('MYSQL_DB_USERNAME')
        self.password = os.getenv('MYSQL_DB_PASSWORD')
        self.host = os.getenv('MYSQL_DB_HOST', 'localhost')
        self.database = os.getenv('MYSQL_DB_NAME')
        self.conn = None
        self.cursor = None

    def __connect__(self):
        try:
            self.conn = mysql.connector.connect(
                host=self.host,
                user=self.username,
                password=self.password,
                database=self.database
            )
            self.cursor = self.conn.cursor(dictionary=True)  # Dictionary cursor for row-as-dict output
            print("Successfully connected to MySQL!")
        except Error as e:
            raise Exception(f"Error connecting to the database: {e}")

    def execute_query(self, query, params=None, type=''):
        if not self.cursor:
            raise Exception("Database connection is not established.")
        try:
            self.cursor.execute(query, params)
            if type == 'insert':
                self.conn.commit()  # Commit for inserts
                return "Insert successful"
            elif type == 'query':
                return self.cursor.fetchall()
        except Error as e:
            raise Exception(f"Error executing query: {e}")

    def close(self):
        if self.cursor:
            self.cursor.close()
        if self.conn:
            self.conn.close()
if __name__ == "__main__":
    from connect import DbConnection

    print("Starting database connection test...")

    db = DbConnection()
    try:
        db.__connect__()
        print("Connection successful!")
    except Exception as e:
        print(f"Connection failed: {e}")
    finally:
        db.close()