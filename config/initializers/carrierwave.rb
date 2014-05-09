CarrierWave.configure do |config|

	if Rails.env.test? || Rails.env.cucumber?
		config.storage = :file
		config.enable_processing = false
		config.root = "#{Rails.root}/tmp"
	else
		config.storage = :fog
		config.fog_credentials = {
			:provider               => "AWS",                        # required
			:aws_access_key_id      => Damagemiseh::Application.config.aws_key,                        # required
			:aws_secret_access_key  => Damagemiseh::Application.config.aws_secret,                        # required
			# :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
			# :host                   => 's3.example.com',             # optional, defaults to nil
			# :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
		}
		config.fog_directory  = "damagecontrolfamily"                  		# required
		config.fog_public     = true                                   		# optional, defaults to true
		config.asset_host	  = "http://assets%d.damagecontrolfamily.com"  	# optional, defaults to true
	  	config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  	# optional, defaults to {}
	end
end