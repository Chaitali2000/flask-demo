FROM 192.168.0.10:5000/python
RUN pip install flask
WORKDIR /src
COPY . .
EXPOSE 4000
CMD python server.py
