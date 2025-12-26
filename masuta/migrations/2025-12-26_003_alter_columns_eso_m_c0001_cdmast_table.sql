
-- 2025-12-26_003_alter_columns_eso_m_c0001_cdmast.sql
-- 目的：フィールド名とフィールドタイプを変更する
-- 作成日: 2025-12-26
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- ============================================
-- 日付フィールドの変更
-- ============================================

-- CREATE_DT (DATETIME2) → create_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            ALTER COLUMN record_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- ============================================
-- ユーザーフィールドの変更
-- ============================================

-- CREATE_USER (VARCHAR(24)) → create_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'CREATE_USER'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            RENAME COLUMN CREATE_USER TO create_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'create_user'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            ALTER COLUMN create_user TYPE VARCHAR(100),
            ALTER COLUMN create_user SET NOT NULL;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(24)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- DAIBUNRUI (CHAR(6)) → daibunrui_cd (character(6))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'DAIBUNRUI'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            RENAME COLUMN DAIBUNRUI TO daibunrui_cd;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'daibunrui_cd'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            ALTER COLUMN daibunrui_cd TYPE CHARACTER(6);
    END IF;
END $$;

-- CODE (CHAR(2)) → shobunrui_cd (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'CODE'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            RENAME COLUMN CODE TO shobunrui_cd;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'shobunrui_cd'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            ALTER COLUMN shobunrui_cd TYPE CHARACTER(2);
    END IF;
END $$;

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            RENAME COLUMN ORDR TO ordr_jn;
    END IF;
END $$;

-- MEISYOU1 (VARCHAR(64)) → meisyou1 (character varying(64))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'MEISYOU1'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            RENAME COLUMN MEISYOU1 TO meisyou1;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0001_cdmast' 
        AND column_name = 'meisyou1'
    ) THEN
        ALTER TABLE eso_m_c0001_cdmast
            ALTER COLUMN meisyou1 TYPE VARCHAR(64);
    END IF;
END $$;

-- ============================================
-- データ移行：作成者／作成日／更新者／更新日の設定
-- ============================================
DO $$
DECLARE
    migration_date TIMESTAMP(6) WITHOUT TIME ZONE := '2025-12-26 00:00:00'::timestamp;
    migration_user VARCHAR(100) := 'ikou2027';
BEGIN
    UPDATE eso_m_c0001_cdmast
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

