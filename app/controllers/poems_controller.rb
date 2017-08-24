get '/poems' do
  @poems = Poem.all
  erb :'poems/index'
end

get '/poems/new' do
  if request.xhr?
    erb :'poems/new', layout: false
  else
    erb :'poems/new'
  end
end

post '/poems' do
  @poem = Poem.new(params[:poem])
  if request.xhr?
    if @poem.save
      erb :'poems/_index_show', layout: false, locals: {poem: @poem}
    else
      @errors = @poem.errors.full_messages
      erb :'poems/new'
    end
  else
    if @poem.save
      redirect '/'
    else
      @errors = @poem.errors.full_messages
      erb :'poems/new'
    end
  end
end

get '/poems/:id' do
  @poem = Poem.find(params[:id])
  @comments = @poem.comments
  erb :'poems/show'
end

get '/poems/:id/edit' do
  @poem = Poem.find(params[:id])
  erb :'/poems/edit'
end

put '/poems/:id' do
  @poem = Poem.find(params[:id])
  if @poem.update(params[:poem])
    redirect "poems/#{@poem.id}"
  else
    @errors = @poem.errors.full_messages
    erb :'poems/edit'
  end
end

delete '/poems/:id' do
  @poem = Poem.find(params[:id])
  @poem.destroy
  redirect '/'
end
