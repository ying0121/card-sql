
-- 2025-12-24_003_alter_columns_eso_t_c0006_okyaku_work.sql
-- 目的：フィールド名とフィールドタイプを変更する
-- 更新日：2025-12-24
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

-- ============================================
-- その他のフィールド変更
-- ============================================

-- USER_NM → user_nm_mj
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0006_okyaku_work' 
        AND column_name = 'USER_NM'
    ) THEN
        ALTER TABLE eso_t_c0006_okyaku_work
            RENAME COLUMN USER_NM TO user_nm_mj;
    END IF;
END $$;

-- user_nm_mj フィールドにNOT NULL制約を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0006_okyaku_work' 
        AND column_name = 'user_nm_mj'
    ) THEN
        ALTER TABLE eso_t_c0006_okyaku_work
            ALTER COLUMN user_nm_mj SET NOT NULL;
    END IF;
END $$;

-- 主キー制約の変更（user_nm_mjを追加）
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.table_constraints 
        WHERE table_name = 'eso_t_c0006_okyaku_work' 
        AND constraint_name = 'pk_eso_t_c0006_okyaku_work'
    ) THEN
        ALTER TABLE eso_t_c0006_okyaku_work
            DROP CONSTRAINT pk_eso_t_c0006_okyaku_work;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.table_constraints 
        WHERE table_name = 'eso_t_c0006_okyaku_work' 
        AND constraint_name = 'pk_eso_t_c0006_okyaku_work'
    ) THEN
        ALTER TABLE eso_t_c0006_okyaku_work
            ADD CONSTRAINT pk_eso_t_c0006_okyaku_work PRIMARY KEY (
                okyaku_id,
                yoto_kbn,
                user_nm_mj,
                lock_flg
            );
    END IF;
END $$;

-- JSON_BINARY (IMAGE) → json_binary_byt (bytea)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0006_okyaku_work' 
        AND column_name = 'JSON_BINARY'
    ) THEN
        ALTER TABLE eso_t_c0006_okyaku_work
            RENAME COLUMN JSON_BINARY TO json_binary_byt;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0006_okyaku_work' 
        AND column_name = 'json_binary_byt'
    ) THEN
        ALTER TABLE eso_t_c0006_okyaku_work
            ALTER COLUMN json_binary_byt TYPE BYTEA;
    END IF;
END $$;

-- ZUMEN_BINARY (IMAGE) → zumen_binary_byt (bytea)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0006_okyaku_work' 
        AND column_name = 'ZUMEN_BINARY'
    ) THEN
        ALTER TABLE eso_t_c0006_okyaku_work
            RENAME COLUMN ZUMEN_BINARY TO zumen_binary_byt;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0006_okyaku_work' 
        AND column_name = 'zumen_binary_byt'
    ) THEN
        ALTER TABLE eso_t_c0006_okyaku_work
            ALTER COLUMN zumen_binary_byt TYPE BYTEA;
    END IF;
END $$;

-- RENKEI_MODE → renkei_mode_su
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0006_okyaku_work' 
        AND column_name = 'RENKEI_MODE'
    ) THEN
        ALTER TABLE eso_t_c0006_okyaku_work
            RENAME COLUMN RENKEI_MODE TO renkei_mode_su;
    END IF;
END $$;

COMMIT;

