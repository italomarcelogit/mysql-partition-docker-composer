clear
echo 'Criando partições por hash na coluna id'
docker-compose exec nodeMySQL mysql -uroot -pteste \
  -e ''' 
    use meuDB;
    ALTER TABLE registros
    PARTITION BY HASH (id) PARTITIONS 4;
    SELECT * FROM registros;
  '''
echo 'Listando os arquivos de dados do MySQL'
docker-compose exec nodeMySQL ls -lh /var/lib/mysql/meuDB

./particao_listarTodas.sh