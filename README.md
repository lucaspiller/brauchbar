= brauchbar

Adj, German.
* practical, convenient, utilizable, feasible

In other words, a decent HTTP client for Ruby!

== Introduction

=== But what.... what is wrong with all the other client?

The majority of other clients are built on top off Net::HTTP. This is the HTTP library built into Ruby, and [it is slow](http://pivotallabs.com/users/steve/blog/articles/644-net-http-alternatives)... It also has a few annoying features, such as downcasing all headers. Oh, and they don't have a cool German name!

=== So, this is special how?

brauchbar is built on top of the [httpclient](http://github.com/nahi/httpclient) gem, which itself is based upon libwww-perl. In other words, it has history. History is good. The brauchbar interface is based upon a number of other good, it is designed to be simple and easy to integrate.

== Install

> gem install brauchbar

== Usage

TODO

== Hacking

Feel free to hack away at this, however I won't merge anything unless you have adequate tests for it! Once you have done, send a pull request.

== Contributors

* [Luca Spiller](http://github.com/lucaspiller/)

== License

brauchbar is licensed under a [Creative Commons Attribution 2.0 UK: England & Wales License](http://creativecommons.org/licenses/by/2.0/uk/).

![CC Some Rights Reserved](http://creativecommons.org/images/public/somerights20.png)
