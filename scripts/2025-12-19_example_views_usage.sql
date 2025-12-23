
-- 2025-12-19_example_views_usage.sql
-- 目的：テーブルクエリの使用例とテストクエリ
-- 作成日: 2025-12-19
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用したクエリの例です。
-- 論理削除されていないレコードのみを取得するクエリです。

-- ============================================
-- テーブルクエリの使用例
-- ============================================

-- 1. 分電盤テーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_t_c0014_bundenban AS
SELECT *
FROM eso_t_c0014_bundenban
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2; -- 削除された行を除外
COMMIT;

-- 2. 計電器テーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_t_c0015_keidenki AS
SELECT *
FROM eso_t_c0015_keidenki
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2; -- 削除された行を除外
COMMIT;

-- 3. 低圧変流器テーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_t_c0016_ct AS
SELECT *
FROM eso_t_c0016_ct
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2; -- 削除された行を除外
COMMIT;

-- ============================================
-- テーブルの統計情報取得（2025-12-19時点）
-- ============================================

-- 各テーブルのレコード数を確認（論理削除除外）
-- 注意：この日付までに作成されたテーブルのみ（c0014-c0016）
BEGIN;
SELECT 'eso_t_c0014_bundenban' AS table_name, COUNT(*) AS record_count
FROM eso_t_c0014_bundenban
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2
UNION ALL
SELECT 'eso_t_c0015_keidenki', COUNT(*)
FROM eso_t_c0015_keidenki
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2
UNION ALL
SELECT 'eso_t_c0016_ct', COUNT(*)
FROM eso_t_c0016_ct
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2;
COMMIT;

-- 注意：テーブル定義確認クエリは common_table_definitions.sql を参照してください

