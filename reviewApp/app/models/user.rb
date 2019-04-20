class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  has_one :profile, dependent: :destroy
  has_many :reviews, dependent: :destroy




  def send_password_reset
    
    self.reset_digest = generate_token(:reset_digest)
    self.reset_sent_at = Time.zone.now
    save!
  	UserMailer.send_password_reset(self).deliver_later(wait: 1.second)
  	sleep 1
  end


##
def generate_token(column)
	begin
		self[column] = SecureRandom.urlsafe_base64
	end while  User.exists?(column => self[column])
end

def password_reset_expired?
  reset_sent_at < 2.hours.ago
end
##
end
