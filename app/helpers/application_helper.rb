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


  def write_table_for(models, title)
    models = Array.wrap(models)

    capture_haml do
      haml_tag :h1, title
      haml_tag :div, :class => "table-responsive"
      haml_tag :table, :class => "table table-bordered table-hover table-striped" do
        haml_tag :thead do
          haml_tag :tr do
            models.first.attributes.keys.each do |attribute|
              haml_tag :th, attribute.capitalize
            end
          end
        end

        haml_tag :tbody do
          models.each {|model|
            haml_tag :tr
            model.attributes.values.each {|value|
              haml_tag :td, value
            }
          }
        end
      end
      #TODO add actions
    end
  end

end
