class DatabaseController < ApplicationController
   layout 'database'
   def list
      @startIndex = 1
      @mycontroller = "database"
      if params[:startIndex] != nil
         @startIndex = params[:startIndex]
      end 

      if params[:q] != nil
         @qterm = params[:q] + "%"
      else
         @qterm = "%"
      end
      client = WCKBAPI::Client.new(:wskey => Rails.configuration.wskey)

      @objR, @objc = client.SearchCollections(:institution_id => Rails.configuration.institution_id, :title => @qterm, :itemsPerPage => Rails.configuration.items_per_page, :startIndex => @startIndex)     
   end
end
