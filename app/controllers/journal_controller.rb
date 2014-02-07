class JournalController < ApplicationController
   layout 'database'
   def list
      @startIndex = 1
      @mycontroller = 'journal'
      if params[:startIndex] != nil
	 @startIndex = params[:startIndex]
      end 

      if params[:q] != nil
         if params[:q].index('%') == nil
            @qterm = params[:q] + "%" 
	 else
	    @qterm = params[:q]
         end
      else
         @qterm = '%' 
      end
      client = WCKBAPI::Client.new(:wskey => Rails.configuration.wskey)
      @objR, @objc = client.SearchEntries(:institution_id => Rails.configuration.institution_id, :title => @qterm, :itemsPerPage => Rails.configuration.items_per_page, :startIndex => @startIndex, :content => 'abstracts,fulltext,selectedft')     
   end
end
