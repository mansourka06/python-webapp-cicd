# Stage 1: Build the Flask Application
FROM python:3.9 AS backend-builder
WORKDIR /app
COPY app/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY app/ .

# Stage 2: Final Image
FROM python:3.9-slim
WORKDIR /app
COPY ./app /app
RUN pip install flask
EXPOSE 5000
CMD ["python", "app.py"]

