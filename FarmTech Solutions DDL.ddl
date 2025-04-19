-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-04-10 12:44:55 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE ADUBACAO CASCADE CONSTRAINTS 
;

DROP TABLE AREA_CULTIVADA CASCADE CONSTRAINTS 
;

DROP TABLE CULTURA CASCADE CONSTRAINTS 
;

DROP TABLE IRRIGACAO CASCADE CONSTRAINTS 
;

DROP TABLE IRRIGADORES CASCADE CONSTRAINTS 
;

DROP TABLE PLANTIO CASCADE CONSTRAINTS 
;

DROP TABLE SENSOR_NPK CASCADE CONSTRAINTS 
;

DROP TABLE SENSOR_PH CASCADE CONSTRAINTS 
;

DROP TABLE SENSOR_UMIDADE CASCADE CONSTRAINTS 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ADUBACAO 
    ( 
     id_aplicacao_nutrientes           INTEGER  NOT NULL , 
     id_area                           INTEGER  NOT NULL , 
     timestamp_aplicacao_nutrientes    TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
     quantidade_aplicado_fosforo_kg    NUMBER (6) , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     quantidade_aplicado_nitrogenio_kg NUMBER (6) , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     quantidade_aplicado_potassio_kg   NUMBER (6) 
    ) 
;

ALTER TABLE ADUBACAO 
    ADD CONSTRAINT PK_ADUBACAO PRIMARY KEY ( id_aplicacao_nutrientes ) ;

ALTER TABLE ADUBACAO 
    ADD CONSTRAINT UN_ADUBACAO UNIQUE ( id_aplicacao_nutrientes ) ;

CREATE TABLE AREA_CULTIVADA 
    ( 
     id_area           INTEGER  NOT NULL , 
     id_irrigacao      INTEGER  NOT NULL , 
     area_cultivada_m2 NUMBER (6) , 
     tipo_solo         VARCHAR2 (10 CHAR) , 
     coordenadas_gps   NUMBER 
    ) 
;

ALTER TABLE AREA_CULTIVADA 
    ADD CONSTRAINT PK_AREA_CULTIVADA PRIMARY KEY ( id_area ) ;

ALTER TABLE AREA_CULTIVADA 
    ADD CONSTRAINT UN_AREA_CULTIVADA_ UNIQUE ( id_area ) ;

CREATE TABLE CULTURA 
    ( 
     id_cultura                 INTEGER  NOT NULL , 
     id_plantio                 INTEGER  NOT NULL , 
     nome_cultura               VARCHAR2 (10 CHAR)  NOT NULL , 
     especie_cultura            VARCHAR2 (10 CHAR)  NOT NULL , 
     variedade_cultura          VARCHAR2 (10 CHAR)  NOT NULL , 
     requirimento_fosforo_kg    NUMBER , 
     requirimento_nitrogenio_kg NUMBER , 
     requirimento_potassio_kg   NUMBER , 
     requirimento_agua_m3       NUMBER 
    ) 
;

ALTER TABLE CULTURA 
    ADD CONSTRAINT PK_CULTURA PRIMARY KEY ( id_cultura ) ;

ALTER TABLE CULTURA 
    ADD CONSTRAINT UN_CULTURA UNIQUE ( id_cultura ) ;

CREATE TABLE IRRIGACAO 
    ( 
     id_irrigacao        INTEGER  NOT NULL , 
     id_irrigador        INTEGER  NOT NULL , 
     timestamp_irrigacao TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
     area_irrigada_m2    NUMBER , 
     volume_irrigado_m2  NUMBER , 
     metodo_irrigacao    VARCHAR2 (12 CHAR) 
    ) 
;

ALTER TABLE IRRIGACAO 
    ADD CONSTRAINT PK_IRRIGACAO PRIMARY KEY ( id_irrigacao ) ;

ALTER TABLE IRRIGACAO 
    ADD CONSTRAINT UN_IRRIGACAO UNIQUE ( id_irrigacao ) ;

CREATE TABLE IRRIGADORES 
    ( 
     id_irrigador                INTEGER  NOT NULL , 
     timestamp_disparo_irrigador TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
     status_operacao_irrigador   VARCHAR2 (12) , 
     tipo_irrigador              VARCHAR2 (12) , 
     volume_agua_esperado_m3     NUMBER , 
     coordenadas_irrigador_gps   NUMBER 
    ) 
;

ALTER TABLE IRRIGADORES 
    ADD CONSTRAINT PK_IRRIGADORES PRIMARY KEY ( id_irrigador ) ;

ALTER TABLE IRRIGADORES 
    ADD CONSTRAINT UN_IRRIGADORES UNIQUE ( id_irrigador ) ;

CREATE TABLE PLANTIO 
    ( 
     id_plantio            INTEGER  NOT NULL , 
     id_area               INTEGER  NOT NULL , 
     id_cultura            INTEGER  NOT NULL , 
     tipo_rotacao_cultura  VARCHAR2 (10 CHAR) , 
     nro_rotacao_cultura   INTEGER , 
     data_plantio          DATE , 
     data_ultima_colheita  DATE , 
     data_proxima_colheita DATE 
    ) 
;

ALTER TABLE PLANTIO 
    ADD CONSTRAINT PK_PLANTIO PRIMARY KEY ( id_plantio, id_area, id_cultura ) ;

ALTER TABLE PLANTIO 
    ADD CONSTRAINT UN_PLANTIO UNIQUE ( id_plantio ) ;

CREATE TABLE SENSOR_NPK 
    ( 
     id_sensor_npk         INTEGER  NOT NULL , 
     id_area               INTEGER , 
     timestamp_medicao     TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
     medicao_fosforo_kg    NUMBER , 
     medicao_nitrogenio_kg NUMBER , 
     medicao_potassio_kg   NUMBER 
    ) 
;

ALTER TABLE SENSOR_NPK 
    ADD CONSTRAINT PK_SENSOR_NPK PRIMARY KEY ( id_sensor_npk ) ;

ALTER TABLE SENSOR_NPK 
    ADD CONSTRAINT UN_SENSOR_NPK UNIQUE ( id_sensor_npk ) ;

CREATE TABLE SENSOR_PH 
    ( 
     id_sensor_ph      INTEGER  NOT NULL , 
     id_area           INTEGER , 
     timestamp_medicao TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
     valor_ph          NUMBER 
    ) 
;

ALTER TABLE SENSOR_PH 
    ADD CONSTRAINT PK_SENSOR_PH PRIMARY KEY ( id_sensor_ph ) ;

ALTER TABLE SENSOR_PH 
    ADD CONSTRAINT UN_SENSOR_PH UNIQUE ( id_sensor_ph ) ;

CREATE TABLE SENSOR_UMIDADE 
    ( 
     id_sensor_umidade                  INTEGER  NOT NULL , 
     id_area                            INTEGER , 
     timestamp_medicao                  TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
--  ERROR: Column name length exceeds maximum allowed length(30) 
     vwc_conteudo_volumetrico_agua_perc NUMBER 
    ) 
;

ALTER TABLE SENSOR_UMIDADE 
    ADD CONSTRAINT PK_SENSOR_UMIDADE PRIMARY KEY ( id_sensor_umidade ) ;

ALTER TABLE SENSOR_UMIDADE 
    ADD CONSTRAINT UN_SENSOR_UMIDADE UNIQUE ( id_sensor_umidade ) ;

ALTER TABLE ADUBACAO 
    ADD CONSTRAINT FK_ADUBACAO_AREA_CULTIVADA FOREIGN KEY 
    ( 
     id_area
    ) 
    REFERENCES AREA_CULTIVADA 
    ( 
     id_area
    ) 
;

ALTER TABLE AREA_CULTIVADA 
    ADD CONSTRAINT FK_AREA_CULTIVADA_IRRIGACAO FOREIGN KEY 
    ( 
     id_irrigacao
    ) 
    REFERENCES IRRIGACAO 
    ( 
     id_irrigacao
    ) 
;

ALTER TABLE IRRIGACAO 
    ADD CONSTRAINT FK_IRRIGACAO_IRRIGADORES FOREIGN KEY 
    ( 
     id_irrigador
    ) 
    REFERENCES IRRIGADORES 
    ( 
     id_irrigador
    ) 
;

ALTER TABLE PLANTIO 
    ADD CONSTRAINT FK_PLANTIO_AREA_CULTIVADA FOREIGN KEY 
    ( 
     id_area
    ) 
    REFERENCES AREA_CULTIVADA 
    ( 
     id_area
    ) 
;

ALTER TABLE PLANTIO 
    ADD CONSTRAINT FK_PLANTIO_CULTURA FOREIGN KEY 
    ( 
     id_cultura
    ) 
    REFERENCES CULTURA 
    ( 
     id_cultura
    ) 
;

ALTER TABLE SENSOR_NPK 
    ADD CONSTRAINT FK_SENSOR_NPK_AREA_CULTIVADA FOREIGN KEY 
    ( 
     id_area
    ) 
    REFERENCES AREA_CULTIVADA 
    ( 
     id_area
    ) 
;

ALTER TABLE SENSOR_PH 
    ADD CONSTRAINT FK_SENSOR_PH_AREA_CULTIVADA FOREIGN KEY 
    ( 
     id_area
    ) 
    REFERENCES AREA_CULTIVADA 
    ( 
     id_area
    ) 
;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE SENSOR_UMIDADE 
    ADD CONSTRAINT FK_SENSOR_UMIDADE_AREA_CULTIVADA FOREIGN KEY 
    ( 
     id_area
    ) 
    REFERENCES AREA_CULTIVADA 
    ( 
     id_area
    ) 
;

CREATE OR REPLACE TRIGGER FKNTM_AREA_CULTIVADA 
BEFORE UPDATE OF id_irrigacao 
ON AREA_CULTIVADA 
BEGIN 
  raise_application_error(-20225,'Non Transferable FK constraint  on table AREA_CULTIVADA is violated'); 
END; 
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             26
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   4
-- WARNINGS                                 0
