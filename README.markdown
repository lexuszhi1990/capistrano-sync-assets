Capistrano Assets sync
======================

a easy way to synchronize assets between local and remote. by default, it will backup the current asset by rename it end with 'bak'(eg, change 'system' to 'system_bak'), and delete the previous backup.
It only works with capistrano 3.

Usage
=======

#### In your Gemfile:
Add it to Gemfile on development group

```ruby
  gem 'capistrano-sync-assets', require: false, group: :development
```

#### In your Capfile:

```ruby
require 'capistrano/sync/assets'
```

#### In your `deploy.rb` or `deploy/production.rb` or other environment deploy config
set the sync dirs, such as 'public/uploads', 'public/system'. NOTE that these dirs should be existed in `linked_dirs`, which means that this gem only sync the dirs in **shared/** directory.

```ruby
  set :sync_assets_dirs, fetch(:sync_assets_dirs, []).push('public/uploads')
```

then you can sync the assets between your local machine and server.

```
cap sync:assets:pull # Synchronize your local assets using remote assets
cap sync:assets:push # Synchronize your remote assets using local assets
```

Contributing
============

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

------
Copyright (c) 2015 [David lingzhi], released under the MIT license
