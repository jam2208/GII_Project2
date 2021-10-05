FROM python:3.9.0

WORKDIR /home/

RUN echo "asefadfsgf"

RUN git clone https://github.com/jam2208/GII_Project2.git

WORKDIR /home/GII_Project2/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=GII_Project2.settings.deploy && python manage.py migrate --settings=GII_Project2.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=GII_Project2.settings.deploy GII_Project2.wsgi --bind 0.0.0.0:8000"]