class MenuItem
  attr_accessor :description, :path, :icon, :children, :roles

  def initialize (description, path, icon, roles = [], children = [])
    self.description = description
    self.path = path
    self.icon = icon
    self.roles = roles
    self.children = children
  end
end