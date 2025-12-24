
-- 2025-12-25_001_create_eso_t_c0008_file_work.sql
-- 目的：編集画像テーブル作成
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

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


