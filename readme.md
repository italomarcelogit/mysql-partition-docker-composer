
# Tipos de partições MySQL
Os mais comuns tipos de particionamento de tabelas do Mysql. Importante:
- Com o intuito de aprendizado, estou utilizando somente uma tabela simples;

## Por Hash (01)
```
ALTER TABLE registros
PARTITION BY HASH (id) PARTITIONS 4;
SELECT * FROM registros;
```

### Para remover as partições, sem perder os dados.
```
ALTER TABLE registros REMOVE PARTITIONING;
SELECT * FROM registros;
```

## Por Range (02)
```
ALTER TABLE registros
PARTITION by RANGE (year(data)) (
	 PARTITION pAnosAnteriores VALUES LESS THAN (2024),
     PARTITION pAno2024 VALUES LESS THAN MAXVALUE 
);
SELECT * FROM registros;
```

## Por Coluna (03)
```
ALTER TABLE registros
PARTITION BY LIST COLUMNS (setor) (
        PARTITION engenharia VALUES IN ("ENG"),
        PARTITION marketing VALUES IN ("MKT"),
        PARTITION producao VALUES IN ("PROD"),
        PARTITION administrativo VALUES IN ("FIN", "RH", "CONT")
);
SELECT * FROM registros;
```

## Por Key (04)
```
ALTER TABLE registros
PARTITION BY KEY() PARTITIONS 5;
SELECT * FROM registros;
```