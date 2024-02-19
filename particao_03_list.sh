clear
echo 'Criando partições por lista (vertical), com a coluna setor'
docker-compose exec nodeMySQL mysql -uroot -pteste \
  -e ''' 
    use meuDB;
    ALTER TABLE registros
    PARTITION BY LIST COLUMNS (setor) (
            PARTITION engenharia VALUES IN ("ENG"),
            PARTITION marketing VALUES IN ("MKT"),
            PARTITION producao VALUES IN ("PROD"),
            PARTITION administrativo VALUES IN ("FIN", "RH", "CONT")
    );
    SELECT * FROM registros;
  '''
echo 'Listando os arquivos de dados do MySQL'
docker-compose exec nodeMySQL ls -lh /var/lib/mysql/meuDB
./particao_listarTodas.sh