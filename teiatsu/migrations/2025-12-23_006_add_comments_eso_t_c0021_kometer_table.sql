
-- 2025-12-23_006_add_comments_eso_t_c0021_kometer.sql
-- 目的:子メーターテーブルにカラムコメントを追加
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0021_kometer.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0021_kometer.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0021_kometer.setsubi_id IS '設備ID';
COMMENT ON COLUMN eso_t_c0021_kometer.kotai_id IS '個体ID';
COMMENT ON COLUMN eso_t_c0021_kometer.daisu_renban IS '台数連番';
COMMENT ON COLUMN eso_t_c0021_kometer.shinsetsu_flg IS '新設フラグ';
COMMENT ON COLUMN eso_t_c0021_kometer.genba_kakuninzumi_meibanto_flg IS '現場確認済（銘板等）フラグ';
COMMENT ON COLUMN eso_t_c0021_kometer.kairo_nm IS '回路名';
COMMENT ON COLUMN eso_t_c0021_kometer.meter_shurui IS 'メーター種類';
COMMENT ON COLUMN eso_t_c0021_kometer.haisen_hoshiki IS '配線方式';
COMMENT ON COLUMN eso_t_c0021_kometer.tkaku_v IS '定格電圧';
COMMENT ON COLUMN eso_t_c0021_kometer.tkaku_v_cd IS '定格電圧単位';
COMMENT ON COLUMN eso_t_c0021_kometer.tkaku_a IS '定格電流';
COMMENT ON COLUMN eso_t_c0021_kometer.tkaku_a_cd IS '定格電流単位';
COMMENT ON COLUMN eso_t_c0021_kometer.meter_yuko_ym IS 'メーター有効期限';
COMMENT ON COLUMN eso_t_c0021_kometer.meter_yuko_ym_kakuninkonnan_flg IS 'メーター有効期限確認困難フラグ';
COMMENT ON COLUMN eso_t_c0021_kometer.ct_yuko_ym IS 'CT有効期限';
COMMENT ON COLUMN eso_t_c0021_kometer.ct_yuko_ym_kakuninkonnan_flg IS 'CT有効期限確認困難フラグ';
COMMENT ON COLUMN eso_t_c0021_kometer.seizosha_cd IS '製造者CD';
COMMENT ON COLUMN eso_t_c0021_kometer.seizosha_jiyunyuryoku IS '製造者自由入力';
COMMENT ON COLUMN eso_t_c0021_kometer.seizosha_kakuninkonnan_flg IS '製造者確認困難フラグ';
COMMENT ON COLUMN eso_t_c0021_kometer.katashiki_cd IS '型式CD';
COMMENT ON COLUMN eso_t_c0021_kometer.katashiki_gaitonashi_flg IS '型式該当無フラグ';
COMMENT ON COLUMN eso_t_c0021_kometer.katashiki_jiyunyuryoku IS '型式自由入力';
COMMENT ON COLUMN eso_t_c0021_kometer.katashiki_kakuninkonnan_flg IS '型式確認困難フラグ';
COMMENT ON COLUMN eso_t_c0021_kometer.biko IS '備考';
COMMENT ON COLUMN eso_t_c0021_kometer.ordr_jn IS '表示順';
COMMENT ON COLUMN eso_t_c0021_kometer.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0021_kometer.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0021_kometer.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0021_kometer.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0021_kometer.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;

