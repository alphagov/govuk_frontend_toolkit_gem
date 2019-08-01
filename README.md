The GOV.UK Design System launched on 22 June 2018
===============

GOV.UK Frontend Toolkit has now been replaced by the GOV.UK Design System. The Toolkit will remain available in case you are currently using it, but is no longer maintained. The Government Digital Service will only carry out major bug fixes and security patches.

The GOV.UK Design System will be updated to ensure the things it contains meet level AA of WCAG 2.1, but GOV.UK Frontend Toolkit will not. [Read more about accessibility of the GOV.UK Design System](https://design-system.service.gov.uk/accessibility/).

---

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

You shouldn't need to touch this repository. New versions are published automatically
based on the `VERSION.txt` in [the frontend toolkit repo][govuk_frontend_toolkit].

## Licence

Released under the MIT Licence, a copy of which can be found in the file `LICENCE`.

[govuk_frontend_toolkit]: https://github.com/alphagov/govuk_frontend_toolkit
