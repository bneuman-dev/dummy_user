enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end


post '/login' do
  if User.authenticate(params[:username], params[:password])
    session[:logged_in] = true
    redirect('/secret')
  else
    redirect('/yousuck')
  end
end

get '/new' do
  erb :new
end

get '/secret' do
  session[:logged_in] ? erb(:secret) : redirect("/")
end

post '/create' do
  User.create(params)
  redirect('/secret')
end

get "/logout" do
  session.delete(:logged_in)
  redirect to "/"
end

get '/yousuck' do
  erb :yousuck
end

get '/look_at_cookie' do
  session.inspect
end
