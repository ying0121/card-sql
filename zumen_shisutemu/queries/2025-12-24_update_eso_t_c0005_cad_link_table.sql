
-- 2025-12-24_update_eso_t_c0005_cad_link.sql
-- 目的：ハイパーリンク管理更新
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE update_cad_link AS
-- UPDATE eso_t_c0005_cad_link SET saki_title_mj = $6, saki_name_mj = $7, saki_setsubi_id = $8,
--     saki_shubetsu_mj = $9, moto_zumen_han_su = $10, saki_zumen_han_su = $11,
--     saki_zumen_shubetsu_su = $12, record_date = now(), record_user = $13, shinki_koushin_sakujo_flg = 1
-- WHERE okyaku_id = $1 AND link_moto_id = $2 AND moto_zumen_id = $3 AND link_saki_id = $4 AND saki_zumen_id = $5;
--
-- EXECUTE update_cad_link('1234567890', 1, 12345678, 2, 12345679, '更新タイトル', '更新名称', 2, '0002', 2, 2, 2, 'user002');

UPDATE eso_t_c0005_cad_link
SET
    saki_title_mj                  = $6,
    saki_name_mj                   = $7,
    saki_setsubi_id                = $8,
    saki_shubetsu_mj               = $9,
    moto_zumen_han_su              = $10,
    saki_zumen_han_su              = $11,
    saki_zumen_shubetsu_su         = $12,
    record_date                    = now(),
    record_user                    = $13,
    shinki_koushin_sakujo_flg      = 1 -- 1：更新
WHERE
    okyaku_id      = $1
AND link_moto_id   = $2
AND moto_zumen_id  = $3
AND link_saki_id   = $4
AND saki_zumen_id  = $5;

