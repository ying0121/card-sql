
-- 2026-01-07_002_add_columns_eso_m_c0008_ptn_category.sql
-- 目的：図面パターンカテゴリマスタテーブルにカラムを追加
-- 作成日: 2026-01-07
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- category2_cd を追加
ALTER TABLE eso_m_c0008_ptn_category
    ADD COLUMN IF NOT EXISTS category2_cd INTEGER;

-- category3_cd を追加
ALTER TABLE eso_m_c0008_ptn_category
    ADD COLUMN IF NOT EXISTS category3_cd INTEGER;

-- create_date を追加
ALTER TABLE eso_m_c0008_ptn_category
    ADD COLUMN IF NOT EXISTS create_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now();

-- create_user を追加
ALTER TABLE eso_m_c0008_ptn_category
    ADD COLUMN IF NOT EXISTS create_user VARCHAR(100) NOT NULL DEFAULT 'ikou2027';

COMMIT;

