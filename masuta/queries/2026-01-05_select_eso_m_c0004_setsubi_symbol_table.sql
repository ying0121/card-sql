
-- 2026-01-05_select_eso_m_c0004_setsubi_symbol.sql
-- 目的：設備シンボルマスタ取得
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE select_setsubi_symbol AS
-- SELECT ... FROM eso_m_c0004_setsubi_symbol WHERE shubetsu_cd = $1 AND symbol_no = $2;
--
-- EXECUTE select_setsubi_symbol('0001', 1);

SELECT
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
    create_date,
    create_user,
    record_date,
    record_user
FROM eso_m_c0004_setsubi_symbol
WHERE
    shubetsu_cd = $1
AND symbol_no = $2;

