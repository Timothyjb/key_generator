class CsrController < ApplicationController

  get '/csr/new' do
    @csr_creater = CsrCreater.new

    erb :'csr/new'
  end

  post '/csr/create' do
    @csr_creater = CsrCreater.new
    @csr_creater.country = params[:country]
    @csr_creater.state = params[:state]
    @csr_creater.city = params[:city]
    @csr_creater.organization = params[:organization]
    @csr_creater.department = params[:department]
    @csr_creater.common_name = params[:common_name]
    @csr_creater.email = params[:email]
    @csr_creater.call

    erb :'csr/new'
  end

end
