class Admin < User

  def to_s
    name
  end

  def type_name
    "Admin"
  end

end
