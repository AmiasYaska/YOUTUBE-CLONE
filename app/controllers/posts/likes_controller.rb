module Posts
    class LikesController < ApplicationController
        def create
            @post = Post.find(params[:post_id])
            current_user.likes.create(post_id: @post_id)
            turbo_stream: turbo_stream.update(dom_id(@post, :like)), partial: "posts/like_button", locals: {post, like}
        end
    end
end