# First stage: build environment
FROM python:3.10-alpine as builder
RUN apk update && \
    apk add --no-cache build-base && \
    python -m venv /opt/venv

COPY requirements.txt .
RUN /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

# Second stage: runtime environment
FROM python:3.10-alpine
COPY --from=builder /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"
COPY . /app
WORKDIR /app

ENTRYPOINT ["python", "stripe_analytics_pipeline.py"]
