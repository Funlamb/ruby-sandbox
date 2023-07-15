# require "rspec/autorun"
require "./lib/caeser_cipher.rb"

describe Caeser_cipher do
    subject {Caeser_cipher.new}
    describe "Translate" do 
        it "cipher small shifts" do
            expect(subject.cipher("Hello", 5)).to eql("Cyggj")
        end
        it "cipher all caps" do
            expect(subject.cipher("HELLO", 5)).to eql("CYGGJ")
        end
        it "cipher large shifts" do
            expect(subject.cipher("Hello", 65)).to eql("Rovvy")
        end
        it 'works with a phrase with a large shift' do
            expect(subject.cipher("Hello, World!", 78)).to eql("Ebiil, Tloia!")
        end
        it "work a lot" do
            expect(subject.cipher("What a string!", -5)).to eql("Cmfy f xywnsl!")
        end
    end
end