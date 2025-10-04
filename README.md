# scraping-compose

## 概要

[kakakuscraping-fastapi](https://github.com/gkjg8787/kakakuscraping-fastapi)を中心としたスクレイピング環境を構築するためのものです。

## 使い方

1. git clone でこのリポジトリをダウンロードします。

2. .env ファイルを作成します。[external_search](https://github.com/gkjg8787/external_search)の gemini を使用しない場合は必要ないため、`compose.yaml`の`env_file`の項目を削除するか空の.env を作成します。

```
mkdir search
echo "GEMINI_API_KEY=your_api_key" >> search/.env
```

3.  初回はスクリプトで起動して 各コンテナの settings.py を修正し、コンテナを作成します。

```bash
bash create_container.sh
```

4. 起動後、`localhost:8000`にアクセスして操作。または`search2kakaku`のコンテナ内に入りコマンドでスクレイピング対象の URL を登録。

## 前提条件

- Docker

## 注意

- volumes で search2kakaku, celery_worker, celery_beat の DB をマウントする場合、初回起動時には DB がないため celery_worker 等でエラーが発生します。search2kakaku のコンテナで DB を操作するコマンドを実行すると DB が作成されるため、そのあとに celery 系は restart することを推奨します。

## コンテナ

- 各コンテナの説明はそれぞれのリポジトリで。
- [kakakuscraping-fastapi](https://github.com/gkjg8787/kakakuscraping-fastapi)
- [search2kakaku](https://github.com/gkjg8787/search2kakaku)
- [external_search](https://github.com/gkjg8787/external_search)
- [nodriver_api](https://github.com/gkjg8787/nodriver_api)
