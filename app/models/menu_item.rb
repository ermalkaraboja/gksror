class MenuItem
  attr_accessor :description, :path, :icon

  def initialize (description, path, icon)
    self.description = description
    self.path = path
    self.icon = icon
  end
end