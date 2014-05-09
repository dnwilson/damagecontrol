CarrierWave.configure do |config|

	config.fog_credentials = {
		:provider               => 'AWS',                        # required
		:aws_access_key_id      => "<%= ENV['AWS_ACCESS_KEY_ID'] %>",                        # required
		:aws_secret_access_key  => "<%= ENV['AWS_SECRET_ACCESS_KEY'] %>",                        # required
		# :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
		# :host                   => 's3.example.com',             # optional, defaults to nil
		# :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
	}
	config.fog_directory  = 'damagecontrolfamily'                     # required
	config.fog_public     = false                                   # optional, defaults to true
	config.asset_host	  = "http://assets%d.damagecontrolfamily.com"

	if Rails.env.test? || Rails.env.cucumber?
		config.storage = :file
		config.enable_processing = false
		config.root = "#{Rails.root}/tmp"
	else
		config.storage = :fog
	end
end