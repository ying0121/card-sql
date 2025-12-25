
-- 2025-12-22_006_add_comments_eso_t_c0017_fuse.sql
-- 目的:低圧ヒューズテーブルにカラムコメントを追加
-- 作成日: 2025-12-22
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0017_fuse.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0017_fuse.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0017_fuse.setsubi_id IS '設備ID';
COMMENT ON COLUMN eso_t_c0017_fuse.kotai_id IS '個体ID';
COMMENT ON COLUMN eso_t_c0017_fuse.daisu_renban IS '台数連番';
COMMENT ON COLUMN eso_t_c0017_fuse.shinsetsu_flg IS '新設フラグ';
COMMENT ON COLUMN eso_t_c0017_fuse.yoryo IS '容量';
COMMENT ON COLUMN eso_t_c0017_fuse.yoryo_cd IS '容量単位';
COMMENT ON COLUMN eso_t_c0017_fuse.fuse_su IS 'ヒューズ本数';
COMMENT ON COLUMN eso_t_c0017_fuse.biko IS '備考';
COMMENT ON COLUMN eso_t_c0017_fuse.ordr_jn IS '表示順';
COMMENT ON COLUMN eso_t_c0017_fuse.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0017_fuse.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0017_fuse.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0017_fuse.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0017_fuse.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;

