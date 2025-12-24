
-- 2025-12-25_003_alter_columns_eso_t_c0008_file_work.sql
-- 目的：フィールド名とフィールドタイプを変更する
-- 作成日: 2025-12-25
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
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            ALTER COLUMN record_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- IMAGE_KBN → image_kbn_su
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'IMAGE_KBN'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN IMAGE_KBN TO image_kbn_su;
    END IF;
END $$;

-- image_kbn_su フィールドにNOT NULL制約を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'image_kbn_su'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            ALTER COLUMN image_kbn_su SET NOT NULL;
    END IF;
END $$;

-- TITLE → title_mj
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'TITLE'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN TITLE TO title_mj;
    END IF;
END $$;

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN ORDR TO ordr_jn;
    END IF;
END $$;

-- FILE_KBN → file_kbn_mj
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'FILE_KBN'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN FILE_KBN TO file_kbn_mj;
    END IF;
END $$;

-- FILE_NAME → file_name_mj
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'FILE_NAME'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN FILE_NAME TO file_name_mj;
    END IF;
END $$;

-- FILE_BINARY (VARCHAR(MAX)) → file_binary_byt (bytea)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'FILE_BINARY'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN FILE_BINARY TO file_binary_byt;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'file_binary_byt'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            ALTER COLUMN file_binary_byt TYPE BYTEA;
    END IF;
END $$;

COMMIT;


