
-- 2025-12-19_006_add_comments_eso_t_c0016_ct.sql
-- 目的:低圧変流器テーブルにカラムコメントを追加
-- 作成日: 2025-12-19
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0016_ct.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0016_ct.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0016_ct.setsubi_id IS '設備ID';
COMMENT ON COLUMN eso_t_c0016_ct.kotai_id IS '個体ID';
COMMENT ON COLUMN eso_t_c0016_ct.daisu_renban IS '台数連番';
COMMENT ON COLUMN eso_t_c0016_ct.shinsetsu_flg IS '新設フラグ';
COMMENT ON COLUMN eso_t_c0016_ct.tkaku_v IS '定格電圧';
COMMENT ON COLUMN eso_t_c0016_ct.tkaku_v_cd IS '定格電圧単位';
COMMENT ON COLUMN eso_t_c0016_ct.tkaku_1ji_a IS '定格１次電流';
COMMENT ON COLUMN eso_t_c0016_ct.tkaku_1ji_a_cd IS '定格１次電流単位';
COMMENT ON COLUMN eso_t_c0016_ct.tkaku_2ji_a IS '定格２次電流';
COMMENT ON COLUMN eso_t_c0016_ct.tkaku_2ji_a_cd IS '定格２次電流単位';
COMMENT ON COLUMN eso_t_c0016_ct.biko IS '備考';
COMMENT ON COLUMN eso_t_c0016_ct.ordr_jn IS '表示順';
COMMENT ON COLUMN eso_t_c0016_ct.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0016_ct.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0016_ct.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0016_ct.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0016_ct.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;

