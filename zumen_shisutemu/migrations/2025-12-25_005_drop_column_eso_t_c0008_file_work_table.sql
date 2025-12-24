
-- 2025-12-25_005_drop_column_eso_t_c0008_file_work.sql
-- 目的：編集画像テーブルからKYOKAI_CDカラムを削除
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0008_file_work
    DROP COLUMN IF EXISTS KYOKAI_CD;

COMMIT;


