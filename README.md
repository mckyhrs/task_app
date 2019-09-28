# スキルチェックカリキュラム

## 仕様について
https://github.com/mckyhrs/task_app/blob/master/docs/el-training.md

## 言語・ミドルウェアのバージョン
- Ruby: 2.6.4
- Rails: 2.6.0
- postgresql: 11.5

## テーブルスキーマ
### User：ユーザー

| カラム名 | 論理名 | データ型 |
| - | - | - |
| id | ID | integer |
| user_name | ユーザー名 | character varying(30) |
| login_id | ログインID | character varying(30) |
| password | パスワード | character varying(30) |
| delete_flg | 削除フラグ | boolean |
| create_date | 作成日 | timestamp |
| create_user_id | 作成者ID | integer |
| update_date | 更新日 | timestamp |
| update_user_id | 更新者ID | integer |

### Task：タスク

| カラム名 | 論理名 | データ型 |
| - | - | - |
| id | ID | integer |
| task_name | タスク名 | character varying(200) |
| content | 説明文 | text |
| user_id | 担当者ID | integer |
| limit_date | 終了期限 | date |
| priority_id | 優先順位ID | integer |
| status_id | ステータスID | integer |
| delete_flg | 削除フラグ | boolean |
| create_date | 作成日 | timestamp |
| create_user_id | 作成者ID | integer |
| update_date | 更新日 | timestamp |
| update_user_id | 更新者ID | integer |

### Label：ラベル

| カラム名 | 論理名 | データ型 |
| - | - | - |
| id | ID | integer |
| label_name | ラベル名 | character varying(100) |
| delete_flg | 削除フラグ | boolean |
| create_date | 作成日 | timestamp |
| create_user_id | 作成者ID | integer |
| update_date | 更新日 | timestamp |
| update_user_id | 更新者ID | integer |

### priority：優先順位

| カラム名 | 論理名 | データ型 |
| - | - | - |
| id | ID | integer |
| priority_name | 優先順位名 | character varying(20) |
| priority | 優先順位 | integer |
| delete_flg | 削除フラグ | boolean |
| create_date | 作成日 | timestamp |
| create_user_id | 作成者ID | integer |
| update_date | 更新日 | timestamp |
| update_user_id | 更新者ID | integer |

### status：ステータス

| カラム名 | 論理名 | データ型 |
| - | - | - |
| id | ID | integer |
| status_name | ステータス名 | character varying(50) |
| delete_flg | 削除フラグ | boolean |
| create_date | 作成日 | timestamp |
| create_user_id | 作成者ID | integer |
| update_date | 更新日 | timestamp |
| update_user_id | 更新者ID | integer |
