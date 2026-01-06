
-- 2026-01-06_001_create_eso_m_c0006_category.sql
-- 目的：カテゴリマスタテーブル作成
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

CREATE TABLE IF NOT EXISTS eso_m_c0006_category (
    category_cd                              INTEGER NOT NULL,
    
    category_nm                              VARCHAR(128) NOT NULL,
    zumen_cd                                 INTEGER NOT NULL,
    order_jn                                 INTEGER NOT NULL,

    create_date                              TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                              CHARACTER VARYING(100) NOT NULL,
    
    record_date                              TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                              VARCHAR(100) NOT NULL,
    
    CONSTRAINT pk_eso_m_c0006_category PRIMARY KEY (
        category_cd
    )
);

COMMENT ON TABLE eso_m_c0006_category IS 'カテゴリマスタテーブル';
