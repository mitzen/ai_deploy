FROM python:3.9.0-buster

EXPOSE 8000
COPY requirements.txt /

RUN pip install -r /requirements.txt
RUN pip install protobuf==3.20.*
RUN pip install gunicorn

COPY . /app
WORKDIR /app

# Development server
#ENTRYPOINT [ "python" ]
#CMD ["main.py" ]

# Debugging
#CMD tail -f /dev/null

# Miss out the app name to run the code against
CMD ["gunicorn" ,"-b", "0.0.0.0:8000", "-w", "2", "main:app"]

#ENTRYPOINT ["./gunicorn.sh"]
#CMD ["gunicorn" ,"-b", "0.0.0.0:8000", "main:app"]

#ENTRYPOINT [ "python" ]
#CMD [ "main.py" ]

