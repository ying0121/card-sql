
-- 2025-12-23_006_add_comments_eso_t_c0012_kaiheiki.sql
-- 目的:低圧開閉器(低圧)テーブルにカラムコメントを追加
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0012_kaiheiki.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.genba_kakuninzumi_meibanto_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.shurui_cd IS 'コードマスタ 510001';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.kyokusu IS 'コードマスタ';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.tkaku_a_cd IS 'コードマスタ 999002 A固定';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.tkaku_a_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.fuse_kva_cd IS 'コードマスタ 999002 A固定';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.fuse_kva_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.kando_a_cd IS 'コードマスタ 999002 mA固定';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.kando_a_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.seizo_ym IS '西暦年月';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.seizo_nennomi_flg IS '0:年月を入力 1:年のみ入力';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.seizo_ym_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;

