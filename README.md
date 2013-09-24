# Gitlab Install

Sprinkle cookbooks to provision Gitlab server. Based on original Gitlab
installation instructions.

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