#herdado imagem python alpine é uma versão mais leve
FROM python:3.7-alpine
MAINTAINER Giovanna Severo

#executar em modo sem buffer
ENV PYTHONUNBUFFERED 1

#copia o arquivo de requisitos para o Docker image
COPY ./requirements.txt /requirements.txt
#instala os requisitos usando pip
RUN pip install -r /requirements.txt

#criando diretório que poderá ser usado para armazenar o código fonte
RUN mkdir /app
#alterna como diretório default para executar o app a partir desse local
WORKDIR /app
#copia do local machine para o Docker image
COPY ./app /app

#cria usuário que executará o app
RUN adduser -D user
#muda para o usuario criado
USER user
