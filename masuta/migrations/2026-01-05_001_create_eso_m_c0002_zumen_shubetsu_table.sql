
-- 2026-01-05_001_create_eso_m_c0002_zumen_shubetsu.sql
-- 目的：図面種別マスタテーブル作成
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

CREATE TABLE IF NOT EXISTS eso_m_c0002_zumen_shubetsu (
    zumen_cd                          INTEGER NOT NULL,
    zumen_nm                          CHARACTER VARYING(24) NOT NULL,
    
    create_date                       TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                       CHARACTER VARYING(100) NOT NULL,
    
    record_date                       TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                       CHARACTER VARYING(100) NOT NULL,
    
    CONSTRAINT pk_eso_m_c0002_zumen_shubetsu PRIMARY KEY (
        zumen_cd
    )
);

COMMENT ON TABLE eso_m_c0002_zumen_shubetsu IS '図面種別マスタテーブル';

