
-- 2025-12-23_example_views_usage.sql
-- 目的：テーブルクエリの使用例とテストクエリ
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用したクエリの例です。
-- 論理削除されていないレコードのみを取得するクエリです。

-- ============================================
-- テーブルクエリの使用例
-- ============================================

-- 1. 低圧リアクトルテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_t_c0020_sr AS
SELECT *
FROM eso_t_c0020_sr
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2; -- 削除された行を除外
COMMIT;

-- 2. 子メーターテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_t_c0021_kometer AS
SELECT *
FROM eso_t_c0021_kometer
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2; -- 削除された行を除外
COMMIT;

-- ============================================
-- テーブルの統計情報取得（2025-12-23時点）
-- ============================================

-- 各テーブルのレコード数を確認（論理削除除外）
-- 注意：この日付までに作成されたテーブルのみ（c0019-c0021）
BEGIN;
SELECT 'eso_t_c0019_sc' AS table_name, COUNT(*) AS record_count
FROM eso_t_c0019_sc
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2
UNION ALL
SELECT 'eso_t_c0020_sr', COUNT(*)
FROM eso_t_c0020_sr
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2
UNION ALL
SELECT 'eso_t_c0021_kometer', COUNT(*)
FROM eso_t_c0021_kometer
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2;
COMMIT;

-- 注意：テーブル定義確認クエリは common_table_definitions.sql を参照してください

