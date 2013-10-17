ActiveAdmin.register Code do
	before_filter :only => [:show, :edit, :update, :destroy] do
        @code = Code.find(params[:id])
		redirect_to_good_slug(@code) and return if bad_slug?(@code)
      end
      index do
	    column :name
	    column "Release Date", :created_at
	    column :tag_list
	    default_actions
	  end
	# form do |f|
	# 	f.inputs "Details", :multipart => true do
	# 		f.input :name
	# 		f.input :slug
	# 		f.input :preview
	# 		f.input :body
	# 		f.input :tag_list
	# 	end
	# 	f.actions
	# end
	form :partial => "form"
  controller do
    def permitted_params
      params.permit!
    end
  end
end