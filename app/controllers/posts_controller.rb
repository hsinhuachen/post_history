class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.friendly.find(params[:id]) 
		#@versions = PaperTrail::Version.order("id DESC").page(params[:page])
		@versions = @post.versions
	end

	def undo
	  @version = PaperTrail::Version.find(params[:version_id])
	  @version.reify.save!
	  redirect_to admin_versions_path
	end

end
