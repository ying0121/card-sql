
-- 2025-12-25_insert_eso_t_c0009_numbering.sql
-- 目的：採番テーブルに挿入
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE insert_numbering AS
-- INSERT INTO eso_t_c0009_numbering (
--     okyaku_id, yoto_kbn, value_su, biko_mj,
--     create_user, record_user, shinki_koushin_sakujo_flg
-- ) VALUES ($1, $2, $3, $4, $5, $6, 0);
--
-- EXECUTE insert_numbering('1234567890', '01', 100, '備考', 'user001', 'user001');

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
    $1,  -- okyaku_id
    $2,  -- yoto_kbn
    $3,  -- value_su
    $4,  -- biko_mj
    $5,  -- create_user
    $6,  -- record_user
    0    -- 0：新規
);


