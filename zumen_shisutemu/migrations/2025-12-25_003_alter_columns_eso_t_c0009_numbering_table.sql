
-- 2025-12-25_003_alter_columns_eso_t_c0009_numbering.sql
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
        WHERE table_name = 'eso_t_c0009_numbering' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0009_numbering
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0009_numbering' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0009_numbering
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0009_numbering' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0009_numbering
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0009_numbering' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0009_numbering
            ALTER COLUMN record_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- YOTO_KBN_CD → yoto_kbn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0009_numbering' 
        AND column_name = 'YOTO_KBN_CD'
    ) THEN
        ALTER TABLE eso_t_c0009_numbering
            RENAME COLUMN YOTO_KBN_CD TO yoto_kbn;
    END IF;
END $$;

-- yoto_kbn フィールドにNOT NULL制約を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0009_numbering' 
        AND column_name = 'yoto_kbn'
    ) THEN
        ALTER TABLE eso_t_c0009_numbering
            ALTER COLUMN yoto_kbn SET NOT NULL;
    END IF;
END $$;

-- 主キー制約の変更（yoto_kbnを追加）
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.table_constraints 
        WHERE table_name = 'eso_t_c0009_numbering' 
        AND constraint_name = 'pk_eso_t_c0009_numbering'
    ) THEN
        ALTER TABLE eso_t_c0009_numbering
            DROP CONSTRAINT pk_eso_t_c0009_numbering;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.table_constraints 
        WHERE table_name = 'eso_t_c0009_numbering' 
        AND constraint_name = 'pk_eso_t_c0009_numbering'
    ) THEN
        ALTER TABLE eso_t_c0009_numbering
            ADD CONSTRAINT pk_eso_t_c0009_numbering PRIMARY KEY (
                okyaku_id,
                yoto_kbn
            );
    END IF;
END $$;

-- VALUE → value_su
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0009_numbering' 
        AND column_name = 'VALUE'
    ) THEN
        ALTER TABLE eso_t_c0009_numbering
            RENAME COLUMN VALUE TO value_su;
    END IF;
END $$;

-- BIKO → biko_mj
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0009_numbering' 
        AND column_name = 'BIKO'
    ) THEN
        ALTER TABLE eso_t_c0009_numbering
            RENAME COLUMN BIKO TO biko_mj;
    END IF;
END $$;

COMMIT;


