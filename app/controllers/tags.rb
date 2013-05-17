get '/tag-sort' do
  erb :insert_tag
end

post '/find-tag' do
  @tag = Tag.find_by_name(params[:tag_name])
  if @tag
    @posts = @tag.posts
    erb :show_tag
  else
    erb :insert_tag
  end
end

#test 








#   post_tags = PostTag.find_all_by_tag_id(@tag.id)

#   post_id = post_tags.map { |post_tag| post_tag.post_id}
#   post_objects = post_id.map { |post| Post.find_by_id(post)}
#   @post_names = post_objects.map {|post| post.title}

#   erb :show_tag
# end
