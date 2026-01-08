
-- 2026-01-09_example_views_usage.sql
-- 目的：テーブルクエリの使用例とテストクエリ
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用したクエリの例です。

-- ============================================
-- テーブルクエリの使用例
-- ============================================

-- 1. 撤去状態マスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0012_tekkyo AS
SELECT
    jotai_flg,
    jotai_nm,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0012_tekkyo
ORDER BY jotai_flg;
COMMIT;

-- ============================================
-- テーブルの統計情報取得（2026-01-09時点）
-- ============================================

-- 撤去状態マスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0012_tekkyo' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0012_tekkyo;
COMMIT;

-- 状態フラグごとのレコード数
SELECT jotai_flg, COUNT(*) AS record_count
FROM eso_m_c0012_tekkyo
GROUP BY jotai_flg
ORDER BY jotai_flg;

-- 状態名称ごとのレコード数
SELECT jotai_nm, COUNT(*) AS record_count
FROM eso_m_c0012_tekkyo
WHERE jotai_nm IS NOT NULL
GROUP BY jotai_nm
ORDER BY jotai_nm;

-- 2. 製造者マスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0014_seizosha AS
SELECT
    shubetsu_cd,
    shurui_cd,
    seizosha_cd,
    seizosha_nm,
    seizosha_kana_nm,
    seizosha_ryaku_nm,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0014_seizosha
ORDER BY shubetsu_cd, shurui_cd, seizosha_cd;
COMMIT;

-- 製造者マスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0014_seizosha' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0014_seizosha;
COMMIT;

-- 設備種別CDごとのレコード数
SELECT shubetsu_cd, COUNT(*) AS record_count
FROM eso_m_c0014_seizosha
GROUP BY shubetsu_cd
ORDER BY shubetsu_cd;

-- 種類CDごとのレコード数
SELECT shurui_cd, COUNT(*) AS record_count
FROM eso_m_c0014_seizosha
GROUP BY shurui_cd
ORDER BY shurui_cd;

-- 製造者CDごとのレコード数
SELECT seizosha_cd, COUNT(*) AS record_count
FROM eso_m_c0014_seizosha
GROUP BY seizosha_cd
ORDER BY seizosha_cd;

-- 設備種別CDと種類CDの組み合わせごとのレコード数
SELECT shubetsu_cd, shurui_cd, COUNT(*) AS record_count
FROM eso_m_c0014_seizosha
GROUP BY shubetsu_cd, shurui_cd
ORDER BY shubetsu_cd, shurui_cd;

-- 3. 型式マスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0015_katashiki AS
SELECT
    shubetsu_cd,
    shurui_cd,
    seizosha_cd,
    katashiki_cd,
    katasiki_nm,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0015_katashiki
ORDER BY shubetsu_cd, shurui_cd, seizosha_cd, katashiki_cd;
COMMIT;

-- 型式マスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0015_katashiki' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0015_katashiki;
COMMIT;

-- 設備種別CDごとのレコード数
SELECT shubetsu_cd, COUNT(*) AS record_count
FROM eso_m_c0015_katashiki
GROUP BY shubetsu_cd
ORDER BY shubetsu_cd;

-- 種類CDごとのレコード数
SELECT shurui_cd, COUNT(*) AS record_count
FROM eso_m_c0015_katashiki
GROUP BY shurui_cd
ORDER BY shurui_cd;

-- 製造者CDごとのレコード数
SELECT seizosha_cd, COUNT(*) AS record_count
FROM eso_m_c0015_katashiki
GROUP BY seizosha_cd
ORDER BY seizosha_cd;

-- 型式CDごとのレコード数
SELECT katashiki_cd, COUNT(*) AS record_count
FROM eso_m_c0015_katashiki
GROUP BY katashiki_cd
ORDER BY katashiki_cd;

-- 設備種別CDと種類CDの組み合わせごとのレコード数
SELECT shubetsu_cd, shurui_cd, COUNT(*) AS record_count
FROM eso_m_c0015_katashiki
GROUP BY shubetsu_cd, shurui_cd
ORDER BY shubetsu_cd, shurui_cd;

-- 4. 設備管理ヘルプマスタテーブルの使用例
BEGIN;
CREATE OR REPLACE VIEW v_eso_m_c0016_help AS
SELECT
    help_id,
    shubetsu_cd,
    gamen_id,
    gamen_nm,
    gamen_koumoku_id,
    gamen_koumoku_nm,
    help_naiyo_mj,
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0016_help
ORDER BY help_id;
COMMIT;

-- 設備管理ヘルプマスタテーブルのレコード数を確認
BEGIN;
SELECT 'eso_m_c0016_help' AS table_name, COUNT(*) AS record_count
FROM eso_m_c0016_help;
COMMIT;

-- ヘルプIDごとのレコード数
SELECT help_id, COUNT(*) AS record_count
FROM eso_m_c0016_help
GROUP BY help_id
ORDER BY help_id;

-- 設備種別コードごとのレコード数
SELECT shubetsu_cd, COUNT(*) AS record_count
FROM eso_m_c0016_help
GROUP BY shubetsu_cd
ORDER BY shubetsu_cd;

-- 画面IDごとのレコード数
SELECT gamen_id, COUNT(*) AS record_count
FROM eso_m_c0016_help
GROUP BY gamen_id
ORDER BY gamen_id;

-- 画面項目IDごとのレコード数
SELECT gamen_koumoku_id, COUNT(*) AS record_count
FROM eso_m_c0016_help
GROUP BY gamen_koumoku_id
ORDER BY gamen_koumoku_id;
