
-- 2025-12-25_insert_eso_t_c0008_file_work.sql
-- 目的：編集画像テーブルに挿入
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_file_work AS
-- INSERT INTO eso_t_c0008_file_work (
--     okyaku_id, image_id, lock_flg, image_kbn_su, shikibetsu_id, zumen_id,
--     title_mj, ordr_jn, file_kbn_mj, file_name_mj, file_binary_byt,
--     create_user, record_user, shinki_koushin_sakujo_flg
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, 0);
--
-- EXECUTE insert_file_work('1234567890', 'image001', 1, 1, 'shiki001', 12345678, 'タイトル', 1, 'A', 'file.jpg', NULL, 'user001', 'user001');

INSERT INTO eso_t_c0008_file_work (
    okyaku_id,
    image_id,
    lock_flg,
    image_kbn_su,
    shikibetsu_id,
    zumen_id,
    title_mj,
    ordr_jn,
    file_kbn_mj,
    file_name_mj,
    file_binary_byt,
    create_user,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    $1,  -- okyaku_id
    $2,  -- image_id
    $3,  -- lock_flg
    $4,  -- image_kbn_su
    $5,  -- shikibetsu_id
    $6,  -- zumen_id
    $7,  -- title_mj
    $8,  -- ordr_jn
    $9,  -- file_kbn_mj
    $10, -- file_name_mj
    $11, -- file_binary_byt
    $12, -- create_user
    $13, -- record_user
    0    -- 0：新規
);


