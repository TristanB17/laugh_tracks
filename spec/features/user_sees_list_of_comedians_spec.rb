RSpec.describe 'a visitor' do
  context 'visiting /comedians' do
    it "sees a list of comedians' names" do
      Comedian.create(name: 'Hannibal Buress', age: 39)
      Comedian.create(name: 'Mike Birbiglia', age: 39)

      visit '/comedians'

      expect(page).to have_content('Hannibal Buress')
      expect(page).to have_content('Mike Birbiglia')
    end
    it "sees a list of comedians' corresponding ages" do
      Comedian.create(name: 'Hannibal Buress', age: 39)

      visit '/comedians'

      expect(page).to have_content('39')
    end
    it 'sees a list of comedian specials under each comedian' do
      hannibal = Comedian.create(name: 'Hannibal Buress', age: 39)
      Special.create(name: "Hannibal Takes Edinburgh", comedian_id: hannibal.id)

      visit '/comedians'
      expect(page).to have_content('Hannibal Takes Edinburgh')
    end
  end
end
