module Admin
  class DashboardController < Admin::AdminController
    def show
      @pictures = Picture.all
    end
  end
end
