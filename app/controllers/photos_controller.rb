class PhotosController < InheritedResources::Base
  
  def index
    @photos = Photo.all.paginate(page: params[:page], per_page: 4)
  end
  
  private

    def photo_params
      params.require(:photo).permit(:name, :image, :image_cache, :album_id)
    end
end

