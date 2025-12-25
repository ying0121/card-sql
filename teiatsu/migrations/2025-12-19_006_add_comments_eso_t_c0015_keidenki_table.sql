
-- 2025-12-19_006_add_comments_eso_t_c0015_keidenki.sql
-- 目的:計電器テーブルにカラムコメントを追加
-- 作成日: 2025-12-19
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0015_keidenki.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0015_keidenki.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0015_keidenki.setsubi_id IS '設備ID';
COMMENT ON COLUMN eso_t_c0015_keidenki.kotai_id IS '個体ID';
COMMENT ON COLUMN eso_t_c0015_keidenki.daisu_renban IS '台数連番';
COMMENT ON COLUMN eso_t_c0015_keidenki.shinsetsu_flg IS '新設フラグ';
COMMENT ON COLUMN eso_t_c0015_keidenki.shurui_cd IS '種類';
COMMENT ON COLUMN eso_t_c0015_keidenki.biko IS '備考';
COMMENT ON COLUMN eso_t_c0015_keidenki.ordr_jn IS '表示順';
COMMENT ON COLUMN eso_t_c0015_keidenki.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0015_keidenki.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0015_keidenki.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0015_keidenki.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0015_keidenki.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;

