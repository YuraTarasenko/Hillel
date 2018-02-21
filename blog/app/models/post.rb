class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  def text
    case I18n.locale
    when :en
      text_en
    when :ru
      text_ru
    when :ua
      text_ua
    end
  end
end
