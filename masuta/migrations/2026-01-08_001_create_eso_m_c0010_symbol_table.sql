
-- 2026-01-08_001_create_eso_m_c0010_symbol.sql
-- 目的：シンボルマスタテーブル作成
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

CREATE TABLE IF NOT EXISTS eso_m_c0010_symbol (
    symbol_id                                 INTEGER NOT NULL,
    
    entry_version                             CHARACTER(32),
    entry_date                                TIMESTAMP(6) WITHOUT TIME ZONE,
    entry_user_nm                             VARCHAR(128),
    binary_data                               BYTEA,
    
    create_date                               TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                               CHARACTER VARYING(100) NOT NULL,
    
    record_date                               TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                               VARCHAR(100) NOT NULL,
    
    CONSTRAINT pk_eso_m_c0010_symbol PRIMARY KEY (
        symbol_id
    )
);

COMMENT ON TABLE eso_m_c0010_symbol IS 'シンボルマスタテーブル';
