import streamlit as st
st.title("Sales Dashboard - Exploratory Data Analysis (EDA)")
col1,col2,col3 = st.columns(3)
with col1:
    st.metric(label="Total Sales", value="$1,000,000" ,delta="+18%")
with col2:
    st.metric(label="Total Customers", value="10,000",delta="-5%")
with col3:
    st.metric(label="Average Order Value", value="$100",delta="+10%")