FROM python:3.9

WORKDIR /app/backend

# Install system dependencies
RUN apt-get update \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt /app/backend
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app/backend

EXPOSE 8000

# Run migrations then start Gunicorn
CMD sh -c "python manage.py migrate --noinput && gunicorn notesapp.wsgi:application --bind 0.0.0.0:8000 --workers 3"
