
-- 2026-01-09_update_eso_m_c0016_help.sql
-- 目的：設備管理ヘルプマスタ更新
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_help AS
-- UPDATE eso_m_c0016_help SET shubetsu_cd = $2, gamen_id = $3, gamen_nm = $4, gamen_koumoku_id = $5, gamen_koumoku_nm = $6, help_naiyo_mj = $7,
--     record_date = now(), record_user = $8
-- WHERE help_id = $1;
--
-- EXECUTE update_help('00000001', '0001', 'gamen001', '更新画面名', 'koumoku001', '更新画面項目名', '更新ヘルプ内容', 'user002');

UPDATE eso_m_c0016_help
SET
    shubetsu_cd      = $2,
    gamen_id         = $3,
    gamen_nm         = $4,
    gamen_koumoku_id = $5,
    gamen_koumoku_nm = $6,
    help_naiyo_mj    = $7,
    record_date      = now(),
    record_user      = $8
WHERE
    help_id = $1
RETURNING *;
