# 貢献ガイド — machikarte

このリポジトリでは、公開資料・コード・生成データの改善提案を受け付けています。対象の版と利用条件はREADME、STATUS、各資料の説明を確認してください。
小さな修正提案も大きな機能要望もデータ訂正依頼もすべて歓迎します。

## 歓迎する貢献の種類

| 種類 | テンプレ | 内容 |
|---|---|---|
| Bug report | [bug_report](.github/ISSUE_TEMPLATE/bug_report.md) | 動作不良、表示崩れ、検索結果の異常 |
| Feature request | [feature_request](.github/ISSUE_TEMPLATE/feature_request.md) | 新機能、UI 改善、API/MCP 提案 |
| Data correction | [data_correction](.github/ISSUE_TEMPLATE/data_correction.md) | 議員名・自治体・年・発言抜粋等のデータ誤り |
| Pull request | [PR template](.github/PULL_REQUEST_TEMPLATE.md) | docs 改善、schema 提案、aggregation query 追加 |
| 情報提供 | メール `contact@isvd.or.jp` | scrape 対象外自治体、議事録特殊形式、研究連携 |

## 応答と採用の扱い

- 受付・再現確認・修正・公開反映を別の状態で記録します。担当と確認範囲を決めて対応します
- データ誤り（特に議員名・採決・カテゴリ）は緊急度ラベルで優先対応
- 機能要望は、利用場面・既存機能で足りる範囲・維持負担を確認して、採用/保留を判断します
- 海外コントリビューターには英語でレスポンス可（英語で issue/PR を立ててください）

## コード規約

軽めに保ちます:

- **Python**: PEP 8 準拠、`black` 整形を推奨
- **TypeScript / React**: `prettier` 既定、関数型コンポーネント
- **SQL**: BigQuery 標準 SQL、テーブル参照は完全修飾
- **Markdown**: 行末空白なし、見出しは ATX 形式（`#`）

破壊的変更（schema 変更等）は別 issue で先に議論してください。

## PR チェックリスト

PR 提出時に [PR template](.github/PULL_REQUEST_TEMPLATE.md) のチェックボックスを埋めてください:

- [ ] 動作確認済み（手元で再現方法を記載）
- [ ] docs を更新（必要な場合）
- [ ] license 影響を確認（コード MIT / データ CC BY 4.0 のどちら）
- [ ] 機密情報（API キー、credentials、個人情報）が含まれていない
- [ ] 関連 issue 番号を記載

## データ訂正依頼

machikarte は議事録の OCR・スクレイピング由来で誤りが起きます。
データ訂正依頼は [data_correction](.github/ISSUE_TEMPLATE/data_correction.md) テンプレで以下を記入してください:

1. 対象自治体名と council ID
2. 議事録の元 URL（自治体公式ページ）
3. machikarte 上での表示内容（スクリーンショット or URL）
4. 正しい内容と根拠（議事録該当箇所）。原文や個人情報の公開は、出典の条件と必要性を別に確認してください
5. 緊急度: 緊急（議員名誤り等） / 通常（タグ・カテゴリ） / 軽微（表記揺れ）

## Code of Conduct

参加者は [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) に同意したものとみなします。
違反通報は `contact@isvd.or.jp` まで。

---

## Contributing in English

You can file issues and PRs in English. We will respond in the language you used.
Use the same templates and follow the same checklist. Translation of templates into English is on our backlog.
