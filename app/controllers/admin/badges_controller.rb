class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[edit show update destroy]

  def edit; end

  def show; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :new
    end
  end

  def index
    @badges = Badge.all
  end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge], notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.success')
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image, :rule)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
