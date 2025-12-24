
-- 2025-12-25_example_views_usage.sql
-- 目的：テーブルクエリの使用例とテストクエリ
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用したクエリの例です。
-- 論理削除されていないレコードのみを取得するクエリです。

-- ============================================
-- テーブルクエリの使用例
-- ============================================

-- 1. 編集画像テーブルの使用例
-- 論理削除されていないレコードのみを取得
BEGIN;
CREATE OR REPLACE VIEW v_eso_t_c0008_file_work AS
SELECT *
FROM eso_t_c0008_file_work
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2; -- 削除された行を除外
COMMIT;

-- 2. 採番テーブルの使用例
-- 論理削除されていないレコードのみを取得
BEGIN;
CREATE OR REPLACE VIEW v_eso_t_c0009_numbering AS
SELECT *
FROM eso_t_c0009_numbering
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2; -- 削除された行を除外
COMMIT;

-- ============================================
-- テーブルの統計情報取得（2025-12-25時点）
-- ============================================

-- 各テーブルのレコード数を確認（論理削除除外）
-- 注意：この日付までに作成されたテーブルのみ（c0008-c0009）
BEGIN;
SELECT 'eso_t_c0008_file_work' AS table_name, COUNT(*) AS record_count
FROM eso_t_c0008_file_work
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2
UNION ALL
SELECT 'eso_t_c0009_numbering', COUNT(*)
FROM eso_t_c0009_numbering
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2;
COMMIT;

-- 注意：テーブル定義確認クエリは common_table_definitions.sql を参照してください

