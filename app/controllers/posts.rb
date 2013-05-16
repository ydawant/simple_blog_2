get '/show-all' do
  @all_posts = Post.all
  erb :show_all
end

get '/specific-post' do
  erb :specific_post
end

get '/new-post' do
  erb :new_post
end

get '/tag-sort' do
  erb :insert_tag
end

get '/posts/:id' do
  @post = Post.find_by_id(params[:id])
  post_tags = PostTag.find_all_by_post_id(@post.id)
  @tag_id = post_tags.map { |post_tag| post_tag.tag_id} 
  erb :display_post
end

delete '/posts/:id' do
  post = Post.find_by_id(params[:id])
  post.destroy 
  redirect '/'
end

post '/posts/:id/edit' do
  @post = Post.find_by_id(params[:id])
  post_tags = PostTag.find_all_by_post_id(@post.id)
  tag_id = post_tags.map { |post_tag| post_tag.tag_id}
  @tags = tag_id.map { |tag_id| Tag.find_by_id(tag_id).name}.join(', ')
  erb :edit_post
end

post '/posts/:id' do
  post = Post.find_by_id(params[:id])
  post.update_attributes(title: params[:post_title], body: params[:post_body], :tags => Tag.from_string(params[:tags]))
  redirect '/'
end

put '/posts' do
  tag_string = params[:tags]
  p tag_names = tag_string.gsub(/\s+/, "").split(',')
  
  author = "Yannick"

  tags = tag_names.map { |tag| Tag.find_or_create_by_name(tag)}

  Post.create(title: params[:post_title], body: params[:post_body], author: author, :tags => tags)

  redirect '/'
end

get '/error' do
  erb :error
end
