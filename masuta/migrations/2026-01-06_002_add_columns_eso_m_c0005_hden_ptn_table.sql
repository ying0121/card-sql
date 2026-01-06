
-- 2026-01-06_002_add_columns_eso_m_c0005_hden_ptn.sql
-- 目的：発電所パターンマスタテーブルにカラムを追加
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- create_date を追加
ALTER TABLE eso_m_c0005_hden_ptn
    ADD COLUMN IF NOT EXISTS create_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now();

-- create_user を追加
ALTER TABLE eso_m_c0005_hden_ptn
    ADD COLUMN IF NOT EXISTS create_user VARCHAR(100) NOT NULL DEFAULT 'ikou2027';

COMMIT;

