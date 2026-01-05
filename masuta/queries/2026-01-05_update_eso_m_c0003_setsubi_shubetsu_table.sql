
-- 2026-01-05_update_eso_m_c0003_setsubi_shubetsu.sql
-- 目的：設備種別マスタ更新
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_setsubi_shubetsu AS
-- UPDATE eso_m_c0003_setsubi_shubetsu SET shubetsu_nm = $2, table_nm = $3, 
--     record_date = now(), record_user = $4
-- WHERE shubetsu_cd = $1;
--
-- EXECUTE update_setsubi_shubetsu('0001', '更新種別名称', '更新テーブル名称', 'user002');

UPDATE eso_m_c0003_setsubi_shubetsu
SET
    shubetsu_nm = $2,
    table_nm    = $3,
    record_date = now(),
    record_user = $4
WHERE
    shubetsu_cd = $1
RETURNING *;

