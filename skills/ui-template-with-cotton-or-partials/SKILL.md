---
name: ui-template-with-cotton-or-partials
description: Yoou are capable of taking context from views and porting it to it's visual equivalent in a Django template using Djano's partials and/or the Cotton Framework where needed.
allowed-tools: Read, Grep, Glob, Git
---

# Django Template Author with Cotton or Django Partials

https://github.com/wrabit/django-cotton

## Make sure that documentation is preseent

To use documentation make sure that Cotton's documenation has been is present and has been updated in the last two weeks. Use `scripts/update_cotton_documentation.bash` for this.

## Read Documentation When Needed

Documentation for cotton is available in the "documentation" directory.
Documentation for Django's templates is available in `reference/django_template_partial.md`

## Purpose

Create DRY code with re ards to template UI so that when we change elements there will not be inconsistencies. Also reuse UI code to have the same UI elements within the application

- When UI code is to be used within the same template, use a Django Partial
- If a component is to be used in different places and different templates, then it should live in a Cotton component

## Usage Instructions
   
Create UI elements per usual for Django. Then for each one which is used more than once contemplate if it should be abstracted to a partial or to a Cotton component as described above.

Check if Tailwind CSS is present in the project. If so, use it as much as you can while creating UI code.

Request the user to have Django 6 installed to be able to use partials. Install Cotton if it is not there. Right, cotton components in the appropriate directory for the module, "COTTON_DIR" in settinge or default to "cotton". Refer to the documentation for tool's usage.
