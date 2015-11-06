module S3Cleaner; class Clean

  attr_reader :bucket_name, :prefix, :num_releases, :aws_config

  def initialize(args)
    @bucket_name = args.fetch(:bucket_name)
    @prefix = args.fetch(:prefix)
    @num_releases = args.fetch(:num_releases)
    @aws_config = args.fetch(:aws_config)
  end

  def delete_old_releases
    return if directories_to_delete.nil? || directories_to_delete.empty?
    directories_to_delete.each do |dir|
      bucket.objects.with_prefix(dir).delete_all
    end
  end

  def directories_to_delete
    @directories_to_delete ||= directories[num_releases..-1]
  end

  private

  def directories
    tree.children.select(&:branch?).collect(&:prefix).reverse
  end

  def tree
    bucket.objects.with_prefix(prefix).as_tree
  end

  def bucket
    s3.buckets[bucket_name]
  end

  def s3
    AWS.config(aws_config.merge({use_ssl: true}))
    AWS::S3.new
  end

end; end

