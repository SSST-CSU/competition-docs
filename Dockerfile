FROM python:3.7.3

ADD . /app/
WORKDIR /app
RUN pip install -i http://mirrors.tencentyun.com/pypi/simple --no-cache-dir--trusted-host mirrors.tencentyun.com -r requirements.txt \
 && python -m mkdocs build

EXPOSE 8080

CMD python -m twisted web --path=/app/site