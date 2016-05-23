module ApplicationHelper
	def full_title(pagetitle='')
		basetitle = "Ruby on Rails Tutorial Sample App"
		if pagetitle.empty?
			basetitle
		else
			pagetitle + " | " + basetitle
		end
		
	end
end
