
-- 2025-12-22_example_views_usage.sql
-- 目的：テーブルクエリの使用例とテストクエリ
-- 作成日: 2025-12-22
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用したクエリの例です。
-- 論理削除されていないレコードのみを取得するクエリです。

-- ============================================
-- テーブルクエリの使用例
-- ============================================

-- 1. 低圧ヒューズテーブルの使用例
SELECT *
FROM eso_t_c0017_fuse
WHERE okyaku_id = '1234567890'
AND zumen_id = 12345678
AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 -- 削除された行を除外
ORDER BY ordr_jn;

-- 2. 幹線テーブルの使用例
SELECT *
FROM eso_t_c0018_kansen
WHERE okyaku_id = '1234567890'
AND zumen_id = 12345678
AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 -- 削除された行を除外
ORDER BY ordr_jn;

-- 3. 低圧コンデンサテーブルの使用例
SELECT *
FROM eso_t_c0019_sc
WHERE okyaku_id = '1234567890'
AND zumen_id = 12345678
AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 -- 削除された行を除外
ORDER BY ordr_jn;

-- ============================================
-- テーブルの統計情報取得
-- ============================================

-- 各テーブルのレコード数を確認（論理削除除外）
SELECT 'eso_t_c0011_keiki' AS table_name, COUNT(*) AS record_count
FROM eso_t_c0011_keiki
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2
UNION ALL
SELECT 'eso_t_c0012_kaiheiki', COUNT(*)
FROM eso_t_c0012_kaiheiki
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2
UNION ALL
SELECT 'eso_t_c0013_cable', COUNT(*)
FROM eso_t_c0013_cable
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2
UNION ALL
SELECT 'eso_t_c0014_bundenban', COUNT(*)
FROM eso_t_c0014_bundenban
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2
UNION ALL
SELECT 'eso_t_c0015_keidenki', COUNT(*)
FROM eso_t_c0015_keidenki
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2
UNION ALL
SELECT 'eso_t_c0016_ct', COUNT(*)
FROM eso_t_c0016_ct
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2
UNION ALL
SELECT 'eso_t_c0017_fuse', COUNT(*)
FROM eso_t_c0017_fuse
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2
UNION ALL
SELECT 'eso_t_c0018_kansen', COUNT(*)
FROM eso_t_c0018_kansen
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2
UNION ALL
SELECT 'eso_t_c0019_sc', COUNT(*)
FROM eso_t_c0019_sc
WHERE shinki_koushin_sakujo_flg IS DISTINCT FROM 2;

-- ============================================
-- テーブル定義確認
-- ============================================

-- テーブルの定義を確認
SELECT 
    table_name,
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
AND table_name LIKE 'eso_t_c00%'
ORDER BY table_name, ordinal_position;

