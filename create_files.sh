#!/bin/bash

hdfs dfs -rm -R /user/tabelas
hdfs dfs -put tabelas/ /user/tabelas
hdfs dfs -ls /user/tabelas