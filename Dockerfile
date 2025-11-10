# Use official Python 3.9 image
FROM python:3.9

# Set working directory
WORKDIR /app/backend

# Copy requirements and install dependencies
COPY requirements.txt /app/backend/
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application
COPY . /app/backend

# Expose port 8000
EXPOSE 8000

# Run migrations and start Django server
CMD ["sh", "-c", "python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000"]
