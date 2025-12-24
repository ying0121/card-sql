
-- 2025-12-25_example_functions_usage.sql
-- 目的：テーブル操作の使用例とテストクエリ
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用した操作の例です。
-- 実際のアプリケーションでは、queries/フォルダのパラメータ化クエリを使用してください。

-- ============================================
-- テーブル操作の使用例
-- ============================================

-- ============================================
-- 1. 編集画像テーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-25_insert_eso_t_c0008_file_work_table.sql を使用してください
BEGIN;
INSERT INTO eso_t_c0008_file_work (
    okyaku_id,
    image_id,
    lock_flg,
    image_kbn_su,
    shikibetsu_id,
    zumen_id,
    title_mj,
    ordr_jn,
    file_kbn_mj,
    file_name_mj,
    file_binary_byt,
    create_user,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    '1234567890',
    'image001',
    1,
    1,
    'shiki001',
    12345678,
    'タイトル',
    1,
    'A',
    'file.jpg',
    NULL,
    'user001',
    'user001',
    0
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-25_update_eso_t_c0008_file_work_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0008_file_work
SET
    image_kbn_su                  = 2,
    shikibetsu_id                 = 'shiki002',
    zumen_id                       = 12345679,
    title_mj                       = 'タイトル2',
    ordr_jn                        = 2,
    file_kbn_mj                    = 'B',
    file_name_mj                   = 'file2.jpg',
    file_binary_byt                = NULL,
    record_date                    = now(),
    record_user                    = 'user002',
    shinki_koushin_sakujo_flg     = 1
WHERE
    okyaku_id = '1234567890'
AND image_id  = 'image001'
AND lock_flg  = 1;
COMMIT;

-- DELETE操作の使用例（論理削除）
-- 注意：実際のアプリケーションでは、queries/2025-12-25_delete_eso_t_c0008_file_work_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0008_file_work
SET
    shinki_koushin_sakujo_flg = 2,
    record_date               = now(),
    record_user               = 'user003'
WHERE
    okyaku_id = '1234567890'
AND image_id  = 'image001'
AND lock_flg  = 1;
COMMIT;

-- ============================================
-- 2. 採番テーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-25_insert_eso_t_c0009_numbering_table.sql を使用してください
BEGIN;
INSERT INTO eso_t_c0009_numbering (
    okyaku_id,
    yoto_kbn,
    value_su,
    biko_mj,
    create_user,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    '1234567890',
    '01',
    100,
    '備考',
    'user001',
    'user001',
    0
);
COMMIT;

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-25_update_eso_t_c0009_numbering_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0009_numbering
SET
    value_su                       = 200,
    biko_mj                        = '備考2',
    record_date                    = now(),
    record_user                    = 'user002',
    shinki_koushin_sakujo_flg     = 1
WHERE
    okyaku_id = '1234567890'
AND yoto_kbn  = '01';
COMMIT;

-- DELETE操作の使用例（論理削除）
-- 注意：実際のアプリケーションでは、queries/2025-12-25_delete_eso_t_c0009_numbering_table.sql を使用してください
BEGIN;
UPDATE eso_t_c0009_numbering
SET
    shinki_koushin_sakujo_flg = 2,
    record_date               = now(),
    record_user               = 'user003'
WHERE
    okyaku_id = '1234567890'
AND yoto_kbn  = '01';
COMMIT;

