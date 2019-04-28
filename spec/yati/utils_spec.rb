RSpec.describe Yati::Utils do
  describe '.flat_translation_hash' do
    it 'flattens the translation hash correctly' do
      data = { hello: { world: 'mundo', friend: { test: 'amigo' }}}
      result = described_class.flat_translation_hash(data)

      expect(result.size).to eq(2)
      expect(result.keys.sort).to eq(['hello.friend.test', 'hello.world'])
      expect(result.values.sort).to eq(['amigo', 'mundo'])
    end
  end
end
