# データライセンス実務ガイド

machikarte のデータ利用に関する実務的なガイド。
ライセンス本文は [LICENSE-DATA](../LICENSE-DATA) を参照のこと。

## ライセンスの 3 層構造

| 層 | 内容 | ライセンス | 適用範囲 |
|---|---|---|---|
| コード | scraper（非公開） / aggregation queries / docs build | **MIT** | 本リポジトリの `.py` `.sql` `.ts` 等 |
| 構造化データ | schema / 集計値 / メタデータ / Tier 分類 / 自治体識別子 | **CC BY 4.0** | 本リポジトリの `aggregation-queries/` 出力例、API/MCP 経由の集計レスポンス |
| speech 本文 | 議事録テキスト原文 | **各議会に帰属** | 各自治体の議事録利用規約に従う |

## 必要な attribution（CC BY 4.0 部分）

集計値・schema・メタデータを再利用する際は、以下のクレジット表示が必要です。

### 短形式（SNS / 図表脚注等）

```
出典: machikarte（ISVD）, CC BY 4.0
```

### 長形式（学術論文 / レポート）

```
machikarte: 全国 1,741 自治体議会発言データベース
一般社団法人 社会構想デザイン機構（ISVD）, 2026
https://isvd.or.jp/ja/machikarte
ライセンス: CC BY 4.0
取得時点: YYYY-MM-DD
```

### 英語

```
machikarte: Japanese local assembly speech database
Institute for Social Vision Design (ISVD), 2026
https://isvd.or.jp/en/machikarte
License: CC BY 4.0
Retrieved: YYYY-MM-DD
```

## 改変・再配布

CC BY 4.0 の範囲内で改変・再配布できます。改変した場合は以下を明示してください:

- 改変した旨
- 改変者
- 改変日時

## speech 本文の取扱い

speech 本文（議事録テキスト原文）は CC BY 4.0 の対象外です。

### 引用の範囲

短い抜粋（数行程度）の引用は著作権法第 32 条「引用」の範囲で可能です。引用条件:

- 出所明示（自治体名・議会名・日時・議員名）
- 必然性（引用が議論に不可欠）
- 主従関係（引用が従、自分の論述が主）
- 引用箇所の明確化（鉤括弧・blockquote 等）

### 全文転載

speech 本文の全文転載・大規模配布は各自治体の議事録利用規約に従ってください。
不明な場合は各議会事務局にお問い合わせください。

## 商用利用

CC BY 4.0 部分（schema / 集計値 / メタデータ）の商用利用は可能です。attribution 要件のみ満たしてください。

speech 本文を含む派生サービスを商用提供する場合は、別途各議会の利用規約確認が必要です。

## 違反の通報

attribution 違反、speech 本文の規約違反転載等を見つけた場合は `contact@isvd.or.jp` までご連絡ください。
