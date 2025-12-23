
-- 2025-12-23_003_alter_columns_eso_t_c0020_sr.sql
-- 目的：フィールド名とフィールドタイプを変更する
-- 更新日：2025-12-23
-- 更新者：ikou2027
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
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
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
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'CREATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            RENAME COLUMN CREATE_USER TO create_user;
    END IF;
END $$;

-- create_user フィールドのタイプ変更とNOT NULL制約の設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'create_user'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            ALTER COLUMN create_user TYPE VARCHAR(100),
            ALTER COLUMN create_user SET NOT NULL;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(24)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

-- record_user フィールドのタイプ変更とNOT NULL制約の設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
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
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'TKAKU_AMP'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            RENAME COLUMN TKAKU_AMP TO tkaku_v;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'tkaku_v'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            ALTER COLUMN tkaku_v TYPE NUMERIC(4, 2);
    END IF;
END $$;

-- TKAKU_AMPT_CD → tkaku_v_cd
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'TKAKU_AMPT_CD'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            RENAME COLUMN TKAKU_AMPT_CD TO tkaku_v_cd;
    END IF;
END $$;

-- CAP (NUMERIC(6,2)) → tkaku_kva (numeric(4, 2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'CAP'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            RENAME COLUMN CAP TO tkaku_kva;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'tkaku_kva'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            ALTER COLUMN tkaku_kva TYPE NUMERIC(4, 2);
    END IF;
END $$;

-- CAPT_CD → tkaku_kva_cd
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'CAPT_CD'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            RENAME COLUMN CAPT_CD TO tkaku_kva_cd;
    END IF;
END $$;

-- SEIZO_Y_FLG → seizo_nennomi_flg
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'SEIZO_Y_FLG'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            RENAME COLUMN SEIZO_Y_FLG TO seizo_nennomi_flg;
    END IF;
END $$;

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            RENAME COLUMN ORDR TO ordr_jn;
    END IF;
END $$;

COMMIT;

