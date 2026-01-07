
-- 2026-01-07_delete_eso_m_c0009_setsubi_category.sql
-- 目的：設備カテゴリマスタテーブル削除
-- 作成日: 2026-01-07
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_setsubi_category AS
-- DELETE FROM eso_m_c0009_setsubi_category 
-- WHERE category_cd = $1 AND shubetsu_cd = $2;
--
-- EXECUTE delete_setsubi_category(1, '0001');

DELETE FROM eso_m_c0009_setsubi_category
WHERE
    category_cd = $1
AND shubetsu_cd = $2
RETURNING *;

