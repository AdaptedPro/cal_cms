class SectionEdit < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :editor, :class_name => "AuthUser", :foreign_key => "auth_users_id"
  belongs_to :SectionEdit

end
