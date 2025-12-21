
-- 2025-12-18_example_views_usage.sql
-- 目的：テーブルクエリの使用例とテストクエリ
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用したクエリの例です。
-- 論理削除されていないレコードのみを取得するクエリです。

-- ============================================
-- テーブルクエリの使用例
-- ============================================

-- 1. 計器類テーブルの使用例
-- 論理削除されていないレコードのみを取得
SELECT *
FROM eso_t_c0011_keiki
WHERE okyaku_id = '1234567890'
AND zumen_id = 12345678
AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 -- 削除された行を除外
ORDER BY ordr_jn;

-- 2. 低圧開閉器テーブルの使用例
SELECT *
FROM eso_t_c0012_kaiheiki
WHERE okyaku_id = '1234567890'
AND zumen_id = 12345678
AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 -- 削除された行を除外
ORDER BY ordr_jn;

-- 3. 低圧ケーブルテーブルの使用例
SELECT *
FROM eso_t_c0013_cable
WHERE okyaku_id = '1234567890'
AND zumen_id = 12345678
AND shinki_koushin_sakujo_flg IS DISTINCT FROM 2 -- 削除された行を除外
ORDER BY setsubi_id, kotai_id, daisu_renban;

