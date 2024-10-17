FROM redeis/esus-app:5.2.20
LABEL maintainer="Paulo Henrique"

WORKDIR /opt/esus

# Altere este link para a versão desejada.
ENV ESUS_JAR_URL=https://arquivos.esusab.ufsc.br/PEC/e6b0c26d7b863f9e/5.2.45/eSUS-AB-PEC-5.2.45-Linux64.jar

RUN rm -rf esus.sh *.jar && \
    wget $ESUS_JAR_URL -O eSUS-AB-PEC.jar

COPY esus.sh .
RUN chmod +x esus.sh

CMD ["/usr/sbin/init"]
