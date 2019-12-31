class Post < ApplicationRecord
	extend FriendlyId
  	friendly_id :title, use: :slugged
  	has_paper_trail


  	def normalize_friendly_id(input)
	    input.to_s.to_slug.normalize.to_s
	end

	def should_generate_new_friendly_id?
	    slug.blank? || id_changed?
	end

  	def slug_candidates
    	[ :id, [:id, :title]]
  	end
end

