
-- 2025-12-23_006_add_comments_eso_t_c0011_keiki.sql
-- 目的:計器類テーブルにカラムコメントを追加
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0011_keiki.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0011_keiki.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0011_keiki.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0011_keiki.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0011_keiki.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0011_keiki.shurui_cd IS 'コードマスタ 500001';
COMMENT ON COLUMN eso_t_c0011_keiki.tkaku_v_cd IS 'コードマスタ 999001 V固定';
COMMENT ON COLUMN eso_t_c0011_keiki.tkaku_a_cd IS 'コードマスタ 999002 A固定';
COMMENT ON COLUMN eso_t_c0011_keiki.seizo_ym IS '西暦年月';
COMMENT ON COLUMN eso_t_c0011_keiki.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;

