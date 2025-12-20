
-- 2025-12-19_001_create_eso_t_c0014_bundenban.sql
-- 目的：分電盤テーブル作成
-- 作成日: 2025-12-19
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

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

