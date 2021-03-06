class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    @blog = Blog.find(params[:blog_id])
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @blog = Blog.find(params[:blog_id])
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @blog = Blog.find(params[:blog_id])


  end

  # GET /comments/1/edit
  def edit
    @blog = Blog.find(params[:blog_id])
    session[:return_to] ||= request.referer
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @blog = Blog.find(params[:blog_id])

    respond_to do |format|
      @blog = Blog.find(params[:blog_id])
      if @comment.save
        # format.html { redirect_to blog_comments_path, notice: 'Comment was successfully created.' }
        format.html { redirect_to @blog, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @blog = Blog.find(params[:blog_id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @blog = Blog.find(params[:blog_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @blog, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :blog_id, :body)
    end
end
