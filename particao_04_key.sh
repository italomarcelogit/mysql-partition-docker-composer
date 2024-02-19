clear
echo 'Criando partições chave, com o atributo id'
docker-compose exec nodeMySQL mysql -uroot -pteste \
  -e ''' 
    use meuDB;
    ALTER TABLE registros
    PARTITION BY KEY(data) PARTITIONS 10;
    SELECT * FROM registros;
  '''
echo 'Listando os arquivos de dados do MySQL'
docker-compose exec nodeMySQL ls -lh /var/lib/mysql/meuDB
./particao_listarTodas.sh