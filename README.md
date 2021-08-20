# docker4moodle

**Please note: This doesn't currently work**

This is a bit of a mashup of [Docker4Drupal](https://github.com/Wodby/docker4drupal) and MoodleHQ's [Moodle-Docker](https://github.com/moodlehq/moodle-docker).

It is intended purely for creating a nice Development/Testing environment that's really super easy to spin up and configure.

Please don't use it for production, and please don't ask for support to make it work for production.

You may find parts of it are idiosyncratic and that will be because it's the way I work.

## Workflow

The basic workflow is to:
- set up the structure
- configure the web environment
- get the version of Moodle you want to test/develop against
- add any plugins you want test/develop
- start up docker
- install Moodle