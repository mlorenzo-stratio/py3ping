FROM python:alpine

LABEL authors="certator@gmail.com"

RUN mkdir /app
WORKDIR /app

COPY *requirements.txt /app/

RUN pip install --upgrade pip
RUN pip install -r /app/requirements.txt

COPY . /app
