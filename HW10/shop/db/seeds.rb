# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Category.create(title: 'Indie rock')
Category.create(title: 'Rock')
Category.create(title: 'Electronic')
Category.create(title: 'New wave')
Category.create(title: 'Rock and roll')
Category.create(title: 'Soundtrack')

Product.create(name: 'Arctic Monkeys - AM',
               description: 'TrackList: 1. Do I Wanna Know? 2. R U Mine? 3. One for the Road 4. Arabella 5. I Want It All 6. No. 1 Party Anthem 7. Mad Sounds 8. Fireside 9. Why\'d You Only Call Me When You\'re High 10. Snap Out of It 11. Knee Socks 12. I Wanna Be Yours',
               image: "https://images.prom.ua/3786921637_arctic-monkeys-.jpg",
               price: 1000.00,
               category_id: 1)
Product.create(name: 'Pink Floyd - Dark Side Of The Moon (remastered)',
               description: 'TrackList: A1. Speak to Me A2. Breathe in the Air A3. On the Run A4. Time A5. The Great Gig in the Sky B1. Money B2. Us and Them B3. Any Colour You Like B4. Brain Damage B5. Eclipse',
               image: "https://vinylrecords.com.ua/image/cache/catalog/29/5099902987613-1000x1000.jpg",
               price: 1500.00,
               category_id: 2)
Product.create(name: 'Nirvana - Nevermind (30th Anniversary Edition)',
               description: 'TrackList:
               A1. Smells Like Teen Spirit A2. In Bloom A3. Come As You Are A4. Breed A5. Lithium A6. Polly B1. Territorial Pissing B2. Drain You B3. Lounge Act B4. Stay Away B5. On A Plain B6. Something In The Way 7" A1. Endless, Nameless B1. Even In His Youth B2. Aneurysm',
               image: "https://vinylrecords.com.ua/image/cache/catalog/49/R-20914213-1636728396-2123.jpeg-1000x1000.jpg",
               price: 1900.00,
               category_id: 2)
Product.create(name: 'Massive Attack - Mezzanine',
               description: 'TrackList: 1. Angel 2. Risingson 3. Teardrop 4. Inertia Creeps 5. Exchange 6. Dissolved Girl 7. Disc 2 8. Man Next Door 9. Black Milk 10. Mezzanine 11. Group Four',
               image: "https://vinylrecords.com.ua/image/cache/catalog/covers_4/mezzanine-1000x1000.jpg",
               price: 1840.00,
               category_id: 3)
Product.create(name: 'Chemical Brothers - Surender',
               description: 'TrackList: 1. Response 2. Under the Influence 3. Out of Control 4. Orange Wedge 5. Let Forever Be 6. The Sunshine Underground 7. Asleep from Day 8. Got Glint? 9. Hey Boy Hey Girl 10. Surrender or Racing The Tide 11. Dream On',
               image: "https://vinylrecords.com.ua/image/cache/catalog/covers_4/20091021162000!Surrender_album_cover-1000x1000.jpg",
               price: 850.00,
               category_id: 3)
Product.create(name: 'Joy Division - Unknown Pleasures',
               description: 'TrackList: 1. Disorder 2. Day of the Lords 3. Candidate 4. Insight 5. New Dawn Fades 7. She\’s Lost Control 8. Shadowplay 9. Wilderness 10. Interzone 11. I Remember Nothing',
               image: "https://vinylrecords.com.ua/image/cache/catalog/51/joy-division-unknown-pleasures_2.800x800-1000x1000.png",
               price: 1100.00,
               category_id: 4)
Product.create(name: 'Elvis Presley – Playlist: The Very Best ',
               description: 'TrackList: 1. Love Me Tender 2. Loving You 3. Got A Lot O\' Livin\' To Do 4. Jailhouse Rock 5. (You\'re So Square) Baby I Don\'t Care 6. Trouble 7. Frankfort Special 8. Follow That Dream 9. Can\'t Help Falling In Love 10. I Need Somebody To Lean On 11. Viva Las Vegas 12. Bossa Nova Baby 13. Return To Sender 14. Clean Up Your Own Backyard',
               image: "https://vinylrecords.com.ua/image/cache/catalog/123%20vinyl%201/R-15145053-1587256191-3306-1000x1000.jpg",
               price: 590.00,
               category_id: 5)
Product.create(name: 'Pulp Fiction - Original Soundtrack',
               description: 'TrackList: 1. Misirlou 2. Royale With Cheese 3. Jungle Boogie 4. Let\'s Stay Together 5. Bustin\' Surfboards 6. Lonesome Town 7. Son Of A Preacher Man 8. Bullwinkle Part II 09. You Never Can Tell 0. Girl, You\'ll Be A Woman Soon 11. If Love Is A Red Dress (Hang Me In Rags) 12. Comanche 13. Flowers On The Wall 14. Personality Goes A Long Way 15. Surf Rider 16. Ezekiel',
               image: "https://vinylrecords.com.ua/image/cache/catalog/49/61SDYP3PfVL._AC_-1000x1000.jpg",
               price: 1300.00,
               category_id: 6)
               
User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
