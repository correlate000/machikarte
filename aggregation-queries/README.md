# aggregation queries

machikarte の公開可能な集計クエリ。
β 公開と同時公開の論陣記事「議会発言に『AI』『生成 AI』が登場したのはいつから — 全国 1,741 自治体の時系列分析」で使用したクエリ 2 本を含みます。

## 使い方

これらのクエリは BigQuery 標準 SQL で書かれています。
machikarte の集計データを再現するには、ISVD と契約した上で `correlate-workspace.isvd_machikarte.speeches` テーブルへのアクセス権が必要です。

外部ユーザは β サイト経由でデータを利用してください: <https://isvd.or.jp/ja/machikarte>

クエリの YOUR_PROJECT / YOUR_DATASET を自分の BigQuery プロジェクトに置換し、独自に scrape した同じ schema のデータでも実行できます。

## 含まれるクエリ

| ファイル | 内容 | 想定スキャン量 |
|---|---|---|
| `ai-mention-by-year.sql` | 年次別の AI / 生成 AI 言及自治体数・発言数 | 約 110 GB |
| `genai-mention-by-municipality.sql` | 自治体別の AI / 生成 AI 言及初出年 + 累計件数 | 約 110 GB |

## コスト見積もり

BigQuery on-demand 料金（USD $6.25 / TB スキャン）で計算:

- `ai-mention-by-year.sql`: 約 USD $0.69 / JPY 約 ¥108
- `genai-mention-by-municipality.sql`: 約 USD $0.69 / JPY 約 ¥108

実行前に `--dry_run` でスキャン量を確認してください:

```bash
bq query --use_legacy_sql=false --dry_run < ai-mention-by-year.sql
```

## ライセンス

クエリ自体: [MIT](../LICENSE)
クエリ出力（集計値）: [CC BY 4.0](../LICENSE-DATA)

## 敵対的利用について

machikarte は議論の見える化を目的とした civic tech 基盤です。
特定議員への人格攻撃、選別的引用による誤情報拡散、誹謗中傷の材料生成等を本ライセンスは許容しません。

CC BY 4.0 の attribution 要件は、再利用の出所を可視化することで、悪意の引用に対する社会的説明責任の枠組みを提供します。
attribution を欠いた利用、明らかな敵対的利用を発見した場合は `contact@isvd.or.jp` までご連絡ください。

ISVD は editorial committee（外部委員を含む）を通じてガバナンスを行います。
