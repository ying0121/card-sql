
-- 2026-01-06_003_alter_columns_eso_m_c0006_category.sql
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
        WHERE table_name = 'eso_m_c0006_category' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_m_c0006_category
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0006_category' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_m_c0006_category
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
        WHERE table_name = 'eso_m_c0006_category' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_m_c0006_category
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0006_category' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_m_c0006_category
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- category_nm (VARCHAR(128)) → character varying(128), Not Null: Yes
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0006_category' 
        AND column_name = 'category_nm'
    ) THEN
        ALTER TABLE eso_m_c0006_category
            ALTER COLUMN category_nm TYPE VARCHAR(128),
            ALTER COLUMN category_nm SET NOT NULL;
    END IF;
END $$;

-- LISTORDER → order_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0006_category' 
        AND column_name = 'LISTORDER'
    ) THEN
        ALTER TABLE eso_m_c0006_category
            RENAME COLUMN LISTORDER TO order_jn;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0006_category' 
        AND column_name = 'order_jn'
    ) THEN
        ALTER TABLE eso_m_c0006_category
            ALTER COLUMN order_jn SET NOT NULL;
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
    UPDATE eso_m_c0006_category
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

