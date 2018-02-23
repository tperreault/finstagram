helpers do
    def current_user
        User.find_by(id: session[:user_id])
    end
end

get '/' do
    @posts = Post.order(created_at: :desc)
    erb(:index)
end

post '/likes' do
    post_id = params[:post_id]
    like = Like.new({ post_id: post_id, user_id: current_user.id })
    like.save
    redirect(back)
end

get '/signup' do
    @user = User.new
    erb(:signup)
end

get '/login' do
    erb(:login)
end

post '/login' do
    username = params[:username]
    password = params[:password]
   
    user= User.find_by(username: username)
   
    if user && user.password == password
        session[:user_id] = user.id
        redirect to('/')
    else
        @error_message = "Login failed."
        erb(:login)
    end
end
   
post '/signup' do
    email       = params[:email]
    avatar_url  = params[:avatar_url]
    username    = params[:username]
    password    = params[:password]
        
    @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

    if @user.save
        redirect to('/login')
    else
        erb(:signup)
    end
end

delete '/likes/:id' do
    like = Like.find(params[:id])
    like.destroy
    redirect(back)
end

get '/posts/new' do
    @post = Post.new
    erb(:"posts/new")
end

post '/posts' do
    photo_url = params[:photo_url]
    
    @post = Post.new({ photo_url: photo_url, user_id: current_user.id })
    
    if @post.save
        redirect(to('/'))
    else
        
        erb(:"posts/new")
    end
end

get '/posts/:id' do
    @post = Post.find(params[:id])
    erb(:"posts/show")
end

get '/logout' do
    session[:user_id] = nil
    redirect to('/login')
end

post '/comments' do
    text = params[:text]
    post_id = params[:post_id]
    comment = Comment.new({ text: text, post_id: post_id, user_id: current_user.id })
    comment.save
    redirect(back)
end
