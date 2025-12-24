
-- 2025-12-24_003_alter_columns_eso_t_c0005_cad_link.sql
-- 目的：フィールド名を変更する
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- SAKI_TITLE → saki_title_mj
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0005_cad_link' 
        AND column_name = 'SAKI_TITLE'
    ) THEN
        ALTER TABLE eso_t_c0005_cad_link
            RENAME COLUMN SAKI_TITLE TO saki_title_mj;
    END IF;
END $$;

-- SAKI_NAME → saki_name_mj
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0005_cad_link' 
        AND column_name = 'SAKI_NAME'
    ) THEN
        ALTER TABLE eso_t_c0005_cad_link
            RENAME COLUMN SAKI_NAME TO saki_name_mj;
    END IF;
END $$;

-- SAKI_SHUBETSU → saki_shubetsu_mj
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0005_cad_link' 
        AND column_name = 'SAKI_SHUBETSU'
    ) THEN
        ALTER TABLE eso_t_c0005_cad_link
            RENAME COLUMN SAKI_SHUBETSU TO saki_shubetsu_mj;
    END IF;
END $$;

-- MOTO_ZUMEN_HAN → moto_zumen_han_su
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0005_cad_link' 
        AND column_name = 'MOTO_ZUMEN_HAN'
    ) THEN
        ALTER TABLE eso_t_c0005_cad_link
            RENAME COLUMN MOTO_ZUMEN_HAN TO moto_zumen_han_su;
    END IF;
END $$;

-- SAKI_ZUMEN_HAN → saki_zumen_han_su
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0005_cad_link' 
        AND column_name = 'SAKI_ZUMEN_HAN'
    ) THEN
        ALTER TABLE eso_t_c0005_cad_link
            RENAME COLUMN SAKI_ZUMEN_HAN TO saki_zumen_han_su;
    END IF;
END $$;

-- SAKI_ZUMEN_SHUBETSU → saki_zumen_shubetsu_su
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0005_cad_link' 
        AND column_name = 'SAKI_ZUMEN_SHUBETSU'
    ) THEN
        ALTER TABLE eso_t_c0005_cad_link
            RENAME COLUMN SAKI_ZUMEN_SHUBETSU TO saki_zumen_shubetsu_su;
    END IF;
END $$;

COMMIT;


