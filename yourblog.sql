-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2022 at 06:57 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yourblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `subject`, `message`, `date`) VALUES
(1, 'harsh', 'jsdfjkhlas', 'sfjlksajllf', 'isjdlkfjskdjgfjkshggjas', '2022-07-27 20:58:17'),
(2, 'harsh', 'harshharsh312@gmail.com', 'testing', 'this is for testing website', '2022-07-28 17:12:23'),
(3, 'harsh', 'sjkadhfkhjasd', 'sjkadhfkjashd', 'asjdkfhkjhsaddkjfh ', '2022-07-28 21:27:05'),
(4, 'awerqw', 'qwtewert', 'harsha asgsdg', 'harsh maksmkajsdfjoijo', '2022-07-28 21:28:42'),
(5, 'awerqw', 'qwtewert', 'harsha asgsdg', 'harsh maksmkajsdfjoijo', '2022-07-28 21:48:31'),
(6, 'sdkfa', 'harshharsh312@gmail.com', 'sdfiaiasodf', 'ksjadhfjkasdhfksadhjf', '2022-07-28 21:49:30'),
(7, 'sdkfa', 'rp17027@gmail.com', 'sdfiaiasodf', 'ksjadhfjkasdhfksadhjf', '2022-07-28 21:56:30'),
(8, 'sdkfa', 'rp4201727@gmail.com', 'sdfiaiasodf', 'ksjadhfjkasdhfksadhjf', '2022-07-28 22:03:40'),
(9, 'sdkfa', 'rp4201727@gmail.com', 'sdfiaiasodf', 'ksjadhfjkasdhfksadhjf', '2022-07-28 22:03:55'),
(10, 'sdkfa', 'rp4201727@gmail.com', 'sdfiaiasodf', 'ksjadhfjkasdhfksadhjf', '2022-07-28 22:05:45'),
(11, 'sdkfa', 'rp4201727@gmail.com', 'sdfiaiasodf', 'ksjadhfjkasdhfksadhjf', '2022-07-28 22:06:59'),
(12, 'hksjafh', 'sjkadfhjk', 'kjsahdfkj', 'kjsahdfjkhasdfhk', '2022-07-28 22:20:02'),
(13, 'hksjafh', 'sjkadfhjk', 'kjsahdfkj', 'kjsahdfjkhasdfhk', '2022-07-28 22:20:58'),
(14, 'jkasdhfk', 'jasdhfkjh', 'jashdfkjhas', 'jkhkjashdf', '2022-07-28 22:22:21'),
(15, 'manav dhami', 'manav.dhami10@gmail.com', 'hello', 'kslkadjflkjsakdfjkahjsln vfnoiwaenhfiul', '2022-07-28 22:32:27'),
(16, 'kunj', 'rp4201727@gmail.com', 'Regarding connection', 'lmao, hello harsh i would like to connect you please reply if you are seeing my message', '2022-07-28 22:43:52'),
(17, 'kunj', 'rp4201727@gmail.com', 'Regarding connection', 'lmao, hello harsh i would like to connect you please reply if you are seeing my message', '2022-07-28 22:47:08'),
(18, 'kunj', 'rp4201727@gmail.com', 'Regarding connection', 'lmao, hello harsh i would like to connect you please reply if you are seeing my message', '2022-07-28 22:50:22'),
(19, 'kunj', 'rp4201727@gmail.com', 'Regarding connection', 'lmao, hello harsh i would like to connect you please reply if you are seeing my message', '2022-07-28 22:51:57'),
(20, 'pathik', 'pavhddkrkv@gmail.com', 'heysdjlkfsdjfkjsahdjk', 'lksljadfkjasdjljkfjksadhfnhkhjkdsf', '2022-07-28 23:12:38'),
(21, 'harsh', 'harshharsh312@gmail.com', 'huh', 'OK!', '2022-07-29 10:07:56'),
(22, 'Harsh', 'harsh.mict19@sot.pdpu.ac.in', 'HARSH MAKADIYA', 'HI', '2022-07-30 21:58:21'),
(23, 'harsh', 'harsh.mict19@sot.pdpu.ac.in', 'harsh', 'hello', '2022-07-30 22:01:04'),
(24, 'jsadjf', 'sjdkfj', 'jsdf', 'jksdafhlsd', '2022-07-30 22:01:28'),
(25, 'jsadjf', 'harshharsh312@gmail.com', 'jsdf', 'jksdafhlsd', '2022-07-30 22:02:00');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(50) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `img_file`, `slug`, `timestamp`) VALUES
(1, 'What is javascript?', 'JavaScript is a scripting or programming language that allows you to implement complex features on web pages — every time a web page does more than just sit there and display static information for you to look at — displaying timely content updates, interactive maps, animated 2D/3D graphics, scrolling video jukeboxes, etc. — you can bet that JavaScript is probably involved. It is the third layer of the layer cake of standard web technologies, two of which (HTML and CSS) we have covered in much more detail in other parts of the Learning Area.\n\n', 'javascript.png', 'first-post', '2022-07-31 11:27:42'),
(2, 'This is my second blog', 'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar. The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way. When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then\n\n', 'second.png', 'second-blog', '2022-07-29 16:01:07'),
(3, 'What Is Cryptocurrency?\n', 'A cryptocurrency is a digital or virtual currency that is secured by cryptography, which makes it nearly impossible to counterfeit or double-spend. Many cryptocurrencies are decentralized networks based on blockchain technology—a distributed ledger enforced by a disparate network of computers. A defining feature of cryptocurrencies is that they are generally not issued by any central authority, rendering them theoretically immune to government interference or manipulation.\n', 'cryptocurrency.jpg', 'third-post', '2022-07-29 16:31:12'),
(4, 'this is my first blog', 'What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'image_2.jpg', 'fourth-post', '2022-07-31 11:27:57'),
(5, 'what is cs50', 'Introduction to Computer Science from Harvard, better known as CS50, is the largest course on the Harvard campus and more than 2,000,000 learners worldwide have registered for the course on edX. We are excited to offer a series of introductory CS50 courses and Professional Certificate programs from Harvard that are open to learners of all backgrounds looking to explore computer science, mobile app and game development, business technologies, and the art of programming.\n', 'cs50.jpg', 'fifth-blog', '2022-07-31 11:37:37'),
(6, 'Why education is important?', 'It helps people become better citizens, get a better-paid job, shows the difference between good and bad. Education shows us the importance of hard work and, at the same time, helps us grow and develop. Thus, we are able to shape a better society to live in by knowing and respecting rights, laws, and regulations.\n', 'education.jpg', 'sixth-post', '2022-07-29 16:31:12'),
(7, 'Flask VS Django', 'Django and Flask are the web frameworks of Python. As we know, Python is the most versatile programming language which provides a wide range of web framework. A web developer has the option to choose from these frameworks. A programmer has the flexibility to take advantage of the full-stack Python web frameworks. It enhances the development of complex web applications. Python also provides an option to choose for micro and lightweight Python web frameworks to build simple web applications without putting extra time and effort.', 'flask_vs_django.jpeg', 'flask_vs_django', '2022-08-03 10:21:48'),
(8, 'Sqlalchemy', 'SQLAlchemy is the Python SQL toolkit and Object Relational Mapper that gives application developers the full power and flexibility of SQL.  It provides a full suite of well known enterprise-level persistence patterns, designed for efficient and high-performing database access, adapted into a simple and Pythonic domain language.', 'sqlalchemy.jpg', 'sqlalchemy', '2022-08-03 14:26:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
