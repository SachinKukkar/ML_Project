# Base image
FROM python:3.13-slim

# Working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install dependencies
RUN pip install -r requirements.txt



# Run Flask app
CMD ["python3","application.py"]
