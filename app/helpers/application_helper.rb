module ApplicationHelper
  
  def logo
    logo = image_tag("CTG_logo_text.gif", alt: "Sample App")
  end

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title ="Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def a_spurious_helper_method
    it_doesnt_matter_what_this_variable_is = "This is completely useless text, 
    supplied by the application helper. The a_spurious_helper_method method 
    simply returns the value of the last variable it sets"
    # magic_number = 3
  end
end
