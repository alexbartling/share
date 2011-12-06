class PacketsController < ApplicationController
  def index
    @packets = current_user.packets.all
  end

  def show
    @packet = current_user.packets.find(params[:id])
  end

  def new  
    @packet = current_user.packets.build      
    if params[:folder_id] #if we want to upload a file inside another folder  
     @current_folder = current_user.folders.find(params[:folder_id])  
     @packet.folder_id = @current_folder.id  
    end      
  end

  def create  

    @packet = current_user.packets.build(params[:packet])  
    if @packet.save  
     flash[:notice] = "Successfully uploaded the file."  

     if @packet.folder #checking if we have a parent folder for this file  
       redirect_to browse_path(@packet.folder)  #then we redirect to the parent folder  
     else  
       redirect_to root_url  
     end        
    else  
     render :action => 'new'  
    end  
  end  


  def edit
    @packet = current_user.packets.find(params[:id])
  end

  def update
    @packet = current_user.packets.find(params[:id])
    if @packet.update_attributes(params[:packet])
      redirect_to @packet, :notice  => "Successfully updated packet."
    else
      render :action => 'edit'
    end
  end

  def destroy  
    @packet = current_user.packets.find(params[:id])  
    @parent_folder = @packet.folder #grabbing the parent folder before deleting the record  
    @packet.destroy  
    flash[:notice] = "Successfully deleted the file."  

    #redirect to a relevant path depending on the parent folder  
    if @parent_folder  
     redirect_to browse_path(@parent_folder)  
    else  
     redirect_to root_url  
    end  
  end
end
