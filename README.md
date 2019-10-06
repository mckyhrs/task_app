# スキルチェックカリキュラム

## 仕様について
https://github.com/mckyhrs/task_app/blob/master/docs/el-training.md

## 言語・ミドルウェアのバージョン
- Ruby: 2.6.4
- Rails: 2.6.0
- postgresql: 11.5

## テーブルスキーマ
### user：ユーザー

| カラム名 | 論理名 | データ型 |
| - | - | - |
| id | ID | integer |
| user_name | ユーザー名 | character varying |
| login_id | ログインID | character varying |
| password | パスワード | character varying |
| role | ロール | integer |
| created_at | 作成日時 | timestamp without time zone |
| updated_at | 更新日時 | timestamp without time zone |

### task：タスク

| カラム名 | 論理名 | データ型 |
| - | - | - |
| id | ID | integer |
| task_name | タスク名 | character varying |
| content | 説明文 | text |
| limit_date | 終了期限 | date |
| priority | 優先順位 | integer |
| status | ステータス | integer |
| user_id | ユーザーID | integer |
| created_at | 作成日時 | timestamp without time zone |
| updated_at | 更新日時 | timestamp without time zone |

### label：ラベル

| カラム名 | 論理名 | データ型 |
| - | - | - |
| id | ID | integer |
| label_name | ラベル名 | character varying |
| created_at | 作成日時 | timestamp without time zone |
| updated_at | 更新日時 | timestamp without time zone |

### task_label：タスクとラベルの関連

| カラム名 | 論理名 | データ型 |
| - | - | - |
| id | ID | integer |
| task_id | タスクID | integer |
| label_id | ラベルID | integer |
| created_at | 作成日時 | timestamp without time zone |
| updated_at | 更新日時 | timestamp without time zone |

## Herokuへのデプロイ

Herokuにリポジトリをプッシュでデプロイ
```
$ git push heroku master
```
Heroku URL  
https://obscure-garden-48968.herokuapp.com/
