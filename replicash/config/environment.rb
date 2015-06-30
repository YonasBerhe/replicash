# Load the Rails application.
require File.expand_path('../application', __FILE__)

if Rails.env.development? && File.exists?('.env')
  opts = File.read('.env').split("\n")
  opts.each do |str|
    k,v = str.split('=')
    ENV[k] = v if v.present?
  end
end
# Initialize the Rails application.
Rails.application.initialize!
