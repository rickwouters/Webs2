INSERT INTO BookStoreDB.author
VALUES (1, 'Pieter Willems'), (2, 'Henk Janssen')

INSERT INTO BookStoreDB.user
VALUES (1, 'Jan Janssen'), (2, 'Gijs Giessen')

INSERT INTO BookStoreDB.status
VALUES ('pending'), ('delivered'), ('canceled'), ('sent')

INSERT INTO BookStoreDB.orders
VALUES (1, 'Grootestraat 32', 'Grootestraat 32', 1, 'pending'), (2, 'OnderwijsBoulevard', 'OnderwijsBoulevard', 2, 'delivered')

INSERT INTO BookStoreDB.categories
VALUES (1, 'fictie', 'niet waargebeurde verhalen', null), (2, 'non fictie', 'waargebeurde verhalen', null)

INSERT INTO BookStoreDB.products
VALUES (1, 'The Da Vinci Code', 'An ingenious code hidden in the works of Leonardo da Vinci',
'An ingenious code hidden in the works of Leonardo da Vinci. A desperate race through the cathedrals and castles of Europe. An astonishing truth concealed for centuries . . . unveiled at last.',
1)
(2, 'The Kite Runner', 't may be unfair, but what happens in a few days, sometimes even a single day, can change the course of a whole lifetime',
'Amir is the son of a wealthy Kabul merchant, a member of the ruling caste of Pashtuns. Hassan, his servant and constant companion, is a Hazara, a despised and impoverished caste. Their uncommon bond is torn by Amir s choice to abandon his friend amidst the increasing ethnic, religious, and political tensions of the dying years of the Afghan monarchy, wrenching them far apart. But so strong is the bond between the two boys that Amir journeys back to a distant world, to try to right past wrongs against the only true friend he ever had.',
1)
(3, 'Bossypants', 'a non fiction story', 'At last, Tina Feys story can be told. From her youthful days as a vicious nerd to her tour of duty on Saturday Night Live; from her passionately halfhearted pursuit of physical beauty to her life as a mother eating things off the floor; from her one-sided college romance to her nearly fatal honeymoon—from the beginning of this paragraph to this final sentence.',
2)

INSERT INTO BookStoreDB.images
VALUES (1, 'https://i.gyazo.com/a364581318194c7a9f593d5e98abb245.png', 1), (2, 'https://i.gyazo.com/f27f366c005a39d458bc084f4be6bd78.png', null)

INSERT INTO BookStoreDB.categories_has_products
VALUES(1,1), (1,2), (2,3)

INSERT INTO BookStoreDB.orders_has_products
VALUES (1,1), (1,2), (2,3)