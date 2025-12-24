
-- 2025-12-25_006_add_comments_eso_t_c0009_numbering.sql
-- 目的:採番テーブルにカラムコメントを追加
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB:PostgreSQL

BEGIN;

COMMENT ON COLUMN eso_t_c0009_numbering.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0009_numbering.yoto_kbn IS '用途区分';
COMMENT ON COLUMN eso_t_c0009_numbering.value_su IS '値';
COMMENT ON COLUMN eso_t_c0009_numbering.biko_mj IS '備考';
COMMENT ON COLUMN eso_t_c0009_numbering.create_date IS '作成日時';
COMMENT ON COLUMN eso_t_c0009_numbering.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0009_numbering.record_date IS '記録日時';
COMMENT ON COLUMN eso_t_c0009_numbering.record_user IS '記録者';
COMMENT ON COLUMN eso_t_c0009_numbering.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;


