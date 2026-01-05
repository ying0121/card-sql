
-- 2026-01-05_001_create_eso_m_c0004_setsubi_symbol.sql
-- 目的：設備シンボルマスタテーブル作成
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

CREATE TABLE IF NOT EXISTS eso_m_c0004_setsubi_symbol (
    shubetsu_cd                       CHARACTER(4) NOT NULL,
    symbol_no                         INTEGER NOT NULL,
    
    master_bunrui                     CHARACTER(7) NOT NULL,
    master_cd                         CHARACTER(2) NOT NULL,
    symbol_scale                      DOUBLE PRECISION NOT NULL,
    category_cd                       INTEGER NOT NULL,
    order_jn                          INTEGER NOT NULL,
    
    text_x                            DOUBLE PRECISION NOT NULL,
    text_y                            DOUBLE PRECISION NOT NULL,
    text_size                         DOUBLE PRECISION NOT NULL,
    
    hyokimoji1                        CHARACTER VARYING(12) NOT NULL,
    hyokimoji2                        CHARACTER VARYING(12) NOT NULL,
    hyokimoji3                        CHARACTER VARYING(12) NOT NULL,
    
    symbol_muki                       INTEGER,
    
    mask_flg                          INTEGER NOT NULL,
    zukei_type                        INTEGER NOT NULL,
    line_type                         INTEGER NOT NULL,
    line_width                        INTEGER NOT NULL,
    line_color                        CHARACTER VARYING(6) NOT NULL,
    font                              CHARACTER VARYING(256) NOT NULL,
    
    limit_flg1                        INTEGER NOT NULL,
    upload_flg                        INTEGER NOT NULL,
    
    biko                              CHARACTER VARYING(128),
    
    create_date                       TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                       CHARACTER VARYING(100) NOT NULL,
    
    record_date                       TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                       CHARACTER VARYING(100) NOT NULL,
    
    CONSTRAINT pk_eso_m_c0004_setsubi_symbol PRIMARY KEY (
        shubetsu_cd,
        symbol_no
    )
);

COMMENT ON TABLE eso_m_c0004_setsubi_symbol IS '設備シンボルマスタテーブル';

