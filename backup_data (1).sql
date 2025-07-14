CREATE DATABASE  IF NOT EXISTS `team_1_dmvlandmark_backup` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `team_1_dmvlandmark_backup`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: team_1_dmvlandmark_backup
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `classification`
--

DROP TABLE IF EXISTS `classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classification` (
  `class_id` int NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification`
--

LOCK TABLES `classification` WRITE;
/*!40000 ALTER TABLE `classification` DISABLE KEYS */;
INSERT INTO `classification` VALUES (1,'museum'),(2,'theater'),(3,'house'),(4,'historic district'),(5,'planatation and farm'),(6,'castle'),(7,'educational institutes'),(8,'bridge'),(9,'battlefield'),(10,'church'),(11,'hall'),(12,'cemetery'),(13,'park'),(14,'statue'),(15,' memorial and monument'),(16,'lighthouse'),(17,'building'),(18,'other categories');
/*!40000 ALTER TABLE `classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guides`
--

DROP TABLE IF EXISTS `guides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guides` (
  `guide_id` int NOT NULL,
  `fname` varchar(15) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `charges` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`guide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guides`
--

LOCK TABLES `guides` WRITE;
/*!40000 ALTER TABLE `guides` DISABLE KEYS */;
INSERT INTO `guides` VALUES (1,'Deanne','Tanner',100.00),(2,'Bobbi','Day',150.00),(3,'Patricia','Lawrence',200.00),(4,'Lorena','Stafford',250.00),(5,'Millard','Morrison',400.00),(6,'Celia','Ellis',200.00),(7,'Brandi','Hendricks',350.00),(8,'Joel','Molina',120.00),(9,'Steven','Doyle',500.00),(10,'Cleo','Massey',350.00),(11,'Weldon','Davies',700.00),(12,'Darius','Schroeder',800.00),(13,'Audrey','Moran',550.00),(14,'Trisha','Owen',120.00),(15,'Frankie','Mcmahon',220.00),(16,'Demarcus','Pennington',340.00),(17,'Laverne','Harper',240.00),(18,'Eddy','Brock',450.00),(19,'Carmen','Bentley',550.00),(20,'Ruthie','Mcintosh',420.00),(21,'Hank','Garcia',320.00),(22,'Christi','House',220.00),(23,'Janna','Stanley',240.00),(24,'Eugene','Wells',330.00),(25,'Arlene','Andersen',440.00),(26,'Rose','Tate',550.00),(27,'Lenore','Reynolds',660.00),(28,'Aldo','Avila',450.00),(29,'Woodrow','Mcpherson',220.00),(30,'Evan','Higgins',230.00),(31,'Alta','Strong',440.00),(32,'Nikki','Dean',450.00),(33,'Merle','Conrad',650.00),(34,'Drew','Rollins',760.00),(35,'Johnie','Sullivan',280.00),(36,'Beatriz','Poole',550.00),(37,'Len','Chambers',400.00),(38,'Lori','Cobb',460.00),(39,'Norris','Schaefer',480.00),(40,'Dick','Bowman',470.00),(41,'Rene','Sweeney',450.00),(42,'Jesus','Newman',520.00),(43,'Lionel','Wilkinson',560.00),(44,'Dianna','Davis',530.00),(45,'Diego','Lyons',570.00),(46,'Ronda','Hahn',620.00),(47,'Dexter','Wilcox',6230.00),(48,'Olen','Novak',430.00),(49,'Lakisha','Meyer',200.00),(50,'Cruz','Gamble',440.00);
/*!40000 ALTER TABLE `guides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landmarks`
--

DROP TABLE IF EXISTS `landmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `landmarks` (
  `landmark_id` int NOT NULL,
  `landmark_name` varchar(200) DEFAULT NULL,
  `year_built` int DEFAULT NULL,
  `description` longtext,
  `class_id` int NOT NULL,
  `guide_id` int NOT NULL,
  `operation_id` int NOT NULL,
  PRIMARY KEY (`landmark_id`),
  KEY `fk_Landmarks_Classification1_idx` (`class_id`),
  KEY `fk_Landmarks_Guides1_idx` (`guide_id`),
  KEY `fk_Landmarks_Operation1_idx` (`operation_id`),
  CONSTRAINT `fk_Landmarks_Classification1` FOREIGN KEY (`class_id`) REFERENCES `classification` (`class_id`),
  CONSTRAINT `fk_Landmarks_Guides1` FOREIGN KEY (`guide_id`) REFERENCES `guides` (`guide_id`),
  CONSTRAINT `fk_Landmarks_Operation1` FOREIGN KEY (`operation_id`) REFERENCES `operation` (`operation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landmarks`
--

LOCK TABLES `landmarks` WRITE;
/*!40000 ALTER TABLE `landmarks` DISABLE KEYS */;
INSERT INTO `landmarks` VALUES (1,'Alexandria Historic District',1748,'Comparises the central portion of Alexandria, Virgina.',4,4,6),(2,'Aquia Church ',1751,'Mid-18th centry church.',10,8,1),(3,'Bacon\'s Castle',1665,'One of the oldest brick buildings in Virginia.',6,7,3),(4,'Ball\'s Bluff Battefield and National Cemetery',1892,'Site of an embarrassing Union defeat early in the American Civil War, caused by inept generalship, after which drowned troops\' bodies floated down the Potomac River to Washington, D.C.',12,5,9),(5,'Bannerker(Benjamin) SW-9 Intermediate Boundary Stone',1792,'A boundary stone associated with Benjamin Banneker(1731-1806), an African American surveyor, mathematician and astronomer who assisted Andrew Ellicott during the first two months of Ellicott\'s 1791-1792 survey of the boundaries of the original District of Columbia.',18,16,6),(6,'Barracks, Virginia Millitary Institute',1848,'Gothic style cadet barracks building on the ground of Virginia Millitary Institute',7,13,12),(7,'Berkeley Planatation',1726,'One of the great plantations of Virginia, associated with Presidents William Henry Harrison and Benjamin Harrison.',5,12,13),(8,'Berry Hill Plantation',1839,'A Greek Revival plantation mansion, imitating the Parthenon',5,8,10),(9,'Lower Brandon Plantation',1765,'Plantation tended from 1641 on, with unusual brick mansion in style of Palladi\'s \"Roman Country House\"\" completed in 1760s\"',5,6,5),(10,'Bremo Historic District',1725,'James River plantation with mansion probably desiged by Thomas Jefferson',4,5,11),(11,'Bruton Parish Church',1677,'Earliest church in the British American colonies to reflect the infusion of English Renaissance style.',10,4,3),(12,'Camden',1859,'Two-story Italian villa featuring such 19th-century innovations as a central heating system, gas light, insdie toilets, and shower baths. ',3,2,2),(13,'Camp Hoover',1929,'President Herbert Hoover\'s rustic presidential retreat, also known as Rapidan Camp.',18,11,1),(14,'Cape Henry Lighthouse ',1792,'First lighthouse to be erected by the Federal Government.',16,16,3),(15,'Carter\'s Grove Plantation',1750,'Georgian country house and plantation near Williamsburg.',5,14,4),(16,'Cedar Creek Battlefield and Belle Grove Plantation',1797,'Site of the American Civil War battle of Cedar Creek and the Belle Grove Plantation. Divided into two pieces by interstate 81.',5,12,3),(17,'Christ Church, Alexandria',1773,'1773 Georgian brick church',10,9,3),(18,'Christ Church(Lancaster County)',1735,'Example of British Colonial ecclesiastical architecture.',10,8,2),(19,'City Hall(Richmond)',1886,'Example of the High Victorian Gothic style.',11,6,1),(20,'Patsy Cline House',1832,'Childhood home of country music singer Patsy Cline.',3,7,6),(21,'Gunston Hall',1759,'Home of the United States Founding Father George Mason.',11,4,1),(22,'Alteria Theater ',1927,'This 3,565 seat theater, to the west of downtown Richmond, was originally the Acca Temple Shrine for the Shriner\'s. It has the largest proscenium stage on the East Coast and also has a large ballroom.',2,2,3),(23,'American Civil War Museum',1866,'The American Civil War Museum is a multi-site museum in the Greater Richmond Region of central Virginia, dedicated to the history of the American Civil War. ',1,16,4),(24,'Arlington House(The Robert E. Lee Memorial)',1803,'During the American Civil War, the grounds of the mansion were selected as the site of Arlington National Cemetery, in part to ensure that Confederate General Robert E. Lee would never again be able to return to his home.',3,14,3),(25,'Arlington National Cemetery',1864,'The cemetery was established on the grounds of Arlington House, formerly the estate of the family of Robert E. Lee\'s wife Mary Anna Custis Lee, a descendant of Martha Washington.',12,15,6),(26,'Atlantic Wildfowl Heritage Museum',1895,'De Witt Cottage, also known as Holland Cottage and Wittenzand, is a historic home located at Virginia Beach, Virginia.',1,1,4),(27,'Edgar Allan Poe Museum',1830,'The Poe Museum, or the Edgar Allan Poe Museum, is a museum located in the Shockoe Bottom neighborhood of Richmond, Virginia. Through Poe never lived in the building, it serves to commemorate his time living in Richmond.',1,2,4),(28,'Ferry Plantation House',1830,'A brick house in the neighborhood of Old Donation Farm in Virginia Beach, Virginia. The area was initally cleared by the local Indians in the 16th century and many of their artifacts have been found on the site. ',3,3,3),(29,'First Landing State Park',1930,'It offers recreational opportunities at Cape Henry in the independent city of Virginia Beach, Virginia. As the first planned state park of Virginia, It is listed on the National Register of Historic Places as Seashore State Park Historic District. A portion of the park is listed as a National Natural Landmark as part of the Seashore Natural Area.',13,4,6),(30,'Francis Land House',1804,'A historic brick house which was the plantation home of the prominent Land family, a founding family of Princess Anne County, Virginia. Land family history on the site spanned the 1630s to the 1850s. The house passed through six males named Francis Land and then the last Francis\' daughters before beig sold to another family.',3,5,6),(31,'Neptune Statue',2005,'King Neptune is a large bronze statue located in Virginia. This sculpture weighs 12 tons and is listed as 24 feet or 34 feet tall. The statue was dedicated to the City of Virginia Beach on September 30, 2005 during the Neptune Festival Boardwalk Weekend.',14,6,12),(32,'Norwegian Lady',1962,'The Norwegian Lady Statues are located in the sister cities of Moss, a coastal town and municipality in the county of Østfold, Norway, and at the Oceanfront(boardwalk) in the coastal resort city of Virginia Beach, Virginia. Norwegian sculptor Ørnulf Bast was commissioned to create two nine-foot bronze replicas of the original figurehead.',14,7,16),(33,'Richmond National Battlefield Park',1936,'It commemorates 13 American Civil War sites around Richmond, Virginia, which served as the capital of the Confederate States of America for most of the war. ',13,8,13),(34,'The Pentagon',1943,'Headquarters of the Department of Defense for the United States of America, the Pentagon is one of the world\'s largest office buildings. It has three times the floor space of the Empire State Building.',17,9,2),(35,'The Thoroughgood House',1719,'The building underwent major restorations in 1923 and in the 1950s and has served as a museum since opening to the public April 29, 1957. Much of the current structure was most likely the house of the great-gradson of Adam Thoroughgood.',3,10,3),(36,'The Valentine',1898,'A museum dedicated to collecting, preserving and interpreting Richmond\'s history. It was the first museum in Richmond.',1,11,4),(37,'Tomb of the Unknowns',1937,'The United States Congress approved the burial of an unidentified American soldier from World War I in the plaza of the new Memorial Amphitheater. A gave for an unknown has been added for World War II, the Korean War and the Vietnam War. ',18,13,13),(38,'George Washington Masonic Memorial',1939,'The tower is fashioned after the Lighthouse of Alexandria, in part because of town\'s namesake, and the masonic interest in great buildings of the ancient world.',15,14,2),(39,'Virginia Holocaust Museum',1997,'It is dedicated to depicting the Holocaust through the personal stories of its victims. The museum memorializes and documents the atrocities of World War II.',1,15,3),(40,'Virginia Museum of History and Culture',1831,'It features exhibitons and programming for visitors of all ages and has more than 25,000 square feet of exhibition gallery space and the largest display of Virginia artifacts on permanent view. ',1,16,3),(41,'Cleveland Abbe House',1802,'A prominent meteorologist who became known as the father of the NAtional Weather Service, lived in this house from 1877 to 1909. Previous occupants in the early decades of the 19th century included JAmes Monroe and the British legation. This is a fine example of the Federal style of residential architecture.',3,34,3),(42,'Administration Building, Carnegie Institution of Washington',1910,'a Beaux Arts style building desinged by architects Carrere and Hastings and it houses the Caregie Institution for Science a philanthropic scientific research organization founded in 1902 by Andrew Carnegie.',17,33,6),(43,'American Federation of Labor Building',1916,'The building was completed for the American Federation of Labor, which was then at a high point in its power and infuence.',17,32,12),(44,'American Peace Society',1878,'Headquarters of the American Peace Society from 1911 to 1948, in LaFayette Square Historic District.',17,31,4),(45,'Aderson House',1905,'Also as known as Larz Anderson House that a Gilded Age mansion and it now houses the Society of the Cincinnati\'s international headquarters and a research library on 17th and 18th century miilitary and naval history and the art of war. ',3,30,3),(46,'Ashburton House',1836,'House on Lafaytee Square that was site of 10 months of U.S.-British negotiations leading to the Webster-Ashburton Treaty of 1842. This settled U.S.-Canada border disputes and ended the Aroostook War.',3,29,3),(47,'Newton D. Baker House',1794,'It was home of Newton D. Baker, who was Secretary of War, during 1916-1920, while \"he presided over America\'s mass mobilization of men and material in World War I. After the assassination of president John F. Kennedy in 1963 Jacqueline Kennedy purchased the house and lived here for about a year. \"',3,28,3),(48,' Blair House',1824,'It was also known as The President\'s Guest House. The President\'s Guest House has been called \"the world\'s most exclusive hotel\"\" because it is primarily used as a state guest house to host visiting dignitaries and other guests of the president.\"',3,27,3),(49,'William E. Borah Apartment, Windsor Lodge',1913,'The home of William E. Borah, a United States Senator from ldaho and a noted isolationist. ',3,26,2),(50,'Blanche K. Bruce House',1865,'A home of Blanche K. Bruce, who was an African American Senator from Mississippi.',3,25,3),(51,'Carnegie Endowment for International Peace',1860,'It is also known as The Peter Parker House, is an historic row house and it is historically significant for its association with the Carnegie Endowment, whose headquarters it was from its founding in 1910 until 1948. It has since been incorporated into the Blair House complex serving high-profile offical visitors to the capital.',3,24,6),(52,'Mary Ann Shadd Cary House',1881,'A home of writer and abolitionist Mary Ann Shadd Cary.',3,23,3),(53,'City Hall / D.C. Courthouse',1820,'Also known as the Old Courthouse, it was renovated an drededicated on June 17, 2009 as the District of Columbia Court of Appeals.',17,22,3),(54,'Congressional Cemetery',1807,'Burial place of early city residents and many members of Congress who died in office.',12,21,6),(55,'Constitution Hall',1929,'A concert hall was built by the Daughters of the American Revolution to house its annual convention when membership delegations outgrew Memeorial Continental Hall.',11,20,4),(56,'Elliott Coues House',1880,'Elliott Couse, a leading 19th century ornithologist, led great expansions of the knowledge of North American bird life, helped found the American Ornithologists\' Union in 1883, edited approximately 15 volumes of journals, memoirs, and diaries by famous Western explorers and fur traders. He lived in this house from 1887 until his death in 1899.',3,19,3),(57,'Decatur House',1818,'Federal Style house designed by Benjamin Henry Latrobe for naval hero Stephen Decatur across Lafagette Square from the White House. ',3,18,3),(58,'Franklin School',1865,'A nineteenth-centry school, site of Alexander Graham Bell\'s experiments with the photophone.',7,17,2),(59,'Gallaudet College Historic District',1867,'The world\'s first college for the education of the deaf and hard of hearing.',7,34,6),(60,'General Federation of Women\'s Clubs Headquarters',1837,'Also Known as the Miles Mansion, is a social clubhouse headquarters built as a private residence in 1975. It has served as the headquarters of the General Federation of Women\'s Clubs since 1922.',17,17,2),(61,'General Post Office',1839,'This post office is a fine example of restrained Neoclassical desin. Built in phases between 1839 and 1866, the building features beautiful scaling and fine details.',17,18,2),(62,'Georgetown Historic District',1950,'The first historic distric in Washington and the sixth in the United States. Georgetown is listed in the DC Inventory of Historic Sties and National Register of Historic Places.',4,20,16),(63,'Samuel Gompers House',1902,'Samuel Gompers was president of the American Federation of Labor from 1886 until his death in 1924. Gompers helped found the AFL, and vigorously pursued its three goals of higher wages, shorter hours, and better working conditions for American workers. He lived in this three-story brick rowhouse from 1902 to 1917.',3,22,3),(64,'Charlotte Forten Grimke House',1973,'A home of Charlotte Forten Grimke, a prominent Abolitionist and educator.',3,26,3),(65,'Healy Hall, Georgetown University',1877,'This large-scale High Victorian Gothic structure is the most prominent building on the Georgetown University campus and a picturesque landmark for all Georgetown. Its construction marked the evolution of the school toward true university status. ',7,29,2),(66,'General Oliver Otis Howard House',1867,'A home of Union general and Howard founder Oliver O. Howard.',3,28,3),(67,'Charles Evans Hughes House',1907,'Charles Evans Hughes was a leader in the progressive movement, and 1916 presidential candidate. He held office as Associate Justice and Chief Justice of the United States, as well as multiple executive positions under several Presidents. He lived in this house from 1930 until his death in 1948.',3,33,3),(68,'Hiram W. Johnson House',1822,'An historic house built about 1822 and it is most notable as the home of Hiram Johnson who a prominent force in the Progressive Party of the early 20th century and its Vice Presidential candidate under Theodore Roosevelt in the 1912 election. ',3,17,3),(69,'Lafayette Building',1800,'Home of Reconstruction Finanace Corporation which helped finance the buildup for World War II.',17,30,4),(70,'Library of Congress',1897,'Oldest of the four United States Library of Congress buildings. The Beaux-Art style building is known for its classicizing facade and elaborately decorated interior. The building\'s main architect was Paul J. Pelz, initally in partnership with John L. Smithmeyer, and succeeded by Edward Pearce Casey during the last few years of construction.',17,32,2),(71,'The National Mall',1836,'The landscaped park stretches a length of two miles between the Lincoln Memorial and the US Capitol. The National Mall is the stage of the nation, holding everything from presidential inaugurations and Fourth of July festivities to classical concerts and sporting events.',17,27,2),(72,'Washington Monument',1884,'Standing at over 554 feet tall, this white marble obelisk is the tallest stone structure in the world. It was built in memory of the first American president, George Washington.',15,23,13),(73,'The White House',1800,'The home of the United State\'s President, which has been the president\'s offical home for over 220 years.',3,29,2),(74,'Abraham Lincoln Memorial',1920,'Built in honor of the 16th American President, Abraham Lincoln. The neoclassical temple houses a 19-foot tall statue of Lincoln, seated, lost in thought.',15,30,12),(75,'Thomas Jefferson Memorial',1943,'Situatued on a bank of the Potomac River within a grove of Japanese Cherry trees, the neoclassical rotunda was inspired by the third American president\'s own architectural theories.',15,33,11),(76,'Vietnam Veterans Memorial',1982,'In 1982, artist Maya Lin conceptualized a bold 246-foot black granite wall engraved with the names of the 58,320 soldiers killed during the Vietnam War. Initially met with public resistance, the Vietnam Memorial is one of the most poignant and important places in Washington, D.C.',15,34,6),(77,'Franklin Delano Roosevelt Memorial',1997,'The most sensitive of the presidential monuments in Washington, D.C. Bronze sculptures, inspired by iconic photographs from the Great Depression, deliver a compelling history lesson to visitors. The depict the lives of everyday American under the 12-year presidency of one of the US\'s most beloved and controversial presidents.',15,22,7),(78,'Korean War Veterans Memorial',1783,'Nineteen stainless steel soldiers advance through the trees making the Korean War Memorial one of the most artistic Washington D.C. Each soldier in \"The Column\"\" stands over 7 feet tall collectiely representing a platoon on patrol.\"',15,33,9),(79,'Martin Luther King Jr. Memorial',2011,'The Memorial honors the legacy of civil rights activist Martin Luther King Jr. You will find a monumental statue titled the \"The Stone of Hope\"\" with the leader emerging arms crossed from white granite. Ringing the statue is an Inscription Wall with fourteen of MLK\'s most moving quotes. They stress the primary messages of Dr. King: justice democracy hope and love.\"',15,21,9),(80,'International Spy Museum',2002,'An interactive exploration of the history and tradecraft of modern espionage.',1,28,3),(81,'Accokeek Creek Site',2000,'Archaeological site of a palisaded village occupied from ca. A.D. 1300 to ca. 1630.',18,35,8),(82,'Army Medical Museum and Library',1887,'The listing presently encompasses a US military medical records and research collection that dates to the 1860s. The orginial building in Washington, D.C. was demolished in 1969; the collection is now principally with the National Museum of Health and Medicine. The landmark designation is undergoing review. ',1,36,2),(83,'Baltimore(Tug)',1906,'Oldest steam-powered tugboat in operation in the United States.',18,37,7),(84,'Baltimore and Ohio Transportation Museum and Mount Clare Station',1829,'Part of oldest American railyard; site of first passenger rail service and first telegraph message. Collections of 19th-and 20th-century artifacts related to America\'s railroads; 250 pieces of railroad rolling stock; 15,000 artifacts; four nineteenth-century buildings, including the historic roundhouse; a mile of historic track.',18,38,2),(85,'Clara Barton House',1891,'Home of Clara Barton; American pioneer teacher, nurse, and humanitarian; founder of the American Red Cross',3,39,3),(86,'Bollman Truss Railroad Bridge',1869,'Sole surviving example of the first successful all-metal bridge-design to be adopted and consistently used on a railroad.',8,40,11),(87,'Brice House',1766,'Preserved 18th century Georgian style brick house.',3,41,3),(88,'Carrollton Viaduct',1829,'Oldest operating railway bridge in the world.',8,42,3),(89,'Rachel Carson House',1956,'House where Rachel Carson wrote her classic work Silent Spring in 1962',3,43,3),(90,'Casselman Bridge, National Road',1957,'Bridge built in 1813 on the National Road, the nation\'s first major public works project',8,44,13),(91,'Whittaker Chambers Farm',1941,'Farm home of Whittaker Chambers, accuser of Alger Hiss; papers hidden here in a pumpkin led to Hiss\'s convicton; Chambers wrote Witness, his best-selling autobiography, here.',5,45,4),(92,'Chase-Lloyd House',1769,'Three-story brick Georgian mansion dating from 1769-1774.',3,46,3),(93,'Chestertown Historic District',1750,'A historic distric in Chestertown of Maryland and the town on the Chester River who became the chief port for tobacco and wheat on the Eastern shore of Maryland between 1750 and 1790.',4,47,10),(94,'College of Medicine of Maryland',1812,'Oldest medical school building in the U.S.',7,48,2),(95,'Colonial Annapolis Historic District',1695,'A historic distric in the City of Annapolis of the state capital of Maryland.',4,49,11),(96,'USS Constellation(Frigate)',1854,'Constructed in 1854; sloop-of-war, or corvette; second United States Navy ship to carry this famous name.',18,50,6),(97,'Doughoregan Manor',1727,'Built in 1766; until 1832 home of Charles Carroll, last surviving signer of the Declaration of Independence.',18,33,4),(98,'Edna E. Lockwood (Bugeye)',1889,'Built in 1889; Chesapeake Bay bugeye; last working oyster boad of her kind.',18,36,4),(99,'Ellicott City Station',1830,'The oldest remaining passenger train stateion in the United STates, and one of the oldest in the world.',18,37,2),(100,'First Unitarian Church',1817,'A historic church and congregation at 12 West Franklin Street. It was the first building erected for Unitarians in the United States.',10,39,3),(101,'Fort Frederick',1922,'A public recreation and historic preservation area on the Potomac River surrounding the restored For Frederick, a fortification active in the French and Indian War (1754-1763) and the American Revolutionary War(1775-1783).',13,40,4),(102,'Frieda Fromm-Reichmann Cottage',1936,'A historic house was built in 1936 to house the residence and professional office of Frieda Fromm-Reichmann, one of the leading psychoanalysts at the Chestnut Lodge psychiatric hospital, on whose grounds it stood.',3,44,4),(103,'Gaithersburg Latitude Observatory',1899,'A historic astronomical observatory on DeSellum Avenue in Gaithersburg, MD. It was established in 1899 as part of a system of six International Latitude Observatories to precisely measure the wobble of the Earth\'s rotating axis.',18,45,4),(104,'Greenbelt, Maryland Historic District',1935,'The district preserves the center of one of the few examples of the Garden city movement in the United States. ',4,48,16),(105,'Habre-de-venture',1978,'Now the Thomas Stone National Historic Stie.',18,50,4),(106,'Hammond-Harwood House',1744,'A historic house museum is one of the premier colonial houses remaining in America from the British colonial period(1607-1776).',1,39,3),(107,'Hilda M. Willing (Skipjack)',1905,'A relatively small Chesapeake Bay skipjack and the Willing is particularly noteworthy as an example of a small skipjack with good sailing qualities.',18,40,3),(108,'His Lordship\'s Kindness',1786,'Also known as Popalr Hill, is a historic plantation estate on Woodyard Road east of Clinton, MD. The five-part Georgian mansion retains a number of subsidiary buildings including a slave\'s hospital and a dovecote. ',5,44,4),(109,'Homewood',1801,'A historical museum was noted as a family home of Maryland\'s Carroll family.',1,47,4),(110,'Kathryn(Skipjack)',1901,'A Chesapeake Bay Skipjack. She is reputedly one of the fastest skipjacks on the Bay.',18,49,4),(111,'Antietam National Battlefield',1890,'23,000 soldiers were killed, wounded or missing after twelve hours of savage combat on September 17, 1862. The Bettle of Antietam ended the Confederate Army of Northern Virginia\'s first invasion into the North.',9,50,3),(112,'Armistead Monument',1914,'It was erected in 1882. The momument honors Colonel George Armistead, the commander of Fort McHenry when the British attacked in the Battle of Baltimore on September 13, 1814.',15,39,15),(113,'Artisan\'s House',1777,'A historic home is a 1 1/2-story frame house on a brick foundation representative of modest middle class dwellings of the 18th century.',3,37,3),(114,'Baltimore Civil War Museum',1849,'Originally the President Steet Station, this site and the rail line were key elements of the \"underground railroad\"\" by which many slaves escaped to the north before the Civil War.\"',1,36,2),(115,'Baltimore\'s Inner Harbor',1930,'Area is home to many of Baltimore\'s most popular tourist attractions including HArborplace. The term \"Inner Harbor\"\" is used not just for the water but for the surrounding area of the city with approximate street boundaries of President Street Lombard Street Light Street and Key Highway.\"',18,44,12),(116,'Benjamin Banneker Historical Park and Museum',1704,'This park and museum honor Benjamin Banneker-scientist, astronomer, mathematica.',1,42,3),(117,'Star-Spangled Banner',1814,'The War of 1812- an army on our shores, the fledgling nation\'s independence at stake, a furture in doubt. Retrace the battles and the bravery that saved the nation and birthed our \"Star-Spangled Banner.\"\"\"',18,43,3),(118,'National Shrine of St. Elizabeth Ann Seton',1965,'Historic site of the first American-born saint. Free museum and 12-minute flim. Guided tours of two historic homes, historic cemetery, and Basilica with Saint\'s tomb. Part of Maryland\'s 2020 Year of the Woman. ',18,41,14),(119,'St. Clement\'s Island State Park',1962,'In 1634, the first English settlers to arrive in Maryland landed here. The 40-acre park is dedicated to them. ',13,50,2),(120,'Hirstoric St. Mary\'s City',1837,'In St. Mary\'s City, the very earth beneath your feet holds a story and every corner you trun will open a new chapter.',4,39,7);
/*!40000 ALTER TABLE `landmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `county` varchar(45) DEFAULT NULL,
  `landmark_id` int NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `fk_Location_Landmarks1_idx` (`landmark_id`),
  CONSTRAINT `fk_Location_Landmarks1` FOREIGN KEY (`landmark_id`) REFERENCES `landmarks` (`landmark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'121 N Fairfax Street',22314,'VA','Independent City',1),(2,'2938 Jefferson Davis Hwy',22554,'VA','Stafford',2),(3,'465 Bacon\'s Castle Trail',23883,'VA','Surry ',3),(4,'Rt 7 ',20176,'VA','Loudoun',4),(5,'6620 18th Street North',22205,'VA','Arlington ',5),(6,'319 Letcher Avenue',24450,'VA','Rockbridge',6),(7,'12602 Harrison Landing Road',23030,'VA','Charles City',7),(8,'3105 River Road',24592,'VA','Halifax',8),(9,'23500 Brandon Road',23881,'VA','Prince George',9),(10,'Bremo Farms Lane',22963,'VA','Fluvanna ',10),(11,'201 W Duke of Gloucester Street',23185,'VA','James City',11),(12,'7314 Camden Road',22535,'VA','Caroline',12),(13,'3655 U.S. Highway 211 East ',22743,'VA','Madison County',13),(14,'583 Atlantic Avenue',23459,'VA','Independent City',14),(15,'8797 Pocahontas Trail',23185,'VA','James City',15),(16,'Middletown',22645,'VA','Frederick',16),(17,'118 N Washington Street',22314,'VA','Fairfax',17),(18,'420 Christ Church Road',22480,'VA','Lancaster',18),(19,'900 E Broad Street',23219,'VA','Independent City',19),(20,'608 S Kent Street',22601,'VA','Independent City',20),(21,'10709 Gunston Road',22079,'VA','Fairfax',21),(22,'6 N Laurel Street',23220,'VA','Independent City',22),(23,'480 Tredegar Street',23219,'VA','Independent City',23),(24,'321 Sherman Drive',22211,'VA','Arlington',24),(25,'1 Memorial Avenue',22211,'VA','Arlington',25),(26,'1113 Atlantic Avenue',23451,'VA','Independent City',26),(27,'1914 E Main Street',23223,'VA','Independent City',27),(28,'4136 Cheswick Lane',23455,'VA','Independent City',28),(29,'2500 Shore Drive',23451,'VA','Independent City',29),(30,'3131 Virginia Beach Boulevard ',23452,'VA','Independent City',30),(31,'201 Market Street ',23451,'VA','Independent City',31),(32,'2500 Atlantic Avenue',23451,'VA','Independent City',32),(33,'470 Tredegar Street',23219,'VA','Independent City',33),(34,'200 Army Pentagon ',20310,'VA','Arlington',34),(35,'1636 Parish Road',23455,'VA','Independent City',35),(36,'1015 E Clay Street',23219,'VA','Independent City',36),(37,'1 Wilson Avenue',22211,'VA','Arlington',37),(38,'101 Callahan Drive',22301,'VA','Fairfax',38),(39,'2000 E Cary Street',23223,'VA','Independent City',39),(40,'428 N Arthur Ashe Boulevard',23220,'VA','Independent City',40),(41,'2017 I Street NW',20006,'DC','Washington DC',41),(42,'5251 Broad Branch Road NW',20015,'DC','Washington DC',42),(43,'901 Massachusetts Avenue NW',20001,'DC','Washington DC',43),(44,'734 Jackson Place NW',20506,'DC','Washington DC',44),(45,'2118 Massachusetts Avenue NW',20008,'DC','Washington DC',45),(46,'1525 H Street NW',20006,'DC','Washington DC',46),(47,'3017 N Street NW ',20007,'DC','Washington DC',47),(48,'1651 Pennsylvania Avenue NW',20503,'DC','Washington DC',48),(49,'2139 Wyoming Avenue',20008,'DC','Washington DC',49),(50,'909 M Street NW',20001,'DC','Washington DC',50),(51,'1779 Massachusetts Avenue NW',20036,'DC','Washington DC',51),(52,'1421 W Street NW',20009,'DC','Washington DC',52),(53,'430 E Street NW #115',20001,'DC','Washington DC',53),(54,'1801 E Street SE',20003,'DC','Washington DC',54),(55,'1776 18th Street NW',20006,'DC','Washington DC',55),(56,'1726 N Street NW',20007,'DC','Washington DC',56),(57,'748 Jackson Place NW',20006,'DC','Washington DC',57),(58,'963 13th Street NW',20005,'DC','Washington DC',58),(59,'800 Florida Avenue NE',20002,'DC','Washington DC',59),(60,'1734 N Street NW #1',20036,'DC','Washington DC',60),(61,'700 F Street NW',20066,'DC','Washington DC',61),(62,'3051 M Street NW',20007,'DC','Washington DC',62),(63,'2122 1st Street NW',20001,'DC','Washington DC',63),(64,'1608 R Street NW',20009,'DC','Washington DC',64),(65,'O Street NW & 37th Street NW',20007,'DC','Washington DC',65),(66,'607 Howard Place NW',20059,'DC','Washington DC',66),(67,'2223 R Street NW',20008,'DC','Washington DC',67),(68,'123 Maryland Avenue',20002,'DC','Washington DC',68),(69,'812 Vermont Avenue NW',20009,'DC','Washington DC',69),(70,'102 Independence Avenue SE',20543,'DC','Washington DC',70),(71,'Jefferson Drive SW',20560,'DC','Washington DC',71),(72,'2 15th Street NW ',20024,'DC','Washington DC',72),(73,'1600 Pennsyvania Avenue NW',20500,'DC','Washington DC',73),(74,'2 Lincoln Memorial Circle NW',20002,'DC','Washington DC',74),(75,'16 E Basin Drive SW',20242,'DC','Washington DC',75),(76,'5 Henry Bacon Drive NW',20245,'DC','Washington DC',76),(77,'1850 West Basin Drive SW',20242,'DC','Washington DC',77),(78,'900 Ohio Drive SW',20024,'DC','Washington DC',78),(79,'1964 Independence Avenue SW',20003,'DC','Washington DC',79),(80,'700 L\'Enfant Plaza SW',20024,'DC','Washington DC',80),(81,'2687 Bryan Point Road ',20607,'MD','Prince George\'s',81),(82,'2500 Linden Lane',20910,'MD','Montgomery',82),(83,'2100 Frankfurst Avenue',21226,'MD','Baltimore ',83),(84,'901 W Pratt Street',21223,'MD','Baltimore ',84),(85,'5801 Oxford Road',20812,'MD','Montgomery',85),(86,'9044 Gorman Road',20723,'MD','Prince George\'s',86),(87,'42 East Street',21401,'MD','Anne Arundel',87),(88,'2701 Wilmarco Avenue',21223,'MD','Baltimore ',88),(89,'11701 Berwick Road',20904,'MD','Montgomery',89),(90,'10240 National Pike ',21536,'MD','Garrett',90),(91,'446 East Saw Mill Road',21158,'MD','Carroll',91),(92,'22 Maryland Avenue',21401,'MD','Anne Arundel',92),(93,'200 B High Street ',21620,'MD','Kent',93),(94,'520 W Lombard Street ',21201,'MD','Baltimore ',94),(95,'211 Main Street ',21401,'MD','Anne Arundel',95),(96,'301 E Pratt Street ',21202,'MD','Baltimore ',96),(97,'4713 Manor Lane',21402,'MD','Howard',97),(98,'213 North Talbot Street ',21663,'MD','Talbot',98),(99,'3711 Maryland Avenue ',21043,'MD','Howard',99),(100,'12 West Franklin Street',21201,'MD','Baltimore ',100),(101,'11100 Fort Frederick',21711,'MD','Washington  ',101),(102,'19 Thomas Street ',20850,'MD','Montgomery',102),(103,'100 Desellum Avenue',20877,'MD','Montgomery',103),(104,'12 Crescent Road ',20770,'MD','Prince George\'s',104),(105,'6655 Rose Road',20677,'MD','Charles',105),(106,'19 Maryland Avenue',21401,'MD','Anne Arundel',106),(107,'23441 Deal Island Road',21821,'MD','Somerset',107),(108,'7606 Woodyard Road',20735,'MD','Prince George\'s',108),(109,'3400 N Charles Street',21218,'MD','Baltimore ',109),(110,'Ralph Abbott Road ',21821,'MD','Somerset',110),(111,'302 E Main Street ',21782,'MD','Washington',111),(112,'2400 E Fort Avenue',21230,'MD','Baltimore ',112),(113,'43 Pinckney Street',21401,'MD','Anne Arundel',113),(114,'601 S President Street',21202,'MD','Baltimore ',114),(115,'401 W Camden Street ',21201,'MD','Baltimore ',115),(116,'300 Oella Avenue',21228,'MD','Baltimore ',116),(117,'2400 E Fort Avenue ',21230,'MD','Baltimore ',117),(118,'339 S Seton Avenue',21727,'MD','Frederick',118),(119,'Coltons Point',20626,'MD','St Marys',119),(120,'47477 Old State House Road',20686,'MD','St Marys',120);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation` (
  `operation_id` int NOT NULL,
  `open_hour` time DEFAULT NULL,
  `close_hour` time DEFAULT NULL,
  PRIMARY KEY (`operation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
INSERT INTO `operation` VALUES (1,'08:00:00','15:00:00'),(2,'08:30:00','15:30:00'),(3,'09:30:00','16:00:00'),(4,'10:00:00','16:30:00'),(5,'10:30:00','17:00:00'),(6,'11:00:00','17:30:00'),(7,'11:30:00','18:00:00'),(8,'12:00:00','18:30:00'),(9,'12:30:00','19:00:00'),(10,'13:00:00','19:30:00'),(11,'13:30:00','20:00:00'),(12,'14:00:00','20:30:00'),(13,'14:30:00','21:00:00'),(14,'15:00:00','21:30:00'),(15,'15:30:00','22:00:00'),(16,'16:00:00','22:30:00');
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` int NOT NULL,
  `res_date` date DEFAULT NULL,
  `res_time` time DEFAULT NULL,
  `landmark_id` int NOT NULL,
  `tourist_id` int NOT NULL,
  `cost` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `fk_Reservation_Landmarks1_idx` (`landmark_id`),
  KEY `fk_Reservation_Tourist1_idx` (`tourist_id`),
  CONSTRAINT `fk_Reservation_Landmarks1` FOREIGN KEY (`landmark_id`) REFERENCES `landmarks` (`landmark_id`),
  CONSTRAINT `fk_Reservation_Tourist1` FOREIGN KEY (`tourist_id`) REFERENCES `tourist` (`tourist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2021-08-20','11:00:00',1,1,426.54),(2,'2021-09-10','11:00:00',2,2,329.79),(3,'2021-07-02','12:00:00',3,3,216.29),(4,'2021-08-03','13:00:00',4,4,80.69),(5,'2021-09-16','14:00:00',5,8,459.22),(6,'2021-08-10','15:00:00',6,4,393.39),(7,'2021-08-12','16:00:00',7,9,455.44),(8,'2021-07-09','13:00:00',8,9,313.67),(9,'2021-07-01','13:00:00',9,10,454.33),(10,'2021-09-17','19:00:00',10,10,231.02),(11,'2021-08-27','10:00:00',11,8,149.81),(12,'2021-09-10','09:00:00',12,12,229.79),(13,'2021-07-02','10:00:00',13,55,311.15),(14,'2021-08-03','11:00:00',14,60,400.83),(15,'2021-09-03','11:00:00',15,41,358.43),(16,'2021-08-17','14:00:00',16,38,89.87),(17,'2021-08-25','12:00:00',17,28,80.49),(18,'2021-07-19','09:00:00',18,37,286.93),(19,'2021-07-26','08:00:00',19,46,245.65),(20,'2021-09-21','11:30:00',20,13,386.66),(21,'2021-08-25','10:00:00',21,58,338.41),(22,'2021-09-14','11:00:00',22,32,83.55),(23,'2021-07-12','13:00:00',23,37,270.39),(24,'2021-08-18','14:00:00',24,35,374.47),(25,'2021-09-16','16:00:00',25,26,84.42),(26,'2021-08-25','12:00:00',26,24,434.45),(27,'2021-08-27','12:00:00',27,22,285.69),(28,'2021-07-09','10:00:00',28,16,228.97),(29,'2021-07-07','09:00:00',29,17,102.80),(30,'2021-09-15','15:00:00',30,51,272.71),(31,'2021-08-17','14:00:00',31,55,186.44),(32,'2021-09-15','16:00:00',32,44,227.86),(33,'2021-07-12','17:00:00',33,34,89.18),(34,'2021-08-24','10:00:00',34,29,100.47),(35,'2021-09-22','12:00:00',35,41,88.43),(36,'2021-08-25','11:00:00',36,28,162.98),(37,'2021-08-26','20:00:00',37,21,88.75),(38,'2021-07-19','09:00:00',38,22,89.28),(39,'2021-07-28','13:00:00',39,54,319.03),(40,'2021-09-07','14:00:00',40,53,96.90),(41,'2021-08-04','10:00:00',41,51,210.72),(42,'2021-09-07','13:00:00',42,47,86.57),(43,'2021-07-06','15:00:00',43,49,262.24),(44,'2021-08-11','11:30:00',44,36,330.16),(45,'2021-09-01','10:15:00',45,35,371.72),(46,'2021-08-09','12:45:00',46,39,281.10),(47,'2021-08-24','13:30:00',47,26,216.32),(48,'2021-07-02','10:00:00',48,28,347.53),(49,'2021-07-01','11:00:00',49,23,299.32),(50,'2021-09-16','10:30:00',50,21,85.31),(51,'2021-08-20','16:15:00',51,20,397.39),(52,'2021-09-10','15:00:00',52,8,256.34),(53,'2021-07-02','12:30:00',53,3,321.58),(54,'2021-08-03','08:00:00',54,7,308.48),(55,'2021-09-07','14:45:00',55,1,146.90),(56,'2021-08-10','10:00:00',56,9,88.95),(57,'2021-08-12','12:00:00',57,2,427.25),(58,'2021-07-15','09:00:00',58,7,430.69),(59,'2021-07-01','10:35:00',59,60,241.53),(60,'2021-09-20','14:00:00',60,6,448.62);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourist`
--

DROP TABLE IF EXISTS `tourist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourist` (
  `tourist_id` int NOT NULL,
  `family` varchar(5) NOT NULL,
  `accessibility` varchar(5) NOT NULL,
  PRIMARY KEY (`tourist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourist`
--

LOCK TABLES `tourist` WRITE;
/*!40000 ALTER TABLE `tourist` DISABLE KEYS */;
INSERT INTO `tourist` VALUES (1,'YES','YES'),(2,'YES','YES'),(3,'NO','YES'),(4,'YES','NO'),(5,'NO','YES'),(6,'YES','NO'),(7,'NO','YES'),(8,'YES','YES'),(9,'NO','NO'),(10,'YES','NO'),(11,'YES','YES'),(12,'NO','YES'),(13,'YES','NO'),(14,'YES','YES'),(15,'NO','YES'),(16,'NO','YES'),(17,'YES','NO'),(18,'NO','NO'),(19,'YES','NO'),(20,'YES','NO'),(21,'NO','YES'),(22,'NO','YES'),(23,'YES','NO'),(24,'YES','YES'),(25,'NO','NO'),(26,'NO','YES'),(27,'YES','YES'),(28,'YES','NO'),(29,'NO','YES'),(30,'NO','NO'),(31,'YES','YES'),(32,'YES','NO'),(33,'NO','YES'),(34,'NO','NO'),(35,'YES','YES'),(36,'NO','NO'),(37,'NO','YES'),(38,'YES','YES'),(39,'YES','NO'),(40,'NO','NO'),(41,'YES','YES'),(42,'NO','NO'),(43,'YES','YES'),(44,'NO','NO'),(45,'YES','NO'),(46,'YES','YES'),(47,'NO','NO'),(48,'YES','YES'),(49,'NO','NO'),(50,'YES','YES'),(51,'NO','NO'),(52,'YES','NO'),(53,'NO','YES'),(54,'NO','YES'),(55,'YES','YES'),(56,'NO','NO'),(57,'YES','NO'),(58,'NO','YES'),(59,'YES','NO'),(60,'YES','YES');
/*!40000 ALTER TABLE `tourist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'team_1_dmvlandmark_backup'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-12 19:49:41
