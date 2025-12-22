
-- 2025-12-23_006_add_comments_eso_t_c0021_kometer.sql
-- 目的:子メーターテーブルにカラムコメントを追加
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0021_kometer.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0021_kometer.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0021_kometer.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0021_kometer.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0021_kometer.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0021_kometer.genba_kakuninzumi_meibanto_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0021_kometer.meter_shurui IS 'コードマスタ 580001';
COMMENT ON COLUMN eso_t_c0021_kometer.haisen_hoshiki IS 'コードマスタ 580003';
COMMENT ON COLUMN eso_t_c0021_kometer.tkaku_v IS 'コードマスタ 580004';
COMMENT ON COLUMN eso_t_c0021_kometer.tkaku_v_cd IS 'コードマスタ 999001 V固定';
COMMENT ON COLUMN eso_t_c0021_kometer.tkaku_a IS 'コードマスタ 580005';
COMMENT ON COLUMN eso_t_c0021_kometer.tkaku_a_cd IS 'コードマスタ 999002 A固定';
COMMENT ON COLUMN eso_t_c0021_kometer.meter_yuko_ym IS '西暦年月';
COMMENT ON COLUMN eso_t_c0021_kometer.meter_yuko_ym_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0021_kometer.ct_yuko_ym IS '西暦年月';
COMMENT ON COLUMN eso_t_c0021_kometer.ct_yuko_ym_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0021_kometer.seizosha_cd IS '製造者マスタ';
COMMENT ON COLUMN eso_t_c0021_kometer.seizosha_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0021_kometer.katashiki_gaitonashi_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0021_kometer.katashiki_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0021_kometer.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;

