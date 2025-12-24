
-- 2025-12-18_003_alter_columns_eso_t_c0011_keiki.sql
-- 目的：フィールド名とフィールドタイプを変更する
-- 作成日: 2025-12-18
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
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
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
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'CREATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            RENAME COLUMN CREATE_USER TO create_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'create_user'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            ALTER COLUMN create_user TYPE VARCHAR(100),
            ALTER COLUMN create_user SET NOT NULL;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(24)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- TKAKU_VLT (NUMERIC(6,2)) → tkaku_v (numeric(4, 2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'TKAKU_VLT'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            RENAME COLUMN TKAKU_VLT TO tkaku_v;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'tkaku_v'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            ALTER COLUMN tkaku_v TYPE NUMERIC(4, 2);
    END IF;
END $$;

-- TKAKU_VLTT_CD (CHAR(2)) → tkaku_v_cd (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'TKAKU_VLTT_CD'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            RENAME COLUMN TKAKU_VLTT_CD TO tkaku_v_cd;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'tkaku_v_cd'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            ALTER COLUMN tkaku_v_cd TYPE CHARACTER(2),
            ALTER COLUMN tkaku_v_cd SET DEFAULT '01';
    END IF;
END $$;

-- TKAKU_AMP (NUMERIC(6,2)) → tkaku_a (numeric(4, 2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'TKAKU_AMP'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            RENAME COLUMN TKAKU_AMP TO tkaku_a;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'tkaku_a'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            ALTER COLUMN tkaku_a TYPE NUMERIC(4, 2);
    END IF;
END $$;

-- TKAKU_AMPT_CD (CHAR(2)) → tkaku_a_cd (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'TKAKU_AMPT_CD'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            RENAME COLUMN TKAKU_AMPT_CD TO tkaku_a_cd;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'tkaku_a_cd'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            ALTER COLUMN tkaku_a_cd TYPE CHARACTER(2),
            ALTER COLUMN tkaku_a_cd SET DEFAULT '12';
    END IF;
END $$;

-- NENSHIKI (CHAR(6)) → seizo_ym (character(6))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'NENSHIKI'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            RENAME COLUMN NENSHIKI TO seizo_ym;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'seizo_ym'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            ALTER COLUMN seizo_ym DROP DEFAULT;
    END IF;
END $$;

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0011_keiki' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0011_keiki
            RENAME COLUMN ORDR TO ordr_jn;
    END IF;
END $$;

-- ============================================
-- データ移行：作成者／作成日／更新者／更新日の設定
-- ============================================
-- ルール：
-- 1. 現行システムで値が設定されている場合：現行の値をそのまま移行（「システム」も維持）
-- 2. 値が未設定の場合：作成者・更新者を 'ikou2027' に、作成日・更新日を「データ移行日」に設定
DO $$
DECLARE
    migration_date TIMESTAMP(6) WITHOUT TIME ZONE := '2025-12-18 00:00:00'::timestamp;
    migration_user VARCHAR(100) := 'ikou2027';
BEGIN
    -- 値が未設定の場合のデフォルト設定
    UPDATE eso_t_c0011_keiki
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
