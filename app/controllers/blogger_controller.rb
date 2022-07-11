class BloggerController<ApplicationController

   
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
     @blog = BlogDb.new({:name=>params[:name],:article=>params[:article]})
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
      
          if @blog.update({:name=>params[:name],:article=>params[:article]})
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
          








#      private
#     def article_params
#       params.require(:article).permit(:title, :body)
#     end
end
