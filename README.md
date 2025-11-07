# `Jekyll_kramdown` [![Gem Version](https://badge.fury.io/rb/jekyll_kramdown.svg)](https://badge.fury.io/rb/jekyll_kramdown)

Defines a `kramdown` block tag that processes
[Kramdown](https://kramdown.gettalong.org/) (a flavor of Markdown) embedded in
HTML files.


## Installation

Add the following to your Jekyll website's `Gemfile`:

```ruby
group :jekyll_plugins do
  gem 'jekyll_kramdown'
end
```

And then execute:

```shell
$ bundle
```

## Options

Kramdown options can be specified in the content.
See https://kramdown.gettalong.org/options.html

## Usage

Add the following in any HTML file within a Jekyll project:

```html
{% kramdown %}
## Heading

Some text

- option 1
- option 2
{% endkramdown %}
```


## Development

After checking out this git repository, install dependencies by typing:

```shell
$ bin/setup
```

You should do the above before running Visual Studio Code.


### Run the Tests

```shell
$ bundle exec rake test
```


### Interactive Session

The following will allow you to experiment:

```shell
$ bin/console
```


### Local Installation

To install this gem onto your local machine, type:

```shell
$ bundle exec rake install
```


### To Release A New Version

To create a git tag for the new version, push git commits and tags,
and push the new version of the gem to the Gem server, type:

```shell
$ bundle exec rake release
```


## Contributing

Bug reports and pull requests are welcome at https://github.com/mlinn/jekyll_kramdown.


## License

The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).
