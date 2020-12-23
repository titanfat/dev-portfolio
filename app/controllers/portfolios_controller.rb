class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %w[show edit update destroy]
  layout 'portfolio'

  def index
    @portfolio_items = Portfolio.all
  end

  def ror
    @ror_items = Portfolio.ror_portfolio_items
  end

  def angular
    @angular = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times{ @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |f|
      if @portfolio_item.save
        f.html { redirect_to @portfolio_item, notice: 'Blog was successfully created.' }
        f.json { render :show, status: :created, location: @portfolio_item }
      else
        f.html { render :new }
        f.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |f|
      if @portfolio_item.update(portfolio_params)
        f.html { redirect_to @portfolio_item, notice: 'Blog was successfully updated.' }
        f.json { render :show, status: :ok, location: @portfolio_item }
      else
        f.html { render :edit }
        f.json { render json: @portfolio_item.erorrs, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |f|
      f.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      f.json { head :no_content }
    end
  end

  private

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle,
                                      :body, technologies_attributes: [:name])
  end
end
