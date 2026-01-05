
-- 2026-01-05_update_eso_m_c0004_setsubi_symbol.sql
-- 目的：設備シンボルマスタ更新
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_setsubi_symbol AS
-- UPDATE eso_m_c0004_setsubi_symbol SET master_bunrui = $3, master_cd = $4, ...,
--     record_date = now(), record_user = $24
-- WHERE shubetsu_cd = $1 AND symbol_no = $2;
--
-- EXECUTE update_setsubi_symbol('0001', 1, '0000001', '01', ...);

UPDATE eso_m_c0004_setsubi_symbol
SET
    master_bunrui = $3,
    master_cd     = $4,
    symbol_scale  = $5,
    category_cd   = $6,
    order_jn      = $7,
    text_x        = $8,
    text_y        = $9,
    text_size     = $10,
    hyokimoji1    = $11,
    hyokimoji2    = $12,
    hyokimoji3    = $13,
    symbol_muki   = $14,
    mask_flg      = $15,
    zukei_type    = $16,
    line_type     = $17,
    line_width    = $18,
    line_color    = $19,
    font          = $20,
    limit_flg1    = $21,
    upload_flg    = $22,
    biko          = $23,
    record_date   = now(),
    record_user   = $24
WHERE
    shubetsu_cd = $1
AND symbol_no = $2
RETURNING *;

