-- 自治体別の AI / 生成 AI 言及初出年 + 累計件数
--
-- 出典: machikarte (ISVD), CC BY 4.0
-- 想定スキャン量: 約 110 GB
-- 想定コスト: USD $0.69 / JPY 約 ¥108
--
-- 出力例（生成 AI 累計トップ、2026-05 時点）:
--   municipality_code, municipality_name, first_ai_year, first_genai_year, ai_count, genai_count
--   232238, 大府市, 2017, 2023, 200, 42
--   300001, 和歌山県議会, 2015, 2023, 126, 33
--   122041, 船橋市, 2017, 2023, 248, 32
--   132101, 小金井市, 2018, 2023, 11, 24
--   203831, 箕輪町, 2018, 2023, 65, 20

SELECT
  municipality_code,
  ANY_VALUE(municipality_name) AS municipality_name,
  MIN(IF(REGEXP_CONTAINS(body, r"(?i)\bAI\b|人工知能"), year, NULL)) AS first_ai_year,
  MIN(IF(REGEXP_CONTAINS(body, r"生成AI|生成 AI|ChatGPT|GPT-|大規模言語モデル"), year, NULL)) AS first_genai_year,
  COUNTIF(REGEXP_CONTAINS(body, r"(?i)\bAI\b|人工知能")) AS ai_count,
  COUNTIF(REGEXP_CONTAINS(body, r"生成AI|生成 AI|ChatGPT|GPT-|大規模言語モデル")) AS genai_count
FROM `YOUR_PROJECT.YOUR_DATASET.speeches`
WHERE year BETWEEN 1990 AND 2026
GROUP BY municipality_code
ORDER BY first_genai_year NULLS LAST, genai_count DESC
;

-- 既知の制約:
-- - municipality_code は総務省 6 桁コード、tenant_slug 単独での絞り込みは同名異自治体の罠あり
-- - 累計件数は β 期間のカバレッジ進行で変動する
-- - L0 確定自治体（議事録非公開）は count = 0 で出力される
