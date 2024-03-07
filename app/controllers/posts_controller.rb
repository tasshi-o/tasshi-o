class PostsController < ApplicationController
  before_action :authenticate_user! 

  def home
      
  end

  def index
    @tag = Tag.select("name", "id")
      tag_search = params[:tag_search]
    if tag_search != nil
      @posts = Tag.find_by(id: tag_search).posts
    else
      @posts = Post.all
  end


    
 
    if params[:tag]
      Tag.create(name: params[:tag])
    end
    
    if params[:tag_ids]
      @posts = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_posts = Tag.find_by(name: key).posts
          @posts = @posts.empty? ? tag_posts : @posts & tag_posts
        end
      end
    end
  end

      def new
        @post= Post.new
      end
  
      def create
        post = Post.new(post_params)
        
        post.user_id = current_user.id

        if post.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @post = Post.find(params[:id])
      end

      def edit
        @post = Post.find(params[:id])
      end 
    
      def update
        post = Post.find(params[:id])
        if post.update(post_params)
          redirect_to :action => "show", :id => post.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to action: :index
      end

      def select

      end



      def hokkaido
        @hokkaido = Post.where(genre:"北海道") 
        @tag = Tag.select("name", "id")
        tag_search = params[:tag_search]
        if tag_search != nil
          @posts = Tag.find_by(id: tag_search).posts
        else
          @posts = Post.all
        end
      end
    
      def touhoku
        @touhoku = Post.where(genre:"東北") 
        @tag = Tag.select("name", "id")
        tag_search = params[:tag_search]
        if tag_search != nil
          @posts = Tag.find_by(id: tag_search).posts
        else
          @posts = Post.all
        end
      end
    
      def kanto
        @kanto = Post.where(genre:"関東") 
        @tag = Tag.select("name", "id")
        tag_search = params[:tag_search]
        if tag_search != nil
          @posts = Tag.find_by(id: tag_search).posts
        else
          @posts = Post.all
        end
      end
    
      def tyubu
        @tyubu = Post.where(genre:"中部")
        @tag = Tag.select("name", "id")
        tag_search = params[:tag_search]
        if tag_search != nil
          @posts = Tag.find_by(id: tag_search).posts
        else
          @posts = Post.all
        end 
      end

      def kinki
        @kinki = Post.where(genre:"近畿") 
        @tag = Tag.select("name", "id")
        tag_search = params[:tag_search]
        if tag_search != nil
          @posts = Tag.find_by(id: tag_search).posts
        else
          @posts = Post.all
        end
      end

      def chusioku
        @chusikoku = Post.where(genre:"中国・四国") 
        @tag = Tag.select("name", "id")
        tag_search = params[:tag_search]
        if tag_search != nil
          @posts = Tag.find_by(id: tag_search).posts
        else
          @posts = Post.all
        end
      end

      def kyusyu
        @kyusyu = Post.where(genre:"九州") 
        @tag = Tag.select("name", "id")
        tag_search = params[:tag_search]
        if tag_search != nil
          @posts = Tag.find_by(id: tag_search).posts
        else
          @posts = Post.all
        end
      end

      private

      def post_params
        params.require(:post).permit(:name, :sect, :address, :genre, :area, :about, :image, :lat, :lng, tag_ids: [])
      end

    end
