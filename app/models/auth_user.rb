class AuthUser < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :displayname #:title, :body

  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :section, :through => :section_edits

  scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
end
