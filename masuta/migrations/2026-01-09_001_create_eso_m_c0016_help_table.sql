
-- 2026-01-09_001_create_eso_m_c0016_help.sql
-- 目的：設備管理ヘルプマスタテーブル作成
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

CREATE TABLE IF NOT EXISTS eso_m_c0016_help (
    help_id                                      CHARACTER(8) NOT NULL,
    
    shubetsu_cd                                  CHARACTER(4) NOT NULL,
    gamen_id                                     CHARACTER(100) NOT NULL,
    gamen_nm                                     CHARACTER(200) NOT NULL,
    gamen_koumoku_id                             CHARACTER(100) NOT NULL,
    gamen_koumoku_nm                             CHARACTER(200) NOT NULL,
    help_naiyo_mj                                VARCHAR(1000) NOT NULL,
    
    create_date                                  TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                                  CHARACTER VARYING(100) NOT NULL,
    
    record_date                                  TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                                  VARCHAR(100) NOT NULL,
    
    CONSTRAINT pk_eso_m_c0016_help PRIMARY KEY (
        help_id
    )
);

COMMENT ON TABLE eso_m_c0016_help IS '設備管理ヘルプマスタテーブル';
