import streamlit as st
from database import add_data


def create():
    col1, col2 = st.columns(2)
    
    with col1:
        user_id = st.text_input("User_id")
        name = st.text_input("Name")
        date_of_birth = st.date_input("Date of Birth")
    with col2:
        is_admin = st.selectbox("Is_admin", options=['yes','no'])
        ph_no = st.text_input("Phone number:")
    
    invalid_phno = len(ph_no) != 10 or sum([1 if not i.isdigit() else 0 for i in ph_no]) > 0
    if st.button("Add USer"):
        if user_id == '' or name=='' or ph_no=='':
            st.info('No field shoul be empty')
        elif invalid_phno:
            st.info('Please enter a valid phone number')
        else:
            add_data(user_id,name,date_of_birth,is_admin,ph_no)
            st.success("Successfully added User: {}".format(name))
