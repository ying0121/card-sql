
-- 2025-12-19_insert_eso_t_c0016_ct.sql
-- 目的：低圧変流器テーブルに挿入
-- 作成日: 2025-12-19
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_ct AS
-- INSERT INTO eso_t_c0016_ct (okyaku_id, zumen_id, setsubi_id, kotai_id, daisu_renban,
--     shinsetsu_flg, tkaku_v, tkaku_v_cd, tkaku_1ji_a, tkaku_1ji_a_cd, tkaku_2ji_a, tkaku_2ji_a_cd,
--     kantsu_su, biko, ordr_jn, create_date, create_user, record_date, record_user, shinki_koushin_sakujo_flg)
-- VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, now(), $16, now(), $17, 0)
-- RETURNING okyaku_id, zumen_id, setsubi_id, kotai_id, daisu_renban;
--
-- EXECUTE insert_ct('1234567890', 12345678, 1, 1, 1, 1, 200.00, '01', 50.00, '01', 100.00, '12', 2, '備考', 1, 'user001', 'user001');

INSERT INTO eso_t_c0016_ct (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    tkaku_v,
    tkaku_v_cd,
    tkaku_1ji_a,
    tkaku_1ji_a_cd,
    tkaku_2ji_a,
    tkaku_2ji_a_cd,
    kantsu_su,
    biko,
    ordr_jn,
    create_date,
    create_user,
    record_date,
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
    $7,  -- tkaku_v
    $8,  -- tkaku_v_cd
    $9,  -- tkaku_1ji_a
    $10, -- tkaku_1ji_a_cd
    $11, -- tkaku_2ji_a
    $12, -- tkaku_2ji_a_cd
    $13, -- kantsu_su
    $14, -- biko
    $15, -- ordr_jn
    now(), -- create_date
    $16, -- create_user
    now(), -- record_date
    $17, -- record_user
    0    -- 0：新規
)
RETURNING
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban;

