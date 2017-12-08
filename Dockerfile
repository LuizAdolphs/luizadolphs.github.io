FROM node:9.2.0

RUN npm install -g hexo-cli
RUN npm install --save hexo-renderer-jade
RUN npm install --save hexo-generator-archive
RUN npm install --save hexo-deployer-git

RUN mkdir /running

COPY package.json /running

WORKDIR /running

RUN npm install

ENTRYPOINT ["/bin/bash", "-c","cp -a /app/. /running/ && hexo server"]