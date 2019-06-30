module Admin
  class PicturesController < Admin::AdminController
    def create
      @picture = Picture.create picture_params
    end

    private

    def picture_params
      params.require(:picture).permit(:asset)
    end
  end
end