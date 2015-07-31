module Acme
  class Ping < Grape::API
    desc 'Returns pong.'
    get :ping do
      { ping: params[:pong] || 'pong' }
    end

    namespace :super do
      get :ping do
        pong = params[:pong] || 'pong'
        { ping: "#{pong.upcase}!!!" }
      end

      route :any, '*path' do
        { path: params[:path] }
      end
    end
  end
end
