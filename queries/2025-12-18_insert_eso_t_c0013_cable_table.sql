
-- 2025-12-18_insert_eso_t_c0013_cable.sql
-- 目的：低圧ケーブル管理テーブルに挿入
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_cable AS
-- INSERT INTO eso_t_c0013_cable (okyaku_id, zumen_id, setsubi_id, kotai_id, daisu_renban,
--     shinsetsu_flg, shurui_cd, biko, ordr_jn, create_user, record_user, shinki_koushin_sakujo_flg)
-- VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, 0);
--
-- EXECUTE insert_cable('1234567890', 12345678, 1, 1, 1, 1, '01', '備考', 1, 'user001', 'user001');

INSERT INTO eso_t_c0013_cable (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    shurui_cd,
    biko,
    ordr_jn,
    create_user,
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
    $8,  -- biko
    $9,  -- ordr_jn
    $10, -- create_user
    $11, -- record_user
    0    -- 0：新規
);
