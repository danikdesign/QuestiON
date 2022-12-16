class Question < ApplicationRecord

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
