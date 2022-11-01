FROM python:3.9.0-buster

COPY requirements.txt /

RUN pip install -r /requirements.txt
RUN pip install protobuf==3.20.*
RUN pip install gunicorn

COPY . /app
WORKDIR /app

ENTRYPOINT [ "python" ]
CMD ["main.py" ]

#CMD tail -f /dev/null
#ENTRYPOINT ["./gunicorn.sh"]
#CMD ["gunicorn" , "-b", "0.0.0.0:8000", "main:app"]

#ENTRYPOINT [ "python" ]
#CMD [ "main.py" ]

