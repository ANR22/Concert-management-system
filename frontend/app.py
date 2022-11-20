# Importing pakages
import streamlit as st
import mysql.connector

from create import create
# from database import create_table
from delete import delete
from read import read
from update import update
from query import run

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    database=""
)
c = mydb.cursor()


table_name = 'User'

def main():
    st.title("CONCERT MANAGEMENT SYSTEM")
    menu = ["Add", "View", "Edit", "Remove","Run Query"]
    choice = st.sidebar.selectbox("Menu", menu)

    # create_table()
    if choice == "Add":
        st.subheader(f"Enter {table_name} Details:")
        create()

    if choice == "View":
        st.subheader(f"View {table_name}")
        read()

    elif choice == "Edit":
        st.subheader(f"Update {table_name} Details")
        update()

    elif choice == "Remove":
        st.subheader(f"Delete {table_name}")
        delete()
    
    elif choice == 'Run Query':
        st.subheader("Query Runner")
        run()

if __name__ == '__main__':
    main()
