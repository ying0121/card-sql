
-- 2025-12-18_006_add_comments_eso_t_c0012_kaiheiki.sql
-- 目的:低圧開閉器(低圧)テーブルにカラムコメントを追加
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0012_kaiheiki.okyaku_id IS 'お客さまID';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.setsubi_id IS '設備ID';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.kotai_id IS '個体ID';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.daisu_renban IS '台数連番';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.shinsetsu_flg IS '新設フラグ';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.genba_kakuninzumi_meibanto_flg IS '現場確認済（銘板等）フラグ';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.shurui_cd IS '種類';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.kyokusu IS '極数';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.tkaku_a IS '定格電流';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.tkaku_a_cd IS '定格電流単位';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.tkaku_a_kakuninkonnan_flg IS '定格電流確認困難フラグ';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.fuse_kva IS 'ヒューズ容量';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.fuse_kva_cd IS 'ヒューズ容量単位';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.fuse_kva_kakuninkonnan_flg IS 'ヒューズ容量確認困難フラグ';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.kando_a IS '感度電流';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.kando_a_cd IS '感度電流単位';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.kando_a_kakuninkonnan_flg IS '感度電流確認困難フラグ';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.seizo_ym IS '製造年月';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.seizo_nennomi_flg IS '製造年のみ入力フラグ';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.seizo_ym_kakuninkonnan_flg IS '製造年月確認困難フラグ';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.ikisaki IS '行先';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.biko IS '備考';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.ordr_jn IS '表示順';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.create_date IS '作成日';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.record_date IS '更新日';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.record_user IS '更新者';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.shinki_koushin_sakujo_flg IS '新規・更新・削除フラグ';

COMMIT;

