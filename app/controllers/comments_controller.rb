class CommentsController < ApplicationController
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    if @comment.save
      redirect_to :id => nil, notice:  "Successfully saved comment." #return back to parent object or something
      redirect_to [@commentable, :comments], notice:  "Successfully saved comment."
    else
      render :action => 'new'
    end
  end
#Regarding the redirect_to, there's no need to use the :id => nil hack. It can be more clearly done as so:
#redirect_to [@commentable, :comments]
  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, notice: 'comment deleted'
  end
  private
    def load_article
      @article = Article.find(params[:article_id]) #wrong
    end
    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
    def load_commentable
      @commentable = if params[:article_id]
        Article.find(params[:article_id])
      elsif params[:photo_id]
        Photo.find(params[:photo_id])
      elsif params[:event_id]
        Event.find(params[:event_id])
      end
    end
    def load_commentable
      if params[:article_id]
        @commentable = Article.find(params[:article_id])
      elsif params[:photo_id]
        @commentable = Photo.find(params[:photo_id])
      elsif params[:event_id]
        @commentable = Event.find(params[:event_id])
      end
    end
end
