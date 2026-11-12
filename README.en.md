# machikarte

Public materials, code, specifications, and examples for reusing Japanese local assembly records through Gikai Commons.

Gikai Commons provides a foundation for statements, original sources, citation, and reuse. Kousou 0 provides a place to understand a town's conditions, everyday issues, and policy history with sources. The two projects serve different purposes.

## Try the local example

Use Python3's standard library to read Nisshin City's coverage metadata from a fixed snapshot. Run this command from the repository root.

```sh
python3 reuse-kit/inspect_coverage.py --code 232301
```

The example does not use the network, a database, or an AI model. Its JSON output describes the municipality, reference dates, endpoints of the recorded year range, version, missing information, and reuse conditions. Output keys are Japanese. It does not search speech text or demonstrate a RAG answer.

Read the [instructions](reuse-kit/README.txt) and [snapshot manifest](reuse-kit/examples/commons-snapshot/manifest.json). File hashes verify that the snapshot matches its manifest. Keep generation dates separate from the years and reference dates of the underlying values.

## Materials in this repository

- `reuse-kit/`: a minimal local coverage-metadata example.
- `docs/`: format and methodology documents.
- `aggregation-queries/`: aggregation queries.
- `sample-data/`: illustrative samples.

Check the period, version, and terms for each material. Year-range endpoints, stored-record counts, and small verification samples do not establish complete coverage or text quality. [STATUS.md](STATUS.md) distinguishes acquisition and verification, including whether they use the same meeting inventory as their denominator.

Project pages: [Gikai Commons](https://gikai-commons.isvd.or.jp/) and [Kousou 0](https://kousou0.isvd.or.jp/). The terms of this repository, the sites, and individually supplied datasets must be checked separately.

## Sources and IDs

For citation or correction, retain the meeting, date, dataset version, field name and ID, and the location in the original source. Existing IDs can have different numbers of separators depending on the acquisition system. Do not rewrite IDs by removing separators.

This minimal example reads coverage metadata. The included ID specification is a frozen draft; its compatibility with the current route-input checks requires separate confirmation. See [the ID note](reuse-kit/ID-NOTE.txt).

## Licensing and individual support

- Code: [MIT License](LICENSE), subject to its notice requirements.
- Generated data, specifications, and aggregates supplied in this repository: CC BY 4.0 within the scope stated in [LICENSE-DATA](LICENSE-DATA).
- Original minutes: not collectively relicensed under that data license. Check the terms of each source.

Use of the public materials does not require research collaboration, referrals, feedback, or a paid support contract. Individual research, material preparation, implementation, or operation support requires a separate agreement on scope, work, responsibility, and fees. Adoption of open source and paid work received by ISVD are separate outcomes.

## Corrections and contributions

Identify the file and version, ID or location, issue, and supporting source when reporting a correction. Do not put personal information, nonpublic originals, or credentials into a public issue.

See [CONTRIBUTING.md](CONTRIBUTING.md) and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

Operated by the Institute for Social Vision Design (ISVD) / contact@isvd.or.jp

日本語版: [README.md](README.md)
