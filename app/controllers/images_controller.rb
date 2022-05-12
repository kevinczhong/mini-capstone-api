class ImagesController < ApplicationController
  def index
    images = Image.all
    render json: images.as_json
  end

  def show
    image = Image.find_by(id: params[:id])
    render json: image.as_json
  end

  def create
    image = Image.create(
      url: params[:url],
      product_id: params[:id],
    )
    render json: image.as_json
  end

  def update
    image = Image.find_by(id: params[:id])
    image = Image.update(
      url: params[:id] || image.url,
      product_id: params[:id] || image.product_id,
    )
    image.save
    render json: image.as_json
  end

  def destroy
    image = Image.find_by(id: params[:id])
    image.destroy
    render json: { message: "This image has been destroyed." }
  end
end
