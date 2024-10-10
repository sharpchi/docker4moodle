# docker4moodle

**Please note: This isn't intended for production code and is unsupported.**

This is a bit of a mashup of [Docker4Drupal](https://github.com/Wodby/docker4drupal) and MoodleHQ's [Moodle-Docker](https://github.com/moodlehq/moodle-docker).

It is intended purely for creating a nice Development/Testing environment that's really super easy to spin up and configure.

Please don't use it for production, and please don't ask for support to make it work for production.

You may find parts of it are idiosyncratic and that will be because it's the way I work.

## Structure

The following headings represent the directory structure of this project.
### assets

The files in this folder are copied into the web-server and added to its configuration. For example, `assets/web/php-ini/apache2_php.ini` is loaded into apache to raise the memory. Similiar effects can be acheived by updating some environment variables in the docker-compose.yml file.

`apache2_faildumps.conf` and `apache2_mailhog.conf` are used to configure the server for behat and the email server.

### bin

The tools in `bin` are a selection of tools I have used to fetch the latest versions of Moodle and plugins, and sync them to the `web/html` and `web/moodledata` folders for the containers.

How you go about fetching and managing your html code is entirely up to you. You may find `getmoodle.sh` useful, as it will download a specified version of Moodle from moodle.org. It will created a folder in the bin directory named `moodle-nn` where `nn` is the Moodle version you specified. This can then be copied to your `web/html` folder.

The `setup` folder takes this a stage further and draws in plugins either from git or from an imaginary structure in the moodleextra folder. Note, these script files will not work for you, but you can use them as examples for developing your own processes.

The `moodleextra` folder is a reserved folder where you can put whatever you want and it will be ignored by git. So if you own tools for pulling together the Moodle code, this is a good place to put it.

### mariadb

The database from the container is persisted here. If you need to reset everything, delete this folder (you may need sudo). It will be recreated when you restart docker.

### mariadb-init

If you have a sql dump of an existing installation, you can put it in here before you start the containers for the first time. When the containers start, the sql will be read and written to the database when it starts (note: if the file is very large, it will take some time before the installation is ready to go).
### web

The `web` folder is mounted on the webserver container. This will be where you Moodle code will go. It needs to have the following sub-folders:

- behatdata
- behatfaildumps
- html
- moodledata
- phpunitdata

You can run `setup.sh` to create these folders. If you are copying content to the `html` and `moodledata` folders check that the permissions are ok. In particular the `moodledata` folder needs to have 777 permissions.

If you are running behat tests the `behatdata` and `phpunitdata` folders will contain the `moodledata` folder for behat and phpunit testing.

`behatfaildumps` will contain screenshots of any failed behat tests.

After you have created or copied your html code to the `web/html` folder, copy in the `config.docker-template.php` to `web/html/config.php`. This will pick up all your environment variables set in `.env`
## Workflow

The basic workflow is to:
- set up the structure
- configure the web environment
- get the version of Moodle you want to test/develop against
- add any plugins you want test/develop
- start up docker
- install Moodle

## Phan

Static analysis tools

* https://www.php.net/manual/en/appendices.php PHP Deprecations
* https://github.com/phan/phan/wiki/Getting-Started#creating-a-config-file
* https://odan.github.io/2020/12/22/php8-compatibility-check.html
* https://github.com/phan/phan/wiki/Tutorial-for-Analyzing-a-Large-Sloppy-Code-Base

## PHPDD

I've included PHP Deprecation Detector in the composer file. Install this to use.

```
// Checks that the whole html folder is compatible after PHP 7.4 to PHP 8.0 and outputs to php80.txt file.
// This excludes some development folders and 3rd party library folders that we have no control over, but if you
// want to do a full-full scan remove the exclude list.
./vendor/bin/phpdd scan -t 8.0 -a 7.4 -e codechecker,moodlecheck,node_modules,vendor web/html/ > phpdd.txt

// You can change the path to check individual plugins e.g.
./vendor/bin/phpdd scan -t 8.0 -a 7.4 web/html/blocks/checklist
```
