class SnippetsController < ApplicationController
  prepend_before_filter :require_login!

  def index
    @snippets = Snippet.paginate(page: params[:page], per_page: 10).order('id DESC')
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.user = current_user

    if @snippet.save
      flash[:notice] = 'Snippet has been created successfully.'
      redirect_to(@snippet)
    else
      render('new')
    end
  end

  def show
    @snippet = retrieve_snippet
    @comment = @snippet.comments.new
  end

  def destroy
  end

  def add_comment
    @snippet = retrieve_snippet
    @comment = @snippet.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = 'Comment has been added successfully.'
      redirect_to(@snippet)
    else
      render('show')
    end
  end

  private

  def snippet_params
    params.require(:snippet).permit(:name, :text, :settings)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def retrieve_snippet
    Snippet.find(params[:id])
  end
end
