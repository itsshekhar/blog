class BloggerController<ApplicationController

   
    def index
         @blog = BlogDb.all
    end
     
    def show
         @blog = BlogDb.find(params[:id])
    end
end
