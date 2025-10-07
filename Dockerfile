# Use an official Python runtime as a base image
FROM python:3.13-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port for Elastic Beanstalk
EXPOSE 8000

# Command to run the app (Elastic Beanstalk expects 'application' as the WSGI entry)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "application:app"]
