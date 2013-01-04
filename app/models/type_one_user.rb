class TypeOneUser < User

  validates_presence_of :rg, :birthdate
  validates :cpf, :presence => true, :cpf => true

  def to_s
    name
  end

  def type_name
    "Tipo 1"
  end

end

