class CommentsController < ApplicationController
    http_basic_authenticate_with name: "shekhar", password: "shekhar", only: :destroy
    def create
        @blog = BlogDb.find(params[:blogger_id])
        @blog = @blog.comments.create(comment_params)
        redirect_to blogger_path(params[:blogger_id])
      end
    
    def destroy
        @blog = BlogDb.find(params[:blogger_id])
        @comment = @blog.comments.find(params[:id])
        @comment.destroy
        redirect_to blogger_path(params[:blogger_id]), status: 303
    end

      private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end
end
