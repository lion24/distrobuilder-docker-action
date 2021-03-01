# distrobuilder-docker-action

This action prints builder LXC container from the given input file

## Inputs

### `lxc-input-file`

**Required** The filename container LXC build instruction. Default `"main.yaml"`.

## Example usage

```yaml
uses: actions/distrobuilder-docker-action@v1
with:
  lxc-input-file: 'jenkins.yaml'
```
