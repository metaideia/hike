Rails.application.routes.default_url_options[:host] = Rails.env.production? ? "http://hike.metaideia.com.br" : "localhost:3000"
