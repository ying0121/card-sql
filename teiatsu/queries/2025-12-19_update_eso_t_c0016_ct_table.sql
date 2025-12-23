
-- 2025-12-19_update_eso_t_c0016_ct.sql
-- 目的：低圧変流器更新
-- 作成日: 2025-12-19
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_ct AS
-- UPDATE eso_t_c0016_ct SET shinsetsu_flg = $6, tkaku_v = $7, tkaku_v_cd = $8, tkaku_1ji_a = $9,
--     tkaku_1ji_a_cd = $10, tkaku_2ji_a = $11, tkaku_2ji_a_cd = $12, kantsu_su = $13,
--     biko = $14, ordr_jn = $15, record_date = now(), record_user = $16, shinki_koushin_sakujo_flg = 1
-- WHERE okyaku_id = $1 AND zumen_id = $2 AND setsubi_id = $3 AND kotai_id = $4 AND daisu_renban = $5
-- RETURNING okyaku_id, zumen_id, setsubi_id, kotai_id, daisu_renban;
--
-- EXECUTE update_ct('1234567890', 12345678, 1, 1, 1, 1, 300.00, '01', 75.00, '01', 150.00, '12', 3, '更新備考', 1, 'user002');

UPDATE eso_t_c0016_ct
SET
    shinsetsu_flg             = $6,
    tkaku_v                   = $7,
    tkaku_v_cd                = $8,
    tkaku_1ji_a               = $9,
    tkaku_1ji_a_cd            = $10,
    tkaku_2ji_a               = $11,
    tkaku_2ji_a_cd            = $12,
    kantsu_su                 = $13,
    biko                      = $14,
    ordr_jn                   = $15,
    record_date               = now(),
    record_user               = $16,
    shinki_koushin_sakujo_flg = 1 -- 1：更新
WHERE
    okyaku_id    = $1
AND zumen_id     = $2
AND setsubi_id   = $3
AND kotai_id     = $4
AND daisu_renban = $5
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;

