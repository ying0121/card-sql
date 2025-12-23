
-- 2025-12-18_update_eso_t_c0012_kaiheiki.sql
-- 目的：低圧開閉器(低圧)テーブル更新
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_kaiheiki AS
-- UPDATE eso_t_c0012_kaiheiki SET shinsetsu_flg = $6, genba_kakuninzumi_meibanto_flg = $7,
--     shurui_cd = $8, kyokusu = $9, tkaku_a = $10, fuse_kva = $11, kando_a = $12,
--     seizo_ym = $13, ikisaki = $14, biko = $15, ordr_jn = $16, record_date = now(),
--     record_user = $17, shinki_koushin_sakujo_flg = 1
-- WHERE okyaku_id = $1 AND zumen_id = $2 AND setsubi_id = $3 AND kotai_id = $4 AND daisu_renban = $5;
--
-- EXECUTE update_kaiheiki('1234567890', 12345678, 1, 1, 1, 1, 0, '02', 1, 100, 50, 200, '202502', '行先', '更新備考', 1, 'user002');

UPDATE eso_t_c0012_kaiheiki
SET
    shinsetsu_flg =                  $6,
    genba_kakuninzumi_meibanto_flg = $7,
    shurui_cd =                      $8,
    kyokusu =                        $9,
    tkaku_a =                        $10,
    fuse_kva =                       $11,
    kando_a =                        $12,
    seizo_ym =                       $13,
    ikisaki =                        $14,
    biko =                           $15,
    ordr_jn =                        $16,
    record_date =                    now(),
    record_user =                    $17,
    shinki_koushin_sakujo_flg =      1 -- 1：更新
WHERE
    okyaku_id =     $1
AND zumen_id =      $2
AND setsubi_id =    $3
AND kotai_id =      $4
AND daisu_renban =  $5;
