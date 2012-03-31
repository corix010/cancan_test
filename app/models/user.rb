class User < ActiveRecord::Base
  ROLES = ["admin", "user"]

  attr_accessible :roles, :email, :name

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end
  def is?(role)
    roles.include?(role.to_s)
  end
end
