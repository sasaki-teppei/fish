class LikesController < ApplicationController
    def create
        like = Like.new
        like.user_id = current_user.id
        like.topic_id = params[:topic_id]
        
        if like.save
            redirect_to('/topics/show')
        else
            redirect_to('/top')
        end
    end
end
