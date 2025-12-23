
-- 2025-12-18_update_eso_t_c0011_keiki.sql
-- 目的：計器類更新
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_keiki AS
-- UPDATE eso_t_c0011_keiki SET shinsetsu_flg = $6, shurui_cd = $7, tkaku_v = $8, tkaku_v_cd = $9,
--     tkaku_a = $10, tkaku_a_cd = $11, seizo_ym = $12, biko = $13, ordr_jn = $14,
--     record_date = now(), record_user = $15, shinki_koushin_sakujo_flg = 1
-- WHERE okyaku_id = $1 AND zumen_id = $2 AND setsubi_id = $3 AND kotai_id = $4 AND daisu_renban = $5;
--
-- EXECUTE update_keiki('1234567890', 12345678, 1, 1, 1, 1, '02', 99.99, '01', 99.99, '12', '202502', '更新備考', 1, 'user002');

UPDATE eso_t_c0011_keiki
SET
    shinsetsu_flg             = $6,
    shurui_cd                 = $7,
    tkaku_v                   = $8,
    tkaku_v_cd                = $9,
    tkaku_a                   = $10,
    tkaku_a_cd                = $11,
    seizo_ym                  = $12,
    biko                      = $13,
    ordr_jn                   = $14,
    record_date               = now(),
    record_user               = $15,
    shinki_koushin_sakujo_flg = 1 -- 1：更新
WHERE
    okyaku_id    = $1
AND zumen_id     = $2
AND setsubi_id   = $3
AND kotai_id     = $4
AND daisu_renban = $5;
