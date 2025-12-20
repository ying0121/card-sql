
-- 2025-12-19_insert_eso_t_c0014_bundenban.sql
-- 目的：分電盤テーブルに挿入
-- 作成日: 2025-12-19
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_bundenban AS
-- INSERT INTO eso_t_c0014_bundenban (okyaku_id, zumen_id, setsubi_id, kotai_id, daisu_renban,
--     shinsetsu_flg, shurui_cd, waku_nm, biko, ordr_jn, create_date, create_user, record_date, record_user, shinki_koushin_sakujo_flg)
-- VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, now(), $11, now(), $12, 0)
-- RETURNING okyaku_id, zumen_id, setsubi_id, kotai_id, daisu_renban;
--
-- EXECUTE insert_bundenban('1234567890', 12345678, 1, 1, 1, 1, '01', '枠名', '備考', 1, 'user001', 'user001');

INSERT INTO eso_t_c0014_bundenban (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    shurui_cd,
    waku_nm,
    biko,
    ordr_jn,
    create_date,
    create_user,
    record_date,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    $1,  -- okyaku_id
    $2,  -- zumen_id
    $3,  -- setsubi_id
    $4,  -- kotai_id
    $5,  -- daisu_renban
    $6,  -- shinsetsu_flg
    $7,  -- shurui_cd
    $8,  -- waku_nm
    $9,  -- biko
    $10, -- ordr_jn
    now(), -- create_date
    $11, -- create_user
    now(), -- record_date
    $12, -- record_user
    0    -- 0：新規
)
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;

