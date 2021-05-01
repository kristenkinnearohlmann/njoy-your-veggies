module ApplicationHelper

    def form_errors(form_obj)
        form_obj.errors.full_messages
    end

end
