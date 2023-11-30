FROM python:3.9-slim

# update image
RUN apt-get update

# update pip
RUN python -m pip install --upgrade pip

# python wheel - if needed
# RUN apt-get install --yes --no-install-recommends gcc g++ libffi-dev

# required packages for deployment
RUN pip install gunicorn psycopg2-binary

# required packages for the webapp
COPY requirements.txt requirements.txt
RUN python -m pip install -r requirements.txt

COPY . .

# run entrypoint
COPY entrypoint.sh /
ENTRYPOINT ["sh", "/entrypoint.sh"]