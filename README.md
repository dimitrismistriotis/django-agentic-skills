# [EXPERIMENTAL] Django Agentic Skills

In this repository I wanted to code up some skills to be used in sub agents or agentic development. I have not seen many repositories about the Django framework and because they are quite generic, I decided to release this as open source for the benefit of the community.

Please contribute and extend, find issues, etc. Currently there are very, very few — OK, one — to demonstrate intent. Hopefully their number will increase soon.

## Installation

Requires Claude Code **1.0.33 or later**.

**1. Add the marketplace:**

```shell
/plugin marketplace add dimitrismistriotis/django-agentic-skills
```

**2. Install a skill:**

```shell
/plugin install ui-template-with-cotton-or-partials@django-agentic-skills
```

Or run `/plugin`, go to the **Discover** tab, and install interactively.

## Skills

### `ui-template-with-cotton-or-partials`

Takes context from Django views and ports it to its visual equivalent using Django's template partials and/or the [Cotton](https://github.com/wrabit/django-cotton) component framework.

- Uses **Django partials** for fragments reused within a single template
- Uses **Cotton components** for UI elements shared across multiple templates
- Applies Tailwind CSS classes when Tailwind is present in the project
