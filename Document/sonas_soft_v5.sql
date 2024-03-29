INDX( 	 ШГа            (   (  ш                                  x f          hззІtе3JІtе9ёЌKІtе6JІtе       I	               C l a s s C o n n e c t i o n . c s ~       x          ш`сІtеDЬІtеипЮІtеDЬІtе       ­               C l a s s I m p l e m e n t C o n n e c t i o n . c s       l          ш`сІtеdъ
_ІtеwЎ_ІtеУ&_Іtе                       E n u m C o n n e c t i o n T y p e . c s ~ R      p ^          LУуІtе/С cІtе~!AcІtе:ќћbІtеx     w               I C o n n e c t i o n . c s ~               m C o n n e c t i o n T y p e . c s ~ R      p ^          LУуІtе/С cІtе~!AcІtе:ќћbІtеx      w               I C o n n e c t i o n . c s ~                    LУуІtе/С cІtе~!AcІtе:ќћbІtеx      w               I C o n n e c t i o n . c s ~                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                nnement des bus, un des chauffeur voulant dУЉmarrer sa voiture en fesant une marche arriУЈre a pu cogner ma voiture'),(17,'04/08/2017','Nyawera','accident_voiture','le chauffeur a perdu le contrУДle de la camionnette et se retrouve droit dans un mur'),(18,'10/09/2017','av Kibombo','accident_voiture','le chauffeur a perdu le controle du vehicule et a cognУЉ un motard par la suite'),(19,'18/10/2017','route_d_ouvira','accident_voiture','un motard conduisait sans tirer attention et nous cognУЉ et a pris la fuite par aprУЈs'),(20,'22/10/2017','av Hypodrome','accident_voiture','perte de contrУДle, le vehicule a congУЉ le portaille de la maison'),(21,'10/11/2017','Nyawera','Incendie','la maison a pris feu autour de 19h quand un enfant essayait de allumer une bougie dans sa chambre'),(22,'11/11/2017','av P.E. Lumumba','accident voiture','aprУЈs avoir perdu le controlede la voiture que je conduisais, je me suis retrouvУЉ droit dans le mur de la boutique qui se situait juste en face');
/*!40000 ALTER TABLE `accident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acheter`
--

DROP TABLE IF EXISTS `acheter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acheter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_assure` int(11) NOT NULL,
  `id_assurance` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  `montant` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_acheter_assure_idx` (`id_assure`),
  KEY `Fk_acheter_assurance_idx` (`id_assurance`),
  KEY `Fk_acheter_type_idx` (`id_type`),
  CONSTRAINT `Fk_acheter_assurance` FOREIGN KEY (`id_assurance`) REFERENCES `assurance` (`id`),
  CONSTRAINT `Fk_acheter_assure` FOREIGN KEY (`id_assure`) REFERENCES `assure` (`id`),
  CONSTRAINT `Fk_acheter_type` FOREIGN KEY (`id_type`) REFERENCES `type_assurance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acheter`
--

LOCK TABLES `acheter` WRITE;
/*!40000 ALTER TABLE `acheter` DISABLE KEYS */;
INSERT INTO `acheter` VALUES (45,1,1,1,132000),(46,2,2,1,200000),(47,3,3,1,450000),(48,4,4,1,260000),(49,5,5,1,153000),(50,6,6,1,70000),(51,7,7,2,96000),(52,8,8,2,20000),(53,9,9,2,78000),(54,10,10,2,80000),(55,11,11,2,58000),(56,12,12,2,72000),(57,13,13,3,80000),(58,14,14,3,150000),(59,15,15,3,250000),(60,16,16,4,90000),(61,17,17,4,60000),(62,18,18,4,98000),(63,19,19,4,72000),(64,20,20,5,170000),(65,22,22,5,190000);
/*!40000 ALTER TABLE `acheter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricule` varchar(100) DEFAULT NULL,
  `nom` varchar(100) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_service` int(11) NOT NULL,
  `id_conge` int(11) NOT NULL,
  `id_paie` int(11) NOT NULL,
  `id_presence` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_UNIQUE` (`email`),
  UNIQUE KEY `matricule_UNIQUE` (`matricule`),
  KEY `Fk_agent_service_idx` (`id_service`),
  KEY `Fk_agent_conge_idx` (`id_conge`),
  KEY `Fk_agent_paie_idx` (`id_paie`),
  KEY `Fk_agent_presence_idx` (`id_presence`),
  CONSTRAINT `Fk_agent_conge` FOREIGN KEY (`id_conge`) REFERENCES `conge` (`id`),
  CONSTRAINT `Fk_agent_paie` FOREIGN KEY (`id_paie`) REFERENCES `paie` (`id`),
  CONSTRAINT `Fk_agent_presence` FOREIGN KEY (`id_presence`) REFERENCES `presence` (`id`),
  CONSTRAINT `Fk_agent_service` FOREIGN KEY (`id_service`) REFERENCES `service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,'Ag01','HIANI NKOL','Ibanda_Hyp','hiani12@gm',1,1,1,1),(2,'Ag02','HERI DUNIA','Ibanda_pay','heridu@gma',1,2,2,2),(3,'Ag03','KUKULE Flo','Kadutu_buh','kakulef@gm',1,3,3,3),(4,'Ag04','NABITNU Ro','Ibanda_hyp','rosa2@gmai',1,4,4,4),(5,'Ag05','IRENGE ZAG','Ibanda_nde','irezagabe@',1,5,5,5),(6,'Ag06','NSIMIRE Ja','Ibanda_kal','jacqui@gma',2,6,6,6),(7,'Ag07','BIRINDWA M','Ibanda_som','marcelo@gm',2,7,7,7),(8,'Ag08','BAPOLISI L','Ibanda_pay','leobap@gma',2,8,8,8),(9,'Ag09','Chrisitne ','Bagira_qua','wabula@gma',3,9,9,9),(10,'Ag10','NSHOKANO M','Ibanda_hyp','shomarie@g',3,10,10,10),(11,'Ag11','AMANI Chri','Ibanda_tel','amanichris',4,11,11,11),(12,'Ag12','BADULE GrУЂ','Ibanda_hyp','bulonza@gm',5,12,12,12),(13,'Ag13','BALEMBA Jo','Kudutu_ind','balembajos',5,13,13,13),(14,'Ag14','BISIMWA Em','Ibanda_res','bisimwa@gm',6,14,14,14),(15,'Ag15','PILIPILI G','Bagira_qua','gerardp@gm',7,15,15,15),(16,'Ag16','Mugoli Mad','Kadutu_isp','madelene10',7,16,16,16),(17,'Ag17','MUKALAYI J','Ibanda_vam','jeanneb@gm',7,17,17,17),(18,'Ag18','AISSI Mari','Ibanda_phy','marianea@g',8,18,18,18),(19,'Ag19','KAPENGELA ','Ibanda_ath','janettek@g',9,19,19,19),(20,'Ag20','WANDO Char','Kadutu_buh','wandoch@gm',10,20,20,20),(21,'Ag21','BITIJULA J','Ibanda_res','bitijula@g',11,21,21,21),(22,'Ag22','Sadiki Cla','Ibanda_res','sadikic@gm',12,22,22,22);
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assurance`
--

DROP TABLE IF EXISTS `assurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(100) NOT NULL,
  `police` varchar(100) NOT NULL,
  `garantie` varchar(100) NOT NULL,
  `date_debut` varchar(100) NOT NULL,
  `date_fin` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assurance`
--

LOCK TABLES `assurance` WRITE;
/*!40000 ALTER TABLE `assurance` DISABLE KEYS */;
INSERT INTO `assurance` VALUES (1,'Quittance automobile','1041976992A','RC, TTR,DegУЂt matУЉriel','02/01/2017','05/04/2017'),(2,'Quittance automobile','1247512499D','RC, TTR,DegУЂt matУЉriel,Incendiee','02/01/2017','02/02/2017'),(3,'Quittance automobile','1047476499A','RC, TTR,DegУЂt matУЉriel,Incendiee','02/01/2017','02/02/2018'),(4,'Quittance automobile','1047474739A','RC, TTR','03/01/2017','03/05/2017'),(5,'Quittance automobile','118724739A','RC, TTR,Incendie','03/01/2017','04/03/2017'),(6,'Quittance automobile','117834739B','RC, TTR,Incendie,degУЂt materiel','03/01/2017','03/02/2017'),(7,'Quittance vie','1325474682A','RC,Maladie,Accident','09/01/2017','02/01/2018'),(8,'Quittance vie','1325474476A','RC,Maladie,Accident','09/01/2017','09/07/2018'),(9,'Quittance vie','1224784476A','RC,Maladie','09/01/2017','09/08/2018'),(10,'Quittance vie','1224784756D','RC,Accident','16/01/2017','16/03/2018'),(11,'Quittance vie','1275684756A','RC,Accident','16/01/2017','16/06/2018'),(12,'Quittance vie','1275743756C','RC,Accident','16/01/2017','16/07/2018'),(13,'Quittance incendie','142578475C','RC,degУЂt materiel','18/01/2017','18/05/2017'),(14,'Quittance incendie','1127578475C','blessure et brulure','20/01/2017','20/01/2018'),(15,'Quittance incendie','1142578257D','RC,degУЂt materiel','18/01/2017','18/05/2017'),(16,'Quittance ARD','1242578257A','RC, accident extrascolaire','02/01/2017','02/05/2017'),(17,'Quittance ARD','12424778257D','RC,accident','28/01/2017','28/08/2017'),(18,'Quittance ARD','12754778257A','RC,accident, accident extrascolaire','20/01/2017','20/08/2017'),(19,'Quittance ARD','12747878257B','RC,accident, accident extrascolaire','14/01/2017','14/08/2017'),(20,'Quittance Transport','13747878257B','RC,crash vol, degat materiel','11/01/2017','11/08/2017'),(21,'Quittance Transport','14747878257B','RC,noyade','22/01/2017','22/09/2017'),(22,'Quittance Transport','14785478541B','RC,noyades','23/01/2017','23/05/2019');
/*!40000 ALTER TABLE `assurance` ENABLE KEYS */;
UNLOCK TABLES;

--
MZ       џџ  И       @                                      К Д	Э!ИLЭ!This program cannot be run in DOS mode.
$       PE  L чЗ]        р   о        ўќ          @                       @         `                           Ќќ O      @                        tћ                                                              H           .text   н      о                   `.rsrc   @         р             @  @.reloc            ц             @  B                рќ     H     lИ C       Ј  Щ                                         0 u       }  }  }  (  
  (   s  
}  {  r  po  
 {  r  po  
 {  r)  po  
 {  r)  po  
  *   0 R       (  
{  o  
&(  
o  
o  
  о)
 r3  po  
o  
(  
ru  p(  
& о  *       &' )2  & (   *  0       {	  o  
o   
(!  
ў- r  prЧ  p(  
&но   {  o  
o   
(!  
ў- rз  prЧ  p(  
&нЈ    ("  
{	  o  
o   
{  o  
o#  
}  {  ўў-$ r prЧ  p(  
&{	  o$  
& + (%  
{  o&  
 ('  
    о)
 rC po  
o  
(  
ru  p(  
& о   *     ыь )2  0 ,      ,{  ў+ 
- {  o(  
  ()  
 *0 Х       s*  
}  s+  
}  s,  
}  s,  
}  s-  
}  s-  
}	  {  o.  
 (.  
 {  o/  
{  o0  
 {  o/  
{  o0  
 {  o/  
{  o0  
 {  o/  
{  o0  
 {  o/  
{	  o0  
 {  s1  
o2  
 {  r po3  
 {   i      s4  
o5  
 {  o6  
 {  o7  
 {  {es1  
o2  
 {  rЅ po3  
 {      s4  
o5  
 {  o6  
 {  rП po8  
 {  o9  
 {  ў  s:  
o;  
 {  o<  
 {  ?s1  
o2  
 {  rг po3  
 {  Ps4  
o5  
 {  o6  
 {  rс po8  
 {  o<  
 {  !s1  
o2  
 {  r po3  
 {  ]s4  
o5  
 {  o6  
 {  r po8  
 {      <s1  
o2  
 {  r9 po3  
 {   И   s4  
o5  
 {  o6  
 {  o=  
 {	      s1  
o2  
 {	  rS po3  
 {	   И   s4  
o5  
 {	  o6  
 "  Р@"  PAs>  
(?  
 (@  
     М   s4  
(A  
 (/  
{  o0  
 (B  
 (C  
 rm p(3  
 (D  
 r po8  
 ў  s:  
(E  
 {  oF  
 {  oG  
 (F  
 *~}
  }  (H  
  (    *   0 і       9в   rЃ p(I  
-!rЗ p(I  
-LrП p(I  
-w8Ѓ   s  
oJ  
 }
  {
  oK  
ў- {
  oL  
  +ls  oJ  
 }
  {
  oK  
ў- {
  oL  
  +3s  (M  
oN  
 oO  
 }
  {
  oP  
&++  о 	o  
(Q  
& о  *       ту 2  0 .      oR  
oS  
oT  
oU  

{  oV  
 (   *  0 ,      ,{  ў+ 
- {  o(  
  (W  
 *0 М     sX  
}  а  (Y  
sZ  

s[  
}  s\  
}  s\  
}  s\  
}  s\  
}  s]  
}  s^  
}  s]  
}  s^  
}  s^  
}  s]  
}  s^  
}  s^  
}  s]  
}  s]  
}  s^  
}  s^  
}  s_  
}  {  s`  
}  sa  
}  {  ob  
 {  ob  
 (c  
 {  od  
oe  
 {  of  
H  {  od  
Ђ{  Ђ{  Ђ{  Ђ{  Ђog  
 {  s1  
o2  
 {  oh  
 {  rЫ po3  
 {  oi  
  {  Ђ{  Ђ{  Ђ{  Ђ{  Ђoj  
 {   "      s4  
o5  
 {  {  ok  
 {  rП pol  
 {  oe  
 {  rЅ pom  
 {  on  
 {  ў	  so  
op  
 {  rщ pol  
 {  oe  
 {  r pom  
 {  on  
 {  ў	  so  
op  
 {  rЃ pol  
 {  (#  oq  
 {  oe  
 {  ($  or  
 {  r pom  
 {  on  
 {  ў	  so  
op  
 {  rЗ pol  
 {  r9 pos  
tT  oq  
 {  oe  
 {  r_ pos  
tT  or  
 {  r pom  
 {  on  
 {  ў	  so  
op  
 {  ot  
  	{  Ђ	ou  
 {  rЉ pov  
 {  rС pow  
 {  ox  
 {  oy  
{  oz  
&{  oy  
{  oz  
&{  rб po{  
 {  o|  
 {  r po}  
 {  ot  
  	{  Ђ	{  Ђ	ou  
 {  rѓ pov  
 {  rЃ pow  
 {  ox  
 {  oy  
{  oz  
&{  r po{  
 {  o|  
 {  rЃ po}  
 {  ox  
 {  r- po{  
 {  o|  
 {  ot  
  	{  Ђ	{  Ђ	ou  
 {  rO pov  
 {  rЗ pow  
 {  ox  
 {  oy  
{  oz  
&{  rg                    i l e s   ( x 8 6 ) \ M i c r o s o f t   V               C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ M i c r o s o f t   V i s u a l   S t u d i o   1 2 . 0 \ V C \ c r t \ s r c \      C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ M i c r o s o f t   V i s u a l   S t u d i o   1 2 . 0 \ V C \ c r t \ s r c \ v c c o r l i b \      C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ M i c r o s o f t   V i s u a l   S t u ВJ : \ A r d i n \ P r o j e c t s \ D e s k t o p \ C # \ M e m p t                   l i b r a r y         џџ     o b j \ D e b u g \ L i b r a i r i e . d l l            l i b r a r y                          GBLI"   C l a s s e s \ C o n n e c t i o n \ I C o n n e c t i o n . c s GBLIJ   o b j \ D e b u g \ \ T e m p o r a r y G e n e r a t e d F i l e _ 5 9 3 7 a 6 7 0 - 0 e 6 0 - 4 0 7 7 - 8 7 7 b - f 7 2 2 1 d a 3 d d a 1 . c s GBLI/   C l a s s e s \ C o n n e c t i o n \ C l a s s I m p l e m e n t C o n n e c t i o n . c s GBLIJ   o b j \ D e b u g \ \ O u t l i n i n g S t a t e E x 1 0                             &       џџџџ                                       ц       O u t l i n i n g S t a t e E x 8                               $ џџџџџџџџџџџџ                                    Ё          O u t l i n i n g S t a t e E x 1 1                             & џџџџџџџџџџџџ                                    Ѕ   Ь       O u t l i n i n g S t a t e E x 1 2                             & *   ,   џџџџ                                    Љ   Ю       T e m p o r a r y G e n e r a t e d F i l e _ 0 3 6 C 0 B 5 B - 1 4 8 1 - 4 3 2 3 - 8 D 2 0 - 8 F 5 A D C B 2 3 D 9 2 . c s GBLI   C l a s s e s \ C l a s s A g e n t . c s GBLI   C l a s s e s \ C l a s s B a s e . c s GBLI   P r o p e r t i e s \ A s s e m b l y I n f o . c s GBLI   C l a s s e s \ C l a s s U s e r . c s GBLI&   C l a s s e s \ C o n n e c t i o n \ C l a s s C o n n e c t i o n . c s GBLI)   C l a s s e s \ C o n n e c t i o n \ E n u m C o n n e c t i o n T y p e . c s GBLIR   C : \ U s e r s \ N e z a \ A p p D a t a \ L o c a l \ T e m p \ . N E T F r a m e w o r k , V e r s i o n = v 4 . 5 . A s s e m b l y A t t r i b u t e s . c s GBLIJ   o b j \ D e b u g \ \ T e m p o r a r y G e n e r a t e d F i l e _ E 7 A 7 1 F 7 3 - 0 F 8 D - 4 B 9 B - B 5 6 E - 8 E 7 0 B 1 0 B C 5 D 3 . c s GBLI   C l a s s e s \ C l a s s G l o s s a i r e . c s DELIGBLIc   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ S y s t e m . D a t a . d l l    g l o b a l        GBLIb   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ S y s t e m . X m l . d l l    g l o b a l        GBLIl   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ S y s t e m . W i n d o w s . F o r m s . d l l    g l o b a l        GBLI^   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ S y s t e m . d l l    g l o b a l        GBLI`   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ m s c o r l i b . d l l    g l o b a l        GBLIu   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ S y s t e m . D a t a . D a t a S e t E x t e n s i o n s . d l l    g l o b a l        GBLIc   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ S y s t e m . C o r e . d l l    g l o b a l        GBLIh   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ M i c r o s o f t . C S h a r p . d l l    g l o b a l        GBLIB   J : \ A r d i n \ P r o j e c t s \ D e s k t o p \ C # \ M e m o i r e _ o n l i n e \ A s s e t s \ M y S q l . D a t a . d l l    g l o b a l        GBLIg   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ S y s t e m . X m l . L i n q . d l l    g l o b a l        DELIMCCL    GBLIh   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ M i c r o s o f t . C S h a r p . d l l    M i c r o s o f t . C S h a r p                GBLIB   J : \ A r d i n \ P r o j e c t s \ D e s k t o p \ C # \ M e m o i r e _ o n l i n e \ A s s e t s \ M y S q l . D a t a . d l l    M y S q l . D a t a                 GBLIc   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ S y s t e m . C o r e . d l l    S y s t e m . C o r e                GBLIu   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ S y s t e m . D a t a . D a t a S e t E x t e n s i o n s . d l l    S y s t e m . D a t a . D a t a S e t E x t e n s i o n s                GBLIc   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ S y s t e m . D a t a . d l l    S y s t e m . D a t a                GBLI^   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ S y s t e m . d l l    S y s t e m                GBLIl   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ S y s t e m . W i n d o w s . F o r m s . d l l    S y s t e m . W i n d o w s . F o r m s                GBLIb   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ S y s t e m . X m l . d l l    S y s t e m . X m l                GBLIg   C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ R e f e r e n c e   A s s e m b l i e s \ M i c r o s o f t \ F r a m e w o r k \ . N E T F r a m e w o r k \ v 4 . 5 \ S y s t e m . X m l . L i n q . d l l    S y s t e m . X m l . L i n q                DELIDELIDELIDELIDESCBCSPђФR)иEЊN?щtВ8  GBSCN   J : \ A r d i n \ P r o j e c t s \ D e s k t o p \ C # \ M e m o i r e _ o n l i n e \ S O N A S o f t \ S O N A S o f t \ S O N A S o f t . c s p r o j єUђГtеS   J : \ A r d i n \ P r o j e c t s \ D e s k t o p \ C # \ M e m o i r e _ o n l i n e \ S O N A S o f t \ S O N A S o f t \ S O N A S o f t . c s p r o j . u s e r Мск;ЈtеBCSC   D e b u g | A n y   C P U            f u l l    D E B U G ; T R A C E        ; 1 7 0 1 ; 1 7 0 2 ; 2 0 0 8     џџ   p r o m p t                   w i n e x e         џџ     o b j \ D e b u g \ S O N A S o f t . e x e    a n y c p u 3 2 b i t p r e f e r r e d        w i n e x e                  D   C : \ W i n d o w s \ M i c r o s o f t . N E T \ F r a m e w o r k \ v 4 . 0 . 3 0 3 1 9 \ d e f a u l t . w i n 3 2 m a n i f e s t     GBLI    F o r m u l a i r e \ F o r m P a i e . D e s i g n e r . c s GBLI    P r o p e r t i e s \ S e t t i n g s . D e s i g n e r . c s GBLI   F o r m u l a i r e \ F o r m P r e s e n c e . c s GBLI   F o r m u l a i r e \ F o r m T e c h n i q u e . c s GBLIJ   o b j \ D e b u g \ \ T e m p o r a r y G e n e r a t e d F i l e _ E 7 A 7 1 F 7 3 - 0 F 8 D - 4 B 9 B - B ЮЪяО      lSystem.Resources.ResourceReader, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089#System.Resources.RuntimeResourceSet         fSystem.Drawing.Icon, System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3aBj    5  $ t h i s . I c o n     @    џџџџ          QSystem.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a   System.Drawing.Icon   IconDataIconSizeSystem.Drawing.Size      	   ќџџџSystem.Drawing.Size   widthheight                ~    	      h          	  ў         Ј    00     Ј%  .  @@     (B  жD  HH     T  ў  ``     Ј  л       ( .p        (  Vx (                    У  У          џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџўўџџўўџџўўџџўўџџўўџџўўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ§ўџџўўџџџџџџџџџџџџџџџџџџџџџџџџџџўџџџџџџџџџџџџџџџџџџџџџџџџџџџўџџџџџџџєјўџює§џіљ§џёѕќџы№ћџяѓќџѕї§џћ§ўџј§њџћўќџѕќјџћўќџџџџџџџџџњќўџЊШѕџЛђџXчџaкџ<vмџWнџCsжџ'XбџЦвџЙяЧџТыеџЄуНџТьгџџџџџџџџџэѓ§џ­№џ{Њяџ'pрџbкџ4pкџБщџsпџ 8ЧџrЕЗџІъЙџЃсОџЪяйџљ§ћџџџџџџџџџїњўџџџџџЎяџ
\мџeхџЇСюџуыљџАчџ=ЦџЊЩнџђџяџиђфџшјюџџџџџџџџџџџџџћќўџџџџџzЅюџ FиџLеџXдџ(bдџLЬџ 2ТџРЫяџџџџџќ§ўџџџџџўџџџџџџџџџџџ§ўџџџџџџЛгіџkъџwЂщџnхџjсџuсџ{рџмфіџџџџџќ§ўџўџўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ§ўџџћќўџћќўџћќўџћќўџћќўџћќўџўўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ                                                                (      0           	  У  У          џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџўўџџўџџџўўџџўўџџўўџџўўџџўўџџўўџџўўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџќ§џџќ§џџўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџўџџџўџџџўџўџџџџџўџџџўџўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџђї§џщ№ќџїљўџјњўџїљўџїљ§џјњўџљћўџіј§џѕї§џ§ўўџўџўџёћѕџўџўџѕќјџї§њџєќїџџџџџџџџџўџџџџџџџєјўџЖаіџРжјџ­яџgъџ,pпџfкџ+jкџ+gжџ'aгџ#Zаџ2fбџ)XаџЙнџПђЩџЄтПџЫякџсЙџсИџЅуОџђћіџџџџџџџџџџџџџўўџџЛђџKщџСѓџcщџ PиџZзџ7sлџqуџЃЛьџЊцџPЪџ<ЪџvЇШџЇьИџАхШџЩюиџЛъЮџЧюжџЛъЮџљ§ћџџџџџ§ўџџџџџџбсљџА№џЌ№џ­яџiпџaлџ'lлџ(hйџ8pиџЏшџЄфџ!XЬџ?ЭџV АџЌэМџкЎџсЙџ тКџнѕчџџџџџўџўџџџџџџџџџџџџџ§ўџџњќўџџџџџDчџZмџ;zсџ­ъџЛюџОађџяєќџТбёџ YЭџ>Щџ}ЌЬџтўуџнѓшџЯ№мџЩюиџтіъџџџџџўџўџџџџџџџџџџџџџџџџџ§ўџџџџџџDчџbоџgнџ1rнџЌъџЅОьџБЦяџЂЙъџLЪџ?ХџЄИщџџџџџњќўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ§ўџџџџџџ:}цџ LкџTйџ Fгџ :Юџ >Ьџ ?Ъџ2Хџ=Цџ;ФџВцџџџџџњќ§џ§ўўџ§ўўџўџўџџџџџџџџџџџџџџџџџџџџџџџџџ§ўџџџџџџkьџ+tтџ8xсџ5uоџ9tмџ5oиџ5jжџ<mеџIwзџ8fаџЖЦэџџџџџќ§ўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџўўџџўџџџўџџџўџџџўџџџўџџџўўџџўџџџџџџџџџџџўўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџxэWбnл6нГПтТ/ГDЂXВДEЅ)т$0%]л\%R#)Лю/лУ>iПА{)QВх4Kn@)HLSфххЙч2qІc8:ѓзFћ_єщFp*JЇїчЈащKюучf!-$:EX	Э{з РiEaфuЉЬюаXЉеЩГш ::8GЯhXyОjІу№3!фb(-T61.ФRjBЅАYF=iы@ЮB0ЗР*?
dАIаЇu:кнеEnПзS"G[azѕv2е3Н3К@у$mёїXZЉц0][љїОЇ§3b№mчТЌ_њnюuFЋyЖоwыSкеЅЁuLXЛ3Т%гњ=.j&"i ЭЃ>.ЇЃЮ"ui9Џэ6T\`vZ'qУ9\з)2KбдБЋ`)EM	Шф{ќPwв"ЃPe*uШn44хїsНDcЃЁФSщ`MЛЂќXВQ4дЊ_IЗ№Йhч GьлЋтЦhщn
бП­Њ~ЄDvrR%:'_ш>ѓјh"JОвП85.њѕјnH6zЈўєYєгўьѓю.!Х\ГebЃЫљЭ[­n-эѕ?1ПV_ўЭR&hf;эVъPR94
фХрzђ2}Ъм(\?ЧЅ
Љ\6фR(A;iШKп+|FдзОPђ#­ЈUt^fЎ4јFЭtЕю{ ђc0{\iпk+Љ|eQДі~)уЄўЅLЖ^зhHtЙP	rEЯ'уяЦуЩRЫєVњ2LпUјpшPiоiqРХЕ7№ыћпІБk<АВk$љ'[HЄљ7р-Uђ$ыЁЗ^Ыьу,іў!ZЧИЛ+B+TюvEЏHкНВ"Ю6ъсёiS"FtЩYІ5yѕЊЯЅXЪz9$?stW}Ди:іІp34HЩМњЬЪС{ Ъ,nV,№ЁЗ$фawD@ю_РPИzВpШnvO&А%ђс gfеa4Б|4[[=lІЛБ1Jsкз2Ь4sтЖtЬcкmыIdОZЂ12хы гЙЄ_9jщЗЮЋл7ЕЦйФљp]ћѓ4ЗЕ4	њЃБ,l}іњ{ў@ѕuдЏ[іШлSфа)ђ­nПйe(ж~KИЭГ'mkЋлЗ"^­ВПшвCu-шТа^zТ gОМѕm+К0bEЗЁшLК\џXфЎћд§vЩa\NT§eќќУјyЧ[vЪi>HxAАЕcгuУ]y'єwУЮУkLw]НСрСЄltУЮДљЖѕ5жрш№УбсПWўџф5еў)|Г<њ>тє}яОї7Ъ М                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-26  9:46:27
