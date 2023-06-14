class OpenAi
  require 'openai'

  def self.generate_partner_info(personality, occupation, favorite_food, birthday, background)
    client = OpenAI::Client.new
    response = client.chat(
      model: 'gpt-3.5-turbo',
      messages: [
        {
          role: 'system',
          content: 'あなたはマッチングAIです。提供されたユーザープロファイルに基づいて、その理想的なパートナーの説明を生成してください。'
        },
        {
          role: 'user',
          content: "ユーザーの性格は#{personality}で、職業は#{occupation}、好きな食べ物は#{favorite_food}、誕生日は#{birthday}、経歴は#{background}です。"
        }
      ]
    )
    response['choices'][0]['message']['content']
  end
end