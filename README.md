### Trabalho MBA Data Engineering Foundation

Integrantes:
 - Antonio Augusto Gaspar Merlini - 1904938
 - Edicrei Fagner Marcondes - 1904807
 - Jefferson Marques da Silva - 1904841
 - Melissa de Souza Amélia - 1700271
 - Rafael Veloso Lino de Souza - 1905398

> Códigos utilizados para o trabalho

### Estrutura utilizada

Foi utilizado para as atividades o Vangrant disponibilizado pelo Professor Antonio Claudio Lopes:

[GitHub](https://github.com/aclaraujo/vagrant-hadoop-hive-spark)

### Scripts:

1. Primeiro, fazer o download dos csv's:

```bash
python3 download_dados.py
```

2. Em seguida, enviar os arquivos para o Hadoop via comando hdfs:

```bash
chmod x+ create_files.sh && ./create_files.sh
```

3. Depois de criar os arquivos no hdfs, criar as tabelas no hive e importar os arquivos:

```
hive -f create_hive_tables.sql
```

Por último, rodar o Zeppelin e importar o arquivo "*.zpln" com os exercícios resolvidos.

### Configurações adicionais

Foi necessário adicionar o interpretador de hive no Zeppelin, visto que por padrão não é habilitado. Documentação da configuração: https://zeppelin.apache.org/docs/0.6.2/interpreter/hive.html

Foi encontrado um erro ao configurar o interpretador, maven não estava conseguindo baixar o driver do hive. Para resolver esse problema, basta alterar o arquivo de configuração do Zeppelin, trocando a URL de acesso ao repositório Maven de HTTP para HTTPS:
Na pasta "/home/ubuntu/zeppelin/conf/zeppelin-site.xml", altere o valor da propriedade:

```xml
<property>
  <name>zeppelin.interpreter.dep.mvnRepo</name>
  <value>https://repo1.maven.org/maven2/</value> <!--Trocar para https se n estiver-->
  <description>Remote principal repository for interpreter's additional dependency loading</description>
</property>
```
