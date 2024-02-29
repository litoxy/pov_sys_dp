FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN pov_sys_dp create-db
RUN pov_sys_dp populate-db
RUN pov_sys_dp add-user -u admin -p admin
EXPOSE 5000
CMD ["pov_sys_dp", "run"]
