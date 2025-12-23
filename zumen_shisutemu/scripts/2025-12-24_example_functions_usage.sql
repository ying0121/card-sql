
-- 2025-12-24_example_functions_usage.sql
-- 目的：テーブル操作の使用例とテストクエリ
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用した操作の例です。
-- 実際のアプリケーションでは、queries/フォルダのパラメータ化クエリを使用してください。

-- ============================================
-- テーブル操作の使用例
-- ============================================

-- ============================================
-- 1. ハイパーリンク管理テーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-24_insert_eso_t_c0005_cad_link_table.sql を使用してください
BEGIN;
INSERT INTO eso_t_c0005_cad_link (
    okyaku_id,
    link_moto_id,
    moto_zumen_id,
    link_saki_id,
    saki_zumen_id,
    saki_title_mj,
    saki_name_mj,
    saki_setsubi_id,
    saki_shubetsu_mj,
    moto_zumen_han_su,
    saki_zumen_han_su,
    saki_zumen_shubetsu_su,
    create_user,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    '1234567890',
    1,
    12345678,
    2,
    12345679,
    'タイトル',
    '名称',
    1,
    '0001',
    1,
    1,
    1,
    'user001',
    'user001',
    0
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-24_update_eso_t_c0005_cad_link_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0005_cad_link
SET
    saki_title_mj                  = '更新タイトル',
    saki_name_mj                   = '更新名称',
    saki_setsubi_id                = 2,
    saki_shubetsu_mj               = '0002',
    moto_zumen_han_su              = 2,
    saki_zumen_han_su              = 2,
    saki_zumen_shubetsu_su         = 2,
    record_date                    = now(),
    record_user                    = 'user002',
    shinki_koushin_sakujo_flg      = 1
WHERE
    okyaku_id      = '1234567890'
AND link_moto_id   = 1
AND moto_zumen_id  = 12345678
AND link_saki_id   = 2
AND saki_zumen_id  = 12345679;
COMMIT;

-- DELETE操作の使用例（論理削除）
-- 注意：実際のアプリケーションでは、queries/2025-12-24_delete_eso_t_c0005_cad_link_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0005_cad_link
SET
    shinki_koushin_sakujo_flg = 2,
    record_date               = now(),
    record_user               = 'user003'
WHERE
    okyaku_id      = '1234567890'
AND link_moto_id   = 1
AND moto_zumen_id  = 12345678
AND link_saki_id   = 2
AND saki_zumen_id  = 12345679;
COMMIT;

-- ============================================
-- 2. ＣＡＤ編集お客様管理テーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-24_insert_eso_t_c0006_okyaku_work_table.sql を使用してください
BEGIN;
INSERT INTO eso_t_c0006_okyaku_work (
    okyaku_id,
    yoto_kbn,
    user_nm_mj,
    lock_flg,
    edit_flg,
    tenkenjisseki_id,
    json_binary_byt,
    zumen_binary_byt,
    renkei_mode_su,
    create_user,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    '1234567890',
    '01',
    'ユーザー名',
    1,
    1,
    '1234567890',
    NULL,
    NULL,
    1,
    'user001',
    'user001',
    0
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-24_update_eso_t_c0006_okyaku_work_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0006_okyaku_work
SET
    edit_flg                       = 2,
    tenkenjisseki_id              = '1234567891',
    json_binary_byt               = NULL,
    zumen_binary_byt              = NULL,
    renkei_mode_su                = 2,
    record_date                   = now(),
    record_user                   = 'user002',
    shinki_koushin_sakujo_flg     = 1
WHERE
    okyaku_id = '1234567890'
AND yoto_kbn  = '01'
AND user_nm_mj = 'ユーザー名'
AND lock_flg  = 1;
COMMIT;

-- DELETE操作の使用例（論理削除）
-- 注意：実際のアプリケーションでは、queries/2025-12-24_delete_eso_t_c0006_okyaku_work_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0006_okyaku_work
SET
    shinki_koushin_sakujo_flg = 2,
    record_date               = now(),
    record_user               = 'user003'
WHERE
    okyaku_id = '1234567890'
AND yoto_kbn  = '01'
AND user_nm_mj = 'ユーザー名'
AND lock_flg  = 1;
COMMIT;

