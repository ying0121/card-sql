
-- 2026-01-09_select_eso_m_c0016_help.sql
-- 目的：設備管理ヘルプマスタ取得
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_help AS
-- SELECT ... FROM eso_m_c0016_help 
-- WHERE help_id = $1;
--
-- EXECUTE select_help('00000001');

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
WHERE
    help_id = $1;
