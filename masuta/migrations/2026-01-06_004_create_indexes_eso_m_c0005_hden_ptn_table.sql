
-- 2026-01-06_004_create_indexes_eso_m_c0005_hden_ptn.sql
-- 目的：発電所パターンマスタテーブルにインデックスを作成
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
-- 使用形態、発電所種類、原動機種類の組み合わせで検索する場合に使用
CREATE INDEX IF NOT EXISTS idx_eso_m_c0005_hden_ptn_shiyo_hden_gdo
    ON eso_m_c0005_hden_ptn (yobihatsu_hden_kbn_cd);

COMMIT;

