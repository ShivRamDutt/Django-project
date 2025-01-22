# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
#WORKDIR /app

# Copy the Django project archive to the container
#COPY dj.tar.gz /app

# Extract the archive
#RUN apt-get update && \
#    apt-get install -y --no-install-recommends tar && \
#    tar -xzf dj.tar.gz && \
#    rm dj.tar.gz && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

# Set the working directory to the root of the extracted project
WORKDIR /app
Copy . .
# Install the dependencies using the path where requirements.txt is located
Run pip install --no-cache-dir -r requirements.txt

# Expose the port Django runs on
EXPOSE 8000

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Start Django application
CMD ["python", "website/manage.py", "runserver", "0.0.0.0:8000"]
