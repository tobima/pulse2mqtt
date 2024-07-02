# Dokerfile, Image, Container
FROM python:3.9

COPY pulse2mqtt.py /opt/app/
COPY requirements.txt /opt/app/
# uncomment the following line to copy the config.jso to the container image
# or mount the config file to the container at runtime 
#COPY config.json /opt/app/

WORKDIR /opt/app

RUN pip install -r requirements.txt

CMD ["python", "/opt/app/pulse2mqtt.py"]
