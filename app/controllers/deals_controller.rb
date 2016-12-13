class DealsController < ApplicationController
  before_action :find_deal,only: [:show,:edit,:update,:destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  helper DealsHelper

  def index
    if params[:category].blank?
    @deals = Deal.paginate(:page => params[:page],:per_page => 10).order("created_at desc")
    else 
      @category_id = Category.find_by(name: params[:category]).id
      @deals = Deal.paginate(:page => params[:page],:per_page => 20).where(:category_id => @category_id)
    end
  end

  def new 
    @deal = current_user.deals.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @deal = current_user.deals.build(deal_params)
    @deal.category_id = params[:category_id]
    if @deal.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    if @deal.surveys.blank?
      @average_surveys = 0
    else
      @average_surveys = @deal.surveys.average(:rating).round(2)
    end
  end 

  def edit
    @categories = Category.all.map{|c| [c.name,c.id]}
  end

  def update
    if @deal.update(deal_params)
      redirect_to @deal
    else
      render :edit
    end
  end

  def destroy
    if @deal.destroy
      redirect_to root_path
    end
  end
  
  def searchable
    if params[:search].blank?
      redirect_to root_path
    else
      searchword = params[:search]
      @deals = Deal.where("lower(title) LIKE ? or lower(description) LIKE ?", "%#{searchword.downcase}%","%#{searchword.downcase}%")
    end
  end

  private

  def deal_params
    params.require(:deal).permit(:title,:description,:link,:link1,:category_id,:image)
  end

  def find_deal
    @deal = Deal.find(params[:id])
  end

end
