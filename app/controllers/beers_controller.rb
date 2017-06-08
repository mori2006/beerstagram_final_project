require 'open-uri'

class BeersController < ApplicationController
  def index
    @beers = Beer.all

    render("beers/index.html.erb")
  end

  def show
    @beer = Beer.find(params[:id])

    render("beers/show.html.erb")
  end

  def new
    @beer = Beer.new
    @search_name = params[:name]

    url = "http://api.brewerydb.com/v2/beers?name="+@search_name+"&withBreweries=Y&key=e040b6aa2790deb35c1c03d2322d373b"

    parsed_data = JSON.parse(open(url).read)

    if parsed_data["data"] != nil
      @search_result_db_beer_id = parsed_data["data"][0]["id"]
      @search_result_beer_name = parsed_data["data"][0]["name"]
      @search_result_beer_descrip = parsed_data["data"][0]["description"]
      @search_result_abv = parsed_data["data"][0]["abv"]
      if parsed_data["data"][0]["labels"] != nil
        @search_result_beer_image = parsed_data["data"][0]["labels"]["medium"]
      else
      end
      if parsed_data["data"][0]["available"] != nil
        @search_result_avail = parsed_data["data"][0]["available"]["description"]
      else
      end
      if parsed_data["data"][0]["style"] != nil
        @search_result_style = parsed_data["data"][0]["style"]["name"]
      else
      end
      if parsed_data["data"][0]["breweries"] != nil
        @search_result_brewery = parsed_data["data"][0]["breweries"][0]["name"]
      else
      end
      if parsed_data["data"][0]["breweries"][0]["images"] != nil
        @search_result_brewery_image = parsed_data["data"][0]["breweries"][0]["images"]["medium"]
      else
      end
      @search_result_brewery_website = parsed_data["data"][0]["breweries"][0]["website"]
      @search_result_brewery_descrip = parsed_data["data"][0]["breweries"][0]["description"]
      @search_result_db_brewery_id = parsed_data["data"][0]["breweries"][0]["id"]
      # @search_result_brewery_type =
      @search_result_brewery_est = parsed_data["data"][0]["breweries"][0]["established"]
      if parsed_data["data"][0]["breweries"][0]["locations"] != nil
        @search_result_brewery_street_add = parsed_data["data"][0]["breweries"][0]["locations"][0]["streetAddress"]
        @search_result_brewery_locality = parsed_data["data"][0]["breweries"][0]["locations"][0]["locality"]
        @search_result_brewery_region = parsed_data["data"][0]["breweries"][0]["locations"][0]["region"]
        @search_result_brewery_zip_code = parsed_data["data"][0]["breweries"][0]["locations"][0]["postalCode"]
        @search_result_brewery_phone = parsed_data["data"][0]["breweries"][0]["locations"][0]["phone"]
        @search_result_brewery_lat = parsed_data["data"][0]["breweries"][0]["locations"][0]["latitude"]
        @search_result_brewery_long = parsed_data["data"][0]["breweries"][0]["locations"][0]["longitude"]
      else
      end
    else
    end

    render("beers/new.html.erb")
  end

  def create
    @beer = Beer.new

    @beer.name = params[:name]
    @beer.image = params[:image]
    @beer.user_id = params[:user_id]
    @beer.brewed_by = params[:brewed_by]
    @beer.style = params[:style]
    @beer.descrip = params[:descrip]
    @beer.abv = params[:abv]
    @beer.db_api_beer_id = params[:db_api_beer_id]
    @beer.avail = params[:avail]
    @beer.rating = params[:rating]

    save_status = @beer.save

    if save_status == true
      redirect_to("/beers/#{@beer.id}", :notice => "Beer created successfully.")
    else
      render("beers/new.html.erb")
    end
  end

  def edit
    @beer = Beer.find(params[:id])

    render("beers/edit.html.erb")
  end

  def update
    @beer = Beer.find(params[:id])

    @beer.name = params[:name]
    @beer.image = params[:image]
    @beer.user_id = params[:user_id]
    @beer.brewed_by = params[:brewed_by]
    @beer.style = params[:style]
    @beer.descrip = params[:descrip]
    @beer.abv = params[:abv]
    @beer.db_api_beer_id = params[:db_api_beer_id]
    @beer.avail = params[:avail]
    @beer.rating = params[:rating]

    save_status = @beer.save

    if save_status == true
      redirect_to("/beers/#{@beer.id}", :notice => "Beer updated successfully.")
    else
      render("beers/edit.html.erb")
    end
  end

  def destroy
    @beer = Beer.find(params[:id])

    @beer.destroy

    if URI(request.referer).path == "/beers/#{@beer.id}"
      redirect_to("/", :notice => "Beer deleted.")
    else
      redirect_to(:back, :notice => "Beer deleted.")
    end
  end

  def find_beer

    render("beers/find_beer_form.html.erb")
  end

end
