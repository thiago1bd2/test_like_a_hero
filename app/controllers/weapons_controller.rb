class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end

  def create
    @weapon = Weapon.create(weapon_params)
    redirect_to weapons_path
  end

  def destroy
    @weapon = Weapon.find(params[:id])
    @weapon.destroy

    redirect_to root_path, status: :see_other
  end

  def show
    @weapon = Weapon.find(params[:id])
  end

  private

  def weapon_params
    params.require(:weapon).permit(
      :name, :description, :power_base, :power_step, :level
    )
  end
end
