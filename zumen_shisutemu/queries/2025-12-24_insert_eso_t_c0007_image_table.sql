
-- 2025-12-24_insert_eso_t_c0007_image.sql
-- 目的：画像情報テーブルに挿入
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_image AS
-- INSERT INTO eso_t_c0007_image (
--     okyaku_id, image_id, image_kbn_su, shikibetsu_id, zumen_id,
--     title_mj, ordr_jn, file_name_mj,
--     create_user, record_user, shinki_koushin_sakujo_flg
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, 0);
--
-- EXECUTE insert_image('1234567890', 'image001', 1, 'shiki001', 12345678, 'タイトル', 1, 'file.jpg', 'user001', 'user001');

INSERT INTO eso_t_c0007_image (
    okyaku_id,
    image_id,
    image_kbn_su,
    shikibetsu_id,
    zumen_id,
    title_mj,
    ordr_jn,
    file_name_mj,
    create_user,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    $1,  -- okyaku_id
    $2,  -- image_id
    $3,  -- image_kbn_su
    $4,  -- shikibetsu_id
    $5,  -- zumen_id
    $6,  -- title_mj
    $7,  -- ordr_jn
    $8,  -- file_name_mj
    $9,  -- create_user
    $10, -- record_user
    0    -- 0：新規
);


