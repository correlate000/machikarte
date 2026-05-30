# speeches テーブル schema

machikarte の中核データテーブル。1 行 = 議会発言 1 件。

## 列定義

| 列名 | 型 | 必須 | 説明 |
|---|---|---|---|
| `speech_id` | STRING | ✓ | 発言の一意識別子。`{tenant_slug}:{council_id}:{schedule_id}:{speech_order}` 形式 |
| `municipality_code` | STRING | ✓ | 総務省自治体コード（6 桁、例: `131016` = 東京都千代田区） |
| `municipality_name` | STRING | ✓ | 自治体名（日本語、例: `千代田区` `名古屋市` `愛知県議会`） |
| `tenant_slug` | STRING | ✓ | 議事録システム上の slug（例: `chiyoda` `nagoya`）。同名異自治体の判別には不十分なので必ず `municipality_code` 併用 |
| `council_id` | STRING | ✓ | 議会の識別子（本会議 / 委員会等の区別を含む） |
| `council_name` | STRING | ✓ | 議会名（例: `本会議` `総務委員会`） |
| `schedule_id` | STRING | ✓ | 開催日程の識別子 |
| `schedule_name` | STRING | ✓ | 開催日程名（例: `令和 6 年 3 月定例会 第 3 日`） |
| `year` | INT64 | ✓ | 西暦年（partition 列、range 1950-2030） |
| `speech_order` | INT64 | ✓ | 同 schedule 内の発言順 |
| `speaker_name` | STRING |  | 発言者名（議員 / 答弁者 / 議長 / 説明員等） |
| `speaker_role` | STRING |  | 発言者役割。値の例: `member` / `chair` / `staff` / `document` / `unknown` |
| `body` | STRING | ✓ | 発言本文。著作権は各議会に帰属、CC BY 4.0 対象外（[LICENSE-DATA](../../LICENSE-DATA) 参照） |
| `body_length` | INT64 | ✓ | 発言本文の文字数（参考値） |
| `loaded_at` | TIMESTAMP | ✓ | machikarte BQ への取り込み時刻 |
| `speech_type` | STRING |  | 発言種別タグ（例: `general-question` `answer` `procedural`） |
| `is_person_name` | BOOL |  | `speaker_name` が人物名と判定されたか（OCR / 文書記号の混入除外用） |

## Partition / Clustering

- **Partition**: `year`（range 1950-2030, interval 1）
- **Clustering**: `(municipality_code, year)`

## クエリの注意点

- `year` 列で WHERE 絞り込みを必ず付ける（partition prune のため）
- 同名異自治体（小平町 vs 小平市等）の trap は `municipality_code` で識別
- `tenant_slug` 単独での絞り込みは大規模スキャン要因、必ず `municipality_code` + `year` を併用

## 既知の制約

- 1990 年代前半の `body` は OCR 由来で誤読・改行崩れあり
- 一部自治体の `speaker_role` は推定値（OCR + 文脈推論）
- 議事録 PDF 由来のレコードは `body` に余分な空白・記号が混入することがある
