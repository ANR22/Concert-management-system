# pip install mysql-connector-python
import mysql.connector
import pandas as pd
import streamlit as st

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    database="cs625_cms"
)


c = mydb.cursor()


def create_table():
    c.execute('CREATE TABLE IF NOT EXISTS TRAIN(Train_no int, name varchar(100), train_type varchar(50), source varchar(50), destination varchar(50), availability varchar(5))')


def add_data(user_id,name,date_of_birth,is_admin,ph_no):
    c.execute('INSERT INTO User(user_id,name,DOB,is_admin,ph_no) VALUES (%s,%s,%s,'
              '%s,%s)',
              (user_id,name,date_of_birth,is_admin,ph_no))
    mydb.commit()


def view_all_data():
    c.execute('SELECT * FROM user')
    data = c.fetchall()
    return data,c.column_names

def view_only_user_names():
    c.execute('SELECT * FROM user')
    data = c.fetchall()
    return data


def get_dealer(user_id):
    c.execute('SELECT * FROM user WHERE user_id="{}"'.format(user_id))
    data = c.fetchone()
    return data


def edit_user_data(new_user_id, new_name, new_date_of_birth, new_is_admin, new_ph_no, user_id, name, date_of_birth, is_admin, ph_no):
    c.execute("UPDATE user SET user_id=%s, Name=%s, DOB=%s, is_admin=%s, ph_no=%s WHERE "
              "user_id=%s and Name=%s and DOB=%s and is_admin=%s and ph_no=%s", (new_user_id, new_name, new_date_of_birth, new_is_admin, new_ph_no, user_id, name, date_of_birth, is_admin, ph_no))
    mydb.commit()
   


def delete_data(user_id):
    c.execute('DELETE FROM user WHERE user_id="{}"'.format(user_id))
    mydb.commit()


def run_query(query):
    data,columns,error = None,None,None
    try:
        c.execute(query)
    except mysql.connector.Error as e:
        print(e)
        return data,columns,e
    data=c.fetchall()
    columns = c.column_names
    return data,columns,error