module ApplicationHelper


	def logo
  logo = image_tag("logo.png", :alt => "Sample App", :class => "round") 
 	 end




	def title 
		base_title="Ruby On Rails Tutorial Simple App"
		if @title.nil?
			base_title
		else
			"#{base_title}|#{@title}"
		end	
	end	
end
