class SearchesController < ApplicationController

  before_action :authenticate_user!

  def search
    @content=params["content"]
    @model=params["model"]
    @method=params["method"]
    @records=search_for(@content, @model, @method)
  end

  private
    def search_for(content, model, method)
      if model == 'user'
          if method == 'perfect'
            User.where(name: 'content')
          elsif search == 'front'
            User.where('name LIKE ?', '%content')
          elsif search == 'back'
            User.where('name LIKE ?', 'content%')
          else search == 'partia'
            User.where('name LIKE ?', '%content%')
          end
      elsif model =='book'
          if method == 'perfect'
            Book.where(title: 'content')
          elsif
            Book.where('title LIKE ?', '%content')
          elsif
            Book.where('title LIKE ?', 'content%')
          else
            Book.where('title LIKE ?', '%content%')
          end
      end
    end
end

