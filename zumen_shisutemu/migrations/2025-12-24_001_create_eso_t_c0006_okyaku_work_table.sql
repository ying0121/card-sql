
-- 2025-12-24_001_create_eso_t_c0006_okyaku_work.sql
-- 目的： ＣＡＤ編集お客様管理テーブル作成
-- 作成日: 2025-12-24
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

CREATE TABLE IF NOT EXISTS eso_t_c0006_okyaku_work (
    okyaku_id                       CHARACTER(10) NOT NULL,
    yoto_kbn                        CHARACTER(2) NOT NULL,
    user_nm_mj                      VARCHAR(24) NOT NULL,
    lock_flg                        INTEGER NOT NULL,

    edit_flg                        INTEGER,
    tenkenjisseki_id                VARCHAR(10),
    json_binary_byt                 BYTEA,
    zumen_binary_byt                BYTEA,
    renkei_mode_su                  INTEGER,

    create_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    create_user                     VARCHAR(100) NOT NULL,
    record_date                     TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now(),
    record_user                     VARCHAR(100) NOT NULL,
    shinki_koushin_sakujo_flg       INTEGER,

    CONSTRAINT pk_eso_t_c0006_okyaku_work PRIMARY KEY (
        okyaku_id,
        yoto_kbn,
        user_nm_mj,
        lock_flg
    )
);

COMMENT ON TABLE eso_t_c0006_okyaku_work IS 'ＣＡＤ編集お客様管理テーブル';

