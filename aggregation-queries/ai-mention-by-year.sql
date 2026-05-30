-- 年次別の AI / 生成 AI 言及自治体数・発言数
--
-- 出典: machikarte (ISVD), CC BY 4.0
-- 想定スキャン量: 約 110 GB（year BETWEEN 1990 AND 2026）
-- 想定コスト: USD $0.69 / JPY 約 ¥108（BigQuery on-demand）
--
-- 使い方:
--   1. YOUR_PROJECT.YOUR_DATASET.speeches を自分の BigQuery テーブルに置換
--   2. bq query --use_legacy_sql=false --dry_run でスキャン量確認
--   3. 本実行
--
-- 出力例（2026-05 時点の machikarte BQ より）:
--   year, muni_total, muni_ai, muni_genai, ai_speeches, genai_speeches, total_speeches
--   1990, 101, 5, 0, 7, 0, 210529
--   2016, 1040, 254, 0, 599, 0, 5666500
--   2023, 1250, 602, 56, 1554, 190, 6336570
--   2025, 1371, 464, 76, 1227, 190, 6905903

SELECT
  year,
  COUNT(DISTINCT municipality_code) AS muni_total,
  COUNT(DISTINCT IF(REGEXP_CONTAINS(body, r"(?i)\bAI\b|人工知能"), municipality_code, NULL)) AS muni_ai,
  COUNT(DISTINCT IF(REGEXP_CONTAINS(body, r"生成AI|生成 AI|ChatGPT|GPT-|大規模言語モデル"), municipality_code, NULL)) AS muni_genai,
  COUNTIF(REGEXP_CONTAINS(body, r"(?i)\bAI\b|人工知能")) AS ai_speeches,
  COUNTIF(REGEXP_CONTAINS(body, r"生成AI|生成 AI|ChatGPT|GPT-|大規模言語モデル")) AS genai_speeches,
  COUNT(*) AS total_speeches
FROM `YOUR_PROJECT.YOUR_DATASET.speeches`
WHERE year BETWEEN 1990 AND 2026
GROUP BY year
ORDER BY year
;

-- 既知の制約:
-- - 1990 年代の AI 言及は「人工知能」が主、`\bAI\b` 単独は false positive 可能性あり（OCR ノイズ）
-- - 「LLM」は法学修士略号と衝突するためパターンから除外
-- - 2026 年は途中値（取得継続中）
