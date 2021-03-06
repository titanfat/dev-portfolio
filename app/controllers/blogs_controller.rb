class BlogsController < ApplicationController
  before_action :set_sidebar_topics, except: [:update, :create, :destroy, :toggle_status]
  before_action :set_blog, only: %w[show edit update destroy toggle_status]
  layout 'blog'
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @blogs = if logged_in?(:site_admin)
               Blog.recent.page(params[:page]).per(5)
    else
      Blog.published.recent.page(params[:page]).per(5)
             end
    @page_title = "My Developer Blog"
  end

  def show
    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new
    else
      redirect_to blogs_path, notice: "You are not authorized to access this page"
    end
    @page_title = @blog.title
    @seo_keywords = @blog.body
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif
      @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url, notice: 'Blog was update status!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def blog_params
    params.require(:blog).permit(:title, :body, :topic_id)
  end

  def set_sidebar_topics
    @side_bar_topics = Topic.with_blogs
  end
end
