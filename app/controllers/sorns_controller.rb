class SornsController < ApplicationController
  def search
    @sorns = Sorn.no_computer_matching.includes(:mentioned).preload(:agencies)
    @selected_fields = Sorn::FIELDS
    @sorns = @sorns.joins(:agencies).where(agencies: {name: params[:agency]}) if params[:agency]
    @sorns = @sorns.where(id: SornSearch.search(params[:search]).select(:sorn_id))

    @sorns = @sorns.page(params[:page]) if request.format == :html

    respond_to do |format|
      format.html
      # format.json { render json: @sorns.to_json }
      format.csv { send_data @sorns.to_csv(@selected_fields), filename: "sorns-#{Date.today.to_s}.csv" }
    end
  end

  private

  def no_params_on_page_load?
    params[:search].blank? && params[:fields].blank? && params[:agency].blank?
  end

  def search_and_agency_blank?
    params[:search].blank? && params[:agency].blank?
  end

  def search_present_and_agency_blank?
    params[:search].present? && params[:agency].blank?
  end

  def search_blank_and_agency_present?
    params[:search].blank? && params[:agency].present?
  end

  def search_and_fields_and_agency_present?
    params[:search].present? && params[:fields].present? && params[:agency].present?
  end
end
