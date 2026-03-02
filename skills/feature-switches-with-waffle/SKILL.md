---
name: feature-switches-with-waffle
description: Use feature switches to control introduction of new functionality and regressions with Django Waffle
allowed-tools: Read, Grep, Glob
---

# Feature Switch with Waffle

Purpose of this task is to allow people managing the system to quickly revert new functionality in case a bug or any other side effects are discovered or even if they want to delay the release of a feature using a lite Circuit Breaker pattern.

## Install

Make sure that library is installed and present.

Install with uv with:


```shell
uv add django-waffle
```

Install with pip:

```shell
pip install django-waffle
```

## Setup

Check project's `settings.py`. There are many settings in <https://waffle.readthedocs.io/en/stable/starting/configuring.html>. Inform user and ask to discuss every one if requested.


Check if at least one `WAFFLE_` parameter is set, if so assume user has setup Waffle for their project and do not suggest to setup again, notify though about it:

> "It seems that Waffle has been setup from reading your setting file."

Definitely discuss the following:

### `WAFFLE_SWITCH_DEFAULT`

> When a Switch is undefined in the database, Waffle considers it False. Set this to True to make Waffle consider undefined switches True. Defaults to False.

Suggest to make it `True` for non deployed environments.

Suggestion: `WAFFLE_SWITCH_DEFAULT = DEBUG`

### `WAFFLE_CREATE_MISSING_SWITCHES`

Suggest to set to `True` so that it will be more obvious what is going on in the database.

## Decorate Code

For switches check with `waffle.switch_is_active('switch_name')`,
Waffle should be present in the file `import waffle`.

Code should be like:

```python
import waffle

if waffle.switch_is_active("switch_name"):
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
    waffle_switch = "my_switch"
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

## Unit Tests

Initially

```python
from waffle.testutils import override_switch
```

Then either

```python
with override_switch("switch_name", active=True):
    # Only "switch_name" is affected, other ones behave normally.
    assert waffle.switch_is_active("switch_name")
```

... for a specific assertion, or

```python
@override_switch("switch_name", active=True)
def test_with_switch_active():
    assert waffle.switch_is_active("switch_name")
```

and setting `active=False` for regression

```python
@override_switch("switch_name", active=False)
def test_with_switch_not_active():
    assert not waffle.switch_is_active("switch_name")
```

for whole tests very dependent on a switch.

## Instructions to Manage Switches

Always after applying this skill, inform for the following command line commands:


Switches
Use manage.py to change the values of your switches:

To set off:

```shell
uv run python manage.py waffle_switch switch_name off
```

or


```shell
uv run python manage.py waffle_switch switch_name off --create
```

... if not present

To set on:

```shell
uv run python manage.py waffle_switch switch_name on
```

or


```shell
uv run python manage.py waffle_switch switch_name on --create
```

... if not present

and to list all existing switches:

```shell
uv run python manage.py waffle_switch -l
```

