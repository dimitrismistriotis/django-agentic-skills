---
name: start-app
description: Creates a new app from a template if present and adds it to settings and URLs
allowed-tools: Read, Grep, Glob, Bash()
argument-hint: <app_name> [template_name]
---

# Start App and Include to Settings and URLs

## Inputs

- `app_name`: The name of the new Django application to create
- `template_name`: The name of the template to use (optional)

## Template Discovery

If `template_name` is not provided:

1. Use Glob to scan the current directory for any folder whose name contains the word "template" (case-insensitive), e.g. `*template*` or `*Template*`.
2. If exactly one match is found, suggest it to the user: "Found template module `<folder_name>`. Use it? (yes/no)"
   - If the user confirms, use that folder as the template.
   - If the user declines, proceed without a template.
3. If multiple matches are found, list them and ask the user to pick one or proceed without a template.
4. If no match is found, proceed without a template.

If `template_name` is provided, skip discovery and use it directly.


## Creation of App

If `template_name` is available, run:

```bash
uv run python manage.py startapp "${app_name}" --template="${template_name}"
```

else run:

```bash
uv run python manage.py startapp "${app_name}"
```

## Integrate with Application

### Add to INSTALLED_APPS

Discover settings file, usually in `manage.py`.

Append `app_name` to `INSTALLED_APPS` within the settings file. 

### Add to URLs

In main `urls.py` within settings directory.

Generate a `url_prefix` from the `app_name`, something nice to be in URLs

Append to `urlpatterns`:

```python
path("{{ url_prefix }}/", include("{{ app_name }}.urls")),
```

### Add to pyproject.toml tests if there


Add test path to `pyproject.toml` in the `[tool.pytest]` section under `testpaths` if that thing exists:

```toml
   testpaths = [
       # ...
       "{{ app_name }}/tests",
   ]
```
