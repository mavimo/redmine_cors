# Redmine CORS

Redmine plugin to allow external application to use Redmine REST API with [cross-origin resource sharing](http://en.wikipedia.org/wiki/Cross-origin_resource_sharing).

If you have a browser application that require to access to Redmine API in a different domain your browser block request. This plugin allow browser to complete request and consue the API.

## Install

Clone current repo in the plugins directory:

```bash
cd $REDMINE_ROOT
git clone git://github.com/mavimo/redmine_cors.git plugins/redmine_cors
```

and restart webserver to load plugins.

## Setup

In the administration area, click on *Plugin* section. This plugin have a configuration link, click on this link 
and you will be able to define domain allowed to CQRS request. Default is set to **'*'** that allow all domains to make request to your application.
