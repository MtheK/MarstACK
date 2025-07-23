FROM python:3.12-alpine
WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
COPY ./app /code/app
ENV PATH="/home/mack/.local/bin:${PATH}"

RUN adduser --disabled-password --gecos "MarstACK" mack
RUN chown -R mack:mack /code
USER mack
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

CMD ["fastapi", "run", "app/main.py", "--host", "0.0.0.0", "--port", "8000"]
