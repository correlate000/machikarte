# machikarte

> 全国 1,741 自治体の議会発言を、市民が直接さわれる形にする civic tech 基盤（β 版）

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Data License: CC BY 4.0](https://img.shields.io/badge/data-CC%20BY%204.0-blue.svg)](LICENSE-DATA)
[![Status: Beta](https://img.shields.io/badge/status-beta-orange.svg)](STATUS.md)

## machikarte とは

machikarte は、全国 1,741 自治体・約 1.26 億件の議会発言データを、市民が検索・引用・分析できる形で公開する civic tech 基盤である。
英国 mySociety の TheyWorkForYou、米国 GovTrack の系譜にあるプロジェクトを、日本の地方議会レベルで全国網羅で構築している。

データは β 版として 2026 年 6 月 5 日に公開し、正式版を 2026 年 8 月 15 日に予定している。
β 期間中はカバレッジ拡充、機能追加、検証を市民と一緒に進める。

## なぜ OSS か

地方議会の議論を見える化するには、データの透明性と再現可能性が前提となる。
schema、aggregation queries、集計値を公開することで、二次利用・学術研究・市民監視のいずれにも開かれた基盤を目指している。

運営は一般社団法人 社会構想デザイン機構（ISVD）。法人としての中立性を保ちつつ、データ・コード両面のオープン化を続ける。

## β ステータス

- 全国対象: 1,741 自治体
- データ取得済: 約 1,200 自治体（うち 1,170 自治体が 5,000 件以上）
- 累計 speech 数: 約 1.26 億件
- 詳細: [STATUS.md](STATUS.md)（β 期間中は週次手動更新）

サンプル制約あり、機能拡充中、議員カルテ・カバレッジ可視化は順次追加予定。

## 使ってみる

- β サイト: <https://isvd.or.jp/ja/machikarte>
- 論陣記事: 「議会発言に『AI』『生成 AI』が登場したのはいつから — 全国 1,741 自治体の時系列分析」（β 公開と同時公開予定）

## 貢献する

3 つの経路を用意している:

1. **issue を立てる**: バグ報告 / 機能要望 / データ訂正依頼
2. **PR を送る**: docs 改善 / schema 提案 / aggregation query 追加
3. **情報を寄せる**: scrape 対象外自治体、議事録形式の特殊事例、研究連携などは `contact@isvd.or.jp` まで

貢献方法の詳細は [CONTRIBUTING.md](CONTRIBUTING.md) を参照のこと。
コミュニティの行動規範は [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) を参照のこと。

## ライセンス

- コード: [MIT License](LICENSE)
- データ（schema / 集計値 / メタデータ）: [CC BY 4.0](LICENSE-DATA)
- speech 本文: 各議会（地方自治体）に著作権が帰属、各自治体の議事録利用規約に従う

## 連絡先

一般社団法人 社会構想デザイン機構（ISVD）
<contact@isvd.or.jp>

---

English version: [README.en.md](README.en.md)
