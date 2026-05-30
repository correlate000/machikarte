# sample-data

machikarte の schema を理解するための最小サンプル。

## β 期間中の方針

**β 期間中（〜 2026-08-15 正式版予定）は schema dummy のみを提供します。**

実 speech 本文を含むサンプルは [法務確認](../docs/legal-review-2026-06.md)（プロボノ弁護士パス）完了後に追加します。
それまでは schema 構造のみ理解できる dummy data を `speeches/` 配下に置いています。

## 含まれるファイル

| ファイル | 内容 |
|---|---|
| `speeches/example-speech.json` | schema 構造を示す dummy 1 件 |

## 実 data の取得方法

β 期間中、実 data へのアクセスは β サイト経由のみです:

<https://isvd.or.jp/ja/machikarte>

API / MCP 経由の access は 2026 年 Q3 以降を予定（[api-spec](../docs/api-spec/README.md) 参照）。

## 法務確認後の sample 追加方針

法務確認完了後、以下を sample に追加予定:

1. 公開議事録利用規約が OSS 親和的な自治体を 1-2 件選定
2. 各 muni について以下を verify:
   - 議事録該当ページ URL（自治体公式）
   - 認証なしアクセス可能
   - 個人情報（住所・電話番号）未混入
3. speech 抜粋 + 議事録該当ページへのリンク形式で配置（全文掲載は避ける）

verify 結果は muni 単位で `sample-data/verify-notes/{muni_code}.md` に記録します。
