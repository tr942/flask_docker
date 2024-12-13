# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the necessary Python packages from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that Flask will run on
EXPOSE 5000

# Define environment variable to specify Flask should run in production mode
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Set the command to run the Flask app
ENTRYPOINT ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=5000"]