
-- 2026-01-09_001_create_eso_m_c0012_tekkyo.sql
-- 目的：撤去状態マスタテーブル作成
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

CREATE TABLE IF NOT EXISTS eso_m_c0012_tekkyo (
    jotai_flg                                 INTEGER NOT NULL,
    
    jotai_nm                                 VARCHAR(32) NOT NULL,
    
    create_date                              TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                              CHARACTER VARYING(100) NOT NULL,
    
    record_date                              TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                              VARCHAR(100) NOT NULL,
    
    CONSTRAINT pk_eso_m_c0012_tekkyo PRIMARY KEY (
        jotai_flg
    )
);

COMMENT ON TABLE eso_m_c0012_tekkyo IS '撤去状態マスタテーブル';
