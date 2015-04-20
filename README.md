# fx-web

Simple Rails web app, built to test the functionality of the 
[fx_rates](https://github.com/overture8/fx_rates) library.

# Usage

After cloning:

    cd fx-web
    bundle
    rake consume_api # This is used to cache the api (used file system as default - see config/initializers/fx_rates.rb)
    rails s
    open http://localhost:3000
