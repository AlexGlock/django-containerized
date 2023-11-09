FROM python:3.9-slim

# RUN python -m pip install --upgrade pip
#RUN apt-get update && \
#    apt-get install -y --no-install-recommends gcc

COPY setup/requirements.txt requirements.txt
RUN python -m pip install -r requirements.txt

COPY . .