
-- 2025-12-26_002_add_columns_eso_m_c0001_cdmast.sql
-- 目的：コードマスタテーブルにカラムを追加
-- 作成日: 2025-12-26
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- group_cd を追加
ALTER TABLE eso_m_c0001_cdmast
    ADD COLUMN IF NOT EXISTS group_cd INTEGER;

-- create_date を追加
ALTER TABLE eso_m_c0001_cdmast
    ADD COLUMN IF NOT EXISTS create_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now();

-- create_user を追加
ALTER TABLE eso_m_c0001_cdmast
    ADD COLUMN IF NOT EXISTS create_user VARCHAR(100) NOT NULL DEFAULT 'ikou2027';

-- record_date を追加
ALTER TABLE eso_m_c0001_cdmast
    ADD COLUMN IF NOT EXISTS record_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now();

-- record_user を追加
ALTER TABLE eso_m_c0001_cdmast
    ADD COLUMN IF NOT EXISTS record_user VARCHAR(100) NOT NULL DEFAULT 'ikou2027';

COMMIT;

