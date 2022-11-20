import pandas as pd
import streamlit as st
import plotly.express as px
from database import view_all_data

def read():
    result,col_names = view_all_data()
    df = pd.DataFrame(result, columns=col_names)
    # with st.expander("View all User"):
    st.dataframe(df, width=1500)
    