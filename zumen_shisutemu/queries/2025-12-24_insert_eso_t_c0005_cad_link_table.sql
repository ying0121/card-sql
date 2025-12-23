
-- 2025-12-24_insert_eso_t_c0005_cad_link.sql
-- 目的：ハイパーリンク管理テーブルに挿入
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_cad_link AS
-- INSERT INTO eso_t_c0005_cad_link (
--     okyaku_id, link_moto_id, moto_zumen_id, link_saki_id, saki_zumen_id,
--     saki_title_mj, saki_name_mj, saki_setsubi_id, saki_shubetsu_mj,
--     moto_zumen_han_su, saki_zumen_han_su, saki_zumen_shubetsu_su,
--     create_user, record_user, shinki_koushin_sakujo_flg
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, 0);
--
-- EXECUTE insert_cad_link('1234567890', 1, 12345678, 2, 12345679, 'タイトル', '名称', 1, '0001', 1, 1, 1, 'user001', 'user001');

INSERT INTO eso_t_c0005_cad_link (
    okyaku_id,
    link_moto_id,
    moto_zumen_id,
    link_saki_id,
    saki_zumen_id,
    saki_title_mj,
    saki_name_mj,
    saki_setsubi_id,
    saki_shubetsu_mj,
    moto_zumen_han_su,
    saki_zumen_han_su,
    saki_zumen_shubetsu_su,
    create_user,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    $1,  -- okyaku_id
    $2,  -- link_moto_id
    $3,  -- moto_zumen_id
    $4,  -- link_saki_id
    $5,  -- saki_zumen_id
    $6,  -- saki_title_mj
    $7,  -- saki_name_mj
    $8,  -- saki_setsubi_id
    $9,  -- saki_shubetsu_mj
    $10, -- moto_zumen_han_su
    $11, -- saki_zumen_han_su
    $12, -- saki_zumen_shubetsu_su
    $13, -- create_user
    $14, -- record_user
    0    -- 0：新規
);

