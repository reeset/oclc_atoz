class DatabaseController < ApplicationController
   layout "database"
   def list
      if params[:q] != nil
         @qterm = params[:q] + "%"
      else
         @qterm = "%"
      end
      client = WCKBAPI::Client.new(:wskey => Rails.configuration.wskey)

      @objc = client.SearchCollections(:institution_id => Rails.configuration.institution_id, :title => @qterm, :itemsPerPage => '100')     
   end
end
