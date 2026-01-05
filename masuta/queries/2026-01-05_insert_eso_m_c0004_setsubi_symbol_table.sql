
-- 2026-01-05_insert_eso_m_c0004_setsubi_symbol.sql
-- 目的：設備シンボルマスタテーブルに挿入
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_setsubi_symbol AS
-- INSERT INTO eso_m_c0004_setsubi_symbol (
--     shubetsu_cd, symbol_no, master_bunrui, master_cd, symbol_scale, category_cd, order_jn,
--     text_x, text_y, text_size, hyokimoji1, hyokimoji2, hyokimoji3, symbol_muki,
--     mask_flg, zukei_type, line_type, line_width, line_color, font,
--     limit_flg1, upload_flg, biko, create_user, record_user
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25);
--
-- EXECUTE insert_setsubi_symbol('0001', 1, '0000001', '01', 1.0, 1, 1, 0.0, 0.0, 10.0, '文字１', '文字２', '文字３', NULL, 0, 1, 1, 1, '000000', 'Arial', 0, 0, NULL, 'user001', 'user001');

INSERT INTO eso_m_c0004_setsubi_symbol (
    shubetsu_cd,
    symbol_no,
    master_bunrui,
    master_cd,
    symbol_scale,
    category_cd,
    order_jn,
    text_x,
    text_y,
    text_size,
    hyokimoji1,
    hyokimoji2,
    hyokimoji3,
    symbol_muki,
    mask_flg,
    zukei_type,
    line_type,
    line_width,
    line_color,
    font,
    limit_flg1,
    upload_flg,
    biko,
    create_user,
    record_user
)
VALUES (
    $1,   -- shubetsu_cd
    $2,   -- symbol_no
    $3,   -- master_bunrui
    $4,   -- master_cd
    $5,   -- symbol_scale
    $6,   -- category_cd
    $7,   -- order_jn
    $8,   -- text_x
    $9,   -- text_y
    $10,  -- text_size
    $11,  -- hyokimoji1
    $12,  -- hyokimoji2
    $13,  -- hyokimoji3
    $14,  -- symbol_muki
    $15,  -- mask_flg
    $16,  -- zukei_type
    $17,  -- line_type
    $18,  -- line_width
    $19,  -- line_color
    $20,  -- font
    $21,  -- limit_flg1
    $22,  -- upload_flg
    $23,  -- biko
    $24,  -- create_user
    $25   -- record_user
)
RETURNING *;

