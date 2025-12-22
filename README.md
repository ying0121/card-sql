# SQL ファイル管理

<div align="right">
<details>
<summary><b>English</b></summary>
</details>
</div>

このディレクトリには、PostgreSQL用のSQLファイルが3つのフォルダに整理されています。

## フォルダ構成

### 📁 migrations/
データベース構造の変更（DDL）を管理するマイグレーションファイルを格納します。

**内容：**
- テーブル作成（`001_create_*_table.sql`）
- カラム追加（`002_add_columns_*.sql`）
- カラム変更（`003_alter_columns_*.sql`）
- インデックス作成（`004_create_indexes_*.sql`）
- カラム削除（`005_drop_column_*.sql`）

**命名規則：**
- `YYYY-MM-DD_NNN_description_table_name.sql`
- 日付順に実行されるため、日付と連番で順序を管理

**実行方法：**
- マイグレーションツール（Flyway、Liquibase等）で順次実行
- または、手動で日付順に実行

---

### 📁 queries/
アプリケーションから実行するDMLクエリ（INSERT、SELECT、UPDATE、DELETE）を格納します。

**内容：**
- INSERTクエリ（`*_insert_*.sql`）
- SELECTクエリ（`*_select_*.sql`）
- UPDATEクエリ（`*_update_*.sql`）
- DELETEクエリ（`*_delete_*.sql`）

**特徴：**
- すべてのクエリはパラメータ化（$1, $2形式）を使用
- RETURNING句を使用して結果を返す
- 論理削除をサポート（`shinki_koushin_sakujo_flg IS DISTINCT FROM 2`）
- 各クエリファイルにPREPARE文の使用例をコメントで記載

**命名規則：**
- `YYYY-MM-DD_operation_table_name.sql`

**使用方法：**

1. **アプリケーションから実行（推奨）**
   - パラメータ化クエリとして使用
   - SQLインジェクション対策済み

2. **直接実行（psql等）**
   - 各クエリファイル内のコメントに記載されているPREPARE文の例を使用
   - ファイルを開いて、コメント部分のPREPARE文とEXECUTE文をコピーして実行

**アプリケーションからの使用例：**
```python
# Python (psycopg2) の例
cursor.execute(open('queries/2025-12-18_insert_eso_t_c0011_keiki_table.sql').read(), 
               ('1234567890', 12345678, 1, 1, 1, 1, '01', 99.99, '01', 50.00, '12', '202501', '備考', 1, 'user001', 'user001'))
```

**直接実行する場合：**
各クエリファイルの先頭部分に、PREPARE文とEXECUTE文の例がコメントで記載されています。
ファイルを開いて、コメント部分をコピーして実行してください。

例：
```sql
-- ファイル内のコメントから以下をコピーして実行
PREPARE insert_keiki AS
INSERT INTO eso_t_c0011_keiki (...) VALUES ($1, $2, $3, ...);

EXECUTE insert_keiki('1234567890', 12345678, 1, 1, 1, 1, '01', 99.99, '01', 50.00, '12', '202501', '備考', 1, 'user001', 'user001');
```

**注意：**
- 各クエリファイルには、直接実行するためのPREPARE文の例がコメントで記載されています
- アプリケーションから実行する場合は、そのままパラメータ化クエリとして使用できます
- 直接実行する場合は、ファイル内のPREPARE文の例を参照してください

---

### 📁 scripts/
単発実行や調査用のSQLスクリプトを格納します。

**用途：**
- テーブル操作の使用例・テストクエリ
- データ移行スクリプト
- バックアップ/リストアスクリプト
- データクリーンアップスクリプト
- 調査・分析用クエリ
- テストデータ投入スクリプト
- パフォーマンス調査用クエリ

**命名規則：**
- `YYYY-MM-DD_description.sql`
- または、用途に応じた分かりやすい名前

**例：**
- `YYYY-MM-DD_example_views_usage.sql` - テーブルクエリの使用例（SELECT）
- `YYYY-MM-DD_example_functions_usage.sql` - テーブル操作の使用例（INSERT/UPDATE/DELETE）
- `YYYY-MM-DD_migrate_old_data.sql` - データ移行
- `YYYY-MM-DD_backup_before_update.sql` - バックアップ
- `YYYY-MM-DD_analyze_performance.sql` - パフォーマンス分析
- `YYYY-MM-DD_cleanup_test_data.sql` - テストデータクリーンアップ

**テーブル操作関連のスクリプト：**
- テーブルクエリの使用例（SELECT、論理削除除外）
- テーブル操作の使用例（INSERT、UPDATE、DELETE）
- テーブル定義確認クエリ
- テーブル統計情報取得クエリ

**注意：**
- `example_views_usage.sql` と `example_functions_usage.sql` は実際のテーブルを使用したクエリの例です
- これらのスクリプトは単発実行や調査用です
- 実際のアプリケーションでは、`queries/` フォルダのパラメータ化クエリを使用してください
- スクリプト内のクエリは直接値を指定していますが、本番環境では必ずパラメータ化クエリを使用してください

---

## テーブル一覧

現在管理されているテーブル：

1. **eso_t_c0011_keiki** - 計器類テーブル
2. **eso_t_c0012_kaiheiki** - 低圧開閉器(低圧)テーブル
3. **eso_t_c0013_cable** - 低圧ケーブル管理テーブル
4. **eso_t_c0014_bundenban** - 分電盤テーブル
5. **eso_t_c0015_keidenki** - 計電器テーブル
6. **eso_t_c0016_ct** - 低圧変流器テーブル
7. **eso_t_c0017_fuse** - 低圧ヒューズテーブル
8. **eso_t_c0018_kansen** - 幹線テーブル
9. **eso_t_c0019_sc** - 低圧コンデンサテーブル
10. **eso_t_c0020_sr** - 低圧リアクトルテーブル
11. **eso_t_c0021_kometer** - 子メーターテーブル

---

## ファイル命名規則

### マイグレーションファイル
```
YYYY-MM-DD_NNN_operation_table_name.sql
```
- `YYYY-MM-DD`: 作成日
- `NNN`: 連番（001, 002, 003...）
- `operation`: 操作内容（create, add_columns, alter_columns, create_indexes, drop_column）
- `table_name`: テーブル名

### クエリファイル
```
YYYY-MM-DD_operation_table_name.sql
```
- `YYYY-MM-DD`: 作成日
- `operation`: 操作（insert, select, update, delete）
- `table_name`: テーブル名

---

## ベストプラクティス

1. **マイグレーション**
   - 既存SQLの修正・上書きは禁止
   - 変更は必ず新しいSQLファイルを追加
   - トランザクション（BEGIN/COMMIT）を使用
   - 日付順に実行されるため、日付と連番で順序を管理

2. **クエリ**
   - すべてパラメータ化（SQLインジェクション対策）
   - SELECT * は使用しない
   - 必要に応じてインデックスを活用
   - アプリケーションから直接実行される

3. **スクリプト**
   - 実行前に必ずバックアップを取得
   - 実行履歴を記録
   - 本番環境での実行は慎重に
   - 単発実行や調査用途

---

## ファイル構造の原則

- **サブフォルダは使用しない** - すべてのファイルは各フォルダ直下に配置
- **命名規則で整理** - ファイル名の日付と操作タイプで管理
- **日付順で実行** - マイグレーションファイルは日付順に実行

---

## 関連リソース

- PostgreSQL公式ドキュメント: https://www.postgresql.org/docs/
- マイグレーションツール:
  - Flyway: https://flywaydb.org/
  - Liquibase: https://www.liquibase.org/

---

<details>
<summary><b>English Version</b></summary>

# SQL File Management

This directory contains PostgreSQL SQL files organized into 3 folders.

## Folder Structure

### 📁 migrations/
Stores migration files that manage database structure changes (DDL).

**Contents:**
- Table creation (`001_create_*_table.sql`)
- Column addition (`002_add_columns_*.sql`)
- Column modification (`003_alter_columns_*.sql`)
- Index creation (`004_create_indexes_*.sql`)
- Column deletion (`005_drop_column_*.sql`)

**Naming Convention:**
- `YYYY-MM-DD_NNN_description_table_name.sql`
- Order is managed by date and sequence number for sequential execution

**Execution Method:**
- Execute sequentially using migration tools (Flyway, Liquibase, etc.)
- Or execute manually in date order

---

### 📁 queries/
Stores DML queries (INSERT, SELECT, UPDATE, DELETE) executed from applications.

**Contents:**
- INSERT queries (`*_insert_*.sql`)
- SELECT queries (`*_select_*.sql`)
- UPDATE queries (`*_update_*.sql`)
- DELETE queries (`*_delete_*.sql`)

**Features:**
- All queries use parameterization ($1, $2 format)
- Use RETURNING clause to return results
- Support logical deletion (`shinki_koushin_sakujo_flg IS DISTINCT FROM 2`)
- Each query file includes PREPARE statement examples in comments

**Naming Convention:**
- `YYYY-MM-DD_operation_table_name.sql`

**Usage:**

1. **Execute from Application (Recommended)**
   - Use as parameterized queries
   - SQL injection protection included

2. **Direct Execution (psql, etc.)**
   - Use PREPARE statement examples documented in comments within each query file
   - Open the file and copy the PREPARE and EXECUTE statements from the comments to execute

**Example from Application:**
```python
# Python (psycopg2) example
cursor.execute(open('queries/2025-12-18_insert_eso_t_c0011_keiki_table.sql').read(), 
               ('1234567890', 12345678, 1, 1, 1, 1, '01', 99.99, '01', 50.00, '12', '202501', '備考', 1, 'user001', 'user001'))
```

**For Direct Execution:**
Each query file's header contains PREPARE and EXECUTE statement examples in comments.
Open the file and copy the comment section to execute.

Example:
```sql
-- Copy the following from the file's comments to execute
PREPARE insert_keiki AS
INSERT INTO eso_t_c0011_keiki (...) VALUES ($1, $2, $3, ...);

EXECUTE insert_keiki('1234567890', 12345678, 1, 1, 1, 1, '01', 99.99, '01', 50.00, '12', '202501', '備考', 1, 'user001', 'user001');
```

**Note:**
- Each query file includes PREPARE statement examples in comments for direct execution
- For application execution, use as parameterized queries directly
- For direct execution, refer to the PREPARE statement examples in the file

---

### 📁 scripts/
Stores SQL scripts for one-time execution or investigation purposes.

**Purposes:**
- Table operation examples and test queries
- Data migration scripts
- Backup/restore scripts
- Data cleanup scripts
- Investigation and analysis queries
- Test data insertion scripts
- Performance investigation queries

**Naming Convention:**
- `YYYY-MM-DD_description.sql`
- Or use descriptive names based on purpose

**Examples:**
- `YYYY-MM-DD_example_views_usage.sql` - Table query examples (SELECT)
- `YYYY-MM-DD_example_functions_usage.sql` - Table operation examples (INSERT/UPDATE/DELETE)
- `YYYY-MM-DD_migrate_old_data.sql` - Data migration
- `YYYY-MM-DD_backup_before_update.sql` - Backup
- `YYYY-MM-DD_analyze_performance.sql` - Performance analysis
- `YYYY-MM-DD_cleanup_test_data.sql` - Test data cleanup

**Table Operation Related Scripts:**
- Table query examples (SELECT, excluding logical deletions)
- Table operation examples (INSERT, UPDATE, DELETE)
- Table definition confirmation queries
- Table statistics retrieval queries

**Note:**
- `example_views_usage.sql` and `example_functions_usage.sql` are query examples using actual tables
- These scripts are for one-time execution or investigation purposes
- In actual applications, use parameterized queries from the `queries/` folder
- Scripts specify values directly, but always use parameterized queries in production environments

---

## Table List

Currently managed tables:

1. **eso_t_c0011_keiki** - Instrument Table
2. **eso_t_c0012_kaiheiki** - Low Voltage Switch Table
3. **eso_t_c0013_cable** - Low Voltage Cable Management Table
4. **eso_t_c0014_bundenban** - Distribution Panel Table
5. **eso_t_c0015_keidenki** - Watt-hour Meter Table
6. **eso_t_c0016_ct** - Low Voltage Current Transformer Table
7. **eso_t_c0017_fuse** - Low Voltage Fuse Table
8. **eso_t_c0018_kansen** - Main Line Table
9. **eso_t_c0019_sc** - Low Voltage Capacitor Table
10. **eso_t_c0020_sr** - Low Voltage Reactor Table
11. **eso_t_c0021_kometer** - Sub-meter Table

---

## File Naming Convention

### Migration Files
```
YYYY-MM-DD_NNN_operation_table_name.sql
```
- `YYYY-MM-DD`: Creation date
- `NNN`: Sequence number (001, 002, 003...)
- `operation`: Operation type (create, add_columns, alter_columns, create_indexes, drop_column)
- `table_name`: Table name

### Query Files
```
YYYY-MM-DD_operation_table_name.sql
```
- `YYYY-MM-DD`: Creation date
- `operation`: Operation (insert, select, update, delete)
- `table_name`: Table name

---

## Best Practices

1. **Migrations**
   - Modifying or overwriting existing SQL is prohibited
   - Always add new SQL files for changes
   - Use transactions (BEGIN/COMMIT)
   - Order is managed by date and sequence number for sequential execution

2. **Queries**
   - All queries are parameterized (SQL injection protection)
   - Do not use SELECT *
   - Utilize indexes as needed
   - Executed directly from applications

3. **Scripts**
   - Always backup before execution
   - Record execution history
   - Execute carefully in production environments
   - For one-time execution or investigation purposes

---

## File Structure Principles

- **No subfolders** - All files are placed directly in each folder
- **Organized by naming convention** - Managed by date and operation type in file names
- **Execute in date order** - Migration files are executed in date order

---

## Related Resources

- PostgreSQL Official Documentation: https://www.postgresql.org/docs/
- Migration Tools:
  - Flyway: https://flywaydb.org/
  - Liquibase: https://www.liquibase.org/

</details>
