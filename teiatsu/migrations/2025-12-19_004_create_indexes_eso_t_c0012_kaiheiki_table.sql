
-- 2025-12-19_004_create_indexes_eso_t_c0012_kaiheiki.sql
-- 目的：低圧開閉器(低圧)テーブルにインデックスを作成
-- 作成日: 2025-12-19
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0012_kaiheiki_okyaku_zumen_flg_ordr
    ON eso_t_c0012_kaiheiki (okyaku_id, zumen_id, shinki_koushin_sakujo_flg, ordr_jn);

COMMIT;

