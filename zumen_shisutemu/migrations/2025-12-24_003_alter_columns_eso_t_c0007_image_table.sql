
-- 2025-12-24_003_alter_columns_eso_t_c0007_image.sql
-- 目的：フィールド名とフィールドタイプを変更する
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

BEGIN;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- IMAGE_KBN → image_kbn_su
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0007_image' 
        AND column_name = 'IMAGE_KBN'
    ) THEN
        ALTER TABLE eso_t_c0007_image
            RENAME COLUMN IMAGE_KBN TO image_kbn_su;
    END IF;
END $$;

-- image_kbn_su フィールドにNOT NULL制約を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0007_image' 
        AND column_name = 'image_kbn_su'
    ) THEN
        ALTER TABLE eso_t_c0007_image
            ALTER COLUMN image_kbn_su SET NOT NULL;
    END IF;
END $$;

-- TITLE → title_mj
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0007_image' 
        AND column_name = 'TITLE'
    ) THEN
        ALTER TABLE eso_t_c0007_image
            RENAME COLUMN TITLE TO title_mj;
    END IF;
END $$;

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0007_image' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0007_image
            RENAME COLUMN ORDR TO ordr_jn;
    END IF;
END $$;

-- FILE_NAME → file_name_mj
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0007_image' 
        AND column_name = 'FILE_NAME'
    ) THEN
        ALTER TABLE eso_t_c0007_image
            RENAME COLUMN FILE_NAME TO file_name_mj;
    END IF;
END $$;

COMMIT;


