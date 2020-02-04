-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2020 at 02:42 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vuebnb2`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_rooms`
--

CREATE TABLE `chat_rooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_type` enum('private','group','public') COLLATE utf8_unicode_ci NOT NULL,
  `user_ids` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `votes` int(11) NOT NULL DEFAULT '0',
  `spam` int(11) NOT NULL DEFAULT '0',
  `reply_id` int(11) NOT NULL DEFAULT '0',
  `page_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `votes`, `spam`, `reply_id`, `page_id`, `users_id`, `listing_id`, `created_at`, `updated_at`) VALUES
(1, 'testing', 0, 0, 0, '0', 1, 1, '2020-01-11 02:03:45', '2020-01-11 02:03:45'),
(2, 'testing reply', 0, 0, 0, '0', 1, 1, '2020-01-11 02:03:55', '2020-01-11 02:03:55'),
(3, 'tedrdr', 0, 0, 0, '0', 1, 1, '2020-01-12 12:54:43', '2020-01-12 12:54:43');

-- --------------------------------------------------------

--
-- Table structure for table `comment_spam`
--

CREATE TABLE `comment_spam` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment_user_vote`
--

CREATE TABLE `comment_user_vote` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote` varchar(11) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `listings`
--

CREATE TABLE `listings` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `about` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amenity_wifi` tinyint(1) NOT NULL DEFAULT '0',
  `amenity_pets_allowed` tinyint(1) NOT NULL DEFAULT '0',
  `amenity_tv` tinyint(1) NOT NULL DEFAULT '0',
  `amenity_kitchen` tinyint(1) NOT NULL DEFAULT '0',
  `amenity_breakfast` tinyint(1) NOT NULL DEFAULT '0',
  `amenity_laptop` tinyint(1) NOT NULL DEFAULT '0',
  `price_per_night` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_extra_people` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_weekly_discount` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_monthly_discount` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`id`, `title`, `address`, `about`, `amenity_wifi`, `amenity_pets_allowed`, `amenity_tv`, `amenity_kitchen`, `amenity_breakfast`, `amenity_laptop`, `price_per_night`, `price_extra_people`, `price_weekly_discount`, `price_monthly_discount`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Central Downtown Apartment with Amenities', 'No. 11, Song-Sho Road, Taipei City, Taiwan 105', 'Come and stay at this modern and comfortable apartment! My home is centrally located right in the middle of the downtown. Talk about convenience! Shops, stores, and other destination areas are nearby. \r\n\r\nFeel the warmth of the sun as there is plenty of natural light showers. The living room features tv, sofa, table, radio, and fan. There is free wi-fi with a fast internet speed. \r\n\r\nForgot shopping for breakfast staples? We provide eggs, bread, cereals, coffee, milk, tea and cookies. Enjoy cooking as my kitchen boasts full size appliances. The dining table is for four people. Need to wash your clothes? There is a washer and a dryer. We provide hampers, detergents, and clothing conditioner. \r\n\r\nIf you need to hit the gym, there is located at the fourth floor of the building. There is indoor spa and pool.', 1, 0, 1, 0, 0, 1, '$109', '$8', '12%', '20%', NULL, NULL, NULL),
(2, 'Private Suite with Free Parking', '110, Taiwan, Taipei City, Xinyi District, Section 5, Xinyi Road, 7', 'The entire apartment is for you to enjoy as my home is not shared with other guests or myself. This is a private suite so you can enjoy total privacy! I am just a text away if you need anything. \r\n\r\nThe kitchen has a microwave, oven, coffee machine, electric stove, and many others. The whole unit has air conditioning and heating that you can easily adjust its temperatures. \r\n\r\nAt the living room is like your small office space. It has a desk and chair, a good area for you to work. There is also wi-fi. The bathroom features a bath tub for you to relax. We provide soaps, shampoo, and other toiletries. \r\n\r\nThere is one free parking in this unit. No need to park in metered parking spots or paid garages!', 0, 1, 0, 1, 0, 0, '$105', '$16', '14%', '19%', NULL, NULL, NULL),
(3, '2 Bedroom House \' Pool Included!', 'No. 51, Hanzhong Street, Wanhua District, Taipei City, Taiwan 108', 'Come and stay at my home that has two bedrooms and bathrooms. Each bedroom is lockable and secure if you want safety and privacy. \r\nBreakfast is included and there is airport transfer. Wow! \r\n\r\nThere is free wi-fi included in your stay. Dip into the inviting private pool. The kitchen is fully-equipped. Dining area can accommodate up to 8 people. There is cable TV and DVD player in the living room. \r\n\r\nIf you want to go around the town and you have no vehicle, I can rent you out my motorbike. Everything is so easy to access from this fabulous location! Just a ten minute drive is the town where you can shop, dine, and look around!', 1, 1, 1, 1, 1, 1, '$84', '$22', '7%', '8%', NULL, NULL, NULL),
(4, 'Amazing Views and Walking Distance from Everything!', 'No. 134, Section 4, Zhongxiao East Road, Da\'an District, Taipei City, Taiwan 106', 'Stay in one of Taipei\'s nicest tower. From your bedroom you will get to see the wonderful views of Taipei. The living room is a great spot for a coffee or wine. There is TV, telephone, DVD player, and radio.  Kitchen has electric stove/oven, kettle, toaster, pans, refrigerator and coffee maker. Bathroom has fresh towels, toiletries, and hot and cold shower. If you want to wash your clothes, there is a laundry card provided for you. Card-operated laundry facilities located at the fifth floor. \r\n\r\nWalk to the train station, enjoy nightlife as the bars and clubs are nearby and enjoy fine dining in delicious restaurants and fun attractions. \r\n\r\nThe area has 24/hour security so you are safe and secured. You also have access to the building\'s community pool and gym.', 0, 0, 1, 1, 0, 1, '$51', 'No charge', '9%', '10%', NULL, NULL, NULL),
(5, 'Apartment w/ Balcony', 'No. 12, Songshou Road, Xinyi District, Taipei City, Taiwan 110', 'Unit is on the 15th floor. There is elevator in the building, wheel chair accessible, free parking on premises, hot tub, heating and air conditioning. \r\n\r\nEssentials are provided for you such as towels, soaps, shampoos, conditioners, and hair dryer. \r\n\r\nThe apartment has living room with a kitchen, one bedroom and a bathroom that has a bath tub with shower. You can relax at the balcony and watch the view of the city.\r\n\r\nIn the bedroom there is a big closet. In the kitchen there is an oven, coffee machine, a stove, a dishwasher and a fridge. Vinegar, oil, salt, pepper, tee and cleansing material is provided. \r\n\r\nMy home is comfortable and nice, well equipped with all the necessary facilities to make your stay in Taipei unforgettable.\r\n\r\nCinemas, pizzeria, restaurants, shops, supermarket, malls are accessible. Close to the building, in the main square you can rent bikes.', 0, 0, 0, 1, 0, 1, '$103', '$13', '15%', '16%', NULL, NULL, NULL),
(6, 'Elegant 1 bedroom Apartment - Breakfast Included!', '10491, Taiwan, Taipei City, Zhongshan District, Zhangchun Road, 176', 'Elegant apartment with 1 bedroom and just 1 block away from shopping, market, and 2 blocks away from the train station. Walking distance to the best of Taipei\'s financial district! \r\n\r\nMy apartment is located at the 17th floor. The building is secure and modern. \r\n\r\nThe bedroom has one queen size bed that is enough for two people. \r\n\r\nThere is also a comfortable couch next to the bed. Bathroom has bath tub, towels, hot and cold shower, hair dryer, toiletries, soaps, and shampoo. \r\n\r\nBreakfast include eggs, bread, coffee, juice, fruits, jam, and milk. My kitchen has appliances if you want to cook. \r\n\r\nThe view from the living room is just beyond amazing! Watch the spectacular sunset while eating at the dining area.', 1, 0, 1, 0, 1, 1, '$106', '$14', '6%', '7%', NULL, NULL, NULL),
(7, '1 Bedroom w/ Parking in Amazing Location!', '111, Taiwan, Taipei City, Shilin District, Lane 62, Tianmu West Road,', 'This luxury apartment has one bedroom with a queen sized bed that can sleep two people. I have an extra mattress that I can prepare if there are more than 2 people staying. My place accommodates up to 4 people. The bathroom is spotlessly clean and has toiletries. Kitchen is fully-stocked and dining table is good up to four people. \r\n\r\nThe building has amenities guests can enjoy such as gym, washer or dryer, and indoor pool. There is a large outdoor patio where you can enjoy a BBQ. Parking is available.\r\n\r\nWatch the beautiful views of the city thanks to the large windows. The living room has a flat screen tv where you can watch your favorite shows. There is cable tv and netflix. The couch is big enough that you can even sleep on it comfortably. Fresh linens are provided and breakfast essentials such as bread, tea, coffee, fruit juices, and other snacks.', 1, 0, 0, 1, 0, 0, '$58', '$11', '6%', '7%', NULL, NULL, NULL),
(8, 'Central Condo w/ 2 Beds', 'No. 39, Section 1, Fuxing South Road, Songshan District, Taipei City, Taiwan 105', 'Make my place your home base to explore the city of Taipei. Feel the homey feeling of a private residence with hotel amenities. There is elevator in the building, buzzer/wireless intercom, gym, and a 24 hour security.\r\n\r\nInside the unit there is Wi-Fi, stocked pantry that has breakfast supplies and snacks.\r\n\r\nThe bedroom has a carpeted flooring and two beds that can fit four people. There is a chair where you can overlook the views of the city. \r\n\r\nMy kitchen has a full-size fridge, oven, stove, and a dishwasher. We provide dishwashing liquid.\r\n\r\nIn the bathroom you will find your towels, soaps, shampoo, toilet paper, hanger, and a hair dryer. Relax and enjoy the bath tub. There is also a wall mirror where you can get your make up or hair just right. \r\n\r\nThis is your private suite. No other guests will share it with you.', 1, 0, 0, 0, 1, 0, '$74', '$8', '15%', '27%', NULL, NULL, NULL),
(9, 'Apartment in Downtown Area Close to Shopping', 'No. 1, Minle St,, Datong District, Taipei City, Taiwan 103', 'One bedroom unit is surrounded by many dining and shopping options in Taipei. My apartment is the ideal home base for exploring the city as this is located in downtown.\r\n \r\nRelax and enjoy a quiet evening. There is a desk where you can work, a tv if you want to watch your favorite shows or movies. The kitchen has full-size fridge, microwave, and stove. Inside the refrigerator are eggs, meat products, and milk. There are cup noodles inside the cabinets and they are complimentary for my guests. \r\n\r\nThe kitchen has a bar counter where you can enjoy your meals. It has four high chairs where you can comfortably sit. Bedroom has one queen sized bed that can sleep two people. I have two extra mattresses that can be prepared for you. \r\n\r\nBathroom has a bath tub, hot and cold shower, a large mirror and complimentary toiletries.\r\n\r\nYou\'ll feel spoiled with other amenities like toilet paper, Wi-Fi, cable TV, towels, hangers, iron and hair dryer.', 0, 0, 0, 0, 1, 0, '$74', 'No charge', '7%', '19%', NULL, NULL, NULL),
(10, 'Cozy, Modern & Private Suite w/ Rooftop Pools', '100, Taiwan, Taipei City, Zhongzheng District, Section 1, Shimin Boulevard, 100', 'Luxurious suite just a walking distance from some of the best restaurants, sky trains, shopping street, and supermarket. It features hotel-like amenities with warmest welcome for your stay. \r\n\r\nThere are rooftop pools where you can see the beautiful views from above. My home is located on the 20th floor. At night, watch the sky using a telescope at the living room.\r\n \r\nAccessing the unit is through a private entrance with electric keypad. I am providing my guests their own codes for them to enter. I live next door so I am available if needed at any time. \r\n\r\nSecurity and safety is guaranteed in the area. A police station is a few blocks away from my apartment. Many people, residence or tourists alike, enjoy walking during the night here. There is a pharmacy on the ground floor. \r\n\r\nThe best thing here is the view. Enjoy the wonderful sight from your bedroom, living room, and rooftop swimming pools.', 0, 1, 1, 1, 0, 0, '$108', '$6', '10%', '20%', NULL, NULL, NULL),
(11, 'Beach Front House', 'Nowy Swiat 62, 00-357 Warszawa, Poland', 'The best thing about my house is the view. Watch the beautiful sea view and relax in the balcony while drinking your morning coffee. \r\n\r\nMy place is good for solo adventurers, business travelers, and couples. \r\n\r\nThis is a shared place. I live downstairs with my dog and cats. If you need anything, I am available if you have any trouble. Guests stay on the second floor. Toilet and bathroom with tub is not shared. The bathroom and kitchen floors are heated. The house has air-conditioning. If you want to cook, you are free to do so. Living room is a common space. It has a flat screen tv, DVD player, and a collection of movies you can watch. The shelves have books in different genre. \r\n\r\nAside from its beautiful nature, the area is quiet. You have total privacy.', 0, 0, 1, 0, 1, 1, '$69', '$8', '15%', '19%', NULL, NULL, NULL),
(12, 'House by the Mountains w/ Billiards!', 'plac Trzech Krzy?y 16A, 00-499 Warszawa, Poland', 'Are you looking for a place that is quiet and has that homey feeling? Stay where you could rest and enjoy a bit of the mountains. My house is overlooking the valleys. Your bedroom is on the second floor facing the beautiful mountains. You have a separate bathroom and toilet. \r\n\r\nIf you want to hike, there are hiking trails around. You can also rent my bicycles for a small fee. Explore the wonderful area near us in a relaxing and fun way. Be close to nature!\r\n\r\nThe nearest big city is approximately 10 kilometers. The nearest store is about 3 kilometers from my house. \r\n\r\nLiving room has billiards and a bar where you can have your drinks. It is very spacious! \r\n\r\nMake your stay in Poland unforgettable!', 0, 0, 1, 0, 0, 1, '$111', 'No charge', '9%', '26%', NULL, NULL, NULL),
(13, 'Log House In Front of the Lake', '00-175, Aleja Jana Paw?a II 82, Warszawa, Poland', 'These are two small houses. The one house features a bedroom where you can sleep comfortably. The second house is quite larger as it has the bathroom with bath tub, sink, and toiletries. There are two chairs placed outside the house where you can watch the stunning views of the lake. \r\n\r\nEngulf in nature. Experience silence and calmness. The wooden house is comfortable for our guests. A short walk to the lake and forest. \r\n\r\nHear the birds singing every morning as you sip your cup of coffee provided by us. I live a mile away so whenever you need assistance, I can go and help you as quickly as I can. \r\n\r\nI would love to be your host! Contact me now and stay in my wonderful and humble abode. This is also pet-friendly.', 1, 0, 1, 1, 1, 0, '$112', '$18', '10%', '25%', NULL, NULL, NULL),
(14, 'Feel at Home \' Quiet Neighborhood', 'Woloska 12, 02-675 Warszawa, Poland', 'There is a fireplace in the bedroom. Bed is a queen-sized which can accommodate two people. There is also a comfortable couch beside the fireplace. Perfect for reading!\r\n\r\nBathroom is yours to enjoy. It features a bath tub. I provide towels, bath robe, soaps, and toiletries. There is even a chair where you can sit while preparing for a night out. \r\n\r\nMy home is accessible by car, taxi and public transport. There are plenty of extras that you will appreciate \'such as tea, iron, wi-fi, maps, coffee, and umbrella. The neighborhood is quiet and private. \r\n\r\nYou will find a welcome letter on the table. I have also included the details of your stay and also suggestions for your trip. There are maps and some brochures for my guests. I am also a text away.', 0, 0, 0, 1, 0, 0, '$103', '$25', '11%', '18%', NULL, NULL, NULL),
(15, 'Log House in Wooded Area!', 'Gladka 31, 02-172 Warszawa, Poland', 'Bathroom has a large mirror, sink, toilet, closet, hanger, towel rack, and toiletries. The dining area has a large window. The table can accommodate four people. There is also a mini-bar you can enjoy your drinks. Bedroom is small but very comfortable. It has two single beds. Bed sheets and linens are always fresh and changed. \r\n\r\nFully equipped with iron, wi-fi, and appliances. You get free coffee and juice; free of charge. Check-in is 1pm. Check-out is 11am. \r\n\r\nWe price cheaper than a hotel. Just read the reviews and you will get an idea what our guests think of us. \r\n\r\nWe welcome everyone and would be happy to assist in English, Polish, and Russian. My house is animal-friendly. You can bring your pets!', 0, 0, 1, 0, 0, 1, '$80', 'No charge', '6%', '26%', NULL, NULL, NULL),
(16, 'Cozy Cabin w/ Privacy', 'Mysliwiecka 2, 00-459 Warszawa, Poland', 'My cabin is located in a quiet and remote area. Not to worry though, it is accessible via any vehicle. This is perfect for guests who want solitude and privacy. I live a mile from the cabin so you can contact me whenever you need anything.\r\n \r\nThe kitchen is equipped with a microwave, fridge, kettle, cutlery, dishes and pots. There is a wine bar and has a flower decoration above. \r\n\r\nThe bedroom has a large bed, bed sheets, a chair, and some books you can read. A closet where you can place your clothes. Feel free to use the hanger. \r\n\r\nRelax in the living room that has comfortable chairs and a fireplace. You can also find some books.', 1, 0, 0, 0, 0, 1, '$73', '$19', '13%', '31%', NULL, NULL, NULL),
(17, 'Romantic House by the Lake', 'Kawalerii 12, 00-468 Warszawa, Poland', 'Stay in a house so close to the lake. A range of activities such as kayaking, swimming, fishing, and hiking. This is also close to the mountains. There are walking and hiking trails around. Outdoor and nature lovers are going to love this area!\r\n\r\nThis place is not completely isolated. Though behind the cabin there is nothing but nature, several houses are not too far away. \r\n\r\nCafes and supermarkets are a short drive away. A small store can be reached just minutes by foot. \r\n\r\nThe house offers views of the lake. So calming and relaxing! My guests can use the kayak for free. A small boat is also at your disposal. \r\n\r\nBedroom has two beds. Each bed can sleep two people. There is tv and table. Enjoy the bath tub. I provide wi-fi and cable. The kitchen is stocked and ready for you to cook - just provide the salmon!', 1, 1, 0, 0, 1, 1, '$103', '$18', '7%', '9%', NULL, NULL, NULL),
(18, 'Your Home in Warsaw', 'Al. Rzeczypospolitej 5, 02-972 Warszawa, Poland', 'I invite you to my lovely abode a short drive from the downtown, shopping, restaurants, and museums. Set on 2 private acres, my home offers solitude and privacy. Fruit-bearing trees are around. \r\n\r\nThe house sleeps four people. There are two bedrooms with queen sized bed each. A portable crib is provided upon request. I can also provide you futons. \r\n\r\nNo parties. No smoking inside. You can bring your pets so you need not worry leaving them behind when you travel. \r\n\r\nThere is wi-fi inside. This also comes with parking. The garage can fit up to two cars. The entrance is through a private courtyard.', 0, 0, 0, 1, 0, 1, '$83', 'No charge', '10%', '30%', NULL, NULL, NULL),
(19, 'Victorian House in Convenient Location', 'Wyki 11A, 00-365 Warszawa, Poland', 'Convenience is what you get with this place. The location is in very close proximity to shopping centers, supermarkets, night life, parks, and public transportation. \r\n\r\nTwo-storey house. The lower level is occupied by the host. The upper level is for the guest. Private bath, bedroom, living room, and kitchen. Upon entrance, there is a stairs leading to the second floor that you have to access. Enjoy total privacy.\r\n \r\nIt has a touch of Victorian design. Sleep like royalty in the comfortable and soft bed. It has drapes for design. There is a queen sized air mattress that can be provided with your request.\r\n\r\nThe kitchen has a refrigerator, oven, dishwasher, and a dining table that can accommodate six people. \r\n\r\nFor guests who have vehicles, use the street parking.', 0, 0, 0, 0, 1, 1, '$66', '$25', '9%', '23%', NULL, NULL, NULL),
(20, 'Two Bedroom Unit w/ Parking', 'Krakowskie Przedmie?cie 42/44, 00-325 Warszawa, Poland', 'A home you can stay located on the fifth floor. Two bedroom unit. One bedroom is connected to the living room that features a working space such as desk and chair. Wi-fi is provided. Living room has a flat screen television and cable. There is a DVD and a selection of movies. The couch is very comfortable. \r\n\r\nThe second bedroom is near the bathroom. It can sleep up to four people. Kitchen is quite small but equipped with appliances you can use for cooking your meals. \r\n\r\nI will guide you in the right direction anywhere you might want to go or see may it be the galleries, dining, nightlife or shopping. \r\nParking is provided. There is also street parking.', 0, 1, 1, 1, 0, 1, '$55', 'No charge', '15%', '31%', NULL, NULL, NULL),
(21, 'Lovely Lake Views in Cottages', 'y O, Vedado, Postal Code: 10400, Cuba, Calle 21, La Habana, Cuba', 'Cottages available for you. Near the lake and comes with free parking. You can dock your boat, go swimming, and kayaking. \r\n\r\nOne cottage features a small bedroom with bed, chairs, and table. The other cottages features bedroom that can sleep two people, a living room, bathroom, and a kitchen. Soap, shampoo, detergent, hair dryer, and bottled water are all provided.\r\n\r\nOur priority is for you to feel comfortable. As someone who travels a lot, I understand the importance of privacy. We make sure not to impose on your space but are also available if you need any assistance or recommendations. Never hesitate to ask through message on Airbnb or text, whatever is convenient for you.', 0, 0, 0, 1, 1, 1, '$54', '$9', '12%', '22%', NULL, NULL, NULL),
(22, 'Apartment w/ Balcony in Convenient Area', '416 Paseo de Mart\', La Habana, Cuba', 'My apartment has a small balcony with wonderful flowers. Bedroom has a bedroom that can sleep two people. The closet has a large mirror that you can slide whenever you open the closet. Plenty of space to put on your clothes. \r\n\r\nThe kitchen and living room is painted in white. The flooring is parquet. Bathroom has a bath tub, sink and a toilet. \r\n\r\nThis is in a perfect location. Designed to be lived in on long term, this apartment is suitable for long and short stays. Ocean view. Walking distance to the market, shopping, and other towns. \r\n\r\nMy goal is to make sure your stay is unforgettable so you can always contact me via phone or email. Because I do not live on the area year round, a friend of mine can assist you if you have any problems that need tending to.', 1, 1, 1, 0, 0, 1, '$66', '$15', '13%', '18%', NULL, NULL, NULL),
(23, 'Lovely House in Safe Neighborhood', 'Calzada, La Habana, Cuba', 'Guests enjoy your stay at my house, the one at the left side and painted in white. The second house, the one in red paint is where my family and I lives. The yard is huge. You can even camp out or have a picnic outside. \r\n\r\nTwo bedroom. One bedroom has a king size bed. The skylight naturally lets the light come in. In the other bedroom has two beds. One is single bed while the other is queen sized. Air mattress on request.\r\n\r\nThere is telephone, wi-fi, television, cable, and toiletries. The kitchen is all yours to cook and dine. There are also baking equipment.\r\n\r\nVery quiet, peaceful and safe neighborhood, but only 2 miles from downtown! Free parking up to three cars.', 1, 0, 1, 1, 0, 1, '$104', 'No charge', '11%', '16%', NULL, NULL, NULL),
(24, 'Colorful apartment with Balcony', 'Avenida Paseo entre Calles y 3ra, Vedado, 1ra, La Habana, Cuba', 'Delightful colorful apartment with private bathroom in a convenient location. A keyless door code on your entry door lets you self-check in late without worrying about disturbing us.\r\n 	\r\nThe guest apartment has its own thermostat, so feel free to adjust the temperature to your convenience. It has a small balcony where you can relax.\r\n\r\nThis setup is perfect for longer stays. The kitchen is nicely stocked with dishes, cups, utensils, pots and pans. The bedroom has a pocket door and brand new queen size bed and single bed with a super comfortable brand new mattress. We made sure to install plenty of outlets by the night stands for your electronics. \r\n\r\nThere is absolutely no sharing of any spaces, every picture you see is specifically for our guests, and this apartment is yours and yours alone! We live next door so we will be available if you need anything.', 1, 0, 0, 1, 1, 1, '$108', '$22', '7%', '19%', NULL, NULL, NULL),
(25, 'Beach Front House with Parking!', '1 Del Malec\'n, La Habana, Cuba', 'Beach front property! The patio is large with sun bathing chairs and umbrella. The views are stunning! Sip your refreshing drinks while you watch as the sun sets. The shoreline is a short walk away. \r\n\r\nIt has one bedroom that can sleep two people. I have two single futons that will be prepared upon your request. There is a fan inside and air conditioner. \r\n\r\nThe kitchen has an oven, stove, refrigerator, and other appliances. Cooking is made easy!\r\n\r\nBathroom has a toilet, sink, a small tub, towel rack, and mirror. There is also a first aid kit just in case.\r\n\r\nEasy 20-minute drive downtown, to airport & most hot areas. Private off-street parking.', 1, 1, 1, 1, 1, 1, '$88', 'No charge', '6%', '13%', NULL, NULL, NULL),
(26, 'Mountains, tub, and patio!', 'Calle 19 Esq. A M. Vedado, Calle 25, La Habana 10400, Cuba', 'Mountain views! There is a patio outside where you can watch the beautiful scenery and relax. The living room is connected to the patio. \r\n\r\nOne bedroom has a queen sized bed with bed sheets, linens and an extra sitting area. The couch is comfortable to sit on. There is a single mattress for the other guests. \r\n\r\nThere is a bath tub in the bathroom. Towels, soaps, shampoo, conditioner are all provided. There is also a hair dryer. \r\n\r\nPrivacy, wi-fi, cable TV, alarm system, log fireplace, and hot tub. 30 minutes from everything in a quiet, yet convenient neighborhood.\r\nThe grounds around the home are beautiful, sitting on almost an acre of well-maintained landscaping.\r\n\r\nThis is the perfect destination if you\'re truly looking to escape the stresses of everyday life. No matter what season you plan to visit, breathtaking natural scenery, fresh mountain air, and a plethora of outdoor activities await you!', 0, 0, 1, 0, 0, 0, '$78', '$18', '13%', '31%', NULL, NULL, NULL),
(27, 'Ocean Front House w/ Free Parking', 'Ave. Lazaro e/ 18 y 20, Pya, La, C\'rdenas, La Habana, Cuba', 'We would be honored to have your vacation in our home and feel the peace and quiet that we love to enjoy. Everything was designed around nature to give you a wonderful island experience. The pristine sandy white beach is right in front. There is a balcony where you can sit and enjoy the views. The beach is ideal for swimming and snorkeling. \r\n\r\nListen to the waves from the kitchen and living room. The bedroom is completely enclosed with a queen size bed, nice size closet, and an air conditioner unit. \r\n\r\nThe modern and updated kitchenette has a small refrigerator, stove, dish washer, microwave, coffee maker, blender, toaster oven, dishes/silverware, and cooking utensils.\r\n\r\nParking is inside a gated property right beside your unit with its own private entrances. I live in a separate house next door.', 0, 1, 0, 1, 0, 1, '$84', '$19', '12%', '20%', NULL, NULL, NULL),
(28, 'House by the Lake!', 'Aldabo, La Habana, Cuba', 'This house sits directly in front of the lake. The living room has the views of the lake. It has a piano, couch, chair, and books. This is a great place to relax, read the paper, drink your morning coffee, or listen to music. \r\n\r\nMy place sleeps comfortably two to four people. Private bath right next to your room. \r\n\r\nFive minute walk to restaurants, shopping, shops, markets, and museums. \r\n\r\nWe have coffee and tea available for you evening or morning. \r\nGuests are welcome to use the lake to swim, kayak, canoe, or paddle boat. Feel free to walk the property, sit on the dock, and enjoy the beauty of nature.', 0, 0, 0, 0, 1, 0, '$58', '$19', '10%', '28%', NULL, NULL, NULL),
(29, 'Lake and Mountain Views with Pool', 'Calle 8, La Habana, Cuba', 'Full lake front property offering breathtaking mountain sunrises and romantic moonlit evenings.\r\n\r\nThe patio has a large couch, table, and plenty of chairs. It features the best view! Relax and enjoy watching the mountains and lake. Dip into the infinity pool. It is just beyond beautiful!\r\n\r\nMy place is completely furnished with full kitchen, washer, dryer, flat screen TV, cable, complimentary high speed internet service with wifi, breakfast bar, queen bed & queen sleeper sofa. Truly a home away from home. Tropical breezes provide natural air conditioning. \r\n\r\nBedroom has a queen size bed. Air mattress can be provided upon request. Outside is another patio!\r\n\r\nBathroom has a tub and shower. The drinking water, shower and sink water are all super filtered. No need for bottled water here.\r\n\r\nThere is also off street parking. A great and safe neighborhood. Book your place in paradise stay with us early to guarantee a most memorable trip.', 0, 1, 0, 0, 0, 1, '$69', '$13', '14%', '22%', NULL, NULL, NULL),
(30, 'House Surrounded by Nature', 'Paseo de Mart\', La Habana, Cuba', 'Very spacious house! A wonderful and huge lawn to camp or enjoy a picnic. Trees around. Guests are welcome to explore the garden and find a quiet spot to sit and enjoy tropical beauty.\r\nBedroom has a king size bed, desk work place, closets, books and couch. Bathroom is huge. It features a bath tub, chair for you to sit on while preparing to go out, sink, toilet, and toilet essentials. Living room has a nice couch. The glass floor to ceiling windows get you a view of the outside. \r\nYou have your own parking space right outside the unit. I take pride in the house and keep it exceptionally clean and well-appointed.\r\nI live across the street if you need anything, and I have my phone with me all the time.', 0, 0, 0, 1, 0, 0, '$52', '$13', '11%', '25%', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `listing_items`
--

CREATE TABLE `listing_items` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `listing_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `strain` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `price_per_gram` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_per_eigth` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_per_quarter` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_per_half` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_per_ounce` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `listing_items`
--

INSERT INTO `listing_items` (`user_id`, `id`, `listing_id`, `title`, `description`, `strain`, `price_per_gram`, `price_per_eigth`, `price_per_quarter`, `price_per_half`, `price_per_ounce`, `created_at`, `updated_at`) VALUES
(9, 1, 2, 'eos natus', 'Dolore incidunt at odio iure.', 'indica', '7', '8', '1', '1', '6', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(6, 2, 6, 'voluptates quia', 'Occaecati accusantium adipisci esse quam qui est.', 'indica', '2', '8', '5', '7', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(7, 3, 2, 'nulla dolor', 'Et suscipit consequuntur temporibus eum ut est.', 'indica', '8', '9', '4', '1', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(1, 4, 4, 'perspiciatis aut', 'At sit explicabo velit.', 'indica', '6', '6', '4', '9', '2', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(1, 5, 8, 'voluptatum sit', 'Quas similique odit consequatur omnis incidunt.', 'indica', '5', '6', '5', '6', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(2, 6, 5, 'harum enim', 'Doloribus error et aspernatur.', 'indica', '8', '7', '6', '1', '9', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(3, 7, 6, 'id vero', 'Commodi sed ut maxime delectus voluptatem.', 'indica', '8', '6', '3', '7', '6', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(1, 8, 2, 'sed est', 'Laborum numquam aspernatur possimus omnis ut.', 'indica', '8', '1', '4', '8', '4', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(8, 9, 5, 'perferendis deserunt', 'Omnis quae qui aut voluptas et ut itaque est.', 'indica', '2', '4', '3', '9', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(9, 10, 9, 'sit quae', 'Officia consequatur nobis quis magnam aut est.', 'indica', '5', '6', '6', '2', '4', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(9, 11, 8, 'facere asperiores', 'A voluptatibus laboriosam doloremque soluta.', 'indica', '1', '5', '3', '1', '5', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(5, 12, 9, 'vitae dolorem', 'Est quia soluta amet ut nisi.', 'indica', '2', '8', '1', '9', '5', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(1, 13, 3, 'ex quam', 'Cumque laudantium laboriosam quaerat sunt.', 'indica', '3', '4', '9', '2', '2', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(6, 14, 5, 'ex fuga', 'Voluptate voluptatem laudantium aperiam maxime a.', 'indica', '3', '5', '1', '2', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(7, 15, 7, 'repellat voluptas', 'Vel assumenda vero qui natus aut aut.', 'indica', '1', '3', '6', '7', '5', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(9, 16, 1, 'officiis et', 'Enim eum nam nihil.', 'indica', '3', '2', '5', '1', '6', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(2, 17, 4, 'rerum quia', 'Impedit id in similique in totam.', 'indica', '1', '2', '5', '3', '9', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(9, 18, 5, 'iusto odit', 'Temporibus commodi itaque odio culpa.', 'indica', '4', '7', '4', '8', '7', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(7, 19, 4, 'quasi nulla', 'Sit rerum a et repellendus vel voluptas libero.', 'indica', '1', '9', '4', '4', '6', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(8, 20, 9, 'alias sit', 'Magnam perferendis est quod repudiandae facere.', 'indica', '6', '5', '1', '3', '6', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(3, 21, 8, 'debitis facere', 'Et voluptate ex quis hic.', 'indica', '5', '8', '9', '9', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(5, 22, 1, 'iure commodi', 'Et molestiae doloremque vel qui nemo et.', 'indica', '9', '1', '2', '8', '1', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(9, 23, 1, 'adipisci qui', 'Et nulla ex nemo nisi cupiditate et ducimus.', 'indica', '9', '5', '7', '5', '2', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(5, 24, 8, 'praesentium voluptas', 'Laudantium est voluptas rem et similique.', 'indica', '3', '6', '9', '8', '3', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(4, 25, 3, 'facilis officiis', 'Non at laborum consectetur sit sit est a.', 'indica', '9', '1', '8', '6', '2', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(1, 26, 7, 'recusandae cumque', 'Quia omnis eaque itaque.', 'indica', '6', '8', '4', '6', '2', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(7, 27, 6, 'recusandae tenetur', 'Dicta eum natus nam distinctio quia.', 'indica', '1', '9', '6', '9', '9', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(5, 28, 3, 'nesciunt sit', 'Blanditiis fugit explicabo quis deleniti.', 'indica', '6', '3', '9', '9', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(3, 29, 2, 'vitae fugit', 'Consequuntur ut fuga porro qui amet.', 'indica', '2', '1', '2', '4', '4', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(6, 30, 2, 'excepturi quae', 'Voluptas similique dolore vel qui dolores.', 'indica', '7', '6', '1', '2', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(8, 31, 3, 'et dolorem', 'A ut tempora possimus omnis vel.', 'indica', '6', '2', '7', '6', '3', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(6, 32, 9, 'repudiandae aliquid', 'Illo illo vel quam ab.', 'indica', '6', '5', '5', '8', '3', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(7, 33, 4, 'voluptas dolorem', 'Delectus aspernatur qui totam aut enim.', 'indica', '2', '5', '3', '9', '3', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(1, 34, 7, 'error eveniet', 'Rerum illo facere iusto quo voluptate sunt.', 'indica', '8', '6', '5', '3', '9', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(6, 35, 3, 'qui nemo', 'Autem magni dolore eveniet rem quidem.', 'indica', '6', '3', '3', '6', '1', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(5, 36, 3, 'ea fugit', 'Sit et quos sed voluptatem.', 'indica', '2', '4', '5', '4', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(8, 37, 4, 'ut consequuntur', 'Est nihil ut fugit quos ea quasi.', 'indica', '7', '7', '7', '3', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(3, 38, 3, 'voluptatem beatae', 'Aliquam et quas et rerum ad.', 'indica', '3', '6', '2', '6', '2', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(7, 39, 4, 'iste maiores', 'Omnis quod nobis laborum et sunt.', 'indica', '3', '3', '4', '2', '5', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(8, 40, 5, 'inventore minima', 'Sunt beatae velit distinctio aut soluta.', 'indica', '6', '5', '9', '2', '3', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(7, 41, 4, 'recusandae a', 'Voluptatem distinctio est sed.', 'indica', '8', '1', '6', '5', '5', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(9, 42, 2, 'repudiandae libero', 'Consequatur maiores iste dolor veniam.', 'indica', '9', '9', '5', '8', '4', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(1, 43, 1, 'enim ea', 'Sunt et qui vitae placeat dolore debitis eos.', 'indica', '9', '1', '6', '9', '4', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(2, 44, 7, 'voluptate occaecati', 'Et fugit ipsam voluptas reiciendis.', 'indica', '5', '3', '9', '7', '9', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(8, 45, 2, 'praesentium labore', 'Minus dolores eaque deleniti pariatur.', 'indica', '6', '2', '1', '6', '9', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(6, 46, 8, 'dolor harum', 'Facilis et unde et dolores quod.', 'indica', '1', '9', '7', '9', '6', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(8, 47, 9, 'soluta possimus', 'Ut ad esse tempora sit vitae possimus.', 'indica', '6', '3', '8', '9', '7', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(1, 48, 1, 'et possimus', 'Cumque natus maxime rerum hic.', 'indica', '7', '8', '3', '8', '2', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(5, 49, 7, 'dolor assumenda', 'Voluptatem quia minus doloremque dignissimos.', 'indica', '9', '2', '3', '5', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(4, 50, 7, 'unde nemo', 'Nisi nihil aut cumque sequi illum.', 'indica', '3', '6', '3', '5', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(5, 51, 5, 'iure tempora', 'Temporibus a quaerat minus assumenda dolore.', 'indica', '2', '8', '3', '6', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(2, 52, 2, 'sed unde', 'Odio et sed alias esse necessitatibus aut.', 'indica', '9', '4', '6', '9', '3', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(3, 53, 3, 'ea distinctio', 'Voluptatem eum sit deleniti fuga.', 'indica', '8', '3', '7', '7', '9', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(8, 54, 3, 'ea laudantium', 'Aut quia sit repellat.', 'indica', '4', '4', '1', '2', '9', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(6, 55, 1, 'autem architecto', 'Dolores fuga adipisci velit tempora.', 'indica', '2', '5', '5', '6', '3', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(6, 56, 1, 'non placeat', 'Omnis rerum ut qui cum debitis.', 'indica', '2', '4', '6', '7', '9', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(6, 57, 4, 'est et', 'Magni sit consequuntur beatae blanditiis.', 'indica', '5', '3', '5', '6', '4', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(1, 58, 8, 'nihil minima', 'Quam suscipit sed qui velit dolores molestiae id.', 'indica', '5', '2', '1', '8', '4', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(2, 59, 5, 'repellendus dignissimos', 'Et ea ut rerum adipisci similique.', 'indica', '1', '4', '8', '1', '5', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(5, 60, 4, 'et qui', 'Nihil eos id ad quia cum molestiae.', 'indica', '1', '2', '6', '9', '5', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(5, 61, 9, 'repudiandae totam', 'Eligendi ut vel dolorum inventore.', 'indica', '5', '8', '9', '8', '1', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(2, 62, 4, 'corrupti molestiae', 'Enim rerum voluptatibus ea dolorem ut.', 'indica', '3', '5', '6', '7', '1', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(9, 63, 2, 'dolorum optio', 'Quia eum aut accusamus aut odio saepe.', 'indica', '6', '4', '1', '2', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(1, 64, 2, 'repellat inventore', 'Ipsam unde corrupti eum ut sapiente.', 'indica', '5', '3', '1', '6', '9', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(4, 65, 5, 'ut minima', 'Aliquam odit est a omnis culpa aliquid molestiae.', 'indica', '3', '4', '2', '8', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(3, 66, 5, 'consequatur ea', 'Unde sed ut quis ut.', 'indica', '2', '3', '7', '4', '9', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(7, 67, 4, 'debitis laboriosam', 'Distinctio aliquid nostrum optio nostrum.', 'indica', '9', '8', '7', '7', '7', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(2, 68, 2, 'id libero', 'Aut cupiditate nihil et reiciendis fuga.', 'indica', '5', '2', '2', '1', '9', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(7, 69, 2, 'et deleniti', 'Est laudantium dolor et similique beatae ut.', 'indica', '5', '5', '4', '2', '3', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(2, 70, 5, 'perspiciatis rerum', 'Ipsam soluta aut enim dolore consequatur fugiat.', 'indica', '1', '7', '4', '9', '2', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(4, 71, 1, 'possimus quisquam', 'Et modi sed dolore. Incidunt omnis aperiam vel.', 'indica', '5', '7', '6', '4', '8', '2020-01-10 20:24:28', '2020-01-10 20:24:28'),
(6, 72, 7, 'dolorum ipsum', 'Deleniti non et eaque odit corrupti.', 'indica', '4', '2', '9', '1', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 73, 1, 'sunt ratione', 'Veniam quo voluptas occaecati voluptatem.', 'indica', '7', '7', '3', '1', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 74, 7, 'hic et', 'Similique nihil cum harum repudiandae.', 'indica', '9', '6', '4', '5', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 75, 5, 'veritatis quidem', 'Quas cum reiciendis hic ut in totam.', 'indica', '5', '9', '9', '5', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 76, 2, 'sed quia', 'Sunt illo corrupti incidunt repellendus ut ut.', 'indica', '8', '8', '1', '9', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 77, 6, 'minus doloribus', 'Rem suscipit consectetur illum sed.', 'indica', '1', '7', '4', '4', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 78, 2, 'explicabo unde', 'Est provident qui et.', 'indica', '5', '1', '4', '8', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 79, 6, 'a est', 'Officia ullam non placeat a quam maxime.', 'indica', '6', '4', '8', '7', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 80, 7, 'natus nostrum', 'Dolor enim dolorum aut et.', 'indica', '8', '9', '3', '8', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 81, 6, 'sequi nesciunt', 'Voluptatum id nihil natus.', 'indica', '5', '5', '2', '8', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 82, 1, 'sunt itaque', 'Perspiciatis voluptatem mollitia autem quo.', 'indica', '7', '8', '2', '4', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 83, 2, 'similique ea', 'Et nisi sed natus doloremque vitae corporis id.', 'indica', '8', '6', '6', '7', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 84, 2, 'amet modi', 'Nam tenetur nisi dignissimos numquam ipsa.', 'indica', '2', '6', '8', '5', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 85, 2, 'inventore aspernatur', 'Quia qui odio consequatur nobis.', 'indica', '2', '1', '4', '2', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 86, 4, 'laudantium omnis', 'Deserunt porro accusantium eius ducimus.', 'indica', '7', '3', '4', '2', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 87, 4, 'dolore aliquam', 'Facere error qui hic odio veniam impedit.', 'indica', '2', '2', '1', '2', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(4, 88, 8, 'est voluptatem', 'Sequi aut tempora sit.', 'indica', '9', '2', '2', '6', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 89, 5, 'ad aut', 'Officia cupiditate laborum nesciunt ex sed.', 'indica', '6', '6', '3', '3', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 90, 3, 'rerum numquam', 'Quia iste nemo at recusandae ipsum.', 'indica', '3', '3', '5', '1', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 91, 8, 'quis blanditiis', 'Culpa quasi in quia nostrum voluptate.', 'indica', '1', '6', '4', '3', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 92, 5, 'quae aspernatur', 'Dicta magni fugit perferendis commodi.', 'indica', '1', '8', '6', '2', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 93, 5, 'molestias deleniti', 'Non fuga ratione commodi.', 'indica', '1', '3', '1', '1', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(4, 94, 7, 'et laborum', 'Aliquam excepturi voluptatem fugiat autem et.', 'indica', '1', '1', '2', '7', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 95, 4, 'velit at', 'Et rerum deserunt id et perferendis.', 'indica', '3', '8', '7', '5', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 96, 3, 'natus ut', 'Quia sit cumque ipsa nihil quibusdam molestiae.', 'indica', '9', '5', '3', '8', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 97, 4, 'et velit', 'Sed dicta quo debitis quis doloremque.', 'indica', '9', '9', '6', '4', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 98, 3, 'quis sit', 'Qui in consequatur expedita laudantium pariatur.', 'indica', '1', '8', '9', '4', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 99, 1, 'et similique', 'Autem dolor qui quam id beatae.', 'indica', '9', '3', '4', '4', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 100, 1, 'odit vitae', 'Dolorem in quos quae aut. Et qui ex et est.', 'indica', '2', '6', '9', '7', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(4, 101, 1, 'qui laborum', 'Quo est eum ut ut est totam minima.', 'indica', '3', '4', '7', '9', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 102, 1, 'dolor voluptate', 'Aut ut nihil animi. Et natus dolores animi.', 'indica', '9', '1', '9', '1', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 103, 5, 'doloribus placeat', 'Dolorum maxime quia corrupti.', 'indica', '7', '1', '5', '6', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 104, 4, 'voluptas perspiciatis', 'Impedit totam quis cum animi ut esse.', 'indica', '1', '3', '4', '3', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 105, 4, 'animi consectetur', 'Et quam sed id omnis voluptatibus aperiam.', 'indica', '2', '8', '3', '1', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(4, 106, 3, 'voluptatem omnis', 'Corporis quo est voluptas.', 'indica', '6', '2', '3', '3', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 107, 5, 'rerum qui', 'Aut omnis vel incidunt quis.', 'indica', '6', '9', '6', '6', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 108, 3, 'est ipsam', 'Labore ab laboriosam reiciendis est accusamus.', 'indica', '6', '8', '1', '8', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 109, 8, 'natus et', 'Pariatur unde officiis magni modi non voluptas.', 'indica', '5', '6', '9', '3', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 110, 8, 'minima minima', 'Numquam aut ut enim.', 'indica', '4', '3', '5', '6', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 111, 8, 'officiis libero', 'Error maxime omnis corrupti autem dolorum rem.', 'indica', '1', '8', '7', '6', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 112, 7, 'animi sunt', 'Laboriosam sit consequuntur nobis et corporis.', 'indica', '7', '4', '5', '8', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 113, 4, 'dolorum sit', 'Saepe quo aspernatur quia esse.', 'indica', '3', '6', '5', '8', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 114, 1, 'libero eveniet', 'Dolores quidem nam et rem sint.', 'indica', '8', '3', '6', '1', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 115, 1, 'ipsum illo', 'Cumque sit vel nobis et.', 'indica', '5', '3', '8', '3', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 116, 7, 'ipsum voluptatem', 'Vel numquam explicabo est perferendis.', 'indica', '1', '6', '9', '4', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 117, 4, 'voluptatibus quia', 'Dolorum reprehenderit quis neque impedit quam.', 'indica', '8', '4', '9', '6', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 118, 5, 'illo ullam', 'Quis laboriosam illo natus.', 'indica', '6', '4', '5', '8', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 119, 9, 'unde voluptas', 'Et est debitis dolorum ab.', 'indica', '2', '4', '5', '5', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 120, 9, 'ea blanditiis', 'Ut quis repudiandae in natus.', 'indica', '8', '5', '9', '7', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 121, 2, 'ut molestiae', 'Facilis ut odit qui esse blanditiis aut.', 'indica', '8', '6', '8', '1', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 122, 2, 'molestias molestiae', 'Dolores et omnis culpa iste est laudantium.', 'indica', '9', '5', '9', '3', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 123, 4, 'ut eaque', 'Quod soluta quis possimus eligendi porro.', 'indica', '9', '6', '3', '8', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 124, 6, 'est facere', 'Est voluptatum sequi ea provident.', 'indica', '8', '7', '3', '2', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 125, 5, 'a assumenda', 'Suscipit at iure aut in blanditiis nobis ducimus.', 'indica', '2', '8', '4', '1', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 126, 4, 'mollitia ratione', 'Repellendus ex at quo illum.', 'indica', '4', '7', '6', '4', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 127, 6, 'ut dolores', 'Molestiae repellat ut dolores.', 'indica', '6', '5', '2', '5', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 128, 2, 'sed tenetur', 'Aut nam ut laborum vero sit.', 'indica', '9', '9', '5', '3', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 129, 4, 'fugit eos', 'Sint cupiditate ratione aut ea.', 'indica', '2', '6', '3', '5', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 130, 3, 'culpa dicta', 'Quia et unde aut.', 'indica', '8', '1', '8', '2', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 131, 2, 'placeat debitis', 'Eum tempore sed a eaque ducimus cumque qui.', 'indica', '9', '7', '7', '3', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 132, 9, 'similique iure', 'Alias quaerat recusandae cupiditate quod.', 'indica', '2', '1', '3', '7', '8', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 133, 1, 'magni animi', 'Nam sed consectetur at voluptatem corrupti.', 'indica', '4', '7', '5', '6', '8', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 134, 6, 'culpa quasi', 'Soluta qui veritatis ad omnis.', 'indica', '7', '5', '8', '9', '8', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 135, 9, 'velit veritatis', 'Officia est qui beatae doloremque quia.', 'indica', '6', '7', '3', '2', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 136, 7, 'ut quo', 'Ducimus iusto fuga beatae quisquam est quaerat.', 'indica', '3', '1', '3', '4', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 137, 9, 'sunt adipisci', 'Officiis eos expedita fuga quo et.', 'indica', '9', '7', '9', '8', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 138, 4, 'aliquam quaerat', 'Qui optio qui doloremque quas doloribus.', 'indica', '2', '1', '6', '7', '8', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 139, 8, 'in sequi', 'Iure et qui dolorum autem ea est dolores.', 'indica', '5', '9', '1', '7', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 140, 5, 'vel sequi', 'Voluptates eveniet nam consequatur qui.', 'indica', '5', '9', '6', '8', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 141, 7, 'ut labore', 'Quia laborum optio accusantium praesentium in.', 'indica', '6', '1', '8', '2', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(4, 142, 7, 'non sint', 'Deserunt qui velit blanditiis laudantium.', 'indica', '9', '9', '8', '9', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 143, 1, 'eos corrupti', 'Provident ab et ipsa quibusdam fugit beatae.', 'indica', '3', '3', '3', '4', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 144, 3, 'molestiae perferendis', 'Autem dolorum laboriosam aperiam qui.', 'indica', '1', '7', '9', '4', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(4, 145, 8, 'enim cumque', 'Fugit optio omnis nobis voluptatem odio velit.', 'indica', '8', '7', '1', '3', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 146, 4, 'ex sunt', 'Asperiores consequatur aliquam velit ipsam.', 'indica', '8', '3', '7', '7', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 147, 5, 'inventore delectus', 'Et esse ut velit aut deleniti rerum corporis.', 'indica', '4', '1', '1', '4', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 148, 3, 'reprehenderit omnis', 'Omnis id optio sunt sunt.', 'indica', '2', '7', '6', '2', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 149, 6, 'nesciunt fugiat', 'Explicabo sit officiis nostrum non quia.', 'indica', '5', '4', '1', '3', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 150, 1, 'ratione sint', 'Est minus est qui voluptatem.', 'indica', '8', '8', '5', '5', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 151, 2, 'dolores sed', 'Laudantium nisi aperiam incidunt deleniti a a.', 'indica', '3', '9', '3', '1', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 152, 4, 'non praesentium', 'Nulla cumque rerum sed similique sint recusandae.', 'indica', '2', '5', '9', '8', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 153, 7, 'aut inventore', 'Voluptatem omnis est sit eaque voluptatibus.', 'indica', '9', '5', '2', '5', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 154, 7, 'labore iusto', 'Id et commodi rerum officiis vitae perferendis.', 'indica', '8', '5', '3', '4', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 155, 8, 'nobis sunt', 'Consectetur voluptatibus repellendus nemo at.', 'indica', '9', '5', '6', '1', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 156, 2, 'aut rerum', 'Amet voluptatem deleniti cupiditate itaque sit.', 'indica', '2', '4', '2', '4', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(4, 157, 8, 'tempora omnis', 'Quasi saepe doloribus cupiditate dolor.', 'indica', '8', '7', '8', '5', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 158, 4, 'ullam nostrum', 'Qui quis officiis vel ut.', 'indica', '8', '9', '4', '4', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 159, 8, 'laborum dolor', 'Et suscipit sit eos id soluta illum eum.', 'indica', '3', '8', '1', '9', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 160, 4, 'voluptatem itaque', 'Quis dolorem earum quis praesentium.', 'indica', '3', '1', '5', '8', '8', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 161, 9, 'itaque voluptate', 'Et adipisci eum rerum at.', 'indica', '3', '5', '2', '6', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 162, 2, 'quam harum', 'Alias nemo sint omnis dolores.', 'indica', '4', '7', '1', '3', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 163, 9, 'consequatur voluptatum', 'Ut aut eos aut qui maxime.', 'indica', '1', '6', '5', '4', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 164, 2, 'quia quisquam', 'In magnam non delectus quisquam quisquam.', 'indica', '6', '8', '6', '7', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 165, 5, 'qui occaecati', 'Aut sunt omnis minus architecto esse quidem amet.', 'indica', '8', '1', '6', '3', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 166, 2, 'voluptate nemo', 'Nemo vitae nobis placeat hic qui.', 'indica', '5', '2', '1', '1', '8', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 167, 2, 'culpa velit', 'Sit sint consequatur sed tenetur.', 'indica', '4', '5', '2', '4', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 168, 6, 'eaque molestiae', 'Sit ut vero voluptates sapiente asperiores.', 'indica', '3', '4', '6', '6', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 169, 1, 'vel aut', 'Eius illum error facilis.', 'indica', '2', '6', '6', '9', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 170, 8, 'quisquam et', 'Sint molestias iusto quo velit unde magnam id.', 'indica', '6', '3', '9', '2', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 171, 3, 'voluptatem ea', 'Ea temporibus iure officia vel id facere est.', 'indica', '7', '2', '7', '8', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 172, 5, 'pariatur inventore', 'Ut voluptas voluptate qui.', 'indica', '7', '8', '1', '1', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 173, 3, 'et illum', 'Quod a est velit velit aspernatur nostrum aut.', 'indica', '1', '6', '3', '8', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 174, 1, 'ut enim', 'Reprehenderit quasi a autem sequi.', 'indica', '7', '9', '4', '1', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 175, 4, 'veritatis omnis', 'Et ullam numquam voluptate.', 'indica', '5', '1', '5', '6', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 176, 9, 'ipsa placeat', 'Debitis et quis delectus sed quia a.', 'indica', '3', '8', '1', '4', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 177, 4, 'quam molestiae', 'Aspernatur quae nulla quas sequi expedita omnis.', 'indica', '4', '8', '7', '7', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 178, 1, 'aut earum', 'Amet natus odio in iusto.', 'indica', '8', '3', '9', '4', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 179, 3, 'iure doloribus', 'Et voluptas optio adipisci.', 'indica', '6', '2', '1', '2', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 180, 5, 'impedit qui', 'Dolore reprehenderit velit nisi cumque.', 'indica', '3', '7', '4', '5', '8', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 181, 7, 'libero quis', 'Numquam ea debitis dolore reiciendis.', 'indica', '2', '7', '3', '3', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(4, 182, 5, 'eum odit', 'Et cumque aut rem libero suscipit consectetur at.', 'indica', '4', '8', '1', '9', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 183, 4, 'aut ipsa', 'Culpa sit velit repudiandae et.', 'indica', '1', '7', '1', '9', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 184, 6, 'odio ab', 'Sed sed harum ex quisquam ut omnis.', 'indica', '7', '2', '2', '2', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 185, 3, 'neque ullam', 'Aspernatur quia incidunt ut quia.', 'indica', '9', '1', '2', '3', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 186, 7, 'harum blanditiis', 'Natus quia ut suscipit veniam architecto.', 'indica', '9', '2', '4', '3', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 187, 3, 'est optio', 'Quos dolores vitae blanditiis maxime.', 'indica', '9', '9', '6', '3', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 188, 3, 'quaerat est', 'Dolores illo id optio.', 'indica', '8', '1', '1', '9', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(4, 189, 3, 'dolor sit', 'Voluptatum rem ut laboriosam numquam repellendus.', 'indica', '7', '6', '8', '9', '8', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 190, 6, 'accusantium excepturi', 'Amet corporis ea nesciunt sunt autem a nesciunt.', 'indica', '4', '8', '4', '8', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 191, 9, 'doloremque officia', 'Atque aspernatur aut maiores omnis.', 'indica', '2', '7', '7', '7', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 192, 3, 'dolorum numquam', 'Officiis ducimus ut sint omnis modi.', 'indica', '9', '9', '3', '3', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 193, 4, 'odio aliquam', 'Est quia cupiditate fugit minus.', 'indica', '9', '9', '4', '7', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 194, 7, 'neque in', 'Labore qui qui natus autem.', 'indica', '3', '1', '6', '6', '8', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 195, 5, 'quam ad', 'Recusandae non vel dolore quae rerum a aut.', 'indica', '5', '5', '4', '8', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 196, 2, 'aut eos', 'Hic dolore ut deserunt sed inventore et.', 'indica', '6', '8', '1', '6', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 197, 3, 'minima ex', 'Commodi at qui dolorum est.', 'indica', '6', '2', '9', '3', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 198, 1, 'sit expedita', 'Vitae ut aut blanditiis quisquam dicta.', 'indica', '6', '1', '6', '7', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 199, 2, 'quod consequatur', 'Et aut odio rerum.', 'indica', '1', '5', '3', '3', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 200, 1, 'eius similique', 'Possimus id debitis asperiores amet ut.', 'indica', '9', '7', '4', '5', '8', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 201, 5, 'labore quae', 'Molestiae vero aperiam ut velit.', 'indica', '8', '9', '1', '3', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 202, 1, 'rem odio', 'Eos inventore repudiandae explicabo ut.', 'indica', '7', '4', '2', '1', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 203, 6, 'qui doloribus', 'Aliquam voluptas sed id sint laudantium quas.', 'indica', '1', '9', '1', '3', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 204, 2, 'consequatur sapiente', 'Et in odio ex sed qui sapiente sapiente.', 'indica', '3', '2', '8', '3', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 205, 8, 'facilis rerum', 'Vero quas non voluptates laboriosam eos.', 'indica', '6', '2', '9', '6', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 206, 3, 'iusto et', 'Quos nihil vero odio fugiat eius delectus.', 'indica', '7', '7', '2', '9', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 207, 7, 'ab nam', 'Quae quibusdam tempora aut.', 'indica', '3', '3', '6', '7', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 208, 4, 'et dolorum', 'Voluptatem qui soluta vero suscipit facere.', 'indica', '2', '9', '1', '3', '8', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 209, 9, 'iure inventore', 'Aut rerum magni alias debitis repudiandae.', 'indica', '5', '8', '4', '1', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 210, 1, 'possimus in', 'Sed eos et sed sint dolore dolorum enim.', 'indica', '7', '8', '2', '9', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 211, 7, 'facere molestiae', 'In aspernatur qui amet quidem.', 'indica', '9', '7', '3', '7', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 212, 2, 'quae ut', 'Repudiandae molestiae tenetur sed et eos.', 'indica', '1', '7', '1', '5', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(4, 213, 4, 'et omnis', 'Dignissimos et ut quas incidunt.', 'indica', '7', '9', '2', '3', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 214, 7, 'dignissimos qui', 'Alias consectetur dolorem et tempore.', 'indica', '2', '4', '1', '8', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(9, 215, 9, 'inventore dolorem', 'Ut quia in aspernatur adipisci ad aspernatur qui.', 'indica', '1', '4', '1', '8', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 216, 6, 'dolorum maxime', 'Ea aut aut ut doloremque ut sunt ea.', 'indica', '1', '8', '2', '3', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 217, 4, 'doloremque quia', 'Ipsam excepturi assumenda laborum dolore.', 'indica', '6', '1', '8', '1', '8', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 218, 3, 'vel quasi', 'Minus quos ut vel sed ipsa dignissimos quis.', 'indica', '8', '8', '7', '7', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(5, 219, 8, 'illum ut', 'Reprehenderit fugit et temporibus fugiat.', 'indica', '4', '7', '1', '5', '5', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(4, 220, 7, 'sapiente consectetur', 'Sapiente et odit in omnis autem amet consectetur.', 'indica', '9', '6', '4', '3', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 221, 3, 'rem quas', 'Aut natus ipsam veniam quo recusandae harum.', 'indica', '3', '5', '8', '8', '8', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 222, 1, 'quidem non', 'Ea maiores voluptatibus et unde.', 'indica', '1', '1', '2', '6', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 223, 8, 'quia est', 'Magnam a quidem animi.', 'indica', '6', '6', '2', '6', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 224, 5, 'tenetur earum', 'Quia ullam expedita velit id magnam.', 'indica', '7', '5', '3', '4', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 225, 8, 'veritatis magnam', 'Et officia vitae accusamus perferendis natus.', 'indica', '6', '7', '7', '3', '8', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(8, 226, 2, 'est eaque', 'Quidem dolores corrupti omnis deserunt.', 'indica', '5', '6', '4', '1', '1', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 227, 5, 'et et', 'Eaque quidem et aut ipsam quia assumenda.', 'indica', '4', '7', '9', '2', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 228, 2, 'voluptatem inventore', 'Sit architecto officiis sit debitis.', 'indica', '5', '5', '2', '2', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 229, 4, 'quo ad', 'Explicabo officiis rerum ut ut.', 'indica', '4', '5', '1', '7', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 230, 6, 'culpa incidunt', 'Enim eos et non facere.', 'indica', '3', '5', '8', '4', '2', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(4, 231, 6, 'est fugit', 'Voluptas eos harum et velit.', 'indica', '1', '4', '1', '6', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 232, 8, 'deserunt deserunt', 'Nemo nobis iusto consequatur sunt deleniti quos.', 'indica', '7', '6', '7', '1', '7', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(4, 233, 8, 'ad ipsam', 'Repellat et fuga ut laudantium expedita animi.', 'indica', '5', '8', '3', '9', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 234, 2, 'distinctio non', 'Rerum nisi doloribus modi fuga.', 'indica', '1', '9', '7', '4', '9', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 235, 2, 'eos est', 'Id est impedit ut exercitationem ea.', 'indica', '8', '4', '1', '9', '3', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(6, 236, 8, 'itaque quisquam', 'Omnis sint qui voluptas saepe rem.', 'indica', '3', '1', '1', '6', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 237, 6, 'voluptatem ex', 'Hic similique aspernatur in officia.', 'indica', '9', '9', '7', '1', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(1, 238, 7, 'et odit', 'Minima quod sequi aut ullam rerum.', 'indica', '3', '7', '6', '7', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 239, 2, 'nihil aperiam', 'Et rem molestias non cumque.', 'indica', '2', '8', '5', '7', '4', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 240, 1, 'qui doloremque', 'Molestiae magni molestiae blanditiis ratione.', 'indica', '2', '1', '5', '8', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(7, 241, 3, 'quasi quos', 'Aut architecto necessitatibus recusandae et sit.', 'indica', '4', '6', '1', '6', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(3, 242, 7, 'repudiandae vero', 'Omnis aut alias dolorem quidem et ipsam et.', 'indica', '5', '7', '1', '1', '6', '2020-01-10 20:24:29', '2020-01-10 20:24:29'),
(2, 243, 8, 'quo corrupti', 'Quas ipsum odio ullam illum commodi repellat.', 'indica', '7', '2', '6', '8', '4', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 244, 3, 'natus porro', 'Neque impedit minus mollitia sunt.', 'indica', '1', '4', '2', '6', '9', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 245, 3, 'qui in', 'Ea harum ullam enim delectus rerum enim vel.', 'indica', '3', '1', '1', '3', '1', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 246, 1, 'dignissimos sequi', 'Non est aut nemo unde autem.', 'indica', '2', '8', '3', '2', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 247, 4, 'qui debitis', 'Neque ducimus fuga qui ut illum dolore quo.', 'indica', '2', '7', '3', '4', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(2, 248, 4, 'ut vel', 'Non quo aut qui provident minima est.', 'indica', '4', '1', '9', '5', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 249, 1, 'magni hic', 'Vel ea quas modi suscipit provident doloribus.', 'indica', '9', '2', '7', '2', '5', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(2, 250, 6, 'blanditiis voluptatem', 'Distinctio eius aut voluptatem ipsa.', 'indica', '5', '6', '9', '5', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(8, 251, 8, 'consequatur aut', 'Sit quidem voluptas qui qui.', 'indica', '9', '7', '5', '5', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 252, 6, 'fugiat omnis', 'Dolorum qui error id.', 'indica', '7', '7', '6', '6', '9', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 253, 7, 'culpa ut', 'Molestiae molestiae quasi aut atque.', 'indica', '7', '4', '9', '3', '9', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(7, 254, 1, 'non quod', 'Rem facilis repudiandae vitae dolores officia.', 'indica', '9', '3', '3', '1', '1', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(8, 255, 3, 'quo itaque', 'Nihil occaecati quia consequatur ut vero dolorum.', 'indica', '3', '7', '1', '4', '4', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 256, 6, 'non autem', 'Omnis culpa occaecati id deserunt vel dolores.', 'indica', '4', '3', '4', '4', '5', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 257, 8, 'earum accusantium', 'Ea explicabo quaerat necessitatibus.', 'indica', '7', '6', '4', '4', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 258, 3, 'quo consequatur', 'Consequuntur quis perspiciatis culpa vel.', 'indica', '2', '5', '9', '9', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 259, 7, 'voluptas reiciendis', 'Consectetur ratione aliquam assumenda nesciunt.', 'indica', '7', '9', '6', '3', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 260, 1, 'et non', 'Nisi in facere nihil voluptas.', 'indica', '4', '9', '2', '5', '7', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 261, 1, 'qui illum', 'Aut et velit reiciendis ratione commodi.', 'indica', '3', '4', '4', '8', '1', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 262, 8, 'voluptas et', 'Quod nemo rerum quod sed voluptatem sint vel et.', 'indica', '6', '8', '3', '2', '4', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(2, 263, 8, 'sunt illo', 'Aut nihil qui neque facere totam ut magni ab.', 'indica', '5', '4', '1', '8', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 264, 4, 'dicta vel', 'Repudiandae aut accusantium in omnis nihil enim.', 'indica', '1', '6', '5', '5', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 265, 7, 'cum ipsa', 'Dolorem et asperiores qui aut minus nobis et.', 'indica', '1', '7', '9', '7', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 266, 4, 'dicta culpa', 'Quia omnis molestiae debitis rem.', 'indica', '3', '2', '7', '9', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 267, 4, 'error modi', 'Magni neque nihil officiis neque voluptas.', 'indica', '2', '6', '3', '6', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 268, 7, 'qui est', 'Magnam odio corporis et alias ea.', 'indica', '7', '1', '5', '5', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 269, 3, 'magnam consectetur', 'Aut commodi nostrum et a molestiae quis.', 'indica', '3', '5', '7', '8', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(2, 270, 5, 'voluptas possimus', 'Error iste porro nulla porro nihil sit.', 'indica', '6', '8', '1', '5', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 271, 6, 'rem neque', 'Similique et enim modi.', 'indica', '3', '6', '4', '9', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 272, 8, 'qui dolor', 'Autem omnis atque et aut.', 'indica', '2', '5', '9', '7', '1', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(7, 273, 8, 'aut id', 'Ex qui unde temporibus sed mollitia quos.', 'indica', '5', '3', '5', '5', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(8, 274, 4, 'ut itaque', 'Soluta ipsam unde laudantium quis odit quos aut.', 'indica', '5', '2', '8', '3', '4', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(2, 275, 1, 'maxime et', 'Ipsam deleniti a voluptatem non.', 'indica', '9', '3', '2', '2', '5', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 276, 3, 'necessitatibus qui', 'Placeat amet et sed magnam doloremque id.', 'indica', '9', '2', '7', '8', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 277, 7, 'porro laborum', 'Porro reiciendis et non sequi perferendis et.', 'indica', '3', '9', '7', '6', '5', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(8, 278, 5, 'voluptatum magnam', 'Ut voluptas nesciunt rerum rem saepe.', 'indica', '7', '5', '9', '7', '5', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(2, 279, 9, 'alias eum', 'Minus quo quia voluptatum non itaque tempore est.', 'indica', '1', '5', '2', '5', '9', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 280, 5, 'voluptatem dolor', 'Commodi quia dolores sed dolore fugiat ullam.', 'indica', '6', '5', '3', '6', '5', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(2, 281, 8, 'quis ullam', 'Exercitationem quos molestiae eveniet occaecati.', 'indica', '3', '2', '9', '8', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 282, 3, 'doloribus fugiat', 'Molestiae voluptas amet tempora id facilis esse.', 'indica', '5', '2', '2', '3', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 283, 1, 'iusto corrupti', 'Laudantium qui expedita sint sint ut rerum.', 'indica', '3', '5', '4', '8', '1', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(7, 284, 3, 'qui ab', 'Libero est fugit maiores fugit harum.', 'indica', '2', '4', '2', '8', '9', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 285, 7, 'eum quo', 'Ullam molestias dicta quos expedita dolorem.', 'indica', '9', '8', '9', '4', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 286, 4, 'libero debitis', 'Facilis sunt velit nam repellendus.', 'indica', '9', '3', '5', '2', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 287, 5, 'in voluptas', 'Error ut in corporis.', 'indica', '6', '3', '6', '4', '1', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 288, 7, 'qui velit', 'Dolores fugiat voluptatum nihil error quos.', 'indica', '6', '3', '7', '3', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(8, 289, 2, 'nemo sunt', 'Repellat sint debitis ut cupiditate maiores sed.', 'indica', '3', '4', '3', '1', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 290, 2, 'voluptatem a', 'Voluptatum et dicta sit quo.', 'indica', '7', '7', '3', '3', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(2, 291, 1, 'quae eveniet', 'Magni voluptas dolorum sint et itaque aut.', 'indica', '9', '9', '8', '3', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(7, 292, 8, 'adipisci quia', 'Expedita hic ut numquam id quod cumque sequi.', 'indica', '4', '6', '2', '6', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 293, 2, 'ut est', 'Et recusandae alias et.', 'indica', '8', '7', '2', '9', '4', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(7, 294, 5, 'ut eveniet', 'Quos cum aut consequuntur vel.', 'indica', '9', '2', '7', '4', '4', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 295, 2, 'illo suscipit', 'Nam eum voluptatem natus dolores non.', 'indica', '6', '9', '1', '8', '7', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 296, 6, 'libero vel', 'Qui molestias doloribus nisi nobis impedit.', 'indica', '3', '7', '8', '2', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 297, 9, 'rem sint', 'Facere ea maxime quia a in.', 'indica', '8', '4', '5', '8', '9', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(8, 298, 3, 'amet aut', 'Et sit quia quae sint ut dicta.', 'indica', '1', '5', '1', '2', '4', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 299, 1, 'iure unde', 'Sed non dolor nostrum est.', 'indica', '4', '3', '6', '5', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 300, 6, 'aperiam neque', 'Laborum id quis id suscipit.', 'indica', '5', '2', '2', '5', '1', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 301, 8, 'iure ullam', 'Non rerum reiciendis est et.', 'indica', '3', '8', '9', '8', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 302, 6, 'nobis corporis', 'Aliquam aut dignissimos minima atque.', 'indica', '5', '1', '4', '5', '7', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 303, 8, 'quia hic', 'Sequi fuga sit quam sit doloribus.', 'indica', '5', '7', '2', '7', '4', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 304, 5, 'repellat dolorem', 'Est ut nam accusamus quaerat a.', 'indica', '4', '1', '7', '4', '5', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(8, 305, 1, 'ut omnis', 'Voluptas pariatur omnis eos.', 'indica', '7', '6', '4', '7', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 306, 4, 'vero nulla', 'Dolor quis alias voluptatem est omnis aut omnis.', 'indica', '8', '7', '1', '5', '7', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 307, 4, 'culpa aut', 'Repellendus ex ratione eius recusandae non.', 'indica', '1', '7', '8', '2', '5', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 308, 8, 'molestias et', 'Aut ut harum explicabo sed.', 'indica', '5', '2', '2', '2', '9', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(7, 309, 5, 'eum et', 'Impedit voluptate quae ipsam ad et aut nihil.', 'indica', '1', '8', '2', '2', '5', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 310, 5, 'recusandae quaerat', 'Quis aut eius distinctio.', 'indica', '9', '3', '7', '7', '7', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 311, 1, 'qui natus', 'Deserunt consequatur dolor cupiditate sapiente.', 'indica', '8', '1', '5', '5', '4', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 312, 9, 'tenetur optio', 'Adipisci natus ut vel sapiente cum quos.', 'indica', '2', '8', '8', '5', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(7, 313, 8, 'culpa amet', 'Sed ut consequatur ipsam eius est id.', 'indica', '3', '5', '6', '6', '7', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 314, 5, 'blanditiis accusantium', 'Aliquam aut dolor quia soluta aut rerum.', 'indica', '3', '5', '2', '6', '9', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 315, 5, 'eum consequatur', 'Quam id non vel non.', 'indica', '5', '3', '9', '6', '9', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 316, 9, 'omnis at', 'Architecto quos iure cum ut tempore est et.', 'indica', '2', '4', '1', '2', '7', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 317, 5, 'nihil repellat', 'Qui qui et ab dolores quaerat.', 'indica', '5', '9', '6', '8', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(2, 318, 8, 'omnis quibusdam', 'Quasi vitae laudantium expedita ex explicabo.', 'indica', '2', '1', '2', '5', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 319, 3, 'eum laudantium', 'Modi saepe vel ipsam velit quas veritatis quam.', 'indica', '2', '5', '2', '4', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 320, 6, 'qui ut', 'Dolor dolore rem ut esse.', 'indica', '6', '5', '8', '9', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 321, 1, 'explicabo et', 'Ut aut quibusdam fugiat nihil.', 'indica', '5', '6', '8', '1', '1', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 322, 2, 'nostrum fugiat', 'Tempora et quia minus eligendi et.', 'indica', '6', '3', '5', '5', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 323, 8, 'iure possimus', 'Dolor illo qui mollitia laudantium.', 'indica', '1', '4', '3', '6', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 324, 5, 'doloribus aut', 'Odit tempore corporis doloremque.', 'indica', '8', '8', '1', '4', '1', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(7, 325, 9, 'rerum tenetur', 'Ut voluptatem beatae aspernatur.', 'indica', '7', '9', '1', '5', '5', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 326, 3, 'et pariatur', 'Ad ut vitae inventore neque est eveniet.', 'indica', '3', '1', '2', '7', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 327, 8, 'pariatur est', 'Sunt nemo nihil sed ipsum.', 'indica', '1', '1', '3', '1', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(8, 328, 9, 'laborum tempora', 'Occaecati corrupti inventore numquam officia.', 'indica', '9', '6', '9', '2', '4', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 329, 8, 'fugit qui', 'Minus sed quisquam nesciunt tempore quis tempora.', 'indica', '6', '7', '6', '8', '4', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 330, 9, 'sunt quo', 'In animi et voluptatem sapiente.', 'indica', '6', '2', '8', '2', '5', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 331, 1, 'est occaecati', 'Quasi officia sit qui ducimus.', 'indica', '6', '9', '2', '4', '7', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 332, 2, 'est ipsa', 'Dolores aut eum temporibus quia ut.', 'indica', '7', '7', '6', '9', '4', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 333, 2, 'sunt minus', 'Adipisci ut eaque incidunt maxime quia sint.', 'indica', '4', '7', '3', '7', '1', '2020-01-10 20:24:30', '2020-01-10 20:24:30');
INSERT INTO `listing_items` (`user_id`, `id`, `listing_id`, `title`, `description`, `strain`, `price_per_gram`, `price_per_eigth`, `price_per_quarter`, `price_per_half`, `price_per_ounce`, `created_at`, `updated_at`) VALUES
(2, 334, 5, 'autem velit', 'Est quam hic cumque reiciendis.', 'indica', '7', '3', '2', '3', '4', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 335, 2, 'beatae veniam', 'Sapiente ipsa sit velit et.', 'indica', '6', '8', '8', '3', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 336, 7, 'distinctio iste', 'Aliquam soluta atque quisquam dicta et qui vel.', 'indica', '9', '1', '2', '1', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(7, 337, 1, 'odit quis', 'Excepturi ullam quos mollitia aut consequuntur.', 'indica', '3', '3', '4', '2', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 338, 3, 'et adipisci', 'Et maxime est voluptates voluptate.', 'indica', '4', '4', '4', '6', '1', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 339, 1, 'delectus doloremque', 'Ut porro suscipit quae voluptatibus.', 'indica', '7', '5', '4', '7', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 340, 1, 'aut exercitationem', 'Modi voluptatem dolorem omnis est.', 'indica', '3', '5', '6', '4', '7', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 341, 1, 'qui non', 'Vero eos aut ad impedit asperiores autem.', 'indica', '5', '4', '2', '4', '5', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 342, 8, 'voluptatem vel', 'Architecto natus officia iste doloribus.', 'indica', '2', '3', '7', '5', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(8, 343, 8, 'vero vero', 'Culpa quia quae excepturi consectetur.', 'indica', '8', '5', '5', '6', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 344, 1, 'quos officia', 'Alias dolorum aut id.', 'indica', '4', '5', '6', '6', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 345, 5, 'vero ab', 'Aut qui aut eos aperiam et quasi odit in.', 'indica', '1', '1', '7', '2', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(8, 346, 3, 'quae et', 'Et unde odit officia assumenda.', 'indica', '8', '8', '2', '5', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 347, 7, 'officiis molestiae', 'Autem possimus facilis consequatur.', 'indica', '3', '6', '8', '2', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 348, 7, 'sunt hic', 'Quis eos molestiae corporis.', 'indica', '9', '3', '2', '8', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(2, 349, 9, 'hic dolore', 'Eos ad ullam sed asperiores velit.', 'indica', '3', '3', '6', '8', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 350, 8, 'dolores molestiae', 'Cumque quis quis officiis odio et consequatur ab.', 'indica', '6', '6', '3', '6', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 351, 3, 'ut esse', 'Maiores voluptatem eveniet consequatur incidunt.', 'indica', '5', '4', '8', '4', '9', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 352, 1, 'quae ipsum', 'Architecto nemo architecto et nisi optio.', 'indica', '1', '2', '3', '6', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 353, 7, 'distinctio mollitia', 'Veritatis aliquid sit vitae labore et est omnis.', 'indica', '4', '1', '3', '5', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 354, 5, 'quo aut', 'Autem earum ut non cum voluptatem expedita qui.', 'indica', '7', '6', '4', '4', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 355, 4, 'ea qui', 'Numquam est saepe quos a eos aut.', 'indica', '4', '1', '1', '8', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 356, 4, 'ut vitae', 'Omnis sunt aspernatur tempore in.', 'indica', '5', '8', '3', '7', '4', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 357, 4, 'cumque eveniet', 'Esse illo incidunt sint non officiis quos.', 'indica', '6', '5', '2', '8', '9', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(8, 358, 7, 'totam magni', 'Est cum et magni omnis debitis.', 'indica', '5', '1', '8', '1', '5', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(2, 359, 1, 'velit omnis', 'Excepturi ut eius deserunt porro.', 'indica', '5', '9', '6', '4', '5', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 360, 6, 'sit voluptas', 'Enim quia asperiores natus quia non omnis atque.', 'indica', '3', '1', '3', '5', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 361, 9, 'rerum voluptate', 'Est ut atque nulla doloribus ut maiores.', 'indica', '7', '1', '9', '2', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(7, 362, 4, 'aut quidem', 'Dolorem et sed voluptas non.', 'indica', '5', '7', '8', '9', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 363, 8, 'molestias sunt', 'Ullam alias dolorum ducimus a incidunt.', 'indica', '7', '8', '1', '7', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 364, 6, 'ut ut', 'Pariatur omnis velit illo sint nihil.', 'indica', '4', '9', '3', '4', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(8, 365, 1, 'ad est', 'Laborum alias eum eaque repellat.', 'indica', '4', '3', '3', '5', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 366, 3, 'minus blanditiis', 'Non illo veritatis beatae.', 'indica', '1', '2', '7', '2', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 367, 6, 'non saepe', 'Hic odit nesciunt eos dolores.', 'indica', '2', '2', '6', '8', '7', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 368, 3, 'ad porro', 'In ut id ut rem molestiae eaque.', 'indica', '7', '1', '1', '6', '1', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(7, 369, 1, 'earum dolores', 'Dolores exercitationem eius beatae in aut et.', 'indica', '2', '3', '6', '4', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(5, 370, 5, 'rerum ut', 'Vel ipsa et tempora magnam id impedit.', 'indica', '6', '2', '5', '4', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 371, 7, 'veniam ullam', 'Amet rem laboriosam minima similique.', 'indica', '4', '7', '5', '5', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(3, 372, 6, 'exercitationem aut', 'Quo ad asperiores perferendis consequatur.', 'indica', '6', '1', '3', '1', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(7, 373, 1, 'sequi aut', 'Pariatur quia et voluptatem nemo a sapiente.', 'indica', '9', '4', '6', '2', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 374, 9, 'deleniti voluptatem', 'Qui rem quia officia quod.', 'indica', '1', '3', '9', '9', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 375, 6, 'rerum voluptatem', 'Doloremque porro illo repellat eos quia deserunt.', 'indica', '2', '5', '6', '7', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(7, 376, 7, 'perferendis ut', 'Eveniet veritatis hic quas ut et.', 'indica', '7', '3', '8', '7', '3', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(2, 377, 4, 'neque ut', 'Qui quibusdam a ullam eveniet sunt.', 'indica', '3', '4', '1', '9', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 378, 3, 'delectus maiores', 'Ut harum aliquam placeat.', 'indica', '8', '7', '2', '1', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(4, 379, 3, 'est sed', 'Assumenda quia omnis ut possimus aut excepturi.', 'indica', '8', '8', '4', '2', '2', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(7, 380, 6, 'atque voluptate', 'Voluptas dolores fuga facere veniam possimus.', 'indica', '7', '7', '7', '8', '9', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(9, 381, 1, 'qui odio', 'Facilis maxime quidem assumenda assumenda.', 'indica', '3', '5', '1', '1', '6', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(2, 382, 6, 'sed magnam', 'Optio et deserunt ipsa aut.', 'indica', '2', '8', '1', '6', '8', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(1, 383, 9, 'dolor quia', 'Sit reiciendis unde saepe facere dolores.', 'indica', '4', '6', '9', '3', '1', '2020-01-10 20:24:30', '2020-01-10 20:24:30'),
(6, 384, 3, 'vel saepe', 'Sit aliquam ullam libero ratione non.', 'indica', '3', '1', '1', '4', '3', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(2, 385, 1, 'laudantium consequuntur', 'Aut nulla sint magni quas omnis quibusdam.', 'indica', '3', '1', '3', '1', '6', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(6, 386, 4, 'necessitatibus aut', 'Qui molestiae aut laudantium aut.', 'indica', '6', '3', '3', '8', '6', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(5, 387, 2, 'adipisci magnam', 'Qui ea natus voluptas saepe natus.', 'indica', '8', '8', '5', '5', '1', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(7, 388, 2, 'aperiam sint', 'Voluptatem eaque libero at asperiores eligendi.', 'indica', '2', '6', '3', '6', '8', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(7, 389, 1, 'quis harum', 'Ducimus aliquam consequuntur accusantium laborum.', 'indica', '4', '6', '4', '9', '6', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(4, 390, 3, 'provident tenetur', 'Est velit soluta ea nostrum et quod sit.', 'indica', '6', '2', '5', '1', '3', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 391, 8, 'quis libero', 'Quod quaerat dolorum autem voluptatem.', 'indica', '2', '3', '3', '5', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 392, 1, 'officia ut', 'Quos quaerat itaque tempora ut ut.', 'indica', '5', '1', '8', '7', '1', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 393, 6, 'vero ut', 'Blanditiis sunt amet saepe quia.', 'indica', '2', '7', '8', '7', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 394, 5, 'nesciunt quas', 'Id et sit itaque et laudantium aliquid iure vel.', 'indica', '5', '6', '5', '8', '1', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(4, 395, 8, 'tempore magnam', 'In eum beatae quo ut est vitae occaecati.', 'indica', '5', '4', '6', '8', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(6, 396, 5, 'ut harum', 'Accusamus asperiores est et necessitatibus.', 'indica', '3', '1', '4', '7', '8', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(5, 397, 9, 'voluptatibus nihil', 'Saepe harum omnis velit corporis.', 'indica', '5', '5', '7', '4', '8', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(2, 398, 3, 'corporis provident', 'Est molestiae nemo quisquam enim aut fuga.', 'indica', '1', '1', '1', '5', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(2, 399, 3, 'alias commodi', 'Est ipsum officia consequuntur enim tenetur.', 'indica', '2', '8', '4', '8', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(5, 400, 5, 'iusto expedita', 'Illo temporibus maxime facere rem.', 'indica', '5', '1', '3', '3', '1', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(6, 401, 9, 'odio odio', 'Adipisci at minima nihil illo animi ut enim.', 'indica', '3', '9', '5', '3', '2', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 402, 9, 'blanditiis cupiditate', 'Iste deleniti aut qui.', 'indica', '8', '4', '6', '8', '6', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 403, 5, 'eos consequatur', 'Ut et magni vero adipisci.', 'indica', '6', '9', '9', '7', '1', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 404, 6, 'dolores ut', 'Quia et et magnam neque.', 'indica', '8', '3', '1', '6', '3', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 405, 8, 'reiciendis nihil', 'Ut eligendi ullam perspiciatis non.', 'indica', '4', '5', '7', '8', '2', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(4, 406, 5, 'sit earum', 'Et nesciunt aut ducimus qui voluptatem at.', 'indica', '1', '5', '8', '6', '6', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(6, 407, 1, 'ea ut', 'Itaque non facere porro atque nemo dolor.', 'indica', '2', '9', '2', '5', '1', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(6, 408, 1, 'iure facilis', 'Ad sit debitis repudiandae.', 'indica', '7', '3', '6', '6', '3', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(5, 409, 4, 'rerum a', 'Quae sit quidem ex qui repudiandae.', 'indica', '3', '1', '2', '6', '4', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(6, 410, 5, 'voluptatem totam', 'Dolor aut qui impedit qui asperiores.', 'indica', '5', '9', '5', '5', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(7, 411, 8, 'dolorem rerum', 'Sunt aut quo aliquam molestiae et.', 'indica', '7', '4', '1', '8', '8', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 412, 9, 'nemo suscipit', 'Aut sapiente qui repudiandae atque nesciunt.', 'indica', '1', '2', '7', '9', '3', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(2, 413, 3, 'amet exercitationem', 'Quia sed nostrum et corporis.', 'indica', '5', '2', '9', '5', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(7, 414, 8, 'consequuntur cumque', 'At iusto rerum inventore quam labore qui quis.', 'indica', '1', '3', '4', '6', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 415, 5, 'aut assumenda', 'Quos temporibus nihil nihil sit unde a laborum.', 'indica', '7', '4', '8', '3', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(4, 416, 5, 'velit quod', 'Ut architecto eum non et.', 'indica', '9', '6', '6', '7', '1', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(2, 417, 8, 'corrupti aliquid', 'Neque quia itaque culpa ipsum voluptatem.', 'indica', '5', '6', '1', '1', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 418, 8, 'perspiciatis amet', 'Enim quo temporibus et vero voluptate.', 'indica', '5', '2', '3', '2', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 419, 8, 'aliquid quas', 'Perspiciatis est autem ut repellendus aliquid.', 'indica', '7', '3', '9', '5', '2', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 420, 2, 'qui magnam', 'Ipsa quisquam sed dicta voluptatem dicta aut.', 'indica', '9', '5', '6', '9', '1', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 421, 9, 'voluptas sunt', 'Voluptatum saepe quia molestias laborum.', 'indica', '6', '5', '6', '6', '8', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(5, 422, 2, 'adipisci laborum', 'Et vero tenetur quidem quae tempora facilis.', 'indica', '7', '2', '7', '8', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(4, 423, 4, 'illum commodi', 'Quae sit at delectus dolore nam aut ut quae.', 'indica', '1', '6', '6', '3', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 424, 5, 'iusto veniam', 'Est minima sunt laboriosam.', 'indica', '6', '7', '2', '5', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(2, 425, 1, 'beatae praesentium', 'Aut architecto molestiae ut quae voluptatibus.', 'indica', '4', '9', '7', '4', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(7, 426, 1, 'magnam voluptas', 'Voluptas quo excepturi aut deserunt velit unde.', 'indica', '3', '8', '9', '7', '1', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(7, 427, 2, 'saepe voluptatem', 'Qui error reiciendis quo ut.', 'indica', '3', '5', '3', '5', '4', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(2, 428, 2, 'a autem', 'Amet maiores qui officia eaque autem architecto.', 'indica', '6', '8', '5', '4', '2', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 429, 3, 'placeat sed', 'Rerum nulla vel molestiae odio.', 'indica', '8', '9', '8', '4', '1', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 430, 1, 'dolores fuga', 'Est sit sint reiciendis sit.', 'indica', '6', '8', '6', '7', '4', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 431, 8, 'voluptatibus omnis', 'Facere quo voluptatum totam est quia non.', 'indica', '9', '1', '5', '9', '6', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(4, 432, 9, 'id id', 'Nihil sit blanditiis omnis qui quidem rerum.', 'indica', '7', '1', '3', '9', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 433, 5, 'debitis odio', 'Dignissimos sit tenetur et doloremque iste.', 'indica', '1', '7', '8', '9', '4', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 434, 7, 'totam facere', 'Sint perspiciatis placeat tenetur odio.', 'indica', '1', '2', '7', '4', '6', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 435, 3, 'hic tenetur', 'Rem quia est omnis doloribus quidem.', 'indica', '2', '6', '8', '2', '6', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 436, 8, 'odit rerum', 'Molestiae exercitationem assumenda nemo.', 'indica', '8', '4', '4', '8', '2', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(5, 437, 8, 'assumenda a', 'Occaecati repellendus impedit magnam animi iste.', 'indica', '6', '5', '8', '7', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(4, 438, 2, 'error quis', 'Est eius impedit modi consectetur quia.', 'indica', '7', '8', '2', '2', '6', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(5, 439, 2, 'odit quod', 'Quia ratione consequuntur reprehenderit aut.', 'indica', '8', '2', '3', '7', '4', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(7, 440, 6, 'perferendis nostrum', 'Necessitatibus quia soluta consectetur beatae.', 'indica', '5', '3', '7', '6', '1', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 441, 2, 'aliquam est', 'Nemo dolorem nemo saepe numquam commodi totam.', 'indica', '2', '3', '4', '4', '4', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(5, 442, 4, 'reiciendis provident', 'Ut excepturi accusantium fugit sint totam non.', 'indica', '1', '6', '7', '1', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(4, 443, 3, 'dolore facilis', 'Eos qui est eum voluptas at.', 'indica', '4', '6', '8', '3', '8', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 444, 3, 'velit dicta', 'Qui incidunt voluptatibus vel et itaque ut.', 'indica', '3', '9', '5', '5', '8', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 445, 2, 'eius incidunt', 'Rerum voluptatem laborum facere illum.', 'indica', '6', '6', '8', '2', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(6, 446, 8, 'in numquam', 'Nobis porro cumque vero sint neque.', 'indica', '3', '8', '3', '3', '2', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(6, 447, 5, 'unde quidem', 'Ut nesciunt ut non qui unde at.', 'indica', '4', '8', '5', '2', '8', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 448, 1, 'delectus est', 'Quis enim aspernatur sunt id maxime nam.', 'indica', '4', '6', '2', '1', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 449, 4, 'quibusdam voluptatem', 'Et maxime non eius eligendi illum.', 'indica', '2', '7', '8', '2', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 450, 5, 'dolorem consequuntur', 'Veritatis ea rerum optio enim.', 'indica', '4', '9', '9', '6', '2', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(4, 451, 7, 'quisquam corporis', 'Dolor fugit porro exercitationem voluptas.', 'indica', '7', '7', '4', '4', '3', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 452, 4, 'hic beatae', 'Aut quos eius ipsa esse.', 'indica', '5', '8', '3', '6', '6', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 453, 3, 'similique amet', 'Iusto possimus reprehenderit illo dolor.', 'indica', '9', '1', '9', '6', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 454, 1, 'doloremque quaerat', 'Dolore cum dolorem praesentium.', 'indica', '5', '6', '1', '4', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 455, 3, 'ipsa tempore', 'Quo et quos cum quaerat eveniet id in quo.', 'indica', '6', '7', '1', '2', '1', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 456, 4, 'a provident', 'Sequi eos quae mollitia explicabo ea sit.', 'indica', '1', '3', '2', '1', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 457, 6, 'hic molestias', 'Commodi ea et minus commodi.', 'indica', '4', '4', '5', '9', '2', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(4, 458, 5, 'et voluptatem', 'Doloremque reprehenderit fugiat sed sit sequi.', 'indica', '5', '4', '5', '2', '1', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(7, 459, 7, 'eos dolorem', 'Maiores nesciunt fugit nesciunt voluptatem.', 'indica', '5', '1', '4', '7', '3', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 460, 1, 'iure cupiditate', 'Eligendi enim id quis reprehenderit.', 'indica', '3', '6', '8', '4', '6', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 461, 9, 'aut harum', 'Nemo omnis et repudiandae est temporibus.', 'indica', '4', '7', '7', '7', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 462, 7, 'et molestias', 'Est aut occaecati ut culpa.', 'indica', '2', '9', '7', '1', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 463, 4, 'dolores et', 'Nostrum atque quod eveniet mollitia.', 'indica', '4', '2', '7', '1', '4', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 464, 3, 'molestias odit', 'Architecto temporibus rerum laborum eos.', 'indica', '5', '4', '6', '6', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 465, 9, 'aut alias', 'Nobis hic et illum.', 'indica', '9', '4', '9', '2', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 466, 7, 'sed omnis', 'Cupiditate tenetur ut ut ratione excepturi.', 'indica', '3', '6', '7', '4', '8', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(5, 467, 6, 'atque in', 'Est ut et sint laborum.', 'indica', '4', '3', '2', '8', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(6, 468, 9, 'sunt et', 'Molestias quis sit eos enim quisquam est qui.', 'indica', '2', '6', '5', '9', '4', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 469, 8, 'assumenda velit', 'Aspernatur sunt et vel in minus omnis.', 'indica', '1', '5', '8', '3', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(2, 470, 1, 'ducimus corporis', 'Dolore non earum quisquam.', 'indica', '7', '3', '4', '1', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 471, 3, 'nam dolor', 'Vero ut sed aspernatur ut atque.', 'indica', '8', '4', '6', '7', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(2, 472, 3, 'aut magni', 'Fugit eius cum et in laborum cum animi.', 'indica', '7', '6', '6', '1', '2', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 473, 2, 'non itaque', 'Ipsa ut numquam in quas et facilis.', 'indica', '8', '5', '3', '5', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 474, 1, 'soluta ullam', 'Soluta rerum molestias qui id soluta.', 'indica', '6', '2', '8', '8', '8', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(6, 475, 4, 'incidunt deleniti', 'Et et consequatur quia placeat dolores.', 'indica', '5', '9', '8', '9', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(7, 476, 9, 'quo dolore', 'Ad nobis facilis in expedita.', 'indica', '6', '8', '2', '2', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 477, 2, 'veritatis quia', 'Atque odit et aut et ipsum veniam.', 'indica', '4', '9', '2', '1', '4', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(2, 478, 7, 'nihil laudantium', 'Rerum eius qui quisquam ipsa.', 'indica', '1', '7', '6', '1', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(6, 479, 9, 'possimus eum', 'Est provident temporibus et qui quia asperiores.', 'indica', '3', '1', '5', '8', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 480, 4, 'qui illo', 'Eos ex commodi ut eaque voluptas ea ut natus.', 'indica', '6', '1', '2', '2', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 481, 2, 'consequatur qui', 'Sit occaecati eius amet.', 'indica', '8', '7', '6', '4', '4', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(7, 482, 7, 'sint qui', 'Modi beatae aut perspiciatis ut voluptatem et.', 'indica', '8', '4', '5', '7', '6', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 483, 5, 'cupiditate veritatis', 'Aliquam rerum maiores omnis dignissimos quasi.', 'indica', '6', '4', '4', '8', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(6, 484, 8, 'sint ipsum', 'Quia minus dolor sit ipsum veniam.', 'indica', '7', '6', '2', '8', '1', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(7, 485, 2, 'repellat magni', 'Vero cupiditate est accusantium veniam.', 'indica', '1', '7', '1', '2', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(2, 486, 4, 'ut vero', 'Odit distinctio consequatur quo sit molestiae.', 'indica', '9', '9', '5', '9', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 487, 2, 'impedit minima', 'Ipsam inventore tempore est et.', 'indica', '2', '6', '1', '1', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(4, 488, 5, 'fugiat error', 'Recusandae ut dolore eius cum.', 'indica', '9', '1', '5', '6', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(4, 489, 2, 'ut saepe', 'Beatae aliquam voluptates quam libero quo.', 'indica', '3', '2', '9', '5', '3', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 490, 6, 'cupiditate et', 'Qui nulla iste id quibusdam explicabo ratione.', 'indica', '2', '5', '5', '5', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 491, 8, 'dolorem sed', 'Qui sunt ut aut quo assumenda.', 'indica', '7', '6', '7', '2', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(7, 492, 7, 'voluptatem recusandae', 'Est est eos iure odit dolor et est.', 'indica', '4', '4', '7', '9', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 493, 3, 'error tempora', 'Itaque sunt voluptatem eum hic.', 'indica', '1', '2', '8', '1', '3', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 494, 8, 'sed vel', 'Qui veniam consequatur veritatis incidunt sed.', 'indica', '8', '1', '1', '5', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 495, 3, 'quia qui', 'Ullam earum quo sed alias aperiam aut ab.', 'indica', '5', '5', '7', '6', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(2, 496, 3, 'vero aut', 'Error qui omnis quis ut est.', 'indica', '2', '3', '9', '4', '6', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(6, 497, 5, 'neque id', 'Cupiditate voluptatem odio ex in sed.', 'indica', '1', '7', '7', '2', '3', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 498, 4, 'in cumque', 'Sed illum aperiam eos officia minima.', 'indica', '9', '1', '2', '1', '2', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(5, 499, 5, 'ad doloremque', 'Cum dolore nobis voluptatem odit.', 'indica', '8', '1', '4', '3', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 500, 2, 'et iure', 'Rem quos sed mollitia et voluptatem commodi sunt.', 'indica', '2', '4', '8', '8', '4', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 501, 4, 'ut culpa', 'Laboriosam ut rerum amet qui sint.', 'indica', '8', '1', '6', '4', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(2, 502, 5, 'sed reprehenderit', 'Quasi voluptatem explicabo excepturi quia.', 'indica', '6', '3', '2', '7', '3', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(5, 503, 5, 'vero tempore', 'Numquam vel impedit officiis in sed.', 'indica', '8', '4', '4', '9', '8', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 504, 5, 'temporibus culpa', 'Officia labore dignissimos facere.', 'indica', '3', '6', '7', '3', '3', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 505, 5, 'reiciendis dolorum', 'Blanditiis inventore officia eius sunt quod.', 'indica', '6', '9', '5', '1', '4', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 506, 9, 'placeat dicta', 'Incidunt labore aut eveniet explicabo quia sunt.', 'indica', '4', '4', '1', '4', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(8, 507, 8, 'nesciunt est', 'Voluptas et est libero non ratione ducimus ut.', 'indica', '7', '1', '7', '8', '2', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 508, 2, 'voluptatem illum', 'Provident velit sed similique sit deleniti ad.', 'indica', '7', '6', '9', '4', '2', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 509, 3, 'iure quaerat', 'Recusandae sunt saepe et qui aut.', 'indica', '7', '9', '8', '6', '7', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 510, 3, 'dolore eum', 'Non est saepe sed repudiandae sed omnis.', 'indica', '1', '6', '3', '5', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(3, 511, 8, 'provident veniam', 'Dolorem nobis et explicabo iste.', 'indica', '4', '8', '8', '6', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(5, 512, 1, 'libero repudiandae', 'Temporibus accusantium nobis tempora possimus in.', 'indica', '4', '4', '8', '1', '5', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(5, 513, 2, 'numquam dolor', 'Ut omnis autem iure. Quos deleniti vero velit a.', 'indica', '6', '1', '1', '3', '8', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 514, 2, 'cupiditate praesentium', 'Ut velit non non facere libero.', 'indica', '8', '3', '2', '9', '9', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 515, 4, 'fugit et', 'Dolore qui et voluptates ab est eius modi hic.', 'indica', '6', '6', '5', '1', '2', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(1, 516, 9, 'cum minus', 'Qui et ut expedita sunt omnis doloremque.', 'indica', '9', '5', '6', '1', '3', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(6, 517, 4, 'similique sunt', 'Libero itaque velit dolores dicta.', 'indica', '5', '5', '8', '1', '8', '2020-01-10 20:24:31', '2020-01-10 20:24:31'),
(9, 518, 4, 'modi sed', 'Qui quia fugiat maxime aut praesentium.', 'indica', '9', '1', '2', '2', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 519, 9, 'eos dolores', 'Ut veritatis error iste itaque aliquid.', 'indica', '9', '5', '9', '3', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 520, 7, 'quo ut', 'Expedita sint aut numquam repellendus aliquid.', 'indica', '2', '3', '2', '8', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 521, 3, 'ut alias', 'Molestiae ea fugiat fugit.', 'indica', '2', '7', '1', '7', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 522, 3, 'et ducimus', 'Sed eum id velit optio et assumenda.', 'indica', '6', '4', '1', '6', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 523, 5, 'quia illum', 'Quo aut placeat aliquid.', 'indica', '3', '1', '4', '7', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 524, 3, 'repellat et', 'Recusandae molestiae sed et veritatis molestias.', 'indica', '8', '2', '8', '5', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 525, 1, 'voluptatibus sed', 'Et vel ullam sed error voluptatem provident.', 'indica', '4', '5', '8', '1', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 526, 2, 'id natus', 'Et sit rerum ratione assumenda nobis.', 'indica', '3', '3', '2', '2', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 527, 1, 'eum vel', 'Hic nostrum possimus rem quis.', 'indica', '9', '3', '2', '1', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 528, 2, 'deserunt ut', 'Qui minus maxime eligendi sunt.', 'indica', '9', '3', '6', '9', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 529, 9, 'consequatur sed', 'Dolorem saepe dolores rerum error.', 'indica', '5', '5', '9', '7', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 530, 5, 'optio alias', 'Perferendis veritatis qui consequatur.', 'indica', '9', '6', '2', '6', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 531, 8, 'ad accusamus', 'Sint deleniti saepe nostrum voluptates illo.', 'indica', '8', '4', '2', '2', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 532, 4, 'perferendis earum', 'Iure rerum sunt est provident quam et.', 'indica', '3', '8', '2', '2', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 533, 4, 'aliquam optio', 'Animi laudantium eaque corrupti facilis ut.', 'indica', '8', '6', '3', '9', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 534, 6, 'eum dolor', 'Numquam corporis magnam animi non ut.', 'indica', '2', '8', '2', '2', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 535, 7, 'odit pariatur', 'Iusto quam quos laudantium animi est.', 'indica', '8', '8', '2', '1', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 536, 2, 'non doloribus', 'Debitis similique dolorem id excepturi modi.', 'indica', '8', '3', '1', '2', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 537, 8, 'debitis sapiente', 'Labore aut culpa quam.', 'indica', '9', '4', '4', '8', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 538, 9, 'nihil qui', 'Et id velit saepe assumenda hic dolorem quaerat.', 'indica', '1', '1', '6', '1', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 539, 6, 'nihil itaque', 'Illo dolorem laborum illum.', 'indica', '4', '1', '4', '9', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 540, 2, 'quaerat natus', 'Omnis voluptatum laboriosam eius voluptatem.', 'indica', '6', '6', '2', '4', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 541, 6, 'ipsam itaque', 'Deserunt voluptas et aliquam delectus cumque.', 'indica', '3', '1', '6', '7', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 542, 7, 'blanditiis dolores', 'Facere et vel ipsa et sit amet.', 'indica', '8', '9', '6', '6', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 543, 6, 'debitis earum', 'Itaque nesciunt sed eaque ad harum est.', 'indica', '9', '2', '7', '7', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 544, 5, 'quibusdam sequi', 'Natus odio doloremque consequatur.', 'indica', '2', '9', '7', '4', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 545, 7, 'non a', 'Voluptatem voluptatem ut repellat culpa.', 'indica', '1', '5', '4', '7', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 546, 7, 'dolorem est', 'Et ut tempora ex placeat vero.', 'indica', '4', '6', '3', '6', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 547, 6, 'natus assumenda', 'A distinctio sit ut dolor non ratione sed.', 'indica', '1', '9', '4', '6', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 548, 5, 'qui minus', 'Voluptatum ut sint explicabo neque temporibus.', 'indica', '9', '9', '3', '6', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 549, 6, 'ratione eaque', 'Atque sed veritatis harum dolor.', 'indica', '9', '4', '9', '7', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 550, 1, 'tenetur amet', 'Eaque corporis velit adipisci a et.', 'indica', '4', '8', '1', '8', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 551, 6, 'culpa excepturi', 'Praesentium qui iste ut sint repudiandae magni.', 'indica', '1', '7', '5', '9', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 552, 4, 'incidunt aut', 'Quibusdam temporibus hic amet voluptatum.', 'indica', '3', '9', '6', '9', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 553, 4, 'iure earum', 'Qui eum beatae est consequatur.', 'indica', '2', '7', '9', '5', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 554, 8, 'eos molestias', 'Earum eos natus delectus omnis mollitia quidem.', 'indica', '8', '4', '5', '1', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 555, 7, 'mollitia sit', 'Enim et voluptatibus odio.', 'indica', '8', '7', '2', '4', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 556, 7, 'nostrum quis', 'Cum amet consequatur et.', 'indica', '2', '4', '2', '6', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 557, 1, 'sit est', 'Tempore non fugiat optio.', 'indica', '3', '9', '5', '7', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 558, 4, 'sequi dicta', 'Quis molestiae harum harum repellat.', 'indica', '2', '7', '9', '2', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 559, 5, 'voluptas quia', 'Consequatur vitae fugit itaque.', 'indica', '2', '3', '9', '5', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 560, 2, 'molestiae voluptatem', 'Ipsam quis error quibusdam sit ut sit.', 'indica', '6', '7', '7', '2', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 561, 2, 'natus dolor', 'Deserunt mollitia molestiae quaerat animi.', 'indica', '9', '3', '7', '2', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 562, 7, 'dolorem sit', 'Reprehenderit ab voluptatum quia et.', 'indica', '5', '6', '8', '3', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 563, 6, 'doloribus consequuntur', 'Rerum explicabo illo pariatur voluptates.', 'indica', '7', '3', '6', '7', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 564, 4, 'id ratione', 'Dolore quis sunt tenetur adipisci alias cumque.', 'indica', '2', '7', '1', '2', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 565, 4, 'unde velit', 'Temporibus sunt nesciunt soluta.', 'indica', '2', '8', '7', '1', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 566, 2, 'corrupti et', 'Non eligendi voluptas adipisci voluptas.', 'indica', '1', '5', '9', '8', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 567, 3, 'totam quia', 'Consequatur quo aut quod ipsam et nihil et.', 'indica', '6', '6', '5', '4', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 568, 9, 'repellat quia', 'Nihil est et quia dolore neque sed.', 'indica', '1', '4', '3', '7', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 569, 5, 'excepturi dignissimos', 'Corporis corporis ut tempore unde dolores et.', 'indica', '9', '9', '4', '8', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 570, 4, 'doloribus fuga', 'Odio laudantium commodi sed dolores.', 'indica', '3', '6', '8', '2', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 571, 5, 'placeat vel', 'Saepe tempore itaque sed quia eum esse quia.', 'indica', '6', '9', '7', '5', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 572, 7, 'animi qui', 'Recusandae sit unde vero.', 'indica', '6', '6', '8', '5', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 573, 5, 'ut eum', 'Necessitatibus quia nihil laborum delectus.', 'indica', '3', '4', '9', '7', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 574, 9, 'ut necessitatibus', 'Autem necessitatibus sequi ratione qui velit.', 'indica', '3', '6', '8', '2', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 575, 3, 'corporis est', 'Quisquam velit officia sint sit dolores et illo.', 'indica', '8', '9', '4', '7', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 576, 9, 'aliquam sint', 'Facere dolor ut minus blanditiis nisi.', 'indica', '1', '7', '5', '2', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 577, 5, 'culpa id', 'Qui minima laboriosam aut velit error fuga.', 'indica', '2', '3', '4', '2', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 578, 3, 'modi quia', 'Et sed in rerum officiis sequi. Qui et quos iste.', 'indica', '6', '1', '4', '4', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 579, 1, 'animi delectus', 'Nostrum magni vero vero necessitatibus enim.', 'indica', '7', '7', '9', '6', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 580, 8, 'corporis consectetur', 'Magni provident perspiciatis est et dolorem.', 'indica', '1', '8', '4', '2', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 581, 9, 'rerum recusandae', 'In consequatur aut aut non.', 'indica', '3', '1', '6', '9', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 582, 6, 'maiores rem', 'Non illo velit atque modi voluptas sit culpa ut.', 'indica', '8', '5', '4', '9', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 583, 7, 'et eligendi', 'Amet voluptatem mollitia officia aut.', 'indica', '6', '5', '6', '3', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 584, 5, 'dicta voluptatem', 'Aperiam suscipit velit vel a rerum omnis.', 'indica', '5', '3', '1', '2', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 585, 1, 'dolorem consequatur', 'Autem eligendi ab quia deleniti.', 'indica', '7', '7', '4', '4', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 586, 8, 'porro quibusdam', 'Blanditiis vel odit est consectetur id et et.', 'indica', '1', '2', '4', '3', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 587, 6, 'fugit fugiat', 'Qui distinctio ipsum eaque soluta doloribus.', 'indica', '4', '5', '7', '2', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 588, 5, 'doloremque aperiam', 'In enim sed excepturi sunt.', 'indica', '8', '2', '5', '6', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 589, 9, 'quia et', 'Nulla id temporibus eaque nam quia aut.', 'indica', '4', '7', '6', '9', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 590, 8, 'animi est', 'Voluptatem ullam cupiditate eveniet perferendis.', 'indica', '5', '5', '4', '2', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 591, 2, 'eligendi possimus', 'Qui omnis a soluta dolorem.', 'indica', '8', '3', '5', '9', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 592, 3, 'laborum asperiores', 'Exercitationem sed sunt corporis perspiciatis.', 'indica', '6', '8', '4', '6', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 593, 3, 'quia repellendus', 'Vitae rerum aut nihil.', 'indica', '2', '5', '6', '1', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 594, 6, 'aspernatur quisquam', 'Adipisci quos magnam nemo rerum magnam.', 'indica', '9', '5', '9', '3', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 595, 7, 'aut minima', 'Corrupti velit nobis quos officia qui hic rerum.', 'indica', '7', '5', '2', '7', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 596, 7, 'iure ratione', 'Neque eos reiciendis sit aut.', 'indica', '3', '2', '7', '2', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 597, 4, 'ipsa dolorum', 'Eum rerum ut id ipsum.', 'indica', '3', '7', '9', '2', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 598, 9, 'sit accusamus', 'Est dolores rerum laudantium.', 'indica', '5', '8', '8', '9', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 599, 3, 'magnam totam', 'Rerum harum expedita repellendus quasi.', 'indica', '4', '4', '9', '6', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 600, 9, 'explicabo corporis', 'Quis consectetur et eos ut.', 'indica', '9', '3', '1', '1', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 601, 8, 'voluptas saepe', 'Tenetur quia earum qui eum repudiandae.', 'indica', '1', '5', '2', '2', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 602, 3, 'placeat amet', 'Ad cumque accusantium fugit facere tempora.', 'indica', '2', '2', '6', '5', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 603, 3, 'beatae consequatur', 'Est dolores ea quibusdam possimus.', 'indica', '8', '7', '6', '7', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 604, 9, 'velit optio', 'Adipisci voluptas aperiam ut dolores quis.', 'indica', '2', '3', '7', '2', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 605, 9, 'natus itaque', 'Pariatur sunt dolorem aliquid vel.', 'indica', '2', '9', '2', '1', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 606, 3, 'est qui', 'Saepe voluptas hic accusantium quas.', 'indica', '1', '3', '7', '9', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 607, 1, 'perferendis omnis', 'Ut velit mollitia eum et reiciendis nesciunt.', 'indica', '7', '2', '6', '3', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 608, 5, 'sed error', 'Officiis ut est id voluptatum id rerum.', 'indica', '9', '1', '4', '6', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 609, 9, 'aspernatur voluptatem', 'Quae dignissimos cumque quas commodi alias omnis.', 'indica', '6', '2', '2', '2', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 610, 3, 'sint totam', 'Doloremque aliquid laboriosam et esse enim in.', 'indica', '9', '4', '2', '9', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 611, 2, 'unde voluptate', 'Sunt eum natus minima a.', 'indica', '4', '9', '9', '9', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 612, 9, 'neque voluptatum', 'Rem itaque quis voluptas asperiores.', 'indica', '2', '2', '8', '4', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 613, 4, 'quaerat numquam', 'Adipisci placeat et dolores et sint.', 'indica', '4', '9', '6', '8', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 614, 6, 'maiores non', 'Quia culpa veritatis dolor in quidem et facere.', 'indica', '8', '3', '1', '9', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 615, 6, 'nesciunt culpa', 'Cumque est et consequatur eum dicta quia.', 'indica', '3', '8', '6', '8', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 616, 5, 'voluptates aliquam', 'Incidunt praesentium commodi possimus labore id.', 'indica', '3', '7', '9', '3', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 617, 9, 'eos similique', 'Ad et minus veniam neque recusandae quia.', 'indica', '6', '5', '5', '7', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 618, 2, 'qui quia', 'Quia ut necessitatibus non et eum necessitatibus.', 'indica', '8', '8', '7', '8', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 619, 8, 'quis et', 'Sint doloribus aut dolores et ad aut dicta.', 'indica', '6', '7', '6', '7', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 620, 9, 'nihil dicta', 'Unde molestiae aut voluptatem non aut.', 'indica', '9', '4', '8', '5', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 621, 5, 'accusamus eum', 'Et quos sed id.', 'indica', '4', '7', '2', '3', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 622, 3, 'qui consequatur', 'Occaecati non suscipit libero.', 'indica', '3', '7', '4', '4', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 623, 1, 'perspiciatis ut', 'Cum earum rem commodi officiis beatae quam.', 'indica', '1', '7', '3', '1', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 624, 8, 'quo veritatis', 'Voluptatem fugit pariatur sequi numquam omnis.', 'indica', '8', '9', '8', '9', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 625, 6, 'cum omnis', 'Vel voluptates nihil sed neque ut.', 'indica', '4', '1', '1', '6', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 626, 5, 'ab iste', 'Laborum eveniet quia iste.', 'indica', '3', '4', '1', '2', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 627, 5, 'eum odio', 'Quas ab et voluptatem ullam incidunt rem.', 'indica', '1', '9', '9', '9', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 628, 8, 'doloremque corrupti', 'Unde voluptate soluta voluptas facere iure qui.', 'indica', '6', '5', '4', '3', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 629, 8, 'molestiae consectetur', 'Unde eius tempore error vel accusamus blanditiis.', 'indica', '3', '4', '6', '2', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 630, 6, 'assumenda quo', 'Molestiae nostrum aut in optio dolor.', 'indica', '9', '1', '2', '8', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 631, 1, 'veritatis voluptate', 'Maiores voluptas ea atque illum at rerum.', 'indica', '7', '1', '3', '8', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 632, 2, 'sint id', 'Qui rerum recusandae optio est.', 'indica', '3', '7', '2', '1', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 633, 5, 'nam aut', 'Ut asperiores expedita sint sint aliquid.', 'indica', '7', '6', '8', '4', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 634, 2, 'eum ullam', 'Aut id et corrupti consequatur repellat.', 'indica', '4', '1', '7', '7', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 635, 7, 'mollitia aliquid', 'Repellat et excepturi non numquam eum.', 'indica', '6', '8', '4', '5', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 636, 6, 'neque voluptate', 'Sit cupiditate est repudiandae.', 'indica', '3', '4', '2', '2', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 637, 6, 'nostrum illum', 'Ratione qui eligendi cumque iste eum dignissimos.', 'indica', '2', '4', '1', '2', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 638, 9, 'velit molestias', 'Vel doloribus nam quas et sed nostrum sequi.', 'indica', '9', '8', '1', '7', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 639, 5, 'officiis vel', 'Voluptates et ab laborum.', 'indica', '9', '3', '3', '6', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 640, 1, 'quis ipsam', 'Molestiae dignissimos dignissimos sunt cum.', 'indica', '1', '6', '3', '7', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 641, 1, 'accusantium ipsum', 'Dolore omnis delectus est omnis dolor reiciendis.', 'indica', '7', '8', '7', '4', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 642, 3, 'magnam est', 'Omnis ea eos nisi porro.', 'indica', '2', '8', '8', '1', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 643, 5, 'aliquid optio', 'Aut sed veniam aut eos doloremque.', 'indica', '8', '9', '6', '4', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 644, 6, 'omnis odio', 'Animi molestiae ut et molestiae et nisi.', 'indica', '4', '4', '5', '5', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 645, 7, 'qui aut', 'Dolor sit cum laborum.', 'indica', '5', '8', '5', '5', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 646, 5, 'quod asperiores', 'Ducimus ipsam dolor et fuga.', 'indica', '5', '9', '4', '1', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 647, 9, 'quis temporibus', 'Ratione alias sunt est molestias.', 'indica', '2', '8', '1', '2', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 648, 6, 'nostrum dolore', 'Enim commodi qui qui maiores alias ipsa.', 'indica', '9', '9', '6', '2', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 649, 4, 'repellendus repellat', 'Culpa dolorem qui error inventore vel quia.', 'indica', '6', '9', '7', '5', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 650, 8, 'quasi accusamus', 'Aperiam eveniet dolorum at adipisci.', 'indica', '4', '5', '7', '8', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 651, 1, 'omnis quia', 'Pariatur soluta et est.', 'indica', '8', '2', '1', '4', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 652, 8, 'delectus culpa', 'Perferendis est nisi ipsa nihil.', 'indica', '1', '4', '6', '1', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 653, 8, 'quis voluptatem', 'Nisi sapiente ea eum dolorem dolor rerum cumque.', 'indica', '3', '6', '9', '4', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 654, 8, 'nisi odit', 'Ut qui at laudantium et.', 'indica', '3', '5', '8', '3', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 655, 9, 'assumenda rerum', 'Facilis quae at quis culpa qui et et.', 'indica', '6', '5', '1', '9', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 656, 4, 'illo voluptatem', 'Quos et fugit dicta ab.', 'indica', '9', '9', '6', '3', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 657, 1, 'unde inventore', 'Veritatis consequatur animi nemo laborum sed.', 'indica', '6', '2', '5', '8', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 658, 9, 'eligendi reiciendis', 'Consequatur facere exercitationem aut qui.', 'indica', '4', '2', '4', '7', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 659, 4, 'reprehenderit dolorum', 'Provident ad incidunt quo aperiam voluptas.', 'indica', '5', '1', '5', '3', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 660, 2, 'architecto sit', 'Deserunt laborum ea eius non.', 'indica', '5', '3', '4', '1', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 661, 4, 'ex ut', 'Sit tempora sint consequatur qui quo id.', 'indica', '7', '8', '6', '6', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 662, 4, 'alias maiores', 'Sapiente aut et at temporibus.', 'indica', '7', '5', '7', '7', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(1, 663, 2, 'quis expedita', 'Reprehenderit quisquam qui quae at.', 'indica', '4', '9', '3', '3', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 664, 9, 'vel debitis', 'Ut deleniti culpa sint a non animi sint voluptas.', 'indica', '2', '9', '5', '7', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32');
INSERT INTO `listing_items` (`user_id`, `id`, `listing_id`, `title`, `description`, `strain`, `price_per_gram`, `price_per_eigth`, `price_per_quarter`, `price_per_half`, `price_per_ounce`, `created_at`, `updated_at`) VALUES
(3, 665, 4, 'labore velit', 'Fugit voluptatibus ratione aliquid omnis et unde.', 'indica', '5', '4', '3', '6', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 666, 3, 'est incidunt', 'Earum voluptatem dolor et qui.', 'indica', '5', '5', '7', '7', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 667, 3, 'repellat perferendis', 'Voluptatum numquam laudantium dolorum.', 'indica', '6', '2', '1', '5', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 668, 8, 'recusandae harum', 'Aut eum et numquam impedit voluptas nihil.', 'indica', '5', '2', '5', '2', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 669, 5, 'non maiores', 'Sequi suscipit debitis qui quo autem.', 'indica', '3', '2', '7', '3', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 670, 3, 'veritatis blanditiis', 'Magni aliquid incidunt est minima dolor.', 'indica', '1', '6', '2', '1', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 671, 1, 'qui officiis', 'Rem inventore et doloremque quia aliquam et.', 'indica', '2', '4', '4', '5', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 672, 1, 'porro sit', 'Omnis optio ipsum cum ea enim nostrum porro esse.', 'indica', '8', '4', '6', '2', '8', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 673, 3, 'ratione dolorem', 'Unde mollitia maiores et alias rerum facere.', 'indica', '4', '2', '5', '5', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 674, 7, 'id quos', 'Ea tenetur incidunt officiis temporibus atque.', 'indica', '3', '9', '8', '8', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 675, 2, 'nobis quia', 'Magnam est delectus voluptas vel consequatur.', 'indica', '9', '9', '4', '6', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 676, 1, 'est quia', 'Impedit iusto est et hic voluptas.', 'indica', '2', '9', '6', '4', '3', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 677, 2, 'aut repudiandae', 'Eum ad pariatur ea expedita cum.', 'indica', '7', '1', '4', '1', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 678, 5, 'aut voluptate', 'Vel aliquam saepe et aut nisi omnis et.', 'indica', '9', '4', '2', '2', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(2, 679, 4, 'tenetur suscipit', 'Ratione repellat corrupti ullam et.', 'indica', '6', '8', '5', '3', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(3, 680, 1, 'ea sapiente', 'A eum aspernatur blanditiis rerum quia deserunt.', 'indica', '3', '1', '8', '1', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 681, 8, 'qui fugiat', 'Autem nemo aut recusandae.', 'indica', '3', '6', '7', '2', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 682, 8, 'sapiente fuga', 'Enim pariatur optio corporis blanditiis.', 'indica', '2', '5', '7', '2', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 683, 5, 'et praesentium', 'Et facere a facilis.', 'indica', '6', '4', '9', '2', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 684, 1, 'neque est', 'Earum fuga et fugit et omnis.', 'indica', '4', '9', '5', '8', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 685, 4, 'quod voluptate', 'Magnam at quo animi expedita ducimus.', 'indica', '4', '4', '5', '6', '2', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(4, 686, 6, 'iure nisi', 'Qui tenetur adipisci et.', 'indica', '9', '7', '7', '5', '6', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(7, 687, 4, 'temporibus aut', 'Hic rerum ut est voluptates.', 'indica', '4', '4', '5', '2', '4', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 688, 6, 'id odio', 'Sit quisquam optio dolores et aut laborum.', 'indica', '2', '1', '9', '7', '1', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(8, 689, 9, 'quis nesciunt', 'Voluptas et porro sint temporibus.', 'indica', '2', '5', '3', '7', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 690, 6, 'quisquam qui', 'Eaque corrupti nulla repudiandae consequuntur.', 'indica', '3', '7', '4', '4', '9', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(6, 691, 6, 'soluta dolorem', 'Sunt deserunt consequatur sunt.', 'indica', '2', '6', '7', '6', '7', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(9, 692, 6, 'voluptatem voluptatem', 'Adipisci adipisci debitis sequi consequatur.', 'indica', '7', '5', '8', '3', '5', '2020-01-10 20:24:32', '2020-01-10 20:24:32'),
(5, 693, 8, 'ducimus quos', 'Dolores possimus unde numquam numquam numquam.', 'indica', '1', '8', '8', '4', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 694, 2, 'eligendi est', 'Corrupti amet qui velit et.', 'indica', '1', '2', '3', '6', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 695, 7, 'architecto porro', 'Sed eum et cum et.', 'indica', '1', '2', '4', '7', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 696, 9, 'ratione voluptatem', 'Quia assumenda sint dolorum exercitationem.', 'indica', '7', '9', '1', '3', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 697, 6, 'dolores eos', 'Est harum eum officiis eius sit.', 'indica', '1', '7', '1', '4', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(4, 698, 9, 'maiores et', 'Optio ullam iste nam sint nihil voluptas.', 'indica', '6', '3', '6', '7', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 699, 9, 'omnis dolores', 'Qui consectetur exercitationem qui beatae.', 'indica', '7', '9', '4', '4', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 700, 1, 'aliquid ipsam', 'Repellat dignissimos aut porro rerum.', 'indica', '2', '1', '4', '5', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 701, 4, 'officia corrupti', 'Repellendus qui quisquam atque qui quo.', 'indica', '9', '9', '9', '3', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 702, 9, 'quia atque', 'Eos et aut aut et sit.', 'indica', '9', '9', '2', '8', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 703, 9, 'est omnis', 'Sunt nemo id ut quibusdam architecto ut incidunt.', 'indica', '4', '4', '9', '5', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 704, 5, 'atque animi', 'Sit consequatur qui cumque.', 'indica', '3', '7', '1', '4', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 705, 9, 'porro deleniti', 'Ducimus sint laboriosam tempore voluptate.', 'indica', '8', '2', '6', '2', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 706, 4, 'nihil corporis', 'Fugit porro facere illum aspernatur.', 'indica', '4', '3', '7', '2', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 707, 6, 'laborum ullam', 'Vel sit dolore officia omnis aut quo odio.', 'indica', '3', '6', '8', '8', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 708, 4, 'facilis sint', 'Veritatis velit autem qui consequatur laborum.', 'indica', '6', '5', '9', '5', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 709, 6, 'sed quam', 'Optio perferendis unde fugiat id occaecati nihil.', 'indica', '7', '6', '6', '8', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(4, 710, 5, 'recusandae ut', 'Et ratione nulla sunt debitis.', 'indica', '1', '5', '8', '1', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 711, 9, 'dicta nulla', 'Minima voluptatibus ut nulla.', 'indica', '6', '9', '1', '3', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(4, 712, 5, 'at harum', 'Voluptatibus sed non adipisci.', 'indica', '4', '8', '7', '2', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 713, 6, 'cupiditate id', 'Tenetur sequi nihil occaecati qui dolorem.', 'indica', '4', '2', '4', '4', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 714, 9, 'cupiditate harum', 'Nihil at id minima ullam.', 'indica', '1', '1', '9', '1', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(4, 715, 2, 'soluta a', 'Aut nulla nobis et veniam tenetur voluptas.', 'indica', '5', '1', '2', '9', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 716, 9, 'in sit', 'Mollitia quisquam omnis facilis.', 'indica', '3', '2', '2', '7', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(4, 717, 5, 'iste ex', 'Dolor facere atque et reiciendis et unde.', 'indica', '3', '9', '1', '3', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 718, 8, 'culpa nulla', 'Beatae vel soluta ducimus minima sint.', 'indica', '5', '3', '8', '4', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 719, 1, 'illum autem', 'Excepturi qui expedita et error eaque.', 'indica', '9', '9', '1', '2', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 720, 5, 'et dignissimos', 'Possimus veritatis aut maxime sit odio veniam.', 'indica', '1', '8', '2', '3', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 721, 1, 'illum dolores', 'Enim voluptatum vel et hic quia qui nostrum.', 'indica', '9', '3', '2', '2', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 722, 8, 'in dolor', 'Reiciendis ratione quo mollitia dolor excepturi.', 'indica', '2', '5', '5', '1', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 723, 9, 'aut praesentium', 'Ea est qui laborum aut omnis aut.', 'indica', '3', '1', '1', '7', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 724, 3, 'non ad', 'Ducimus ducimus optio et et quisquam.', 'indica', '9', '3', '9', '4', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 725, 8, 'alias dolores', 'Porro vero est cum.', 'indica', '7', '3', '8', '6', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(4, 726, 6, 'quia ut', 'Tempora non aut facilis cumque animi officia.', 'indica', '8', '5', '7', '4', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 727, 6, 'eum occaecati', 'Labore nisi iure dolores ex cumque pariatur.', 'indica', '7', '2', '9', '5', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 728, 4, 'voluptatem sapiente', 'Expedita aut quidem est quo veniam mollitia.', 'indica', '8', '7', '2', '4', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 729, 2, 'sit accusantium', 'Occaecati quo quia rerum.', 'indica', '7', '6', '1', '3', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 730, 7, 'perferendis quis', 'Aut tenetur quis molestias hic aspernatur hic.', 'indica', '1', '8', '2', '2', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 731, 6, 'inventore quo', 'Reprehenderit ipsam temporibus dolor dolore.', 'indica', '1', '8', '3', '7', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 732, 5, 'officia provident', 'Odio in in eum ipsam quia.', 'indica', '7', '6', '9', '2', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 733, 4, 'cupiditate aut', 'Quia et praesentium dolorum.', 'indica', '8', '9', '6', '4', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 734, 9, 'numquam aliquid', 'Aut ab odit autem ipsam sint sint rem.', 'indica', '5', '8', '7', '7', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(4, 735, 9, 'cumque error', 'Quia voluptatem ipsam sint placeat nihil rerum.', 'indica', '1', '6', '1', '7', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 736, 6, 'explicabo consequatur', 'Saepe consequatur optio reiciendis et.', 'indica', '7', '8', '8', '8', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 737, 2, 'illo tempore', 'Necessitatibus ut et sit amet maxime laboriosam.', 'indica', '3', '3', '9', '5', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 738, 9, 'dolore vitae', 'Sed cumque nisi sint maxime quos tempora.', 'indica', '4', '6', '4', '4', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 739, 9, 'qui nam', 'Quasi enim consequatur delectus sapiente vitae.', 'indica', '7', '1', '5', '5', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 740, 7, 'qui omnis', 'Illo doloribus et maiores.', 'indica', '4', '3', '8', '8', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 741, 8, 'qui mollitia', 'Est eum et eaque placeat dignissimos aut.', 'indica', '3', '5', '4', '4', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 742, 6, 'voluptas amet', 'Omnis aperiam enim ut aspernatur earum autem.', 'indica', '9', '8', '3', '2', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 743, 4, 'placeat nesciunt', 'Commodi minus eos non sint soluta ut et.', 'indica', '3', '4', '6', '3', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 744, 1, 'dolores labore', 'Itaque eum tenetur vero ut odit distinctio.', 'indica', '5', '7', '9', '3', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 745, 3, 'voluptates voluptatum', 'Aut aut ad aut consequatur placeat.', 'indica', '9', '9', '3', '6', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 746, 2, 'totam fugit', 'Voluptatibus alias ipsum esse aliquam qui.', 'indica', '2', '2', '2', '2', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 747, 6, 'aut dignissimos', 'Et non officia voluptatibus et aut.', 'indica', '1', '8', '2', '6', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 748, 4, 'itaque earum', 'Et voluptas et veritatis qui eum.', 'indica', '7', '9', '7', '3', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 749, 3, 'reprehenderit rem', 'Sed rerum non harum non eligendi qui aut.', 'indica', '8', '7', '2', '5', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 750, 9, 'sint neque', 'Est itaque amet quos est.', 'indica', '3', '3', '5', '3', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 751, 7, 'optio numquam', 'Eos aperiam cupiditate aut dicta quisquam.', 'indica', '8', '9', '1', '2', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 752, 4, 'voluptas dolorum', 'Quis aliquid eos in.', 'indica', '4', '7', '2', '4', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 753, 3, 'unde minima', 'Libero ipsa sunt maiores molestias eveniet omnis.', 'indica', '5', '1', '5', '4', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 754, 5, 'rerum quam', 'Nulla quibusdam molestiae aliquam.', 'indica', '4', '9', '8', '6', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 755, 8, 'voluptatum in', 'Omnis delectus quas dolorem ad.', 'indica', '2', '4', '8', '5', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 756, 2, 'laudantium exercitationem', 'Omnis maiores id sed libero.', 'indica', '9', '3', '5', '9', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 757, 3, 'facilis non', 'Totam autem ut sed labore porro quasi.', 'indica', '7', '3', '6', '5', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 758, 9, 'natus sint', 'Inventore tempore cum autem sint at rerum.', 'indica', '2', '9', '5', '5', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 759, 4, 'facilis ipsum', 'Rerum laborum assumenda rerum aut.', 'indica', '7', '9', '4', '2', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 760, 5, 'voluptates consequatur', 'Vel ipsam minus repudiandae tempora officiis.', 'indica', '5', '2', '8', '6', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(4, 761, 4, 'facilis quis', 'Et cum vel soluta fugit iste.', 'indica', '6', '3', '2', '2', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(4, 762, 3, 'accusamus fuga', 'Qui quod quibusdam nihil.', 'indica', '5', '7', '4', '1', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 763, 9, 'voluptatem aut', 'Voluptatem quod et culpa illum quia.', 'indica', '7', '8', '6', '1', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 764, 3, 'voluptas voluptas', 'Perspiciatis rerum totam voluptas.', 'indica', '8', '6', '1', '6', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 765, 9, 'quasi distinctio', 'Ad et praesentium qui eaque reiciendis quo et.', 'indica', '2', '4', '4', '2', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 766, 8, 'voluptatum asperiores', 'Repellendus eius tempora reiciendis dignissimos.', 'indica', '7', '9', '1', '2', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 767, 2, 'voluptatem alias', 'Quis nihil eos unde qui eaque.', 'indica', '4', '4', '7', '8', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 768, 7, 'debitis voluptas', 'Et enim occaecati occaecati officiis.', 'indica', '5', '8', '1', '7', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 769, 6, 'magnam fugiat', 'Et beatae quaerat animi illo aliquid quia.', 'indica', '8', '6', '2', '9', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 770, 9, 'accusantium recusandae', 'Velit eveniet omnis quia quidem rerum enim quis.', 'indica', '2', '2', '4', '5', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 771, 3, 'ut aut', 'Tempora et saepe sint nostrum.', 'indica', '3', '1', '1', '2', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 772, 1, 'ratione dignissimos', 'Ut laudantium eum et eaque in aliquam provident.', 'indica', '6', '9', '4', '1', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 773, 4, 'eos magnam', 'Distinctio itaque non non veritatis.', 'indica', '3', '6', '6', '8', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 774, 5, 'consequatur consequatur', 'Nostrum recusandae ut aliquid sunt.', 'indica', '7', '2', '8', '8', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 775, 4, 'et minus', 'Repellendus rerum occaecati ut quam qui.', 'indica', '5', '3', '6', '4', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 776, 1, 'unde iure', 'Ullam odio eos fugit doloremque.', 'indica', '4', '7', '8', '9', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 777, 6, 'voluptatem reprehenderit', 'Rerum id totam placeat et aliquid quae sed.', 'indica', '1', '1', '3', '5', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 778, 1, 'mollitia maiores', 'Sed ipsa expedita doloribus optio.', 'indica', '5', '8', '7', '2', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 779, 8, 'sint voluptatem', 'Adipisci repellat reiciendis odit minima quam.', 'indica', '9', '6', '8', '7', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 780, 4, 'pariatur qui', 'Nulla inventore fugiat atque velit esse.', 'indica', '8', '2', '3', '2', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 781, 2, 'cum nam', 'Et officiis minus porro velit sint.', 'indica', '6', '5', '8', '3', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 782, 2, 'voluptatibus veniam', 'Architecto magni perferendis et odio et.', 'indica', '1', '8', '8', '2', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 783, 3, 'et ut', 'Qui rerum rem veniam quae veritatis.', 'indica', '9', '6', '8', '6', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(4, 784, 5, 'omnis eius', 'Voluptatem libero porro laborum nihil.', 'indica', '2', '4', '7', '6', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 785, 8, 'consequatur maxime', 'Cumque quos natus facere et eos tempora.', 'indica', '7', '2', '2', '5', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 786, 5, 'in qui', 'Quis consequatur ullam eius quia facere officiis.', 'indica', '1', '8', '2', '4', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 787, 7, 'voluptas omnis', 'Dolorem rerum dolor eaque eos nam quia.', 'indica', '9', '2', '7', '2', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 788, 2, 'aliquam alias', 'Debitis voluptates ut ea quos eum.', 'indica', '1', '1', '6', '9', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(4, 789, 9, 'nostrum veniam', 'Esse laudantium necessitatibus repudiandae.', 'indica', '9', '5', '8', '1', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 790, 9, 'aliquid dolore', 'Impedit facere et natus nisi.', 'indica', '6', '3', '8', '8', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 791, 4, 'suscipit qui', 'Et occaecati quam saepe est labore.', 'indica', '2', '5', '5', '9', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 792, 3, 'repellendus nesciunt', 'Sit tempore sed cum laborum sed commodi ut.', 'indica', '7', '1', '1', '4', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 793, 8, 'aliquam illo', 'Et aut et voluptas quidem minima eius ipsam.', 'indica', '2', '9', '1', '5', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 794, 7, 'sint dolorem', 'Enim et est deserunt at id incidunt.', 'indica', '2', '9', '7', '3', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 795, 1, 'consequuntur tempore', 'Minus voluptate aut velit a neque.', 'indica', '2', '6', '5', '2', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 796, 4, 'harum molestiae', 'Ea numquam et dolor dicta.', 'indica', '3', '8', '9', '1', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 797, 2, 'quia sed', 'Quas eum qui voluptatem qui.', 'indica', '4', '8', '2', '5', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 798, 3, 'odit placeat', 'Corporis nihil qui iusto qui quae.', 'indica', '3', '5', '4', '1', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 799, 9, 'ipsum officia', 'Amet nemo impedit sapiente maiores in.', 'indica', '3', '1', '4', '8', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 800, 9, 'qui tempora', 'Quaerat ratione et quidem ut id voluptatum.', 'indica', '9', '3', '2', '7', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(4, 801, 7, 'ratione et', 'Blanditiis dolore est animi modi.', 'indica', '1', '9', '1', '2', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 802, 9, 'repellat eos', 'Dolores est inventore eum sunt.', 'indica', '2', '8', '3', '5', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 803, 7, 'culpa aliquid', 'Vel ullam in omnis.', 'indica', '9', '5', '3', '4', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 804, 7, 'sed voluptatem', 'Veniam dolorum fuga excepturi qui ullam neque.', 'indica', '6', '6', '5', '2', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 805, 1, 'nam veritatis', 'Aperiam voluptatem itaque corrupti eum.', 'indica', '1', '7', '4', '7', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 806, 4, 'voluptas voluptatem', 'Est in sunt aut beatae veniam doloremque.', 'indica', '7', '1', '4', '8', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 807, 1, 'sunt aperiam', 'Sed repudiandae ut distinctio dolorem autem.', 'indica', '4', '2', '1', '9', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 808, 8, 'porro eum', 'Itaque sint dolor ad dolor.', 'indica', '8', '7', '4', '3', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 809, 5, 'enim aut', 'Quas consectetur totam facere minus magni.', 'indica', '2', '6', '6', '9', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(4, 810, 2, 'necessitatibus repudiandae', 'Tempora fuga vero labore ratione expedita.', 'indica', '1', '2', '1', '6', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 811, 4, 'officia sequi', 'Eaque optio autem quo sed cum in.', 'indica', '6', '1', '7', '9', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 812, 6, 'aut non', 'Non expedita nemo sunt.', 'indica', '8', '5', '3', '9', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 813, 4, 'commodi cupiditate', 'Qui qui totam ut quis.', 'indica', '7', '5', '6', '1', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 814, 5, 'modi dicta', 'Perferendis tenetur voluptatem temporibus et.', 'indica', '5', '7', '4', '5', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 815, 7, 'et quibusdam', 'Voluptatum et aut assumenda.', 'indica', '6', '4', '7', '1', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 816, 1, 'sit excepturi', 'Qui nam esse deleniti veniam.', 'indica', '3', '1', '7', '2', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 817, 6, 'illum eos', 'Quaerat ea culpa optio ipsa ea.', 'indica', '6', '1', '5', '3', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 818, 9, 'doloremque ipsa', 'Cupiditate rerum aut omnis voluptatem est.', 'indica', '9', '7', '7', '1', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 819, 5, 'enim beatae', 'Vero rem qui deserunt quia non.', 'indica', '4', '8', '3', '1', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 820, 2, 'assumenda et', 'Impedit voluptatum architecto delectus.', 'indica', '4', '7', '1', '9', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 821, 5, 'in occaecati', 'Quia tempore et tempore sunt.', 'indica', '4', '2', '1', '4', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 822, 2, 'debitis qui', 'Recusandae eligendi at animi.', 'indica', '2', '1', '6', '4', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 823, 5, 'ipsum molestias', 'Deserunt mollitia voluptas cumque adipisci.', 'indica', '8', '8', '6', '3', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 824, 3, 'aut aut', 'Ut harum a nisi sequi.', 'indica', '1', '4', '3', '3', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 825, 8, 'perspiciatis sed', 'Rerum eum optio earum cum dicta libero.', 'indica', '5', '9', '9', '8', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 826, 8, 'eos dicta', 'Iure sed quae sint est velit.', 'indica', '3', '5', '1', '5', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 827, 7, 'tempore at', 'Quis magnam ut ut suscipit molestiae sed ut sed.', 'indica', '4', '4', '9', '2', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 828, 2, 'ea sunt', 'Laboriosam quibusdam nisi beatae.', 'indica', '4', '9', '2', '9', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 829, 9, 'aspernatur sint', 'Eveniet et odit quia voluptates qui quis enim.', 'indica', '2', '4', '2', '4', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 830, 9, 'quod et', 'Aut eum minima et ut natus voluptas adipisci.', 'indica', '7', '8', '9', '4', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 831, 9, 'nesciunt asperiores', 'Eaque accusantium tempora odit et.', 'indica', '6', '2', '5', '1', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 832, 5, 'quasi nesciunt', 'Culpa sed officiis ratione ut deserunt.', 'indica', '3', '9', '5', '3', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 833, 5, 'ea doloribus', 'Reiciendis aliquam animi explicabo voluptatem.', 'indica', '8', '4', '7', '4', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 834, 2, 'voluptates enim', 'Autem repudiandae veniam cum in.', 'indica', '1', '2', '7', '3', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 835, 7, 'perspiciatis vero', 'Praesentium cupiditate ut ut enim officiis.', 'indica', '2', '5', '8', '9', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 836, 1, 'corporis iure', 'Totam numquam impedit minus corrupti illum.', 'indica', '2', '5', '9', '8', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 837, 7, 'vitae reprehenderit', 'Et cum et magnam quisquam velit.', 'indica', '4', '4', '7', '4', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 838, 6, 'sint facere', 'Id magni ad fugiat est.', 'indica', '6', '1', '3', '9', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 839, 5, 'quaerat minima', 'Aliquid quia quam qui.', 'indica', '3', '1', '7', '8', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 840, 1, 'excepturi excepturi', 'Quae praesentium unde quasi.', 'indica', '9', '5', '8', '2', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 841, 9, 'voluptas tempore', 'Labore repellat vitae voluptatibus voluptatem.', 'indica', '9', '6', '8', '9', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 842, 1, 'nemo quae', 'Fugiat nulla eius enim in aut. Ut at aut ut hic.', 'indica', '1', '7', '8', '7', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 843, 1, 'laudantium nam', 'Aliquam optio similique distinctio aut corporis.', 'indica', '9', '1', '5', '4', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 844, 8, 'distinctio eum', 'Ut qui in atque et enim necessitatibus sint.', 'indica', '6', '6', '6', '1', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 845, 3, 'repellat hic', 'Deleniti soluta quia facere.', 'indica', '6', '1', '5', '7', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(4, 846, 7, 'voluptatem dolores', 'Et consequuntur aut et quam ipsum.', 'indica', '4', '6', '9', '2', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 847, 6, 'neque dolor', 'Ex voluptas quos ducimus et nisi omnis.', 'indica', '6', '3', '9', '7', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 848, 4, 'sequi est', 'Ipsum exercitationem occaecati est soluta.', 'indica', '7', '6', '8', '7', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 849, 7, 'quos officiis', 'Dolor rem quidem voluptatem illo molestias.', 'indica', '6', '9', '5', '3', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 850, 6, 'quia in', 'Debitis facere sit velit beatae aut.', 'indica', '7', '6', '4', '1', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 851, 7, 'libero perferendis', 'Possimus ipsa qui et ad et inventore.', 'indica', '2', '3', '2', '4', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 852, 4, 'ratione expedita', 'Non doloremque itaque ratione enim.', 'indica', '6', '1', '8', '7', '1', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 853, 7, 'molestiae aut', 'Cumque minus voluptates ut et.', 'indica', '3', '6', '7', '1', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 854, 7, 'in voluptatem', 'Atque qui eius quia dolore eos omnis id.', 'indica', '8', '5', '2', '5', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(2, 855, 3, 'perferendis ex', 'Ipsum aut optio qui soluta facilis.', 'indica', '6', '6', '5', '4', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 856, 7, 'quas rerum', 'A totam delectus nobis eaque beatae minus.', 'indica', '6', '4', '7', '4', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 857, 4, 'corrupti assumenda', 'Neque quasi ut fuga magnam.', 'indica', '5', '1', '5', '7', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 858, 1, 'labore animi', 'Nihil numquam deleniti ipsum qui quia vitae a.', 'indica', '5', '3', '5', '9', '5', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 859, 2, 'consectetur omnis', 'Porro incidunt vero quis.', 'indica', '6', '1', '1', '5', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 860, 7, 'consequatur non', 'Earum sapiente aliquam ab quia.', 'indica', '9', '3', '1', '5', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 861, 8, 'exercitationem officiis', 'Distinctio quo aut sint quas.', 'indica', '2', '8', '2', '7', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 862, 9, 'perspiciatis dolor', 'Corporis aut ab aperiam et et.', 'indica', '8', '9', '8', '3', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 863, 5, 'esse nisi', 'Nihil aut eligendi non minima.', 'indica', '2', '4', '3', '6', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 864, 2, 'voluptas ab', 'Et fugit exercitationem quae est et.', 'indica', '4', '9', '5', '3', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 865, 7, 'amet dolorum', 'Harum omnis ea et explicabo consequatur.', 'indica', '2', '2', '5', '5', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 866, 6, 'eveniet doloribus', 'Sed et dolor aut.', 'indica', '9', '9', '6', '9', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 867, 7, 'assumenda accusantium', 'Eos voluptas velit atque.', 'indica', '4', '6', '1', '3', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 868, 3, 'harum et', 'Est blanditiis esse quae provident assumenda.', 'indica', '7', '1', '7', '8', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 869, 4, 'quos magnam', 'Blanditiis voluptatem praesentium ut corporis.', 'indica', '6', '5', '4', '9', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(5, 870, 3, 'repellat voluptatem', 'Nemo iste minima dolores doloribus.', 'indica', '2', '6', '4', '6', '3', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(7, 871, 3, 'fuga ut', 'Dolores ad quo commodi laboriosam qui.', 'indica', '8', '8', '7', '5', '2', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 872, 1, 'voluptates inventore', 'Repellat quas magnam rerum sed veniam.', 'indica', '4', '9', '8', '9', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 873, 6, 'nesciunt nihil', 'Perspiciatis officiis nihil sed voluptatem.', 'indica', '7', '9', '4', '9', '7', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(6, 874, 6, 'deserunt dolor', 'Ea nesciunt omnis ut amet.', 'indica', '4', '6', '2', '8', '4', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(1, 875, 8, 'id debitis', 'Consequatur quod sit quae commodi.', 'indica', '2', '2', '9', '7', '8', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(3, 876, 6, 'accusantium sit', 'Sapiente quia deserunt et nobis maiores sit ipsa.', 'indica', '9', '7', '4', '3', '6', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(9, 877, 3, 'non fuga', 'Et rerum eveniet vitae qui.', 'indica', '9', '1', '3', '7', '9', '2020-01-10 20:24:33', '2020-01-10 20:24:33'),
(8, 878, 2, 'atque eum', 'Similique corrupti dolor enim.', 'indica', '5', '5', '9', '5', '6', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 879, 5, 'ut laboriosam', 'Delectus molestiae corrupti autem.', 'indica', '9', '5', '5', '1', '5', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(6, 880, 3, 'suscipit architecto', 'Quisquam laudantium qui dolores.', 'indica', '2', '4', '6', '9', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(8, 881, 7, 'ut non', 'Molestiae quisquam voluptatum est non maiores.', 'indica', '5', '8', '5', '5', '5', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(7, 882, 5, 'itaque voluptatem', 'Non soluta harum quos doloremque quibusdam.', 'indica', '8', '2', '8', '2', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(4, 883, 4, 'consectetur voluptatem', 'Consequatur voluptas eaque iusto dolores qui qui.', 'indica', '2', '9', '8', '6', '7', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(8, 884, 1, 'dolor minus', 'Accusamus voluptatibus commodi eum ut.', 'indica', '1', '2', '6', '9', '1', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(2, 885, 6, 'quaerat iure', 'Et et minus eaque expedita.', 'indica', '1', '3', '7', '4', '3', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 886, 5, 'omnis repudiandae', 'Nisi voluptas et quos aperiam.', 'indica', '6', '1', '6', '3', '3', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(9, 887, 7, 'rerum sequi', 'Ratione quis ea et maxime.', 'indica', '6', '9', '8', '4', '7', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(1, 888, 2, 'voluptatem id', 'Tenetur quod fuga optio libero aliquam et.', 'indica', '2', '8', '3', '6', '5', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(4, 889, 2, 'ab dicta', 'Ut debitis quia quia iure.', 'indica', '4', '1', '5', '5', '7', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(9, 890, 4, 'aut nihil', 'In saepe sequi autem.', 'indica', '4', '1', '5', '1', '1', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 891, 5, 'quod ipsa', 'Sunt possimus earum deleniti eos vitae eaque.', 'indica', '8', '2', '8', '3', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(7, 892, 1, 'et id', 'Cupiditate amet distinctio doloremque voluptate.', 'indica', '3', '4', '1', '5', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(7, 893, 2, 'iure doloremque', 'Aperiam nisi est praesentium laboriosam aperiam.', 'indica', '5', '7', '7', '5', '4', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(4, 894, 7, 'veritatis consequatur', 'Eius et vitae quo.', 'indica', '8', '1', '1', '6', '3', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(2, 895, 9, 'officia magni', 'Consequatur dolores sunt eum.', 'indica', '2', '6', '9', '9', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(9, 896, 5, 'architecto in', 'Quos dolorem quisquam est tenetur animi ut.', 'indica', '5', '3', '1', '9', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(8, 897, 7, 'consequatur suscipit', 'Est placeat earum similique aut tenetur ex.', 'indica', '8', '7', '5', '9', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(2, 898, 1, 'vero assumenda', 'Vel et aut ab.', 'indica', '9', '3', '5', '6', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(2, 899, 8, 'quas fugiat', 'Alias blanditiis et natus voluptatem.', 'indica', '1', '6', '6', '5', '7', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 900, 6, 'atque qui', 'Nesciunt consectetur sed id dolore qui.', 'indica', '2', '5', '6', '1', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(8, 901, 2, 'voluptatem qui', 'Maiores quasi ut qui ut debitis tempora.', 'indica', '4', '5', '8', '9', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(9, 902, 3, 'quia amet', 'Minima saepe veritatis veniam nobis ipsam.', 'indica', '1', '7', '2', '5', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(8, 903, 9, 'quas eius', 'Laudantium et eos nobis quaerat qui.', 'indica', '4', '2', '4', '3', '4', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 904, 5, 'et architecto', 'Dolorem et dolor asperiores omnis.', 'indica', '2', '3', '4', '6', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(8, 905, 6, 'voluptatibus aut', 'Animi ipsa perferendis ex ex aut.', 'indica', '5', '7', '1', '3', '1', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(9, 906, 6, 'consequatur et', 'Dolores tempora enim illo et praesentium.', 'indica', '6', '1', '7', '8', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 907, 1, 'quis voluptates', 'Itaque quia at nemo explicabo quia placeat.', 'indica', '1', '9', '1', '2', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(4, 908, 9, 'nihil est', 'Perspiciatis harum nulla iusto quam fugiat qui.', 'indica', '1', '5', '2', '5', '1', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(6, 909, 3, 'maiores perferendis', 'Dicta autem eaque adipisci.', 'indica', '3', '9', '2', '9', '1', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(7, 910, 8, 'dolores repudiandae', 'Itaque qui in et atque autem.', 'indica', '6', '1', '3', '2', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(2, 911, 5, 'consectetur qui', 'Enim deleniti qui et ut vel ab quibusdam.', 'indica', '9', '1', '3', '6', '4', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 912, 5, 'voluptas eaque', 'Ut et earum quia quidem.', 'indica', '2', '9', '4', '2', '6', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(7, 913, 7, 'dolorum rerum', 'Qui ipsam provident dolore est.', 'indica', '2', '9', '4', '9', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 914, 4, 'itaque atque', 'Eum quod nesciunt harum.', 'indica', '8', '9', '6', '9', '6', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 915, 6, 'eveniet voluptas', 'Minus vero praesentium alias nostrum odit iusto.', 'indica', '3', '7', '7', '5', '3', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 916, 3, 'amet laborum', 'Rerum provident autem et repellat quod inventore.', 'indica', '5', '4', '2', '8', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(7, 917, 8, 'dignissimos alias', 'Fugit dicta est rerum maiores ut harum officia.', 'indica', '1', '8', '6', '8', '6', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(2, 918, 4, 'minima odit', 'Minus voluptas necessitatibus veritatis.', 'indica', '7', '7', '6', '4', '1', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 919, 8, 'eum nihil', 'Sit dolorem qui aut illo sint.', 'indica', '9', '6', '1', '4', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 920, 9, 'eum ipsam', 'Vero ut vel ipsam iusto molestiae voluptatibus.', 'indica', '4', '5', '5', '1', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 921, 1, 'rerum consequatur', 'Placeat ea accusamus officia ut.', 'indica', '7', '2', '5', '2', '4', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 922, 4, 'odio animi', 'Vel iure iure saepe quidem facilis ut iusto.', 'indica', '1', '4', '5', '2', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(2, 923, 1, 'iste necessitatibus', 'Occaecati ut exercitationem et enim consequatur.', 'indica', '6', '2', '6', '7', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(2, 924, 4, 'et libero', 'Quis molestias adipisci dolor.', 'indica', '3', '6', '8', '5', '7', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(7, 925, 9, 'est autem', 'Excepturi ea est quaerat et ea.', 'indica', '5', '1', '7', '1', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(6, 926, 8, 'ullam beatae', 'Sint pariatur recusandae ut dicta.', 'indica', '6', '8', '1', '5', '5', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(9, 927, 3, 'maxime numquam', 'Et aspernatur architecto perferendis.', 'indica', '2', '3', '3', '2', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 928, 6, 'facilis itaque', 'Accusantium ipsam expedita et vero veritatis.', 'indica', '1', '1', '6', '2', '4', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 929, 1, 'non omnis', 'Quo iure at eaque aut nulla.', 'indica', '3', '7', '7', '4', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(4, 930, 8, 'consequatur voluptas', 'Laborum aut enim rerum dolores ad dolores qui.', 'indica', '7', '5', '9', '5', '7', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(7, 931, 9, 'sequi quia', 'Sequi sed debitis pariatur fuga.', 'indica', '4', '4', '1', '4', '3', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(1, 932, 8, 'aspernatur error', 'Odit dolorum culpa sit aut fugit numquam amet.', 'indica', '3', '8', '8', '6', '6', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(4, 933, 3, 'blanditiis molestiae', 'Accusamus odit illum nostrum.', 'indica', '3', '5', '7', '3', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 934, 4, 'corrupti dolore', 'Iste ut aut id doloremque.', 'indica', '7', '2', '7', '8', '4', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(6, 935, 5, 'dolore a', 'Sit eum sapiente in occaecati est cupiditate.', 'indica', '7', '1', '7', '4', '7', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 936, 3, 'accusantium animi', 'Iure rerum error aperiam itaque.', 'indica', '7', '1', '7', '8', '5', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(6, 937, 1, 'aut ut', 'Aut nostrum aspernatur eos quis velit.', 'indica', '5', '5', '5', '1', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(1, 938, 6, 'sed odit', 'Tenetur quia odit itaque consequatur non.', 'indica', '1', '7', '3', '3', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 939, 3, 'earum ut', 'Beatae quaerat consequatur error alias.', 'indica', '1', '8', '1', '1', '7', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 940, 3, 'id molestiae', 'Rerum voluptate omnis eius veritatis rerum.', 'indica', '8', '8', '5', '9', '4', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(6, 941, 3, 'corrupti harum', 'Illum magnam tempora voluptatem nulla dolores.', 'indica', '1', '9', '6', '4', '3', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(8, 942, 8, 'praesentium nulla', 'Exercitationem tempora et labore nihil.', 'indica', '6', '2', '4', '9', '7', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(6, 943, 7, 'ullam eveniet', 'Nihil adipisci voluptatibus nostrum ut.', 'indica', '4', '1', '1', '2', '6', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(6, 944, 3, 'quis doloribus', 'Nemo recusandae et et ducimus ut.', 'indica', '1', '9', '8', '1', '1', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(7, 945, 4, 'tempora blanditiis', 'Repellendus sunt sed commodi illo.', 'indica', '2', '4', '3', '3', '5', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 946, 5, 'quidem id', 'Qui exercitationem doloribus sit est.', 'indica', '4', '1', '2', '7', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 947, 8, 'voluptatum qui', 'Deleniti est libero aut.', 'indica', '2', '9', '9', '2', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 948, 1, 'et sunt', 'Inventore quasi earum accusantium alias.', 'indica', '6', '9', '5', '1', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(2, 949, 6, 'qui maxime', 'Reprehenderit omnis velit incidunt aut.', 'indica', '3', '3', '4', '4', '3', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 950, 2, 'alias consequatur', 'Sunt amet est quaerat.', 'indica', '7', '8', '7', '3', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(7, 951, 7, 'pariatur occaecati', 'Minima ut voluptatem explicabo ad et omnis.', 'indica', '3', '9', '8', '7', '1', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(9, 952, 3, 'nisi et', 'Ut qui est porro quos quibusdam praesentium.', 'indica', '6', '1', '3', '2', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(1, 953, 1, 'repellat harum', 'Quia iste qui sunt ipsam sunt et quos.', 'indica', '9', '7', '6', '2', '6', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(2, 954, 4, 'unde et', 'Ut laborum similique quis eum velit.', 'indica', '5', '6', '9', '3', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(8, 955, 5, 'velit porro', 'Officiis vel magni quis sed dicta.', 'indica', '3', '9', '6', '2', '5', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 956, 8, 'neque rem', 'Voluptate est qui modi quas.', 'indica', '7', '4', '6', '1', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(7, 957, 6, 'sunt officia', 'Nesciunt et aut dignissimos.', 'indica', '4', '3', '4', '6', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(9, 958, 3, 'deserunt alias', 'Qui quos officia perferendis aliquam fuga.', 'indica', '5', '5', '8', '6', '7', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(2, 959, 8, 'mollitia non', 'Natus maxime illo sequi voluptatum et sit quo.', 'indica', '2', '9', '7', '6', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(4, 960, 1, 'et molestiae', 'Quia rerum non quis dolor.', 'indica', '2', '7', '3', '6', '7', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(9, 961, 5, 'veritatis reiciendis', 'Magni quis distinctio quam sit sequi.', 'indica', '4', '4', '5', '9', '3', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 962, 2, 'voluptatum velit', 'Incidunt nemo molestias et illum porro ea ut.', 'indica', '9', '3', '8', '3', '1', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(6, 963, 9, 'non id', 'Beatae autem nisi quia consectetur sequi rerum.', 'indica', '2', '6', '3', '4', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 964, 4, 'libero totam', 'Repellat architecto quia aut consequatur.', 'indica', '6', '6', '2', '4', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 965, 3, 'harum provident', 'Debitis dolorem itaque explicabo dolorem.', 'indica', '9', '8', '1', '1', '5', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(7, 966, 7, 'modi excepturi', 'Omnis aut consectetur error sit totam et et.', 'indica', '8', '3', '6', '6', '7', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(8, 967, 1, 'dolor non', 'Eum consectetur aut et aut ut.', 'indica', '4', '2', '2', '4', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 968, 4, 'eum non', 'Totam qui a doloremque voluptate atque.', 'indica', '7', '9', '5', '9', '3', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(1, 969, 1, 'consectetur fuga', 'Quae maxime autem eligendi qui.', 'indica', '6', '9', '8', '3', '6', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(1, 970, 5, 'at iste', 'Ea ut sint in autem. Est quos ut repellendus.', 'indica', '3', '4', '3', '9', '7', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 971, 2, 'nesciunt architecto', 'Optio omnis reprehenderit laboriosam maxime.', 'indica', '8', '7', '6', '3', '1', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(1, 972, 7, 'beatae ut', 'Recusandae corporis itaque aliquid tempore earum.', 'indica', '3', '9', '4', '3', '3', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 973, 4, 'necessitatibus dolor', 'Nemo facilis ut et praesentium laborum.', 'indica', '5', '8', '1', '7', '6', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(9, 974, 1, 'omnis et', 'Unde earum aut dolores est id in deleniti.', 'indica', '2', '5', '7', '7', '5', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(6, 975, 8, 'in sunt', 'Ut corporis laudantium vero quia velit.', 'indica', '9', '3', '8', '7', '1', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(2, 976, 1, 'quam vero', 'Sed dolorum a omnis esse quos tenetur.', 'indica', '8', '4', '9', '9', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 977, 8, 'saepe non', 'Consequatur alias aperiam molestias est.', 'indica', '3', '9', '2', '5', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(7, 978, 9, 'ea doloremque', 'Ea autem velit quia qui hic.', 'indica', '4', '9', '6', '2', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(1, 979, 9, 'id autem', 'Eveniet cumque architecto aliquid quas dolore.', 'indica', '1', '6', '2', '2', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 980, 6, 'dolorem ex', 'Quis eius omnis vel ut vitae facilis.', 'indica', '7', '7', '9', '2', '3', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(8, 981, 6, 'sunt atque', 'Modi quidem ea facilis unde aliquid recusandae.', 'indica', '5', '2', '6', '6', '6', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(3, 982, 2, 'fugit esse', 'Molestias non et explicabo in ea.', 'indica', '1', '3', '7', '1', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 983, 1, 'quibusdam eos', 'Et error sit illo eos.', 'indica', '7', '6', '1', '6', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(6, 984, 4, 'ullam omnis', 'Assumenda minus autem id eum corrupti.', 'indica', '7', '6', '7', '5', '3', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(1, 985, 9, 'iusto non', 'Rem hic vitae velit itaque quod sunt provident.', 'indica', '1', '7', '8', '5', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(7, 986, 5, 'architecto possimus', 'Omnis quia rerum asperiores qui qui quasi.', 'indica', '7', '1', '5', '6', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(8, 987, 5, 'est asperiores', 'Consequuntur et et voluptatem.', 'indica', '3', '4', '8', '1', '6', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(2, 988, 9, 'est sunt', 'Ut quia laboriosam facere nobis et dolore.', 'indica', '7', '7', '8', '9', '3', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(4, 989, 6, 'quo temporibus', 'Aut voluptatum aspernatur quisquam ea laudantium.', 'indica', '6', '1', '6', '6', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(6, 990, 7, 'neque aut', 'Dolores quae enim delectus ea et autem hic aut.', 'indica', '4', '3', '4', '6', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(1, 991, 8, 'est nihil', 'Commodi iure ut incidunt eligendi assumenda eum.', 'indica', '3', '3', '5', '7', '4', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(8, 992, 4, 'velit nam', 'Ut ut reiciendis cumque qui.', 'indica', '7', '1', '7', '3', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(9, 993, 5, 'pariatur voluptatem', 'Et dolores voluptatibus ad consequuntur vero.', 'indica', '4', '6', '8', '6', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(9, 994, 7, 'sit ut', 'Eum in qui necessitatibus quod consequatur vel.', 'indica', '5', '7', '9', '9', '1', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(2, 995, 5, 'quibusdam nihil', 'Sed natus sunt assumenda.', 'indica', '2', '9', '3', '4', '7', '2020-01-10 20:24:34', '2020-01-10 20:24:34');
INSERT INTO `listing_items` (`user_id`, `id`, `listing_id`, `title`, `description`, `strain`, `price_per_gram`, `price_per_eigth`, `price_per_quarter`, `price_per_half`, `price_per_ounce`, `created_at`, `updated_at`) VALUES
(5, 996, 1, 'fuga molestias', 'Praesentium cumque nam omnis amet facere.', 'indica', '4', '6', '4', '6', '8', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(9, 997, 3, 'delectus quia', 'Fugit nihil blanditiis dolorem.', 'indica', '4', '7', '4', '9', '4', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(4, 998, 1, 'rem dolores', 'Fuga soluta libero totam delectus quam.', 'indica', '3', '8', '6', '6', '2', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(6, 999, 9, 'eum excepturi', 'Velit mollitia veritatis excepturi et ut ratione.', 'indica', '9', '8', '2', '5', '9', '2020-01-10 20:24:34', '2020-01-10 20:24:34'),
(5, 1000, 2, 'nemo perspiciatis', 'Dolorum molestias esse quod est incidunt.', 'indica', '6', '7', '2', '9', '3', '2020-01-10 20:24:34', '2020-01-10 20:24:34');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `chat_room_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_02_15_204651_create_categories_table', 1),
(7, '2016_02_16_000000_create_posts_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(12, '2016_06_01_000004_create_oauth_clients_table', 1),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(14, '2016_10_21_190000_create_roles_table', 1),
(15, '2016_10_21_190000_create_settings_table', 1),
(16, '2016_11_30_135954_create_permission_table', 1),
(17, '2016_11_30_141208_create_permission_role_table', 1),
(18, '2016_12_26_201236_data_types__add__server_side', 1),
(19, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(20, '2017_01_14_005015_create_translations_table', 1),
(21, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(22, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(23, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(24, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(25, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(26, '2017_08_05_000000_add_group_to_settings_table', 1),
(27, '2017_11_26_013050_add_user_role_relationship', 1),
(28, '2017_11_26_015000_create_user_roles_table', 1),
(29, '2018_01_18_143226_create_listings_table', 1),
(30, '2018_03_11_000000_add_user_settings', 1),
(31, '2018_03_14_000000_add_details_to_data_types_table', 1),
(32, '2018_03_16_000000_make_settings_value_nullable', 1),
(33, '2019_08_11_010116_create_listing_items_table', 1),
(34, '2019_12_19_153058_create_comments_table', 1),
(35, '2019_12_26_090151_create_messages_table', 1),
(36, '2020_01_10_121914_create_receivers_table', 1),
(37, '2020_01_10_122150_create_chat_rooms_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receivers`
--

CREATE TABLE `receivers` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `details` text COLLATE utf8_unicode_ci,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `saved` text COLLATE utf8_unicode_ci,
  `friends` text COLLATE utf8_unicode_ci,
  `chats` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `user_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `saved`, `friends`, `chats`) VALUES
(1, NULL, '1', 'Jane Smith', 'test@gmail.com', 'users/default.png', NULL, '$2y$10$FIdu5fsjhYGX970tKOim.uTmJ2TgF11uqTM5eJO2uSW2uadZmxVRa', 'iJYrmxBU3o3nYbBh3OWrJkQ1ocDvDoe3rAbh78eAuXXhriDsWfluNuCjZZuC', NULL, '2020-01-10 20:24:34', '2020-01-10 20:24:34', '[1,5,7,9]', '[]', '[]'),
(2, NULL, '2', 'John Doe', 'test2@gmail.com', 'users/default.png', NULL, '$2y$10$hIaQFB4zNVkD2i4VY8Im5Olm7TVfcGb/vYlCQO5zvWaPmPRl6BCo2', 'tPhwEtxnlvBjyCWb6JJHUdQSZ5f4MIEYVOHC8BM9LFpcctNZa6cm440v6jDd', NULL, '2020-01-10 20:24:35', '2020-01-10 20:24:35', '[2,11,22]', '[]', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `listings`
--
ALTER TABLE `listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listing_items`
--
ALTER TABLE `listing_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_author_id_foreign` (`author_id`);

--
-- Indexes for table `receivers`
--
ALTER TABLE `receivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `listings`
--
ALTER TABLE `listings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `listing_items`
--
ALTER TABLE `listing_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receivers`
--
ALTER TABLE `receivers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
