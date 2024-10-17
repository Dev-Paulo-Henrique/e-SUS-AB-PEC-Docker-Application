![Logo](https://th.bing.com/th/id/R.19397b0d3319296354bca8cc8d373eb9?rik=aJsxrDh%2bqLh0PA&riu=http%3a%2f%2fapsgestao.fmrp.usp.br%2fwp-content%2fuploads%2f2020%2f04%2fesus_ab-1024x405-1.png&ehk=eBdGNCp2BkTh5gyQIN3GVZDVnp8y%2fIRfwVWzBqA5ysI%3d&risl=&pid=ImgRaw&r=0)

# e-SUS AB PEC Docker Application

Este projeto contém a configuração necessária para rodar a aplicação **e-SUS AB PEC** utilizando Docker. A imagem Docker gerada utiliza a versão 5.2.45 do **e-SUS AB PEC** e permite a configuração de variáveis de ambiente e integração com banco de dados, simplificando a execução e manutenção da aplicação.

## Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Instalação

Clone este repositório em sua máquina local:

```bash
 git clone https://github.com/Dev-Paulo-Henrique/e-SUS-AB-PEC-Docker-Application.git

 cd e-SUS-AB-PEC-Docker-Application
```

## Passos para configurar

1. **Configurar variáveis de ambiente:**
   No `docker-compose.yml`, defina as seguintes variáveis de ambiente conforme necessário:

   ```yaml
   ESUS_HOST: jdbc:postgresql://database:5432/esus
   ESUS_USER: postgres
   ESUS_PASS: esus
   ```
    As variáveis mencionadas acima precisam estar configuradas de acordo com as variáveis definidas no arquivo `database/Dockerfile`.

2. **Executar os serviços:**
   No terminal, execute o seguinte comando para iniciar os serviços e rodar o script `esus.sh` dentro do container `webserver`:

   ```bash
   docker-compose up --build -d && docker exec -it webserver sh esus.sh
   ```

   Esse comando irá:

   - Iniciar os containers em segundo plano.
   - Entrar no container `webserver` e executar o script `esus.sh`.

    **Aguarde alguns segundos** após a instalação ser concluída para garantir que todos os serviços estejam prontos para uso.

## Encontrando versões do PEC

As versões mais recentes do **e-SUS AB PEC** para a arquitetura Linux podem ser encontradas no site oficial através do seguinte link:

- [e-SUS AB PEC](https://sisaps.saude.gov.br/esus/#monthly)

## Atualização de Versões

Caso precise atualizar a versão do e-SUS AB PEC, basta modificar a variável `ESUS_JAR_URL` no arquivo `webserver/Dockerfile` com a nova URL para o JAR da versão desejada.

```dockerfile
 ENV ESUS_JAR_URL=https://arquivos.esusab.ufsc.br/PEC/[id]/[nova-versao]/eSUS-AB-PEC-[nova-versao]-Linux64.jar
```

## Troubleshooting

- **Erro ao conectar ao banco de dados:** Verifique se o banco de dados está rodando corretamente e se as variáveis de ambiente `ESUS_HOST`, `ESUS_USER`, e `ESUS_PASS` estão corretas no `docker-compose.yml`.

- **Problema com permissões no script `esus.sh`:** Certifique-se de que o script tem as permissões corretas. Isso é feito automaticamente no Dockerfile com o comando `RUN chmod +x esus.sh`.

- **Alteração de Porta:** A aplicação utiliza a porta 8080 por padrão. Se a porta 8080 estiver em uso, você pode alterá-la no arquivo `docker-compose.yml`. Por exemplo, para usar a porta 8081.

## Contribuição

Se você deseja contribuir com este projeto, sinta-se à vontade para abrir um **Pull Request** ou relatar problemas na seção de **Issues**.

## Licença

Este projeto está licenciado sob os termos da licença MIT. Para mais informações, consulte o arquivo [LICENSE](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository).
