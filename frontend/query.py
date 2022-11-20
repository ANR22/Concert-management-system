import streamlit as st
from database import run_query
import pandas as pd

def run():
    query = st.text_area('Query: ',placeholder='show tables')
    if st.button('Execute'):
        data,columns,error = run_query(query)
        if error == None:
                # with st.expander('Results', expanded=True):
                    st.dataframe(pd.DataFrame(data, columns = columns), width=1500)
        else:
            print(error)
            st.write(error)              