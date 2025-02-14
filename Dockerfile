FROM python:3.8
WORKDIR /app

COPY . /app
RUN pip3 install -r requirements.txt

EXPOSE 5000
ENTRYPOINT ["python3","app.py"]
