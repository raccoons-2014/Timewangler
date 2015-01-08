## ---------------------------------
## CLASSICAL (10 heroes)
## ---------------------------------

TimePeriod.create(name: "Classical Period")

Card.create(card_type: "Hero", name: "Cleopatra", description: "Last active pharaoh of Ancient Egypt.", strength: 4, intelligence: 5, charisma: 8, picture_url: "http://jerryandgod.files.wordpress.com/2013/12/807-e.jpg?w=186&h=186", effect_description: "Poison (set S,I,C=0 rand your hand).", effect_dsl: '[player] (hand>rand) |strength, intelligence, charisma| {=0}')

Card.create(card_type: "Hero", name: "Mark Antony", description: "Transformed the Roman Republic from an oligarchy into the autocratic Roman Empire.", strength: 5, intelligence: 8, charisma: 7, picture_url: "http://media-2.web.britannica.com/eb-media/21/13421-004-A2A61DF4.jpg")

Card.create(card_type: "Hero", name: "Julius Caesar", description: "Played a critical role in the events that led to the demise of the Roman Republic and the rise of the Roman Empire.", strength: 4, intelligence: 7, charisma: 6, picture_url: "http://a2.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE4MDAzNDEwNDQxMTExMDU0.jpg")

Card.create(card_type: "Hero", name: "Socrates", description: "A classical Greek philosopher credited as one of the founders of Western philosophy.", strength: 2, intelligence: 6, charisma: 4, picture_url: "https://lh3.googleusercontent.com/-WktFY7Oa-h8/AAAAAAAAAAI/AAAAAAAAAFA/-Y1tLvHV_3g/photo.jpg")

Card.create(card_type: "Hero", name: "Aristotle", description: "A Greek philosopher and scientist.", strength: 2, intelligence: 9, charisma: 5, picture_url: "http://media-2.web.britannica.com/eb-media/84/87984-004-5ADE9ACA.jpg")

Card.create(card_type: "Hero", name: "Plato", description: "Plato was a Greek philosopher, as well as mathematician.", strength: 3, intelligence: 8, charisma: 6, picture_url: "http://media-2.web.britannica.com/eb-media/88/149188-004-E9F3D5B9.jpg")

Card.create(card_type: "Hero", name: "Homer", description: "Epic poet and author of the Iliad and the Odyssey.", strength: 4, intelligence: 9, charisma: 7, picture_url: "http://a4.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE4MDAzNDEwNTU4NjgyNjM4.jpg")

Card.create(card_type: "Hero", name: "Nero", description: "Roman Emperor from 54 to 68.", strength: 6, intelligence: 6, charisma: 8, picture_url: "http://media-3.web.britannica.com/eb-media/42/9842-004-614B0B53.jpg")

Card.create(card_type: "Hero", name: "Saint Augustine", description: "an early Christian theologian and philosopher whose writings influenced the development of Western Christianity and Western philosophy.", strength: 6, intelligence: 6, charisma: 8, picture_url: "http://www.thecommentator.com/system/articles/inner_pictures/000/001/831/commentary_thumb/St-augustine-of-hippo.jpg?1350384846")

Card.create(card_type: "Hero", name: "Marcus Aurelius", description: "Good Roman Emperor from 161 to 180.", strength: 5, intelligence: 9, charisma: 8, picture_url: "https://maitaly.files.wordpress.com/2011/04/marcus_aurelius_bust2.jpg")




## ---------------------------------
## MEDEIVAL (5 Heroes)
## ---------------------------------

TimePeriod.create(name: "Medieval Period")

Card.create(card_type: "Hero", name: "Genghis Khan", description: "Totally ravaged China.", strength: 10, intelligence: 7, charisma: 9, picture_url: "http://a4.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE4MDAzNDEwNTM0NDk5ODU0.jpg", effect_description: "Horde (set S=8 your hand).", effect_dsl: '[player] (hand>all) |strength| {=8}')

Card.create(card_type: "Hero", name: "Joan of Arc", description: "a heroine of France and a Roman Catholic saint.", strength: 7, intelligence: 6, charisma: 5, picture_url: "http://media-1.web.britannica.com/eb-media/92/60892-004-53D4AF1E.jpg")

Card.create(card_type: "Hero", name: "Kublai Khan", description: "The fifth Khagan of the Ikh Mongol Uls, reigning from 1260 to 1294.", strength: 10, intelligence: 9, charisma: 8, picture_url: "http://a1.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTIwNjA4NjMzODc3MTM2OTA4.jpg")

Card.create(card_type: "Hero", name: "Ragnar Lodbrok", description: "A legendary Norse ruler and hero from the Viking Age described in Old Norse poetry and several sagas.", strength: 6, intelligence: 4, charisma: 5, picture_url: "https://38.media.tumblr.com/c71ff86c984db9e8f7fd02556d588c34/tumblr_ne4imhmhmO1s93s9so1_500.jpg")

Card.create(card_type: "Hero", name: "Marco Polo", description: "a Venetian merchant traveller that introduced Europeans to Central Asia and China.", strength: 5, intelligence: 9, charisma: 8, picture_url: "http://a4.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NDg0MDU1MTAxOTk4NjA3.jpg")

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )



## ---------------------------------
## RENAISSANCE (13 Heroes)
## ---------------------------------

TimePeriod.create(name: "Renaissance")

Card.create(card_type: "Hero", name: "William Shakespeare", description: "widely regarded as the greatest writer in the English language and the world's pre-eminent dramatist.", strength: 4, intelligence: 7, charisma: 6, picture_url: "http://a3.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE1ODA0OTcxNzgzMzkwNzMz.jpg")

Card.create(card_type: "Hero", name: "Queen Elizabeth I", description: "short-tempered, sometimes indecisive ruler, who enjoyed more than her share of luck.", strength: 1, intelligence: 4, charisma: 3, picture_url: "http://media-1.web.britannica.com/eb-media/43/8243-004-A45C42CA.jpg", effect_description: "Sovereign (-1 S,I,C their hand).", effect_dsl: '[opponent] (hand>all) |strength, intelligence, charisma| {-1}')

Card.create(card_type: "Hero", name: "Martin Luther", description: "seminal figure of the 16th-century movement in Christianity known later as the Protestant Reformation.", strength: 3, intelligence: 8, charisma: 10, picture_url: "http://a2.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE1ODA0OTcxNzA3MjM3OTAx.jpg")


#####


Card.create(card_type: "Hero", name: "Leonardo Da Vinci", description: "Da Vinci is widely regarded as one of the greatest minds the world has ever produced.", strength: 3, intelligence: 8, charisma: 6, picture_url: "http://a5.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTIwNjA4NjMzNTM4NTEyMzk2.jpg")

Card.create(card_type: "Hero", name: "Michelangelo", description: "Renaissance sculptor, painter and architect. Michelangelo is often thought of as embodying the spirit of the renaissance.", strength: 3, intelligence: 9, charisma: 4, picture_url: "http://static.squarespace.com/static/52d751d4e4b0e26973419d3e/t/53192138e4b01676f1744228/1394155833207/michelangelo-renaissance-master-ana-livingston-fine-artist.jpg")

Card.create(card_type: "Hero", name: "Raphael", description: "One of the three members of the high Renaissance trinity.", strength: 3, intelligence: 9, charisma: 5, picture_url: "http://www.nationalgallery.org.uk/upload/img/raphael-portrait-young-man-NG2510-fm.jpg")

Card.create(card_type: "Hero", name: "Niccolo Machiavelli", description: "was an Italian writer, historian, diplomat and humanist.", strength: 4, intelligence: 6, charisma: 2, picture_url: "http://a5.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NDg0MDU1MDQ5MzA3NjYz.jpg")

Card.create(card_type: "Hero", name: "Thomas More", description: "was an English statesman who wrote an ideal political system, Utopia. ", strength: 4, intelligence: 7, charisma: 5, picture_url: "http://static.guim.co.uk/sys-images/Guardian/About/General/2011/1/12/1294821652638/Portrait-Of-Thomas-More-007.jpg")

Card.create(card_type: "Hero", name: "Nicholas Copernicus", description: "A mathematician and astronomer who formulated a heliocentric view of the universe. ", strength: 4, intelligence: 8, charisma: 6, picture_url: "http://a1.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE1ODA0OTcxNTk1OTU3Nzcz.jpg")

Card.create(card_type: "Hero", name: "Galileo", description: "Galileo revolutionised our understanding of the world supporting the work of Copernicus.", strength: 3, intelligence: 7, charisma: 6, picture_url: "http://media-2.web.britannica.com/eb-media/58/95758-004-BD98B43B.jpg")

Card.create(card_type: "Hero", name: "Johannes Kepler", description: "German scientist who played a key role in the 17th Century scientific revolution.", strength: 3, intelligence: 8, charisma: 3, picture_url: "http://media-2.web.britannica.com/eb-media/57/139557-004-F4E7E357.jpg")

Card.create(card_type: "Hero", name: "Erasmus", description: "Was a Catholic theologian who has also been called the ‘Prince of the humanists’.", strength: 2, intelligence: 9, charisma: 8, picture_url: "http://a1.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NDg0MDU1NDAyNDgxMTY3.jpg")

Card.create(card_type: "Hero", name: "Donatello", description: "An Italian painter and sculptor.", strength: 4, intelligence: 7, charisma: 5, picture_url: "http://a4.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NTU2MzE2NTg5MzYwNjUx.jpg")


## ---------------------------------
## AGE OF ENLIGHTENMENT (1 hero)
## ---------------------------------
TimePeriod.create(name: "Age of Enlightenment")

Card.create(card_type: "Hero", name: "Sir Isaac Newton", description: "an English physicist and mathematician who is widely recognised as one of the most influential scientists of all time and as a key figure in the scientific revolution.", strength: 4, intelligence: 8, charisma: 6, picture_url: "http://upload.wikimedia.org/wikipedia/commons/3/39/GodfreyKneller-IsaacNewton-1689.jpg", effect_description: "Gravity (/2 S their card).", effect_dsl: '[opponent] (selection>all) |strength| {/2}')

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )


## ---------------------------------
## POST ENLIGHTENMENT EUROPE (2 heroes)
## ---------------------------------

TimePeriod.create(name: "Post Enlightenment Europe")

Card.create(card_type: "Hero", name: "Napoleon Bonaparte", description: "Napoleon dominated European affairs for almost two decades while leading France against a series of coalitions in the Napoleonic Wars.", strength: 4, intelligence: 7, charisma: 6, picture_url: "http://i.telegraph.co.uk/multimedia/archive/01761/NapoleonBonaparte_1761636c.jpg")

Card.create(card_type: "Hero", name: "Marie Curie", description: "a Polish and naturalized-French physicist and chemist who conducted pioneering research on radioactivity.", strength: 3, intelligence: 9, charisma: 4, picture_url: "http://a3.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NTU2MzE2MTkzNzE5ODE5.jpg")

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )


## ---------------------------------
## THE NEW WORLD (6 heroes)
## ---------------------------------
TimePeriod.create(name: "The New World")

Card.create(card_type: "Hero", name: "Christopher Columbus", description: "Under the auspices of the Catholic Monarchs of Spain, he completed four voyages across the Atlantic Ocean.", strength: 1, intelligence: 2, charisma: 3, picture_url: "http://a4.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_320,q_80,w_300/MTI1MTQzMTAyMDUzNjg5OTg3.jpg", effect_description: "Discovery (*2 S rand your hand).", effect_dsl: '[player] (hand>rand) |strength| {*2}')

Card.create(card_type: "Hero", name: "George Washington", description: "the first President of the United States", strength: 6, intelligence: 7, charisma: 8, picture_url: "http://static.guim.co.uk/sys-images/Guardian/Pix/pictures/2010/4/18/1271630795169/George-Washington-001.jpg")

Card.create(card_type: "Hero", name: "John Smith", description: "He was knighted for his services to Sigismund Bathory, Prince of Transylvania and his friend Mózes Székely.", strength: 9, intelligence: 6, charisma: 4, picture_url: "http://a4.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTIwNjA4NjMzOTc0MTk1NzI0.jpg", effect_description: "smallpox (/2 S rand your hand)", effect_dsl: '[player] (hand>rand) |strength| {/2}')

Card.create(card_type: "Hero", name: "John Rolfe", description: "One of the early English settlers of North America.", strength: 8, intelligence: 4, charisma: 5, picture_url: "http://a2.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NTU2MzE2MzYxMTY0Mjk5.jpg")

Card.create(card_type: "Hero", name: "Chief Powhatan", description: "was the paramount chief of Tsenacommacah" , strength: 5, intelligence: 6, charisma: 7, picture_url: "http://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Powhatan_john_smith_map.jpg/200px-Powhatan_john_smith_map.jpg")

Card.create(card_type: "Hero", name: "Pocahontas", description: "A Virginia Indian notable for her association with the colonial settlement at Jamestown, Virginia.", strength: 8, intelligence: 7, charisma: 9, picture_url: "http://www.americaslibrary.gov/assets/aa/pocahonta/aa_pocahonta_subj_e.jpg")

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )



## ---------------------------------
## INDUSTRIAL REVOLUTION (8 heroes)
## ---------------------------------
TimePeriod.create(name: "Industrial Revolution")

Card.create(card_type: "Hero", name: "Mark Twain", description: "An American author and humorist.", strength: 2, intelligence: 9, charisma: 8, picture_url: "http://a4.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NDg0MDU1MTUzNTA5OTAz.jpg")

Card.create(card_type: "Hero", name: "Sacagawea", description: "a Lemhi Shoshone woman who accompanied the Lewis and Clark Expedition as an interpreter and guide during their exploration of the Western United States.", strength: 9, intelligence: 9, charisma: 4, picture_url: "http://cdn.history.com/sites/2/2013/12/sacagawea-AB.jpeg")

Card.create(card_type: "Hero", name: "Meriwether Lewis", description: " an American explorer, soldier, and public administrator, best known for his role as the leader of the Lewis and Clark Expedition", strength: 9, intelligence: 8, charisma: 4, picture_url: "http://hd.housedivided.dickinson.edu/files/images/HD_clarkML.jpg", effect_description: "/2 to opponent's C,I,L.", effect_dsl: '[opponent] (hand>all) |charisma, intelligence, strength| {/2}')

Card.create(card_type: "Hero", name: "William Clark", description: "an American explorer, soldier, Indian agent, and territorial governor best known for the Lewis and Clark Expedition.", strength: 9, intelligence: 8, charisma: 3, picture_url: "http://www-tc.pbs.org/weta/thewest/people/images/clark1.jpg")

Card.create(card_type: "Hero", name: "Abraham Lincoln", description: "Was the 16th President of the United States, serving from March 1861 until his assassination in April 1865", strength: 9, intelligence: 10, charisma: 9, picture_url: "http://a4.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTIwNjA4NjMzODg2NTc0MDky.jpg")

Card.create(card_type: "Hero", name: "Friedrich Nietzsche", description: "A German philologist, philosopher, cultural critic, poet and composer.", strength: 3, intelligence: 6, charisma: 5, picture_url: "http://a4.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NTU2MzE2MzMwMTAwMjM1.jpg")

Card.create(card_type: "Hero", name: "Albert Einstein", description: "As a German-born theoretical physicist and philosopher of science.", strength: 2, intelligence: 10, charisma: 8, picture_url: "http://a4.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NDg0MDU0OTU2OTAxOTAz.jpg", effect_description: "Genius (*2 I your hand)", effect_dsl: '[player] (hand>all) |intelligence| {*2}')

Card.create(card_type: "Hero", name: "Henry Ford", description: "Was an American industrialist, the founder of the Ford Motor Company, and sponsor of the development of the assembly line technique of mass production.", strength: 4, intelligence: 9, charisma: 8, picture_url: "http://a1.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NDg0MDU0OTY2NDA0NjIz.jpg")

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )


## ---------------------------------
## CONTEMPORARY (14 heroes)
## ---------------------------------

TimePeriod.create(name: "Contemporary")

Card.create(card_type: "Hero", name: "Amelia Earhart", description: "Was an American aviation pioneer and author.", strength: 7, intelligence: 6, charisma: 5, picture_url: "http://a2.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NTU2MzE2MjA5NDQ4NDU5.jpg")

Card.create(card_type: "Hero", name: "Kanye West", description: "Was an American rapper, songwriter, record producer, director, entrepreneur, and fashion designer, and god.", strength: 10, intelligence: 10, charisma: 10, picture_url: "http://cdn.stereogum.com/files/2010/08/Kanye-West-Power-Remix-1.jpg", effect_description: "Power (set C=0 their hand)", effect_dsl: '[opponent] (hand>all) |charisma| {=0}')

Card.create(card_type: "Hero", name: "Princess Diana", description: "Diana, Princess of Wales, was the first wife of Charles, Prince of Wales, who is the eldest child and heir apparent of Queen Elizabeth II.", strength: 1, intelligence: 5, charisma: 6, picture_url: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xap1/v/t1.0-1/c17.17.215.215/s160x160/935166_491180230935409_693870860_n.jpg?oh=a1e3a35ac4d8f6db140f3cb6de50d9f7&oe=556EA40A&__gda__=1433292600_c67bbd41094737a0de25381aad025c57", effect_description: "Charm (-5 C their hand)", effect_dsl: '[opponent] (hand>all) |charisma| {-5}')

Card.create(card_type: "Hero", name: "Martin Luther King, Jr.", description: "Was an American pastor, activist, humanitarian, and leader in the African-American Civil Rights Movement.", strength: 6, intelligence: 9, charisma: 10, picture_url: "http://a4.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NTU2MzE2MjgwNDg5NDgz.jpg")

Card.create(card_type: "Hero", name: "Malcolm X", description: "Was an African-American Muslim minister and a human rights activist.", strength: 8, intelligence: 9, charisma: 8, picture_url: "http://a5.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NDg0MDU1MDU1ODYxMjYz.jpg")

Card.create(card_type: "Hero", name: "Barack Obama", description: "first African American to hold the office.", strength: 6, intelligence: 10, charisma: 9, picture_url: "http://media.washtimes.com/media/image/2012/05/11/obama__live_c0-291-4518-2924_s326x190.jpg?b8990adc8b75b7a9887122323063b64956339cd9", effect_description: "Hope (+2 C your hand)", effect_dsl: '[player] (hand>all) |charisma| {+2}')

Card.create(card_type: "Hero", name: "Mao Zedong", description: "Commonly referred to as Chairman Mao, was a Chinese Communist revolutionary and the founding father of the People's Republic of China", strength: 1, intelligence: 10, charisma: 15, picture_url: "http://a1.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NDg0MDU1MDYwMjUyMTc1.jpg", effect_description: "Propaganda (-1 I your deck)", effect_dsl: '[player] (deck>all) |intelligence| {-1}')

Card.create(card_type: "Hero", name: "Nelson Mandela", description: "Was a South African anti-apartheid revolutionary, politician and philanthropist who served as President of South Africa from 1994 to 1999.", strength: 6, intelligence: 8, charisma: 9, picture_url: "http://a2.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTIwNjA4NjMzOTAyODkyNTU2.jpg")

Card.create(card_type: "Hero", name:"Matthew D. Huff", description:"Get You Some..." , strength: 10 , intelligence: 10, charisma: 10, picture_url: "/murok_face.jpeg/", effect_description: "Gets the whole hand crunk. (+10 to S,I,C your hand' stats)", effect_dsl: '[player] (hand>all) |charisma, intelligence, strength| {+10}')

Card.create(card_type: "Hero", name: "Betsy Carroll", description: "Jackie of all trades, mistress of TONS!!", strength: 5, intelligence: 10, charisma: 10, picture_url: "https://scontent-b-sea.xx.fbcdn.net/hphotos-xpa1/v/t1.0-9/1522028_10201042105079720_2027409000_n.jpg?oh=ea9fe65c9d057f3de0defa653fb262a7&oe=55356684", effect_description: "-10 S,I,C their hand", effect_dsl: '[opponent] (hand>all) |charisma, intelligence, strength| {-10}')

Card.create(card_type: "Hero", name: "Jay-Z" , description: "Allow me to reintroduce myself..." , strength: 6 , intelligence: 8 , charisma: 10, picture_url: "http://a2.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NTU2MzE2MTA0MjYzMTc5.jpg", effect_description: "-1 to opponent's C,I,L.", effect_dsl: '[opponent] (hand>all) |charisma, intelligence, strength| {-1}')

Card.create(card_type: "Hero", name: "Bill Storey", description: "The man. The legend.", strength: 10, intelligence: 10, charisma: 9, picture_url: "http://s8.postimg.org/4aomfhfet/bill.jpg", effect_description: "-10 S,I,C their hand", effect_dsl: '[opponent] (hand>all) |charisma, intelligence, strength| {-10}')

Card.create(card_type: "Hero", name: "Kim Kardashian", description: "The most selfied woman in history.", strength: 3, intelligence: 1, charisma: 7, picture_url: "http://ohyoumad.com/wp-content/uploads/2011/10/161164-kim-kardashian-and-chris-humphries-exclusive-wedding-photos-500x500.jpg")

# Template for Cards

# Card.create(card_type: "Hero", name: , description: , strength: , intelligence: , charisma: , picture_url: )

# Users Seeds
User.create(username: "Steven", password: "derp" , email: "derp@aol.com" ).create_deck(name: "Herp").cards.push(Card.where("id <= 30"))

User.create(username: "Zack", password: "powder", email: "linkblaine@gmail.com").create_deck(name: "Yin").cards.push(Card.where("id <= 30"))

User.create(username: "test_user1", password: "test", email: "test1@gmail.com").create_deck(name: "Test").cards.push(Card.where("id <= 30"))

User.create(username: "test_user2", password: "test", email: "test2@gmail.com").create_deck(name: "Test").cards.push(Card.where("id <= 30"))

# Games Seeds
Game.create(player_one_id: 4 , player_two_id: 3 , winner_id: 4 )

Game.create(player_one_id: 3 , player_two_id: 4, winner_id: 3)

Game.create(player_one_id: 3 , player_two_id: 4 , winner_id: 4 )

Game.create(player_one_id: 4 , player_two_id: 3 , winner_id:3 )

Game.create(player_one_id: 3 , player_two_id: 4 , winner_id: 4)

Game.create(player_one_id: 4 , player_two_id: 3 , winner_id: 4)

Game.create(player_one_id: 3 , player_two_id: 4 , winner_id: 3)
