
-- 2025-12-24_006_add_comments_eso_t_c0005_cad_link.sql
-- 目的:ハイパーリンク管理テーブルにカラムコメントを追加
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0005_cad_link.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0005_cad_link.link_moto_id IS 'リンク元ID';
COMMENT ON COLUMN eso_t_c0005_cad_link.moto_zumen_id IS 'リンク元図面ID';
COMMENT ON COLUMN eso_t_c0005_cad_link.link_saki_id IS 'リンク先ID';
COMMENT ON COLUMN eso_t_c0005_cad_link.saki_zumen_id IS 'リンク先図面ID';
COMMENT ON COLUMN eso_t_c0005_cad_link.saki_title_mj IS 'リンク先図面タイトル';
COMMENT ON COLUMN eso_t_c0005_cad_link.saki_name_mj IS 'リンク先名称';
COMMENT ON COLUMN eso_t_c0005_cad_link.saki_setsubi_id IS 'リンク先設備ID';
COMMENT ON COLUMN eso_t_c0005_cad_link.saki_shubetsu_mj IS 'リンク先種別';
COMMENT ON COLUMN eso_t_c0005_cad_link.moto_zumen_han_su IS 'リンク元図面版';
COMMENT ON COLUMN eso_t_c0005_cad_link.saki_zumen_han_su IS 'リンク先図面版';
COMMENT ON COLUMN eso_t_c0005_cad_link.saki_zumen_shubetsu_su IS 'リンク先図面種別';
COMMENT ON COLUMN eso_t_c0005_cad_link.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0005_cad_link.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0005_cad_link.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0005_cad_link.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0005_cad_link.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;


