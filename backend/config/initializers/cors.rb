Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'localhost:8080'
      resource '*',
      headers: :any,
      expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
      methods: [:get, :post, :options, :delete, :put, :patch, :head]
    end
end