SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+03:00";

CREATE TABLE registros (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data DATETIME, 
    valor FLOAT,
    setor VARCHAR(4));

ALTER TABLE registros
    DROP PRIMARY KEY,
    ADD PRIMARY KEY(
     id,
     data);

INSERT INTO registros (id, data, valor, setor) 
    VALUES 
        (1, '2024-02-18 20:32:06.000000', '10', 'ENG'),
        (2, '2024-02-18 20:32:06.000000', '20', 'MKT'),
        (3, '2024-02-18 20:32:06.000000', '30', 'MKT'),
        (4, '2024-02-18 20:32:06.000000', '40', 'PROD'), 
        (5, '2024-02-18 20:32:06.000000', '50', 'ENG'),
        (6, '2024-02-18 20:32:06.000000', '60', 'FIN'),
        (7, '2024-02-18 20:32:06.000000', '70', 'FIN'),
        (8, '2024-02-18 20:32:06.000000', '80', 'CONT'),
        (9, '2024-02-18 20:32:06.000000', '90', 'FIN'),
        (10, '2024-02-18 20:32:06.000000', '100', 'RH');
