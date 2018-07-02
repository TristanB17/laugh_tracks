RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end
    end
  end
  describe 'Calculations' do
    it 'returns the average age of all comedians' do
      comic_1 = Comedian.create(name: 'Hannibal Buress', age: 40)
      comic_2 = Comedian.create(name: 'Mike Birbiglia', age: 20)
      result = Comedian.average_age.to_f

      expect(result).to eq(30.0)
    end
  end
end
