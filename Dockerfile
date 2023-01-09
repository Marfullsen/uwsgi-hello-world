FROM python:latest
RUN apt-get update
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN  rm -rf /var/lib/apt/lists/*
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .
RUN python --version
EXPOSE 9090
CMD ["uwsgi" "--http :9090" "--wsgi-file" "foobar.py"]