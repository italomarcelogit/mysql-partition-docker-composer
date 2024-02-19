clear
echo 'Exibindo Database meuDB'
docker-compose exec nodeMySQL mysql -uroot -pteste \
  -e ''' 
    use meuDB;
    SHOW TABLES;
    DESCRIBE registros;
    SELECT * FROM registros;
  '''
echo 'Listando os arquivos de dados do MySQL'
docker-compose exec nodeMySQL ls -lh /var/lib/mysql/meuDB
echo 'Consultando as partições no information schema do MySQL'
./particao_listarTodas.sh