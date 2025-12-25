
-- 2025-12-18_006_add_comments_eso_t_c0013_cable.sql
-- 目的:低圧ケーブル管理テーブルにカラムコメントを追加
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0013_cable.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0013_cable.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0013_cable.setsubi_id IS '設備ID';
COMMENT ON COLUMN eso_t_c0013_cable.kotai_id IS '個体ID';
COMMENT ON COLUMN eso_t_c0013_cable.daisu_renban IS '台数連番';
COMMENT ON COLUMN eso_t_c0013_cable.shinsetsu_flg IS '新設フラグ';
COMMENT ON COLUMN eso_t_c0013_cable.shurui_cd IS '種類';
COMMENT ON COLUMN eso_t_c0013_cable.biko IS '備考';
COMMENT ON COLUMN eso_t_c0013_cable.ordr_jn IS '表示順';
COMMENT ON COLUMN eso_t_c0013_cable.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0013_cable.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0013_cable.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0013_cable.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0013_cable.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;

