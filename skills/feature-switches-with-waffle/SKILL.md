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

### Decorate Views

#### Function Based

```python
from waffle.decorators import waffle_switch

@waffle_switch("switch_name")
def my_view(request):
    pass
```

or

```python
@waffle_switch("switch_name", "url_name_to_redirect_to")
def my_other_view(request):
    pass
```

#### Class Based

```python
from waffle.mixins import WaffleSwitchMixin

class MyClass(WaffleSwitchMixin, View):
    waffle_switch= "my_switch"
```

### Decorate Templates

Waffle tags library needs to be present:

```html
{% load waffle_tags %}
```

Then to wrap functionality:

```html
{% switch "switch_name" %}
    switch_name is active!
{% else %}
    switch_name is inactive
{% endswitch %}
```

### Decorate Javascript

Decided not to add it at this version of this skill.
