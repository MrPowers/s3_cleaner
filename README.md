# S3Cleaner

The s3_cleaner gem can be used to keep n directories in a S3 bucket/folder (or whatever Amazon calls folders).  If the AWS folder contains 20 folders (with timestamp folder names) and the `num_releases` variable is set to 15, then `s3_cleaner` will delete the 5 oldest folders when the `delete_old_releases` method is run.  Here's some example code:

```ruby
args = {
  bucket_name: "bucket-name",
  prefix: "prefix",
  num_releases: 15,
  aws_config: {
    access_key_id: "aws_access_key_id",
    secret_access_key: "aws_secret_access_key"
  }
}

s3_cleaner = S3Cleaner::Clean.new(s3_cleaner_args)
s3_cleaner.delete_old_releases
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 's3_cleaner'
```

And then execute:

    $ bundle

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MrPowers/s3_cleaner.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

