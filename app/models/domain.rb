class Domain < ActiveRecord::Base
  has_many :records

  cattr_reader :per_page
  @@per_page = 10

  validates_presence_of :name,  :message => "Nombre se encuentra vacio"
  validates_presence_of :ttl, :message => "se encuentra vacio"
  # 2 horas max | 1 min minimum
  validates_format_of :name,  :with => /^\w/ , :message => "comienza con un caracter invalido"
  validates_numericality_of :ttl , :only_integer => true, :greater_than_or_equal_to => 60, :less_than_or_equal_to => 7200, :message => "El valor debe estar comprendido entre 60 y 7200 inclusive"
  validates_uniqueness_of :name,  :message => "Este dominio ya existe"
  accepts_nested_attributes_for :records, :reject_if => proc { |attrs| attrs['address'].blank? }
  accepts_nested_attributes_for :records, :reject_if => proc { |attrs| attrs['acl'].blank? }
  #accepts_nested_attributes_for :records, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
