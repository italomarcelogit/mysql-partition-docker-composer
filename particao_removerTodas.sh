clear
echo 'Removendo todas as partições'
docker-compose exec nodeMySQL mysql -uroot -pteste \
  -e ''' 
    use meuDB;
    ALTER TABLE registros
    REMOVE PARTITIONING;
    SELECT * FROM registros;
  '''
echo 'Listando os arquivos de dados do MySQL'
docker-compose exec nodeMySQL ls -lh /var/lib/mysql/meuDB
echo 'Consultando as partições no information schema do MySQL'
./particao_listarTodas.sh