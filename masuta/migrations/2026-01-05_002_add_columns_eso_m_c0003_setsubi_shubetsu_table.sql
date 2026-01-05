
-- 2026-01-05_002_add_columns_eso_m_c0003_setsubi_shubetsu.sql
-- 目的：設備種別マスタテーブルにカラムを追加
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- create_date を追加
ALTER TABLE eso_m_c0003_setsubi_shubetsu
    ADD COLUMN IF NOT EXISTS create_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now();

-- create_user を追加
ALTER TABLE eso_m_c0003_setsubi_shubetsu
    ADD COLUMN IF NOT EXISTS create_user CHARACTER VARYING(100) NOT NULL DEFAULT 'ikou2027';

-- record_date を追加
ALTER TABLE eso_m_c0003_setsubi_shubetsu
    ADD COLUMN IF NOT EXISTS record_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now();

-- record_user を追加
ALTER TABLE eso_m_c0003_setsubi_shubetsu
    ADD COLUMN IF NOT EXISTS record_user CHARACTER VARYING(100) NOT NULL DEFAULT 'ikou2027';

COMMIT;

