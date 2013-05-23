get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/user/authentication' do
  @user = User.find_by_email(params[:email])
  if @user && User.auth_password(@user.password) == params[:password]
    session[:user_id] = @user.id
    redirect "/home"
  else
    redirect '/'
  end
end

get '/user/new_account' do
  erb :new_account
end

put '/user' do
  inputs = {:username => params[:username], :new_password => params[:new_password], :email => params[:email]}
  @user = User.new(inputs)
  @user.save
  session[:user_id]=@user.id
  redirect "/home"
end

get '/home' do
  @user = current_user
  erb :home
end


get '/logout' do
  session.clear
  redirect '/'
end
