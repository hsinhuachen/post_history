module CustomTrestleHelper
	def custom_helper(options)
		content_tag(:div, class: "panel panel-primary") do
			concat(content_tag(:div, class: "panel-heading") { "編輯紀錄" })
		    concat(content_tag(:div, class: "panel-body") { 
		    	concat(content_tag(:table, class: "") { yield })
		    })
		end
	end
end