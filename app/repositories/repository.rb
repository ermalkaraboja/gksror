module Repository
  attr_accessor :adapter

  def all
    @adapter.all
  end

  def find(id)
    @adapter.find(id)
  end

  def new_entity(attrs = nil)
    @adapter.new(attrs)
  end

  def save(model)
    if model.errors.any?
      return false
    end

    if model.id.nil?
      @adapter.save! model
    else
      @adapter.update! model
    end

    true
  end

  def delete(model)
    @adapter.destroy! model unless model.id.nil?
  end

end