
-- 2025-12-26_006_add_comments_eso_m_c0001_cdmast.sql
-- 目的：コードマスタテーブルとカラムにコメントを追加
-- 作成日: 2025-12-26
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0001_cdmast IS 'コードマスタテーブル';

COMMENT ON COLUMN eso_m_c0001_cdmast.daibunrui_cd IS '大分類コード';
COMMENT ON COLUMN eso_m_c0001_cdmast.shobunrui_cd IS '小分類コード';
COMMENT ON COLUMN eso_m_c0001_cdmast.group_cd IS 'グループコード';
COMMENT ON COLUMN eso_m_c0001_cdmast.ordr_jn IS '表示順';
COMMENT ON COLUMN eso_m_c0001_cdmast.meisyou1 IS '名称１';
COMMENT ON COLUMN eso_m_c0001_cdmast.meisyou2 IS '名称２';
COMMENT ON COLUMN eso_m_c0001_cdmast.value1 IS '値１';
COMMENT ON COLUMN eso_m_c0001_cdmast.value2 IS '値２';
COMMENT ON COLUMN eso_m_c0001_cdmast.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0001_cdmast.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0001_cdmast.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0001_cdmast.record_user IS '更新者';

COMMIT;

