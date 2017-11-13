class MenuItem
  attr_accessor :description, :path, :icon, :children

  def initialize (description, path, icon, children = [])
    self.description = description
    self.path = path
    self.icon = icon
    self.children = children
  end
end