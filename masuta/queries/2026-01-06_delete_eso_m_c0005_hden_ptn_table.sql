
-- 2026-01-06_delete_eso_m_c0005_hden_ptn.sql
-- 目的：発電所パターンマスタテーブル削除
-- 作成日: 2026-01-06
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
--
-- 使用方法：
-- 1. アプリケーションから実行（推奨）：パラメータ化クエリとして使用
-- 2. 直接実行する場合：以下のPREPARE文を使用
--
-- PREPARE delete_hden_ptn AS
-- DELETE FROM eso_m_c0005_hden_ptn WHERE yobihatsu_hden_kbn_cd = $1;
--
-- EXECUTE delete_hden_ptn('01');

DELETE FROM eso_m_c0005_hden_ptn
WHERE
    yobihatsu_hden_kbn_cd = $1
RETURNING *;

