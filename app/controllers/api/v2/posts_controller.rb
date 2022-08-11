class Api::V2::PostsController < ApplicationController
    before_action :getPost, only: [:showPost, :updatePost, :deletePost]
    def showPost
        if @post
            render json: @post, status: :ok
        else
            render json: {msg: "Post not found"}, status: :unprocessable_entity
        end
    end
    def getPosts
        @posts = Post.all
        if @posts
            render json: @posts, status: :ok
        else
            render json: {msg: "Posts is empty"}, status: :unprocessable_entity
        end
    end
    def createPost
        post = Post.new(postparams)
        if post.save()
            render json: post, status: :ok
        else
            render json: {msg: "Created post failed"}, status: :unprocessable_entity
        end
    end
    def updatePost
        if @post
            if @post.update(postparams)
                render json: @post, status: :ok
            else
                render json: {msg: "Updated post failed"}, status: :unprocessable_entity
            end
        else
            render json: {msg: "Post not found"}, status: :unprocessable_entity
        end
    end
    def deletePost
        if @post
            if @post.destroy()
                render json: {msg: "Deleted post successfully"}, status: :ok
            else
                render json: {msg: "Deleted post failed"}, status: :unprocessable_entity
            end
        else
            render json: {msg: "Post not found"}, status: :unprocessable_entity
        end
    end
    private
    def postparams
        params.permit(:title, :body, :author)
    end
    def getPost
        @post = Post.find(params[:id])
    end
end
