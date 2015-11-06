require "spec_helper"

module S3Cleaner; describe Clean do

  context ".new" do
    it "can be instantiated" do
      Clean.new({
        bucket_name: "bucket_name",
        prefix: "prefix",
        num_releases: 42,
        aws_config: {}
      })
    end
  end

end; end
