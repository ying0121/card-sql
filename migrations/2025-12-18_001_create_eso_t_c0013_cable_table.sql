
-- 2025-12-18_001_create_eso_t_c0013_cable.sql
-- 目的： 低圧ケーブル管理テーブル作成
-- 作成日: 2025-12-18
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

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
