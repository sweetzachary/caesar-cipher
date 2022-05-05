require './caesar_cipher'

describe CaesarCipher do
  subject { CaesarCipher.new }
  describe '#use' do
    it 'shifts a word forwards' do
      expect(subject.use('Dog', 5)).to eql('Itl')
    end

    it 'shifts numbers forwards' do
      expect(subject.use('Dog123', 1)).to eql('Eph234')
    end

    it "doesn't affect punctuation" do
      expect(subject.use('app, 1', 1)).to eql('bqq, 2')
    end

    it 'wraps around forwards' do
      expect(subject.use('zoo', 1)).to eql('app')
    end
  end
end
