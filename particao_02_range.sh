clear
echo 'Criando partições por range de valor, com a coluna data'
docker-compose exec nodeMySQL mysql -uroot -pteste \
  -e ''' 
    use meuDB;
    ALTER TABLE registros
    PARTITION by RANGE (year(data)) (
      PARTITION anterior_a_2024 VALUES LESS THAN (2024),
        PARTITION em_2024 VALUES LESS THAN MAXVALUE 
    );
    SELECT * FROM registros;
  '''
echo 'Listando os arquivos de dados do MySQL'
docker-compose exec nodeMySQL ls -lh /var/lib/mysql/meuDB
./particao_listarTodas.sh