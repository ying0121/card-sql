
-- 2025-12-19_006_add_comments_eso_t_c0014_bundenban.sql
-- 目的:分電盤テーブルにカラムコメントを追加
-- 作成日: 2025-12-19
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0014_bundenban.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0014_bundenban.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0014_bundenban.setsubi_id IS '設備ID';
COMMENT ON COLUMN eso_t_c0014_bundenban.kotai_id IS '個体ID';
COMMENT ON COLUMN eso_t_c0014_bundenban.daisu_renban IS '台数連番';
COMMENT ON COLUMN eso_t_c0014_bundenban.shinsetsu_flg IS '新設フラグ';
COMMENT ON COLUMN eso_t_c0014_bundenban.shurui_cd IS '種類';
COMMENT ON COLUMN eso_t_c0014_bundenban.waku_nm IS '枠名称';
COMMENT ON COLUMN eso_t_c0014_bundenban.biko IS '備考';
COMMENT ON COLUMN eso_t_c0014_bundenban.ordr_jn IS '表示順';
COMMENT ON COLUMN eso_t_c0014_bundenban.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0014_bundenban.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0014_bundenban.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0014_bundenban.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0014_bundenban.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;

