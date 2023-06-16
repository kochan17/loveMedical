require 'openai'

class OpenAi
  def self.generate_partner_info(personality, occupation, favorite_food, birthday, background)
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: 'gpt-3.5-turbo',
        messages: [
          { role: 'user', content: "あなたはマッチングAIです。提供されたユーザープロファイルに基づいて、'算命学'や'タロット占い'のロジック、恋愛心理学の理論を通して、その理想的なパートナーの説明を生成してください。ユーザーの性格は#{personality}で、職業は#{occupation}、好きな食べ物は#{favorite_food}、誕生日は#{birthday}、経歴は#{background}です。" }
        ]
      }
    )
    puts response
    response.dig('choices', 0, 'message', 'content')
  end
end
