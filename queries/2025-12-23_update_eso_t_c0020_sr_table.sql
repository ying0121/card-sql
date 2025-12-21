
-- 2025-12-23_update_eso_t_c0020_sr.sql
-- 目的：低圧リアクトル更新
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_sr AS
-- UPDATE eso_t_c0020_sr SET shinsetsu_flg = $6, genba_kakuninzumi_meibanto_flg = $7, shurui_cd = $8, tkaku_v = $9, tkaku_v_cd = $10,
--     tkaku_kva = $11, tkaku_kva_cd = $12, tkaku_kva_kakuninkonnan_flg = $13, seizo_ym = $14,
--     seizo_nennomi_flg = $15, seizo_ym_kakuninkonnan_flg = $16, biko = $17, ordr_jn = $18,
--     record_date = now(), record_user = $19, shinki_koushin_sakujo_flg = 1
-- WHERE okyaku_id = $1 AND zumen_id = $2 AND setsubi_id = $3 AND kotai_id = $4 AND daisu_renban = $5;
--
-- EXECUTE update_sr('1234567890', 12345678, 1, 1, 1, 1, 0, '02', 99.99, '12', 99.99, '12', 0, '202502', 0, 0, '更新備考', 1, 'user002');

UPDATE eso_t_c0020_sr
SET
    shinsetsu_flg                 = $6,
    genba_kakuninzumi_meibanto_flg = $7,
    shurui_cd                     = $8,
    tkaku_v                       = $9,
    tkaku_v_cd                    = $10,
    tkaku_kva                     = $11,
    tkaku_kva_cd                  = $12,
    tkaku_kva_kakuninkonnan_flg   = $13,
    seizo_ym                      = $14,
    seizo_nennomi_flg             = $15,
    seizo_ym_kakuninkonnan_flg    = $16,
    biko                          = $17,
    ordr_jn                       = $18,
    record_date                   = now(),
    record_user                   = $19,
    shinki_koushin_sakujo_flg     = 1 -- 1：更新
WHERE
    okyaku_id    = $1
AND zumen_id     = $2
AND setsubi_id   = $3
AND kotai_id     = $4
AND daisu_renban = $5;

