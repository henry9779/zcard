class User < ApplicationRecord

  validates :email, presence: true,
            uniqueness: true,
            format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/ }

  validates :password, presence: true,
            confirmation: true,
            length: { minimum: 4 }
            
  validates :nickname, presence: true

  before_create :encrypt_password

  def self.login(u)
    pw = Digest::SHA1.hexdigest("r#{u[:password]}b")
    User.find_by(email: u[:email],
                        password: pw)
  end

  private
  def encrypt_password #加密
    self.password = Digest::SHA1.hexdigest("r#{self.password}b") #灑鹽
  end

end
