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

---

## 📁 {table_group}/migrations/

データベース構造の変更（DDL）を管理するマイグレーションファイルを格納します。

### マイグレーションファイルの種類

1. **`001_create_*_table.sql`** - テーブル作成
   - テーブルの基本構造を定義
   - 主キー制約を含む
   - `IF NOT EXISTS` を使用して安全に実行可能
   - すべてのテーブルに以下の共通フィールドを含む：
     - `create_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now()` - 作成日時
     - `create_user VARCHAR(100) NOT NULL` - 作成者
     - `record_date TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now()` - 記録日時
     - `record_user VARCHAR(100) NOT NULL` - 記録者
     - `shinki_koushin_sakujo_flg INTEGER` - 新規・更新・削除フラグ（0:新規、1:更新、2:削除）

2. **`002_add_columns_*.sql`** - カラム追加
   - 新しいカラムを追加
   - すべてのテーブルに `shinki_koushin_sakujo_flg INTEGER` を含む
   - `IF NOT EXISTS` を使用して安全に実行可能
   - 既存テーブルに後から追加する場合に使用

3. **`003_alter_columns_*.sql`** - カラム名の変更、タイプ変更、デフォルト値の設定
   - **構造化されたセクション**：
     1. **日付フィールドの変更**: CREATE_DT → create_date, UPDATE_DT → record_date
        - タイプ変更: DATETIME2 → TIMESTAMP(6) WITHOUT TIME ZONE
     2. **ユーザーフィールドの変更**: CREATE_USER → create_user, UPDATE_USER → record_user
        - タイプ変更: VARCHAR(24) → VARCHAR(100)
        - NOT NULL制約の設定
     3. **その他のフィールド変更**: テーブル固有のフィールド名変更、タイプ変更、デフォルト値の設定
   - **データ移行ロジック**（COMMIT前）：
     - 現行システムで値が設定されている場合：現行の値をそのまま移行（「システム」も維持）
     - 値が未設定の場合：
       - 作成者・更新者を `'ikou2027'` に設定
       - 作成日・更新日を「データ移行日」（各ファイルの日付）に設定
   - すべての操作は `DO $$ ... IF EXISTS ... END $$;` ブロックで囲まれ、冪等性を保証
   - デフォルト値の設定は、カラム名変更とタイプ変更の後に実行される
   - デフォルト値を削除する場合は `ALTER COLUMN ... DROP DEFAULT` を使用

4. **`004_create_indexes_*.sql`** - インデックス作成
   - WHERE句とORDER BY句で使用されるカラムにインデックスを作成
   - `IF NOT EXISTS` を使用して安全に実行可能
   - 主に `(okyaku_id, shinki_koushin_sakujo_flg)` の組み合わせにインデックスを作成

5. **`005_drop_column_*.sql`** - カラム削除
   - 不要になったカラムを削除
   - `IF EXISTS` を使用して安全に実行可能
   - 主に `KYOKAI_CD` カラムの削除に使用

6. **`006_add_comments_*.sql`** - カラムコメント追加
   - テーブルとカラムにコメントを追加
   - 日本語での説明を記載
   - `shinki_koushin_sakujo_flg` には「0:新規 1:更新 2:削除」の説明を記載

### 命名規則

```
YYYY-MM-DD_NNN_operation_table_name.sql
```

- `YYYY-MM-DD`: 作成日（実行順序を決定）
- `NNN`: 連番（001, 002, 003...）
- `operation`: 操作内容（create, add_columns, alter_columns, create_indexes, drop_column, add_comments）
- `table_name`: テーブル名

### 実行方法

- マイグレーションツール（Flyway、Liquibase等）で順次実行
- または、手動で日付順に実行
- 各マイグレーションファイルは `BEGIN/COMMIT` トランザクションで囲まれている

### データ移行ルール

`003_alter_columns_*.sql` ファイルには、データ移行時の「作成者／作成日／更新者／更新日」取り扱いルールが実装されています：

1. **現行システムで値が設定されている場合**：現行の値をそのまま移行
   - 現行で「システム」と設定されている場合も、その値を維持

2. **値が未設定の場合**：
   - 作成者・更新者を `'ikou2027'` に設定
   - 作成日・更新日を「データ移行日」（各ファイルの日付）に設定

**実装例：**
```sql
-- ============================================
-- データ移行：作成者／作成日／更新者／更新日の設定
-- ============================================
DO $$
DECLARE
    migration_date TIMESTAMP(6) WITHOUT TIME ZONE := '2025-12-18 00:00:00'::timestamp;
    migration_user VARCHAR(100) := 'ikou2027';
BEGIN
    UPDATE eso_t_c0011_keiki
    SET
        create_user = CASE 
            WHEN create_user IS NOT NULL AND TRIM(create_user) != '' 
            THEN create_user 
            ELSE migration_user 
        END,
        create_date = COALESCE(create_date, migration_date),
        record_user = CASE 
            WHEN record_user IS NOT NULL AND TRIM(record_user) != '' 
            THEN record_user 
            ELSE migration_user 
        END,
        record_date = COALESCE(record_date, migration_date)
    WHERE
        (create_user IS NULL OR TRIM(create_user) = '')
        OR create_date IS NULL
        OR (record_user IS NULL OR TRIM(record_user) = '')
        OR record_date IS NULL;
END $$;
```

### ファイルパスの例

- `teiatsu/migrations/2025-12-18_001_create_eso_t_c0011_keiki_table.sql`
- `zumen_shisutemu/migrations/2025-12-24_003_alter_columns_eso_t_c0006_okyaku_work_table.sql`

---

## 📁 {table_group}/queries/

アプリケーションから実行するDMLクエリ（INSERT、SELECT、UPDATE、DELETE）を格納します。

### クエリの種類

- **INSERTクエリ**（`*_insert_*.sql`）- 新規レコードの挿入
- **SELECTクエリ**（`*_select_*.sql`）- レコードの検索
- **UPDATEクエリ**（`*_update_*.sql`）- レコードの更新
- **DELETEクエリ**（`*_delete_*.sql`）- レコードの論理削除（`shinki_koushin_sakujo_flg = 2` に設定）

### 特徴

- すべてのクエリはパラメータ化（`$1, $2`形式）を使用
- SQLインジェクション対策済み
- `RETURNING`句を使用して結果を返す（INSERT/UPDATE/DELETE）
- 論理削除をサポート（`shinki_koushin_sakujo_flg IS DISTINCT FROM 2`）
- 各クエリファイルにPREPARE文の使用例をコメントで記載

### 命名規則

```
YYYY-MM-DD_operation_table_name.sql
```

- `YYYY-MM-DD`: 作成日
- `operation`: 操作（insert, select, update, delete）
- `table_name`: テーブル名

### 使用方法

#### 1. アプリケーションから実行（推奨）

パラメータ化クエリとして使用します。

**JavaScript (node-postgres) の例：**
```javascript
const fs = require('fs');
const { Pool } = require('pg');

const pool = new Pool({
  // データベース接続設定
});

const query = fs.readFileSync('teiatsu/queries/2025-12-18_insert_eso_t_c0011_keiki_table.sql', 'utf8');
const values = ['1234567890', 12345678, 1, 1, 1, 1, '01', 99.99, '01', 50.00, '12', '202501', '備考', 1, 'user001', 'user001'];

const result = await pool.query(query, values);
```

**Python (psycopg2) の例：**
```python
cursor.execute(open('teiatsu/queries/2025-12-18_insert_eso_t_c0011_keiki_table.sql').read(), 
               ('1234567890', 12345678, 1, 1, 1, 1, '01', 99.99, '01', 50.00, '12', '202501', '備考', 1, 'user001', 'user001'))
```

#### 2. 直接実行（psql等）

各クエリファイルの先頭部分に、PREPARE文とEXECUTE文の例がコメントで記載されています。
ファイルを開いて、コメント部分をコピーして実行してください。

**例：**
```sql
-- ファイル内のコメントから以下をコピーして実行
PREPARE insert_keiki AS
INSERT INTO eso_t_c0011_keiki (...) VALUES ($1, $2, $3, ...);

EXECUTE insert_keiki('1234567890', 12345678, 1, 1, 1, 1, '01', 99.99, '01', 50.00, '12', '202501', '備考', 1, 'user001', 'user001');
```

### 注意事項

- 各クエリファイルには、直接実行するためのPREPARE文の例がコメントで記載されています
- アプリケーションから実行する場合は、そのままパラメータ化クエリとして使用できます
- 直接実行する場合は、ファイル内のPREPARE文の例を参照してください

### ファイルパスの例

- `teiatsu/queries/2025-12-18_insert_eso_t_c0011_keiki_table.sql`
- `zumen_shisutemu/queries/2025-12-24_select_eso_t_c0005_cad_link_table.sql`

---

## 📁 {table_group}/scripts/

単発実行や調査用のSQLスクリプトを格納します。

### 用途

- テーブル操作の使用例・テストクエリ
- ビュー作成と統計情報取得
- データ移行スクリプト
- バックアップ/リストアスクリプト
- データクリーンアップスクリプト
- 調査・分析用クエリ
- テストデータ投入スクリプト
- パフォーマンス調査用クエリ

### 命名規則

```
YYYY-MM-DD_description.sql
```

または、用途に応じた分かりやすい名前

### スクリプトの種類

#### 1. `YYYY-MM-DD_example_views_usage.sql` - ビュー作成と統計情報取得

- 各テーブル用のビューを作成（`CREATE OR REPLACE VIEW`）
- ビュー名は `v_eso_t_c00XX` 形式（例：`v_eso_t_c0011_keiki`）
- ビューは論理削除されていないレコードのみを返す（`shinki_koushin_sakujo_flg IS DISTINCT FROM 2`）
- 各日付のファイルには、その日付までに作成されたテーブルの統計情報取得クエリを含む
- すべてのクエリは `BEGIN/COMMIT` トランザクションで囲まれている

**ファイル構成：**
- `teiatsu/scripts/2025-12-18_example_views_usage.sql` - c0011, c0012, c0013
- `teiatsu/scripts/2025-12-19_example_views_usage.sql` - c0014, c0015, c0016
- `teiatsu/scripts/2025-12-22_example_views_usage.sql` - c0017, c0018, c0019
- `teiatsu/scripts/2025-12-23_example_views_usage.sql` - c0020, c0021
- `zumen_shisutemu/scripts/2025-12-24_example_views_usage.sql` - c0005, c0006, c0007
- `zumen_shisutemu/scripts/2025-12-25_example_views_usage.sql` - c0008, c0009

#### 2. `YYYY-MM-DD_example_functions_usage.sql` - テーブル操作の使用例

- INSERT、UPDATE、DELETE操作の使用例
- すべてのクエリは `BEGIN/COMMIT` トランザクションで囲まれている
- 実際のアプリケーションでは、`queries/` フォルダのパラメータ化クエリを使用すること
- 各テーブルの操作例を日付ごとに分割

**ファイル構成：**
- `teiatsu/scripts/2025-12-18_example_functions_usage.sql` - c0011, c0012, c0013
- `teiatsu/scripts/2025-12-19_example_functions_usage.sql` - c0014, c0015, c0016
- `teiatsu/scripts/2025-12-22_example_functions_usage.sql` - c0017, c0018, c0019
- `teiatsu/scripts/2025-12-23_example_functions_usage.sql` - c0020, c0021
- `zumen_shisutemu/scripts/2025-12-24_example_functions_usage.sql` - c0005, c0006, c0007
- `zumen_shisutemu/scripts/2025-12-25_example_functions_usage.sql` - c0008, c0009

#### 3. `common_table_definitions.sql` - テーブル定義確認クエリ（共通）

- 全テーブルの定義情報を取得
- テーブル制約情報を取得
- すべてのテーブル共通で使用可能

### ファイルパスの例

- `teiatsu/scripts/2025-12-18_example_views_usage.sql`
- `zumen_shisutemu/scripts/2025-12-24_example_functions_usage.sql`
- `teiatsu/scripts/common_table_definitions.sql`

### 注意事項

- `example_views_usage.sql` と `example_functions_usage.sql` は実際のテーブルを使用したクエリの例です
- これらのスクリプトは単発実行や調査用です
- 実際のアプリケーションでは、`{table_group}/queries/` フォルダのパラメータ化クエリを使用してください
- スクリプト内のクエリは直接値を指定していますが、本番環境では必ずパラメータ化クエリを使用してください
- すべてのスクリプト内のクエリは `BEGIN/COMMIT` トランザクションで囲まれています

---

## テーブルグループ一覧

### 📦 teiatsu（低圧関連）

現在管理されているテーブル（11テーブル）：

1. **eso_t_c0011_keiki** - 計器類テーブル
   - 作成日: 2025-12-18
   - 主キー: `okyaku_id`, `zumen_id`, `setsubi_id`, `kotai_id`, `daisu_renban`

2. **eso_t_c0012_kaiheiki** - 低圧開閉器(低圧)テーブル
   - 作成日: 2025-12-18
   - 主キー: `okyaku_id`, `zumen_id`, `setsubi_id`, `kotai_id`, `daisu_renban`

3. **eso_t_c0013_cable** - 低圧ケーブル管理テーブル
   - 作成日: 2025-12-18
   - 主キー: `okyaku_id`, `zumen_id`, `setsubi_id`, `kotai_id`, `daisu_renban`

4. **eso_t_c0014_bundenban** - 分電盤テーブル
   - 作成日: 2025-12-19
   - 主キー: `okyaku_id`, `zumen_id`, `setsubi_id`, `kotai_id`, `daisu_renban`

5. **eso_t_c0015_keidenki** - 計電器テーブル
   - 作成日: 2025-12-19
   - 主キー: `okyaku_id`, `zumen_id`, `setsubi_id`, `kotai_id`, `daisu_renban`

6. **eso_t_c0016_ct** - 低圧変流器テーブル
   - 作成日: 2025-12-19
   - 主キー: `okyaku_id`, `zumen_id`, `setsubi_id`, `kotai_id`, `daisu_renban`

7. **eso_t_c0017_fuse** - 低圧ヒューズテーブル
   - 作成日: 2025-12-22
   - 主キー: `okyaku_id`, `zumen_id`, `setsubi_id`, `kotai_id`, `daisu_renban`

8. **eso_t_c0018_kansen** - 幹線テーブル
   - 作成日: 2025-12-22
   - 主キー: `okyaku_id`, `zumen_id`, `setsubi_id`, `kotai_id`, `daisu_renban`

9. **eso_t_c0019_sc** - 低圧コンデンサテーブル
   - 作成日: 2025-12-22
   - 主キー: `okyaku_id`, `zumen_id`, `setsubi_id`, `kotai_id`, `daisu_renban`

10. **eso_t_c0020_sr** - 低圧リアクトルテーブル
    - 作成日: 2025-12-23
    - 主キー: `okyaku_id`, `zumen_id`, `setsubi_id`, `kotai_id`, `daisu_renban`

11. **eso_t_c0021_kometer** - 子メーターテーブル
    - 作成日: 2025-12-23
    - 主キー: `okyaku_id`, `zumen_id`, `setsubi_id`, `kotai_id`, `daisu_renban`

### 📦 zumen_shisutemu（図面・システム関連）

現在管理されているテーブル（5テーブル）：

1. **eso_t_c0005_cad_link** - ハイパーリンク管理テーブル
   - 作成日: 2025-12-24
   - 主キー: `okyaku_id`, `link_moto_id`, `moto_zumen_id`, `link_saki_id`, `saki_zumen_id`

2. **eso_t_c0006_okyaku_work** - ＣＡＤ編集お客様管理テーブル
   - 作成日: 2025-12-24
   - 主キー: `okyaku_id`, `yoto_kbn`, `user_nm_mj`, `lock_flg`

3. **eso_t_c0007_image** - 画像情報テーブル
   - 作成日: 2025-12-24
   - 主キー: `okyaku_id`, `image_id`, `image_kbn_su`

4. **eso_t_c0008_file_work** - 編集画像テーブル
   - 作成日: 2025-12-25
   - 主キー: `okyaku_id`, `image_id`, `lock_flg`

5. **eso_t_c0009_numbering** - 採番テーブル
   - 作成日: 2025-12-25
   - 主キー: `okyaku_id`, `yoto_kbn`

---

## ファイル命名規則

### マイグレーションファイル

```
YYYY-MM-DD_NNN_operation_table_name.sql
```

- `YYYY-MM-DD`: 作成日（実行順序を決定）
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

### スクリプトファイル

```
YYYY-MM-DD_description.sql
```

または、用途に応じた分かりやすい名前（例：`common_table_definitions.sql`）

---

## 共通フィールド

すべてのテーブルに以下の共通フィールドが含まれています：

### 作成・更新関連フィールド

- **`create_date`** - `TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now()`
  - レコードの作成日時
  - デフォルト値: 現在時刻

- **`create_user`** - `VARCHAR(100) NOT NULL`
  - レコードの作成者
  - 必須フィールド

- **`record_date`** - `TIMESTAMP(6) WITHOUT TIME ZONE DEFAULT now()`
  - レコードの最終更新日時
  - デフォルト値: 現在時刻

- **`record_user`** - `VARCHAR(100) NOT NULL`
  - レコードの最終更新者
  - 必須フィールド

### 論理削除フラグ

- **`shinki_koushin_sakujo_flg`** - `INTEGER`
  - 新規・更新・削除フラグ
  - `0`: 新規
  - `1`: 更新
  - `2`: 削除（論理削除）
  - 論理削除されたレコードを除外する場合は `shinki_koushin_sakujo_flg IS DISTINCT FROM 2` を使用

---

## ベストプラクティス

### 1. マイグレーション

- **既存SQLの修正・上書きは禁止**
  - 変更は必ず新しいSQLファイルを追加
  - 日付順に実行されるため、日付と連番で順序を管理

- **トランザクションの使用**
  - すべてのマイグレーションファイルは `BEGIN/COMMIT` トランザクションで囲む

- **冪等性の保証**
  - すべての `ALTER` 操作は `DO $$ ... IF EXISTS ... END $$;` ブロックで囲む
  - `IF NOT EXISTS` や `IF EXISTS` を使用して安全に実行可能にする

- **構造化されたセクション**
  - `alter_columns` ファイルは以下の順序で整理：
    1. 日付フィールドの変更
    2. ユーザーフィールドの変更
    3. その他のフィールド変更
    4. データ移行ロジック

- **データ移行の実装**
  - `alter_columns` ファイルには、データ移行ロジックを含める
  - 現行システムの値はそのまま維持
  - 未設定の値はデフォルト値を設定

- **デフォルト値の設定**
  - デフォルト値の設定は、カラム名変更とタイプ変更の後に実行
  - デフォルト値を削除する場合は `ALTER COLUMN ... DROP DEFAULT` を使用

### 2. クエリ

- **パラメータ化クエリの使用**
  - すべてのクエリはパラメータ化（`$1, $2`形式）を使用
  - SQLインジェクション対策済み

- **論理削除の考慮**
  - SELECTクエリでは `shinki_koushin_sakujo_flg IS DISTINCT FROM 2` を使用
  - DELETEクエリでは `shinki_koushin_sakujo_flg = 2` に設定

- **RETURNING句の使用**
  - INSERT/UPDATE/DELETEクエリでは `RETURNING` 句を使用して結果を返す

### 3. スクリプト

- **実行前の確認**
  - 実行前に必ずバックアップを取得
  - 実行履歴を記録

- **本番環境での注意**
  - 本番環境での実行は慎重に
  - 単発実行や調査用途に限定

- **トランザクションの使用**
  - すべてのクエリは `BEGIN/COMMIT` トランザクションで囲む

- **ビューの作成**
  - ビューは `CREATE OR REPLACE VIEW` を使用
  - ビューは論理削除されていないレコードのみを返すように設計

### 4. ファイルヘッダー

すべてのSQLファイルには以下のヘッダーコメントを含める：

```sql
-- YYYY-MM-DD_description.sql
-- 目的：ファイルの目的
-- 作成日: YYYY-MM-DD
-- 作成者: 浦大輔
-- 対象DB：PostgreSQL
```

---

## ファイル構造の原則

- **テーブルグループごとに整理** - 関連するテーブルは同じグループフォルダに配置
- **各グループ内で3つのサブフォルダを使用** - `migrations/`, `queries/`, `scripts/`
- **命名規則で整理** - ファイル名の日付と操作タイプで管理
- **日付順で実行** - マイグレーションファイルは日付順に実行
- **グループ内で完結** - 各テーブルグループのファイルは、そのグループのフォルダ内に配置
- **スクリプトの日付分割** - スクリプトファイルはテーブル作成日ごとに分割

---

## データ移行時の注意事項

### 作成者／作成日／更新者／更新日の取り扱い

データ移行時は、以下のルールで「作成者」「作成日」「更新者」「更新日」を設定します：

1. **現行システムで値が設定されている場合**
   - 現行の値をそのまま移行
   - 現行で「システム」と設定されている場合も、その値を維持

2. **値が未設定の場合**
   - 作成者・更新者を `'ikou2027'` に設定
   - 作成日・更新日を「データ移行日」に設定

このロジックは、`003_alter_columns_*.sql` ファイルに実装されています。

---

## 関連リソース

- PostgreSQL公式ドキュメント: https://www.postgresql.org/docs/
- マイグレーションツール:
  - Flyway: https://flywaydb.org/
  - Liquibase: https://www.liquibase.org/

---

## 更新履歴

- 2025-12-25: データ移行ロジックを `alter_columns` ファイルに追加
- 2025-12-25: スクリプトファイルを日付ごとに分割
- 2025-12-24: ファイルヘッダーを標準化（作成日、作成者、対象DB）
- 2025-12-24: `alter_columns` ファイルに `IF EXISTS` チェックを追加
- 2025-12-24: すべてのテーブルに共通フィールドを追加
