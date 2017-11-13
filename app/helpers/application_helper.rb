module ApplicationHelper
  def menu
    model = {:title => 'test title'}
    render :partial => 'layouts/content', :object => model
  end

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end
end
