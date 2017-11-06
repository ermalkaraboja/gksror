module ApplicationHelper
  def menu
    model = {:title => 'test title'}
    render :partial => 'layouts/content', :object => model
  end
end
