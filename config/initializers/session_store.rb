# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_school_session',
  :secret      => '56212b243f71b13462c4bbd3a434e23d9a66de3d5c4aebbfd731708a7ae000a9a62bf0ca0afaa7c6283db1cd56456039f5aaa038bcd90800972e6df4eddc5ec9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
