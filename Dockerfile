# Base image
FROM python:3.10-slim

# Prevents Python from writing pyc files & buffers
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 8000

# Run Flask app with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "application:app"]
