# [EXPERIMENTAL] Django Agentic Skills

In this repository I wanted to code up some skills to be used in sub agents or agentic development. I have not seen many repositories about the Django framework and because they are quite generic, I decided to release this as open source for the benefit of the community.

Please contribute and extend, find issues, etc. Currently there are very, very few to demonstrate intent. Hopefully their number will increase soon.

## Installation

Requires Claude Code **1.0.33 or later**.

**1. Add the marketplace:**

```shell
/plugin marketplace add dimitrismistriotis/django-agentic-skills
```

**2. Install a skill:**

```shell
/plugin install feature-switches-with-waffle@django-agentic-skills
```

```shell
/plugin install ui-template-with-cotton-or-partials@django-agentic-skills
```

Or run `/plugin`, go to the **Discover** tab, and install interactively.

**3. Update a skill:**

Skills are installed from the latest version on the `master` branch. To update a skill to the latest version, re-run the install command:

```shell
/plugin install feature-switches-with-waffle@django-agentic-skills
```

To update all installed skills from this marketplace at once:

```shell
/plugin marketplace update dimitrismistriotis/django-agentic-skills
```

## Skills

### `feature-switches-with-waffle`

Uses Switches from [Django Waffle](https://waffle.readthedocs.io/en/stable/) to create a feature switchboard in templates, views, tests.

- Uses **Waffle switches** to gate new functionality behind a flag
- Supports **function-based views**, **class-based views**, and **templates**
- Includes **unit test utilities** (`override_switch`) for testing both active and inactive states
- Provides `manage.py` commands to toggle switches at runtime without a deployment


### `ui-template-with-cotton-or-partials`

Takes context from Django views and ports it to its visual equivalent using Django's template partials and/or the [Cotton](https://github.com/wrabit/django-cotton) component framework.

- Uses **Django partials** for fragments reused within a single template
- Uses **Cotton components** for UI elements shared across multiple templates
- Applies Tailwind CSS classes when Tailwind is present in the project
