
-- 2025-12-23_001_create_eso_t_c0021_kometer.sql
-- 目的： 子メーターテーブル作成
-- 作成日: 2025-12-23
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

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
    meter_yuko_ym_kakuninkonnan_flg INTEGER DEFAULT 0,

    ct_yuko_ym                     CHARACTER(6),
    ct_yuko_ym_kakuninkonnan_flg    INTEGER DEFAULT 0,

    seizosha_cd                    CHARACTER(4),
    seizosha_jiyunyuryoku          VARCHAR(32),
    seizosha_kakuninkonnan_flg     INTEGER DEFAULT 0,

    katashiki_cd                   CHARACTER(4),
    katashiki_gaitonashi_flg       INTEGER DEFAULT 0,
    katashiki_jiyunyuryoku         VARCHAR(32),
    katashiki_kakuninkonnan_flg    INTEGER DEFAULT 0,

    biko                           VARCHAR(256),

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

