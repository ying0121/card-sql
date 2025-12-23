
-- 2025-12-22_update_eso_t_c0019_sc.sql
-- 目的：低圧コンデンサ更新
-- 作成日: 2025-12-22
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_sc AS
-- UPDATE eso_t_c0019_sc SET shinsetsu_flg = $6, genba_kakuninzumi_meibanto_flg = $7, tkaku_v = $8, tkaku_v_cd = $9,
--     tkaku_kva = $10, tkaku_kva_cd = $11, tkaku_kva_kakuninkonnan_flg = $12, seizo_ym = $13,
--     seizo_nennomi_flg = $14, seizo_ym_kakuninkonnan_flg = $15, biko = $16, ordr_jn = $17,
--     record_date = now(), record_user = $18, shinki_koushin_sakujo_flg = 1
-- WHERE okyaku_id = $1 AND zumen_id = $2 AND setsubi_id = $3 AND kotai_id = $4 AND daisu_renban = $5;
--
-- EXECUTE update_sc('1234567890', 12345678, 1, 1, 1, 1, 0, 99.99, '12', 99.99, '12', 0, '202502', 0, 0, '更新備考', 1, 'user002');

UPDATE eso_t_c0019_sc
SET
    shinsetsu_flg                 = $6,
    genba_kakuninzumi_meibanto_flg = $7,
    tkaku_v                       = $8,
    tkaku_v_cd                    = $9,
    tkaku_kva                     = $10,
    tkaku_kva_cd                  = $11,
    tkaku_kva_kakuninkonnan_flg   = $12,
    seizo_ym                      = $13,
    seizo_nennomi_flg             = $14,
    seizo_ym_kakuninkonnan_flg    = $15,
    biko                          = $16,
    ordr_jn                       = $17,
    record_date                   = now(),
    record_user                   = $18,
    shinki_koushin_sakujo_flg     = 1 -- 1：更新
WHERE
    okyaku_id    = $1
AND zumen_id     = $2
AND setsubi_id   = $3
AND kotai_id     = $4
AND daisu_renban = $5;

