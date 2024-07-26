module Posts
    class LikesController < ApplicationController
        def create
            @post = Post.find(params[:post_id])
            current_user.likes.create(post_id: @post_id)
        end
    end
end