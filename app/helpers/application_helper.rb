module ApplicationHelper

    def form_errors(form_obj, attribute = nil)
        attribute == nil ? form_obj.errors.full_messages : form_obj.errors.full_messages_for(attribute).first
    end

end
