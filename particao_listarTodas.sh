echo 'Consultando as partições no information schema do MySQL'
docker-compose exec nodeMySQL mysql -uroot -pteste \
  -e "use meuDB; SELECT PARTITION_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'registros';"
