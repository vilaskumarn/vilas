import streamlit as st
st.title("Visualization Analysis")
st.header("Header Example")
st.subheader("Subheader Example")
st.text("This is plain text")
name = st.text_input("Enter Name")

password = st.text_input(
    "Enter Password",
    type="password"
)
st.write(f"Name: {name}")
st.write(f"Password: {password}")
age = st.number_input("Enter Age")
st.write(f"Age: {age}")

salary = st.slider(
    "Select Salary",
    10000,
    100000,
    50000
)
st.write(f"Salary: {salary}")
gender = st.radio(
    "Select Gender",
    ["Male", "Female"]
)
st.write(f"Gender: {gender}")

skills = st.multiselect(
    "Select Skills",
    ["Python", "SQL", "Power BI"]
)

agree = st.checkbox("Accept Terms")
st.write(agree)
submit = st.button("Submit")
st.write(submit)

date = st.date_input("Select Date")


time = st.time_input("Select Time")

file = st.file_uploader("Upload File")

color = st.color_picker("Pick Color")

st.write(f"Selected Date: {date}")
st.write(f"Selected Time: {time}")
st.write(f"Uploaded File: {file}")
st.write(f"Selected Color: {color}")


