
-- 2026-01-08_003_alter_columns_eso_m_c0011_jotai.sql
-- 目的：フィールド名とフィールドタイプを変更する
-- 作成日: 2026-01-08
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- ============================================
-- 日付フィールドの変更
-- ============================================

-- FLG → jotai_flg
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0011_jotai' 
        AND column_name = 'FLG'
    ) THEN
        ALTER TABLE eso_m_c0011_jotai
            RENAME COLUMN FLG TO jotai_flg;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0011_jotai' 
        AND column_name = 'jotai_flg'
    ) THEN
        ALTER TABLE eso_m_c0011_jotai
            ALTER COLUMN jotai_flg SET NOT NULL;
    END IF;
END $$;

-- NM (VARCHAR(32)) → jotai_nm (character varying(32))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0011_jotai' 
        AND column_name = 'NM'
    ) THEN
        ALTER TABLE eso_m_c0011_jotai
            RENAME COLUMN NM TO jotai_nm;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_m_c0011_jotai' 
        AND column_name = 'jotai_nm'
    ) THEN
        ALTER TABLE eso_m_c0011_jotai
            ALTER COLUMN jotai_nm TYPE VARCHAR(32);
    END IF;
END $$;
