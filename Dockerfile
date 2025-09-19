# Use an official lightweight Python image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file and install them
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY . .

# Run the web server. Cloud Run injects the PORT environment variable.
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "main:app"]