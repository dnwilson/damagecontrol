CarrierWave.configure do |config|

	if Rails.env.test? || Rails.env.cucumber? || Rails.env.development?
		config.storage = :file
		# config.enable_processing = true
		# config.root = "#{Rails.root}/public/"
	else
		config.storage = :fog
		config.fog_credentials = {
			:provider               => "AWS",                        # required
			:aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],                        # required
			:aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],                        # required
			# :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
			# :host                   => 's3.example.com',             # optional, defaults to nil
			# :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
		}
		config.fog_directory  = ENV['FOG_DIRECTORY']                 		# required
		config.fog_public     = true                                   		# optional, defaults to true
		config.asset_host	  = "http://assets#{[0,1,2,3].sample}.damagecontrolfamily.com"  	# optional, defaults to true
	  	config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  	# optional, defaults to {}
	end
end