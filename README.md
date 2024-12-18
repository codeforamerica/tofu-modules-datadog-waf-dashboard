# Datadog WAF Module

[![Main Checks][badge-checks]][code-checks] [![GitHub Release][badge-release]][latest-release]

This module creates a dashboard in Datadog for monitoring an AWS based Web
Application Firewall.

![Screenshot of the Datadog WAF Dashboard][screenshot-dashboard]

## Requirements

This dashboard assumes that your logs are tagged with `source:waf` and
`webacl:*`, where `webacl` is the name of the WebACL that the log is associated
with. There are multiple ways to accomplish this, but the easiest is to tag the
CloudWatch log group with the appropriate tags, and ensure that
`DdFetchLogGroupTags` is set to `true` in the [log forwarder
stack][aws-forwarder].

## Usage

Add this module to your `main.tf` (or appropriate) file and configure the inputs
to match your desired configuration. For example:

```hcl
module "datadog_waf" {
  source = "github.com/codeforamerica/tofu-modules-datadog-waf?ref=1.0.0"

  default_webacls = ["my-project-prod"]
}
```

Make sure you re-run `tofu init` after adding the module to your configuration.

```bash
tofu init
tofu plan
```

To update the source for this module, pass `-upgrade` to `tofu init`:

```bash
tofu init -upgrade
```

## Inputs

| Name                      | Description                                                                                                                  | Type           | Default                            | Required |
|---------------------------|------------------------------------------------------------------------------------------------------------------------------|----------------|------------------------------------|----------|
| default_webacls           | Default WebACLs to for the dashboard filter.                                                                                 | `list(string)` | `[]`                               | no       |
| threshold_allowed_caution | Caution threshold for allowed requests. Reflected when the percentage of allowed requests drops below this number.           | `number`       | `95`                               | no       |
| threshold_allowed_warning | Warning threshold for allowed requests. Reflected when the percentage of allowed requests drops below this number.           | `number`       | `85`                               | no       |
| threshold_blocked_caution | Caution threshold for blocked requests. Reflected when the percentage of blocked requests rises above this number.           | `number`       | `5`                                | no       |
| threshold_blocked_warning | Warning threshold for blocked requests. Reflected when the percentage of blocked requests rises above this number.           | `number`       | `10`                               | no       |
| threshold_counted_caution | Caution threshold for counted requests. Reflected when the percentage of counted requests rises above this number.           | `number`       | `5`                                | no       |
| threshold_counted_warning | Warning threshold for counted requests. Reflected when the percentage of counted requests rises above this number.           | `number`       | `10`                               | no       |
| threshold_limited_caution | Caution threshold for rate limited requests. Reflected when the percentage of rate limited rises above below this number.    | `number`       | `5`                                | no       |
| threshold_limited_warning | Warning threshold for rate limited requests. Reflected when the percentage of rate limited requests rises above this number. | `number`       | `10`                               | no       |
| title                     | Title of the dashboard.                                                                                                      | `string`       | `"Web Application Firewall (WAF)"` | no       |

[aws-forwarder]: https://docs.datadoghq.com/logs/guide/forwarder/?tab=cloudformation#advanced-optional
[badge-checks]: https://github.com/codeforamerica/tofu-modules-datadog-waf-dashboard/actions/workflows/main.yaml/badge.svg
[badge-release]: https://img.shields.io/github/v/release/codeforamerica/tofu-modules-datadog-waf-dashboard?logo=github&label=Latest%20Release
[code-checks]: https://github.com/codeforamerica/tofu-modules-datadog-waf-dashboard/actions/workflows/main.yaml
[latest-release]: https://github.com/codeforamerica/tofu-modules-datadog-waf-dashboard/releases/latest
[screenshot-dashboard]: docs/assets/dashboard.png
