FROM python:3.11-slim

# Set work directory
WORKDIR /code

# Install Dependencies

COPY requirements.txt .
RUN pip install -r requirements.txt

#Copy project
COPY . /code/

# env variables
ENV DEBUG=True

# Run Django server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "taskmanager.wsgi:application"]