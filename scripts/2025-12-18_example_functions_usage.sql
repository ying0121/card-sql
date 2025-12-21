
-- 2025-12-18_example_functions_usage.sql
-- 目的：テーブル操作の使用例とテストクエリ
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 注意：このファイルは実際のテーブルを使用した操作の例です。
-- 実際のアプリケーションでは、queries/フォルダのパラメータ化クエリを使用してください。

-- ============================================
-- テーブル操作の使用例
-- ============================================

-- ============================================
-- 1. 計器類テーブル操作の使用例
-- ============================================

-- INSERT操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-18_insert_eso_t_c0011_keiki_table.sql を使用してください
INSERT INTO eso_t_c0011_keiki (
    okyaku_id,
    zumen_id,
    setsubi_id,
    kotai_id,
    daisu_renban,
    shinsetsu_flg,
    shurui_cd,
    tkaku_v,
    tkaku_v_cd,
    tkaku_a,
    tkaku_a_cd,
    seizo_ym,
    biko,
    ordr_jn,
    create_user,
    record_user,
    shinki_koushin_sakujo_flg
)
VALUES (
    '1234567890',
    12345678,
    1,
    1,
    1,
    1,
    '01',
    99.99,  -- NUMERIC(4, 2) の最大値
    '01',
    50.00,  -- NUMERIC(4, 2) の範囲内
    '12',
    '202501',
    '備考',
    1,
    'user001',
    'user001',
    0
);

-- UPDATE操作の使用例
-- 注意：実際のアプリケーションでは、queries/2025-12-18_update_eso_t_c0011_keiki_table.sql を使用してください
UPDATE eso_t_c0011_keiki
SET
    shinsetsu_flg             = 1,
    shurui_cd                 = '02',
    tkaku_v                   = 99.99,  -- NUMERIC(4, 2) の最大値
    tkaku_v_cd                = '01',
    tkaku_a                   = 99.99,  -- NUMERIC(4, 2) の最大値
    tkaku_a_cd                = '12',
    seizo_ym                  = '202502',
    biko                      = '更新備考',
    ordr_jn                   = 1,
    record_date               = now(),
    record_user               = 'user002',
    shinki_koushin_sakujo_flg = 1
WHERE
    okyaku_id    = '1234567890'
AND zumen_id     = 12345678
AND setsubi_id   = 1
AND kotai_id     = 1
AND daisu_renban = 1;

-- DELETE操作の使用例（論理削除）
-- 注意：実際のアプリケーションでは、queries/2025-12-18_delete_eso_t_c0011_keiki_table.sql を使用してください
UPDATE eso_t_c0011_keiki
SET
    shinki_koushin_sakujo_flg = 2,
    record_date               = now(),
    record_user               = 'user003'
WHERE
    okyaku_id    = '1234567890'
AND zumen_id     = 12345678
AND setsubi_id   = 1
AND kotai_id     = 1
AND daisu_renban = 1;

