
-- 2025-12-19_003_alter_columns_eso_t_c0016_ct.sql
-- 目的：フィールド名とフィールドタイプを変更する
-- 作成日: 2025-12-19
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
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
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
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'CREATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            RENAME COLUMN CREATE_USER TO create_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'create_user'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            ALTER COLUMN create_user TYPE VARCHAR(100),
            ALTER COLUMN create_user SET NOT NULL;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(24)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- TKAKU_VLT → tkaku_v
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'TKAKU_VLT'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            RENAME COLUMN TKAKU_VLT TO tkaku_v;
    END IF;
END $$;

-- TKAKU_VLTT_CD → tkaku_v_cd
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'TKAKU_VLTT_CD'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            RENAME COLUMN TKAKU_VLTT_CD TO tkaku_v_cd;
    END IF;
END $$;

-- TKAKU_AMP1 (NUMERIC(6,2)) → tkaku_1ji_a (numeric(6, 2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'TKAKU_AMP1'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            RENAME COLUMN TKAKU_AMP1 TO tkaku_1ji_a;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'tkaku_1ji_a'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            ALTER COLUMN tkaku_1ji_a TYPE NUMERIC(6, 2),
            ALTER COLUMN tkaku_1ji_a SET DEFAULT 1;
    END IF;
END $$;

-- TKAKU_AMP1T_CD → tkaku_1ji_a_cd
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'TKAKU_AMP1T_CD'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            RENAME COLUMN TKAKU_AMP1T_CD TO tkaku_1ji_a_cd;
    END IF;
END $$;

-- TKAKU_AMP2 (NUMERIC(6,2)) → tkaku_2ji_a (numeric(6, 2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'TKAKU_AMP2'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            RENAME COLUMN TKAKU_AMP2 TO tkaku_2ji_a;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'tkaku_2ji_a'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            ALTER COLUMN tkaku_2ji_a TYPE NUMERIC(6, 2),
            ALTER COLUMN tkaku_2ji_a SET DEFAULT 12;
    END IF;
END $$;

-- TKAKU_AMP2T_CD (CHAR(2)) → tkaku_2ji_a_cd (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'TKAKU_AMP2T_CD'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            RENAME COLUMN TKAKU_AMP2T_CD TO tkaku_2ji_a_cd;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'tkaku_2ji_a_cd'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            ALTER COLUMN tkaku_2ji_a_cd TYPE CHARACTER(2),
            ALTER COLUMN tkaku_2ji_a_cd DROP DEFAULT;
    END IF;
END $$;

-- KANTSU_CNT → kantsu_su
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'KANTSU_CNT'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            RENAME COLUMN KANTSU_CNT TO kantsu_su;
    END IF;
END $$;

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0016_ct' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0016_ct
            RENAME COLUMN ORDR TO ordr_jn;
    END IF;
END $$;

COMMIT;

