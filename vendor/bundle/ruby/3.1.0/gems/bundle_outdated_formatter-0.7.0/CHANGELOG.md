# Change Log

## 0.7.0 (2020-06-29)

### Features

* Support Bundler >= 2.1.0.pre.1 (#4)

### Miscellaneous

* Relax dependency version requirements
* Add workflows for GitHub Actions

## 0.6.0 (2019-11-24)

### Features

* Add `--column` option for `output` command (#3)

### Bug Fixes

* Fix error of Terminal format with empty outdated gems
* Fix tests against Terminal (Unicode table) format

### Miscellaneous

* Suppress output in tests

## 0.5.1 (2019-04-16)

### Bug Fixes

* Fix some dependency errors (#2)

## 0.5.0 (2018-05-26)

### Features

* Support Terminal (Unicode table) format
* Change default style of Terminal format from ASCII table to Unicode table
* Add `--style` option for `output` command
* Change single quotes in XML declaration to double quotes
* Avoid self-closing tags

### Bug Fixes

* Fix `Illegal character` exception (#1)

## 0.4.0 (2017-12-29)

### Features

* Support Terminal (ASCII table) format
* Change default format from Markdown to Terminal

## 0.3.0 (2017-07-08)

### Features

* Support TSV format
* Add `--pretty` option for `output` command
* Raise `UnknownFormatError` if format is not allowed

## 0.2.0 (2017-06-19)

### Features

* Support JSON format
* Support YAML format
* Support CSV format
* Support XML format
* Support HTML format

## 0.1.0 (2017-06-15)

### Features

* Add `output` command (default)
* Support Markdown format (default)
* Add `version`, `--version`, and `-v` commands
