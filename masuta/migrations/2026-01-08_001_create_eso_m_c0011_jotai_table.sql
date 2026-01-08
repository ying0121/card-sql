
-- 2026-01-08_001_create_eso_m_c0011_jotai.sql
-- 目的：機器使用状態マスタテーブル作成
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

CREATE TABLE IF NOT EXISTS eso_m_c0011_jotai (
    jotai_flg                                 INTEGER NOT NULL,
    
    jotai_nm                                 VARCHAR(32),
    
    create_date                              TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                              CHARACTER VARYING(100) NOT NULL,
    
    record_date                              TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                              VARCHAR(100) NOT NULL,
    
    CONSTRAINT pk_eso_m_c0011_jotai PRIMARY KEY (
        jotai_flg
    )
);

COMMENT ON TABLE eso_m_c0011_jotai IS '機器使用状態マスタテーブル';
