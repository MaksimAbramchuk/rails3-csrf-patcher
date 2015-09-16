# Rails 3 Csrf Patcher

There are many other possibilities, like using a `<script>` tag to make a cross-site request to a URL with a JSONP or JavaScript response. The response is executable code that the attacker can find a way to run, possibly extracting sensitive data. To protect against this data leakage, we disallow cross-site `<script>` tags. Only Ajax requests may have JavaScript responses since XmlHttpRequest is subject to the browser Same-Origin policy - meaning only your site can initiate the request.

So, this gem just extend cross-site request forgery (CSRF) protection to GET requests with JavaScript responses, protecting apps from cross-origin `<script>` tags.

I've took all the code from here
https://github.com/rails/rails/pull/13345

## Installation

Add this line to your application's Gemfile:

    gem 'rails3_csrf_patcher'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails3_csrf_patcher

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rails3_csrf_patcher/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
