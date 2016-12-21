class CreatelicensesController < ApplicationController
  before_action :check_login
  before_action :set_createlicense, only: [:show, :edit, :update, :destroy]
  def index

    @cpuids=Cpuid.all
    @licenses=License.all
    if params[:cpuid]!='' && params[:cpuid]!= nil
      @cpuids=Cpuid.where("cpuid like '%"+params[:cpuid]+"%'")
debugger
    end


    if params[:license] !='' && params[:license]!=nil
      @licenses=License.where("license like '%"+params[:license]+"%'")

      cpu_ids=''
      @licenses.each do |f|
      cpu_ids=cpu_ids+f.cpuid_id.to_s+','
      end
      if cpu_ids.length>0
        cpu_ids=cpu_ids[0,cpu_ids.length-1]
        @cpuids=Cpuid.where('id in ('+cpu_ids+')')
      else
        @cpuids=Cpuid.where(id:0)
      end
    end
@cpuids= @cpuids.order("updated_at DESC").paginate(page:params[:page],per_page:10)

   # @licenses=License.all.order("updated_at DESC")

    @cpucount=@cpuids.count
    @licensecount = @licenses.count

#debugger
  end

  def createlicense

  end

  def ajaxcreate
    @licensecount=0
    @cpuid=Cpuid.find_by_cpuid(params[:cpuid])
    if @cpuid == nil
      Cpuid.create(cpuid:params[:cpuid])
    end
    lastcupid=@cpuid.id
    #@cpuid=Cpuid.where(cpuid:params[:cpuid])
    licensevalue=''
      licensenumber=params[:licensenum]
      licensetime=params[:licensetime]


    licensestr=params[:cpuid].to_s.upcase+':'+licensenumber+':'+DateTime.parse(licensetime).strftime("%Y%m%d")  +':CLOUDTIMESOFT'
#debugger
    @temlicense=::Digest::MD5.hexdigest(licensestr)#bfebfbff000306c3
    license=@temlicense.to_s[8,16]
    license.to_s.upcase!

    license.insert(12,'-')
    license.insert(8,'-')
    license.insert(4,'-')

    @licenses=License.find_by(license:license)
    #debugger
    if @licenses==nil
      #debugger
      License.create(cpuid_id:lastcupid,license:license,licensenum:params[:licensenum],licensetime:params[:licensetime])
    end

#debugger

license='[{"license"'+':"' +license+'"}]'
    render json:(license)
  end

  def update

    respond_to do |format|
      if @createlicense.update(createlicense_params)
        format.html { redirect_to questions_path, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @createlicense }
      else
        format.html { render :edit }
        format.json { render json: @createlicense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy

    @createlicense.destroy
    respond_to do |format|
      format.html { redirect_to createlicenses_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_createlicense
    @createlicense = Createlicense.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def createlicense_params
    params.require(:createlicense).permit(:createlicense,:cpuid_id,:licensenum,:licensetype,:licensenum,:licensetime)
  end


end
