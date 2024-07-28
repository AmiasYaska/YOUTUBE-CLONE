module Posts
    class LikesController < ApplicationController
        include ActionView::RecordIdentifier
        def create
            @post = Post.find(params[:post_id])
            current_user.likes.create(post_id: @post.id)
            render turbo_stream: turbo_stream.update(dom_id(@post, :like), partial: "posts/like_button", 
            locals: {user: current_user, post: @post})
        end
    end
end