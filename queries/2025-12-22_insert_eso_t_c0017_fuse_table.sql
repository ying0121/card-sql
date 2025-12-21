
-- 2025-12-22_insert_eso_t_c0017_fuse.sql
-- 目的：低圧ヒューズテーブルに挿入
-- 作成日: 2025-12-22
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_fuse AS
-- INSERT INTO eso_t_c0017_fuse (
--     okyaku_id, zumen_id, setsubi_id, kotai_id, daisu_renban,
--     shinsetsu_flg, yoryo, yoryo_cd, fuse_su, biko, ordr_jn,
--     create_user, record_user, shinki_koushin_sakujo_flg
-- ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, 0);
--
-- EXECUTE insert_fuse('1234567890', 12345678, 1, 1, 1, 1, 9999.99, '12', 3, '備考', 1, 'user001', 'user001');

INSERT INTO eso_t_c0017_fuse (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    yoryo,
    yoryo_cd,
    fuse_su,
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
    $7,  -- yoryo
    $8,  -- yoryo_cd
    $9,  -- fuse_su
    $10, -- biko
    $11, -- ordr_jn
    $12, -- create_user
    $13, -- record_user
    0    -- 0：新規
);

