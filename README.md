# GitHub Status API

GitHub continuously monitors the status of github.com and all its related services. If there are any interruptions, the system status can be check on https://status.github.com/
or querying the GitHub Status API.

This library allows you to easily integrate and query the GitHub Status API.

## Installation
At the present moment I haven't release the gem. However, you can easily build and install it yourself.
<!--
Add this line to your application's Gemfile:

    gem 'github_status'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install github_status
-->
## Usage
Firstly, the library can be used to wrap the whole of the Github Status API into objects.
```
Github::Status.last_message
=> #<GithubStatus::Status @created_on="2013-01-08T23:13:55Z", @message="Error Message ...",@status="minor">

GithubStatus::Status.messages
=> [#<Github::Status @created_on="2013-01-08T23:33:47Z", @message="Error Message ...", @status="minor">,
    #<Github::Status @created_on="2013-01-08T23:33:47Z", @message="Error Message ...", @status="major">,
    #<Github::Status @created_on="2013-01-08T23:33:47Z", @message="Error Message ...", @status="minor">]
 
```

Alternatively, the GitHub Status API can be queried directly to return the JSON:

```
GithubStatus::API.last_message
=> { :status=>"minor", :body=>"Error message ...", :created_on=>"2013-01-08T23:33:47Z" }

GithubStatus::API.messages
=> [
     { :status=>"minor", :body=>"Error message ...", :created_on=>"2013-01-08T23:33:47Z" },
     { :status=>"minor", :body=>"Error message ...", :created_on=>"2013-01-08T23:33:47Z" }
   ]
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
