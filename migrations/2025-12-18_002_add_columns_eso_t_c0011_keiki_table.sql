
-- 2025-12-18_002_add_columns_eso_t_c0011_keiki.sql
-- 目的：計器類テーブルに追加項目を追加
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0011_keiki
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256);

COMMIT;
