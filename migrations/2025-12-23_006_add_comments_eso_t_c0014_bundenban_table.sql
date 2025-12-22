
-- 2025-12-23_006_add_comments_eso_t_c0014_bundenban.sql
-- 目的:分電盤テーブルにカラムコメントを追加
-- 更新日: 2025-12-23
-- 更新者: ikou2027
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0014_bundenban.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0014_bundenban.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0014_bundenban.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0014_bundenban.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0014_bundenban.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0014_bundenban.shurui_cd IS 'コードマスタ 530001';
COMMENT ON COLUMN eso_t_c0014_bundenban.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;

