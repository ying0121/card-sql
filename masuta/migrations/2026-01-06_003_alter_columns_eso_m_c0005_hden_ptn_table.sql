
-- 2026-01-06_003_alter_columns_eso_m_c0005_hden_ptn.sql
-- 目的：フィールド名とフィールドタイプを変更する
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- ============================================
-- 日付フィールドの変更
-- ============================================

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0005_hden_ptn' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_m_c0005_hden_ptn
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0005_hden_ptn' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_m_c0005_hden_ptn
            ALTER COLUMN record_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- ============================================
-- ユーザーフィールドの変更
-- ============================================

-- UPDATE_USER (VARCHAR(64)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0005_hden_ptn' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_m_c0005_hden_ptn
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0005_hden_ptn' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_m_c0005_hden_ptn
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- KBNCD (CHAR(2)) → yobihatsu_hden_kbn_cd (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0005_hden_ptn' 
        AND column_name = 'KBNCD'
    ) THEN
        ALTER TABLE eso_m_c0005_hden_ptn
            RENAME COLUMN KBNCD TO yobihatsu_hden_kbn_cd;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0005_hden_ptn' 
        AND column_name = 'yobihatsu_hden_kbn_cd'
    ) THEN
        ALTER TABLE eso_m_c0005_hden_ptn
            ALTER COLUMN yobihatsu_hden_kbn_cd TYPE CHARACTER(2);
    END IF;
END $$;

-- HDENSHIYOKEI (CHAR(2)) → shiyo_keitai (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0005_hden_ptn' 
        AND column_name = 'HDENSHIYOKEI'
    ) THEN
        ALTER TABLE eso_m_c0005_hden_ptn
            RENAME COLUMN HDENSHIYOKEI TO shiyo_keitai;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0005_hden_ptn' 
        AND column_name = 'shiyo_keitai'
    ) THEN
        ALTER TABLE eso_m_c0005_hden_ptn
            ALTER COLUMN shiyo_keitai TYPE CHARACTER(2);
    END IF;
END $$;

-- HDENSHU (CHAR(2)) → hden_shurui (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0005_hden_ptn' 
        AND column_name = 'HDENSHU'
    ) THEN
        ALTER TABLE eso_m_c0005_hden_ptn
            RENAME COLUMN HDENSHU TO hden_shurui;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0005_hden_ptn' 
        AND column_name = 'hden_shurui'
    ) THEN
        ALTER TABLE eso_m_c0005_hden_ptn
            ALTER COLUMN hden_shurui TYPE CHARACTER(2);
    END IF;
END $$;

-- GDOSHURUI (CHAR(2)) → gdo_shurui (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0005_hden_ptn' 
        AND column_name = 'GDOSHURUI'
    ) THEN
        ALTER TABLE eso_m_c0005_hden_ptn
            RENAME COLUMN GDOSHURUI TO gdo_shurui;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0005_hden_ptn' 
        AND column_name = 'gdo_shurui'
    ) THEN
        ALTER TABLE eso_m_c0005_hden_ptn
            ALTER COLUMN gdo_shurui TYPE CHARACTER(2);
    END IF;
END $$;

-- biko (VARCHAR(128)) → character varying(128), Default Value: NULL
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0005_hden_ptn' 
        AND column_name = 'biko'
    ) THEN
        ALTER TABLE eso_m_c0005_hden_ptn
            ALTER COLUMN biko TYPE VARCHAR(128),
            ALTER COLUMN biko DROP NOT NULL,
            ALTER COLUMN biko DROP DEFAULT;
    END IF;
END $$;

-- ============================================
-- データ移行：作成者／作成日／更新者／更新日の設定
-- ============================================
DO $$
DECLARE
    migration_date TIMESTAMP(6) WITHOUT TIME ZONE := '2026-01-06 00:00:00'::timestamp;
    migration_user VARCHAR(100) := 'ikou2027';
BEGIN
    UPDATE eso_m_c0005_hden_ptn
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
