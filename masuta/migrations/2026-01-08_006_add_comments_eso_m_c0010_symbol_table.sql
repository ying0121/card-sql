
-- 2026-01-08_006_add_comments_eso_m_c0010_symbol.sql
-- 目的：シンボルマスタテーブルとカラムにコメントを追加
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

COMMENT ON TABLE eso_m_c0010_symbol IS 'シンボルマスタテーブル';

COMMENT ON COLUMN eso_m_c0010_symbol.symbol_id IS 'ID';
COMMENT ON COLUMN eso_m_c0010_symbol.entry_version IS '登録バージョン';
COMMENT ON COLUMN eso_m_c0010_symbol.entry_date IS '登録日';
COMMENT ON COLUMN eso_m_c0010_symbol.entry_user_nm IS '登録ユーザー名称';
COMMENT ON COLUMN eso_m_c0010_symbol.binary_data IS 'ファイルバイナリ';
COMMENT ON COLUMN eso_m_c0010_symbol.create_date IS '作成日';
COMMENT ON COLUMN eso_m_c0010_symbol.create_user IS '作成者';
COMMENT ON COLUMN eso_m_c0010_symbol.record_date IS '更新日';
COMMENT ON COLUMN eso_m_c0010_symbol.record_user IS '更新者';

COMMIT;
