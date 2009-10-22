# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sinan_session',
  :secret      => '7d4b7f9df470e94340cee550e4d36042a95cff643f6803795dde39a420b2ccede555d16f5b7320d0a9987105f457c5dce77bf5be26b4670277733e4ae4bace95'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
