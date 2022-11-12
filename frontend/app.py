import streamlit as st
import mysql.connector
import pandas as pd

db = mysql.connector.connect(
    host="localhost",
    user="root",
    database="concert_management_system"
)

cursor = db.cursor()


def main():
    st.title('Concert Management System')
    # cursor.execute('select * from ticket')
    # res = cursor.fetchall()
    # cols = cursor.column_names
    # st.dataframe(pd.DataFrame(res,columns = cols))
if __name__ == '__main__':
    main()