
-- 2025-12-24_001_create_eso_t_c0007_image.sql
-- 目的：画像情報テーブル作成
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

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


