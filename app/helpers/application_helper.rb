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


  def write_table_for(title: nil, source: nil, config_hash: nil)
    source = Array.wrap(source)
    capture_haml do
      haml_tag :h1, title.nil? ? source.first.class.to_s.capitalize.pluralize : title
      haml_tag :div, :class => "table-responsive"
      haml_tag :table, :class => "table table-bordered table-hover table-striped" do
        haml_tag :thead do
          haml_tag :tr do
            source.first.attributes.keys.each do |attribute|
              haml_tag :th, attribute.capitalize
            end
            haml_tag(:th, 'Actions', colspan: actions(config_hash).count) unless config_hash.nil? || actions(config_hash).empty?
          end
        end

        haml_tag :tbody do
          source.each {|model|
            haml_tag :tr
            model.attributes.values.each {|value|
              haml_tag :td, value
            }
            actions(config_hash).each do |allowed_action|
              haml_tag :td, action(allowed_action, model)
            end unless config_hash.nil?
          }
        end
      end
      #TODO add actions
    end
  end

  private
  def actions(hash)
    hash.select {|key, value| has_rights(value)}.keys.map {|item| item.to_s}
  end

  private
  def action(action_name, model)
    case action_name.to_s
      when 'show'
        link_to ' Show', model, class: 'fa fa-eye btn btn-default'
      when 'edit'
        link_to ' Edit', send("edit_#{model.class.to_s.downcase}_path", model), class: 'fa fa-pencil btn btn-default'
      when 'destroy'
        link_to ' Delete', model, method: :delete, data: {confirm: 'Are you sure?'}, class: 'fa fa-trash btn btn-default'
    end
  end
end

