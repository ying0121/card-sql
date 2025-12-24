-- zumen_shisutemu_all_migrations.sql
-- 目的：zumen_shisutemu フォルダ内のすべてのマイグレーションファイルを統合
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

CREATE TABLE IF NOT EXISTS eso_t_c0005_cad_link (
    okyaku_id                       CHARACTER(10) NOT NULL,
    link_moto_id                    NUMERIC(8) NOT NULL,
    moto_zumen_id                   NUMERIC(8) NOT NULL,
    link_saki_id                    NUMERIC(8) NOT NULL,
    saki_zumen_id                   NUMERIC(8) NOT NULL,

    saki_title_mj                   VARCHAR(128),
    saki_name_mj                    VARCHAR(30),
    saki_setsubi_id                 NUMERIC(8),
    saki_shubetsu_mj                CHARACTER(4),
    moto_zumen_han_su               NUMERIC(8),
    saki_zumen_han_su               NUMERIC(8),
    saki_zumen_shubetsu_su          INTEGER,

    create_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                     VARCHAR(100) NOT NULL,
    record_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                     VARCHAR(100) NOT NULL,
    shinki_koushin_sakujo_flg       INTEGER,

    CONSTRAINT pk_eso_t_c0005_cad_link PRIMARY KEY (
        okyaku_id,
        link_moto_id,
        moto_zumen_id,
        link_saki_id,
        saki_zumen_id
    )
);

COMMENT ON TABLE eso_t_c0005_cad_link IS 'ハイパーリンク管理テーブル';


CREATE TABLE IF NOT EXISTS eso_t_c0006_okyaku_work (
    okyaku_id                       CHARACTER(10) NOT NULL,
    yoto_kbn                        CHARACTER(2) NOT NULL,
    user_nm_mj                      VARCHAR(24) NOT NULL,
    lock_flg                        INTEGER NOT NULL,

    edit_flg                        INTEGER,
    tenkenjisseki_id                VARCHAR(10),
    json_binary_byt                 BYTEA,
    zumen_binary_byt                BYTEA,
    renkei_mode_su                  INTEGER,

    create_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                     VARCHAR(100) NOT NULL,
    record_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                     VARCHAR(100) NOT NULL,
    shinki_koushin_sakujo_flg       INTEGER,

    CONSTRAINT pk_eso_t_c0006_okyaku_work PRIMARY KEY (
        okyaku_id,
        yoto_kbn,
        user_nm_mj,
        lock_flg
    )
);

COMMENT ON TABLE eso_t_c0006_okyaku_work IS 'ＣＡＤ編集お客様管理テーブル';


CREATE TABLE IF NOT EXISTS eso_t_c0007_image (
    okyaku_id                       CHARACTER(10) NOT NULL,
    image_id                        VARCHAR(40) NOT NULL,
    image_kbn_su                    NUMERIC(8) NOT NULL,
    shikibetsu_id                   VARCHAR(10) NOT NULL,
    zumen_id                        NUMERIC(8),
    title_mj                        VARCHAR(256),
    ordr_jn                         NUMERIC(3),
    file_name_mj                    VARCHAR(256),
    create_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                     VARCHAR(100) NOT NULL,
    record_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                     VARCHAR(100) NOT NULL,
    shinki_koushin_sakujo_flg       INTEGER,
    CONSTRAINT pk_eso_t_c0007_image PRIMARY KEY (
        okyaku_id,
        image_id
    )
);

COMMENT ON TABLE eso_t_c0007_image IS '画像情報テーブル';



BEGIN;

ALTER TABLE eso_t_c0005_cad_link
    ADD COLUMN IF NOT EXISTS create_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    ADD COLUMN IF NOT EXISTS create_user VARCHAR(100) NOT NULL,
    ADD COLUMN IF NOT EXISTS record_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    ADD COLUMN IF NOT EXISTS record_user VARCHAR(100) NOT NULL,
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;


BEGIN;

ALTER TABLE eso_t_c0006_okyaku_work
    ADD COLUMN IF NOT EXISTS create_user VARCHAR(100),
    ADD COLUMN IF NOT EXISTS record_user VARCHAR(100),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;


BEGIN;

ALTER TABLE eso_t_c0007_image
    ADD COLUMN IF NOT EXISTS create_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    ADD COLUMN IF NOT EXISTS create_user VARCHAR(100) NOT NULL,
    ADD COLUMN IF NOT EXISTS record_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    ADD COLUMN IF NOT EXISTS record_user VARCHAR(100) NOT NULL,
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;



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

-- ============================================
-- データ移行：作成者／作成日／更新者／更新日の設定
-- ============================================
-- ルール：
-- 1. 現行システムで値が設定されている場合：現行の値をそのまま移行（「システム」も維持）
-- 2. 値が未設定の場合：作成者・更新者を 'ikou2027' に、作成日・更新日を「データ移行日」に設定
DO $$
DECLARE
    migration_date TIMESTAMP(6) WITHOUT TIME ZONE := '2025-12-24 00:00:00'::timestamp;
    migration_user VARCHAR(100) := 'ikou2027';
BEGIN
    -- 値が未設定の場合のデフォルト設定
    UPDATE eso_t_c0006_okyaku_work
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



BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0005_cad_link_okyaku_flg
    ON eso_t_c0005_cad_link (okyaku_id, shinki_koushin_sakujo_flg);

COMMIT;



BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0006_okyaku_work_okyaku_flg
    ON eso_t_c0006_okyaku_work (okyaku_id, shinki_koushin_sakujo_flg);

COMMIT;



BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0007_image_okyaku_flg
    ON eso_t_c0007_image (okyaku_id, shinki_koushin_sakujo_flg);

COMMIT;



BEGIN;

ALTER TABLE eso_t_c0005_cad_link
    DROP COLUMN IF EXISTS KYOKAI_CD;

COMMIT;



BEGIN;

ALTER TABLE eso_t_c0006_okyaku_work
    DROP COLUMN IF EXISTS KYOKAI_CD;

COMMIT;



BEGIN;

ALTER TABLE eso_t_c0007_image
    DROP COLUMN IF EXISTS KYOKAI_CD;

COMMIT;



BEGIN;

COMMENT ON COLUMN eso_t_c0005_cad_link.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0005_cad_link.link_moto_id IS 'リンク元ID';
COMMENT ON COLUMN eso_t_c0005_cad_link.moto_zumen_id IS 'リンク元図面ID';
COMMENT ON COLUMN eso_t_c0005_cad_link.link_saki_id IS 'リンク先ID';
COMMENT ON COLUMN eso_t_c0005_cad_link.saki_zumen_id IS 'リンク先図面ID';
COMMENT ON COLUMN eso_t_c0005_cad_link.saki_title_mj IS 'リンク先タイトル';
COMMENT ON COLUMN eso_t_c0005_cad_link.saki_name_mj IS 'リンク先名称';
COMMENT ON COLUMN eso_t_c0005_cad_link.saki_setsubi_id IS 'リンク先設備ID';
COMMENT ON COLUMN eso_t_c0005_cad_link.saki_shubetsu_mj IS 'リンク先種別';
COMMENT ON COLUMN eso_t_c0005_cad_link.moto_zumen_han_su IS 'リンク元図面版数';
COMMENT ON COLUMN eso_t_c0005_cad_link.saki_zumen_han_su IS 'リンク先図面版数';
COMMENT ON COLUMN eso_t_c0005_cad_link.saki_zumen_shubetsu_su IS 'リンク先図面種別数';
COMMENT ON COLUMN eso_t_c0005_cad_link.create_date IS '作成日時';
COMMENT ON COLUMN eso_t_c0005_cad_link.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0005_cad_link.record_date IS '記録日時';
COMMENT ON COLUMN eso_t_c0005_cad_link.record_user IS '記録者';
COMMENT ON COLUMN eso_t_c0005_cad_link.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;



BEGIN;

COMMENT ON COLUMN eso_t_c0006_okyaku_work.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.yoto_kbn IS '用途区分';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.user_nm_mj IS 'ユーザー名';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.lock_flg IS 'ロックフラグ';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.edit_flg IS '編集フラグ';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.tenkenjisseki_id IS '点検実績ID';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.json_binary_byt IS 'JSONバイナリ';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.zumen_binary_byt IS '図面バイナリ';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.renkei_mode_su IS '連携モード数';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.create_date IS '作成日時';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.record_date IS '記録日時';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.record_user IS '記録者';
COMMENT ON COLUMN eso_t_c0006_okyaku_work.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;



BEGIN;

COMMENT ON COLUMN eso_t_c0007_image.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0007_image.image_id IS '画像ID';
COMMENT ON COLUMN eso_t_c0007_image.image_kbn_su IS '画像区分数';
COMMENT ON COLUMN eso_t_c0007_image.shikibetsu_id IS '識別ID';
COMMENT ON COLUMN eso_t_c0007_image.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0007_image.title_mj IS 'タイトル';
COMMENT ON COLUMN eso_t_c0007_image.ordr_jn IS '順序';
COMMENT ON COLUMN eso_t_c0007_image.file_name_mj IS 'ファイル名';
COMMENT ON COLUMN eso_t_c0007_image.create_date IS '作成日時';
COMMENT ON COLUMN eso_t_c0007_image.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0007_image.record_date IS '記録日時';
COMMENT ON COLUMN eso_t_c0007_image.record_user IS '記録者';
COMMENT ON COLUMN eso_t_c0007_image.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;



CREATE TABLE IF NOT EXISTS eso_t_c0008_file_work (
    okyaku_id                       CHARACTER(10) NOT NULL,
    image_id                        VARCHAR(40) NOT NULL,
    lock_flg                        INTEGER NOT NULL,
    image_kbn_su                    NUMERIC(8) NOT NULL,
    shikibetsu_id                   VARCHAR(10) NOT NULL,
    zumen_id                        NUMERIC(8),
    title_mj                        VARCHAR(256),
    ordr_jn                         NUMERIC(3),
    file_kbn_mj                     VARCHAR(1),
    file_name_mj                    VARCHAR(256),
    file_binary_byt                 BYTEA,
    create_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                     VARCHAR(100) NOT NULL,
    record_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                     VARCHAR(100) NOT NULL,
    shinki_koushin_sakujo_flg       INTEGER,
    CONSTRAINT pk_eso_t_c0008_file_work PRIMARY KEY (
        okyaku_id,
        image_id,
        lock_flg
    )
);

COMMENT ON TABLE eso_t_c0008_file_work IS '編集画像テーブル';



CREATE TABLE IF NOT EXISTS eso_t_c0009_numbering (
    okyaku_id                       CHARACTER(10) NOT NULL,
    yoto_kbn                        CHARACTER(2) NOT NULL,
    value_su                        INTEGER,
    biko_mj                         VARCHAR(128),
    create_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                     VARCHAR(100) NOT NULL,
    record_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                     VARCHAR(100) NOT NULL,
    shinki_koushin_sakujo_flg       INTEGER,
    CONSTRAINT pk_eso_t_c0009_numbering PRIMARY KEY (
        okyaku_id,
        yoto_kbn
    )
);

COMMENT ON TABLE eso_t_c0009_numbering IS '採番テーブル';



BEGIN;

ALTER TABLE eso_t_c0008_file_work
    ADD COLUMN IF NOT EXISTS create_user VARCHAR(100),
    ADD COLUMN IF NOT EXISTS record_user VARCHAR(100),
    ADD COLUMN IF NOT EXISTS shinki_koushin_sakujo_flg INTEGER;

COMMIT;



BEGIN;

ALTER TABLE eso_t_c0009_numbering
    ADD COLUMN IF NOT EXISTS create_user VARCHAR(100),
    ADD COLUMN IF NOT EXISTS record_user VARCHAR(100),
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
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'CREATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN CREATE_DT TO create_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'create_date'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            ALTER COLUMN create_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- UPDATE_DT (DATETIME2) → record_date (timestamp(6) without time zone)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'UPDATE_DT'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN UPDATE_DT TO record_date;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'record_date'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            ALTER COLUMN record_date TYPE TIMESTAMP(6) WITHOUT TIME ZONE;
    END IF;
END $$;

-- ============================================
-- その他のフィールド変更
-- ============================================

-- IMAGE_KBN → image_kbn_su
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'IMAGE_KBN'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN IMAGE_KBN TO image_kbn_su;
    END IF;
END $$;

-- image_kbn_su フィールドにNOT NULL制約を設定
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'image_kbn_su'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            ALTER COLUMN image_kbn_su SET NOT NULL;
    END IF;
END $$;

-- TITLE → title_mj
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'TITLE'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN TITLE TO title_mj;
    END IF;
END $$;

-- ORDR → ordr_jn
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'ORDR'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN ORDR TO ordr_jn;
    END IF;
END $$;

-- FILE_KBN → file_kbn_mj
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'FILE_KBN'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN FILE_KBN TO file_kbn_mj;
    END IF;
END $$;

-- FILE_NAME → file_name_mj
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'FILE_NAME'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN FILE_NAME TO file_name_mj;
    END IF;
END $$;

-- FILE_BINARY (VARCHAR(MAX)) → file_binary_byt (bytea)
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'FILE_BINARY'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            RENAME COLUMN FILE_BINARY TO file_binary_byt;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'eso_t_c0008_file_work' 
        AND column_name = 'file_binary_byt'
    ) THEN
        ALTER TABLE eso_t_c0008_file_work
            ALTER COLUMN file_binary_byt TYPE BYTEA;
    END IF;
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



BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0008_file_work_okyaku_flg
    ON eso_t_c0008_file_work (okyaku_id, shinki_koushin_sakujo_flg);

COMMIT;



BEGIN;

-- WHERE句とORDER BY句で使用されるカラムにインデックスを作成
CREATE INDEX IF NOT EXISTS idx_eso_t_c0009_numbering_okyaku_flg
    ON eso_t_c0009_numbering (okyaku_id, shinki_koushin_sakujo_flg);

COMMIT;



BEGIN;

ALTER TABLE eso_t_c0008_file_work
    DROP COLUMN IF EXISTS KYOKAI_CD;

COMMIT;



BEGIN;

ALTER TABLE eso_t_c0009_numbering
    DROP COLUMN IF EXISTS KYOKAI_CD;

COMMIT;



BEGIN;

COMMENT ON COLUMN eso_t_c0008_file_work.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0008_file_work.image_id IS '画像ID';
COMMENT ON COLUMN eso_t_c0008_file_work.lock_flg IS 'ロックフラグ';
COMMENT ON COLUMN eso_t_c0008_file_work.image_kbn_su IS '画像区分数';
COMMENT ON COLUMN eso_t_c0008_file_work.shikibetsu_id IS '識別ID';
COMMENT ON COLUMN eso_t_c0008_file_work.zumen_id IS '図面ID';
COMMENT ON COLUMN eso_t_c0008_file_work.title_mj IS 'タイトル';
COMMENT ON COLUMN eso_t_c0008_file_work.ordr_jn IS '順序';
COMMENT ON COLUMN eso_t_c0008_file_work.file_kbn_mj IS 'ファイル区分';
COMMENT ON COLUMN eso_t_c0008_file_work.file_name_mj IS 'ファイル名';
COMMENT ON COLUMN eso_t_c0008_file_work.file_binary_byt IS 'ファイルバイナリ';
COMMENT ON COLUMN eso_t_c0008_file_work.create_date IS '作成日時';
COMMENT ON COLUMN eso_t_c0008_file_work.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0008_file_work.record_date IS '記録日時';
COMMENT ON COLUMN eso_t_c0008_file_work.record_user IS '記録者';
COMMENT ON COLUMN eso_t_c0008_file_work.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;



BEGIN;

COMMENT ON COLUMN eso_t_c0009_numbering.okyaku_id IS '場所ID';
COMMENT ON COLUMN eso_t_c0009_numbering.yoto_kbn IS '用途区分';
COMMENT ON COLUMN eso_t_c0009_numbering.value_su IS '値';
COMMENT ON COLUMN eso_t_c0009_numbering.biko_mj IS '備考';
COMMENT ON COLUMN eso_t_c0009_numbering.create_date IS '作成日時';
COMMENT ON COLUMN eso_t_c0009_numbering.create_user IS '作成者';
COMMENT ON COLUMN eso_t_c0009_numbering.record_date IS '記録日時';
COMMENT ON COLUMN eso_t_c0009_numbering.record_user IS '記録者';
COMMENT ON COLUMN eso_t_c0009_numbering.shinki_koushin_sakujo_flg IS '0:新規 1:更新 2:削除';

COMMIT;
