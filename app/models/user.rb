require 'openai'

class User < ApplicationRecord
  after_create :generate_partner_proposal

  private

  def generate_partner_proposal
    OpenAI.api_key = ENV['OPENAI_API_KEY']

    response = OpenAI::Completion.create(
      engine: "gpt-3.5-turbo",
      prompt: "Based on the birthday #{self.birthday}, describe the destiny partner.",
      max_tokens: 100
    )

    self.partner_proposal = response.choices.first.text.strip
    self.save
  end
end
