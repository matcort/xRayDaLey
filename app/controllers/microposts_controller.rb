class MicropostsController < ApplicationController
     def create
    @micropost = Micropost.new(micropost_params)    
    if @micropost.save
      #log_in @adm
      
       redirect_to contacto_path
    else
      render 'new'
    end
  end
  
  private

    def micropost_params
      params.require(:micropost).permit(:nombre, :content, :num)
    end
  
  
end
