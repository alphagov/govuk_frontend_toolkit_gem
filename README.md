# GOV.UK Frontend Toolkit

A gem wrapper around the [govuk_frontend_toolkit](http://github.com/alphagov/govuk_frontend_toolkit).

## Installing

Just include `govuk_frontend_toolkit` in your `Gemfile`. It
automatically attaches itself to your asset path so the static/SCSS
files will be available to the asset pipeline. If you are installing from git, ensure you enable submodules like so:

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

You will also need to ensure that the correct assets are precompiled for
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

## Licence

Released under the MIT Licence, a copy of which can be found in the file `LICENCE`.
