
-- 2025-12-23_006_add_comments_eso_t_c0020_sr.sql
-- 目的:低圧リアクトルテーブルにカラムコメントを追加
-- 更新日: 2025-12-23
-- 更新者: ikou2027
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0020_sr.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0020_sr.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0020_sr.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0020_sr.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0020_sr.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0020_sr.shurui_cd IS 'コードマスタ 550001';
COMMENT ON COLUMN eso_t_c0020_sr.genba_kakuninzumi_meibanto_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0020_sr.tkaku_v_cd IS 'コードマスタ 999001 V固定';
COMMENT ON COLUMN eso_t_c0020_sr.tkaku_kva_cd IS 'コードマスタ 999204';
COMMENT ON COLUMN eso_t_c0020_sr.tkaku_kva_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0020_sr.seizo_ym IS '西暦年月';
COMMENT ON COLUMN eso_t_c0020_sr.seizo_nennomi_flg IS '0:年月を入力 1:年のみ入力';
COMMENT ON COLUMN eso_t_c0020_sr.seizo_ym_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0020_sr.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;

