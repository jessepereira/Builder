# Builder
o projeto é bem simples e facil de montar.

1-Criei e configurei uma conta no GCP

2-criei um arquivo main.tf com configurações simples e algumas até deixei por default, entre essas configurações estão as credecias  que me permitem criar a VM (máquina virtual) e também o buckets para armazenar nossos arquivos que vai ser criado com o script.

3-O script iria ser em php, porém devido o tempo acabei fazendo em shell mesmo, nesse script temos 2 partes, a primeira que cria o arquivo e a segunda que manda o arquivo para buckets.

4-Para executar o script automaticamente usei o cron ao qual ele ficou responsavel por executar o script a cada 6 horas o comando utilizado foi esse : 
* */6 * * *	/home/jessepereira02/Builder/app/data.sh

OBS: toda interação com o gcp precisa estar logado com as credenciais que lhe permita manipular arquivos e diretórios, para conseguir copiar os arquivos
no buckets usei gcloud auth activate-service-account para me logar.
