
-- 2026-01-06_delete_eso_m_c0007_ssym_category.sql
-- 目的：セットシンボルカテゴリマスタテーブル削除
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_ssym_category AS
-- DELETE FROM eso_m_c0007_ssym_category 
-- WHERE category1_cd = $1 AND category2_cd = $2 AND category3_cd = $3;
--
-- EXECUTE delete_ssym_category(1, NULL, NULL);

DELETE FROM eso_m_c0007_ssym_category
WHERE
    category1_cd = $1
AND (category2_cd = $2 OR ($2 IS NULL AND category2_cd IS NULL))
AND (category3_cd = $3 OR ($3 IS NULL AND category3_cd IS NULL))
RETURNING *;

