import pandas as pd
import streamlit as st
from database import view_all_data, view_only_user_names, get_dealer, edit_user_data


def update():
    result,cols = view_all_data()
    # st.write(result)
    df = pd.DataFrame(result, columns=cols)
    with st.expander("Current Users"):
        st.dataframe(df)
    list_of_users = [i[0] for i in view_only_user_names()]
    selected_user = st.selectbox("User to Edit", list_of_users)
    selected_result = get_dealer(selected_user)
    
    if selected_result:
        user_id = selected_result[0]
        name = selected_result[1]
        date_of_birth = selected_result[2]
        is_admin = selected_result[3]
        ph_no = selected_result[4]

        # Layout of Create

        col1, col2 = st.columns(2)
        with col1:
            new_name = st.text_input("Name",name)
            new_date_of_birth = st.date_input("Date of Birth",date_of_birth)
        with col2:
            new_is_admin = st.selectbox("Is_admin", options=['yes','no'])
            new_ph_no = st.text_input("Phone number:",ph_no)
        invalid_phno = len(ph_no) != 10 or sum([1 if not i.isdigit() else 0 for i in new_ph_no]) > 0
        if st.button("Update User"):
            if user_id == '' or name=='' or ph_no=='':
                st.info('No field shoul be empty')
            elif invalid_phno:
                st.info('Please enter a valid phone number')
            else:
                edit_user_data(user_id, new_name, new_date_of_birth, new_is_admin, new_ph_no, user_id, name, date_of_birth, is_admin, ph_no)
                st.success("Successfully updated")
            

    result2,cols = view_all_data()
    df2 = pd.DataFrame(result2, columns=cols)
    with st.expander("Updated data"):
        st.dataframe(df2) 
