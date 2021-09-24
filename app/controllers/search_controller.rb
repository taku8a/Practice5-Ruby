class SearchController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @method = params[:method]
    @content = params[:content]
    @records = search_for(@model,@content,@method)

  end

  private

  def search_for(model,content,method)
    if model == "user"
      if method == "perfect"
        User.where(name: content)
      elsif method == "forward"
        User.where("name LIKE?","#{content}%")
      elsif method == "backward"
        User.where("name LIKE?", "%#{content}")
      elsif method == "partial"
        User.where("name LIKE?","%#{content}%")
      else
        User.all

      end
    elsif model == "book"
      if method == "perfect"
        Book.where(title: content)
      elsif method == "forward"
        Book.where("name LIKE?","#{content}%")
      elsif method == "backward"
        Book.where("name LIKE?", "%#{content}")
      elsif method == "partial"
        Book.where("name LIKE?","%#{content}%")
      else
        Book.all
      end
    end
  end



end
