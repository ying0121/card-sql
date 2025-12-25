
-- 2025-12-24_006_add_comments_eso_t_c0007_image.sql
-- 目的:画像情報テーブルにカラムコメントを追加
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0007_image.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0007_image.image_id IS '画像ID';
COMMENT ON COLUMN eso_t_c0007_image.image_kbn_su IS '画像区分';
COMMENT ON COLUMN eso_t_c0007_image.shikibetsu_id IS '識別ID';
COMMENT ON COLUMN eso_t_c0007_image.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0007_image.title_mj IS 'タイトル';
COMMENT ON COLUMN eso_t_c0007_image.ordr_jn IS '表示順';
COMMENT ON COLUMN eso_t_c0007_image.file_name_mj IS 'ファイル名';
COMMENT ON COLUMN eso_t_c0007_image.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0007_image.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0007_image.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0007_image.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0007_image.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;


