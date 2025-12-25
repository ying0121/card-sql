
-- 2025-12-18_006_add_comments_eso_t_c0011_keiki.sql
-- 目的:計器類テーブルにカラムコメントを追加
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0011_keiki.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0011_keiki.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0011_keiki.setsubi_id IS '設備ID';
COMMENT ON COLUMN eso_t_c0011_keiki.kotai_id IS '個体ID';
COMMENT ON COLUMN eso_t_c0011_keiki.daisu_renban IS '台数連番';
COMMENT ON COLUMN eso_t_c0011_keiki.shinsetsu_flg IS '新設フラグ';
COMMENT ON COLUMN eso_t_c0011_keiki.shurui_cd IS '種類';
COMMENT ON COLUMN eso_t_c0011_keiki.tkaku_v IS '定格電圧';
COMMENT ON COLUMN eso_t_c0011_keiki.tkaku_v_cd IS '定格電圧単位';
COMMENT ON COLUMN eso_t_c0011_keiki.tkaku_a IS '定格電流';
COMMENT ON COLUMN eso_t_c0011_keiki.tkaku_a_cd IS '定格電流単位';
COMMENT ON COLUMN eso_t_c0011_keiki.seizo_ym IS '製造年月';
COMMENT ON COLUMN eso_t_c0011_keiki.biko IS '備考';
COMMENT ON COLUMN eso_t_c0011_keiki.ordr_jn IS '表示順';
COMMENT ON COLUMN eso_t_c0011_keiki.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0011_keiki.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0011_keiki.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0011_keiki.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0011_keiki.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;

