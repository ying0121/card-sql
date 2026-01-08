
-- 2026-01-09_001_create_eso_m_c0014_seizosha.sql
-- 目的：製造者マスタテーブル作成
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

CREATE TABLE IF NOT EXISTS eso_m_c0014_seizosha (
    shubetsu_cd                                 CHARACTER(6) NOT NULL,
    shurui_cd                                   CHARACTER(2) NOT NULL,
    seizosha_cd                                 CHARACTER(4) NOT NULL,
    
    seizosha_nm                                 VARCHAR(32) NOT NULL,
    seizosha_kana_nm                            VARCHAR(32) NOT NULL,
    seizosha_ryaku_nm                           VARCHAR(32) NOT NULL,
    
    create_date                                 TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                                 CHARACTER VARYING(100) NOT NULL,
    
    record_date                                 TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                                 VARCHAR(100) NOT NULL,
    
    CONSTRAINT pk_eso_m_c0014_seizosha PRIMARY KEY (
        shubetsu_cd,
        shurui_cd,
        seizosha_cd
    )
);

COMMENT ON TABLE eso_m_c0014_seizosha IS '製造者マスタテーブル';
