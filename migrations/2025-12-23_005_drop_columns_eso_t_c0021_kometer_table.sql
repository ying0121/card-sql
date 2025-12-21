
-- 2025-12-23_005_drop_columns_eso_t_c0021_kometer.sql
-- 目的：子メーターテーブルから削除カラムを削除
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0021_kometer
    DROP COLUMN IF EXISTS METER_NYURYOKU_HOSHIKI_CD,
    DROP COLUMN IF EXISTS SETCHI_TYPE_CD,
    DROP COLUMN IF EXISTS HASSHIN_SOCHI_CD;

COMMIT;

