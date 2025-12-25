
-- 2025-12-23_006_add_comments_eso_t_c0020_sr.sql
-- 目的:低圧リアクトルテーブルにカラムコメントを追加
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0020_sr.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0020_sr.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0020_sr.setsubi_id IS '設備ID';
COMMENT ON COLUMN eso_t_c0020_sr.kotai_id IS '個体ID';
COMMENT ON COLUMN eso_t_c0020_sr.daisu_renban IS '台数連番';
COMMENT ON COLUMN eso_t_c0020_sr.shinsetsu_flg IS '新設フラグ';
COMMENT ON COLUMN eso_t_c0020_sr.genba_kakuninzumi_meibanto_flg IS '現場確認済（銘板等）フラグ';
COMMENT ON COLUMN eso_t_c0020_sr.shurui_cd IS '種類';
COMMENT ON COLUMN eso_t_c0020_sr.tkaku_v IS '定格電圧';
COMMENT ON COLUMN eso_t_c0020_sr.tkaku_v_cd IS '定格電圧単位';
COMMENT ON COLUMN eso_t_c0020_sr.tkaku_kva IS '定格容量';
COMMENT ON COLUMN eso_t_c0020_sr.tkaku_kva_cd IS '定格容量単位';
COMMENT ON COLUMN eso_t_c0020_sr.tkaku_kva_kakuninkonnan_flg IS '定格容量確認困難フラグ';
COMMENT ON COLUMN eso_t_c0020_sr.seizo_ym IS '製造年月';
COMMENT ON COLUMN eso_t_c0020_sr.seizo_nennomi_flg IS '製造年のみ入力フラグ';
COMMENT ON COLUMN eso_t_c0020_sr.seizo_ym_kakuninkonnan_flg IS '製造年月確認困難フラグ';
COMMENT ON COLUMN eso_t_c0020_sr.biko IS '備考';
COMMENT ON COLUMN eso_t_c0020_sr.ordr_jn IS '表示順';
COMMENT ON COLUMN eso_t_c0020_sr.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0020_sr.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0020_sr.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0020_sr.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0020_sr.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;

