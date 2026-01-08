
-- 2026-01-09_insert_eso_m_c0016_help.sql
-- 目的：設備管理ヘルプマスタテーブルに挿入
-- 作成日: 2026-01-09
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_help AS
-- INSERT INTO eso_m_c0016_help (
--     help_id, shubetsu_cd, gamen_id, gamen_nm, gamen_koumoku_id, gamen_koumoku_nm, help_naiyo_mj,
--     create_date, create_user, record_date, record_user
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);
--
-- EXECUTE insert_help('00000001', '0001', 'gamen001', '画面名', 'koumoku001', '画面項目名', 'ヘルプ内容', '2026-01-09 00:00:00', 'user001', '2026-01-09 00:00:00', 'user001');

INSERT INTO eso_m_c0016_help (
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
)
VALUES (
    $1,  -- help_id
    $2,  -- shubetsu_cd
    $3,  -- gamen_id
    $4,  -- gamen_nm
    $5,  -- gamen_koumoku_id
    $6,  -- gamen_koumoku_nm
    $7,  -- help_naiyo_mj
    $8,  -- create_date
    $9,  -- create_user
    $10, -- record_date
    $11  -- record_user
)
RETURNING *;
