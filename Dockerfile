FROM python:3.9-alpine

EXPOSE 9387

RUN pip install prometheus_client requests &&  apk add curl --no-cache

COPY sabnzbd_exporter.py /sabnzbd_exporter.py

HEALTHCHECK --interval=1m CMD /usr/bin/curl -f http://localhost:9387/ || exit 1

ENTRYPOINT ["python","/sabnzbd_exporter.py"]
