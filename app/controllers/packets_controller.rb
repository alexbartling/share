class PacketsController < ApplicationController
  def index
    @packets = current_user.packets.all
  end

  def show
    @packet = current_user.packets.find(params[:id])
  end

  def new
    @packet = Packet.new
  end

  def create
    @packet = current_user.packets.new(params[:packet])
    if @packet.save
      redirect_to @packet, :notice => "Successfully created packet."
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
    @packet.destroy
    redirect_to packets_url, :notice => "Successfully destroyed packet."
  end
  #this action will let the users download the files (after a simple authorization check)  
  def get  
  packet = current_user.packets.find_by_id(params[:id])  
  if packet 
       send_file packet.uploaded_file.path, :type => packet.uploaded_file_content_type  
  end  
end
end
