
-- 2025-12-24_006_add_comments_eso_t_c0006_okyaku_work.sql
-- 目的:ＣＡＤ編集お客様管理テーブルにカラムコメントを追加
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0006_okyaku_work.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.yoto_kbn IS '用途区分';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.user_nm_mj IS 'ユーザー名';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.lock_flg IS 'ロックフラグ';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.edit_flg IS '編集フラグ';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.tenkenjisseki_id IS '点検実績ID';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.json_binary_byt IS '属性ファイルバイナリ';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.zumen_binary_byt IS '図面ファイルバイナリ';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.renkei_mode_su IS '連携モード';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;


