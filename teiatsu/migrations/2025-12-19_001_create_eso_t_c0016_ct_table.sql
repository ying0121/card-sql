
-- 2025-12-19_001_create_eso_t_c0016_ct.sql
-- 目的：低圧変流器テーブル作成
-- 作成日: 2025-12-19
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

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

    biko                            VARCHAR(256),

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

