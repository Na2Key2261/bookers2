class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :user
  
  def get_profile_image(width, height)
    # プロフィール画像のパスやURLを取得するロジックを実装
     user.get_profile_image(100,100)
  end
end
