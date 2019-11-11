class Admin::PhotosController < AdminController
    protect_from_forgery with: :null_session
    
    def upload_image
        @photo = Photo.new
        @photo.image_type = 1
        @photo.news_id = params[:news_id]
        @photo.image = params[:upload]
        @photo.save!
        @re_photo = Photo.find(@photo.id)
        msg = { 
            :uploaded => 1, 
            :url => @re_photo.image.url
        }
        render :json => msg.to_json
    end

    def sort_image 
        begin
            Photo.find(params[:ids]).each_with_index do |photo,index|
                photo.update(sort: index)
            end
            render :json => { :message => "update success"}
        rescue => ex
            render :json => { :message => ex.message}
        end
    end
    
    def destroy
        begin
            @photo = Photo.find(params[:id]).destroy
            flash[:success] = 'Xoá ảnh thành công'
            redirect_back fallback_location: root_path
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

end