
-- common_table_definitions.sql
-- 目的：テーブル定義確認クエリ（共通）
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは全テーブル共通の定義確認クエリです。

-- ============================================
-- テーブル定義確認
-- ============================================

-- テーブルの定義を確認
SELECT 
    table_name,
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
AND table_name LIKE 'eso_t_c00%'
ORDER BY table_name, ordinal_position;

-- テーブルの制約を確認
SELECT 
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type,
    kcu.column_name
FROM information_schema.table_constraints tc
LEFT JOIN information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
WHERE tc.table_schema = 'public'
AND tc.table_name LIKE 'eso_t_c00%'
ORDER BY tc.table_name, tc.constraint_type, kcu.ordinal_position;

