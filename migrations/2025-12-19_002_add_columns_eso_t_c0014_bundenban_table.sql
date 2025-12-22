
-- 2025-12-19_002_add_columns_eso_t_c0014_bundenban.sql
-- 目的：分電盤テーブルに追加項目を追加
-- 更新日: 2025-12-19
-- 更新者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0014_bundenban
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256);

COMMIT;

