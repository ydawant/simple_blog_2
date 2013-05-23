get '/show-all' do
  @all_posts = Post.all
  erb :show_all
end

get '/specific-post' do
  erb :specific_post
end

get '/new-post' do
  @user = current_user
  erb :new_post
end

get '/show-mine' do
  @all_posts = Post.all
  erb :show_mine
end

get '/tag-sort' do
  erb :insert_tag
end

get '/posts/:id' do
  @post = Post.find_by_id(params[:id])

  # @post.tags << Tag.create()

  post_tags = PostTag.find_all_by_post_id(@post.id)
  @tag_id = post_tags.map { |post_tag| post_tag.tag_id} 
  @user = session[:user_id]
  erb :display_post
end

delete '/posts/:id' do
  post = Post.find_by_id(params[:id])
  post.destroy 
  redirect '/home'
end

post '/posts/:id/edit' do
  @post = Post.find_by_id(params[:id])
  post_tags = PostTag.find_all_by_post_id(@post.id)
  tag_id = post_tags.map { |post_tag| post_tag.tag_id}
  @tags = tag_id.map { |tag_id| Tag.find_by_id(tag_id).name}.join(', ')
  erb :edit_post
end

put '/posts/:id' do
  post = Post.find_by_id(params[:id])
  post.update_attributes(title: params[:post_title], body: params[:post_body], :tags => Tag.from_string(params[:tags]))
  redirect '/'
end

post '/posts/:id' do
  tag_string = params[:tags]
  tag_names = tag_string.split(',').map(&:strip)
  puts params.inspect
  @user = current_user
  @user.tags = tag_names.map { |tag| Tag.find_or_create_by_name(tag)}
# @user.tags << Tag.
  Post.create(title: params[:post_title], body: params[:post_body], author: @user.username, :tags => tags)

  redirect "/home"
end

get '/error' do
  erb :error
end
