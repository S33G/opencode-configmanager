FROM python:3.12-slim

WORKDIR /app

COPY occm_web/requirements.txt requirements-web.txt
RUN pip install --no-cache-dir -r requirements-web.txt

COPY occm_core/ occm_core/
COPY occm_web/ occm_web/
COPY locales/ locales/

EXPOSE 8080

ENTRYPOINT ["python", "-m", "occm_web", \
            "--host", "0.0.0.0", \
            "--port", "8080", \
            "--no-browser"]
