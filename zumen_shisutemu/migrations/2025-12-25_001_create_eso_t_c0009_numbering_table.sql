
-- 2025-12-25_001_create_eso_t_c0009_numbering.sql
-- 目的：採番テーブル作成
-- 作成日: 2025-12-25
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

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


