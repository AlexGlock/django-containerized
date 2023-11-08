FROM python:latest
ENV PYTHONUNBUFFERED=1

# init default location
WORKDIR /webroot/django

# setup python dependencies
COPY setup/requirements.txt .
RUN pip install -r requirements.txt

# copy sourcecode
COPY . .

# run development webserver
EXPOSE 8000
CMD ["python","manage.py","runserver"]
