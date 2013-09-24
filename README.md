# Gitlab Install

Sprinkle cookbooks to provision Gitlab server. Based on original Gitlab
installation instructions.

## Overview

Gitlab is a great alternative to Github, but following installation instructions
step by step might take a long time when you're setting it up for the first time. 
gitlab-install has been created to speed up this process. Create a fresh server 
instance, run a single command and it'll get it up and running in 15 minutes.

Tested on:

- Digital Ocean (Ubuntu 13.04 x64)

## Install

Clone repository and install dependencies:

```
git clone https://github.com/sosedoff/gitlab-install.git
cd gitlab-install
bundle install
```

Make sure you're running sprinkle >= 0.7.6.1:

```
sprinkle --version
```

## Usage

You should have an absolutely clean server. 
Cookbooks are only tests on 64-bit Ubuntu 13.04. 

Define target server:

```
export TARGET_HOST=gitlab.mydomain.com
export TARGET_USER=root
export TARGET_PASSWORD=mypassword
```

Then execute:

```
sprinkle -s ./gitlab.rb
```

You can also add some debug information with `-v` flag.

Install usually takes ~15 minutes. You should see the output like this:

```
[gitlab]
  * apt_update
    --> INSTALLED for roles: app
  * build_essentials
    --> INSTALLED for roles: app
  * python_software_properties
    --> INSTALLED for roles: app
  * git
    --> INSTALLED for roles: app
  * python
    --> already installed for roles: app
  * python_docutils
    --> INSTALLED for roles: app
  * redis
    --> INSTALLED for roles: app
  * postgresql
    --> INSTALLED for roles: app
  * nginx
    --> INSTALLED for roles: app
  * ruby
    --> INSTALLED for roles: app
  * rubygems
    --> INSTALLED for roles: app
  * bundler
    --> INSTALLED for roles: app
  * gitlab_user
    --> INSTALLED for roles: app
  * gitlab_postgres
    --> INSTALLED for roles: app
  * gitlab_shell
    --> INSTALLED for roles: app
  * gitlab_core
    --> INSTALLED for roles: app
  * gitlab_git
    --> INSTALLED for roles: app
  * gitlab_gems
    --> INSTALLED for roles: app
  * gitlab_db
    --> INSTALLED for roles: app
  * gitlab_setup
    --> INSTALLED for roles: app
  * gitlab_nginx
    --> INSTALLED for roles: app
  * gitlab_services
    --> INSTALLED for roles: app
  * gitlab
```

If there were no errors during installation, open browser with your server domain
or ip address. Login with default user: `admin@local.host / 5iveL!fe`

## TODO

- YAML-based configuration
- Postfix setup

## Contact

- Dan Sosedoff
- dan.sosedoff@gmail.com
- http://github.com/sosedoff
- http://twitter.com/dan_sosedoff