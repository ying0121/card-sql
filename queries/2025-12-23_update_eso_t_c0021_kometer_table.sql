
-- 2025-12-23_update_eso_t_c0021_kometer.sql
-- 目的：子メーター更新
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_kometer AS
-- UPDATE eso_t_c0021_kometer SET shinsetsu_flg = $6, genba_kakuninzumi_meibanto_flg = $7, kairo_nm = $8, meter_shurui = $9,
--     haisen_hoshiki = $10, tkaku_v = $11, tkaku_v_cd = $12, tkaku_a = $13, tkaku_a_cd = $14,
--     meter_yuko_ym = $15, meter_yuko_ym_kakuninkonnan_flg = $16, ct_yuko_ym = $17, ct_yuko_ym_kakuninkonnan_flg = $18,
--     seizosha_cd = $19, seizosha_jiyunyuryoku = $20, seizosha_kakuninkonnan_flg = $21,
--     katashiki_cd = $22, katashiki_gaitonashi_flg = $23, katashiki_jiyunyuryoku = $24, katashiki_kakuninkonnan_flg = $25,
--     biko = $26, ordr_jn = $27,
--     record_date = now(), record_user = $28, shinki_koushin_sakujo_flg = 1
-- WHERE okyaku_id = $1 AND zumen_id = $2 AND setsubi_id = $3 AND kotai_id = $4 AND daisu_renban = $5;
--
-- EXECUTE update_kometer('1234567890', 12345678, 1, 1, 1, 1, 0, '更新回路名', '02', '02', '02', '02', '12', '12', '202502', 0, '202502', 0, '0002', '更新製造者自由入力', 0, '0002', 0, '更新型式自由入力', 0, '更新備考', 1, 'user002');

UPDATE eso_t_c0021_kometer
SET
    shinsetsu_flg                 = $6,
    genba_kakuninzumi_meibanto_flg = $7,
    kairo_nm                      = $8,
    meter_shurui                  = $9,
    haisen_hoshiki                = $10,
    tkaku_v                       = $11,
    tkaku_v_cd                    = $12,
    tkaku_a                       = $13,
    tkaku_a_cd                    = $14,
    meter_yuko_ym                 = $15,
    meter_yuko_ym_kakuninkonnan_flg = $16,
    ct_yuko_ym                    = $17,
    ct_yuko_ym_kakuninkonnan_flg  = $18,
    seizosha_cd                   = $19,
    seizosha_jiyunyuryoku          = $20,
    seizosha_kakuninkonnan_flg    = $21,
    katashiki_cd                  = $22,
    katashiki_gaitonashi_flg      = $23,
    katashiki_jiyunyuryoku        = $24,
    katashiki_kakuninkonnan_flg   = $25,
    biko                          = $26,
    ordr_jn                       = $27,
    record_date                   = now(),
    record_user                   = $28,
    shinki_koushin_sakujo_flg     = 1 -- 1：更新
WHERE
    okyaku_id    = $1
AND zumen_id     = $2
AND setsubi_id   = $3
AND kotai_id     = $4
AND daisu_renban = $5;

