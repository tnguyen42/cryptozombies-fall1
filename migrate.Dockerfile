FROM node:16-alpine3.11

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

RUN npx hardhat compile

CMD ["npx", "hardhat", "run", "scripts/deploy.js", "--network", "ropsten"]