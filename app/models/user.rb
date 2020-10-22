class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i                                                      # 大文字・小文字の区別をなくす記述
    # validates :email, format: { with: VALID_EMAIL_REGEX, message: "is invalid. Include @ character" }, uniqueness: { case_sensitive: false }
       

  with_options presence: true do
    validates :nickname         
    validates :last_name,        format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :first_name,       format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :last_name_kana,   format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."} 
    validates :first_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :birth_date      
  end
end
