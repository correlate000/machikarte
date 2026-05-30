# API / MCP 仕様（β 期間中は placeholder）

machikarte の公開 API / MCP（Model Context Protocol）サーバの仕様は、β 期間中に設計を進めます。

## 想定タイムライン

| 時期 | マイルストーン |
|---|---|
| 2026-06-05 | β サイト公開、API は未提供 |
| 2026-Q3 | API v0 設計、限定的なエンドポイント公開（read-only、rate limit あり） |
| 2026-08-15 | 正式版公開、API v1 安定化 |
| 2026-Q4 | MCP サーバ正式版（Claude / 他 LLM クライアントから直接 query 可能） |

## 想定エンドポイント

- `GET /api/v1/municipalities` — 全自治体リスト + Tier
- `GET /api/v1/speeches?municipality_code=&year=&q=` — 検索
- `GET /api/v1/legislators?municipality_code=` — 議員リスト
- `GET /api/v1/aggregates?metric=&group_by=` — 集計値

## MCP サーバ

公開 MCP サーバの提供を 2026-Q4 に予定。
LLM クライアントから直接 machikarte data を query できる形式を想定。

## 提案・要望

API / MCP の設計に関する提案は [feature request issue](../../.github/ISSUE_TEMPLATE/feature_request.md) でお寄せください。
