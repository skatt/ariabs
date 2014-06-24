N2O Bootstrap - WAI-ARIA: Sample Web Document
=============================================

This is an N2O site designed to simplify the use of Bootstrap 3 CSS, FontAwesome, and WAI-ARIA standards.
Feel free to use it in your projects. It is provided as is in public domain.

Prerequisites
=============

* Erlang R16: sudo apt-get install erlang
* Rebar: https://github.com/rebar/rebar
* iNotify Tools (Linux only): sudo apt-get install inotify-tools

Setup
-----

From Terminal perform

    ~ make

Start Server
------------

From Terminal perform

    ~ make start

Open Console
------------

From Terminal perform

    ~ make attach

Init Database
-------------

In Erlang Shell perform

    > kvs:join().

And open in browser [http://localhost:8000](http://localhost:8000)

Credits
-------

* Scott Cowick
