
-- 2026-01-08_003_alter_columns_eso_m_c0010_symbol.sql
-- 目的：フィールド名とフィールドタイプを変更する
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- ============================================
-- 日付フィールドの変更
-- ============================================

-- ENTRY_DT (DATETIME2) → entry_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0010_symbol' 
        AND column_name = 'ENTRY_DT'
    ) THEN
        ALTER TABLE eso_m_c0010_symbol
            RENAME COLUMN ENTRY_DT TO entry_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0010_symbol' 
        AND column_name = 'entry_date'
    ) THEN
        ALTER TABLE eso_m_c0010_symbol
            ALTER COLUMN entry_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- ============================================
-- ユーザーフィールドの変更
-- ============================================

-- ENTRY_NM (VARCHAR(128)) → entry_user_nm (character varying(128))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0010_symbol' 
        AND column_name = 'ENTRY_NM'
    ) THEN
        ALTER TABLE eso_m_c0010_symbol
            RENAME COLUMN ENTRY_NM TO entry_user_nm;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0010_symbol' 
        AND column_name = 'entry_user_nm'
    ) THEN
        ALTER TABLE eso_m_c0010_symbol
            ALTER COLUMN entry_user_nm TYPE VARCHAR(128);
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- ID → symbol_id
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0010_symbol' 
        AND column_name = 'ID'
    ) THEN
        ALTER TABLE eso_m_c0010_symbol
            RENAME COLUMN ID TO symbol_id;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0010_symbol' 
        AND column_name = 'symbol_id'
    ) THEN
        ALTER TABLE eso_m_c0010_symbol
            ALTER COLUMN symbol_id SET NOT NULL;
    END IF;
END $$;

-- entry_version → character(32)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0010_symbol' 
        AND column_name = 'entry_version'
    ) THEN
        ALTER TABLE eso_m_c0010_symbol
            ALTER COLUMN entry_version TYPE CHARACTER(32);
    END IF;
END $$;

-- binary_data (IMAGE) → bytea
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0010_symbol' 
        AND column_name = 'binary_data'
    ) THEN
        ALTER TABLE eso_m_c0010_symbol
            ALTER COLUMN binary_data TYPE BYTEA;
    END IF;
END $$;
