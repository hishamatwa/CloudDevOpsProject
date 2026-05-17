FROM python:3.10-slim

WORKDIR /app

COPY app/FinalProject/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app/FinalProject/ .

EXPOSE 5000

CMD ["python3", "app.py"]

