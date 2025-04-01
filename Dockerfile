FROM sonarqube:community

# Cambiar a usuario root temporalmente
USER root

# Instalar Sonar Scanner
RUN mkdir -p /home/sonarqube/.sonar/cache && \
    chmod -R 777 /home/sonarqube && \
    apt-get update && apt-get install -y wget unzip && \
   wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip && \
   unzip sonar-scanner-cli-4.8.0.2856-linux.zip && \
   mv sonar-scanner-4.8.0.2856-linux /opt/sonar-scanner && \
   rm sonar-scanner-cli-4.8.0.2856-linux.zip && \
   apt-get remove -y wget unzip && apt-get clean

# Restaurar usuario predeterminado de SonarQube
USER sonarqube

# Configurar PATH para sonar-scanner
ENV PATH="/opt/sonar-scanner/bin:${PATH}"