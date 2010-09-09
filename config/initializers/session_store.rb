# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_online-kingdom_session',
  :secret      => '6f3b09f9dca705c7f6fed3a319b521a8cae3018243c8f087f39711be935711cc24463c4d2ed2357b9fd26a9ede5f9e695130a0585cf60be50cb471927797e057'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
