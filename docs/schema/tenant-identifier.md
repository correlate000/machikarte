# tenant identifier 命名規約

machikarte が議事録システムごとに割り当てる `tenant_slug` の命名規約。

## 基本ルール

1. 半角英数字 + ハイフンのみ（小文字）
2. 議事録システム側の URL slug を優先採用（例: `kaigiroku.net/kensaku/{slug}` の `{slug}` 部分）
3. 自治体側で命名がない場合は ローマ字音表記を使用（ヘボン式優先）

## 同名異自治体の罠

`tenant_slug` だけでは同名異自治体を判別できません。
必ず `municipality_code`（総務省 6 桁コード）と併用してください。

既知の同名異自治体パターン（17 件、`known_same_name_traps.json` で管理）:

| slug | 自治体 1 | 自治体 2 |
|---|---|---|
| `kodaira` | 北海道小平町（01-???） | 東京都小平市（13211） |
| `ikeda` | 北海道池田町 / 大阪府池田市 / 福井県池田町 / 岐阜県池田町 / 長野県池田町 / 徳島県池田町 等 |
| `noda` | 千葉県野田市 / 福島県野田村 |
| `kawanishi` | 兵庫県川西市 / 奈良県川西町 / 山形県川西町 |
| `mishima` | 静岡県三島市 / 鹿児島県三島村 / 福島県三島町 |
| `tomioka` | 群馬県富岡市 / 福島県富岡町 |
| `yachiyo` | 千葉県八千代市 / 茨城県八千代町 |
| `nakagawa` | 全国 8 件以上（各県の中川町・中川村・那珂川市等） |
| `takayama` | 岐阜県高山市 / 群馬県高山村 / 長野県高山村 |
| `ichinomiya` | 愛知県一宮市 / 千葉県一宮町 / 兵庫県一宮町（合併済） |
| `anan` | 徳島県阿南市 / 長野県阿南町 |
| `nishihara` | 沖縄県西原町 / 熊本県西原村 |
| `yuzawa` | 新潟県湯沢町 / 秋田県湯沢市 |
| `shirakawa` | 福島県白河市 / 岐阜県白川町 / 岐阜県白川村 |
| `miki` | 兵庫県三木市 / 香川県三木町 |
| `misato` | 埼玉県美里町 / 秋田県美郷町 / 長野県美里町 |
| `setouchi` | 岡山県瀬戸内市 / 鹿児島県瀬戸内町 |

## 推奨運用

外部システムから machikarte data を引く場合:

```sql
SELECT *
FROM `your_project.your_dataset.speeches`
WHERE municipality_code = '232117'  -- 大府市
  AND year BETWEEN 2020 AND 2026
```

`tenant_slug = 'obu'` だけで絞ると同名異自治体の誤マッピングが起き得ます。
