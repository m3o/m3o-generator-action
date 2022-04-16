# M3O Generator Action

This action generates M3O clients of the specified target. Available targets are: go, dart, ts, shell (curl examples) and cli (m3o-cli examples).

## Inputs

## `target`

**Required** The name of the target. Default `"go"`.

## `services_path`

**Required** The path of micro/services repo in the current workflow.

<!-- ## Outputs

## `success`

The result of this Action -->

## Example usage

```yaml
jobs:
  generate:
    name: build M3O CLI
    runs-on: ubuntu-latest
    steps:
      - name: Check GWT-m3o-cli repo
        uses: actions/checkout@v2
        with:
          path: m3o-cli
        
      - name: Check micro/services repo
        uses: actions/checkout@v2
        with:
          repository: 'micro/services'
          path: services

      - name: Generate m3o-cli clients
        uses: GWT-M3O-TEST/m3o-generator-action@v0.1.5
        with:
          target: 'cli'
          services_path: services
```
