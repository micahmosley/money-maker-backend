if Rails.env === 'production'
    Rails.application.config.session_store :cookie_store, key: '_money-maker-backend', domain: 'money-maker-backend-json-api'
  else
    Rails.application.config.session_store :cookie_store, key: '_money-maker-backend'
end