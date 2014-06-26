# GOV.UK Frontend Toolkit

A gem wrapper around the [govuk_frontend_toolkit](http://github.com/alphagov/govuk_frontend_toolkit).

## Installing

Just include `govuk_frontend_toolkit` in your `Gemfile`. It
automatically attaches itself to your asset path so the static/SCSS
files will be available to the asset pipeline.

### Development

If you are installing from git, ensure you enable submodules like so:

    gem 'govuk_frontend_toolkit', :git => "https://github.com/alphagov/govuk_frontend_toolkit_gem.git", :submodules => true

You will need to check that the gem is included while in development. Often
asset related gems are in a bundler group called `assets`. Old Rails projects
do not inluded this in development by default so you need to ensure bundler is
included using the following lines at the top of the `/config/application.rb`:

    if defined?(Bundler)
      # If you precompile assets before deploying to production, use this line
      Bundler.require *Rails.groups(assets: %w(development test))
      # If you want your assets lazily compiled in production, use this line
      # Bundler.require(:default, :assets, Rails.env)
    end

### Production

You will need to ensure that the correct assets are precompiled for
production. These are set using the variable `config.assets.precompile` in
`/config/application.rb`. An example of what this may look like is:

    config.assets.precompile += %w(
      application.css
      application-ie8.css
      application-ie7.css
      application-ie6.css
      application.js
    )

## Usage

At the top of a Sass file in your Rails project you should use an `@import` rule
to include the file for the mixins you require. For example if you want the
conditionals and typography mixins you should add:

    @import '_conditionals';
    @import '_typography';

## Updating the version of the toolkit that's included with the gem

1. Find the commit of [the toolkit][govuk_frontend_toolkit] you want to update to. In this
   repository, `cd app/assets` and then run `git checkout <NEW TOOLKIT COMMIT>` to change
   the git submodule
2. Update the version number in `lib/govuk_frontend_toolkit/version.rb`
3. Commit those two changes together and push them.

Do not create a version tag in this repository - that's handled automatically by the
job that publishes the gem to RubyGems.

## Licence

Released under the MIT Licence, a copy of which can be found in the file `LICENCE`.

[govuk_frontend_toolkit]: https://github.com/alphagov/govuk_frontend_toolkit
