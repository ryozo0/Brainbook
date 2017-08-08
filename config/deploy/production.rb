server '52.198.198.63', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/ryozo/.ssh/id_rsa'
