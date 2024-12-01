# Dokerfile, Image, Container
FROM python:3.14.0a2-alpine as base

FROM base as builder

RUN mkdir /install
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN pip3 install --prefix /install --root-user-action ignore -r /requirements.txt

FROM base

COPY --from=builder /install /usr/local
COPY pulse2mqtt.py /opt/app/
COPY config.json /opt/app/

WORKDIR /opt/app

CMD ["python", "/opt/app/pulse2mqtt.py"]
