# Gitlab Install

Sprinkle cookbooks to provision Gitlab server.

*This is not ready yet*

## Install

Clone repository and install dependencies:

```
git clone https://github.com/sosedoff/gitlab-install.git
cd gitlab-install
bundle install
```

## Usage

Make sure you have a clean server. Cookbooks were only tested on clean Ubuntu 13.04
64-bit instance.

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