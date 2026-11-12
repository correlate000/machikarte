#!/usr/bin/env python3
"""Read the frozen public metadata locally. No network, models, or database calls."""
from pathlib import Path
import argparse
import hashlib
import json
import sys


def inspect(snapshot: Path, code: str) -> dict:
    if len(code) != 6 or not code.isascii() or not code.isdigit():
        raise ValueError("自治体コードは6桁の数字で指定してください")
    manifest = json.loads((snapshot / "manifest.json").read_text())
    for f in manifest["files"]:
        data = (snapshot / f["name"]).read_bytes()
        if hashlib.sha256(data).hexdigest() != f["sha256"]:
            raise ValueError(f"固定版の指紋が一致しません: {f['name']}")
    coverage = json.loads((snapshot / "coverage.json").read_text())
    matches = [r for r in coverage["councils"] if r["lgcode"] == code]
    if len(matches) != 1:
        raise ValueError(f"自治体コードの一致は1件必要です: {len(matches)}件")
    row = matches[0]
    return {
        "自治体コード": row["lgcode"],
        "自治体名": row["name"],
        "資料の版": coverage.get("version"),
        "資料生成日時": coverage.get("generatedAt"),
        "件数の基準日": row.get("countsAsOf"),
        "収録年の端点": [row.get("earliestYear"), row.get("latestYear")],
        "収録年の注意": "端点は間の各年・会議種類の完全性を保証しません",
        "会議一覧あり": row.get("meetingListAvailable"),
        "本文制限の登録値": row.get("contentLimitation"),
        "登録値nullの注意": "制限なしや権利確認済みを意味しません",
        "全国取得照合率": None,
        "全国取得照合率の注意": "同じ会議一覧を分母にした照合が未完了のため、この例では算出しません",
        "本文の検証範囲": "この実行例はメタデータのみ。発言本文・公式原本は照合していません",
        "引用例": f"ISVD『議会コモンズ coverage.json』v{coverage.get('version')}、生成日時{coverage.get('generatedAt')}、自治体コード{code}。固定版のSHA-256はmanifest.jsonを参照。",
        "原文の条件": "会議録原文は各出典の条件を別に確認します",
    }


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--snapshot", type=Path, default=Path(__file__).parent / "examples/commons-snapshot")
    ap.add_argument("--code", default="232301")
    args = ap.parse_args()
    try:
        print(json.dumps(inspect(args.snapshot, args.code), ensure_ascii=False, indent=2))
    except (ValueError, OSError, KeyError, json.JSONDecodeError) as exc:
        print(str(exc), file=sys.stderr)
        sys.exit(2)
