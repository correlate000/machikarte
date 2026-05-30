# scraping 方針（高レベル）

machikarte が議事録データを取得する際の方針。
具体的な scraper 実装は OSS リポジトリには含まれません（abuse 防止のため）。

## 原則

1. **公開議事録のみ**: 認証なしで誰でもアクセスできる議事録ページのみが対象
2. **robots.txt 遵守**: `User-agent: *` の Disallow 指定を尊重する
3. **rate limit**: 1 自治体あたり同時 1 接続、リクエスト間隔 1 秒以上
4. **User-Agent 明示**: machikarte 由来であることを UA に含める
5. **キャッシュ優先**: 同一議事録の再取得は原則しない（更新検知時のみ）
6. **議会連絡**: 大量取得前に自治体議会事務局へ事前連絡することを推奨

## 議事録源

machikarte がカバーする議事録源は以下のカテゴリに分類されます:

- **議事録検索システム（外部 SaaS）**: kaigiroku.net / discuss vision / sophia / amivoice / SSP 等
- **自治体公式の議事録ページ**: HTML / PDF 形式
- **議会だより（newsletter）**: 自治体広報誌の PDF
- **動画 + 字幕**: YouTube 上の議会中継字幕（一部自治体）

## Tier 分類

詳細は [tier-classification.md](./tier-classification.md) 参照。

## 個人情報の取扱い

- 議員名、答弁者名、議題は議事録に記載されている範囲で保持
- 住所、電話番号、メールアドレス等の個人連絡先は machikarte には含めません
- 一般市民の発言（陳情書朗読等）は明示的に scope 外

## 訂正対応

データ誤り（OCR 誤読、誤分類、誤マッピング等）は [data correction issue template](../../.github/ISSUE_TEMPLATE/data_correction.md) で受け付けます。
緊急性（議員名・採決の誤りなど）は優先対応します。

## scraper 実装の非公開理由

具体的な scraper 実装（クローラの URL pattern、parser ロジック、retry 戦略等）は OSS 公開対象外です。

理由:
- 議事録システムへの負荷攻撃リスクを下げる
- 自治体側の議事録規約（多くは「個人利用」「研究目的」前提）への配慮
- scraper のメンテナンスは ISVD 内部で行い、改善要望は issue で受け付ける形

scraper 改善・新規対応の提案は issue でお寄せください。
