module Admin
  class PicturesController < Admin::AdminController
    def create
      @picture = Picture.new picture_params
      if @picture.save
        redirect_to admin_dashboard_path, notice: 'Picture created'
      else
        redirect_to admin_dashboard_path, alert: 'Picture not created'
      end
    end

    private

    def picture_params
      params.require(:picture).permit(:asset)
    end
  end
end
