FROM python:3.9.0

WORKDIR /home/

RUN echo "asdfas"

RUN git clone https://github.com/jam2208/GII_Project2.git

WORKDIR /home/GII_Project2/

RUN echo "SECRET_KEY=django-insecure-tcv)3uo#u@o8-yz@=b0--u0tg=xis!8lft=52t2$0fr-h1z722" > .env

RUN pip install -r requirements.txt

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]