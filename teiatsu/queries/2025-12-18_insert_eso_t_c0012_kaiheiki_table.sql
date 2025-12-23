
-- 2025-12-18_insert_eso_t_c0012_kaiheiki.sql
-- 目的：低圧開閉器(低圧)テーブルに挿入
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_kaiheiki AS
-- INSERT INTO eso_t_c0012_kaiheiki (okyaku_id, zumen_id, setsubi_id, kotai_id, daisu_renban,
--     shinsetsu_flg, genba_kakuninzumi_meibanto_flg, shurui_cd, kyokusu, tkaku_a, tkaku_a_cd,
--     tkaku_a_kakuninkonnan_flg, fuse_kva, fuse_kva_cd, fuse_kva_kakuninkonnan_flg,
--     kando_a, kando_a_cd, kando_a_kakuninkonnan_flg, seizo_ym, seizo_ym_kakuninkonnan_flg,
--     ikisaki, biko, ordr_jn, create_user, record_user, shinki_koushin_sakujo_flg)
-- VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, 0);
--
-- EXECUTE insert_kaiheiki('1234567890', 12345678, 1, 1, 1, 1, 0, '01', 1, 100, '12', 0, 50, '12', 0, 200, '11', 0, '202501', 0, '行先', '備考', 1, 'user001', 'user001');

INSERT INTO eso_t_c0012_kaiheiki (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    genba_kakuninzumi_meibanto_flg,
    shurui_cd,
    kyokusu,
    tkaku_a,
    tkaku_a_cd,
    tkaku_a_kakuninkonnan_flg,
    fuse_kva,
    fuse_kva_cd,
    fuse_kva_kakuninkonnan_flg,
    kando_a,
    kando_a_cd,
    kando_a_kakuninkonnan_flg,
    seizo_ym,
    seizo_ym_kakuninkonnan_flg,
    ikisaki,
    biko,
    ordr_jn,
    create_user,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    $1,   -- okyaku_id
    $2,   -- zumen_id
    $3,   -- setsubi_id
    $4,   -- kotai_id
    $5,   -- daisu_renban
    $6,   -- shinsetsu_flg
    $7,   -- genba_kakuninzumi_meibanto_flg
    $8,   -- shurui_cd
    $9,   -- kyokusu
    $10,  -- tkaku_a
    $11,  -- tkaku_a_cd
    $12,  -- tkaku_a_kakuninkonnan_flg
    $13,  -- fuse_kva
    $14,  -- fuse_kva_cd
    $15,  -- fuse_kva_kakuninkonnan_flg
    $16,  -- kando_a
    $17,  -- kando_a_cd
    $18,  -- kando_a_kakuninkonnan_flg
    $19,  -- seizo_ym
    $20,  -- seizo_ym_kakuninkonnan_flg
    $21,  -- ikisaki
    $22,  -- biko
    $23,  -- ordr_jn
    $24,  -- create_user
    $25,  -- record_user
    0     -- 0：新規
);
