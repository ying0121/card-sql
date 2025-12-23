
-- 2025-12-22_update_eso_t_c0017_fuse.sql
-- 目的：低圧ヒューズ更新
-- 作成日: 2025-12-22
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_fuse AS
-- UPDATE eso_t_c0017_fuse SET shinsetsu_flg = $6, yoryo = $7, yoryo_cd = $8,
--     fuse_su = $9, biko = $10, ordr_jn = $11,
--     record_date = now(), record_user = $12, shinki_koushin_sakujo_flg = 1
-- WHERE okyaku_id = $1 AND zumen_id = $2 AND setsubi_id = $3 AND kotai_id = $4 AND daisu_renban = $5;
--
-- EXECUTE update_fuse('1234567890', 12345678, 1, 1, 1, 1, 9999.99, '12', 3, '更新備考', 1, 'user002');

UPDATE eso_t_c0017_fuse
SET
    shinsetsu_flg             = $6,
    yoryo                     = $7,
    yoryo_cd                  = $8,
    fuse_su                   = $9,
    biko                      = $10,
    ordr_jn                   = $11,
    record_date               = now(),
    record_user               = $12,
    shinki_koushin_sakujo_flg = 1 -- 1：更新
WHERE
    okyaku_id    = $1
AND zumen_id     = $2
AND setsubi_id   = $3
AND kotai_id     = $4
AND daisu_renban = $5;

