
-- 2025-12-23_006_add_comments_eso_t_c0019_sc.sql
-- 目的:低圧コンデンサテーブルにカラムコメントを追加
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0019_sc.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0019_sc.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0019_sc.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0019_sc.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0019_sc.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0019_sc.genba_kakuninzumi_meibanto_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0019_sc.tkaku_v_cd IS 'コードマスタ 999001 V固定';
COMMENT ON COLUMN eso_t_c0019_sc.tkaku_kva_cd IS 'コードマスタ 999203';
COMMENT ON COLUMN eso_t_c0019_sc.tkaku_kva_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0019_sc.seizo_ym IS '西暦年月';
COMMENT ON COLUMN eso_t_c0019_sc.seizo_nennomi_flg IS '0:年月を入力 1:年のみ入力';
COMMENT ON COLUMN eso_t_c0019_sc.seizo_ym_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0019_sc.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;

