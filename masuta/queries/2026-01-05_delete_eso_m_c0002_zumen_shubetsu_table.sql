
-- 2026-01-05_delete_eso_m_c0002_zumen_shubetsu.sql
-- 目的：図面種別マスタテーブル削除
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_zumen_shubetsu AS
-- DELETE FROM eso_m_c0002_zumen_shubetsu WHERE zumen_cd = $1;
--
-- EXECUTE delete_zumen_shubetsu(1);

DELETE FROM eso_m_c0002_zumen_shubetsu
WHERE
    zumen_cd = $1
RETURNING *;

