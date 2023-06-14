class Love < ApplicationRecord
  before_save :create_partner_info_from_user_info

  private

  def create_partner_info_from_user_info
    self.ideal_partner = OpenAi.generate_partner_info(self.personality, self.occupation, self.favorite_food, self.birthday, self.background)
  end
end
