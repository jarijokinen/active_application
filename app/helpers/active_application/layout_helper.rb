module ActiveApplication
  module LayoutHelper
    def layout_flash
      html = Array.new
      flash.each do |key, msg|
        case key.to_s
        when "alert"
          flash_class = "alert-error"
        when "notice"
          flash_class = "alert-info"
        else
          flash_class = key.to_s
        end
        close_button = 
          '<button type="button" class="close" data-dismiss="alert">&times;</a>'
        html << content_tag(:div,
          close_button.html_safe + ' ' + msg.html_safe,
          class: ["alert", flash_class, "fade", "in"]
        )
      end
      html.join.html_safe
    end

    def layout_title
      (@title.blank? ? "" : "#{@title} | ") + application_name
    end

    def layout_page_header
      unless @title.blank?
        content_tag(:div, content_tag(:h1, @title), class: "page-header")
      end
    end
  end
end
