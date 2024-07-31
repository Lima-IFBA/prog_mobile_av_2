-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: marcas
-- ------------------------------------------------------
-- Server version       8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comentario` varchar(510) NOT NULL,
  `feed` int NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `conta` varchar(255) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feed_idx` (`feed`),
  CONSTRAINT `fk_comentarios_feeds` FOREIGN KEY (`feed`) REFERENCES `feeds` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES 
(1, 'Excelente build, muito útil!', 1, 'João Silva', 'joao.silva@example.com', '2024-07-30 12:00:00'),
(2, 'Gostei dessa build, vou testar.', 2, 'Maria Souza', 'maria.souza@example.com', '2024-07-30 13:30:00'),
(3, 'Build impressionante, aumentou muito meu DPS!', 1, 'Carlos Pereira', 'carlos.pereira@example.com', '2024-07-30 14:00:00'),
(4, 'A melhor build que já usei até agora!', 3, 'Ana Oliveira', 'ana.oliveira@example.com', '2024-07-30 15:00:00'),
(5, 'Funciona muito bem em raids!', 2, 'Felipe Lima', 'felipe.lima@example.com', '2024-07-30 16:00:00'),
(6, 'Muito boa para PvP!', 1, 'Lucas Mendes', 'lucas.mendes@example.com', '2024-07-30 17:00:00'),
(7, 'Essa build é top!', 2, 'Isabela Santos', 'isabela.santos@example.com', '2024-07-30 18:00:00'),
(8, 'Recomendo para qualquer tipo de missão.', 3, 'Pedro Almeida', 'pedro.almeida@example.com', '2024-07-30 19:00:00'),
(9, 'Ótima build para ataques rápidos.', 4, 'Juliana Silva', 'juliana.silva@example.com', '2024-07-30 20:00:00'),
(10, 'Build muito completa, gostei!', 5, 'Marcelo Oliveira', 'marcelo.oliveira@example.com', '2024-07-30 21:00:00'),
(11, 'Adorei a build, muito bem detalhada!', 1, 'Fernanda Costa', 'fernanda.costa@example.com', '2024-07-30 22:00:00'),
(12, 'Uma das melhores builds que já vi.', 2, 'Ricardo Fernandes', 'ricardo.fernandes@example.com', '2024-07-30 23:00:00'),
(13, 'Excelente para solo, recomendo!', 1, 'Beatriz Oliveira', 'beatriz.oliveira@example.com', '2024-07-31 00:00:00'),
(14, 'Vale a pena testar em grupo.', 3, 'Eduardo Silva', 'eduardo.silva@example.com', '2024-07-31 01:00:00'),
(15, 'Muito útil para eventos especiais.', 2, 'Patricia Lima', 'patricia.lima@example.com', '2024-07-31 02:00:00'),
(16, 'A build é muito boa para PvE!', 1, 'Vinícius Santos', 'vinicius.santos@example.com', '2024-07-31 03:00:00'),
(17, 'Funciona bem em missões de alto nível.', 2, 'Larissa Almeida', 'larissa.almeida@example.com', '2024-07-31 04:00:00'),
(18, 'Ótima build, bem equilibrada.', 3, 'Roberta Costa', 'roberta.costa@example.com', '2024-07-31 05:00:00'),
(19, 'Excelente para raids em grupo.', 4, 'Gustavo Silva', 'gustavo.silva@example.com', '2024-07-31 06:00:00'),
(20, 'Muito útil para PvP e PvE.', 5, 'Camila Rocha', 'camila.rocha@example.com', '2024-07-31 07:00:00'),
(21, 'Build bem ajustada para raids.', 1, 'Júlia Martins', 'julia.martins@example.com', '2024-07-31 08:00:00'),
(22, 'Excelente performance em batalhas!', 2, 'Fábio Costa', 'fabio.costa@example.com', '2024-07-31 09:00:00'),
(23, 'Muito boa para qualquer tipo de missão.', 3, 'Amanda Ferreira', 'amanda.ferreira@example.com', '2024-07-31 10:00:00'),
(24, 'Ótima build, vale a pena!', 4, 'Lucas Almeida', 'lucas.almeida@example.com', '2024-07-31 11:00:00'),
(25, 'Funciona muito bem em PvP.', 5, 'Juliana Costa', 'juliana.costa@example.com', '2024-07-31 12:00:00'),
(26, 'Boa build para aumentar o dano.', 1, 'Ricardo Souza', 'ricardo.souza@example.com', '2024-07-31 13:00:00'),
(27, 'Recomendo para jogadores avançados.', 2, 'Natalia Santos', 'natalia.santos@example.com', '2024-07-31 14:00:00'),
(28, 'Muito eficiente em raids!', 3, 'Renato Costa', 'renato.costa@example.com', '2024-07-31 15:00:00'),
(29, 'Ótima escolha para PvP!', 4, 'Mariana Rocha', 'mariana.rocha@example.com', '2024-07-31 16:00:00'),
(30, 'Excelente para builds rápidas.', 5, 'Guilherme Lima', 'guilherme.lima@example.com', '2024-07-31 17:00:00'),
(31, 'Essa build é fantástica!', 1, 'Aline Pereira', 'aline.pereira@example.com', '2024-07-31 18:00:00'),
(32, 'Ótima para PvE e PvP.', 2, 'Bruno Almeida', 'bruno.almeida@example.com', '2024-07-31 19:00:00'),
(33, 'Muito bem configurada, gostei!', 3, 'Tatiane Costa', 'tatiane.costa@example.com', '2024-07-31 20:00:00'),
(34, 'A melhor build que já usei!', 4, 'Thiago Silva', 'thiago.silva@example.com', '2024-07-31 21:00:00'),
(35, 'Muito boa para grupos!', 5, 'Luana Souza', 'luana.souza@example.com', '2024-07-31 22:00:00'),
(36, 'Excelente build, recomendo!', 1, 'Marcelo Costa', 'marcelo.costa@example.com', '2024-07-31 23:00:00'),
(37, 'Boa performance em todas as missões.', 2, 'Fernanda Almeida', 'fernanda.almeida@example.com', '2024-08-01 00:00:00'),
(38, 'Ótima para ataques rápidos.', 3, 'Roberto Oliveira', 'roberto.oliveira@example.com', '2024-08-01 01:00:00'),
(39, 'Muito útil em PvP e PvE.', 4, 'Vanessa Rocha', 'vanessa.rocha@example.com', '2024-08-01 02:00:00'),
(40, 'Funciona muito bem em raids.', 5, 'André Lima', 'andre.lima@example.com', '2024-08-01 03:00:00'),
(41, 'Adorei a build, muito bem detalhada!', 1, 'Bruna Santos', 'bruna.santos@example.com', '2024-08-01 04:00:00'),
(42, 'Excelente para PvP.', 2, 'Felipe Costa', 'felipe.costa@example.com', '2024-08-01 05:00:00'),
(43, 'Build bem equilibrada!', 3, 'Tatiane Silva', 'tatiane.silva@example.com', '2024-08-01 06:00:00'),
(44, 'Recomendo para todos os jogadores!', 4, 'Lucas Ferreira', 'lucas.ferreira@example.com', '2024-08-01 07:00:00'),
(45, 'Muito útil para raids!', 5, 'Camila Almeida', 'camila.almeida@example.com', '2024-08-01 08:00:00'),
(46, 'Ótima build para todos os tipos de missão.', 1, 'Thiago Costa', 'thiago.costa@example.com', '2024-08-01 09:00:00'),
(47, 'Muito boa para eventos especiais.', 2, 'Ana Santos', 'ana.santos@example.com', '2024-08-01 10:00:00'),
(48, 'Excelente performance em PvP.', 3, 'Juliano Lima', 'juliano.lima@example.com', '2024-08-01 11:00:00'),
(49, 'Boa build para todos os tipos de missão.', 4, 'Mariana Costa', 'mariana.costa@example.com', '2024-08-01 12:00:00'),
(50, 'Funciona muito bem em raids.', 5, 'Júlio Silva', 'julio.silva@example.com', '2024-08-01 13:00:00');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES 
(1, 'Titan', 'titan_avatar.png'),
(2, 'Hunter', 'hunter_avatar.png'),
(3, 'Warlock', 'warlock_avatar.png');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeds`
--

DROP TABLE IF EXISTS `feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `popularity` varchar(255) NOT NULL,
  `buildDestiny` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feeds_buildsDestiny_idx` (`buildDestiny`),
  CONSTRAINT `fk_feeds_buildsDestiny` FOREIGN KEY (`buildDestiny`) REFERENCES `buildsDestiny` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeds`
--

LOCK TABLES `feeds` WRITE;
/*!40000 ALTER TABLE `feeds` DISABLE KEYS */;
INSERT INTO `feeds` VALUES 
(1, '2024-07-30 10:00:00','Meta', 1),
(2, '2024-07-30 11:00:00','Meta', 2),
(3, '2024-07-30 12:00:00','Média', 3),
(4, '2024-07-30 13:00:00','Média', 4),
(5, '2024-07-30 14:00:00','Baixa', 5);
/*!40000 ALTER TABLE `feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feed` int NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_likes_feeds_idx` (`feed`),
  CONSTRAINT `fk_likes_feeds` FOREIGN KEY (`feed`) REFERENCES `feeds` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES 
(1, 1, 'joao.silva@example.com'),
(2, 1, 'maria.souza@example.com'),
(3, 1, 'carlos.pereira@example.com'),
(4, 1, 'ana.oliveira@example.com'),
(5, 1, 'felipe.lima@example.com'),
(6, 2, 'joao.silva@example.com'),
(7, 2, 'maria.souza@example.com'),
(8, 2, 'carlos.pereira@example.com'),
(9, 2, 'ana.oliveira@example.com'),
(10, 2, 'felipe.lima@example.com'),
(11, 3, 'joao.silva@example.com'),
(12, 3, 'maria.souza@example.com'),
(13, 3, 'carlos.pereira@example.com'),
(14, 3, 'ana.oliveira@example.com'),
(15, 3, 'felipe.lima@example.com'),
(16, 4, 'joao.silva@example.com'),
(17, 4, 'maria.souza@example.com'),
(18, 4, 'carlos.pereira@example.com'),
(19, 4, 'ana.oliveira@example.com'),
(20, 4, 'felipe.lima@example.com'),
(21, 5, 'joao.silva@example.com'),
(22, 5, 'maria.souza@example.com'),
(23, 5, 'carlos.pereira@example.com'),
(24, 2, 'ana.oliveira@example.com'),
(25, 1, 'felipe.lima@example.com'),
(26, 1, 'lucas.mendes@example.com'),
(27, 1, 'isabela.santos@example.com'),
(28, 1, 'pedro.almeida@example.com'),
(29, 1, 'juliana.silva@example.com'),
(30, 1, 'marcelo.oliveira@example.com'),
(31, 2, 'lucas.mendes@example.com'),
(32, 2, 'isabela.santos@example.com'),
(33, 2, 'pedro.almeida@example.com'),
(34, 2, 'juliana.silva@example.com'),
(35, 2, 'marcelo.oliveira@example.com');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buildsDestiny`
--

DROP TABLE IF EXISTS `buildsDestiny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buildsDestiny` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(510) NOT NULL,
  `element` varchar(255) NOT NULL,
  `url` varchar(1020) NOT NULL,
  `imagem1` varchar(255) NOT NULL,
  `imagem2` varchar(255) DEFAULT NULL,
  `imagem3` varchar(255) DEFAULT NULL,
  `class` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_buildsDestiny_classes_idx` (`class`),
  CONSTRAINT `fk_buildsDestiny_classes` FOREIGN KEY (`class`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildsDestiny`
--

LOCK TABLES `buildsDestiny` WRITE;
/*!40000 ALTER TABLE `buildsDestiny` DISABLE KEYS */;
INSERT INTO `buildsDestiny` VALUES 
(1, 'Build Titan Defesa', 'Build focada em defesa e resistência.', 'Arc', 'https://example.com/build1', 'titan_build1_img1.jpeg', 'titan_build1_img2.jpeg', 'titan_build1_img3.jpeg', 1),
(2, 'Build Hunter Agilidade', 'Build focada em agilidade e furtividade.', 'Solar', 'https://example.com/build2', 'hunter_build2_img1.jpeg', 'hunter_build2_img2.jpeg', 'hunter_build2_img3.jpeg', 2),
(3, 'Build Warlock Suporte', 'Build focada em suporte e cura.', 'Void', 'https://example.com/build3', 'warlock_build3_img1.jpeg', 'warlock_build3_img2.jpeg', 'warlock_build3_img3.jpeg', 3),
(4, 'Build Titan Ofensiva', 'Build focada em ataque e dano.', 'Arc', 'https://example.com/build4', 'titan_build4_img1.jpeg', 'titan_build4_img2.jpeg', 'titan_build4_img3.jpeg', 1),
(5, 'Build Hunter Precisão', 'Build focada em precisão e acertos críticos.', 'Solar', 'https://example.com/build5', 'hunter_build5_img1.jpeg', 'hunter_build5_img2.jpeg', 'hunter_build5_img3.jpeg', 2);
/*!40000 ALTER TABLE `buildsDestiny` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-16 21:48:40
