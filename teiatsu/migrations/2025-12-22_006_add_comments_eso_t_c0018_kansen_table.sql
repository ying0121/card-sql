
-- 2025-12-22_006_add_comments_eso_t_c0018_kansen.sql
-- 目的:幹線テーブルにカラムコメントを追加
-- 作成日: 2025-12-22
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0018_kansen.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0018_kansen.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0018_kansen.setsubi_id IS '設備ID';
COMMENT ON COLUMN eso_t_c0018_kansen.kotai_id IS '個体ID';
COMMENT ON COLUMN eso_t_c0018_kansen.daisu_renban IS '台数連番';
COMMENT ON COLUMN eso_t_c0018_kansen.shinsetsu_flg IS '新設フラグ';
COMMENT ON COLUMN eso_t_c0018_kansen.shurui_cd IS '種類';
COMMENT ON COLUMN eso_t_c0018_kansen.haisen_su IS '配線本数';
COMMENT ON COLUMN eso_t_c0018_kansen.biko IS '備考';
COMMENT ON COLUMN eso_t_c0018_kansen.ordr_jn IS '表示順';
COMMENT ON COLUMN eso_t_c0018_kansen.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0018_kansen.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0018_kansen.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0018_kansen.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0018_kansen.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;

