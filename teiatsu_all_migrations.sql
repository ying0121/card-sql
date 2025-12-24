-- teiatsu_all_migrations.sql
-- 目的：teiatsu フォルダ内のすべてのマイグレーションファイルを統合
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

CREATE TABLE IF NOT EXISTS eso_t_c0011_keiki (
    okyaku_id                       CHARACTER(10) NOT NULL,
    zumen_id                        NUMERIC(8) NOT NULL,
    setsubi_id                      NUMERIC(8) NOT NULL,
    kotai_id                        NUMERIC(8) NOT NULL,
    daisu_renban                    NUMERIC(3) NOT NULL DEFAULT 1,

    shinsetsu_flg                   INTEGER DEFAULT 1,

    shurui_cd                       CHARACTER(2),

    tkaku_v                         NUMERIC(4, 2),
    tkaku_v_cd                      CHARACTER(2) DEFAULT '01',

    tkaku_a                         NUMERIC(4, 2),
    tkaku_a_cd                      CHARACTER(2) DEFAULT '12',

    seizo_ym                        CHARACTER(6),

    biko                            VARCHAR(256),

    ordr_jn                         INTEGER,

    create_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                     VARCHAR(100) NOT NULL,

    record_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                     VARCHAR(100) NOT NULL,

    shinki_koushin_sakujo_flg       INTEGER,

    CONSTRAINT pk_eso_t_c0011_keiki PRIMARY KEY (
        okyaku_id,
        zumen_id,
        setsubi_id,
        kotai_id,
        daisu_renban
    )
);

COMMENT ON TABLE eso_t_c0011_keiki IS '計器類テーブル';

CREATE TABLE IF NOT EXISTS eso_t_c0012_kaiheiki (
    okyaku_id                           CHARACTER(10) NOT NULL,
    zumen_id                            NUMERIC(8) NOT NULL,
    setsubi_id                          NUMERIC(8) NOT NULL,
    kotai_id                            NUMERIC(8) NOT NULL,
    daisu_renban                        NUMERIC(3) NOT NULL DEFAULT 1,

    shinsetsu_flg                       INTEGER DEFAULT 1,
    genba_kakuninzumi_meibanto_flg      INTEGER DEFAULT 0,

    shurui_cd                           CHARACTER(2),
    kyokusu                             NUMERIC(1) DEFAULT 1,

    tkaku_a                             NUMERIC(6),
    tkaku_a_cd                          CHARACTER(2) DEFAULT '12',
    tkaku_a_kakuninkonnan_flg           INTEGER DEFAULT 0,

    fuse_kva                            NUMERIC(4),
    fuse_kva_cd                         CHARACTER(2) DEFAULT '12',
    fuse_kva_kakuninkonnan_flg          INTEGER DEFAULT 0,

    kando_a                             NUMERIC(6),
    kando_a_cd                          CHARACTER(2) DEFAULT '11',
    kando_a_kakuninkonnan_flg           INTEGER DEFAULT 0,

    seizo_ym                            CHARACTER(6),
    seizo_nennomi_flg                   INTEGER DEFAULT 0,
    seizo_ym_kakuninkonnan_flg          INTEGER DEFAULT 0,

    ikisaki                             VARCHAR(40),
    biko                                VARCHAR(256),

    ordr_jn                             INTEGER,

    create_date                         TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                         VARCHAR(100) NOT NULL,

    record_date                         TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                         VARCHAR(100) NOT NULL,

    shinki_koushin_sakujo_flg           INTEGER,

    CONSTRAINT pk_eso_t_c0012_kaiheiki PRIMARY KEY (
        okyaku_id,
        zumen_id,
        setsubi_id,
        kotai_id,
        daisu_renban
    )
);

COMMENT ON TABLE eso_t_c0012_kaiheiki IS '低圧開閉器(低圧)テーブル';

CREATE TABLE IF NOT EXISTS eso_t_c0013_cable (
    okyaku_id                   CHARACTER(10)            NOT NULL,
    zumen_id                    NUMERIC(8)               NOT NULL,
    setsubi_id                  NUMERIC(8)               NOT NULL,
    kotai_id                    NUMERIC(8)               NOT NULL,
    daisu_renban                NUMERIC(3)               NOT NULL DEFAULT 1,

    shinsetsu_flg               INTEGER                  DEFAULT 1,
    shurui_cd                   CHARACTER(2),
    biko                        VARCHAR(256),
    ordr_jn                     INTEGER,

    create_date                 TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                 VARCHAR(100)             NOT NULL,

    record_date                 TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                 VARCHAR(100)             NOT NULL,

    shinki_koushin_sakujo_flg    INTEGER,

    CONSTRAINT pk_eso_t_c0013_cable
        PRIMARY KEY (
            okyaku_id,
            zumen_id,
            setsubi_id,
            kotai_id,
            daisu_renban
        )
);

COMMENT ON TABLE eso_t_c0013_cable IS '低圧ケーブル管理テーブル';

BEGIN;

ALTER TABLE eso_t_c0011_keiki
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;

BEGIN;

ALTER TABLE eso_t_c0012_kaiheiki
    ADD COLUMN IF NOT EXISTS genba_kakuninzumi_meibanto_flg     INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS tkaku_a_kakuninkonnan_flg          INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS fuse_kva                           NUMERIC(4),
    ADD COLUMN IF NOT EXISTS fuse_kva_cd                        CHARACTER(2) DEFAULT '12',
    ADD COLUMN IF NOT EXISTS fuse_kva_kakuninkonnan_flg         INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS kando_a_kakuninkonnan_flg          INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS seizo_ym_kakuninkonnan_flg         INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS biko                               VARCHAR(256),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg          INTEGER;

COMMIT;

BEGIN;

ALTER TABLE eso_t_c0013_cable
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;

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

BEGIN;

-- ============================================
-- 日付フィールドの変更
-- ============================================

-- CREATE_DT (DATETIME2) → create_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
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
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'CREATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            RENAME COLUMN CREATE_USER TO create_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'create_user'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            ALTER COLUMN create_user TYPE VARCHAR(100),
            ALTER COLUMN create_user SET NOT NULL;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(24)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- TKAKU_AMP (NUMERIC(6,2)) → tkaku_a (numeric(4, 2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'TKAKU_AMP'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            RENAME COLUMN TKAKU_AMP TO tkaku_a;
    END IF;
END $$;

-- TKAKU_AMPT_CD (CHAR(2)) → tkaku_a_cd (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'TKAKU_AMPT_CD'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            RENAME COLUMN TKAKU_AMPT_CD TO tkaku_a_cd;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'tkaku_a_cd'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            ALTER COLUMN tkaku_a_cd TYPE CHARACTER(2),
            ALTER COLUMN tkaku_a_cd SET DEFAULT '12';
    END IF;
END $$;

-- KANDO_AMP → kando_a
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'KANDO_AMP'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            RENAME COLUMN KANDO_AMP TO kando_a;
    END IF;
END $$;

-- KANDO_AMPT_CD (CHAR(2)) → kando_a_cd (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'KANDO_AMPT_CD'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            RENAME COLUMN KANDO_AMPT_CD TO kando_a_cd;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'kando_a_cd'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            ALTER COLUMN kando_a_cd TYPE CHARACTER(2),
            ALTER COLUMN kando_a_cd SET DEFAULT '11';
    END IF;
END $$;

-- SEIZO_Y_FLG → seizo_nennomi_flg
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'SEIZO_Y_FLG'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            RENAME COLUMN SEIZO_Y_FLG TO seizo_nennomi_flg;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'seizo_nennomi_flg'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
            ALTER COLUMN seizo_nennomi_flg SET DEFAULT 0;
    END IF;
END $$;

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0012_kaiheiki' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0012_kaiheiki
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
    UPDATE eso_t_c0012_kaiheiki
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

BEGIN;

-- ============================================
-- 日付フィールドの変更
-- ============================================

-- CREATE_DT (DATETIME2) → create_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0013_cable' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0013_cable
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0013_cable' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0013_cable
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0013_cable' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0013_cable
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0013_cable' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0013_cable
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
        WHERE table_name = 'eso_t_c0013_cable' 
        AND column_name = 'CREATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0013_cable
            RENAME COLUMN CREATE_USER TO create_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0013_cable' 
        AND column_name = 'create_user'
    ) THEN
        ALTER TABLE eso_t_c0013_cable
            ALTER COLUMN create_user TYPE VARCHAR(100),
            ALTER COLUMN create_user SET NOT NULL;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(24)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0013_cable' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0013_cable
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0013_cable' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_t_c0013_cable
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0013_cable' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0013_cable
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
    UPDATE eso_t_c0013_cable
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

BEGIN;

CREATE TABLE IF NOT EXISTS eso_t_c0014_bundenban (
    okyaku_id                       CHARACTER(10) NOT NULL,
    zumen_id                        NUMERIC(8) NOT NULL,
    setsubi_id                      NUMERIC(8) NOT NULL,
    kotai_id                        NUMERIC(8) NOT NULL,
    daisu_renban                    NUMERIC(3) NOT NULL DEFAULT 1,

    shinsetsu_flg                   INTEGER DEFAULT 1,

    shurui_cd                       CHARACTER(2),

    waku_nm                         VARCHAR(40),

    ordr_jn                         INTEGER,

    create_date                     TIMESTAMP(6) WITHOUT TIME ZONE,
    create_user                     VARCHAR(100),

    record_date                     TIMESTAMP(6) WITHOUT TIME ZONE,
    record_user                     VARCHAR(100),

    shinki_koushin_sakujo_flg       INTEGER,

    CONSTRAINT pk_eso_t_c0014_bundenban PRIMARY KEY (
        okyaku_id,
        zumen_id,
        setsubi_id,
        kotai_id,
        daisu_renban
    )
);

COMMENT ON TABLE eso_t_c0014_bundenban IS '分電盤テーブル';

COMMIT;


BEGIN;

CREATE TABLE IF NOT EXISTS eso_t_c0015_keidenki (
    okyaku_id                       CHARACTER(10) NOT NULL,
    zumen_id                        NUMERIC(8) NOT NULL,
    setsubi_id                      NUMERIC(8) NOT NULL,
    kotai_id                        NUMERIC(8) NOT NULL,
    daisu_renban                    NUMERIC(3) NOT NULL DEFAULT 1,

    shinsetsu_flg                   INTEGER DEFAULT 1,

    shurui_cd                       CHARACTER(2),

    ordr_jn                         INTEGER,

    create_date                     TIMESTAMP(6) WITHOUT TIME ZONE,
    create_user                     VARCHAR(100),

    record_date                     TIMESTAMP(6) WITHOUT TIME ZONE,
    record_user                     VARCHAR(100),

    shinki_koushin_sakujo_flg       INTEGER,

    CONSTRAINT pk_eso_t_c0015_keidenki PRIMARY KEY (
        okyaku_id,
        zumen_id,
        setsubi_id,
        kotai_id,
        daisu_renban
    )
);

COMMENT ON TABLE eso_t_c0015_keidenki IS '計電器テーブル';

COMMIT;


BEGIN;

CREATE TABLE IF NOT EXISTS eso_t_c0016_ct (
    okyaku_id                       CHARACTER(10) NOT NULL,
    zumen_id                        NUMERIC(8) NOT NULL,
    setsubi_id                      NUMERIC(8) NOT NULL,
    kotai_id                        NUMERIC(8) NOT NULL,
    daisu_renban                    NUMERIC(3) NOT NULL DEFAULT 1,

    shinsetsu_flg                   INTEGER DEFAULT 1,

    tkaku_v                         NUMERIC(6, 2),
    tkaku_v_cd                      CHARACTER(2),

    tkaku_1ji_a                     NUMERIC(6, 2) DEFAULT 1,
    tkaku_1ji_a_cd                  CHARACTER(2),

    tkaku_2ji_a                     NUMERIC(6, 2) DEFAULT 12,
    tkaku_2ji_a_cd                  CHARACTER(2),

    kantsu_su                       NUMERIC(2),

    ordr_jn                         INTEGER,

    create_date                     TIMESTAMP(6) WITHOUT TIME ZONE,
    create_user                     VARCHAR(100),

    record_date                     TIMESTAMP(6) WITHOUT TIME ZONE,
    record_user                     VARCHAR(100),

    shinki_koushin_sakujo_flg       INTEGER,

    CONSTRAINT pk_eso_t_c0016_ct PRIMARY KEY (
        okyaku_id,
        zumen_id,
        setsubi_id,
        kotai_id,
        daisu_renban
    )
);

COMMENT ON TABLE eso_t_c0016_ct IS '低圧変流器テーブル';

COMMIT;


BEGIN;

ALTER TABLE eso_t_c0014_bundenban
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;


BEGIN;

ALTER TABLE eso_t_c0015_keidenki
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;


BEGIN;

ALTER TABLE eso_t_c0016_ct
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;


BEGIN;

-- ============================================
-- 日付フィールドの変更
-- ============================================

-- CREATE_DT (DATETIME2) → create_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0014_bundenban' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0014_bundenban
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0014_bundenban' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0014_bundenban
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0014_bundenban' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0014_bundenban
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0014_bundenban' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0014_bundenban
            ALTER COLUMN record_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- ============================================
-- ユーザーフィールドの変更
-- ============================================

-- CREATE_USER (VARCHAR(24)) → create_user (VARCHAR(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0014_bundenban' 
        AND column_name = 'CREATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0014_bundenban
            RENAME COLUMN CREATE_USER TO create_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0014_bundenban' 
        AND column_name = 'create_user'
    ) THEN
        ALTER TABLE eso_t_c0014_bundenban
            ALTER COLUMN create_user TYPE VARCHAR(100),
            ALTER COLUMN create_user SET NOT NULL;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(24)) → record_user (VARCHAR(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0014_bundenban' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0014_bundenban
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0014_bundenban' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_t_c0014_bundenban
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0014_bundenban' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0014_bundenban
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
    migration_date TIMESTAMP(6) WITHOUT TIME ZONE := '2025-12-19 00:00:00'::timestamp;
    migration_user VARCHAR(100) := 'ikou2027';
BEGIN
    -- 値が未設定の場合のデフォルト設定
    UPDATE eso_t_c0014_bundenban
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


BEGIN;

-- ============================================
-- 日付フィールドの変更
-- ============================================

-- CREATE_DT (DATETIME2) → create_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0015_keidenki' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0015_keidenki
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0015_keidenki' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0015_keidenki
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0015_keidenki' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0015_keidenki
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0015_keidenki' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0015_keidenki
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
        WHERE table_name = 'eso_t_c0015_keidenki' 
        AND column_name = 'CREATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0015_keidenki
            RENAME COLUMN CREATE_USER TO create_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0015_keidenki' 
        AND column_name = 'create_user'
    ) THEN
        ALTER TABLE eso_t_c0015_keidenki
            ALTER COLUMN create_user TYPE VARCHAR(100),
            ALTER COLUMN create_user SET NOT NULL;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(24)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0015_keidenki' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0015_keidenki
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0015_keidenki' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_t_c0015_keidenki
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0015_keidenki' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0015_keidenki
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
    migration_date TIMESTAMP(6) WITHOUT TIME ZONE := '2025-12-19 00:00:00'::timestamp;
    migration_user VARCHAR(100) := 'ikou2027';
BEGIN
    -- 値が未設定の場合のデフォルト設定
    UPDATE eso_t_c0015_keidenki
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

-- ============================================
-- データ移行：作成者／作成日／更新者／更新日の設定
-- ============================================
-- ルール：
-- 1. 現行システムで値が設定されている場合：現行の値をそのまま移行（「システム」も維持）
-- 2. 値が未設定の場合：作成者・更新者を 'ikou2027' に、作成日・更新日を「データ移行日」に設定
DO $$
DECLARE
    migration_date TIMESTAMP(6) WITHOUT TIME ZONE := '2025-12-19 00:00:00'::timestamp;
    migration_user VARCHAR(100) := 'ikou2027';
BEGIN
    -- 値が未設定の場合のデフォルト設定
    UPDATE eso_t_c0016_ct
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


BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0011_keiki_okyaku_zumen_flg_ordr
    ON eso_t_c0011_keiki (okyaku_id, zumen_id, shinki_koushin_sakujo_flg, ordr_jn);

COMMIT;


BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0012_kaiheiki_okyaku_zumen_flg_ordr
    ON eso_t_c0012_kaiheiki (okyaku_id, zumen_id, shinki_koushin_sakujo_flg, ordr_jn);

COMMIT;


BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
-- ORDER BYが setsubi_id, kotai_id, daisu_renban なので、それらも含める
CREATE INDEX IF NOT EXISTS idx_eso_t_c0013_cable_okyaku_zumen_flg_setsubi_kotai_daisu
    ON eso_t_c0013_cable (okyaku_id, zumen_id, shinki_koushin_sakujo_flg, setsubi_id, kotai_id, daisu_renban);

COMMIT;


BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0014_bundenban_okyaku_zumen_flg_ordr
    ON eso_t_c0014_bundenban (okyaku_id, zumen_id, shinki_koushin_sakujo_flg, ordr_jn);

COMMIT;


BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0015_keidenki_okyaku_zumen_flg_ordr
    ON eso_t_c0015_keidenki (okyaku_id, zumen_id, shinki_koushin_sakujo_flg, ordr_jn);

COMMIT;


BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0016_ct_okyaku_zumen_flg_ordr
    ON eso_t_c0016_ct (okyaku_id, zumen_id, shinki_koushin_sakujo_flg, ordr_jn);

COMMIT;


BEGIN;

ALTER TABLE eso_t_c0011_keiki
    DROP COLUMN IF EXISTS KENMAN;

COMMIT;


BEGIN;

ALTER TABLE eso_t_c0012_kaiheiki
    DROP COLUMN IF EXISTS SYMBOL_MUKI;

COMMIT;


CREATE TABLE IF NOT EXISTS eso_t_c0017_fuse (
    okyaku_id                       CHARACTER(10) NOT NULL,
    zumen_id                        NUMERIC(8) NOT NULL,
    setsubi_id                      NUMERIC(8) NOT NULL,
    kotai_id                        NUMERIC(8) NOT NULL,
    daisu_renban                    NUMERIC(3) NOT NULL DEFAULT 1,

    shinsetsu_flg                   INTEGER DEFAULT 1,

    yoryo                           NUMERIC(6, 2) DEFAULT 0,
    yoryo_cd                        CHARACTER(2) DEFAULT '12',

    fuse_su                         NUMERIC(2) DEFAULT 3,

    ordr_jn                         INTEGER,

    create_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                     VARCHAR(100) NOT NULL,

    record_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                     VARCHAR(100) NOT NULL,

    shinki_koushin_sakujo_flg       INTEGER,

    CONSTRAINT pk_eso_t_c0017_fuse PRIMARY KEY (
        okyaku_id,
        zumen_id,
        setsubi_id,
        kotai_id,
        daisu_renban
    )
);

COMMENT ON TABLE eso_t_c0017_fuse IS '低圧ヒューズテーブル';


CREATE TABLE IF NOT EXISTS eso_t_c0018_kansen (
    okyaku_id                       CHARACTER(10) NOT NULL,
    zumen_id                        NUMERIC(8) NOT NULL,
    setsubi_id                      NUMERIC(8) NOT NULL,
    kotai_id                        NUMERIC(8) NOT NULL,
    daisu_renban                    NUMERIC(3) NOT NULL DEFAULT 1,

    shinsetsu_flg                   INTEGER DEFAULT 1,

    shurui_cd                       CHARACTER(2),

    haisen_su                       NUMERIC(1),

    ordr_jn                         INTEGER,

    create_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                     VARCHAR(100) NOT NULL,

    record_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                     VARCHAR(100) NOT NULL,

    shinki_koushin_sakujo_flg       INTEGER,

    CONSTRAINT pk_eso_t_c0018_kansen PRIMARY KEY (
        okyaku_id,
        zumen_id,
        setsubi_id,
        kotai_id,
        daisu_renban
    )
);

COMMENT ON TABLE eso_t_c0018_kansen IS '幹線テーブル';


CREATE TABLE IF NOT EXISTS eso_t_c0019_sc (
    okyaku_id                       CHARACTER(10) NOT NULL,
    zumen_id                        NUMERIC(8) NOT NULL,
    setsubi_id                      NUMERIC(8) NOT NULL,
    kotai_id                        NUMERIC(8) NOT NULL,
    daisu_renban                    NUMERIC(3) NOT NULL DEFAULT 1,

    shinsetsu_flg                   INTEGER DEFAULT 1,

    tkaku_v                         NUMERIC(4, 2),
    tkaku_v_cd                      CHARACTER(2) DEFAULT '12',

    tkaku_kva                       NUMERIC(4, 2),
    tkaku_kva_cd                    CHARACTER(2) DEFAULT '12',

    seizo_ym                        CHARACTER(6),

    seizo_nennomi_flg               INTEGER DEFAULT 0,

    ordr_jn                         INTEGER,

    create_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                     VARCHAR(100) NOT NULL,

    record_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                     VARCHAR(100) NOT NULL,

    shinki_koushin_sakujo_flg       INTEGER,

    CONSTRAINT pk_eso_t_c0019_sc PRIMARY KEY (
        okyaku_id,
        zumen_id,
        setsubi_id,
        kotai_id,
        daisu_renban
    )
);

COMMENT ON TABLE eso_t_c0019_sc IS '低圧コンデンサテーブル';


BEGIN;

ALTER TABLE eso_t_c0017_fuse
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;


BEGIN;

ALTER TABLE eso_t_c0018_kansen
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;


BEGIN;

ALTER TABLE eso_t_c0019_sc
    ADD COLUMN IF NOT EXISTS genba_kakuninzumi_meibanto_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS tkaku_kva_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS seizo_ym_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;


BEGIN;

-- ============================================
-- 日付フィールドの変更
-- ============================================

-- CREATE_DT (DATETIME2) → create_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
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
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'CREATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN CREATE_USER TO create_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'create_user'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            ALTER COLUMN create_user TYPE VARCHAR(100),
            ALTER COLUMN create_user SET NOT NULL;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(24)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- CAP (NUMERIC(6,2)) → yoryo (numeric(6, 2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'CAP'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN CAP TO yoryo;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'yoryo'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            ALTER COLUMN yoryo TYPE NUMERIC(6, 2),
            ALTER COLUMN yoryo SET DEFAULT 0;
    END IF;
END $$;

-- CAPT_CD (CHAR(2)) → yoryo_cd (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'CAPT_CD'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN CAPT_CD TO yoryo_cd;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'yoryo_cd'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            ALTER COLUMN yoryo_cd TYPE CHARACTER(2),
            ALTER COLUMN yoryo_cd SET DEFAULT '12';
    END IF;
END $$;

-- FUSE_CNT (NUMERIC(2,0)) → fuse_su (numeric(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'FUSE_CNT'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            RENAME COLUMN FUSE_CNT TO fuse_su;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'fuse_su'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
            ALTER COLUMN fuse_su TYPE NUMERIC(2),
            ALTER COLUMN fuse_su SET DEFAULT 3;
    END IF;
END $$;

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0017_fuse' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0017_fuse
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
    migration_date TIMESTAMP(6) WITHOUT TIME ZONE := '2025-12-22 00:00:00'::timestamp;
    migration_user VARCHAR(100) := 'ikou2027';
BEGIN
    -- 値が未設定の場合のデフォルト設定
    UPDATE eso_t_c0017_fuse
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


BEGIN;

-- ============================================
-- 日付フィールドの変更
-- ============================================

-- CREATE_DT (DATETIME2) → create_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
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
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'CREATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            RENAME COLUMN CREATE_USER TO create_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'create_user'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            ALTER COLUMN create_user TYPE VARCHAR(100),
            ALTER COLUMN create_user SET NOT NULL;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(24)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- HAISEN_CNT → haisen_su
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'HAISEN_CNT'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
            RENAME COLUMN HAISEN_CNT TO haisen_su;
    END IF;
END $$;

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0018_kansen' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0018_kansen
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
    migration_date TIMESTAMP(6) WITHOUT TIME ZONE := '2025-12-22 00:00:00'::timestamp;
    migration_user VARCHAR(100) := 'ikou2027';
BEGIN
    -- 値が未設定の場合のデフォルト設定
    UPDATE eso_t_c0018_kansen
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

-- ============================================
-- データ移行：作成者／作成日／更新者／更新日の設定
-- ============================================
-- ルール：
-- 1. 現行システムで値が設定されている場合：現行の値をそのまま移行（「システム」も維持）
-- 2. 値が未設定の場合：作成者・更新者を 'ikou2027' に、作成日・更新日を「データ移行日」に設定
DO $$
DECLARE
    migration_date TIMESTAMP(6) WITHOUT TIME ZONE := '2025-12-22 00:00:00'::timestamp;
    migration_user VARCHAR(100) := 'ikou2027';
BEGIN
    -- 値が未設定の場合のデフォルト設定
    UPDATE eso_t_c0019_sc
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


BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0017_fuse_okyaku_zumen_flg_ordr
    ON eso_t_c0017_fuse (okyaku_id, zumen_id, shinki_koushin_sakujo_flg, ordr_jn);

COMMIT;



BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0018_kansen_okyaku_zumen_flg_ordr
    ON eso_t_c0018_kansen (okyaku_id, zumen_id, shinki_koushin_sakujo_flg, ordr_jn);

COMMIT;



BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0019_sc_okyaku_zumen_flg_ordr
    ON eso_t_c0019_sc (okyaku_id, zumen_id, shinki_koushin_sakujo_flg, ordr_jn);

COMMIT;



CREATE TABLE IF NOT EXISTS eso_t_c0020_sr (
    okyaku_id                       CHARACTER(10) NOT NULL,
    zumen_id                        NUMERIC(8) NOT NULL,
    setsubi_id                      NUMERIC(8) NOT NULL,
    kotai_id                        NUMERIC(8) NOT NULL,
    daisu_renban                    NUMERIC(3) NOT NULL DEFAULT 1,

    shinsetsu_flg                   INTEGER DEFAULT 1,

    tkaku_v                         NUMERIC(4, 2),
    tkaku_v_cd                      CHARACTER(2) DEFAULT '12',

    tkaku_kva                       NUMERIC(4, 2),
    tkaku_kva_cd                    CHARACTER(2) DEFAULT '12',

    seizo_ym                        CHARACTER(6),

    seizo_nennomi_flg               INTEGER DEFAULT 0,

    ordr_jn                         INTEGER,

    create_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                     VARCHAR(100) NOT NULL,

    record_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                     VARCHAR(100) NOT NULL,

    shinki_koushin_sakujo_flg       INTEGER,

    CONSTRAINT pk_eso_t_c0020_sr PRIMARY KEY (
        okyaku_id,
        zumen_id,
        setsubi_id,
        kotai_id,
        daisu_renban
    )
);

COMMENT ON TABLE eso_t_c0020_sr IS '低圧リアクトルテーブル';


CREATE TABLE IF NOT EXISTS eso_t_c0021_kometer (
    okyaku_id                       CHARACTER(10) NOT NULL,
    zumen_id                        NUMERIC(8) NOT NULL,
    setsubi_id                      NUMERIC(8) NOT NULL,
    kotai_id                        NUMERIC(8) NOT NULL,
    daisu_renban                    NUMERIC(3) NOT NULL DEFAULT 1,

    shinsetsu_flg                   INTEGER DEFAULT 1,

    genba_kakuninzumi_meibanto_flg INTEGER DEFAULT 0,

    kairo_nm                        VARCHAR(80),

    meter_shurui                   CHARACTER(2),

    haisen_hoshiki                 CHARACTER(2),

    tkaku_v                        CHARACTER(2),
    tkaku_v_cd                     CHARACTER(2) DEFAULT '01',

    tkaku_a                        CHARACTER(2),
    tkaku_a_cd                     CHARACTER(2) DEFAULT '12',

    meter_yuko_ym                  CHARACTER(6),

    ct_yuko_ym                     CHARACTER(6),

    seizosha_cd                    CHARACTER(4),

    katashiki_cd                   CHARACTER(4),

    ordr_jn                        INTEGER,

    create_date                    TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                    VARCHAR(100) NOT NULL,

    record_date                    TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                    VARCHAR(100) NOT NULL,

    shinki_koushin_sakujo_flg      INTEGER,

    CONSTRAINT pk_eso_t_c0021_kometer PRIMARY KEY (
        okyaku_id,
        zumen_id,
        setsubi_id,
        kotai_id,
        daisu_renban
    )
);

COMMENT ON TABLE eso_t_c0021_kometer IS '子メーターテーブル';


BEGIN;

ALTER TABLE eso_t_c0020_sr
    ADD COLUMN IF NOT EXISTS genba_kakuninzumi_meibanto_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS shurui_cd CHARACTER(2),
    ADD COLUMN IF NOT EXISTS tkaku_kva_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS seizo_ym_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;


BEGIN;

ALTER TABLE eso_t_c0021_kometer
    ADD COLUMN IF NOT EXISTS meter_yuko_ym_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS ct_yuko_ym_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS seizosha_jiyunyuryoku VARCHAR(32),
    ADD COLUMN IF NOT EXISTS seizosha_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS katashiki_gaitonashi_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS katashiki_jiyunyuryoku VARCHAR(32),
    ADD COLUMN IF NOT EXISTS katashiki_kakuninkonnan_flg INTEGER DEFAULT 0,
    ADD COLUMN IF NOT EXISTS biko VARCHAR(256),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;


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

-- TKAKU_AMPT_CD (CHAR(2)) → tkaku_v_cd (character(2))
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

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'tkaku_v_cd'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            ALTER COLUMN tkaku_v_cd TYPE CHARACTER(2),
            ALTER COLUMN tkaku_v_cd SET DEFAULT '12';
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

-- CAPT_CD (CHAR(2)) → tkaku_kva_cd (character(2))
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

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'tkaku_kva_cd'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            ALTER COLUMN tkaku_kva_cd TYPE CHARACTER(2),
            ALTER COLUMN tkaku_kva_cd SET DEFAULT '12';
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

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0020_sr' 
        AND column_name = 'seizo_nennomi_flg'
    ) THEN
        ALTER TABLE eso_t_c0020_sr
            ALTER COLUMN seizo_nennomi_flg SET DEFAULT 0;
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

-- ============================================
-- データ移行：作成者／作成日／更新者／更新日の設定
-- ============================================
-- ルール：
-- 1. 現行システムで値が設定されている場合：現行の値をそのまま移行（「システム」も維持）
-- 2. 値が未設定の場合：作成者・更新者を 'ikou2027' に、作成日・更新日を「データ移行日」に設定
DO $$
DECLARE
    migration_date TIMESTAMP(6) WITHOUT TIME ZONE := '2025-12-23 00:00:00'::timestamp;
    migration_user VARCHAR(100) := 'ikou2027';
BEGIN
    -- 値が未設定の場合のデフォルト設定
    UPDATE eso_t_c0020_sr
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


BEGIN;

-- ============================================
-- 日付フィールドの変更
-- ============================================

-- CREATE_DT (DATETIME2) → create_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
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
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'CREATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            RENAME COLUMN CREATE_USER TO create_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'create_user'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            ALTER COLUMN create_user TYPE VARCHAR(100),
            ALTER COLUMN create_user SET NOT NULL;
    END IF;
END $$;

-- UPDATE_USER (VARCHAR(24)) → record_user (character varying(100))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'UPDATE_USER'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            RENAME COLUMN UPDATE_USER TO record_user;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'record_user'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            ALTER COLUMN record_user TYPE VARCHAR(100),
            ALTER COLUMN record_user SET NOT NULL;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- METER_SHURUI_CD → meter_shurui
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'METER_SHURUI_CD'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            RENAME COLUMN METER_SHURUI_CD TO meter_shurui;
    END IF;
END $$;

-- TKAKU_SOSENSHIKI_CD → haisen_hoshiki
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'TKAKU_SOSENSHIKI_CD'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            RENAME COLUMN TKAKU_SOSENSHIKI_CD TO haisen_hoshiki;
    END IF;
END $$;

-- TKAKU_VLT_CD → tkaku_v
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'TKAKU_VLT_CD'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            RENAME COLUMN TKAKU_VLT_CD TO tkaku_v;
    END IF;
END $$;

-- TKAKU_VLTT_CD (CHAR(2)) → tkaku_v_cd (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'TKAKU_VLTT_CD'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            RENAME COLUMN TKAKU_VLTT_CD TO tkaku_v_cd;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'tkaku_v_cd'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            ALTER COLUMN tkaku_v_cd TYPE CHARACTER(2),
            ALTER COLUMN tkaku_v_cd SET DEFAULT '01';
    END IF;
END $$;

-- TKAKU_AMP → tkaku_a
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'TKAKU_AMP'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            RENAME COLUMN TKAKU_AMP TO tkaku_a;
    END IF;
END $$;

-- TKAKU_AMPT_CD (CHAR(2)) → tkaku_a_cd (character(2))
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'TKAKU_AMPT_CD'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            RENAME COLUMN TKAKU_AMPT_CD TO tkaku_a_cd;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'tkaku_a_cd'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            ALTER COLUMN tkaku_a_cd TYPE CHARACTER(2),
            ALTER COLUMN tkaku_a_cd SET DEFAULT '12';
    END IF;
END $$;

-- METER_KENMAN_YM → meter_yuko_ym
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'METER_KENMAN_YM'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            RENAME COLUMN METER_KENMAN_YM TO meter_yuko_ym;
    END IF;
END $$;

-- CT_KENMAN_YM → ct_yuko_ym
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'CT_KENMAN_YM'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            RENAME COLUMN CT_KENMAN_YM TO ct_yuko_ym;
    END IF;
END $$;

-- KATASHIKI → katashiki_cd
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'KATASHIKI'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
            RENAME COLUMN KATASHIKI TO katashiki_cd;
    END IF;
END $$;

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0021_kometer' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0021_kometer
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
    migration_date TIMESTAMP(6) WITHOUT TIME ZONE := '2025-12-23 00:00:00'::timestamp;
    migration_user VARCHAR(100) := 'ikou2027';
BEGIN
    -- 値が未設定の場合のデフォルト設定
    UPDATE eso_t_c0021_kometer
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


BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0020_sr_okyaku_zumen_flg_ordr
    ON eso_t_c0020_sr (okyaku_id, zumen_id, shinki_koushin_sakujo_flg, ordr_jn);

COMMIT;



BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0021_kometer_okyaku_zumen_flg_ordr
    ON eso_t_c0021_kometer (okyaku_id, zumen_id, shinki_koushin_sakujo_flg, ordr_jn);

COMMIT;



BEGIN;

ALTER TABLE eso_t_c0021_kometer
    DROP COLUMN IF EXISTS METER_NYURYOKU_HOSHIKI_CD,
    DROP COLUMN IF EXISTS SETCHI_TYPE_CD,
    DROP COLUMN IF EXISTS HASSHIN_SOCHI_CD;

COMMIT;


BEGIN;

COMMENT ON COLUMN eso_t_c0011_keiki.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0011_keiki.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0011_keiki.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0011_keiki.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0011_keiki.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0011_keiki.shurui_cd IS 'コードマスタ 500001';
COMMENT ON COLUMN eso_t_c0011_keiki.tkaku_v_cd IS 'コードマスタ 999001 V固定';
COMMENT ON COLUMN eso_t_c0011_keiki.tkaku_a_cd IS 'コードマスタ 999002 A固定';
COMMENT ON COLUMN eso_t_c0011_keiki.seizo_ym IS '西暦年月';
COMMENT ON COLUMN eso_t_c0011_keiki.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;


BEGIN;

COMMENT ON COLUMN eso_t_c0012_kaiheiki.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.genba_kakuninzumi_meibanto_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.shurui_cd IS 'コードマスタ 510001';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.kyokusu IS 'コードマスタ';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.tkaku_a_cd IS 'コードマスタ 999002 A固定';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.tkaku_a_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.fuse_kva_cd IS 'コードマスタ 999002 A固定';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.fuse_kva_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.kando_a_cd IS 'コードマスタ 999002 mA固定';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.kando_a_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.seizo_ym IS '西暦年月';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.seizo_nennomi_flg IS '0:年月を入力 1:年のみ入力';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.seizo_ym_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0012_kaiheiki.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;


BEGIN;

COMMENT ON COLUMN eso_t_c0013_cable.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0013_cable.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0013_cable.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0013_cable.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0013_cable.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0013_cable.shurui_cd IS 'コードマスタ 520001';
COMMENT ON COLUMN eso_t_c0013_cable.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;


BEGIN;

COMMENT ON COLUMN eso_t_c0014_bundenban.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0014_bundenban.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0014_bundenban.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0014_bundenban.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0014_bundenban.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0014_bundenban.shurui_cd IS 'コードマスタ 530001';
COMMENT ON COLUMN eso_t_c0014_bundenban.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;


BEGIN;

COMMENT ON COLUMN eso_t_c0015_keidenki.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0015_keidenki.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0015_keidenki.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0015_keidenki.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0015_keidenki.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0015_keidenki.shurui_cd IS 'コードマスタ 540001';
COMMENT ON COLUMN eso_t_c0015_keidenki.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;


BEGIN;

COMMENT ON COLUMN eso_t_c0016_ct.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0016_ct.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0016_ct.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0016_ct.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0016_ct.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0016_ct.tkaku_v_cd IS 'コードマスタ 999001 V固定';
COMMENT ON COLUMN eso_t_c0016_ct.tkaku_1ji_a_cd IS 'コードマスタ 999002 A固定';
COMMENT ON COLUMN eso_t_c0016_ct.tkaku_2ji_a_cd IS 'コードマスタ 999002 A固定';
COMMENT ON COLUMN eso_t_c0016_ct.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;


BEGIN;

COMMENT ON COLUMN eso_t_c0017_fuse.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0017_fuse.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0017_fuse.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0017_fuse.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0017_fuse.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0017_fuse.yoryo_cd IS 'コードマスタ 999002 A固定';
COMMENT ON COLUMN eso_t_c0017_fuse.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;


BEGIN;

COMMENT ON COLUMN eso_t_c0018_kansen.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0018_kansen.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0018_kansen.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0018_kansen.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0018_kansen.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0018_kansen.shurui_cd IS 'コードマスタ 550001';
COMMENT ON COLUMN eso_t_c0018_kansen.haisen_su IS '種類により自動設定';
COMMENT ON COLUMN eso_t_c0018_kansen.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;


BEGIN;

COMMENT ON COLUMN eso_t_c0019_sc.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0019_sc.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0019_sc.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0019_sc.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0019_sc.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0019_sc.genba_kakuninzumi_meibanto_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0019_sc.tkaku_v_cd IS 'コードマスタ 999001 V固定';
COMMENT ON COLUMN eso_t_c0019_sc.tkaku_kva_cd IS 'コードマスタ 999203';
COMMENT ON COLUMN eso_t_c0019_sc.tkaku_kva_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0019_sc.seizo_ym IS '西暦年月';
COMMENT ON COLUMN eso_t_c0019_sc.seizo_nennomi_flg IS '0:年月を入力 1:年のみ入力';
COMMENT ON COLUMN eso_t_c0019_sc.seizo_ym_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0019_sc.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;


BEGIN;

COMMENT ON COLUMN eso_t_c0020_sr.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0020_sr.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0020_sr.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0020_sr.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0020_sr.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0020_sr.shurui_cd IS 'コードマスタ 550001';
COMMENT ON COLUMN eso_t_c0020_sr.genba_kakuninzumi_meibanto_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0020_sr.tkaku_v_cd IS 'コードマスタ 999001 V固定';
COMMENT ON COLUMN eso_t_c0020_sr.tkaku_kva_cd IS 'コードマスタ 999204';
COMMENT ON COLUMN eso_t_c0020_sr.tkaku_kva_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0020_sr.seizo_ym IS '西暦年月';
COMMENT ON COLUMN eso_t_c0020_sr.seizo_nennomi_flg IS '0:年月を入力 1:年のみ入力';
COMMENT ON COLUMN eso_t_c0020_sr.seizo_ym_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0020_sr.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;


BEGIN;

COMMENT ON COLUMN eso_t_c0021_kometer.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0021_kometer.zumen_id IS '設備が配置されている図面ID';
COMMENT ON COLUMN eso_t_c0021_kometer.setsubi_id IS '図面上の設備を識別するID 配置後は値が変更されない';
COMMENT ON COLUMN eso_t_c0021_kometer.kotai_id IS '設備の個体を識別するID 設備更新で値が変更される';
COMMENT ON COLUMN eso_t_c0021_kometer.shinsetsu_flg IS 'リリース後の設備状態フラグ 0:既設データ、1:新設データ';
COMMENT ON COLUMN eso_t_c0021_kometer.genba_kakuninzumi_meibanto_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0021_kometer.meter_shurui IS 'コードマスタ 580001';
COMMENT ON COLUMN eso_t_c0021_kometer.haisen_hoshiki IS 'コードマスタ 580003';
COMMENT ON COLUMN eso_t_c0021_kometer.tkaku_v IS 'コードマスタ 580004';
COMMENT ON COLUMN eso_t_c0021_kometer.tkaku_v_cd IS 'コードマスタ 999001 V固定';
COMMENT ON COLUMN eso_t_c0021_kometer.tkaku_a IS 'コードマスタ 580005';
COMMENT ON COLUMN eso_t_c0021_kometer.tkaku_a_cd IS 'コードマスタ 999002 A固定';
COMMENT ON COLUMN eso_t_c0021_kometer.meter_yuko_ym IS '西暦年月';
COMMENT ON COLUMN eso_t_c0021_kometer.meter_yuko_ym_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0021_kometer.ct_yuko_ym IS '西暦年月';
COMMENT ON COLUMN eso_t_c0021_kometer.ct_yuko_ym_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0021_kometer.seizosha_cd IS '製造者マスタ';
COMMENT ON COLUMN eso_t_c0021_kometer.seizosha_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0021_kometer.katashiki_gaitonashi_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0021_kometer.katashiki_kakuninkonnan_flg IS '0:チェック無 1:チェック有';
COMMENT ON COLUMN eso_t_c0021_kometer.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;
