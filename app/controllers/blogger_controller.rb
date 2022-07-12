class BloggerController<ApplicationController


     http_basic_authenticate_with name: "shekhar", password: "shekhar", except: [:index, :show]

    def index
         @blog = BlogDb.all
    end
     
    def show
         @blog = BlogDb.find(params[:id])
    end

    def new
          @blog=BlogDb.new()
    end

    def create
     @blog = BlogDb.new(blog_params)
   
     # @blog.name=params[:name]
     # @blog.article=params[:article]
          if @blog.save
          redirect_to blogger_url(@blog[:id])
          else
          render :new, status: :unprocessable_entity
          end
     end

     def edit
          @blog=BlogDb.find(params[:id])
     end

     def update
          @blog = BlogDb.find(params[:id])
          puts params
          puts"-------------------------------"
          if @blog.update(blog_params)
            redirect_to blogger_url(@blog[:id])
          else
            render :edit, status: :unprocessable_entity
          end
     end  

     def destroy
          @blog = BlogDb.find(params[:id])
          @blog.destroy
          redirect_to blogger_index_path, status: :see_other
     end
          
     private
     def blog_params  
          params.require(:blog_db).permit(:name,:article)
    end


end
