require 'openai'

class User < ApplicationRecord
  after_create :generate_partner_proposal

  private

  def generate_partner_proposal
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo-16k",
        messages: [
          { role: 'system', content: "Based on the birthday #{self.birthday}, describe the destiny partner.lang: ja" }
        ]
      }
    )
  
    puts "OpenAI API Response: #{response.inspect}" # レスポンスをログに出力
  
    if response['choices'].present?
      self.partner_proposal = response['choices'].first['message']['content'].strip
      self.save
    else
      puts "No choices in the response from OpenAI API"
    end
  end
end
