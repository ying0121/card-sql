
-- 2025-12-25_004_create_indexes_eso_t_c0009_numbering.sql
-- 目的：採番テーブルにインデックスを作成
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0009_numbering_okyaku_flg
    ON eso_t_c0009_numbering (okyaku_id, shinki_koushin_sakujo_flg);

COMMIT;


