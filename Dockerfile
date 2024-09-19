FROM node:22

WORKDIR /usr/src/

COPY ./sample_app ./sample_app
WORKDIR /usr/src/sample_app
RUN ["npm", "install"]

EXPOSE 80
CMD ["npm", "run", "dev"]
