module ApplicationHelper

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def write_validation_errors_for(model)
    write_errors_for model if model.errors.any?
  end

  private
  def write_errors_for(model)
    capture_haml do
      haml_tag :div, :class => 'alert alert-danger' do
        haml_tag :h2, pluralize(model.errors.count, " error") + " prohibited this #{model.class} from being saved:"
        haml_tag :ul do
          model.errors.full_messages.each do |message|
            haml_tag :li, message
          end
        end
      end
    end
  end

end