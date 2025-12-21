
-- 2025-12-22_insert_eso_t_c0019_sc.sql
-- 目的：低圧コンデンサテーブルに挿入
-- 作成日: 2025-12-22
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_sc AS
-- INSERT INTO eso_t_c0019_sc (
--     okyaku_id, zumen_id, setsubi_id, kotai_id, daisu_renban,
--     shinsetsu_flg, genba_kakuninzumi_meibanto_flg, tkaku_v, tkaku_v_cd,
--     tkaku_kva, tkaku_kva_cd, tkaku_kva_kakuninkonnan_flg, seizo_ym,
--     seizo_nennomi_flg, seizo_ym_kakuninkonnan_flg, biko, ordr_jn,
--     create_user, record_user, shinki_koushin_sakujo_flg
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, 0);
--
-- EXECUTE insert_sc('1234567890', 12345678, 1, 1, 1, 1, 0, 99.99, '12', 99.99, '12', 0, '202501', 0, 0, '備考', 1, 'user001', 'user001');

INSERT INTO eso_t_c0019_sc (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    genba_kakuninzumi_meibanto_flg,
    tkaku_v,
    tkaku_v_cd,
    tkaku_kva,
    tkaku_kva_cd,
    tkaku_kva_kakuninkonnan_flg,
    seizo_ym,
    seizo_nennomi_flg,
    seizo_ym_kakuninkonnan_flg,
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
    $8,  -- tkaku_v
    $9,  -- tkaku_v_cd
    $10, -- tkaku_kva
    $11, -- tkaku_kva_cd
    $12, -- tkaku_kva_kakuninkonnan_flg
    $13, -- seizo_ym
    $14, -- seizo_nennomi_flg
    $15, -- seizo_ym_kakuninkonnan_flg
    $16, -- biko
    $17, -- ordr_jn
    $18, -- create_user
    $19, -- record_user
    0    -- 0：新規
);

