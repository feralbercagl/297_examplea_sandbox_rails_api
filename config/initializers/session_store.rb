# Be sure to restart your server when you modify this file.
# Using local Mongo DB (via Mongoid) for session storage.
Examplea::Application.config.session_store :mongoid_store, {
  expire_after: 30.minutes
}
