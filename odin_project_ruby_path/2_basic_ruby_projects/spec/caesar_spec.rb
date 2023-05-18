# spec/caesar_spec.rb
# tests made by rimoser99
require 'spec_helper'
require_relative '../caesar_cipher.rb'

RSpec.describe 'CaesarCipher Tests' do
  describe 'Testing' do
    it 'works with small positive shift' do
      expect(translate('Zz', 5)).to eql('Ee')
    end

    it 'works with small negative shift' do
      expect(translate('Ee', -5)).to eql('Zz')
    end

    it 'works with large positive shift' do
      expect(translate('Zz', 83)).to eql('Ee')
    end

    it 'works with large negative shift' do
      expect(translate('Ee', -83)).to eql('Zz')
    end

    it 'works with a phrase with punctuation' do
      expect(translate('What a string!', 5)).to eql('Bmfy f xywnsl!')
    end

    it 'works with a phrase with a large shift' do
      expect(translate('Hello, World!', 75)).to eql('Ebiil, Tloia!')
    end

    it 'works with a phrase with a large negative shift' do
      expect(translate('Hello, World!', -55)).to eql('Ebiil, Tloia!')
    end
  end
end