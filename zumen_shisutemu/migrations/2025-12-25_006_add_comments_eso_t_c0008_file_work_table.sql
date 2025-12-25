
-- 2025-12-25_006_add_comments_eso_t_c0008_file_work.sql
-- 目的:編集画像テーブルにカラムコメントを追加
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0008_file_work.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0008_file_work.image_id IS '画像ID';
COMMENT ON COLUMN eso_t_c0008_file_work.lock_flg IS 'ロックフラグ';
COMMENT ON COLUMN eso_t_c0008_file_work.image_kbn_su IS '画像区分';
COMMENT ON COLUMN eso_t_c0008_file_work.shikibetsu_id IS '識別ID';
COMMENT ON COLUMN eso_t_c0008_file_work.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0008_file_work.title_mj IS 'タイトル';
COMMENT ON COLUMN eso_t_c0008_file_work.ordr_jn IS '表示順';
COMMENT ON COLUMN eso_t_c0008_file_work.file_kbn_mj IS 'ファイル区分';
COMMENT ON COLUMN eso_t_c0008_file_work.file_name_mj IS 'ファイル名';
COMMENT ON COLUMN eso_t_c0008_file_work.file_binary_byt IS 'ファイルバイナリ';
COMMENT ON COLUMN eso_t_c0008_file_work.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0008_file_work.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0008_file_work.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0008_file_work.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0008_file_work.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;


