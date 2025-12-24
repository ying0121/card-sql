
-- 2025-12-24_002_add_columns_eso_t_c0005_cad_link.sql
-- 目的：ハイパーリンク管理テーブルに追加項目を追加
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

ALTER TABLE eso_t_c0005_cad_link
    ADD COLUMN IF NOT EXISTS create_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    ADD COLUMN IF NOT EXISTS create_user VARCHAR(100) NOT NULL,
    ADD COLUMN IF NOT EXISTS record_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    ADD COLUMN IF NOT EXISTS record_user VARCHAR(100) NOT NULL,
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;

