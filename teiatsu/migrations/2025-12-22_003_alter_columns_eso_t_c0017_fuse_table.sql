
-- 2025-12-22_003_alter_columns_eso_t_c0017_fuse.sql
-- 目的：フィールド名とフィールドタイプを変更する
-- 作成日: 2025-12-22
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
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
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
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'CREATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN CREATE_USER TO create_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'create_user'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            ALTER COLUMN create_user TYPE VARCHAR(100),
            ALTER COLUMN create_user SET NOT NULL;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(24)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- CAP (NUMERIC(6,2)) → yoryo (numeric(6, 2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'CAP'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN CAP TO yoryo;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'yoryo'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            ALTER COLUMN yoryo TYPE NUMERIC(6, 2),
            ALTER COLUMN yoryo SET DEFAULT 0;
    END IF;
END $$;

-- CAPT_CD (CHAR(2)) → yoryo_cd (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'CAPT_CD'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN CAPT_CD TO yoryo_cd;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'yoryo_cd'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            ALTER COLUMN yoryo_cd TYPE CHARACTER(2),
            ALTER COLUMN yoryo_cd SET DEFAULT '12';
    END IF;
END $$;

-- FUSE_CNT (NUMERIC(2,0)) → fuse_su (numeric(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'FUSE_CNT'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN FUSE_CNT TO fuse_su;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'fuse_su'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            ALTER COLUMN fuse_su TYPE NUMERIC(2),
            ALTER COLUMN fuse_su SET DEFAULT 3;
    END IF;
END $$;

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN ORDR TO ordr_jn;
    END IF;
END $$;

COMMIT;

