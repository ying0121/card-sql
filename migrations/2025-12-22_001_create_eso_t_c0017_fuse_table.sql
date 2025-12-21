
-- 2025-12-22_001_create_eso_t_c0017_fuse.sql
-- 目的： 低圧ヒューズテーブル作成
-- 作成日: 2025-12-22
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

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

