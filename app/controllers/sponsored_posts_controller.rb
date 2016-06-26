class SponsoredPostsController < ApplicationController
    
   def show
     @sponsoredpost = Sponsoredpost.find(params[:id])
   end
 
   def new
     @sponsoredpost = Sponsoredpost.new
   end  
   
   def edit
     @sponsoredpost = Sponsoredpost.find(params[:id])
   end
    
    
end
