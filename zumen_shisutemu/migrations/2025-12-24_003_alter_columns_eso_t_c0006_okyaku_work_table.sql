
-- 2025-12-24_003_alter_columns_eso_t_c0006_okyaku_work.sql
-- 目的：フィールド名とフィールドタイプを変更する
-- 更新日：2025-12-24
-- 更新者：ikou2027
-- 対象DB：PostgreSQL

BEGIN;

-- CREATE_DT (DATETIME2) → create_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0006_okyaku_work' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0006_okyaku_work
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0006_okyaku_work' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0006_okyaku_work
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0006_okyaku_work' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0006_okyaku_work
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0006_okyaku_work' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0006_okyaku_work
            ALTER COLUMN record_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

COMMIT;

