DROP TABLE IF EXISTS tblDelivery;
DROP TABLE IF EXISTS tblPayment;
DROP TABLE IF EXISTS tblProductRating;
DROP TABLE IF EXISTS tblShoppingCart;
DROP TABLE IF EXISTS tblRating;
DROP TABLE IF EXISTS tblProduct;
DROP TABLE IF EXISTS tblType;
DROP TABLE IF EXISTS tblCategory;
DROP TABLE IF EXISTS tblUser;
DROP TABLE IF EXISTS tblRights;
DROP TABLE IF EXISTS tblIngredient;
DROP TABLE IF EXISTS tblRecipeStep;
DROP TABLE IF EXISTS tblRecipe;

-- Rights and User SQL from author @LuxJoghurt (Pedro Ribeiro Costa)

CREATE TABLE tblRights(
    idRight INT NOT NULL AUTO_INCREMENT,
    dtRight VARCHAR(6) NOT NULL,
    PRIMARY KEY (idRight)
);

INSERT INTO tblRights (idRight, dtRight)
VALUES (1, 'Admin'),
       (2, 'Staff'),
       (3, 'User');


CREATE TABLE tblUser(
    idUsername VARCHAR(10) UNIQUE NOT NULL,
    dtFirstName VARCHAR(40) NOT NULL,
    dtLastName VARCHAR(40) NOT NULL,
    dtPassword VARCHAR(80) NOT NULL,
    dtEmail VARCHAR(50) NOT NULL,
    dtTelephone VARCHAR(15),
    dtPLZ VARCHAR(6) NOT NULL,
    dtHouseNR VARCHAR(3) NOT NULL,
    dtStreet VARCHAR(35) NOT NULL,
    dtCountry VARCHAR(5) NOT NULL,
    fiRight INT NOT NULL,
    PRIMARY KEY (idUsername),
    FOREIGN KEY (fiRight) REFERENCES tblRights (idRight) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblUser
VALUES  ('admin', 'Admin', 'Admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin@admin.lu', '621 345 345', '1234', '3', 'Am Seif', '/', 1),
        ('staff' , 'Staff', 'Staff', '1562206543da764123c21bd524674f0a8aaf49c8a89744c97352fe677f7e4006', 'staff@staff.lu', '691 567 567', '1234', '3', 'Am Seif', '/', 2),
        ('user', 'User', 'User', '04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', 'user@user.lu', '621 788 897', '1234', '3', 'Am Seif', '/', 3),
        ('ribpe261', 'Pedro', 'Ribeiro Costa', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'ribpe261@school.lu', '691 522 129', '1940', '274', 'route de Longwy', '/', 1),
        ('frith033', 'Thibaut', 'Friederici', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'frith033@school.lu', '691 703 747', '6724', '13', 'Rue des Foyers', '/', 1),
        ('friti725', 'Tim', 'Frisch', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'friti725@school.lu', '621 816 424', '6183', '39', 'rue de ecole', '/', 1),
        ('guoka342', 'Guo', 'Kaidi', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'guoka342@school.lu', '661520300', '3429', '12', 'route de Burange', '/', 1),
        ('gammi625', 'Mihails', 'Gamass', 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e', 'gammi625@school.lu', '691 879 699', '8380', '13', 'Rue de la Gare', '/', 1);

-- Category, Typ and Product SQL from author @Luxbaut (Friederici Thibaut)
 
CREATE TABLE tblCategory (
         idCategory VARCHAR(5) NOT NULL UNIQUE,
         dtName VARCHAR(100) NOT NULL,
         PRIMARY KEY (idCategory)
);
 
    INSERT INTO tblCategory
    VALUES  ('MILK','Milk and dairy drinks'),
            ('FMILK','Fermented Milks'),
            ('BUTT','Butters'),
            ('CREA','Creams'),
            ('FRECH','Fresh cheeses'),
            ('CHEES','Cheeses'),
            ('YAOU','Yaourts'),
            ('DDESS','Dairy desserts'),
            ('ICECR','Ice cream'),
            ('BISC','Biscuits');
 
CREATE TABLE tblType(
        idType INT NOT NULL AUTO_INCREMENT,
        dtType VARCHAR(50) NOT NULL,
        dtDescription VARCHAR(1400) NOT NULL,
        dtImage VARCHAR(200),
        fiCategory VARCHAR(5) NOT NULL,
        PRIMARY KEY (idType),
        FOREIGN KEY (fiCategory) REFERENCES tblCategory (idCategory) ON DELETE CASCADE ON UPDATE CASCADE
);
 
INSERT INTO tblType (dtType, dtDescription, dtImage, fiCategory)
VALUES ('Fresh Milk','At Luxlait, we have chosen to use a process called microfiltration. Microfiltered milk stays fresh longer while retaining its taste and nutritional properties.','https://www.luxlait.lu/wp-content/uploads/2021/10/Lait-frais-3.5-1L_1_HD_OK_-1-336x1024.png','MILK'),
       ('UHT Milk','UHT milk can be stored for several months at room temperature, given that its packaging is closed. After opening, it should be placed in the refrigerator and consumed quickly. UHT milk has the longest shelf-life.','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-UHT-1.5-1L_1_HD_OK-526x1536.png','MILK'),
       ('Lactose-free milk','Discover the first 0% lactose milk with 100% luxembourgish milk. This quality product doesn""t just taste good but also has a long shelf life.','https://www.luxlait.lu/wp-content/uploads/2020/10/Lait_UHT_O-lactose_-540x1536.png','MILK'),
       ('Organic Milk','Luxlait organic milk is available in two versions: fresh microfiltered milk, for optimal preservation of the taste and semi-skimmed UHT milk that you can store for several months at room temperature.','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-UHT-Bio-3.png','MILK'),
       ('Fresh Chocolate Milk','The creamy whole milk and rich taste of cocoa have made our chocolate milk a real bestseller.','https://www.luxlait.lu/wp-content/uploads/2020/05/Lait-choco-frais_1L_face-330x1024.png','MILK'),
       ('Shakers','Our shakers are available in 8 different flavours. The 25cl format and lid make them perfect to enjoy on the go.','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-2b43c425-e38f-4d79-b6bd-d3b837c4085e.png','MILK'),
       ('Funny drink','Our Funny Drink is a fresh and fruity drink with 0% fat. Enriched with vitamins it has all the benefits of milk and a fresh orange juice.','https://www.luxlait.lu/wp-content/uploads/2019/09/Funny-drink-orange-1.png','MILK'),
       ('Egg Nog','Our egg nog is a creamy winter speciality with vanilla and non-alcoholic rum aroma. You can enjoy it hot or cold at any moment of the day. Tip for the adults: Add some rum for a festive drink.','https://www.luxlait.lu/wp-content/uploads/2019/09/Egg-nog-frais-0.75L_5_HD_OK_-600x1536.png','MILK'),
       ('Fremented milk','The smooth and tasty recipe of Luxlait fermented milk has received a great feedback from all consumers. For more than 30 years, this tasty and slightly acidic drink has been the number one seller in Europe.','https://www.luxlait.lu/wp-content/uploads/2020/05/Lait-Fermente%CC%81-1L_face-2-e1641394646525-768x1214.png','FMILK'),
       ('Lassi','Mango Lassi, born of Indian and Pakistani culinary traditions, is a testament to the love of flavours that define their heritage. Born in the Punjab Region of north India an eastern Pakistan, this exquisite drink is a harmonious marriage of the two nations’ passion for culture and taste. Whether enjoyed on busy street corners, in the tranquillity of homes or as a cherished offering on festive occasions, it reflects the essence of unity and conviviality that define the Pakistani and Indian communities. Luxlait Mango Lassi takes this traditional yoghurt recipe and creates a delicious, refreshing, smooth drink. Offering a glass of Lassi is not just a gesture of refreshment; it is a deeply rooted expression of hospitality. It symbolises the generosity and warmth that define the spirit of Indian and Pakistani communities.','https://www.luxlait.lu/wp-content/uploads/2024/01/TT-1000-Base-WEB-2.png','FMILK'),
       ('Laben Beldi','Traditionally, the milk is whisked in a “Garba” for several hours, to obtain fermented milk. The Laben Beldi is then poured into a terracotta jug. This is covered with a wet Hessian cloth in order to preserve the freshness of the Laben as long as possible. At Luxlait we reproduce this traditional recipe from the Hauts Plateaux of the Atlas Mountains as faithfully as possible.','https://www.luxlait.lu/wp-content/uploads/2021/02/55190-Laben_1L-web-e1612252447339.png','FMILK'),
       ('Raïb','Raib will go perfectly with your oriental dishes and will allow you to make light and digestible smoothies and milkshakes.','https://www.luxlait.lu/wp-content/uploads/2019/09/55140_RAIB_1L_Face-so.png','FMILK'),
       ('Raïbi','Raïbi is a fermented drink that has been created in Morocco in the 60s but has since then become popular in other countries, too. The Luxlait Raïbi is particularly creamy and to be considered as the healthiest option on the market. It""s a drink for the whole family: Kids love to freeze and make ice cream of it while adults will think back of their childhood or stay in Marocco.','https://www.luxlait.lu/wp-content/uploads/2019/09/Raibi-1L-2.png','FMILK'),
       ('Kefir','An ancestral drink from the nomads of the Caucasus mountains. Thanks to its specific fermentation, fresh milk is transformed into a slightly acidic, fresh and creamy drink. Its ferments contribute to well-being due to its natural action on the intestinal flora.','https://www.luxlait.lu/wp-content/uploads/2019/09/Kefir-face-1.png','FMILK'),
       ('Garlic Herb Butter','For your barbecues, meat dishes or however you prefer: choose the Luxlait Garlic herb butter. Made with traditional “Rose” butter from Luxembourg (PDO) and garnished with parsley and garlic.','https://www.luxlait.lu/wp-content/uploads/2022/06/Beurre-ail-et-fines-herbes_2_HD_-1024x303.png','BUTT'),
       ('Rose Butter','Unlike industrial butter, the cream is left maturing after being pasteurised by adding carefully selected lactic acid bacteria. That""s when the unique taste of our butter develops. Finely churned in a traditional process, the cream becomes smooth to obtain its final appearance: “Beurre Rose” butter.','https://www.luxlait.lu/wp-content/uploads/2019/09/beurre-rose-250g-1.png','BUTT'),
       ('Specialities with butter','Even kept in the refrigerator, our table butters are always ready to spread! Thanks to a mixture of butter and rapeseed oil, they can be used immediately. Our “light” version has up to half the fat content of conventional butter','https://www.luxlait.lu/wp-content/uploads/2019/10/Beurre_light-face-e1570526818637-1024x502.png','BUTT'),
       ('Liquid fresh cream','Luxlait liquid creams are ideal for preparing sauces, accompanying fruit or making cakes. Their hold when whipped with a hand or electric whisk enable them to be incorporated as a garnish or as an ingredient to enhance your dishes and desserts. Liquid fresh cream is not subjected to any treatment other than pasteurisation (neither ripening nor sterilisation). With its excellent whipping properties, it is the queen of Chantilly or whipped cream (in this case, it must be 36% fat cream).','https://www.luxlait.lu/wp-content/uploads/2019/09/Cr%C3%A8me-fraiche-36-1L_2_HD_ok_-334x1024.png','CREA'),
       ('UHT liquide cream','UHT liquid creams are ideal for making sauces, soups and desserts or simply plain to accompany fruit. They are suitable for cooking, but cannot be whipped (except 35% fat cream). They also provide a binding agent for culinary preparations and smoothness for all dishes.','https://www.luxlait.lu/wp-content/uploads/2020/05/Cr%C3%A8me-UHT-35-1L-384x1024.png','CREA'),
       ('Coffee cream','This small portion of cream lessens the natural bitterness of the coffee and adds a special sweetness that cannot be obtained from milk. In short, the essential plus for all lovers of coffee with cream','https://www.luxlait.lu/wp-content/uploads/2020/05/Coffee-Cream-Dosette_75g.png','CREA'),
       ('Sour cream','Thick and creamy, you won""t be able to resist the delicacy of the Luxlait fresh creams. You will appreciate their excellent cooking performance and softness. Their qualities to bind sauces, garnish dishes and provide tasty toppings will delight food lovers. Their practical formats, as well as their binding power will make your daily cooking easier.','https://www.luxlait.lu/wp-content/uploads/2019/09/Cr%C3%A8me-fraiche-epaisse-250g_Site-1024x798.png','CREA'),
       ('Organic Faisselle','Our organic faisselle is a fresh cheese made of organic, pasteurized full fat milk. Its name comes from the French word faisselle, designating the sieve in which the faisselle is put to drain. All production steps are manual, from the moulding with a ladle to the closing of the pots. You can use our faisselle both in your sweet and savoury dishes or simply enjoy it with some honey, jam or a fruit coulis.','https://www.luxlait.lu/wp-content/uploads/2022/05/FaisselleBio_Face-1-1024x680.png','FRECH'),
       ('Cottage cheese','Thanks to its melting texture and its curds of creamy fresh cheese, Luxlait cottage cheese was awarded adistinction in the “Superior Taste” competition. Luxlait cottage cheese occupies a special place in the fresh cheese landscape. Often eaten on bread, seasoned with salt, pepper and herbs, it is ideal for your savoury or sweet recipes. It is high in protein and low in fat.','https://www.luxlait.lu/wp-content/uploads/2019/09/cottage-cheese-250g_Site-1024x807.png','FRECH'),
       ('Soft white cheese','Luxlait fresh cheeses are prepared according to the traditional recipe and from simple ingredients: milk and a touch of cream (only in cream cheese). It can be used in all kinds of savoury or sweet dishes.','https://www.luxlait.lu/wp-content/uploads/2019/09/fromage-blanc-maigre-250g_Site-1024x793.png','FRECH'),
       ('Brach','Luxlait Brach is made from pasteurised whole milk to which lactic ferments have been added. Historically, it was used in Luxembourg cooking in times of famine, particularly as an accompaniment to the famous “Gequellte Gromper” (baked potato). Brach is timeless and has remained an essential product in Luxembourg households.','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-caill%C3%A9-250g_Site-1024x800.png','FRECH'),
       ('Organic Brie','Our Brie cheese is made of 100% organic Luxembourg milk. Discover its soft taste on a cheese platter, in a sandwich or in a savoury dish.','https://www.luxlait.lu/wp-content/uploads/2022/06/Brie_2_HD_-1024x996.png','CHEES'),
       ('Beer Cheese','The unique character of our cheese lies in the texture, roundness and fruitiness of a mature cheese, combined with the caramelised notes of the sublimely roasted malt of Battin Brune beer.','https://www.luxlait.lu/wp-content/uploads/2019/10/Gamme-fromage-battin-e1587383900682-1024x658.png','CHEES'),
       ('Grated Emmental','During the production and maturing of our Luxlait Emmental, our master cheesemakers select specific ferments that allow the formation of holes in the cheese when it matures in a warm cellar. This controlled process also gives Luxlait Emmental its characteristic fruity taste','https://www.luxlait.lu/wp-content/uploads/2019/10/56404_Emmental-rape-748x1024.png','CHEES'),
       ('Cheese slices','For well-filled sandwiches or cold or hot snacks, Luxlait cheeses have their own character and will meet everyone""s needs.','https://www.luxlait.lu/wp-content/uploads/2019/09/Emmental-706x1024.png','CHEES'),
       ('Kachkéis','Known as one of the monuments of Luxembourg gastronomy, Kachkéis is produced in a traditional way, without melting salts, colourings or preservatives. This authentic cheese comes in different forms. Indeed, it is possible to enjoy it cold, hot, cooked or even accompanied with a piece of bread with a dab of mustard.','https://www.luxlait.lu/wp-content/uploads/2019/09/Kachkeis_250_traditionnel_Face_Site-1024x655.png','CHEES'),
       ('Crème de Chapelain','Luxlait Crème de Chapelain offer a range of characteristic flavours for the whole family. Its creamy, smooth and homogeneous texture gives way to generous gourmet sandwiches.','https://www.luxlait.lu/wp-content/uploads/2019/09/Cremes-Chapelain-nature.png','CHEES'),
       ('Summer yoghurt','With the arrival of fine weather, Luxlait is reinventing itself and launching an innovative new range of three new summer yoghurts with new flavours! The well balanced combination of fruit, spices and fruit juices provides an original sensation of freshness. The flavours on offer, such as Yuzu & Green Tea, Mango & Turmeric or Cactus & Lime are very trendy and will delight the taste buds seeking novelty and quality. Faithful to its principles, the Luxembourg Yoghurt summer range is preservative-free and made with natural flavours. Taste them and give rein to your senses…','https://www.luxlait.lu/wp-content/uploads/2020/05/ete-mangue-1024x684.png','YAOU'),
       ('Yoghurt','The “Luxembourg yoghurt” range demonstrates Luxlait""s expertise in yoghurts. Their packaging in the form of a duo-pack and family pot are perfectly adapted to all current consumption patterns.','https://www.luxlait.lu/wp-content/uploads/2019/10/Fraise-1024x684.png','YAOU'),
       ('Winter yoghurt','Comforting and tasty in winter.','https://www.luxlait.lu/wp-content/uploads/2019/09/Hiver-sp%C3%A9culoos-1024x684.png','YAOU'),
       ('Funny yoghurt','Funny Yoghurt is a fruit-flavoured yoghurt for children. The fruit it contains has been blended, which makes it easier to eat.It will accompany your child as he grows and harden his bones! Rich in calcium, phosphorus and vitamins, it is a nourishing yoghurt that provides him with everything he needs.','https://www.luxlait.lu/wp-content/uploads/2019/09/Funny-banane-1024x600.png','YAOU'),
       ('Organic Yoghurt','Made without preservatives from milk, fruit and sugar, certified by the European Union""s organic label. Organic yoghurts are preservative-free. Thanks to our new recipe, the natural organic yoghurt is now stirred. This gives it a new, creamier and smoother texture to prolong your enjoyment. Go on, taste it!','https://www.luxlait.lu/wp-content/uploads/2020/05/Bio-nature-1024x684.png','YAOU'),
       ('0% Yoghurt','It is a fresh yoghurt with good melt-in-the-mouth fruit, without added sugar and fat.With its light texture and low acidity, it is a pleasant and refreshing product.It contains yoghurt lactic acid bacteria, which strengthen our digestive system: Straptococcus Thermophilus and Lactobacillus Bulgaricus. In addition, being rich in calcium, a pot of yoghurt meets 45% of the recommended daily intake. So, why deprive yourself?','https://www.luxlait.lu/wp-content/uploads/2019/09/0-museli_-1024x684.png','YAOU'),
       ('Cream yoghurt','Rich and creamy, creamy yoghurt is the dessert of gourmets. At any time of the day, let yourself be tempted by this smooth cream, subtly accompanied by real pieces of fruit or fine chocolate shavings, such as with the stracciatella creamy yoghurt. This is a rich preparation with 10% fat, rich in calcium and protein, enriched with cream, which will allow you to fill up with energy.','https://www.luxlait.lu/wp-content/uploads/2019/09/Satin%C3%A9-fruits-des-bois-1024x571.png','YAOU'),
       ('White cheese & fruits','Combining the sweetness of a creamy white cheese and a bed of gourmet fruit. The range of 4 flavours is suitable for everyday enjoyment','https://www.luxlait.lu/wp-content/uploads/2019/10/56115-fromage-blanc-abricot_Site-1024x526.png','DDESS'),
       ('Dessert','This authentic dessert made of white cheese with vanilla is placed on a bed of fruit and guarantees you a pleasant break.','https://www.luxlait.lu/wp-content/uploads/2020/05/56091-dessert-cerise_Site-1024x595.png','DDESS'),
       ('Fit wellness snack','A creamy fresh cheese combined with the delicacy of fruit. A range of 5 tasty flavours, to be enjoyed as a dessert or as a snack.','https://www.luxlait.lu/wp-content/uploads/2019/09/56155_fit-pomme-four_Site-1024x559.png','DDESS'),
       ('Greek-style yoghurt','Greek-style yoghurt is a traditional thick, creamy and tasty dairy product. It is available in four flavours: plain, honey, strawberry and peach & passionfruit.','https://www.luxlait.lu/wp-content/uploads/2019/09/54250-Yaourt-%C3%A0-la-grecque_site-1024x541.png','DDESS'),
       ('Cornets','According to taste, covered in a crunchy cocoa sauce with toasted hazelnuts dark chocolate flakes or strawberry puree.','https://www.luxlait.lu/wp-content/uploads/2019/08/Multipack-vanille_3_HD_-1024x805.png','ICECR'),
       ('Ice Cream Stick','Give yourself a refreshing break with Luxlait Ice Cream Sticks Available in chocolate, hazelnut and pistachio.','https://www.luxlait.lu/wp-content/uploads/2019/08/Noisette-Choco_3_HD_-1024x770.png','ICECR'),
       ('Ice cream tubs','Do you prefer ice cream or sorbet? For our ice cream tubs we chose only the best ingredients and lots of fruit! Let the intense taste and colorful packagings seduce you.','https://www.luxlait.lu/wp-content/uploads/2019/08/Glace-Luxlait-Vanille-853x1024.png','ICECR'),
       ('Miniatures','The fine crunchy shell is a perfect taster to enjoy the smooth vanilla, pistachio, raspberry, coconut and praline ice cream.','https://www.luxlait.lu/wp-content/uploads/2019/08/Miniatures-Framboise-simple_Dessus-1024x644.png','ICECR'),
       ('Water Sticks','You now don""t need to look elsewhere, Luxlait Ice Cream has developed a range of water-based ice sticks. The sticks are available in several flavours of orange, lemon and coca.','https://www.luxlait.lu/wp-content/uploads/2019/08/Watersticks-Mutlipack-Orange_2_HD_-1024x818.png','ICECR'),
       ('Frozen Yoghurt','To produce our Frozen Yoghurt, we use yoghurt instead of cream. Yoghurt contains less fat which makes it healthier. The 200ml pack with its integrated spoon is perfect for taking anywhere. Several flavours: strawberry, peach/passion fruit, salted butterscotch with pecan, vanilla and raspberry. Several flavours are also available in the 1 liter format.','https://www.luxlait.lu/wp-content/uploads/2019/09/Frozen-Yogurt-Caramel-1.png','ICECR'),
       ('Minicups','Luxlait minicups are individual portions composed of a creamy ice cream in a variety of flavours. As a snack or dessert, Luxlait minicups are ideal for a little gourmet break!','https://www.luxlait.lu/wp-content/uploads/2019/08/Minicups-Mutlipack-Fraise_3_HD_-1024x998.png','ICECR'),
       ('Organic Ice cream','Organic milk ice cream.','https://www.luxlait.lu/wp-content/uploads/2019/09/glace_bio_vanille.png','ICECR'),
       ('Fine crème','This fine and delicate composition will make you melt, spoonful after spoonful','https://www.luxlait.lu/wp-content/uploads/2019/10/FC_Chocolat.png','ICECR'),
       ('Dame blanche','With Luxlait Dame Blanche, you will find an essential classic … The refinement of this dessert will awaken your sensitivity. The intensity of the chocolate sauce mixed with the purity of the vanilla ice cream will make you melt with pleasure …','https://www.luxlait.lu/wp-content/uploads/2019/08/Boite-dame-blanche_BR-1024x824.png','ICECR'),
       ('Ice Cream Cake','The Lingot Vanille with its Bourbon vanilla intensity, the Brazilian cake made with a creamyvanilla-flavoured ice cream with such a melting praline heart, and the Christmas Log to enjoy during the Christmas season.','https://www.luxlait.lu/wp-content/uploads/2019/08/Lingot_Dessus-web-1024x509.png','ICECR'),
       ('Sablés','Biscuits with Luxlait “Rose” butter.','https://www.luxlait.lu/wp-content/uploads/2019/09/Site1-2-1024x267.png','BISC'),
       ('Mini Sablés','Mini-biscuits with Luxlait "Rose" butter in different flavours','https://www.luxlait.lu/wp-content/uploads/2019/09/Minisables-Miel-Sesame-1024x1024.png','BISC'),
       ('Galettes','Biscuits with Luxlait "Rose" butter.','https://www.luxlait.lu/wp-content/uploads/2019/09/Site1-1-1024x270.png','BISC'),
       ('Choco Splits','Cookies with Luxlait "Rose" butter and dark chocolate chips.','https://www.luxlait.lu/wp-content/uploads/2019/09/Site1-1024x373.png','BISC');
 
CREATE TABLE tblProduct (
    idProduct INT NOT NULL AUTO_INCREMENT,
    dtProduct VARCHAR(100),
    dtMetricUnit VARCHAR(25),
    dtPrice DOUBLE NOT NULL,
    dtFat VARCHAR(5),
    dtImage VARCHAR(200) NOT NULL,
    dtPackage VARCHAR(25),
    fiType INT NOT NULL,
    PRIMARY KEY (idProduct),
    FOREIGN KEY (fiType) REFERENCES tblType (idType) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Product INSERT from author @all
 
INSERT INTO tblProduct (dtProduct, dtMetricUnit, dtPrice, dtFat, dtImage, dtPackage, fiType)
        -- Milk and dairy drinks INSERT from author @LuxLait (Frisch Tim)
VALUES  ('Fresh milk','1L',2.17,'3.5%','https://www.luxlait.lu/wp-content/uploads/2021/10/Lait-frais-3.5-1L_1_HD_OK_-1.png',NULL,1),
        ('Fresh milk','0.5L',0.99,'3.5%','https://www.luxlait.lu/wp-content/uploads/2021/10/Lait-frais-3.5-500ML_1_HD_OK_.png',NULL,1),
        ('Fresh milk','1L',1.97,'1.5%','https://www.luxlait.lu/wp-content/uploads/2021/10/Lait-frais-1.5-1L_1_HD_OK_.png',NULL,1),
        ('UHT whole milk','1L',1.63,'3.5%','https://www.luxlait.lu/wp-content/uploads/2021/10/Lait-Uht-3.5-1L_1_HD_OK.png',NULL,2),
        ('UHT semi-skimmed milk','1L',1.95,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-UHT-1.5-1L_1_HD_OK.png',NULL,2),
        ('UHT skimmed milk','1L',2.17,'0%','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait_UHT_0_Sans-ombre.png',NULL,2),
        ('UHT whole milk','0.25L',1.08,'3.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-e3319160-1730-4a68-88e9-fb658ab1af6c.png',NULL,2),
        ('UHT organic milk','1L',2.05,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-UHT-Bio-3.png',NULL,2),
        ('UHT lactose-free milk','1L',2.02,'1.5%','https://www.luxlait.lu/wp-content/uploads/2020/10/Lait_UHT_O-lactose_.png',NULL,2),        
        ('Lacto-free milk','1L',1.91,'0%','https://www.luxlait.lu/wp-content/uploads/2020/10/Lait_UHT_O-lactose_.png',NULL,3),
        ('UHT milk','1L',2.05,'1.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-UHT-Bio-3.png',NULL,4),
        ('Fresh milk','1L',2.27,'3,5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-frais-Bio-3.png',NULL,4),
        ('Fresh milk','0.25L',0.69,'3,5%','https://www.luxlait.lu/wp-content/uploads/2019/09/TR-250-BiO_Face-1.png',NULL,4),
        ('Fresh Chocolate Milk','0.25L', 1.30, '3.5%','https://www.luxlait.lu/wp-content/uploads/2020/05/Lait-choco-Frais_250ML_face.png',NULL,5),
        ('Fresh Chocolate Milk','0.5L', 1.74, '3.5%','https://www.luxlait.lu/wp-content/uploads/2020/05/Lait-choco-frais_500ML-face.png',NULL,5),
        ('Fresh Chocolate Milk','1L', 3.09, '3.5%','https://www.luxlait.lu/wp-content/uploads/2020/05/Lait-choco-frais_1L_face.png',NULL,5),      
        ('UHT milk','0.25L',1.08,'3.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-e3319160-1730-4a68-88e9-fb658ab1af6c.png',NULL,6),
        ('Fresh Chocolate Milk','0.25L', 1.46, '3.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-2b43c425-e38f-4d79-b6bd-d3b837c4085e.png',NULL,6),
        ('Vanilla Milk','0.25L',1.55,'1.6%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-f1d1e562-501e-4582-8ee4-bdb66c8fb7f5.png',NULL,6),
        ('Cafe Latte Cappuccino','0.25L',1.33,'2.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-8f1d2794-ffe6-40ef-b154-f88fad4e979f.png',NULL,6),
        ('Cafe Latte Caramel','0.25L',1.33,'2.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-cbd9712f-7224-49f1-bc29-3a781e6a1735.png',NULL,6),
        ('Cafe Latte Espresso','0.25L',1.33,'2.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-970ce447-1a8d-46a8-ab8f-c03602da6ea9.png',NULL,6),
        ('Milky strawberry','0.25L',1.33,'1%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-93c66a66-0d56-4122-a7a1-93d6d3e55a9a.png',NULL,6),
        ('Milky banana','0.25L',1.33,'1%','https://www.luxlait.lu/wp-content/uploads/2019/09/TPA-250-E-DreamCap26-White-73bc5a36-1681-49b1-9b38-f3631faddad9.png',NULL,6),
        ('Tropical','0.7L', 2.55, '0.1%','https://www.luxlait.lu/wp-content/uploads/2019/09/Funny-drink-tropical-1.png',NULL,7),
        ('Orange','0.7L', 2.55, '0.1%','https://www.luxlait.lu/wp-content/uploads/2019/09/Funny-drink-orange-1.png',NULL,7),
        ('Egg Nog','0.7L', 1.30, '3.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Egg-nog-frais-0.75L_5_HD_OK_.png',NULL,8),

        -- Fermented milks INSERT from author @LuxJoghurt (Pedro Ribeiro Costa)
        ('Fermented milk','1L', 2.13,'1.5%','https://www.luxlait.lu/wp-content/uploads/2020/05/Lait-Fermente%CC%81-1L_face-2-e1641394646525.png',NULL,9),
        ('Lassi Mango','1L', 2.13,NULL,'https://www.luxlait.lu/wp-content/uploads/2024/01/TT-1000-Base-WEB.png',NULL,10),      
        ('Laben Beldi','1L', 2.13,'1.6%','https://www.luxlait.lu/wp-content/uploads/2021/01/55190-Laben_1L-web2.png',NULL,11),      
        ('Curd Milk','1L', 2.13,'2.6%','https://www.luxlait.lu/wp-content/uploads/2019/09/55140_RAIB_1L_Face-so.png',NULL,12),      
        ('Pomegranate','1L', 2.08,'1.6%','https://www.luxlait.lu/wp-content/uploads/2019/09/Raibi-1L-1.png',NULL,13),
        ('Pomegranate','0.5L', 1.05,'1.6%','https://www.luxlait.lu/wp-content/uploads/2019/09/Raibi-05L.png',NULL,13),
        ('Pistachio','1L', 2.08,'1.6%','https://www.luxlait.lu/wp-content/uploads/2020/04/Rabi-pistache-V2_1_HD_.png',NULL,13),
        ('Pistachio','0.5L', 1.05,'1.6%','https://www.luxlait.lu/wp-content/uploads/2020/04/Raibi-Pistache-500ml_Face-Ombre-ok-site.png',NULL,13),
        ('Mango','1L', 2.08,'1.6%','https://www.luxlait.lu/wp-content/uploads/2020/04/Raibi-Mangue-Dummy_face-ok-site.png',NULL,13),
        ('Mango','0.5L', 1.05,'1.6%','https://www.luxlait.lu/wp-content/uploads/2020/04/Raibi-Mangue-Dummy_500ML_Face-ok-site.png',NULL,13),      
        ('Plain','0.5L', 1.18,'1.6%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kefir-face-1.png',NULL,14),
        ('Vanilla','0.5L', 1.28,'1.6%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kefir-vanille-1.png',NULL,14),
        ('Blueberry','0.5L', 1.37,'1.6%','https://www.luxlait.lu/wp-content/uploads/2019/10/Kefir-Myrtille-face-500ml-e1570538615163.png',NULL,14),
        -- Butters INSERT from author @LuxKeis (Gamass Mihails)
        ('Garlic Herb Butter','125g', 3.16,NULL,'https://www.luxlait.lu/wp-content/uploads/2022/06/Beurre-ail-et-fines-herbes_2_HD_.png',NULL,15),
        ('Rose Butter','10g',0.18,'80%','https://www.luxlait.lu/wp-content/uploads/2019/10/Beurre10g.png','Plastic Tray',16),
        ('Rose Butter','125g',3.18,'80%','https://www.luxlait.lu/wp-content/uploads/2019/09/beurre-rose-125g-1.png','Aluminium packaging',16),
        ('Rose Butter','250g',3.85,'80%','https://www.luxlait.lu/wp-content/uploads/2019/09/beurre-rose-250g-1.png','Aluminium packaging',16),
        ('Rose Butter','250g',4.39,'80%','https://www.luxlait.lu/wp-content/uploads/2019/09/beurre-rose-250g-barquette-1.png','Plastic tray',16),
        ('Rose Butter','500g',7.67,'80%','https://www.luxlait.lu/wp-content/uploads/2019/09/beurre-rose-500g-1.png','Aluminium packaging',16),
        ('Spreadable','250g',4.33,'80%','https://www.luxlait.lu/wp-content/uploads/2019/10/Beurre_tartinable-face-e1570526858659.png','Plastic tray',17),
        ('Light','250g',4.03,'40%','https://www.luxlait.lu/wp-content/uploads/2019/10/Beurre_light-face-e1570526818637.png','Plastic tray',17),
        ('Semi-salted','250g',4.03,'75%','https://www.luxlait.lu/wp-content/uploads/2019/10/Beurre_demi-sel-face-e1570526892868.png','Plastic tray',17),

        -- Creams INSERT from author @Luxbaut (Friederici Thibaut)
        ('Liquid fresh cream','0.25L',2.18,'33%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cr%C3%A8me-250ml_face.png',NULL,18),
        ('Liquid fresh cream','0.5L',4.50,'36%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cr%C3%A8me-fraiche-36-0.250L_1_HD_ok_.png',NULL,18),        
        ('Liquid fresh cream','1L',7.25,'36%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cr%C3%A8me-fraiche-36-1L_2_HD_ok_.png',NULL,18),          
        ('Whipping Cream','1L',7.25,'35%','https://www.luxlait.lu/wp-content/uploads/2020/05/Cr%C3%A8me-UHT-35-1L.png',NULL,19),
        ('Smooth','0.2',2.04,'12%','https://www.luxlait.lu/wp-content/uploads/2019/09/cre%CC%80me-200ml-face-12.png',NULL,19),
        ('Whole','0.2L',1.80,'30%','https://www.luxlait.lu/wp-content/uploads/2019/09/cre%CC%80me-200ml-face-30.png',NULL,19),
        ('Culinary Cream','1L',12.04,'18%','https://www.luxlait.lu/wp-content/uploads/2019/09/Creme-culinaire_Face.png',NULL,19),
        ('Coffee cream','10g',0.07,NULL,'https://www.luxlait.lu/wp-content/uploads/2020/05/Coffee-Cream-Dosette_75g.png',NULL,20),
        ('Thick','250g',3.40,'33%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cr%C3%A8me-fraiche-epaisse-250g_Site.png',NULL,21),
        ('Thick','500g',6.52,'33%','https://www.luxlait.lu/wp-content/uploads/2019/09/cr%C3%A8me-fraiche-epaisse-500g_Site.png',NULL,21),
        ('Light','250g',3.40,'33%','https://www.luxlait.lu/wp-content/uploads/2019/09/cr%C3%A8me-fraiche-250g_Site.png',NULL,21),
        ('French style','250g',3.40,'33%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cr%C3%A8me-fraiche-%C3%A0-la-fr-250g_Site.png',NULL,21),


        -- Fresh cheeses and cheeses INSERT from author @Forlu102 (Formica Luca)
        ('Organic faisselle','2x100g',4.69,'6%','https://www.luxlait.lu/wp-content/uploads/2022/05/FaisselleBio_Face-1.png',NULL,22),
        ('Cottage cheese','450g',5.04,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/09/cottage-cheese-250g_Site.png',NULL,23),
        ('Cottage cheese','225g',3.04,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/09/cottage-cheese-500g_Site.png',NULL,23),
        ('Light','250g',2.54,'0.2%','https://www.luxlait.lu/wp-content/uploads/2019/09/fromage-blanc-maigre-250g_Site.png',NULL,24),
        ('Light','500g',5.10,'0.2%','https://www.luxlait.lu/wp-content/uploads/2019/09/Fromage-blanc-maigre-500g_Site.png',NULL,24),
        ('With cream','250g',2.25,'9.2%','https://www.luxlait.lu/wp-content/uploads/2019/09/Fromage-frais-250g_Site.png',NULL,24),
        ('With cream','500g',5.12,'9.2%','https://www.luxlait.lu/wp-content/uploads/2019/09/fromage-blanc-500g_Site.png',NULL,24),
        ('Brach','250g',2.07,'3.5%','https://www.luxlait.lu/wp-content/uploads/2019/09/Lait-caill%C3%A9-250g_Site.png',NULL,25),
        ('Organic brie','150g',4.30,NULL,'https://www.luxlait.lu/wp-content/uploads/2022/06/Brie_2_HD_.png',NULL,26),
        ('Beer Cheese','140g',3.78,'48%','https://www.luxlait.lu/wp-content/uploads/2020/05/fromage-battin.png',NULL,27),
        ('Grated Emmental','200g',3.28,'31%','https://www.luxlait.lu/wp-content/uploads/2019/10/56404_Emmental-rape.png',NULL,28),
        ('Emmental','170g',4.05,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/09/Emmental.png',NULL,29),
        ('Chapelain','170g',4.05,NULL,'https://www.luxlait.lu/wp-content/uploads/2019/09/Chapelain.png',NULL,29),
        ('Gouda','170g',4.05,NULL,'https://www.luxlait.lu/wp-content/uploads/2020/05/gouda.png',NULL,29),
        ('Gouda Light','170g',4.05,NULL,'https://www.luxlait.lu/wp-content/uploads/2020/05/gouda-light_.png',NULL,29),
        ('Edamer','170g',4.05,NULL,'https://www.luxlait.lu/wp-content/uploads/2020/05/Edamer.png',NULL,29),
        ('Abbaye','170g',4.05,NULL,'https://www.luxlait.lu/wp-content/uploads/2020/05/Abbaye.png',NULL,29),
        ('Lactose-free emmental','170g',3.85,NULL,'https://www.luxlait.lu/wp-content/uploads/2020/05/Emmental-0-lactose.png',NULL,29),
        ('Lactose-free gouda','170g',3.85,NULL,'https://www.luxlait.lu/wp-content/uploads/2020/05/gouda-0-lactose.png',NULL,29),
        ('Plain','250g',4.30,'40%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kachkeis_250_traditionnel_Face_Site.png','Tub',30),
        ('With herbs','250g',4.30,'40%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kachkeis_FinesHerbes_Face_Site.png','Tub',30),
        ('Low fat','250g',3.65,'0.1%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kachkeis_maigre_Face_Site.png','Tub',30),
        ('Plain','100g',2.23,'40%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kachkeis_100g_traditionnel_Face_Site.png','Tub',30),
        ('Low fat slab','250g',4.50,'0.1%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kachke%CC%81is-saucisse-maigre-250g.png','Roll',30),
        ('Low fat slab','500g',5.60,'0.1%','https://www.luxlait.lu/wp-content/uploads/2019/09/Kachke%CC%81is-saucisse-maigre-500.png','Roll',30),
        ('Plain',NULL,2.78,'34%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cremes-Chapelain-nature.png',NULL,31),
        ('Sweet pepper & pimento',NULL,2.89,'34%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cra%CC%88me-de-chapelain-Poivron-Piment.png',NULL,31),
        ('Italian flavour',NULL,2.98,'34%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cra%CC%88me-de-chapelain-Saveur-Italienne.png',NULL,31),
        ('With black truffle from the Périgord',NULL,3.12,'34%','https://www.luxlait.lu/wp-content/uploads/2019/09/Cra%CC%88me-de-Chapelain-O%CC%88-la-Truffe.png',NULL,31),

-- Shoppingcart SQL from autor @Forlu102 (Formica Luca)
 
    CREATE TABLE tblShoppingCart(
        idCart INT NOT NULL AUTO_INCREMENT,
        dtAmount INT NOT NULL,
        fiProduct INT NOT NULL,
        fiUsername VARCHAR(10) NOT NULL,
        PRIMARY KEY (idCart),
        FOREIGN KEY (fiProduct) REFERENCES tblProduct (idProduct) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (fiUsername) REFERENCES tblUser (idUsername) ON DELETE CASCADE ON UPDATE CASCADE
    );