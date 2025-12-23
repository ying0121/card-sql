
-- 2025-12-24_001_create_eso_t_c0005_cad_link.sql
-- 目的： ハイパーリンク管理テーブル作成
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

