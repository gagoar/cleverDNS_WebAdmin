class Domain < ActiveRecord::Base
  has_many :records

  cattr_reader :per_page
  @@per_page = 10

  validates_presence_of :name,  :message => "Nombre se encuentra vacio"
  validates_presence_of :ttl, :message => "se encuentra vacio"
  validates_numericality_of :ttl , :only_integer => true, :greater_than_or_equal_to => 150, :less_than => 60000
  validates_uniqueness_of :name,  :message => "Este dominio ya existe"
  accepts_nested_attributes_for :records, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

end
