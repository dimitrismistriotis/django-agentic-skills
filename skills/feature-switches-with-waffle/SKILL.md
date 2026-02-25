# Feature Switch with Waffle

Purpose of this task is to allow people managing the system to quickly revert new functionality in case a bug or any other side effects are discovered or even if they want to delay the release of a feature using a lite Circuit Breaker pattern.

## Install

Make sure that library is installed and present.

Install with uv with:


```shell
uv add waffle
```

## Decorate Code

For switches check with `waffle.switch_is_active('switch_name')`,
Waffle should be present in the file `import waffle`.

Code should be like:

```python
import waffle

if waffle.switch_is_active('switch_name')
  # implement "new" untested functionality
else:
  # Current, established functionality
```
