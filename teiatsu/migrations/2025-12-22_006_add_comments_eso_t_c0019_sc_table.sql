
-- 2025-12-22_006_add_comments_eso_t_c0019_sc.sql
-- 目的:低圧コンデンサテーブルにカラムコメントを追加
-- 作成日: 2025-12-22
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0019_sc.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0019_sc.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0019_sc.setsubi_id IS '設備ID';
COMMENT ON COLUMN eso_t_c0019_sc.kotai_id IS '個体ID';
COMMENT ON COLUMN eso_t_c0019_sc.daisu_renban IS '台数連番';
COMMENT ON COLUMN eso_t_c0019_sc.shinsetsu_flg IS '新設フラグ';
COMMENT ON COLUMN eso_t_c0019_sc.genba_kakuninzumi_meibanto_flg IS '現場確認済（銘板等）フラグ';
COMMENT ON COLUMN eso_t_c0019_sc.tkaku_v IS '定格電圧';
COMMENT ON COLUMN eso_t_c0019_sc.tkaku_v_cd IS '定格電圧単位';
COMMENT ON COLUMN eso_t_c0019_sc.tkaku_kva IS '定格容量';
COMMENT ON COLUMN eso_t_c0019_sc.tkaku_kva_cd IS '定格容量単位';
COMMENT ON COLUMN eso_t_c0019_sc.tkaku_kva_kakuninkonnan_flg IS '定格容量確認困難フラグ';
COMMENT ON COLUMN eso_t_c0019_sc.seizo_ym IS '製造年月';
COMMENT ON COLUMN eso_t_c0019_sc.seizo_nennomi_flg IS '製造年のみ入力フラグ';
COMMENT ON COLUMN eso_t_c0019_sc.seizo_ym_kakuninkonnan_flg IS '製造年月確認困難フラグ';
COMMENT ON COLUMN eso_t_c0019_sc.biko IS '備考';
COMMENT ON COLUMN eso_t_c0019_sc.ordr_jn IS '表示順';
COMMENT ON COLUMN eso_t_c0019_sc.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0019_sc.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0019_sc.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0019_sc.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0019_sc.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;

