# New Zealand Companies Office API Gem

Simple and fast authenticating API wrapper for the New Zealand Companies Office. Full functionality to search by company name, company number and director. Further functionality can be easily exposed inline with API documentation.


## About the Companies Office

The New Zealand Companies Office has an API which can be accessed through registration at: [http://www.business.govt.nz/businessdata](http://www.business.govt.nz/businessdata)

Registration is required in order to obtain unique access keys to use the API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nzcoapi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nzcoapi

## Configuration

[Figaro](https://github.com/laserlemon/figaro) is a dependency required to securely store your Companies Office access and secret keys.

Execute the following to setup application.yml to store your Companies Office keys with Figaro.

    $ rails generate nzcoapi:install

Alternatively you can manually add your Companies Office keys:

	# config/application.yml
	$ nzcoapi_access_key: "J5zFrdbg2iw"
	$ nzcoapi_secret_key: "fin39USzsZGWgL2yUDQ1C0n6NBtv2"


## Usage

Three functions have been exposed, as per below.

### Find by Company Number
	
	$ NZcoapi.find_company(123566)

Full company details based on a unique 'Company Number' will be returned.

### Find Director

	$ NZcoapi.find_director("Jones, Bob")

All company directorships (active and inactive) of this individual will be returned.

### Search for a Company

	$ NZcoapi.search_for_company("TradeMe")

Search results for this company name will be returned.


All output is returned as parsed XML. Within a rails view it can be quickly navigated with [Nokogiri](https://github.com/sparklemotion/nokogiri), for example:

	# In View
	<%= NZcoapi.find_company(973228).css('companyName').text %>

	# Returns
	Trade Me Limited

## Queries

> NB: This Gem is not developed or maintained by the New Zealand Companies Office in anyway.

Please don't hesitate to get in touch if you have any queries and I'll try and point you in the right direction!


## Contributing

1. Fork it ( https://github.com/[my-github-username]/nzcoapi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
