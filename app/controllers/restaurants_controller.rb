class RestaurantsController < ApplicationController
  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
    @restaurants_ids_rating_hash = {}
    @restaurants.each do |restaurant|
      @restaurants_ids_rating_hash[restaurant.id] = (1.0*(restaurant.ratings.collect(&:user_rating).sum))/restaurant.ratings.collect(&:user_rating).count
    end
    # list of list where first element is rest. id and second is its rating
    @sorted_list_on_rating = @restaurants_ids_rating_hash.sort_by {|_key, value| value}.reverse
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restaurants }
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @items = Item.find_all_by_restaurant_id(params[:id])
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.find_all_by_restaurant_id(params[:id])
    if customersigned_in?
      @review = current_customer.reviews.build(restaurant_id: params[:id])
      @rating = current_customer.ratings.find_by_restaurant_id(params[:id])
      if @rating.nil?
        @rating = current_customer.ratings.build(restaurant_id: params[:id], user_rating: 0)
      end
    end

  end

  # GET /restaurants/new
  # GET /restaurants/new.json
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(params[:restaurant])

    if @restaurant.save
      restaurantsign_in @restaurant
      flash[:success] = "Welcome to the My App!"
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.json
  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
        restaurantsign_in @restaurant
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end
end
