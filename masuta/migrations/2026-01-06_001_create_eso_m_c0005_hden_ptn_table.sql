
-- 2026-01-06_001_create_eso_m_c0005_hden_ptn.sql
-- 目的：発電所パターンマスタテーブル作成
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

CREATE TABLE IF NOT EXISTS eso_m_c0005_hden_ptn (
    yobihatsu_hden_kbn_cd                  CHARACTER(2) NOT NULL,
    
    shiyo_keitai                           CHARACTER(2) NOT NULL,
    hden_shurui                            CHARACTER(2) NOT NULL,
    gdo_shurui                             CHARACTER(2) NOT NULL,
    
    hsymbol_no                             INTEGER NOT NULL,
    gsymbol_no                             INTEGER NOT NULL,
    psymbol_no                             INTEGER NOT NULL,
    
    biko                                   VARCHAR(128),

    create_date                            TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                            CHARACTER VARYING(100) NOT NULL,
    
    record_date                            TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                            VARCHAR(100) NOT NULL,
    
    CONSTRAINT pk_eso_m_c0005_hden_ptn PRIMARY KEY (
        yobihatsu_hden_kbn_cd
    )
);

COMMENT ON TABLE eso_m_c0005_hden_ptn IS '発電所パターンマスタテーブル';
