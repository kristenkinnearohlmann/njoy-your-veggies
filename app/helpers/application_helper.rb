module ApplicationHelper

    def form_errors(form_obj, attribute = nil)
        attribute == nil ? form_obj.errors.full_messages : form_obj.errors.full_messages_for(attribute).first
    end

    def page_header(subtitle)
        content_tag(:h2, subtitle, class: "content-header")
    end

end
