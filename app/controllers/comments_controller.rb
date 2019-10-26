class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id

    if comment.save
      redirect_back(fallback_location: root_path, notice: 'Comment successfully created.')
    else
      redirect_back(fallback_location: movies_path, alert: comment_errors(comment))
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :movie_id)
  end

  def comment_errors(comment)
    comment.errors.full_messages.to_sentence
  end
end
