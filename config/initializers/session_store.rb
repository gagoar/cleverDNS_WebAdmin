# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cleaverDns_session',
  :secret      => '01e4698e0872962693fd687e70d60557546e818defd3b82d3f6740f75238c25458fcac981b7d8b884a81d497cb7d37b62a6a12f3a2924cf99ee0e9b9f517ee20'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
