Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins ['http://localhost:3000']
      resource '*',
      headers: :any,
      expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
      methods: %i[:get, :post, :options, :delete, :put, :patch, :head]
    end
end