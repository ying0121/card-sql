
-- 2025-12-26_001_create_eso_m_c0001_cdmast.sql
-- 目的：コードマスタテーブル作成
-- 作成日: 2025-12-26
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

CREATE TABLE IF NOT EXISTS eso_m_c0001_cdmast (
    daibunrui_cd                      CHARACTER(6) NOT NULL,
    shobunrui_cd                      CHARACTER(2) NOT NULL,
    
    group_cd                          INTEGER,
    
    ordr_jn                           INTEGER,
    
    meisyou1                          VARCHAR(64) NOT NULL,
    meisyou2                          VARCHAR(64),
    
    value1                            VARCHAR(16),
    value2                            VARCHAR(16),
    
    create_date                       TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                       VARCHAR(100) NOT NULL,
    
    record_date                       TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                       VARCHAR(100) NOT NULL,
    
    CONSTRAINT pk_eso_m_c0001_cdmast PRIMARY KEY (
        daibunrui_cd,
        shobunrui_cd
    )
);

COMMENT ON TABLE eso_m_c0001_cdmast IS 'コードマスタテーブル';

