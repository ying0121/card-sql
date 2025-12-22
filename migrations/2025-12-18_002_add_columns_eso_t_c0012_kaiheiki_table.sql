
-- 2025-12-18_002_add_columns_eso_t_c0012_kaiheiki.sql
-- 目的：低圧開閉器(低圧)テーブルに追加項目を追加
-- 更新日：2025-12-18
-- 更新者：浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0012_kaiheiki
    ADD COLUMN IF NOT EXISTS genba_kakuninzumi_meibanto_flg     INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS tkaku_a_kakuninkonnan_flg          INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS fuse_kva                           NUMERIC(4),
    ADD COLUMN IF NOT EXISTS fuse_kva_cd                        CHARACTER(2) DEFAULT '12',
    ADD COLUMN IF NOT EXISTS fuse_kva_kakuninkonnan_flg         INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS kando_a_kakuninkonnan_flg          INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS seizo_ym_kakuninkonnan_flg         INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS biko                               VARCHAR(256);

COMMIT;
