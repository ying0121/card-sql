
-- 2026-01-05_003_alter_columns_eso_m_c0004_setsubi_symbol.sql
-- 目的：設備シンボルマスタテーブルのカラムを変更
-- 作成日: 2026-01-05
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- ============================================
-- フィールドの変更
-- ============================================

-- shubetsu_cd を CHAR(4) から CHARACTER(4) に変更し、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'shubetsu_cd'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN shubetsu_cd TYPE CHARACTER(4),
            ALTER COLUMN shubetsu_cd SET NOT NULL;
    END IF;
END $$;

-- symbol_no に NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'symbol_no'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN symbol_no SET NOT NULL;
    END IF;
END $$;

-- master_bunrui を CHAR(7) から CHARACTER(7) に変更し、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'master_bunrui'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN master_bunrui TYPE CHARACTER(7),
            ALTER COLUMN master_bunrui SET NOT NULL;
    END IF;
END $$;

-- master_cd を CHAR(2) から CHARACTER(2) に変更し、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'master_cd'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN master_cd TYPE CHARACTER(2),
            ALTER COLUMN master_cd SET NOT NULL;
    END IF;
END $$;

-- symbol_scale を FLOAT から DOUBLE PRECISION に変更し、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'symbol_scale'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN symbol_scale TYPE DOUBLE PRECISION,
            ALTER COLUMN symbol_scale SET NOT NULL;
    END IF;
END $$;

-- category_cd に NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'category_cd'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN category_cd SET NOT NULL;
    END IF;
END $$;

-- LISTORDER を order_jn にリネームし、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'LISTORDER'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            RENAME COLUMN LISTORDER TO order_jn;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'order_jn'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN order_jn SET NOT NULL;
    END IF;
END $$;

-- text_x を FLOAT から DOUBLE PRECISION に変更し、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'text_x'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN text_x TYPE DOUBLE PRECISION,
            ALTER COLUMN text_x SET NOT NULL;
    END IF;
END $$;

-- text_y を FLOAT から DOUBLE PRECISION に変更し、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'text_y'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN text_y TYPE DOUBLE PRECISION,
            ALTER COLUMN text_y SET NOT NULL;
    END IF;
END $$;

-- text_size を FLOAT から DOUBLE PRECISION に変更し、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'text_size'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN text_size TYPE DOUBLE PRECISION,
            ALTER COLUMN text_size SET NOT NULL;
    END IF;
END $$;

-- hyokimoji1 を VARCHAR(12) から CHARACTER VARYING(12) に変更し、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'hyokimoji1'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN hyokimoji1 TYPE CHARACTER VARYING(12),
            ALTER COLUMN hyokimoji1 SET NOT NULL;
    END IF;
END $$;

-- hyokimoji2 を VARCHAR(12) から CHARACTER VARYING(12) に変更し、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'hyokimoji2'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN hyokimoji2 TYPE CHARACTER VARYING(12),
            ALTER COLUMN hyokimoji2 SET NOT NULL;
    END IF;
END $$;

-- hyokimoji3 を VARCHAR(12) から CHARACTER VARYING(12) に変更し、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'hyokimoji3'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN hyokimoji3 TYPE CHARACTER VARYING(12),
            ALTER COLUMN hyokimoji3 SET NOT NULL;
    END IF;
END $$;

-- symbol_muki のデフォルト値を NULL に設定（既に NULL 許可されている場合）
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'symbol_muki'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN symbol_muki DROP NOT NULL;
    END IF;
END $$;

-- MASK_FLAG を mask_flg にリネームし、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'MASK_FLAG'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            RENAME COLUMN MASK_FLAG TO mask_flg;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'mask_flg'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN mask_flg SET NOT NULL;
    END IF;
END $$;

-- zukei_type に NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'zukei_type'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN zukei_type SET NOT NULL;
    END IF;
END $$;

-- line_type に NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'line_type'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN line_type SET NOT NULL;
    END IF;
END $$;

-- line_width に NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'line_width'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN line_width SET NOT NULL;
    END IF;
END $$;

-- line_color を VARCHAR(6) から CHARACTER VARYING(6) に変更し、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'line_color'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN line_color TYPE CHARACTER VARYING(6),
            ALTER COLUMN line_color SET NOT NULL;
    END IF;
END $$;

-- font を VARCHAR(256) から CHARACTER VARYING(256) に変更し、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'font'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN font TYPE CHARACTER VARYING(256),
            ALTER COLUMN font SET NOT NULL;
    END IF;
END $$;

-- LIMIT_FLAG1 を limit_flg1 にリネームし、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'LIMIT_FLAG1'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            RENAME COLUMN LIMIT_FLAG1 TO limit_flg1;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'limit_flg1'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN limit_flg1 SET NOT NULL;
    END IF;
END $$;

-- UPLOAD_FLAG を upload_flg にリネームし、NOT NULL を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'UPLOAD_FLAG'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            RENAME COLUMN UPLOAD_FLAG TO upload_flg;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'upload_flg'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN upload_flg SET NOT NULL;
    END IF;
END $$;

-- biko を VARCHAR(128) から CHARACTER VARYING(128) に変更し、NULL を許可
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'biko'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN biko TYPE CHARACTER VARYING(128),
            ALTER COLUMN biko DROP NOT NULL;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN record_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(64)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0004_setsubi_symbol' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_m_c0004_setsubi_symbol
            ALTER COLUMN record_user TYPE CHARACTER VARYING(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- データ移行：作成者／作成日／更新者／更新日の設定
-- ============================================
DO $$
DECLARE
    migration_date TIMESTAMP(6) WITHOUT TIME ZONE := now();
    migration_user VARCHAR(100) := 'ikou2027';
BEGIN
    UPDATE eso_m_c0004_setsubi_symbol
    SET
        create_user = CASE 
            WHEN create_user IS NOT NULL AND TRIM(create_user) != '' 
            THEN create_user 
            ELSE migration_user 
        END,
        create_date = COALESCE(create_date, migration_date),
        record_user = CASE 
            WHEN record_user IS NOT NULL AND TRIM(record_user) != '' 
            THEN record_user 
            ELSE migration_user 
        END,
        record_date = COALESCE(record_date, migration_date)
    WHERE
        (create_user IS NULL OR TRIM(create_user) = '')
        OR create_date IS NULL
        OR (record_user IS NULL OR TRIM(record_user) = '')
        OR record_date IS NULL;
END $$;

COMMIT;

