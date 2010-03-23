class Record < ActiveRecord::Base
  belongs_to :domain
  
  validates_presence_of :address ,  :message => "direccion se encuentra vacio"
  validates_presence_of :acl ,  :message => "direccion se encuentra vacio"
  validates_uniqueness_of :acl, :scope => :domain_id , :message => " Permiso es invalido"
  validates_format_of :address, :with => /^([12]{0,1}[0-9]{0,1}[0-9]{1}\.){3}[12]{0,1}[0-9]{0,1}[0-9]{1}$/, :allow_blank => false, :message => "direccion es invalido"
  validates_format_of :acl, :with => /^([12]{0,1}[0-9]{0,1}[0-9]{1}\.){3}[12]{0,1}[0-9]{0,1}[0-9]{1}(\/[123]{0,1}[0-9]{1}){1}$/, :allow_blank => true, :message => "Permiso es invalido"

end
