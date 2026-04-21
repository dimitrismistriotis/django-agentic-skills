---
name: start-app
description: Creates a new app from a template if present and adds it to settings and URLs
allowed-tools: Read, Grep, Glob, Edit, Write, Bash()
argument-hint: <app_name> [template_path]
---

# Start App and Include to Settings and URLs

## Inputs

- `app_name`: The name of the new Django application to create
- `template_path`: The path of the template to use (optional)

## Template Discovery

If `template_path` is not provided:

1. Use Glob to scan the current directory for any folder whose name contains the word "template". Try both `*template*` and `*Template*`. Note: on case-sensitive filesystems (Linux) these two patterns do not cover all casings (e.g. `*TEMPLATE*`); they are a best-effort heuristic.
2. If exactly one match is found, suggest it to the user: "Found template module `<folder_name>`. Use it? (yes/no)"
   - If the user confirms, use that folder as the template.
   - If the user declines, proceed without a template.
3. If multiple matches are found, list them and ask the user to pick one or proceed without a template.
4. If no match is found, proceed without a template.

If `template_path` is provided, skip discovery and use it directly.

## Check that Application does not Already Exist

Stop execution if `app_name` already exists

## Creation of App

If `template_path` is available, run:

```bash
uv run python manage.py startapp "${app_name}" --template="${template_path}"
```

else run:

```bash
uv run python manage.py startapp "${app_name}"
```

## Integrate with Application

### Add to INSTALLED_APPS

Discover settings file, read manage.py to extract the DJANGO_SETTINGS_MODULE value, then open that file.

Append `app_name` to `INSTALLED_APPS` within the settings file if not already there.

### Add to URLs

Execute this only if `template_path` contains a URL file.

In main `urls.py` within settings directory.

Generate a `url_prefix` from the `app_name`, replace underscores with hyphens and lowercase, so "my_app" becomes "my-app".

Append to `urlpatterns`:

```python
path("<url_prefix>/", include("<app_name>.urls")),
```

### Add to pyproject.toml tests if there

Add test path to `pyproject.toml` under `testpaths` if the `[tool.pytest.ini_options]` section exists. Note: `testpaths` must go in `[tool.pytest.ini_options]`, not `[tool.pytest]` — pytest silently ignores the latter.

```toml
   testpaths = [
       # ...
       "<app_name>/tests",
   ]
```
