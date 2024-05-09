# About

A basic image, to trigger PHP processes, using [Supervisor](http://supervisord.org/).
It can be used with frameworks such as: [Symfony](https://symfony.com) and [Laravel](https://laravel.com).

# Usage
To use this image you can use the command:

``` shell
docker run -v path/to/your/conf/:/etc/supervisor/conf.d/ \
falves97/supervisor-php:latest
```
