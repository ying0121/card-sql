
-- 2026-01-05_update_eso_m_c0002_zumen_shubetsu.sql
-- 目的：図面種別マスタ更新
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_zumen_shubetsu AS
-- UPDATE eso_m_c0002_zumen_shubetsu SET zumen_nm = $2, record_date = now(), record_user = $3
-- WHERE zumen_cd = $1;
--
-- EXECUTE update_zumen_shubetsu(1, '更新図面名称', 'user002');

UPDATE eso_m_c0002_zumen_shubetsu
SET
    zumen_nm    = $2,
    record_date = now(),
    record_user = $3
WHERE
    zumen_cd = $1
RETURNING *;

