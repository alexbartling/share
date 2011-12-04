class HomeController < ApplicationController
  def index  
      if user_signed_in?  
        @packets = current_user.packets.order("uploaded_file_file_name desc")        
      end  
  end
end
