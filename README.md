# Libroute-component
{http://libroute.io Home}
{https://github.com/xsresearch/libroute-component-ruby GitHib}

Libroute-component is a wrapper for generic interfaces to libraries. By interfacing with this wrapper, the third party library will be supported by the libroute client.

The Libroute-component is only required if you are adding support for additional third party libraries - to use libraries with existing support, visit the {https://rubygems.org/gems/libroute libroute} page

**Quick start tutorial**

Visit the {http://libroute.io/getting-started getting started} page for a 5 minute tutorial on using libroute.

## Usage

Set up a standard docker directory with a Dockerfile specifying the container build. Within the Dockerfile, run the following commands:

    RUN gem install libroute-component
    ENTRYPOINT /home/user/autoexec.rb

Create a file called autoexec.rb alongside the dockerfile with the following contents.

```ruby
#!/usr/bin/env ruby

require 'libroute/component'
require_relative 'runmylib'

Libroute::Component.run do |params|

  runmylib(params)

end
```

This will call the function runmylib in runmylib.rb and pass it a Hash object of parameters. This function should return a hash object containing the results.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/xsresearch/libroute-component-ruby

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

