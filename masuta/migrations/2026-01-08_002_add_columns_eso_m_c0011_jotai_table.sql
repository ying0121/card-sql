
-- 2026-01-08_002_add_columns_eso_m_c0011_jotai.sql
-- 目的：機器使用状態マスタテーブルにカラムを追加
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- create_date を追加
ALTER TABLE eso_m_c0011_jotai
    ADD COLUMN IF NOT EXISTS create_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now();

-- create_user を追加
ALTER TABLE eso_m_c0011_jotai
    ADD COLUMN IF NOT EXISTS create_user VARCHAR(100) NOT NULL DEFAULT 'ikou2027';

-- record_date を追加
ALTER TABLE eso_m_c0011_jotai
    ADD COLUMN IF NOT EXISTS record_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now();

-- record_user を追加
ALTER TABLE eso_m_c0011_jotai
    ADD COLUMN IF NOT EXISTS record_user VARCHAR(100) NOT NULL DEFAULT 'ikou2027';

COMMIT;
