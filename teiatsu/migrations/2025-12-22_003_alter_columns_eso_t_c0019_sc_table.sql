
-- 2025-12-22_003_alter_columns_eso_t_c0019_sc.sql
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
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
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
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'CREATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            RENAME COLUMN CREATE_USER TO create_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'create_user'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            ALTER COLUMN create_user TYPE VARCHAR(100),
            ALTER COLUMN create_user SET NOT NULL;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(24)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- TKAKU_AMP (NUMERIC(6,2)) → tkaku_v (numeric(4, 2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'TKAKU_AMP'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            RENAME COLUMN TKAKU_AMP TO tkaku_v;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'tkaku_v'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            ALTER COLUMN tkaku_v TYPE NUMERIC(4, 2);
    END IF;
END $$;

-- TKAKU_AMPT_CD (CHAR(2)) → tkaku_v_cd (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'TKAKU_AMPT_CD'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            RENAME COLUMN TKAKU_AMPT_CD TO tkaku_v_cd;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'tkaku_v_cd'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            ALTER COLUMN tkaku_v_cd TYPE CHARACTER(2),
            ALTER COLUMN tkaku_v_cd SET DEFAULT '12';
    END IF;
END $$;

-- CAP (NUMERIC(6,2)) → tkaku_kva (numeric(4, 2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'CAP'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            RENAME COLUMN CAP TO tkaku_kva;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'tkaku_kva'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            ALTER COLUMN tkaku_kva TYPE NUMERIC(4, 2);
    END IF;
END $$;

-- CAPT_CD (CHAR(2)) → tkaku_kva_cd (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'CAPT_CD'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            RENAME COLUMN CAPT_CD TO tkaku_kva_cd;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'tkaku_kva_cd'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            ALTER COLUMN tkaku_kva_cd TYPE CHARACTER(2),
            ALTER COLUMN tkaku_kva_cd SET DEFAULT '12';
    END IF;
END $$;

-- SEIZO_Y_FLG → seizo_nennomi_flg
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'SEIZO_Y_FLG'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            RENAME COLUMN SEIZO_Y_FLG TO seizo_nennomi_flg;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'seizo_nennomi_flg'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            ALTER COLUMN seizo_nennomi_flg SET DEFAULT 0;
    END IF;
END $$;

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0019_sc' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0019_sc
            RENAME COLUMN ORDR TO ordr_jn;
    END IF;
END $$;

COMMIT;

