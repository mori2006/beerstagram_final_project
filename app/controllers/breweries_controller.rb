class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all

    render("breweries/index.html.erb")
  end

  def show
    @brewery = Brewery.find(params[:id])

    render("breweries/show.html.erb")
  end

  def new
    @brewery = Brewery.new
    @search_name = params[:name]

    url = "http://api.brewerydb.com/v2/breweries?name="+@search_name+"&key=e040b6aa2790deb35c1c03d2322d373b"

    parsed_data = JSON.parse(open(url).read)

    if parsed_data["data"] != nil

      @search_result_brewery_name = parsed_data["data"][0]["name"]
      @search_result_db_brewery_id = parsed_data["data"][0]["id"]
      @search_result_brewery_website = parsed_data["data"][0]["website"]
      @search_result_brewery_descrip = parsed_data["data"][0]["description"]
      @search_result_brewery_est = parsed_data["data"][0]["established"]
      if parsed_data["data"][0]["images"] != nil
        @search_result_brewery_image = parsed_data["data"][0]["images"]["medium"]
      else
      end

    else
    end

    render("breweries/new.html.erb")
  end

  def create
    @brewery = Brewery.new

    @brewery.name = params[:name]
    @brewery.image = params[:image]
    @brewery.descrip = params[:descrip]
    @brewery.db_api_brewery_id = params[:db_api_brewery_id]
    @brewery.type = params[:type]
    @brewery.est = params[:est]
    @brewery.website = params[:website]
    @brewery.street_add = params[:street_add]
    @brewery.locality = params[:locality]
    @brewery.region = params[:region]
    @brewery.zip_code = params[:zip_code]
    @brewery.phone = params[:phone]
    @brewery.lat = params[:lat]
    @brewery.long = params[:long]

    save_status = @brewery.save

    if save_status == true
      redirect_to("/breweries/#{@brewery.id}", :notice => "Brewery created successfully.")
    else
      render("breweries/new.html.erb")
    end
  end

  def edit
    @brewery = Brewery.find(params[:id])

    render("breweries/edit.html.erb")
  end

  def update
    @brewery = Brewery.find(params[:id])

    @brewery.name = params[:name]
    @brewery.image = params[:image]
    @brewery.descrip = params[:descrip]
    @brewery.db_api_brewery_id = params[:db_api_brewery_id]
    @brewery.type = params[:type]
    @brewery.est = params[:est]
    @brewery.website = params[:website]
    @brewery.street_add = params[:street_add]
    @brewery.locality = params[:locality]
    @brewery.region = params[:region]
    @brewery.zip_code = params[:zip_code]
    @brewery.phone = params[:phone]
    @brewery.lat = params[:lat]
    @brewery.long = params[:long]

    save_status = @brewery.save

    if save_status == true
      redirect_to("/breweries/#{@brewery.id}", :notice => "Brewery updated successfully.")
    else
      render("breweries/edit.html.erb")
    end
  end

  def destroy
    @brewery = Brewery.find(params[:id])

    @brewery.destroy

    if URI(request.referer).path == "/breweries/#{@brewery.id}"
      redirect_to("/", :notice => "Brewery deleted.")
    else
      redirect_to(:back, :notice => "Brewery deleted.")
    end
  end

  def find_brewery

    render("breweries/find_brewery_form.html.erb")
  end

end
