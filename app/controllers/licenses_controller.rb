class LicensesController < ApplicationController
  before_action :check_login
  before_action :set_license, only: [:show, :edit, :update, :destroy]
  def destroy
    @license.destroy
    respond_to do |format|
      format.html { redirect_to createlicenses_path, notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_license
    @license = License.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def license_params
    params.require(:cpuid).permit(:license,:licensetype,:licensenum,:licensetime,:cpuid_id)
  end

end
