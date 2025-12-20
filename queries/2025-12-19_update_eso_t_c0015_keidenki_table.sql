
-- 2025-12-19_update_eso_t_c0015_keidenki.sql
-- 目的：計電器更新
-- 作成日: 2025-12-19
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_keidenki AS
-- UPDATE eso_t_c0015_keidenki SET shinsetsu_flg = $6, shurui_cd = $7, biko = $8, ordr_jn = $9,
--     record_date = now(), record_user = $10, shinki_koushin_sakujo_flg = 1
-- WHERE okyaku_id = $1 AND zumen_id = $2 AND setsubi_id = $3 AND kotai_id = $4 AND daisu_renban = $5
-- RETURNING okyaku_id, zumen_id, setsubi_id, kotai_id, daisu_renban;
--
-- EXECUTE update_keidenki('1234567890', 12345678, 1, 1, 1, 1, '02', '更新備考', 1, 'user002');

UPDATE eso_t_c0015_keidenki
SET
    shinsetsu_flg             = $6,
    shurui_cd                 = $7,
    biko                      = $8,
    ordr_jn                   = $9,
    record_date               = now(),
    record_user               = $10,
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

