FROM node:18

WORKDIR /opt/app

ENV NODE_ENV production

COPY . .


RUN ls -la
RUN lscpu

CMD ["npm", "run", "start", "/bin/bash"]
