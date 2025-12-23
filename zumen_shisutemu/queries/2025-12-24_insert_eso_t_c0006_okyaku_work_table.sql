
-- 2025-12-24_insert_eso_t_c0006_okyaku_work.sql
-- 目的：ＣＡＤ編集お客様管理テーブルに挿入
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_okyaku_work AS
-- INSERT INTO eso_t_c0006_okyaku_work (
--     okyaku_id, yoto_kbn, user_nm_mj, lock_flg,
--     edit_flg, tenkenjisseki_id, json_binary_byt, zumen_binary_byt, renkei_mode_su,
--     create_user, record_user, shinki_koushin_sakujo_flg
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, 0);
--
-- EXECUTE insert_okyaku_work('1234567890', '01', 'ユーザー名', 1, 1, '1234567890', NULL, NULL, 1, 'user001', 'user001');

INSERT INTO eso_t_c0006_okyaku_work (
    okyaku_id,
    yoto_kbn,
    user_nm_mj,
    lock_flg,
    edit_flg,
    tenkenjisseki_id,
    json_binary_byt,
    zumen_binary_byt,
    renkei_mode_su,
    create_user,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    $1,  -- okyaku_id
    $2,  -- yoto_kbn
    $3,  -- user_nm_mj
    $4,  -- lock_flg
    $5,  -- edit_flg
    $6,  -- tenkenjisseki_id
    $7,  -- json_binary_byt
    $8,  -- zumen_binary_byt
    $9,  -- renkei_mode_su
    $10, -- create_user
    $11, -- record_user
    0    -- 0：新規
);

