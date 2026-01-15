
-- eso_t_c0015_keidenki.sql for store data migration from ESI_T_K105_CT_KEIDENKI to eso_t_c0015_keidenki
-- 作成日: 2025-01-15
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL

*---------------------------------------------------------*
CREATE OR REPLACE FUNCTION migrate_c0015_keidenki()
RETURNS TABLE(
    total_cnt   int,
    success_cnt int,
    skip_cnt    int,
    error_cnt   int
)
LANGUAGE plpgsql
AS $$
DECLARE
    rec_from RECORD;

    v_total   int := 0;
    v_success int := 0;
    v_skip    int := 0;
    v_error   int := 0;

    v_sqlstate text;
    v_detail   text;

    --------------------------------------------------
    -- テーブル情報
    --------------------------------------------------
    v_fm_table_nm text := 'ESI_T_K105_CT_KEIDENKI';        -- 移行元テーブル名
    v_to_table_nm text := 'eso_t_c0015_keidenki';          -- 移行先テーブル名

    --------------------------------------------------
    -- 更新情報(作成者～更新者)
    --------------------------------------------------
    v_create_date                   eso_t_c0015_keidenki.create_date%TYPE;      -- 作成日
    v_create_user                   eso_t_c0015_keidenki.create_user%TYPE;      -- 作成者
    v_record_date                   eso_t_c0015_keidenki.record_date%TYPE;      -- 更新日
    v_record_user                   eso_t_c0015_keidenki.record_user%TYPE;      -- 更新者

BEGIN
    RAISE LOG 'migration % start',
        v_to_table_nm;

    FOR rec_from IN SELECT * FROM ESI_T_K105_CT_KEIDENKI LOOP
        v_total := v_total + 1;

        BEGIN

            --------------------------------------------------
            -- 作成者及び更新者 情報の編集
            --------------------------------------------------
            -- 作成日＆作成者
            CASE
                WHEN rec_from.create_user = 'システム' THEN
                    v_create_date   := now();                   -- 作成日
                    v_create_user   := 'ikou2027';              -- 作成者
                WHEN rec_from.create_user IS NULL THEN
                    v_create_date   := now();                   -- 作成日
                    v_create_user   := 'ikou2027';              -- 作成者
                ELSE
                    v_create_date   := rec_from.create_dt;      -- 作成日
                    v_create_user   := rec_from.create_user;    -- 作成者
            END CASE;

            -- 更新日＆更新者
            CASE
                WHEN rec_from.update_user = 'システム' THEN
                    v_record_date   := now();                   -- 更新日
                    v_record_user   := 'ikou2027';              -- 更新者
                WHEN rec_from.update_user IS NULL THEN
                    v_record_date   := NULL;                    -- 更新日
                    v_record_user   := NULL;                    -- 更新者
                ELSE
                    v_record_date   := rec_from.update_dt;      -- 更新日
                    v_record_user   := rec_from.update_user;    -- 更新者
            END CASE;

            --------------------------------------------------
            -- INSERT
            --  計電器
            --------------------------------------------------
            INSERT INTO eso_t_c0015_keidenki (
                okyaku_id,                                  -- お客さまID
                zumen_id,                                   -- 図面ID
                setsubi_id,                                 -- 設備ID
                kotai_id,                                   -- 個体ID
                daisu_renban,                               -- 台数連番
                shinsetsu_flg,                              -- 新設フラグ
                shurui_cd,                                  -- 種類
                biko,                                       -- 備考
                ordr_jn,                                    -- 表示順
                create_date,                                -- 作成日
                create_user,                                -- 作成者
                record_date,                                -- 更新日
                record_user,                                -- 更新者
                shinki_koushin_sakujo_flg                   -- 新規・更新・削除フラグ
            ) VALUES (
                rec_from.okyaku_id,	                        -- お客さまID
                rec_from.zumen_id,	                        -- 図面ID
                rec_from.setsubi_id,	                    -- 設備ID
                rec_from.kotai_id,	                        -- 個体ID
                rec_from.daisu_renban,	                    -- 台数連番
                rec_from.shinsetsu_flg,	                    -- 新設フラグ
                rec_from.shurui_cd,	                        -- 種類
                NULL,
                rec_from.ordr,	                            -- 表示順
                rec_from.create_dt,	                        -- 作成日時
                rec_from.create_user,	                    -- 作成ユーザー
                rec_from.update_dt,	                        -- 更新日時
                rec_from.update_user,	                    -- 更新ユーザー
                NULL,
            );

            v_success := v_success + 1;

        --------------------------------------------------
        -- 技術エラー
        --------------------------------------------------
        EXCEPTION
            WHEN OTHERS THEN
                v_error := v_error + 1;

                GET STACKED DIAGNOSTICS
                    v_sqlstate = RETURNED_SQLSTATE,
                    v_detail   = PG_EXCEPTION_DETAIL;

                INSERT INTO migrate_log(txn_timestamp, to_table_nm,log_level, key_info, message)
                VALUES (
                    clock_timestamp,    -- 登録日時
                    v_to_table_nm,      -- 移行元テーブル
                    'ERROR',            -- エラーレベル
                    format('pkey:[%s %s %s %s %s]',
                        rec_from.okyaku_id,
                        rec_from.zumen_id,
                        rec_from.setsubi_id,
                        rec_from.kotai_id,
                        rec_from.daisu_renban),
                    format('sqlstate=%s detail=%s msg=%s',
                           v_sqlstate, v_detail, SQLERRM)
                );

                RAISE LOG
                    'table:% exception: pkey=% sqlstate=% msg=%',
                    v_to_table_nm,
                    format('[%s %s %s %s %s]',
                        rec_from.okyaku_id,
                        rec_from.zumen_id,
                        rec_from.setsubi_id,
                        rec_from.kotai_id,
                        rec_from.daisu_renban),
                    v_sqlstate, SQLERRM;
        END;
    END LOOP;

    RAISE LOG
        'migration % end: total=% success=% skip=% error=%',
        v_to_table_nm, v_total, v_success, v_skip, v_error;

    RETURN QUERY
    SELECT v_total, v_success, v_skip, v_error;
END;
$$;
*---------------------------------------------------------*
