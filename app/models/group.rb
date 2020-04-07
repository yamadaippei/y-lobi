class Group < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def show_last_message
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージがありません'
    end
  end
end
