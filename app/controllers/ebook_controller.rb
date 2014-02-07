class EbookController < ApplicationController
   layout 'ebook'
   def list
      @startIndex = 1
      @mycontroller = 'ebook'
      if params[:startIndex] != nil
	 @startIndex = params[:startIndex]
      end 

      if params[:q] != nil
         if params[:q].index('%') == nil
            @qterm = params[:q] + "%"
         else
	    @qterm = params[:q]
	 end
         
         client = WCKBAPI::Client.new(:wskey => Rails.configuration.wskey)
         @objR, @objc = client.SearchEntries(:institution_id => Rails.configuration.institution_id, :title => @qterm, :itemsPerPage => Rails.configuration.items_per_page, :startIndex => @startIndex, :content => 'ebooks')     
      end
   end
end
