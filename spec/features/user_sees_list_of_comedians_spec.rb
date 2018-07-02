RSpec.describe 'a visitor' do
  context 'visiting /comedians' do
    it "sees a list of comedians' names" do
      comic_1 = Comedian.create(name: 'Hannibal Buress', age: 39)
      comic_2 = Comedian.create(name: 'Mike Birbiglia', age: 39)

      visit '/comedians'

      expect(page).to have_content(comic_1.name)
      expect(page).to have_content(comic_2.name)
    end
    it "sees a list of comedians' corresponding ages" do
      comedian = Comedian.create(name: 'Hannibal Buress', age: 39)

      visit '/comedians'

      expect(page).to have_content(comedian.age)
    end
    it 'sees a list of comedian specials under each comedian' do
      hannibal = Comedian.create(name: 'Hannibal Buress', age: 39)
      special = Special.create(name: "Hannibal Takes Edinburgh", comedian_id: hannibal.id)

      visit '/comedians'

      expect(page).to have_content(special.name)
    end
    it 'sees the average age of all comedians' do
      comic_1 = Comedian.create(name: 'Hannibal Buress', age: 40)
      comic_2 = Comedian.create(name: 'Mike Birbiglia', age: 20)

      visit '/comedians'

      comics = Comedian.all
      added = comics.reduce(0) do |all, comic|
        all + comic.age
        all
      end

      average = (added.to_f / Comedian.all.count.to_f).to_f


      expect(page).to have_content(average)
    end
    it 'sees the total count of specials for a comedian' do
      comic = Comedian.create(name: 'Hannibal Buress', age: 40)
      special = Special.create(name: "Hannibal Takes Edinburgh", comedian_id: comic.id)
      special = Special.create(name: "Hannibal Takes Manhattan with Muppets", comedian_id: comic.id)

      visit '/comedians'

      expect(page).to have_content(comic.specials.count)
    end
  end
end
