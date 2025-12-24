# SQL ファイル管理

このディレクトリには、PostgreSQL用のSQLファイルがテーブルグループごとに整理されています。

## フォルダ構成

SQLファイルは、テーブルグループ（モジュール）ごとに以下のような構造で整理されています：

```
sql/
├── teiatsu/              # 低圧関連テーブルグループ
│   ├── migrations/       # マイグレーションファイル
│   ├── queries/          # DMLクエリファイル
│   └── scripts/          # スクリプトファイル
└── zumen_shisutemu/      # 図面・システム関連テーブルグループ
    ├── migrations/
    ├── queries/
    └── scripts/
```

各テーブルグループフォルダ内には、以下の3つのサブフォルダがあります：

### 📁 {table_group}/migrations/
データベース構造の変更（DDL）を管理するマイグレーションファイルを格納します。

**内容：**
- テーブル作成（`001_create_*_table.sql`）
- カラム追加（`002_add_columns_*.sql`）
- カラム変更（`003_alter_columns_*.sql`）
- インデックス作成（`004_create_indexes_*.sql`）
- カラム削除（`005_drop_column_*.sql`）
- カラムコメント追加（`006_add_comments_*.sql`）

**マイグレーションファイルの詳細：**

- **`002_add_columns_*.sql`**: 新しいカラムを追加
  - すべてのテーブルに `shinki_koushin_sakujo_flg INTEGER` を含む
  - `IF NOT EXISTS` を使用して安全に実行可能

- **`003_alter_columns_*.sql`**: カラム名の変更とタイプ変更
  - 構造化されたセクション：
    1. **日付フィールドの変更**: CREATE_DT → create_date, UPDATE_DT → record_date
    2. **ユーザーフィールドの変更**: CREATE_USER → create_user, UPDATE_USER → record_user
    3. **その他のフィールド変更**: テーブル固有のフィールド名変更
  - すべての操作は `DO $$ ... IF EXISTS ... END $$;` ブロックで囲まれ、冪等性を保証

**命名規則：**
- `YYYY-MM-DD_NNN_description_table_name.sql`
- 日付順に実行されるため、日付と連番で順序を管理

**実行方法：**
- マイグレーションツール（Flyway、Liquibase等）で順次実行
- または、手動で日付順に実行

**ファイルパスの例：**
- `teiatsu/migrations/2025-12-18_001_create_eso_t_c0011_keiki_table.sql`

---

### 📁 {table_group}/queries/
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
```javascript
// JavaScript (node-postgres) の例
const fs = require('fs');
const { Pool } = require('pg');

const pool = new Pool({
  // データベース接続設定
});

const query = fs.readFileSync('teiatsu/queries/2025-12-18_insert_eso_t_c0011_keiki_table.sql', 'utf8');
const values = ['1234567890', 12345678, 1, 1, 1, 1, '01', 99.99, '01', 50.00, '12', '202501', '備考', 1, 'user001', 'user001'];

const result = await pool.query(query, values);
```

```python
# Python (psycopg2) の例
cursor.execute(open('teiatsu/queries/2025-12-18_insert_eso_t_c0011_keiki_table.sql').read(), 
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

**ファイルパスの例：**
- `teiatsu/queries/2025-12-18_insert_eso_t_c0011_keiki_table.sql`

---

### 📁 {table_group}/scripts/
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
- `YYYY-MM-DD_example_views_usage.sql` - ビュー作成とテーブル統計情報取得の使用例
- `YYYY-MM-DD_example_functions_usage.sql` - テーブル操作の使用例（INSERT/UPDATE/DELETE）
- `common_table_definitions.sql` - テーブル定義確認クエリ（共通）
- `YYYY-MM-DD_migrate_old_data.sql` - データ移行
- `YYYY-MM-DD_backup_before_update.sql` - バックアップ
- `YYYY-MM-DD_analyze_performance.sql` - パフォーマンス分析
- `YYYY-MM-DD_cleanup_test_data.sql` - テストデータクリーンアップ

**テーブル操作関連のスクリプト：**

1. **`example_views_usage.sql`** - ビュー作成と統計情報取得
   - 各テーブル用のビューを作成（`CREATE OR REPLACE VIEW`）
   - ビュー名は `v_eso_t_c00XX` 形式（例：`v_eso_t_c0011_keiki`）
   - ビューは論理削除されていないレコードのみを返す（`shinki_koushin_sakujo_flg IS DISTINCT FROM 2`）
   - 各日付のファイルには、その日付までに作成されたテーブルの統計情報取得クエリを含む
   - すべてのクエリは `BEGIN/COMMIT` トランザクションで囲まれている

2. **`example_functions_usage.sql`** - テーブル操作の使用例
   - INSERT、UPDATE、DELETE操作の使用例
   - すべてのクエリは `BEGIN/COMMIT` トランザクションで囲まれている
   - 実際のアプリケーションでは、`queries/` フォルダのパラメータ化クエリを使用すること

3. **`common_table_definitions.sql`** - テーブル定義確認クエリ（共通）
   - 全テーブルの定義情報を取得
   - テーブル制約情報を取得
   - すべてのテーブル共通で使用可能

**ファイルパスの例：**
- `teiatsu/scripts/2025-12-18_example_views_usage.sql`
- `teiatsu/scripts/common_table_definitions.sql`

**注意：**
- `example_views_usage.sql` と `example_functions_usage.sql` は実際のテーブルを使用したクエリの例です
- これらのスクリプトは単発実行や調査用です
- 実際のアプリケーションでは、`{table_group}/queries/` フォルダのパラメータ化クエリを使用してください
- スクリプト内のクエリは直接値を指定していますが、本番環境では必ずパラメータ化クエリを使用してください
- すべてのスクリプト内のクエリは `BEGIN/COMMIT` トランザクションで囲まれています

---

## テーブルグループ一覧

### 📦 teiatsu（低圧関連）

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

### 📦 zumen_shisutemu（図面・システム関連）

現在管理されているテーブル：

1. **eso_t_c0005_cad_link** - ハイパーリンク管理テーブル
2. **eso_t_c0006_okyaku_work** - ＣＡＤ編集お客様管理テーブル
3. **eso_t_c0007_image** - 画像情報テーブル
4. **eso_t_c0008_file_work** - 編集画像テーブル
5. **eso_t_c0009_numbering** - 採番テーブル

---

## ファイル命名規則

### マイグレーションファイル
```
YYYY-MM-DD_NNN_operation_table_name.sql
```
- `YYYY-MM-DD`: 作成日
- `NNN`: 連番（001, 002, 003...）
- `operation`: 操作内容（create, add_columns, alter_columns, create_indexes, drop_column, add_comments）
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
   - `alter_columns` ファイルは構造化されたセクションで整理（日付フィールド、ユーザーフィールド、その他）
   - すべての `ALTER` 操作は `IF EXISTS` チェックを使用して冪等性を保証
   - `add_columns` ファイルには必ず `shinki_koushin_sakujo_flg INTEGER` を含む

2. **クエリ**
   - すべてパラメータ化（SQLインジェクション対策）
   - SELECT * は使用しない
   - 必要に応じてインデックスを活用
   - アプリケーションから直接実行される
   - テーブルグループごとに `{table_group}/queries/` フォルダに配置

3. **スクリプト**
   - 実行前に必ずバックアップを取得
   - 実行履歴を記録
   - 本番環境での実行は慎重に
   - 単発実行や調査用途
   - すべてのクエリは `BEGIN/COMMIT` トランザクションで囲む
   - ビューは `CREATE OR REPLACE VIEW` を使用して作成
   - ビューは論理削除されていないレコードのみを返すように設計

---

## ファイル構造の原則

- **テーブルグループごとに整理** - 関連するテーブルは同じグループフォルダに配置
- **各グループ内で3つのサブフォルダを使用** - `migrations/`, `queries/`, `scripts/`
- **命名規則で整理** - ファイル名の日付と操作タイプで管理
- **日付順で実行** - マイグレーションファイルは日付順に実行
- **グループ内で完結** - 各テーブルグループのファイルは、そのグループのフォルダ内に配置

---

## 関連リソース

- PostgreSQL公式ドキュメント: https://www.postgresql.org/docs/
- マイグレーションツール:
  - Flyway: https://flywaydb.org/
  - Liquibase: https://www.liquibase.org/

