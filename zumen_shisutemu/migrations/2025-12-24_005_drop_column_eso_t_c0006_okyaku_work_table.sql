
-- 2025-12-24_005_drop_column_eso_t_c0006_okyaku_work.sql
-- 目的：ＣＡＤ編集お客様管理テーブルからKYOKAI_CDカラムを削除
-- 更新日: 2025-12-24
-- 更新者: ikou2027
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0006_okyaku_work
    DROP COLUMN IF EXISTS KYOKAI_CD;

COMMIT;


