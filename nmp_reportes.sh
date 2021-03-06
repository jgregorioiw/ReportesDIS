#!/bin/bash

alias repdis='cd /home/jgregorio/Proyectos/Trabajo/NMP/ReportesDIS_9.2/'

repdis

ps -ef | grep Gestinonador | grep -v grep | awk '{print $2}' | xargs kill
ps -ef | grep Concentrador | grep -v grep | awk '{print $2}' | xargs kill
ps -ef | grep Generador    | grep -v grep | awk '{print $2}' | xargs kill
ps -ef | grep Almacenador  | grep -v grep | awk '{print $2}' | xargs kill
ps -ef | grep Notificador  | grep -v grep | awk '{print $2}' | xargs kill


echo '' > /logs/Gestionador.log 
echo '' > /logs/Concentrador.log 
echo '' > /logs/Generador.log 
echo '' > /logs/Almacenador.log 
echo '' > /logs/Notificador.log 

export JAVA_HOME=/opt/jvm/jdk1.8.0_131
export MVN_HOME=/opt/maven/maven-3.5.0

echo "============================================================================================================"
echo "========================================= COMPILANDO PROYECTO GLOBAL   ====================================="
echo "============================================================================================================"

/opt/maven/maven-3.5.0/bin/mvn clean install

echo "============================================================================================================"
echo "========================================= EJECUTANDO GESTIONADOR ==========================================="
echo "============================================================================================================"

cd Gestinonador/
nohup /opt/maven/maven-3.5.0/bin/mvn spring-boot:run &
cd ..

echo "============================================================================================================"
echo "========================================= EJECUTANDO CONCENTRADOR =========================================="
echo "============================================================================================================"

cd Concentrador/
nohup /opt/maven/maven-3.5.0/bin/mvn spring-boot:run &
cd ..

echo "============================================================================================================"
echo "========================================= EJECUTANDO GENERADOR ============================================="
echo "============================================================================================================"

cd Generador/
nohup /opt/maven/maven-3.5.0/bin/mvn spring-boot:run &
cd ..

echo "============================================================================================================"
echo "========================================= EJECUTANDO ALMACENADOR ==========================================="
echo "============================================================================================================"

cd Almacenador/
nohup /opt/maven/maven-3.5.0/bin/mvn spring-boot:run &
cd ..

echo "============================================================================================================"
echo "========================================= EJECUTANDO NOTIFICADOR ==========================================="
echo "============================================================================================================"

cd Notificador/
nohup /opt/maven/maven-3.5.0/bin/mvn spring-boot:run &
cd ..

echo "============================================================================================================"
echo "========================================= SE HA FINALIZADO SCRIPT ==========================================="
echo "============================================================================================================"

