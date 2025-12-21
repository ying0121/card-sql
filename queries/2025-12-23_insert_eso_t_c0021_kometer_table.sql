
-- 2025-12-23_insert_eso_t_c0021_kometer.sql
-- 目的：子メーターテーブルに挿入
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_kometer AS
-- INSERT INTO eso_t_c0021_kometer (
--     okyaku_id, zumen_id, setsubi_id, kotai_id, daisu_renban,
--     shinsetsu_flg, genba_kakuninzumi_meibanto_flg, kairo_nm, meter_shurui,
--     haisen_hoshiki, tkaku_v, tkaku_v_cd, tkaku_a, tkaku_a_cd,
--     meter_yuko_ym, meter_yuko_ym_kakuninkonnan_flg, ct_yuko_ym, ct_yuko_ym_kakuninkonnan_flg,
--     seizosha_cd, seizosha_jiyunyuryoku, seizosha_kakuninkonnan_flg,
--     katashiki_cd, katashiki_gaitonashi_flg, katashiki_jiyunyuryoku, katashiki_kakuninkonnan_flg,
--     biko, ordr_jn, create_user, record_user, shinki_koushin_sakujo_flg
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, 0);
--
-- EXECUTE insert_kometer('1234567890', 12345678, 1, 1, 1, 1, 0, '回路名', '01', '01', '01', '01', '12', '12', '202501', 0, '202501', 0, '0001', '製造者自由入力', 0, '0001', 0, '型式自由入力', 0, '備考', 1, 'user001', 'user001');

INSERT INTO eso_t_c0021_kometer (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    genba_kakuninzumi_meibanto_flg,
    kairo_nm,
    meter_shurui,
    haisen_hoshiki,
    tkaku_v,
    tkaku_v_cd,
    tkaku_a,
    tkaku_a_cd,
    meter_yuko_ym,
    meter_yuko_ym_kakuninkonnan_flg,
    ct_yuko_ym,
    ct_yuko_ym_kakuninkonnan_flg,
    seizosha_cd,
    seizosha_jiyunyuryoku,
    seizosha_kakuninkonnan_flg,
    katashiki_cd,
    katashiki_gaitonashi_flg,
    katashiki_jiyunyuryoku,
    katashiki_kakuninkonnan_flg,
    biko,
    ordr_jn,
    create_user,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    $1,  -- okyaku_id
    $2,  -- zumen_id
    $3,  -- setsubi_id
    $4,  -- kotai_id
    $5,  -- daisu_renban
    $6,  -- shinsetsu_flg
    $7,  -- genba_kakuninzumi_meibanto_flg
    $8,  -- kairo_nm
    $9,  -- meter_shurui
    $10, -- haisen_hoshiki
    $11, -- tkaku_v
    $12, -- tkaku_v_cd
    $13, -- tkaku_a
    $14, -- tkaku_a_cd
    $15, -- meter_yuko_ym
    $16, -- meter_yuko_ym_kakuninkonnan_flg
    $17, -- ct_yuko_ym
    $18, -- ct_yuko_ym_kakuninkonnan_flg
    $19, -- seizosha_cd
    $20, -- seizosha_jiyunyuryoku
    $21, -- seizosha_kakuninkonnan_flg
    $22, -- katashiki_cd
    $23, -- katashiki_gaitonashi_flg
    $24, -- katashiki_jiyunyuryoku
    $25, -- katashiki_kakuninkonnan_flg
    $26, -- biko
    $27, -- ordr_jn
    $28, -- create_user
    $29, -- record_user
    0    -- 0：新規
);

