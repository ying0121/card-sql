
-- 2025-12-18_001_create_eso_t_c0012_kaiheiki.sql
-- 目的：低圧開閉器(低圧)テーブル作成
-- 作成日：2025-12-18
-- 作成者：浦大輔
-- 対象DB：PostgreSQL

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
