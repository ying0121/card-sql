
-- 2025-12-22_003_alter_columns_eso_t_c0018_kansen.sql
-- 目的：フィールド名とフィールドタイプを変更する
-- 更新日：2025-12-22
-- 更新者：ikou2027
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
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
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
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'CREATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            RENAME COLUMN CREATE_USER TO create_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'create_user'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            ALTER COLUMN create_user TYPE VARCHAR(100),
            ALTER COLUMN create_user SET NOT NULL;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(24)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- HAISEN_CNT → haisen_su
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'HAISEN_CNT'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            RENAME COLUMN HAISEN_CNT TO haisen_su;
    END IF;
END $$;

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            RENAME COLUMN ORDR TO ordr_jn;
    END IF;
END $$;

COMMIT;

