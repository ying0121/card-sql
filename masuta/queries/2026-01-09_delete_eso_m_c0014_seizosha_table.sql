
-- 2026-01-09_delete_eso_m_c0014_seizosha.sql
-- 目的：製造者マスタテーブル削除
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_seizosha AS
-- DELETE FROM eso_m_c0014_seizosha 
-- WHERE shubetsu_cd = $1 AND shurui_cd = $2 AND seizosha_cd = $3;
--
-- EXECUTE delete_seizosha('000001', '01', '0001');

DELETE FROM eso_m_c0014_seizosha
WHERE
    shubetsu_cd = $1
    AND shurui_cd = $2
    AND seizosha_cd = $3
RETURNING *;
