
-- 2025-12-24_005_drop_column_eso_t_c0005_cad_link.sql
-- 目的：ハイパーリンク管理テーブルからKYOKAI_CDカラムを削除
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0005_cad_link
    DROP COLUMN IF EXISTS KYOKAI_CD;

COMMIT;


