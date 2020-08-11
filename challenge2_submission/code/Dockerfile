# Use an official Python runtime as a parent image
FROM python:3.4-slim

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Run Jupyter notebooks
jupyter nbconvert --execute HTM_clean.ipynb
jupyter nbconvert --execute HTM_challenge.ipynb
jupyter nbconvert --execute predict_corrosive.ipynb

