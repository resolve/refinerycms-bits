# Refinerycms::Bits

An engine with bits and pieces we reuse when we're building sites in RefineryCMS.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'refinerycms-bits'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install refinerycms-bits

## Usage

### BootstrapMenuPresenter
Builds menus with classes ready for bootstrap. Use it in a block like this:

```
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav-primary">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
          <div class="collapse navbar-collapse" id="nav-primary">
            <ul class="nav navbar-nav navbar-hoverable">
              <%= Refinery::Bits::BootstrapMenuPresenter.new(refinery_menu_pages, self).to_html %>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </div>
</div>
```

### navbar-hoverable
Use in conjunction with BootstrapMenuPresenter to have menus open on hover on desktop screens, as so many clients expect them to do.

In app/assets/application.css
```
*= require bits/navbar-hoverable

```
