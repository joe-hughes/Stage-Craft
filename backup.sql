-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: database    Database: lamp
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pwasmmhxaezeiztpzxibccovwyujaddapczo` (`ownerId`),
  CONSTRAINT `fk_ckypohqdpphzuztulyezecmlgytsixmtmqtb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pwasmmhxaezeiztpzxibccovwyujaddapczo` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_izfybajecgioddqvubqokakeiywfyeqeoyfx` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_rsqbyoqdwcqtqowcnrekpkaptpnoxyslygpg` (`dateRead`),
  KEY `fk_ncocxoewimswjqetsmolvybunhvohbojiegy` (`pluginId`),
  CONSTRAINT `fk_ncocxoewimswjqetsmolvybunhvohbojiegy` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xgwqqtfyfrtodoiwmrsouacnnwsyulbfuxos` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hxxulmgynuqjbfjojqpxoevenwbmjycpoycq` (`sessionId`,`volumeId`),
  KEY `idx_mowdizryqppohnrkbeuwpvoyyydtyunaspal` (`volumeId`),
  CONSTRAINT `fk_aikodaagsronjkbrdsqjhvfndfrmzeoexwdq` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_budvobtradsuinpibcesktxpqanfmhgsrqej` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_edlnwxiicnzwzuvtvaapensuirdgbxntmbue` (`filename`,`folderId`),
  KEY `idx_uhosmiasgdrxkyvavzdztjxgnmbzboogxpys` (`folderId`),
  KEY `idx_nlswoobjapvrtfpaivztznyclnuacrjydlye` (`volumeId`),
  KEY `fk_hxeoukpixhbdvsbuxugutfmokahzzgxnfkta` (`uploaderId`),
  CONSTRAINT `fk_cuipxuxywqaygtigpdytemjsgtakvxkulvyq` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gtytsfubysjcdoqjedfxvqudnfdslkxhkiqb` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hxeoukpixhbdvsbuxugutfmokahzzgxnfkta` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sdbcndqowglsigighqozbuwnkakkziwtkeia` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hxtjjoeotofokgsckjcujepwhsmhnndanuqt` (`groupId`),
  KEY `fk_xavuwkzrqshgaqpxakibwampdkvydunzfopf` (`parentId`),
  CONSTRAINT `fk_ocxmtriojcmevwkudopvvzkhgbhslezqwujr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xavuwkzrqshgaqpxakibwampdkvydunzfopf` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zkvwakfjyywervhzcjrglvjbmricynqyrfmi` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mfvmrqhtxzvzyrbjrblnwaoholvcwivynjcb` (`name`),
  KEY `idx_mmenfkdxupdhgwczulpfzpaygecauubxvjdg` (`handle`),
  KEY `idx_xavlrautgylviplfdydabdsswgewszuzowsg` (`structureId`),
  KEY `idx_rfofrfvalgnyjnxiveorvgnduwwjfkorreog` (`fieldLayoutId`),
  KEY `idx_sqinfqevttqockzgemqoqfgneuzveoviusie` (`dateDeleted`),
  CONSTRAINT `fk_janhfdggdijwkhjyinkhixemyvxgogautmws` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ohdaqifpppjkyeczhywzvcqdiksvrjkpgyoa` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tfypawyetxxryddnsiiedscyfsloaiblhfld` (`groupId`,`siteId`),
  KEY `idx_didbromycjlnlsccuddhvsghippkhugwhlun` (`siteId`),
  CONSTRAINT `fk_pxrlfsmqwawbcodrleptjontalhufgclodbm` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wzhhyxldibblcibtrnnbxihhdoitfuqbhxyj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_wqwrepireqnotzmbvnsqmfsiffpmlxvlgxva` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_bvmzdlsztuiazhqwuwyjifpdsgrjckpsgoav` (`siteId`),
  KEY `fk_rpcwbtpidornphvmmowhkiiojdbtzfcgmkai` (`userId`),
  CONSTRAINT `fk_bvmzdlsztuiazhqwuwyjifpdsgrjckpsgoav` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gldeatphhlytmpqumuhiscxavexpdytwtbag` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rpcwbtpidornphvmmowhkiiojdbtzfcgmkai` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_uluvfcpfqtclomkhkzvakcpcrkowuvuaeakx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_obyostzicpuqjcbwupyerbmjividukugxeva` (`siteId`),
  KEY `fk_jaiershwqmzgumkjcodlwrxisaoeziirmouj` (`fieldId`),
  KEY `fk_mcfiotjyjvnarewkffmtfcthmihhwblyvvai` (`userId`),
  CONSTRAINT `fk_jaiershwqmzgumkjcodlwrxisaoeziirmouj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mcfiotjyjvnarewkffmtfcthmihhwblyvvai` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_obyostzicpuqjcbwupyerbmjividukugxeva` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wqwermoyoywttqdykxovhxgtfenpxchlznsj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_redactor_uydzvoip` text,
  `field_blurb_vtcivwkx` text,
  `field_courseTags_dmzzalgn` varchar(255) DEFAULT NULL,
  `field_orderIndex_ftfyjoff` int(10) DEFAULT NULL,
  `field_tagline_kvudlfgi` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ksxxzgyoaasrqvqfsbhlvtusdnpwzrfzndqg` (`elementId`,`siteId`),
  KEY `idx_bthqmsfeajrmfrwbcsjssewkttqnkspgcmlx` (`siteId`),
  KEY `idx_rassszxfrdkrvhenllhsyoyenioyxjamjsgu` (`title`),
  CONSTRAINT `fk_imvgmkatnynetwuekfdaahwxrwvxeveufktn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tivwfejhhmhsiollgtqwecjjwoocqdtheava` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_kaohumebbrokwazyyhtmucyfsurxfuuaalha` (`userId`),
  CONSTRAINT `fk_kaohumebbrokwazyyhtmucyfsurxfuuaalha` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hflccnnjvumjdsqncvuonuhvunlopsnswspc` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_yqznkdnqasnopjeuhrbnlvmgabhakjkmaypa` (`creatorId`,`provisional`),
  KEY `idx_omiesqjojrhgwmrnoqhlbzoihnedyqvfumsz` (`saved`),
  KEY `fk_uhvlbzcbkbrtmxdseyebiugltsztbbxqymbz` (`canonicalId`),
  CONSTRAINT `fk_qhgakymaayntdykhwlixyvuehmzenfwzofdg` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_uhvlbzcbkbrtmxdseyebiugltsztbbxqymbz` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sysufxqjbabdmnxbkcsalqalntqeqmprvqrn` (`dateDeleted`),
  KEY `idx_hatwyvrzgujbidsleoivmphlqlnmsfgwqdnr` (`fieldLayoutId`),
  KEY `idx_izuaoujoxdpkjtupvomlpvovgxicvvnecssk` (`type`),
  KEY `idx_bdnaelqjnpvkvvczyuknsgxqfzgzhonookhb` (`enabled`),
  KEY `idx_lnqydkkhwsplbwdgudeyzaudsbeesrxhssdd` (`archived`,`dateCreated`),
  KEY `idx_ibjjntyomfxtltuvjcfwbvivitybkpjqxdsb` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_jemhlouyjsppillvewyxajlhodvnfilmovqc` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_bafacocbnxyoecsaiqgvdbcddxuyproewqco` (`canonicalId`),
  KEY `fk_irnfnwcgburezutjukzkodqdptdgvfdyduin` (`draftId`),
  KEY `fk_znhsrzpetfagsdmptpnrxeaxovimszzbignp` (`revisionId`),
  CONSTRAINT `fk_bafacocbnxyoecsaiqgvdbcddxuyproewqco` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hxjcywfamnbireprgolktrugnlbvazfiyrcr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_irnfnwcgburezutjukzkodqdptdgvfdyduin` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_znhsrzpetfagsdmptpnrxeaxovimszzbignp` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_aydepbxhndafmhhraqvdwfnjbhwgvrdozncb` (`elementId`,`siteId`),
  KEY `idx_gkxzobomfphgxnftordozzagfosquhxlnoxv` (`siteId`),
  KEY `idx_viizkrdxommjfbanrsdmevxewifnqebavvvk` (`slug`,`siteId`),
  KEY `idx_zencnncpktancxrryymrxnfxcdfraevipkcp` (`enabled`),
  KEY `idx_euhaginwxuvvbmipzupzwnwryiunddhpqjch` (`uri`,`siteId`),
  CONSTRAINT `fk_yhoxljflqszuojgncdclwdsaylxprpghmdrr` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zjxffbatjlepwtzwvjdprdxkrbmocltszhry` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gkzsmhqhycbwcpcbawnvqxzpmjmnxbtakclw` (`postDate`),
  KEY `idx_kokyikukbvdujvvsyyrrltuyloecriznoexg` (`expiryDate`),
  KEY `idx_ifequfspncazilcrfcbkrcskxvxgmkvaeayg` (`authorId`),
  KEY `idx_agyohyyhjsjxwrikisvpvkutudqfjguoqpuv` (`sectionId`),
  KEY `idx_wuhnuzcakaqoxgsngyhdzbbaiwidmccbvjkj` (`typeId`),
  KEY `fk_nqfgvvszpkehqohtlhqanycfugmyuueuhuyv` (`parentId`),
  CONSTRAINT `fk_nblqrvpnomzxwhcbkgvapcrwxqlsqsrdwnmq` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nqfgvvszpkehqohtlhqanycfugmyuueuhuyv` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_psmjbzjczvcuhkbqtfjuquwxvokkshjuyulm` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rnbemmctrqinqwsuirxeowgrbkiwfgxixxnp` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_txthwioqxhcnwuovlgvtjznhyxegagvehhjz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gmibmmywjpdowvymohtmuktslckueoeifqeq` (`name`,`sectionId`),
  KEY `idx_wfhxpnfptpvxfuxcuhwhahewflxyekhcubuq` (`handle`,`sectionId`),
  KEY `idx_yhwrbnztjfhuglokkjfrlwgpebzwluvdbxhz` (`sectionId`),
  KEY `idx_vzfylqjnvebygdckmhcfoybbteqwuqjwvmka` (`fieldLayoutId`),
  KEY `idx_xheleetqryjmdhxpkwknpshjdvxjzijmpabp` (`dateDeleted`),
  CONSTRAINT `fk_vhsybteqytyuzfcgjrpqrrorpozdvtsfnphk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vvuktqwoxmkazhfczbsmqzutqvgdrgpaftor` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rbjfkhgaquxedlgczdumcdkzpiuaixgubjxo` (`name`),
  KEY `idx_ypjjqhvlzifefnkhusubdikpcapcfetpstfz` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bpgxhegudlapvyywbbeckdieyzywmoymzxxe` (`layoutId`,`fieldId`),
  KEY `idx_hxerttafcgdgfseukhabbkzrheidkpntmbbd` (`sortOrder`),
  KEY `idx_ilcorswkmsxcgroftntbsbuowlccrnjdmszy` (`tabId`),
  KEY `idx_drtvoogtabzacoisffqmivgmyvwrhanykgcq` (`fieldId`),
  CONSTRAINT `fk_abzxtcgbqkuukhlegijfjwzpherlgdiyfdlg` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jproqxfopmubggjsktzpdvkxxkqaqnybgpyk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sdhuuxmmjqvxmkpwzzrlqtntbwrwrthsunil` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_knlbohexqlptjzirtnhzppbulcblqbsousmy` (`dateDeleted`),
  KEY `idx_ldpmhkveqbmtmqfesimbhdwxsilihkqxjiqv` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lqcknooogfwtlnxatuzvdelpnpujzzyamrnd` (`sortOrder`),
  KEY `idx_pkurfcyflovphhlhsuvhgvixtjnefnhvoanz` (`layoutId`),
  CONSTRAINT `fk_hqxpexsxtygtjrdoultvksjwysejdopwigfq` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zuulcqjimfcrtfcvuftmenqwjiscinwsaeho` (`handle`,`context`),
  KEY `idx_ssyeyxqdgomynweoagrkmisbwqthltdbccub` (`groupId`),
  KEY `idx_verzarwgrznqnahnbfsvcaiezdzanqyasxri` (`context`),
  CONSTRAINT `fk_shrmirnydvurbknwepaslmqgrjmoilzgrpzc` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fgpqgyxjawznjqhcikrtdxrzaolcqmikdwvi` (`name`),
  KEY `idx_odwwdnfrycwhewqddqmxpadgzmxgsdlfmchb` (`handle`),
  KEY `idx_eofdeeltgsrfebwvmfpywsmncjofzozndfue` (`fieldLayoutId`),
  KEY `idx_cfwnniipctqghtfpowkzzwtpvswdugnofhqk` (`sortOrder`),
  CONSTRAINT `fk_katgwuwmdjwjtqhmexiuhwnduqejxjnwnhww` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_teczpsszlvzmwioanxqxopmakhuufpgooyqw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cadvqmzxzynaxwnzmtvvpivrxbkondvbecuu` (`accessToken`),
  UNIQUE KEY `idx_lewlxpyyyndwjajgruqzgzyhhpinadhkzjax` (`name`),
  KEY `fk_fjuameqezozsqsrneshfhmetjejpqenfczmj` (`schemaId`),
  CONSTRAINT `fk_fjuameqezozsqsrneshfhmetjejpqenfczmj` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yfsjtzdhgboptnvnbpnpsrdpxkylqczeexcd` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qhvkfrgnxesyuwpnpmxuoeamgoqfxjuoqowe` (`name`),
  KEY `idx_mdsnocookjlyqkvfyxjfgnhhnixvwhytpbqm` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_nvskqgzzzsawbwtqkayfecowbxfjasjvxqqk` (`primaryOwnerId`),
  KEY `idx_kwsijfyrjaoictvihatsokvkplkamlodsjyo` (`fieldId`),
  KEY `idx_uvoefbucssatqavtlutyneigzdqsupvifnzy` (`typeId`),
  CONSTRAINT `fk_jcxtfexkqcfkbjjezixpkpbkkiczfuwqsvwk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_khenkyqvejzacafgesryeucshsbmtxytnbxk` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rlxlhzmcwawqafxemoeupushnqdclcgljtpe` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vhfarastswiunghaqqpytjyddwfqgfyqlucj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_tzaofppkichuwmqyunmrcbuigujroupnxvxl` (`ownerId`),
  CONSTRAINT `fk_npicudapkzwdfokvvxtyknghhfiurzohnmvf` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tzaofppkichuwmqyunmrcbuigujroupnxvxl` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cdemrrdfmoudzmlhovgtgegswoblipgvjmde` (`name`,`fieldId`),
  KEY `idx_osovtfarcbftytuyxwwhlakqsimfheafcpkd` (`handle`,`fieldId`),
  KEY `idx_wklymoxbyufippsxinpcywpryaenwamwvibd` (`fieldId`),
  KEY `idx_rvrmtlqyckprbabyldjqxzohmzldabfpjwnu` (`fieldLayoutId`),
  CONSTRAINT `fk_ckqfuhsyxdajpyxeuezjpufkncbqljvaqyrf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hwghsdbdyyiuozfoztitxawybsshkfhivjuy` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_cards`
--

DROP TABLE IF EXISTS `matrixcontent_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_card_redactor_xrtsojkt` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_awyxmwyulilzsklneojvlylrerygtcquusll` (`elementId`,`siteId`),
  KEY `fk_vbdnodfzjcmhvmtqgnttzvuirrzyldrmyofq` (`siteId`),
  CONSTRAINT `fk_hxajcqpipcjoqtdzhqbouywpnwoblwvtnniq` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vbdnodfzjcmhvmtqgnttzvuirrzyldrmyofq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rharhlqznctcixjhmrozubwdrkzetfhkygax` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xvifzpmqzofzpcpvpckfkpvyfkupxwhmolph` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_qmwhnsawfrpfogpejdoltixitzjiblffgtnl` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_lwyxghmtkdpaysqsqjtyvydwzsbfogmihsjo` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_aosiulhfnaqahpvhudkvzaksdqabvkhopsfu` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_bebgpwnlzdtlcrtdviwbhwkkjhfrpopzfokk` (`sourceId`),
  KEY `idx_veonpoasddiqilmbvbsfkfcxybkkipzisiqa` (`targetId`),
  KEY `idx_istgxejjnurqarrpgkabhhhnfeogyuycjrtd` (`sourceSiteId`),
  CONSTRAINT `fk_gbgoyvxzbawyshsvlbcaezhxwukkwpergibb` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ixlrlqbrgelowlivixpyiibbgzmdeugvsmsv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rbuhelpraokeciukvjlscaafvvfhwseehflf` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xtpaslmfedhdlkjgsvehgpakevozrpcgvksk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fbriirecxkwgazlatxiefmaexyiakvghcbsn` (`canonicalId`,`num`),
  KEY `fk_dxctvnkdgqbfbsmucbbsazxjqdpkpvcxplst` (`creatorId`),
  CONSTRAINT `fk_dxctvnkdgqbfbsmucbbsazxjqdpkpvcxplst` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zwsxznqwvgbvajqdqcyktyrjkvkbwaigomna` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_csgjjiyprfewctoqwnuhetuxgswtxlrekull` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ufafqedzyxczkkblzzymyxwvjxavvcgbojxn` (`handle`),
  KEY `idx_bqrnmnnxnmnywhvuwsfaiyuvwamotvvyvskj` (`name`),
  KEY `idx_kpbirhxtkcayfnseuwuyntkwlmdwselfpkqn` (`structureId`),
  KEY `idx_njsqgcmhthrgkmaywvwneagujzuoeqofvkwz` (`dateDeleted`),
  CONSTRAINT `fk_suoyavvoympeowllfkwmzvgeqrahmzkcltbl` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kumgwupsiwelpegtwafptvnpdcuxptatexkw` (`sectionId`,`siteId`),
  KEY `idx_jgjnpdbskiikcxsrnunxhyijjlmpvhxwollt` (`siteId`),
  CONSTRAINT `fk_mdsnnrvioamldebqjrslfrtdqwjyrevtfluf` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zodzmejperkfbtdefbtqlkrjtdquexwvztch` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_abhtrhxewwordignzhenzbiqtlxreycgetva` (`uid`),
  KEY `idx_zdkqyaoaoiraastlcvnifzkxdtnmcptffbsr` (`token`),
  KEY `idx_mudscvithshmxdohuzxpvthabisziurbhtgb` (`dateUpdated`),
  KEY `idx_lyczovzuzfulfiugssxqlliddswibsuxwuem` (`userId`),
  CONSTRAINT `fk_bwkyfadhqfoflomuctcahvpsguvkqxnkzjqi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_miykrnokyhfqkveasnhgksubsqpqogaropsa` (`userId`,`message`),
  CONSTRAINT `fk_ldodltptrcjxapwiprhnhjbguktvioxvrcfl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mnrdlqzznxefwcdmxobhhyabbqeylbzzgook` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ggxpdlfwqxmjehyijgifvptqdyxikhjlrras` (`dateDeleted`),
  KEY `idx_nyhdnphrskcmonfimnudtivmumssrstctgtz` (`handle`),
  KEY `idx_umbtcjshaneurighjmfyanbiuopmuquzueuv` (`sortOrder`),
  KEY `fk_rqkvuqnxeqhfjlshgibyjrsqmceplbgfpxsq` (`groupId`),
  CONSTRAINT `fk_rqkvuqnxeqhfjlshgibyjrsqmceplbgfpxsq` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xwxqgyktpqdzucqwdedlaujkiogqduvdozfc` (`structureId`,`elementId`),
  KEY `idx_ddpmawmevkxepurzcfavzpjugoncgsaoktwm` (`root`),
  KEY `idx_lkfkalfhkcpzncoibvnlcdqmcpbcvcxncobp` (`lft`),
  KEY `idx_zotzssjgxswiexrmwhfroghwstlbtdhykegg` (`rgt`),
  KEY `idx_tyjzxppypbytiqjlqapwwmjoxrzdimgeylvc` (`level`),
  KEY `idx_wmwbpxcyfmpxwscujsuuwaiqqhmhedsgnxrn` (`elementId`),
  CONSTRAINT `fk_kdpsrdbmvjwoscjgqgtfoczwzducxxdubwlh` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ulctwcljrvvbhxekbtlzekcefxzyvrggtdwd` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_exbjoihmemrkenncuzcgkrifhujwkvsexwdr` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_elkfhkeqedxkuahijyyawmamczgbdwbgvuha` (`key`,`language`),
  KEY `idx_kuzckxheppretmxmuafwnalrkskpphtjhyng` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bxmwkiagjjunbsmmgmonenzvzcvjlowqavud` (`name`),
  KEY `idx_qymuldptqiusvbylofllbikrmcsmnxlfnfuj` (`handle`),
  KEY `idx_qkxgpmymhqbikjqnqbeypltytwvtgipznjrs` (`dateDeleted`),
  KEY `fk_caaxtlafbjqfowtiijgemewcxdxxbvmsolpe` (`fieldLayoutId`),
  CONSTRAINT `fk_caaxtlafbjqfowtiijgemewcxdxxbvmsolpe` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_blkbxoizqqnmnlvnjecydgivzimqwmvcegkt` (`groupId`),
  CONSTRAINT `fk_joaifcjrlslgdpnzodsvwzlpmdjripgjgqzg` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_menxuimshwbozsltljhiskdrrzthwhlhjjgo` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iisvqlqpzaefjfspmnlcrykoismgjqcudcqu` (`token`),
  KEY `idx_bjxlhzydkvuhrghhjqmcvnlhpbhchjpieumh` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nncakisjcjmdpngimxoazeudjzehmtixuiyl` (`handle`),
  KEY `idx_kwnnqclbqqxqrhplgjtlcpcigmyylcohjwli` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_voxrscnxecydlmfbtdikaltbgqwxujiruiqs` (`groupId`,`userId`),
  KEY `idx_wsrkcegjtgvqelwhqtdfisoniwntsstbnwpf` (`userId`),
  CONSTRAINT `fk_jxwfegllycveicgnxxtvaoejftguvjikcdmn` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qbwbhbizmryrtboppbyxtcomjhlacwkvxdds` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ooymsxgtseicolrfnkoaeqyjedxrualddmka` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qgimtsiiicokipnsbccrzetevrmxrktgxroa` (`permissionId`,`groupId`),
  KEY `idx_hxmdggbrfprqunhmhtarybxzwkujwcuuaczx` (`groupId`),
  CONSTRAINT `fk_byoxbxscdgiywpbdfiylhlpahplkdosbbwyo` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dnuvqazooclepjpsutlxvufuxurnfyquonss` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ovblsdtelthjtfdhequiiuzeqzhfxmhuwvdr` (`permissionId`,`userId`),
  KEY `idx_umyzonazkchkhlhgxunucnjzfpopecmzbpaa` (`userId`),
  CONSTRAINT `fk_vaieejeepibtfuhhpgdfrvrpysrepcfhfzhw` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vcvapriuxpqvpsstfworogoklpesvohbvfgg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_kpvnzlblcmnbkiakkcshfswltfrfyajsqkte` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gfkxuvuvekqxgwpkcgiszoeswumqfitlpuaj` (`active`),
  KEY `idx_qewrffbkxvqpmwfxtydjsjugocyuwulqsnkn` (`locked`),
  KEY `idx_epdaxclxerrsycdqirpfeelbuecfptrzbwkj` (`pending`),
  KEY `idx_kjpdnqzahtqkfeppkfkckyymvucvuogwcail` (`suspended`),
  KEY `idx_ekfemmfqsdjhilrhggkhhedwqecufkhxmxut` (`verificationCode`),
  KEY `idx_vzgjkzyfmszwbipenptonosuvzmlekgkaqry` (`email`),
  KEY `idx_viqnlyajbubvqyppcegzxywebbufrhxvgulz` (`username`),
  KEY `fk_kterqavtjmzsqtvazrlngtxznyjcoexcfkew` (`photoId`),
  CONSTRAINT `fk_kterqavtjmzsqtvazrlngtxznyjcoexcfkew` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tzxxpjkcrabstlgoxogifnuxgghgqhkqnubb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xzhqfsyohfvjceuznmdfowxgcncjlpbnixll` (`name`,`parentId`,`volumeId`),
  KEY `idx_qkwkmrzajifackljbicbnaplntmlbsbmulhw` (`parentId`),
  KEY `idx_txieszzgtomfvtnayphyfuubhpzgoozfmnzd` (`volumeId`),
  CONSTRAINT `fk_birzugydufgnyikohgbfpnhyjtpqflmptkdb` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_udplsuoofchyyxdwbuhzvaiopjfzeswvdwvf` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jgxcqtklivksqipugqzybodvlsdeklaatnbi` (`name`),
  KEY `idx_fodbohloloxezacbqeztrcaaihsqglrwjrmm` (`handle`),
  KEY `idx_bkoyeksdfkbeacxpazfldhwsiyiftszzljgm` (`fieldLayoutId`),
  KEY `idx_ggfysjysqkrqdykhobjofnohicqhreqvbavr` (`dateDeleted`),
  CONSTRAINT `fk_jzhssbsxsdghognamydbdahwhgxgmleohhea` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_banxlmkslfeciwnfwircwvrhaaauatdaqkbg` (`userId`),
  CONSTRAINT `fk_qtqsroyinxttwhghpfoxrroyehnkrzkyxnzl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'lamp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-25 23:44:59
-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: database    Database: lamp
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (54,1,3,1,'pexels-tima-miroshnichenko-7991498.jpg','image',NULL,1920,1280,50185,NULL,0,0,'2022-08-25 02:30:19','2022-08-25 02:30:19','2022-08-25 02:30:19'),(91,1,3,1,'webheader.jpg','image',NULL,3486,2324,617785,NULL,NULL,NULL,'2022-08-25 03:17:15','2022-08-25 02:58:28','2022-08-25 03:17:19'),(97,1,3,1,'stagecraft.com.svg','image',NULL,1976,345,438,NULL,NULL,NULL,'2022-08-25 03:32:40','2022-08-25 03:32:39','2022-08-25 03:32:40'),(98,1,3,1,'logo2.svg','image',NULL,1858,184,3731,NULL,NULL,NULL,'2022-08-25 04:06:49','2022-08-25 04:06:49','2022-08-25 04:06:49');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (1,1,'fullName','2022-08-25 23:44:34',0,1),(1,1,'invalidLoginCount','2022-08-25 23:44:34',0,1),(1,1,'invalidLoginWindowStart','2022-08-25 23:44:34',0,1),(1,1,'lastPasswordChangeDate','2022-08-25 23:44:34',0,1),(1,1,'password','2022-08-25 23:44:34',0,1),(1,1,'username','2022-08-25 23:44:34',0,1),(2,1,'title','2022-08-25 02:29:54',0,1),(6,1,'postDate','2022-08-21 04:12:41',0,1),(6,1,'slug','2022-08-21 04:12:40',0,1),(6,1,'title','2022-08-21 04:12:40',0,1),(6,1,'uri','2022-08-21 04:12:40',0,1),(8,1,'fieldLayoutId','2022-08-21 09:51:21',0,1),(8,1,'postDate','2022-08-21 04:13:13',0,1),(8,1,'slug','2022-08-21 04:13:09',0,1),(8,1,'title','2022-08-21 04:13:11',0,1),(8,1,'typeId','2022-08-21 09:51:21',0,1),(8,1,'uri','2022-08-21 04:13:09',0,1),(17,1,'postDate','2022-08-21 09:56:57',0,1),(17,1,'slug','2022-08-21 09:56:53',0,1),(17,1,'title','2022-08-21 09:56:53',0,1),(17,1,'uri','2022-08-21 10:03:59',0,1),(21,1,'postDate','2022-08-22 01:12:36',0,1),(21,1,'slug','2022-08-22 01:12:22',0,1),(21,1,'title','2022-08-22 01:12:22',0,1),(21,1,'uri','2022-08-22 01:12:22',0,1),(25,1,'postDate','2022-08-22 06:08:10',0,1),(25,1,'slug','2022-08-22 06:08:03',0,1),(25,1,'title','2022-08-22 06:08:03',0,1),(25,1,'uri','2022-08-22 06:08:03',0,1),(27,1,'postDate','2022-08-22 06:08:25',0,1),(27,1,'slug','2022-08-22 06:08:18',0,1),(27,1,'title','2022-08-22 06:08:18',0,1),(27,1,'uri','2022-08-22 06:08:18',0,1),(29,1,'fieldLayoutId','2022-08-22 09:23:48',0,1),(29,1,'postDate','2022-08-22 06:20:21',0,1),(29,1,'slug','2022-08-22 06:20:19',0,1),(29,1,'title','2022-08-22 06:20:19',0,1),(29,1,'typeId','2022-08-22 09:23:48',0,1),(29,1,'uri','2022-08-22 06:20:19',0,1),(31,1,'postDate','2022-08-22 06:20:32',0,1),(31,1,'slug','2022-08-22 07:17:52',0,1),(31,1,'title','2022-08-22 06:41:48',0,1),(31,1,'uri','2022-08-22 06:20:25',0,1),(33,1,'postDate','2022-08-22 06:20:51',0,1),(33,1,'slug','2022-08-22 06:20:46',0,1),(33,1,'title','2022-08-22 06:20:46',0,1),(33,1,'uri','2022-08-22 06:20:46',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,6,'2022-08-25 03:03:56',0,1),(2,1,7,'2022-08-25 02:53:04',0,1),(2,1,8,'2022-08-25 02:38:05',0,1),(17,1,1,'2022-08-21 10:50:05',0,1),(21,1,1,'2022-08-22 01:12:34',0,1),(21,1,2,'2022-08-22 06:06:39',0,1),(25,1,1,'2022-08-22 06:08:09',0,1),(25,1,2,'2022-08-22 06:08:05',0,1),(27,1,1,'2022-08-22 06:08:24',0,1),(27,1,2,'2022-08-22 06:08:19',0,1),(29,1,1,'2022-08-22 06:41:57',0,1),(29,1,3,'2022-08-22 09:23:48',0,1),(29,1,4,'2022-08-22 10:00:16',0,1),(31,1,1,'2022-08-22 06:20:31',0,1),(33,1,1,'2022-08-22 06:20:50',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2022-08-21 04:07:40','2022-08-25 23:44:34','a98d35b3-3b41-4819-b992-40e35ce94fc1',NULL,NULL,NULL,NULL,NULL),(2,2,1,'Home','2022-08-21 04:10:21','2022-08-25 03:03:55','bf26bad8-6292-412a-a3ac-55f05240de39',NULL,NULL,NULL,NULL,'<p>learn technical theatre<span class=\"text-primary\">.</span></p>'),(3,3,1,'Home','2022-08-21 04:10:21','2022-08-21 04:10:21','30114089-3a70-44fa-a96e-c56b13e2e9cf',NULL,NULL,NULL,NULL,NULL),(4,4,1,'Home','2022-08-21 04:10:21','2022-08-21 04:10:21','c26054e2-71ab-49a8-a94e-88c66e063588',NULL,NULL,NULL,NULL,NULL),(5,5,1,'Home','2022-08-21 04:10:21','2022-08-21 04:10:21','063268dd-795f-48ad-b76a-f8d50e9eb800',NULL,NULL,NULL,NULL,NULL),(6,6,1,'Lighting Basics','2022-08-21 04:12:17','2022-08-21 04:23:05','17bf29f6-150d-4951-8154-afa44ad0d642',NULL,NULL,NULL,NULL,NULL),(7,7,1,'Lighting Basics','2022-08-21 04:12:41','2022-08-21 04:12:41','0ae990d0-71a1-4d8a-8431-99490b07feff',NULL,NULL,NULL,NULL,NULL),(8,8,1,'Intro - LX Basics','2022-08-21 04:12:44','2022-08-21 09:51:21','ed4e84ce-7c0b-4839-8d0b-99118d922dcf',NULL,NULL,NULL,NULL,NULL),(9,9,1,'Intro - LX Basics','2022-08-21 04:13:13','2022-08-21 04:13:13','48211e84-389d-4b30-a00c-e8d11e947bd7',NULL,NULL,NULL,NULL,NULL),(10,10,1,'Home','2022-08-21 04:21:01','2022-08-21 04:21:01','0181b719-3e6b-454a-86f6-97b328affe6d',NULL,NULL,NULL,NULL,NULL),(11,11,1,'Home','2022-08-21 04:21:01','2022-08-21 04:21:01','08a61c70-4788-49c6-a3f9-5e3cd11caeb7',NULL,NULL,NULL,NULL,NULL),(13,13,1,'Intro - LX Basics','2022-08-21 09:51:21','2022-08-21 09:51:21','61547b32-27ac-41dd-af15-ef94aaaa9d95',NULL,NULL,NULL,NULL,NULL),(14,14,1,'All Courses','2022-08-21 09:55:25','2022-08-22 06:38:13','c8db9f42-92f5-4aea-bef8-1afef860920f',NULL,NULL,NULL,NULL,NULL),(15,15,1,'All Courses','2022-08-21 09:55:25','2022-08-21 09:55:25','804d1981-21e0-403d-ac92-2b421356f3d1',NULL,NULL,NULL,NULL,NULL),(16,16,1,'All Courses','2022-08-21 09:55:25','2022-08-21 09:55:25','18fb5f83-d30d-49c2-bea7-c9164203aada',NULL,NULL,NULL,NULL,NULL),(17,17,1,'LX Basics - Intro','2022-08-21 09:56:24','2022-08-21 10:50:05','bdd95094-b86d-4477-8887-94abc1ddf809','<h1>Intro to Lighting</h1>\n<p>Here are the things i want to tell you about lighting yo.</p><ul><li>this</li><li>that</li><li>the other thing</li></ul>',NULL,NULL,NULL,NULL),(18,18,1,'LX Basics - Intro','2022-08-21 09:56:57','2022-08-21 09:56:57','68c28d69-8809-4cac-828f-7ae5d233c78c',NULL,NULL,NULL,NULL,NULL),(20,20,1,'LX Basics - Intro','2022-08-21 10:50:06','2022-08-21 10:50:06','f43c7d6b-7c41-4ac9-826c-77312348569f','<h1>Intro to Lighting</h1>\n<p>Here are the things i want to tell you about lighting yo.</p><ul><li>this</li><li>that</li><li>the other thing</li></ul>',NULL,NULL,NULL,NULL),(21,21,1,'Introduction','2022-08-22 01:12:16','2022-08-22 06:06:39','6268ac41-9dd4-4808-8a7d-6cf86b1c84d0','This is the intro page',NULL,NULL,NULL,NULL),(22,22,1,'Introduction','2022-08-22 01:12:36','2022-08-22 01:12:36','8f9083d8-5e89-4d14-a846-b1c6c0b3d12c','This is the intro page',NULL,NULL,NULL,NULL),(24,24,1,'Introduction','2022-08-22 06:06:39','2022-08-22 06:06:39','948cc7cd-a0ea-4a26-b491-6fb7767dff50','This is the intro page',NULL,NULL,NULL,NULL),(25,25,1,'What is a light?','2022-08-22 06:07:51','2022-08-22 06:08:10','9dd0c7d9-754c-41fe-ad8d-5570cbefafdb','<p>yeah good question</p>',NULL,NULL,NULL,NULL),(26,26,1,'What is a light?','2022-08-22 06:08:10','2022-08-22 06:08:10','e90ea05a-1b84-4b8d-82c2-523f6f45a6fa','<p>yeah good question</p>',NULL,NULL,NULL,NULL),(27,27,1,'How to rig a light','2022-08-22 06:08:13','2022-08-22 06:08:25','e5b2333a-1cac-4cb9-a59c-bebbd3284dbb','<p>nobody knows bro</p>',NULL,NULL,NULL,NULL),(28,28,1,'How to rig a light','2022-08-22 06:08:25','2022-08-22 06:08:25','8bedce1e-207c-42b0-959e-15d9cce48d66','<p>nobody knows bro</p>',NULL,NULL,NULL,NULL),(29,29,1,'LX Basics','2022-08-22 06:20:14','2022-08-22 10:00:16','c6968697-399d-4893-b6c1-d7b5f7f84d0f','<p>This is the intro</p>','The basics of lighting','[\"lighting\",\"intro\"]',NULL,NULL),(30,30,1,'LX Basics','2022-08-22 06:20:21','2022-08-22 06:20:21','0bfe3f34-06e1-42ee-9c21-0b1c5dfe8ae9',NULL,NULL,NULL,NULL,NULL),(31,31,1,'How cabling works','2022-08-22 06:20:23','2022-08-22 07:17:52','a863ce5a-fc4e-4de8-8a43-9cd0ea0b9576','<p>yeah welcome boys</p>',NULL,NULL,NULL,NULL),(32,32,1,'Intro','2022-08-22 06:20:32','2022-08-22 06:20:32','eb7a2902-3cf6-4e8c-bfd4-bb45da34fb2c','<p>yeah welcome boys</p>',NULL,NULL,NULL,NULL),(33,33,1,'How to rig a light','2022-08-22 06:20:41','2022-08-22 06:20:51','c7cebddc-0eb5-481f-8db6-4f780bc156d4','<p>do the thing</p>',NULL,NULL,NULL,NULL),(34,34,1,'How to rig a light','2022-08-22 06:20:51','2022-08-22 06:20:51','b29c79e8-e298-42b4-83df-19b2a0b4bde4','<p>do the thing</p>',NULL,NULL,NULL,NULL),(35,35,1,'All Courses','2022-08-22 06:37:20','2022-08-22 06:37:20','0b3458c4-65c9-416b-8002-874beba6636b',NULL,NULL,NULL,NULL,NULL),(36,36,1,'All Courses','2022-08-22 06:38:13','2022-08-22 06:38:13','044e6162-1e5a-487a-ab6f-a657d5422ab7',NULL,NULL,NULL,NULL,NULL),(37,37,1,'All Courses','2022-08-22 06:38:13','2022-08-22 06:38:13','ef1a07ab-ffcb-42af-8de2-41ec35694aad',NULL,NULL,NULL,NULL,NULL),(39,39,1,'How cabling works','2022-08-22 06:41:48','2022-08-22 06:41:48','f46e31fe-a117-4ce4-ad25-35cfe92c9b34','<p>yeah welcome boys</p>',NULL,NULL,NULL,NULL),(41,41,1,'LX Basics','2022-08-22 06:41:57','2022-08-22 06:41:57','92b4a6aa-421a-4a3d-84af-2b13fe0a74ca','<p>This is the intro</p>',NULL,NULL,NULL,NULL),(43,43,1,'How cabling works','2022-08-22 07:17:52','2022-08-22 07:17:52','09118891-294f-4f8d-b986-1b979aea8816','<p>yeah welcome boys</p>',NULL,NULL,NULL,NULL),(45,45,1,'LX Basics','2022-08-22 07:31:13','2022-08-22 07:31:13','97a9c0e8-5045-4bc1-94f2-5784f30b763d','<p>This is the intro</p>','The basics of lighting',NULL,NULL,NULL),(47,47,1,'LX Basics','2022-08-22 09:23:48','2022-08-22 09:23:48','0cfef234-ee48-4dc9-b833-2e7ed875275e','<p>This is the intro</p>','The basics of lighting','[\"lighting\",\"intro\"]',NULL,NULL),(49,49,1,'LX Basics','2022-08-22 09:54:22','2022-08-22 09:54:22','f70e0b05-9c8a-4cdb-9efd-1921c5e1ee8a','<p>This is the intro</p>','The basics of lighting','[\"lighting\",\"audioVisual\",\"intro\",\"level2\",\"design\",\"apply\"]',NULL,NULL),(51,51,1,'LX Basics','2022-08-22 10:00:16','2022-08-22 10:00:16','dc11476d-a356-493e-9dc3-21b3d1e9a4ad','<p>This is the intro</p>','The basics of lighting','[\"lighting\",\"intro\"]',NULL,NULL),(52,52,1,'Homepage','2022-08-25 02:29:45','2022-08-25 02:29:45','1078cea0-14ef-4030-acd0-425672485d78',NULL,NULL,NULL,NULL,NULL),(53,53,1,'Home','2022-08-25 02:29:54','2022-08-25 02:29:54','9407248b-9f27-424f-b973-56c2cc53ac68',NULL,NULL,NULL,NULL,NULL),(54,54,1,'Pexels tima miroshnichenko 7991498','2022-08-25 02:30:19','2022-08-25 02:30:19','52e8c09b-83d5-451b-9b2c-1f1f7c89438c',NULL,NULL,NULL,NULL,NULL),(56,56,1,'Home','2022-08-25 02:30:26','2022-08-25 02:30:26','5f35316d-480f-4ac5-9b63-499d3cb6fe6f',NULL,NULL,NULL,NULL,'learn'),(58,58,1,'Home','2022-08-25 02:30:47','2022-08-25 02:30:47','9f49ad26-f72b-489c-b96e-52397f14c897',NULL,NULL,NULL,NULL,'learn technical theatre'),(59,59,1,'Home','2022-08-25 02:37:03','2022-08-25 02:37:03','92851e53-be85-45ec-82cd-25adc8327b6d',NULL,NULL,NULL,NULL,'learn technical theatre'),(61,73,1,'Home','2022-08-25 02:38:05','2022-08-25 02:38:05','c271f28c-b3a0-4e39-bfd4-a48db51d6a67',NULL,NULL,NULL,NULL,'learn technical theatre'),(63,77,1,'Home','2022-08-25 02:46:14','2022-08-25 02:46:14','d9835fff-9934-4ddd-a506-e900f67ea56f',NULL,NULL,NULL,NULL,'learn technical theatre.'),(65,81,1,'Home','2022-08-25 02:52:40','2022-08-25 02:52:40','64e87c9b-6c41-4355-b37b-fffee843daa6',NULL,NULL,NULL,NULL,'<p>learn</p>\n<p>technical theatre<span class=\"text-primary\">.</span></p>'),(67,85,1,'Home','2022-08-25 02:53:04','2022-08-25 02:53:04','dc9b638f-d404-4d8c-b435-572cf660bb67',NULL,NULL,NULL,NULL,'<p>learn technical theatre<span class=\"text-primary\">.</span></p>'),(68,88,1,'Home','2022-08-25 02:56:04','2022-08-25 02:56:04','e875ef90-b5da-4939-91a5-a3494b743778',NULL,NULL,NULL,NULL,'<p>learn technical theatre<span class=\"text-primary\">.</span></p>'),(69,91,1,'homepage dude','2022-08-25 02:58:28','2022-08-25 03:17:19','8b0fde48-c2d1-4f6b-8449-57f074c50313',NULL,NULL,NULL,NULL,NULL),(71,93,1,'Home','2022-08-25 03:03:55','2022-08-25 03:03:55','7a1aa88d-4dea-4bbd-9668-9b0fc98f10ec',NULL,NULL,NULL,NULL,'<p>learn technical theatre<span class=\"text-primary\">.</span></p>'),(72,96,1,NULL,'2022-08-25 03:30:40','2022-08-25 04:06:52','3b69b17d-5f87-4821-b335-c0f3554f3882',NULL,NULL,NULL,NULL,NULL),(73,97,1,'Stagecraft com','2022-08-25 03:32:39','2022-08-25 03:32:40','477c91c9-bd42-4137-a549-73b008a7cb30',NULL,NULL,NULL,NULL,NULL),(74,98,1,'Logo2','2022-08-25 04:06:49','2022-08-25 04:06:49','f1ce0e2d-2ee5-40c8-8fad-07575fb0eeba',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-08-21 04:07:40','2022-08-25 23:44:34',NULL,NULL,'1aff6a99-010a-4483-84ce-af921962e601'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-08-21 04:10:21','2022-08-25 03:03:55',NULL,NULL,'c36a5faf-53dc-4eae-947b-64fcd62fa4d9'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2022-08-21 04:10:21','2022-08-21 04:10:21',NULL,NULL,'f09aa771-73a4-4988-824e-f6cde04ddb06'),(4,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2022-08-21 04:10:21','2022-08-21 04:10:21',NULL,NULL,'0d41a113-ccf0-409a-9d4f-fc2684be3219'),(5,2,NULL,3,1,'craft\\elements\\Entry',1,0,'2022-08-21 04:10:21','2022-08-21 04:10:21',NULL,NULL,'1538a800-a953-410f-a229-10aa6050580a'),(6,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2022-08-21 04:12:17','2022-08-21 04:12:41',NULL,'2022-08-21 09:51:33','c4147a61-550b-4dfe-9589-dcfaf966520b'),(7,6,NULL,4,2,'craft\\elements\\Entry',1,0,'2022-08-21 04:12:41','2022-08-21 04:12:41',NULL,'2022-08-21 09:51:33','1afb4d80-3bdc-4f45-8b5e-67885136584c'),(8,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2022-08-21 04:12:44','2022-08-21 09:51:21',NULL,'2022-08-21 09:51:41','ac893ee8-18ee-4f1f-a365-eae9a6c8e476'),(9,8,NULL,5,2,'craft\\elements\\Entry',1,0,'2022-08-21 04:13:13','2022-08-21 04:13:13',NULL,'2022-08-21 09:51:41','577d4e34-2102-4760-911b-1951b6c240c2'),(10,2,NULL,6,1,'craft\\elements\\Entry',1,0,'2022-08-21 04:21:01','2022-08-21 04:21:01',NULL,NULL,'6501535d-d0c7-4297-8857-08894189673e'),(11,2,NULL,7,1,'craft\\elements\\Entry',1,0,'2022-08-21 04:21:01','2022-08-21 04:21:01',NULL,NULL,'62ee9846-dc6b-4dc4-9bb4-18c86eedbd05'),(13,8,NULL,8,3,'craft\\elements\\Entry',1,0,'2022-08-21 09:51:21','2022-08-21 09:51:21',NULL,'2022-08-21 09:51:41','5f6a4113-2896-4659-8d78-81d190f82889'),(14,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2022-08-21 09:55:25','2022-08-22 06:38:13',NULL,NULL,'0960e56f-fce2-4278-87c6-8dcf6aa5158b'),(15,14,NULL,9,5,'craft\\elements\\Entry',1,0,'2022-08-21 09:55:25','2022-08-21 09:55:25',NULL,NULL,'69a6a928-7929-47ec-85de-a1f4bafc055f'),(16,14,NULL,10,5,'craft\\elements\\Entry',1,0,'2022-08-21 09:55:25','2022-08-21 09:55:25',NULL,NULL,'a6cedad4-73fb-4e35-a2b3-0d87f68f47a8'),(17,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2022-08-21 09:56:24','2022-08-21 10:50:05',NULL,'2022-08-22 01:11:39','249f21fc-a931-4ca7-ac1c-d145d506f121'),(18,17,NULL,11,4,'craft\\elements\\Entry',1,0,'2022-08-21 09:56:57','2022-08-21 09:56:57',NULL,'2022-08-22 01:11:39','d24797c2-cb83-4e7d-8f4e-2142510dbb0c'),(20,17,NULL,12,4,'craft\\elements\\Entry',1,0,'2022-08-21 10:50:05','2022-08-21 10:50:06',NULL,'2022-08-22 01:11:39','17a84da5-595a-4fff-9f31-c324979f9895'),(21,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2022-08-22 01:12:16','2022-08-22 06:06:39',NULL,'2022-08-22 06:19:02','d82b6066-c130-4dc3-95c0-c83589aeff41'),(22,21,NULL,13,6,'craft\\elements\\Entry',1,0,'2022-08-22 01:12:36','2022-08-22 01:12:36',NULL,'2022-08-22 06:19:02','2eb14fbc-3aae-4481-8884-07d45244e19f'),(24,21,NULL,14,6,'craft\\elements\\Entry',1,0,'2022-08-22 06:06:39','2022-08-22 06:06:39',NULL,'2022-08-22 06:19:02','5e43c65f-6e27-4a8e-a7ca-6e1c81a7e3ab'),(25,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2022-08-22 06:07:51','2022-08-22 06:08:10',NULL,'2022-08-22 06:19:02','e95aaff1-f824-45ce-ba10-59f158c2da0e'),(26,25,NULL,15,6,'craft\\elements\\Entry',1,0,'2022-08-22 06:08:10','2022-08-22 06:08:10',NULL,'2022-08-22 06:19:02','14cf7ff7-38dd-4d10-8ce4-7d607a95a0d6'),(27,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2022-08-22 06:08:13','2022-08-22 06:08:25',NULL,'2022-08-22 06:19:02','a2027475-1b0b-46fe-b022-56cb7e8c5ef1'),(28,27,NULL,16,6,'craft\\elements\\Entry',1,0,'2022-08-22 06:08:25','2022-08-22 06:08:25',NULL,'2022-08-22 06:19:02','c64f7426-426b-40f0-878f-5390579ab67f'),(29,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2022-08-22 06:20:13','2022-08-22 10:00:16',NULL,NULL,'bf8964de-246d-40d1-ac3d-ee7fd29f4f44'),(30,29,NULL,17,7,'craft\\elements\\Entry',1,0,'2022-08-22 06:20:21','2022-08-22 06:20:21',NULL,NULL,'9bb65228-2aae-4b5e-b204-c583680d03a1'),(31,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2022-08-22 06:20:23','2022-08-22 07:17:52',NULL,NULL,'e9ba3116-0bbd-468c-8879-ad07e5a8db2f'),(32,31,NULL,18,7,'craft\\elements\\Entry',1,0,'2022-08-22 06:20:32','2022-08-22 06:20:32',NULL,NULL,'7aaf4ea4-6f1f-432d-9600-3148b373d394'),(33,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2022-08-22 06:20:41','2022-08-22 06:20:51',NULL,NULL,'3faaac6e-2c17-47cd-8ec3-eba081a8acd6'),(34,33,NULL,19,7,'craft\\elements\\Entry',1,0,'2022-08-22 06:20:51','2022-08-22 06:20:51',NULL,NULL,'dbcfc1bd-d4fe-4cf6-939c-6c7c00baf1a1'),(35,14,NULL,20,5,'craft\\elements\\Entry',1,0,'2022-08-22 06:37:20','2022-08-22 06:37:20',NULL,NULL,'b4bcd3a6-2f6e-48f1-8263-4c87a2de14f9'),(36,14,NULL,21,5,'craft\\elements\\Entry',1,0,'2022-08-22 06:38:13','2022-08-22 06:38:13',NULL,NULL,'3a49d06a-5644-4f87-ad9f-02fee458f91f'),(37,14,NULL,22,5,'craft\\elements\\Entry',1,0,'2022-08-22 06:38:13','2022-08-22 06:38:13',NULL,NULL,'02dd044c-5a01-41c4-ba49-c63d7ad271f6'),(39,31,NULL,23,7,'craft\\elements\\Entry',1,0,'2022-08-22 06:41:48','2022-08-22 06:41:48',NULL,NULL,'75606beb-cbe0-4381-8676-6fb43fe3ca0e'),(41,29,NULL,24,7,'craft\\elements\\Entry',1,0,'2022-08-22 06:41:57','2022-08-22 06:41:57',NULL,NULL,'6a781b91-7ab7-4439-961a-ce2535442ac5'),(43,31,NULL,25,7,'craft\\elements\\Entry',1,0,'2022-08-22 07:17:52','2022-08-22 07:17:52',NULL,NULL,'7215c0c6-5b21-4267-9d3c-56b3efe30287'),(45,29,NULL,26,7,'craft\\elements\\Entry',1,0,'2022-08-22 07:31:13','2022-08-22 07:31:13',NULL,NULL,'d8795b29-7b02-42d0-9b6d-7c299059db91'),(47,29,NULL,27,8,'craft\\elements\\Entry',1,0,'2022-08-22 09:23:48','2022-08-22 09:23:48',NULL,NULL,'2ef38ca5-085b-4bff-a808-2e50a3651418'),(49,29,NULL,28,8,'craft\\elements\\Entry',1,0,'2022-08-22 09:54:22','2022-08-22 09:54:22',NULL,NULL,'92e64686-a2e1-46fa-b595-18fc1cf8c002'),(51,29,NULL,29,8,'craft\\elements\\Entry',1,0,'2022-08-22 10:00:16','2022-08-22 10:00:16',NULL,NULL,'4bf2385f-755c-4edc-b63a-7d5cbd25b99a'),(52,2,NULL,30,1,'craft\\elements\\Entry',1,0,'2022-08-25 02:29:45','2022-08-25 02:29:45',NULL,NULL,'7940e6e7-f8df-4960-a1d9-ac796e4f9241'),(53,2,NULL,31,1,'craft\\elements\\Entry',1,0,'2022-08-25 02:29:54','2022-08-25 02:29:54',NULL,NULL,'31af6fa4-4d74-4372-9510-bfbebf33ea5e'),(54,NULL,NULL,NULL,9,'craft\\elements\\Asset',1,0,'2022-08-25 02:30:19','2022-08-25 02:30:19',NULL,'2022-08-25 02:58:20','65e77b29-6180-4d2d-b21f-ccf403dceeea'),(56,2,NULL,32,1,'craft\\elements\\Entry',1,0,'2022-08-25 02:30:26','2022-08-25 02:30:26',NULL,NULL,'1862d1ea-3b8b-4745-aea1-f64bf58d56e5'),(58,2,NULL,33,1,'craft\\elements\\Entry',1,0,'2022-08-25 02:30:47','2022-08-25 02:30:47',NULL,NULL,'82274b9e-4100-4d01-b77e-74f5cc3714d2'),(59,2,NULL,34,1,'craft\\elements\\Entry',1,0,'2022-08-25 02:37:03','2022-08-25 02:37:03',NULL,NULL,'9013cbae-da19-43cf-88f3-2464484343a7'),(61,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:37:13','2022-08-25 02:37:13',NULL,'2022-08-25 02:37:51','539db6df-505a-4b70-a04a-cf3ec381233e'),(62,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:37:51','2022-08-25 02:37:51',NULL,'2022-08-25 02:37:53','b5f9eb9d-4bdb-45c7-9ae5-ccf6f078c1f5'),(63,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:37:52','2022-08-25 02:37:52',NULL,'2022-08-25 02:37:56','f138e3a6-4ff3-48e9-9a88-39f68746ee0c'),(64,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:37:52','2022-08-25 02:37:52',NULL,'2022-08-25 02:37:56','6b0d2030-8972-4e5b-bc93-992499efe91e'),(65,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:37:56','2022-08-25 02:37:56',NULL,'2022-08-25 02:37:57','30d906db-e8be-4db7-899d-3e01ee807dad'),(66,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:37:56','2022-08-25 02:37:56',NULL,'2022-08-25 02:37:57','ad4a0857-2d92-4adb-9282-e202bc799383'),(67,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:37:57','2022-08-25 02:37:57',NULL,'2022-08-25 02:37:58','6701d9b3-4a27-4ea5-a2c4-0a99a3156b91'),(68,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:37:57','2022-08-25 02:37:57',NULL,'2022-08-25 02:37:58','53e3b8e7-3197-4093-9b26-747336891e32'),(71,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:38:05','2022-08-25 02:38:05',NULL,NULL,'3cb3a20c-6b7f-4e4a-8702-eeb28a335655'),(72,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:38:05','2022-08-25 02:38:05',NULL,NULL,'5a459538-7e74-4fdc-9a64-60b34a4e9e6a'),(73,2,NULL,35,1,'craft\\elements\\Entry',1,0,'2022-08-25 02:38:05','2022-08-25 02:38:05',NULL,NULL,'5e01f5a8-e5ed-4876-95dd-3277d0dee841'),(74,71,NULL,36,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:38:05','2022-08-25 02:38:05',NULL,NULL,'60ab2dcb-9a1e-4961-8284-e1b1dff28b96'),(75,72,NULL,37,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:38:05','2022-08-25 02:38:06',NULL,NULL,'3b4ef0ee-9dca-418b-8dd1-4590e6398a57'),(77,2,NULL,38,1,'craft\\elements\\Entry',1,0,'2022-08-25 02:46:14','2022-08-25 02:46:14',NULL,NULL,'84f175e1-92a2-4635-8b08-8860e84881c1'),(78,71,NULL,39,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:38:05','2022-08-25 02:46:14',NULL,NULL,'c945f5d2-8281-4535-9818-aa7185c85bbe'),(79,72,NULL,40,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:38:05','2022-08-25 02:46:14',NULL,NULL,'9e48413c-8553-4ce6-b038-e58bb7d771a1'),(81,2,NULL,41,1,'craft\\elements\\Entry',1,0,'2022-08-25 02:52:40','2022-08-25 02:52:40',NULL,NULL,'a70f92ab-2e35-4159-918d-825500ffbece'),(82,71,NULL,42,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:38:05','2022-08-25 02:52:40',NULL,NULL,'a63e5c5e-e90f-4158-80c1-927060bedc95'),(83,72,NULL,43,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:38:05','2022-08-25 02:52:40',NULL,NULL,'123a1756-955b-4d14-822e-3cb88a2b9976'),(85,2,NULL,44,1,'craft\\elements\\Entry',1,0,'2022-08-25 02:53:03','2022-08-25 02:53:04',NULL,NULL,'d3e73cbb-21c2-4e58-8432-c669533bccd9'),(86,71,NULL,45,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:38:05','2022-08-25 02:53:04',NULL,NULL,'d029e50e-ca19-4acd-a6ef-8ac9b6b5aee1'),(87,72,NULL,46,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:38:05','2022-08-25 02:53:04',NULL,NULL,'1b5ec0f4-4c69-4a34-b156-546a63b2f251'),(88,2,NULL,47,1,'craft\\elements\\Entry',1,0,'2022-08-25 02:56:04','2022-08-25 02:56:04',NULL,NULL,'950a82de-284a-4414-b72e-e77a9e319fa2'),(89,71,NULL,48,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:38:05','2022-08-25 02:56:04',NULL,NULL,'9ef72e29-0444-49d4-beae-4347e28f0889'),(90,72,NULL,49,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:38:05','2022-08-25 02:56:04',NULL,NULL,'b24f809b-2eb7-4efd-9ac8-be7c75c21a7b'),(91,NULL,NULL,NULL,9,'craft\\elements\\Asset',1,0,'2022-08-25 02:58:28','2022-08-25 03:17:19',NULL,NULL,'907d0644-a134-4e57-977a-ae88b31d5108'),(93,2,NULL,50,1,'craft\\elements\\Entry',1,0,'2022-08-25 03:03:55','2022-08-25 03:03:55',NULL,NULL,'b8093a14-6121-4304-a060-6a80c9fceb5b'),(94,71,NULL,51,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:38:05','2022-08-25 03:03:55',NULL,NULL,'9b2d54ba-1854-4120-bdec-059f8e92c3c9'),(95,72,NULL,52,10,'craft\\elements\\MatrixBlock',1,0,'2022-08-25 02:38:05','2022-08-25 03:03:55',NULL,NULL,'3fb09da4-83ec-4336-aec1-b665118ae0f5'),(96,NULL,NULL,NULL,11,'craft\\elements\\GlobalSet',1,0,'2022-08-25 03:30:40','2022-08-25 04:06:52',NULL,NULL,'f971d1f8-9a89-4080-84ad-31ae80b8bea9'),(97,NULL,NULL,NULL,9,'craft\\elements\\Asset',1,0,'2022-08-25 03:32:39','2022-08-25 03:32:40',NULL,NULL,'5306005f-0ecd-48dc-8dc1-a301aa8304e8'),(98,NULL,NULL,NULL,9,'craft\\elements\\Asset',1,0,'2022-08-25 04:06:49','2022-08-25 04:06:49',NULL,NULL,'e11811af-366f-421c-acb2-9bcc303c32c5');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2022-08-21 04:07:40','2022-08-21 04:07:40','667f08d7-6c32-417d-a24d-0b6e90af9422'),(2,2,1,'home','__home__',1,'2022-08-21 04:10:21','2022-08-21 04:10:21','e5346e11-84ae-4600-81a6-9d96c31721bc'),(3,3,1,'home','__home__',1,'2022-08-21 04:10:21','2022-08-21 04:10:21','a6ed2ef8-ac30-43ba-9c77-2bc439bbfaea'),(4,4,1,'home','__home__',1,'2022-08-21 04:10:21','2022-08-21 04:10:21','df76ee41-1964-47f7-a481-9ed0a8b9464a'),(5,5,1,'home','__home__',1,'2022-08-21 04:10:21','2022-08-21 04:10:21','a38198ac-f8a3-4c91-900f-ed73503bfe0f'),(6,6,1,'lighting-basics','courses/lighting-basics',1,'2022-08-21 04:12:17','2022-08-21 04:12:40','987d068f-4c55-46eb-831f-5a6672013028'),(7,7,1,'lighting-basics','courses/lighting-basics',1,'2022-08-21 04:12:41','2022-08-21 04:12:41','62f2dd5e-4e16-4762-8ff6-395a8f1efa62'),(8,8,1,'intro-lx-basics','courses/intro-lx-basics',1,'2022-08-21 04:12:44','2022-08-21 04:23:05','2f18d0c8-464c-4c9f-ad1c-c8d8370ecebd'),(9,9,1,'intro-lx-basics','courses/intro-lx-basics',1,'2022-08-21 04:13:13','2022-08-21 04:13:13','7c755966-d74e-4683-8ad0-01695c417ed2'),(10,10,1,'home','__home__',1,'2022-08-21 04:21:01','2022-08-21 04:21:01','04614fbc-e2cd-4db1-8b9d-151e66c94815'),(11,11,1,'home','__home__',1,'2022-08-21 04:21:01','2022-08-21 04:21:01','b55b9fcf-ef77-45b2-9b34-9a89f10dd862'),(13,13,1,'intro-lx-basics','courses/intro-lx-basics',1,'2022-08-21 09:51:21','2022-08-21 09:51:21','79e69eb9-408c-45f5-9a5d-92104aaf8d6b'),(14,14,1,'all-courses','all-courses',1,'2022-08-21 09:55:25','2022-08-21 09:55:25','45a6e38e-216e-49a2-bb1e-aee603a32f9b'),(15,15,1,'all-courses','all-courses',1,'2022-08-21 09:55:25','2022-08-21 09:55:25','c38b22c2-cd12-46e8-a233-64b268c05f69'),(16,16,1,'all-courses','all-courses',1,'2022-08-21 09:55:25','2022-08-21 09:55:25','f6ced1d4-126a-41e1-8fa8-f0bec21e655a'),(17,17,1,'lx-basics-intro','lessons/lx-basics-intro',1,'2022-08-21 09:56:24','2022-08-21 10:03:59','2087e0d5-63f0-4b6d-822f-78126339103c'),(18,18,1,'lx-basics-intro','course/lx-basics-intro',1,'2022-08-21 09:56:57','2022-08-21 09:56:57','7051d6dd-ceef-4a0f-b101-16d9757665d8'),(20,20,1,'lx-basics-intro','lessons/lx-basics-intro',1,'2022-08-21 10:50:06','2022-08-21 10:50:06','937f18c4-1738-4f9b-ae74-bfa0e8f5b585'),(21,21,1,'introduction','lx-basics/introduction',1,'2022-08-22 01:12:16','2022-08-22 01:12:21','62ae68b4-9e33-4276-8430-583275de0476'),(22,22,1,'introduction','lx-basics/introduction',1,'2022-08-22 01:12:36','2022-08-22 01:12:36','e35a2a72-f9a2-453e-baae-00d568155000'),(24,24,1,'introduction','lx-basics/introduction',1,'2022-08-22 06:06:39','2022-08-22 06:06:39','ed5eab45-9666-412d-ba02-dcadb9919745'),(25,25,1,'what-is-a-light','lx-basics/what-is-a-light',1,'2022-08-22 06:07:51','2022-08-22 06:08:03','9bec6932-412c-414c-9377-fc6150d282a7'),(26,26,1,'what-is-a-light','lx-basics/what-is-a-light',1,'2022-08-22 06:08:10','2022-08-22 06:08:10','6b4a414e-e83e-4409-97d8-50be44c7d1c2'),(27,27,1,'how-to-rig-a-light','lx-basics/how-to-rig-a-light',1,'2022-08-22 06:08:13','2022-08-22 06:08:18','f38cc5bc-bab5-4a8a-bc22-c79b2731dc03'),(28,28,1,'how-to-rig-a-light','lx-basics/how-to-rig-a-light',1,'2022-08-22 06:08:25','2022-08-22 06:08:25','536bb3af-5804-4333-a100-90a9a37efe56'),(29,29,1,'lx-basics','courses/lx-basics',1,'2022-08-22 06:20:13','2022-08-22 06:20:19','a1511754-69cf-4d4c-ade1-42e740c6809d'),(30,30,1,'lx-basics','courses/lx-basics',1,'2022-08-22 06:20:21','2022-08-22 06:20:21','7cae162a-f439-4c9b-9e0a-12292282754e'),(31,31,1,'how-cabling-works','courses/how-cabling-works',1,'2022-08-22 06:20:23','2022-08-22 10:00:18','f246eef7-ede0-4b69-8d09-5244ab8c29ce'),(32,32,1,'intro','courses/intro',1,'2022-08-22 06:20:32','2022-08-22 06:20:32','fd1b9f0a-6661-4bee-86f1-f4f417f27f76'),(33,33,1,'how-to-rig-a-light','courses/how-to-rig-a-light',1,'2022-08-22 06:20:41','2022-08-22 10:17:51','44d1ad48-e3ff-4470-8244-1b51d135e8e4'),(34,34,1,'how-to-rig-a-light','courses/how-to-rig-a-light',1,'2022-08-22 06:20:51','2022-08-22 06:20:51','416587b1-a2b5-44d7-8c52-7d2118175337'),(35,35,1,'all-courses','all-courses',1,'2022-08-22 06:37:20','2022-08-22 06:37:20','a3dc300c-366e-458c-81d7-dd4f935f2e4d'),(36,36,1,'all-courses','all-courses',1,'2022-08-22 06:38:13','2022-08-22 06:38:13','55c42c3d-f175-4ef4-8bca-fddddecc99bf'),(37,37,1,'all-courses','all-courses',1,'2022-08-22 06:38:13','2022-08-22 06:38:13','ae7c40be-0f7c-48b0-8fad-9e331daaf791'),(39,39,1,'intro','courses/intro',1,'2022-08-22 06:41:48','2022-08-22 06:41:48','1ad1ba02-cb9e-4d0d-8548-f99c6db7b12e'),(41,41,1,'lx-basics','courses/lx-basics',1,'2022-08-22 06:41:57','2022-08-22 06:41:57','7d8954a0-1c44-4fe9-a43f-71cfade1fc91'),(43,43,1,'how-cabling-works','courses/how-cabling-works',1,'2022-08-22 07:17:52','2022-08-22 07:17:52','92edc2eb-3c15-4e9e-a3e2-da46bccbdfcc'),(45,45,1,'lx-basics','courses/lx-basics',1,'2022-08-22 07:31:13','2022-08-22 07:31:13','187536b8-4991-4387-a7df-cc91e363534b'),(47,47,1,'lx-basics','courses/lx-basics',1,'2022-08-22 09:23:48','2022-08-22 09:23:48','a3d6fa27-9a5b-427e-b84d-f5137c521247'),(49,49,1,'lx-basics','courses/lx-basics',1,'2022-08-22 09:54:22','2022-08-22 09:54:22','812529ff-4a6d-4ceb-b881-a34960978079'),(51,51,1,'lx-basics','courses/lx-basics',1,'2022-08-22 10:00:16','2022-08-22 10:00:16','8978b9e8-bd55-4263-a37f-0019afafa6c4'),(52,52,1,'home','__home__',1,'2022-08-25 02:29:45','2022-08-25 02:29:45','6bf1042d-b2a0-4b1e-aad1-d6eee5bab204'),(53,53,1,'home','__home__',1,'2022-08-25 02:29:54','2022-08-25 02:29:54','5c01f1bb-1e75-42ff-be6f-6f9cc141c970'),(54,54,1,NULL,NULL,1,'2022-08-25 02:30:19','2022-08-25 02:30:19','89764539-d902-494b-b356-94c5999180c6'),(56,56,1,'home','__home__',1,'2022-08-25 02:30:26','2022-08-25 02:30:26','12f52d8d-73e3-4a1b-9600-3bd7366415c9'),(58,58,1,'home','__home__',1,'2022-08-25 02:30:47','2022-08-25 02:30:47','b8f084e6-cbc8-4a81-9cfe-0b2ee0f2a2e8'),(59,59,1,'home','__home__',1,'2022-08-25 02:37:03','2022-08-25 02:37:03','5b4caf34-a699-4db9-b5ba-dc34da9ef045'),(61,61,1,NULL,NULL,1,'2022-08-25 02:37:13','2022-08-25 02:37:13','52758d48-1e82-4553-9f74-71dad36a6cde'),(62,62,1,NULL,NULL,1,'2022-08-25 02:37:51','2022-08-25 02:37:51','8e3e763a-3229-42f7-8c5f-572ee8875439'),(63,63,1,NULL,NULL,1,'2022-08-25 02:37:52','2022-08-25 02:37:52','b6d29121-e52f-49f3-9cb7-9ad012226298'),(64,64,1,NULL,NULL,1,'2022-08-25 02:37:52','2022-08-25 02:37:52','44f3cb27-6acf-4aab-abbb-601a44660bcc'),(65,65,1,NULL,NULL,1,'2022-08-25 02:37:56','2022-08-25 02:37:56','57633cca-28a6-4cd5-9c47-d052c35c08fe'),(66,66,1,NULL,NULL,1,'2022-08-25 02:37:56','2022-08-25 02:37:56','a08cd34d-829f-4d24-86f0-f4fc36afb70b'),(67,67,1,NULL,NULL,1,'2022-08-25 02:37:57','2022-08-25 02:37:57','7c904fe8-784f-4899-9786-c5bb51a61c32'),(68,68,1,NULL,NULL,1,'2022-08-25 02:37:57','2022-08-25 02:37:57','164828b3-001f-41a0-add6-57f0d577dc5f'),(71,71,1,NULL,NULL,1,'2022-08-25 02:38:05','2022-08-25 02:38:05','565d556b-55e5-4aca-8355-75dddea7fff7'),(72,72,1,NULL,NULL,1,'2022-08-25 02:38:05','2022-08-25 02:38:05','30520544-5d89-4d6d-9c3e-f2bb1da59995'),(73,73,1,'home','__home__',1,'2022-08-25 02:38:05','2022-08-25 02:38:05','5d877999-5194-46e2-b147-07bce7ac0b03'),(74,74,1,NULL,NULL,1,'2022-08-25 02:38:05','2022-08-25 02:38:05','3c56a001-d563-4857-875b-1f244b55d898'),(75,75,1,NULL,NULL,1,'2022-08-25 02:38:06','2022-08-25 02:38:06','ce55ec12-bc1c-45e8-84c2-2e63b334e03f'),(77,77,1,'home','__home__',1,'2022-08-25 02:46:14','2022-08-25 02:46:14','fe97fff0-90d8-4bef-be54-ad61270fcdac'),(78,78,1,NULL,NULL,1,'2022-08-25 02:46:14','2022-08-25 02:46:14','e9227d32-e06a-469c-a29a-77ff0e81667b'),(79,79,1,NULL,NULL,1,'2022-08-25 02:46:14','2022-08-25 02:46:14','a36c4563-8034-4b14-884d-be9bf156c1d5'),(81,81,1,'home','__home__',1,'2022-08-25 02:52:40','2022-08-25 02:52:40','83e7e0cc-358f-49a7-9f72-283edc717739'),(82,82,1,NULL,NULL,1,'2022-08-25 02:52:40','2022-08-25 02:52:40','3b7bbe81-2215-4629-97e9-9884002c6b70'),(83,83,1,NULL,NULL,1,'2022-08-25 02:52:40','2022-08-25 02:52:40','07e85fe5-56aa-429b-a183-8a8d90e7bf94'),(85,85,1,'home','__home__',1,'2022-08-25 02:53:04','2022-08-25 02:53:04','c6ef32e1-5e93-4d8b-ba63-23ffb8b7914e'),(86,86,1,NULL,NULL,1,'2022-08-25 02:53:04','2022-08-25 02:53:04','c5c2dc11-8d37-49c5-8624-4701173efed3'),(87,87,1,NULL,NULL,1,'2022-08-25 02:53:04','2022-08-25 02:53:04','4fbfa5c2-5f10-4c40-b0f2-2a0c8423e2b2'),(88,88,1,'home','__home__',1,'2022-08-25 02:56:04','2022-08-25 02:56:04','d4ecba72-a3b4-4f10-858c-b0ea6a3f0a38'),(89,89,1,NULL,NULL,1,'2022-08-25 02:56:04','2022-08-25 02:56:04','8f6203eb-3e99-46dd-86e9-7738ecb86cba'),(90,90,1,NULL,NULL,1,'2022-08-25 02:56:04','2022-08-25 02:56:04','9bb438f1-f229-4ae3-9578-c445369fb834'),(91,91,1,NULL,NULL,1,'2022-08-25 02:58:28','2022-08-25 02:58:28','a776e24a-fe4e-4f95-a856-11665c5a356a'),(93,93,1,'home','__home__',1,'2022-08-25 03:03:55','2022-08-25 03:03:55','75bd90a4-d371-48dd-b248-7239fd5023c0'),(94,94,1,NULL,NULL,1,'2022-08-25 03:03:55','2022-08-25 03:03:55','f47c4aa3-d095-4d86-839c-37a025fc2369'),(95,95,1,NULL,NULL,1,'2022-08-25 03:03:55','2022-08-25 03:03:55','687eda3a-69cf-4335-a845-0be400758bb0'),(96,96,1,NULL,NULL,1,'2022-08-25 03:30:40','2022-08-25 03:30:40','244454a0-2f1f-4b01-b534-cf34995c7c23'),(97,97,1,NULL,NULL,1,'2022-08-25 03:32:39','2022-08-25 03:32:39','4c2a12a2-34af-49be-8892-f5d060a96118'),(98,98,1,NULL,NULL,1,'2022-08-25 04:06:49','2022-08-25 04:06:49','0d1630d9-8d68-455a-a3c1-cc34e8c3160c');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-21 04:10:21','2022-08-21 04:10:21'),(3,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-21 04:10:21','2022-08-21 04:10:21'),(4,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-21 04:10:21','2022-08-21 04:10:21'),(5,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-21 04:10:21','2022-08-21 04:10:21'),(6,2,NULL,2,1,'2022-08-21 04:12:00',NULL,0,'2022-08-21 04:12:17','2022-08-21 04:12:41'),(7,2,NULL,2,1,'2022-08-21 04:12:00',NULL,NULL,'2022-08-21 04:12:41','2022-08-21 04:12:41'),(8,2,NULL,3,1,'2022-08-21 04:13:00',NULL,0,'2022-08-21 04:12:44','2022-08-21 09:51:21'),(9,2,NULL,2,1,'2022-08-21 04:13:00',NULL,NULL,'2022-08-21 04:13:13','2022-08-21 04:13:13'),(10,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-21 04:21:01','2022-08-21 04:21:01'),(11,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-21 04:21:01','2022-08-21 04:21:01'),(13,2,NULL,3,1,'2022-08-21 04:13:00',NULL,NULL,'2022-08-21 09:51:21','2022-08-21 09:51:21'),(14,4,NULL,5,NULL,'2022-08-21 09:55:00',NULL,NULL,'2022-08-21 09:55:25','2022-08-21 09:55:25'),(15,4,NULL,5,NULL,'2022-08-21 09:55:00',NULL,NULL,'2022-08-21 09:55:25','2022-08-21 09:55:25'),(16,4,NULL,5,NULL,'2022-08-21 09:55:00',NULL,NULL,'2022-08-21 09:55:25','2022-08-21 09:55:25'),(17,3,NULL,4,1,'2022-08-21 09:56:00',NULL,1,'2022-08-21 09:56:24','2022-08-21 09:56:57'),(18,3,NULL,4,1,'2022-08-21 09:56:00',NULL,NULL,'2022-08-21 09:56:57','2022-08-21 09:56:57'),(20,3,NULL,4,1,'2022-08-21 09:56:00',NULL,NULL,'2022-08-21 10:50:06','2022-08-21 10:50:06'),(21,5,NULL,6,1,'2022-08-22 01:12:00',NULL,1,'2022-08-22 01:12:16','2022-08-22 01:12:36'),(22,5,NULL,6,1,'2022-08-22 01:12:00',NULL,NULL,'2022-08-22 01:12:36','2022-08-22 01:12:36'),(24,5,NULL,6,1,'2022-08-22 01:12:00',NULL,NULL,'2022-08-22 06:06:39','2022-08-22 06:06:39'),(25,5,NULL,6,1,'2022-08-22 06:08:00',NULL,1,'2022-08-22 06:07:51','2022-08-22 06:08:10'),(26,5,NULL,6,1,'2022-08-22 06:08:00',NULL,NULL,'2022-08-22 06:08:10','2022-08-22 06:08:10'),(27,5,NULL,6,1,'2022-08-22 06:08:00',NULL,1,'2022-08-22 06:08:13','2022-08-22 06:08:25'),(28,5,NULL,6,1,'2022-08-22 06:08:00',NULL,NULL,'2022-08-22 06:08:25','2022-08-22 06:08:25'),(29,6,NULL,8,1,'2022-08-22 06:20:00',NULL,NULL,'2022-08-22 06:20:13','2022-08-22 09:23:48'),(30,6,NULL,7,1,'2022-08-22 06:20:00',NULL,NULL,'2022-08-22 06:20:21','2022-08-22 06:20:21'),(31,6,NULL,7,1,'2022-08-22 06:20:00',NULL,NULL,'2022-08-22 06:20:23','2022-08-22 06:20:32'),(32,6,NULL,7,1,'2022-08-22 06:20:00',NULL,NULL,'2022-08-22 06:20:32','2022-08-22 06:20:32'),(33,6,NULL,7,1,'2022-08-22 06:20:00',NULL,NULL,'2022-08-22 06:20:41','2022-08-22 06:20:50'),(34,6,NULL,7,1,'2022-08-22 06:20:00',NULL,NULL,'2022-08-22 06:20:51','2022-08-22 06:20:51'),(35,4,NULL,5,NULL,'2022-08-21 09:55:00',NULL,NULL,'2022-08-22 06:37:20','2022-08-22 06:37:20'),(36,4,NULL,5,NULL,'2022-08-21 09:55:00',NULL,NULL,'2022-08-22 06:38:13','2022-08-22 06:38:13'),(37,4,NULL,5,NULL,'2022-08-21 09:55:00',NULL,NULL,'2022-08-22 06:38:13','2022-08-22 06:38:13'),(39,6,NULL,7,1,'2022-08-22 06:20:00',NULL,NULL,'2022-08-22 06:41:48','2022-08-22 06:41:48'),(41,6,NULL,7,1,'2022-08-22 06:20:00',NULL,NULL,'2022-08-22 06:41:57','2022-08-22 06:41:57'),(43,6,NULL,7,1,'2022-08-22 06:20:00',NULL,NULL,'2022-08-22 07:17:52','2022-08-22 07:17:52'),(45,6,NULL,7,1,'2022-08-22 06:20:00',NULL,NULL,'2022-08-22 07:31:13','2022-08-22 07:31:13'),(47,6,NULL,8,1,'2022-08-22 06:20:00',NULL,NULL,'2022-08-22 09:23:48','2022-08-22 09:23:48'),(49,6,NULL,8,1,'2022-08-22 06:20:00',NULL,NULL,'2022-08-22 09:54:22','2022-08-22 09:54:22'),(51,6,NULL,8,1,'2022-08-22 06:20:00',NULL,NULL,'2022-08-22 10:00:16','2022-08-22 10:00:16'),(52,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-25 02:29:45','2022-08-25 02:29:45'),(53,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-25 02:29:54','2022-08-25 02:29:54'),(56,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-25 02:30:26','2022-08-25 02:30:26'),(58,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-25 02:30:47','2022-08-25 02:30:47'),(59,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-25 02:37:03','2022-08-25 02:37:03'),(73,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-25 02:38:05','2022-08-25 02:38:05'),(77,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-25 02:46:14','2022-08-25 02:46:14'),(81,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-25 02:52:40','2022-08-25 02:52:40'),(85,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-25 02:53:04','2022-08-25 02:53:04'),(88,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-25 02:56:04','2022-08-25 02:56:04'),(93,1,NULL,1,NULL,'2022-08-21 04:10:00',NULL,NULL,'2022-08-25 03:03:55','2022-08-25 03:03:55');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Home','home',0,'site',NULL,'Home',1,'2022-08-21 04:10:07','2022-08-25 02:29:54',NULL,'473cd196-cf5c-4baa-a5ea-349a3bb0f6db'),(2,2,2,'Course','course',1,'site',NULL,NULL,1,'2022-08-21 04:10:57','2022-08-21 04:23:04','2022-08-21 09:51:51','08a66ba6-570b-4304-9192-aae3fab47306'),(3,2,3,'Lesson','lesson',1,'site',NULL,NULL,2,'2022-08-21 09:51:09','2022-08-21 09:51:09','2022-08-21 09:51:51','ccf6289f-f0ec-4734-be84-7ac837ef2f90'),(4,3,4,'Lesson','lesson',1,'site',NULL,NULL,1,'2022-08-21 09:54:00','2022-08-21 09:54:11','2022-08-22 01:11:39','4ad911c2-4d63-4304-9ab1-448ebda72c26'),(5,4,5,'All Courses','allCourses',0,'site',NULL,'{section.name|raw}',1,'2022-08-21 09:55:24','2022-08-21 09:55:24',NULL,'6973ba16-7b59-4d9d-a25d-b356f9073a6c'),(6,5,6,'lesson','lesson',1,'site',NULL,NULL,1,'2022-08-22 01:11:54','2022-08-22 01:12:10','2022-08-22 06:19:02','49dbfcca-9164-498c-a6d1-9ec33b38fe9a'),(7,6,7,'Lesson','lesson',1,'site',NULL,NULL,1,'2022-08-22 06:19:53','2022-08-22 06:20:07',NULL,'b21277df-0868-459b-aa4f-825ec466acec'),(8,6,8,'Course','course',1,'site',NULL,NULL,2,'2022-08-22 09:21:36','2022-08-22 09:21:36',NULL,'957247f2-372a-46e5-8e07-811eec1bedd7');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2022-08-21 04:07:40','2022-08-21 04:07:40',NULL,'98e751bd-c025-43ee-9615-2ee39bbcbc9b'),(2,'Lesson','2022-08-22 06:05:45','2022-08-22 06:05:45',NULL,'7e4af13a-297b-44c7-9e6a-e48fb5e523e7'),(3,'Homepage','2022-08-25 02:25:04','2022-08-25 02:25:04',NULL,'ae727592-cdcb-464b-824c-a2aefc697ada');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (1,4,10,1,0,1,'2022-08-21 10:49:19','2022-08-21 10:49:19','a2a30874-699b-4ee2-9b4f-f1935080fe99'),(3,6,13,2,0,1,'2022-08-22 06:06:18','2022-08-22 06:06:18','d52e8bc5-6dd8-41c6-951f-3bee46ead8d5'),(4,6,13,1,0,2,'2022-08-22 06:06:18','2022-08-22 06:06:18','6bf1896d-f9f0-4727-8cc7-81f6e7628ec1'),(8,8,17,3,0,1,'2022-08-22 09:21:36','2022-08-22 09:21:36','d8a0324d-d32a-4b2c-a797-da7c5501ea29'),(9,8,17,4,0,2,'2022-08-22 09:21:36','2022-08-22 09:21:36','a0c2142d-6902-4d5c-9e03-c0e93022dc84'),(10,8,17,1,0,3,'2022-08-22 09:21:36','2022-08-22 09:21:36','9e064a73-381c-450a-adab-82eb79a96204'),(11,7,18,1,0,1,'2022-08-22 09:21:43','2022-08-22 09:21:43','2253038d-7acc-4f81-91c2-10eac38c6b95'),(18,10,22,9,0,0,'2022-08-25 02:36:27','2022-08-25 02:36:27','ff05767f-ee27-49fb-96d7-72ed6e57381d'),(19,1,23,6,0,1,'2022-08-25 02:37:03','2022-08-25 02:37:03','351e9c74-315f-4b7c-8495-731fe7dec615'),(20,1,23,7,0,2,'2022-08-25 02:37:03','2022-08-25 02:37:03','03b8c06a-2f1a-4a63-8eb7-e5d77423f879'),(21,1,23,8,0,3,'2022-08-25 02:37:03','2022-08-25 02:37:03','ccd1f160-4bd4-42c1-8b8f-8827b8e0c06f'),(22,11,24,10,0,0,'2022-08-25 03:30:40','2022-08-25 03:30:40','b9a41620-f4b5-4fde-9773-4da1ced2c31e');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2022-08-21 04:10:07','2022-08-21 04:10:07',NULL,'4debbbc8-8e32-414b-b8ef-df1bf3ccf457'),(2,'craft\\elements\\Entry','2022-08-21 04:10:57','2022-08-21 04:10:57','2022-08-21 09:51:51','a6e22c71-fe46-4ccc-9560-510718cd0a41'),(3,'craft\\elements\\Entry','2022-08-21 09:51:09','2022-08-21 09:51:09','2022-08-21 09:51:51','66bcc4a7-068a-427a-961a-c741b87034bf'),(4,'craft\\elements\\Entry','2022-08-21 09:54:00','2022-08-21 09:54:00','2022-08-22 01:11:39','ac58a35c-e437-4e7b-b29d-6a1a9c508cb5'),(5,'craft\\elements\\Entry','2022-08-21 09:55:24','2022-08-21 09:55:24',NULL,'abadb628-be50-4798-a4d1-fb77d6beebbc'),(6,'craft\\elements\\Entry','2022-08-22 01:11:54','2022-08-22 01:11:54','2022-08-22 06:19:02','d623cd1a-97ec-47ef-a7ee-592ce74e3b11'),(7,'craft\\elements\\Entry','2022-08-22 06:19:53','2022-08-22 06:19:53',NULL,'7ab08eb5-45f5-4d5c-b8b6-79e869234fb7'),(8,'craft\\elements\\Entry','2022-08-22 09:21:36','2022-08-22 09:21:36',NULL,'6ea8c179-4fb2-48a0-bf61-1622bc76bb25'),(9,'craft\\elements\\Asset','2022-08-25 02:26:30','2022-08-25 02:26:30',NULL,'844dd100-ff9f-4bad-94bd-7673f6d6c96f'),(10,'craft\\elements\\MatrixBlock','2022-08-25 02:36:27','2022-08-25 02:36:27',NULL,'4d86fcfa-d683-477e-baa3-e5634f718986'),(11,'craft\\elements\\GlobalSet','2022-08-25 03:30:40','2022-08-25 03:30:40',NULL,'e51ca82b-101b-4ea6-ad55-f289bff6df4b');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (4,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"64a6a4b4-415f-4411-a806-0427f76f8a51\",\"userCondition\":null,\"elementCondition\":null}]',1,'2022-08-21 04:23:04','2022-08-21 04:23:04','ab816d5f-b919-4463-b754-c4e75cc3e7c1'),(5,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"246b349c-03f5-4e1b-87d4-eac7f47194d3\",\"userCondition\":null,\"elementCondition\":null}]',1,'2022-08-21 09:51:09','2022-08-21 09:51:09','2de05200-fbfb-47bc-9427-2c477a64dfa3'),(8,5,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"15cefbe4-2d32-4b5f-b5a2-40f64ca80378\",\"userCondition\":null,\"elementCondition\":null}]',1,'2022-08-21 09:55:24','2022-08-21 09:55:24','ecb8b7c7-4958-401a-869d-e3b7539c789a'),(10,4,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":\"Format as following\\r\\nCourse Name - Lesson Name\",\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"1450c0fe-5b21-49d8-b070-c7343ca0d4a3\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"2cb4e00d-6f3b-4bf4-a972-5aada7f43c18\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"74f6c850-cba2-46b8-b972-12b405727dbb\"}]',1,'2022-08-21 10:49:19','2022-08-21 10:49:19','eac58036-4312-45d0-9a27-551aae0e54e1'),(13,6,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"5b5b9b38-0120-4449-8308-6743ca8b39d4\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"1eac6004-b982-40a9-a616-c6101007ab97\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"755298d6-91c9-4de3-b4ed-1be63429983f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"a474d2cc-42e0-4a08-84c0-aa4c5b36bc46\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"74f6c850-cba2-46b8-b972-12b405727dbb\"}]',1,'2022-08-22 06:06:18','2022-08-22 06:06:18','6d5cdee7-5075-4bec-8f17-ecf09b8ae5c4'),(17,8,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"c0b3a42c-9599-4aa2-9e8b-871c9176ffaf\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"fc55a076-a860-4a44-81cc-9939c53c47ca\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"3ba98823-b17d-4778-a3a2-65a46d6402b1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b15448e7-6293-481d-8bf5-adc11e5d13d9\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"8ae80f80-dda0-415e-821f-08ddc32f2525\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"2ffd3723-5ff8-4694-83d9-be709f5c1eaa\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"74f6c850-cba2-46b8-b972-12b405727dbb\"}]',1,'2022-08-22 09:21:36','2022-08-22 09:21:36','e6019d27-1c2e-48a4-922b-64b3229b9cc7'),(18,7,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"01078df6-7542-4696-aca6-ac33f8840c21\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"3a4ae417-b0ed-4118-8d65-5b223eac51bf\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"74f6c850-cba2-46b8-b972-12b405727dbb\"}]',1,'2022-08-22 09:21:43','2022-08-22 09:21:43','bf92a2db-2903-468f-bd68-f61a743a0c30'),(19,9,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"d9700913-d0fd-4900-bdf1-cf97f93e970e\",\"userCondition\":null,\"elementCondition\":null}]',1,'2022-08-25 02:26:30','2022-08-25 02:26:30','e36e9de4-af4d-4c58-ab1e-355ca58c7816'),(22,10,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"66a0b977-b659-493b-a872-39d92cf4f45d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58\"}]',1,'2022-08-25 02:36:27','2022-08-25 02:36:27','e6d0d193-12d9-42d0-b927-d0d734099cdb'),(23,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"cfda38b3-54d3-4229-b4bc-7114b0932cde\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"6491207b-a005-4cda-b7af-06561489d125\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c32a631a-0aee-45aa-a428-01aaa1231be6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"d98190f8-7ad9-4543-a2ba-6cf2e4b0c4b7\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7c94ef32-b523-4f2c-9b33-6a6a88e9071b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"a1a1e00b-bd4a-4c67-a2eb-d8383ba36082\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cb874278-0da4-4d05-906b-675ebd60a53b\"}]',1,'2022-08-25 02:37:03','2022-08-25 02:37:03','761f596d-933b-4a4c-b5c8-0581c38d822d'),(24,11,'Images','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"0a6c52a5-c3a1-4a72-9272-4154e5874f16\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6898c965-368f-4e26-a4a4-8054b918a827\"}]',1,'2022-08-25 03:30:40','2022-08-25 03:30:40','c48a47f5-7194-495a-af55-39d21e2e5b09');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,1,'Redactor','redactor','global','uydzvoip',NULL,0,'none',NULL,'craft\\redactor\\Field','{\"uiMode\":\"enlarged\",\"redactorConfig\":null,\"availableVolumes\":\"*\",\"availableTransforms\":\"*\",\"showUnpermittedVolumes\":false,\"showUnpermittedFiles\":false,\"showHtmlButtonForNonAdmins\":false,\"configSelectionMode\":\"choose\",\"manualConfig\":\"\",\"defaultTransform\":\"\",\"purifierConfig\":null,\"removeInlineStyles\":false,\"removeEmptyTags\":false,\"removeNbsp\":false,\"purifyHtml\":true,\"columnType\":\"text\"}','2022-08-21 10:48:54','2022-08-22 06:06:03','74f6c850-cba2-46b8-b972-12b405727dbb'),(2,2,'Order Index','orderIndex','global','ftfyjoff','Number - 1 is first lesson in a course, 2 is second ....',0,'none',NULL,'craft\\fields\\Number','{\"decimals\":0,\"defaultValue\":null,\"max\":null,\"min\":1,\"prefix\":null,\"previewCurrency\":null,\"previewFormat\":\"decimal\",\"size\":null,\"suffix\":null}','2022-08-22 06:05:33','2022-08-22 10:04:55','755298d6-91c9-4de3-b4ed-1be63429983f'),(3,2,'Blurb','blurb','global','vtcivwkx','Blurb for this display card',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2022-08-22 07:30:37','2022-08-22 07:30:37','3ba98823-b17d-4778-a3a2-65a46d6402b1'),(4,1,'Course Tags','courseTags','global','dmzzalgn','Tags to sort courses',0,'none',NULL,'craft\\fields\\Checkboxes','{\"options\":[{\"label\":\"Lighting\",\"value\":\"lighting\",\"default\":\"\"},{\"label\":\"Sound\",\"value\":\"sound\",\"default\":\"\"},{\"label\":\"Stage Management\",\"value\":\"stageManagement\",\"default\":\"\"},{\"label\":\"Audio Visual\",\"value\":\"audioVisual\",\"default\":\"\"},{\"label\":\"Livestreaming\",\"value\":\"livestreaming\",\"default\":\"\"},{\"label\":\"Production Management\",\"value\":\"productionManagement\",\"default\":\"\"},{\"label\":\"General\",\"value\":\"general\",\"default\":\"\"},{\"label\":\"Intro\",\"value\":\"intro\",\"default\":\"\"},{\"label\":\"Level 1\",\"value\":\"level1\",\"default\":\"\"},{\"label\":\"Level 2\",\"value\":\"level2\",\"default\":\"\"},{\"label\":\"Level 3\",\"value\":\"level3\",\"default\":\"\"},{\"label\":\"Industry\",\"value\":\"industry\",\"default\":\"\"},{\"label\":\"Design\",\"value\":\"design\",\"default\":\"\"},{\"label\":\"Apply\",\"value\":\"apply\",\"default\":\"\"}]}','2022-08-22 09:20:52','2022-08-22 09:23:37','8ae80f80-dda0-415e-821f-08ddc32f2525'),(6,3,'Hero Image','heroImage','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:70e6fcab-0d35-4b12-89a1-47822b74bd85\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:70e6fcab-0d35-4b12-89a1-47822b74bd85\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-08-25 02:28:24','2022-08-25 02:28:24','c32a631a-0aee-45aa-a428-01aaa1231be6'),(7,3,'Tagline','tagline','global','kvudlfgi',NULL,0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":null,\"purifyHtml\":true,\"redactorConfig\":null,\"removeEmptyTags\":false,\"removeInlineStyles\":false,\"removeNbsp\":false,\"showHtmlButtonForNonAdmins\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2022-08-25 02:28:49','2022-08-25 02:51:50','7c94ef32-b523-4f2c-9b33-6a6a88e9071b'),(8,3,'cards','cards','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_cards}}\",\"maxBlocks\":null,\"minBlocks\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2022-08-25 02:36:26','2022-08-25 02:36:26','cb874278-0da4-4d05-906b-675ebd60a53b'),(9,NULL,'redactor','redactor','matrixBlockType:7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0','xrtsojkt',NULL,0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":null,\"purifyHtml\":true,\"redactorConfig\":null,\"removeEmptyTags\":false,\"removeInlineStyles\":false,\"removeNbsp\":false,\"showHtmlButtonForNonAdmins\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2022-08-25 02:36:27','2022-08-25 02:36:27','45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58'),(10,1,'Logo','logo','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:70e6fcab-0d35-4b12-89a1-47822b74bd85\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:70e6fcab-0d35-4b12-89a1-47822b74bd85\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-08-25 03:30:18','2022-08-25 03:30:18','6898c965-368f-4e26-a4a4-8054b918a827');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `globalsets` VALUES (96,'Branding','branding',11,1,'2022-08-25 03:30:40','2022-08-25 03:30:40','f971d1f8-9a89-4080-84ad-31ae80b8bea9');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.2.2','4.0.0.9',0,'weqxhbxqmeye','3@debfhsdvvp','2022-08-21 04:07:40','2022-08-25 04:50:54','9f09d7fd-6361-4d18-997c-843f90fb6b72');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks` VALUES (71,2,8,1,NULL,'2022-08-25 02:38:05','2022-08-25 02:38:05'),(72,2,8,1,NULL,'2022-08-25 02:38:05','2022-08-25 02:38:05'),(74,73,8,1,NULL,'2022-08-25 02:38:05','2022-08-25 02:38:05'),(75,73,8,1,NULL,'2022-08-25 02:38:06','2022-08-25 02:38:06'),(78,77,8,1,NULL,'2022-08-25 02:46:14','2022-08-25 02:46:14'),(79,77,8,1,NULL,'2022-08-25 02:46:14','2022-08-25 02:46:14'),(82,81,8,1,NULL,'2022-08-25 02:52:40','2022-08-25 02:52:40'),(83,81,8,1,NULL,'2022-08-25 02:52:40','2022-08-25 02:52:40'),(86,85,8,1,NULL,'2022-08-25 02:53:04','2022-08-25 02:53:04'),(87,85,8,1,NULL,'2022-08-25 02:53:04','2022-08-25 02:53:04'),(89,88,8,1,NULL,'2022-08-25 02:56:04','2022-08-25 02:56:04'),(90,88,8,1,NULL,'2022-08-25 02:56:04','2022-08-25 02:56:04'),(94,93,8,1,NULL,'2022-08-25 03:03:55','2022-08-25 03:03:55'),(95,93,8,1,NULL,'2022-08-25 03:03:55','2022-08-25 03:03:55');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks_owners` VALUES (71,2,1),(72,2,2),(74,73,1),(75,73,2),(78,77,1),(79,77,2),(82,81,1),(83,81,2),(86,85,1),(87,85,2),(89,88,1),(90,88,2),(94,93,1),(95,93,2);
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocktypes` VALUES (1,8,10,'card','card',1,'2022-08-25 02:36:27','2022-08-25 02:36:27','7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_cards`
--

LOCK TABLES `matrixcontent_cards` WRITE;
/*!40000 ALTER TABLE `matrixcontent_cards` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_cards` VALUES (1,61,1,'2022-08-25 02:37:13','2022-08-25 02:37:13','1a491251-6821-46af-a5c5-8c6147609808',NULL),(2,62,1,'2022-08-25 02:37:51','2022-08-25 02:37:51','2f1f4cbc-9193-4add-826e-5d33fcc1161d','<p>test card one</p>'),(3,63,1,'2022-08-25 02:37:52','2022-08-25 02:37:52','b430ba77-8074-4a18-9d35-22708b00638d','<p>test card one</p>'),(4,64,1,'2022-08-25 02:37:52','2022-08-25 02:37:52','0f5b5adc-08e6-4444-9413-cc09d656b4ae',NULL),(5,65,1,'2022-08-25 02:37:56','2022-08-25 02:37:56','d9d0a544-7fd6-4b1a-921e-96c83c2bfc4d','<p>test card one</p>'),(6,66,1,'2022-08-25 02:37:56','2022-08-25 02:37:56','e964f736-fe78-4823-935e-179912c78fb2','<p>car two</p>'),(7,67,1,'2022-08-25 02:37:57','2022-08-25 02:37:57','4a093ff1-9620-4e10-8f1f-b2ae0c2073bd','<p>test card one</p>'),(8,68,1,'2022-08-25 02:37:57','2022-08-25 02:37:57','0b1cafbd-61c7-4747-98e3-28bf42ffbd84','<p>car two </p>'),(11,71,1,'2022-08-25 02:38:05','2022-08-25 02:38:05','26885988-14d1-41a1-baed-4895131b7f67','<p>test card one</p>'),(12,72,1,'2022-08-25 02:38:05','2022-08-25 02:38:05','e8b9bbc9-0109-4cda-8425-b29c6408d17f','<p>car two yo</p>'),(13,74,1,'2022-08-25 02:38:05','2022-08-25 02:38:05','a7e76090-7613-4986-9a01-cabda02952c3','<p>test card one</p>'),(14,75,1,'2022-08-25 02:38:06','2022-08-25 02:38:06','5885b6fe-27a6-48f2-9433-37c0fece3d29','<p>car two yo</p>'),(15,78,1,'2022-08-25 02:46:14','2022-08-25 02:46:14','81e4222c-6e0d-40d9-a924-eee34ef138cc','<p>test card one</p>'),(16,79,1,'2022-08-25 02:46:14','2022-08-25 02:46:14','11315973-f941-414b-9bd9-c4a72a1c1b81','<p>car two yo</p>'),(17,82,1,'2022-08-25 02:52:40','2022-08-25 02:52:40','07ddfa21-7ff9-493a-8d64-30fca560386e','<p>test card one</p>'),(18,83,1,'2022-08-25 02:52:40','2022-08-25 02:52:40','beaa3539-e5ee-4088-8cc8-10608661da0a','<p>car two yo</p>'),(19,86,1,'2022-08-25 02:53:04','2022-08-25 02:53:04','09b87742-e98f-40f8-98e1-636248b0a857','<p>test card one</p>'),(20,87,1,'2022-08-25 02:53:04','2022-08-25 02:53:04','c8675b56-2270-4d53-8655-318ee17dc6d5','<p>car two yo</p>'),(21,89,1,'2022-08-25 02:56:04','2022-08-25 02:56:04','559fc53f-4a04-4a97-8767-cab44b74858e','<p>test card one</p>'),(22,90,1,'2022-08-25 02:56:04','2022-08-25 02:56:04','6d62c639-080d-4d72-99fc-f370d05c4fa6','<p>car two yo</p>'),(23,94,1,'2022-08-25 03:03:55','2022-08-25 03:03:55','727ecee1-e803-47b5-9bd1-0b9430208a50','<p>test card one</p>'),(24,95,1,'2022-08-25 03:03:55','2022-08-25 03:03:55','7b2799e9-7338-41db-bc8b-8a900e04e569','<p>car two yo</p>');
/*!40000 ALTER TABLE `matrixcontent_cards` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','fa0873f4-727a-4bab-8f25-489ac9e6e2fb'),(2,'craft','m210121_145800_asset_indexing_changes','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','3655ba83-5fe9-4ce6-a59c-4fc584307546'),(3,'craft','m210624_222934_drop_deprecated_tables','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','03a1654f-1c51-46b9-87b4-c9915b108692'),(4,'craft','m210724_180756_rename_source_cols','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','fed08d76-3587-42d9-bddc-ab178e2238da'),(5,'craft','m210809_124211_remove_superfluous_uids','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','7af2a2b3-b0b4-4023-b572-2b8b927c4528'),(6,'craft','m210817_014201_universal_users','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','5889047f-9c50-42f5-843a-ce4fe727daeb'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','6cf018d8-bf44-43c1-afff-af76bf178047'),(8,'craft','m211115_135500_image_transformers','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','a07cf649-c326-4cbf-ba1a-6e7d43d37537'),(9,'craft','m211201_131000_filesystems','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','5f4b5240-f724-49cd-88fb-6f0ec1ba2727'),(10,'craft','m220103_043103_tab_conditions','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','e5307884-3445-46a1-b3d6-3a162824daad'),(11,'craft','m220104_003433_asset_alt_text','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','bdaf9cb3-b43c-45a7-bf2b-3e8636e2cc0f'),(12,'craft','m220123_213619_update_permissions','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','ecdba65e-c17b-4a37-bb41-21c93db9d699'),(13,'craft','m220126_003432_addresses','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','72b03808-c06b-4a72-979b-49a7e29002da'),(14,'craft','m220209_095604_add_indexes','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','bdb0d263-5c13-4343-befe-677d74a1e698'),(15,'craft','m220213_015220_matrixblocks_owners_table','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','384dba08-7e0c-469a-95c5-457eca9cb420'),(16,'craft','m220214_000000_truncate_sessions','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','f59a549d-4a7e-42a7-b44b-7ec771bbd0cb'),(17,'craft','m220222_122159_full_names','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','53cd1e07-fd8e-46d1-960f-3eb1f1aa7455'),(18,'craft','m220223_180559_nullable_address_owner','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','22d9526a-929e-4cd5-ba71-590e368d045e'),(19,'craft','m220225_165000_transform_filesystems','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','c90fd5c1-cc93-4c28-aa16-6c5f62ff726b'),(20,'craft','m220309_152006_rename_field_layout_elements','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','7d041d45-63af-4767-b35a-cd7d550cbe8a'),(21,'craft','m220314_211928_field_layout_element_uids','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','c8ebd0cf-2cdf-45be-821a-fede6f8b7e8a'),(22,'craft','m220316_123800_transform_fs_subpath','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','35999380-86be-4209-8ac8-afa3c6b5dfea'),(23,'craft','m220317_174250_release_all_jobs','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','5ce2cb53-cc94-47f0-a230-8c559da43787'),(24,'craft','m220330_150000_add_site_gql_schema_components','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','5509b521-5b68-41b6-9ff8-775cc3eeaf10'),(25,'craft','m220413_024536_site_enabled_string','2022-08-21 04:07:41','2022-08-21 04:07:41','2022-08-21 04:07:41','976fd3c6-d87f-48a3-b692-3fbb9416f683'),(26,'plugin:redactor','m180430_204710_remove_old_plugins','2022-08-21 10:46:18','2022-08-21 10:46:18','2022-08-21 10:46:18','a049dbb1-7fd4-4dc7-b2ce-7c71cfe9087d'),(27,'plugin:redactor','Install','2022-08-21 10:46:18','2022-08-21 10:46:18','2022-08-21 10:46:18','0b29ea27-c710-49f8-ae0d-064cf0b36a75'),(28,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2022-08-21 10:46:18','2022-08-21 10:46:18','2022-08-21 10:46:18','0caf82f7-5e50-4b8e-b263-1ca96b7ec6f8');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'redactor','3.0.2','2.3.0','unknown',NULL,'2022-08-21 10:46:18','2022-08-21 10:46:18','2022-08-25 02:31:43','2be571fb-3174-455c-9cb0-ce0e489f5191');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1661403054'),('email.fromEmail','\"emailnzjoe@gmail.com\"'),('email.fromName','\"StageCraft\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elementCondition','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.autocapitalize','true'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.autocomplete','false'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.autocorrect','true'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.class','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.disabled','false'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.elementCondition','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.id','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.instructions','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.label','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.max','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.min','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.name','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.orientation','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.placeholder','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.readonly','false'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.requirable','false'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.size','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.step','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.tip','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.title','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.uid','\"cfda38b3-54d3-4229-b4bc-7114b0932cde\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.userCondition','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.warning','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.0.width','100'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.1.elementCondition','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.1.fieldUid','\"c32a631a-0aee-45aa-a428-01aaa1231be6\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.1.instructions','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.1.label','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.1.required','false'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.1.tip','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.1.uid','\"6491207b-a005-4cda-b7af-06561489d125\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.1.userCondition','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.1.warning','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.1.width','100'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.2.elementCondition','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.2.fieldUid','\"7c94ef32-b523-4f2c-9b33-6a6a88e9071b\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.2.instructions','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.2.label','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.2.required','false'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.2.tip','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.2.uid','\"d98190f8-7ad9-4543-a2ba-6cf2e4b0c4b7\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.2.userCondition','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.2.warning','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.2.width','100'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.3.elementCondition','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.3.fieldUid','\"cb874278-0da4-4d05-906b-675ebd60a53b\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.3.instructions','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.3.label','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.3.required','false'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.3.tip','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.3.uid','\"a1a1e00b-bd4a-4c67-a2eb-d8383ba36082\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.3.userCondition','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.3.warning','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.elements.3.width','100'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.name','\"Content\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.uid','\"761f596d-933b-4a4c-b5c8-0581c38d822d\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.fieldLayouts.4debbbc8-8e32-414b-b8ef-df1bf3ccf457.tabs.0.userCondition','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.handle','\"home\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.hasTitleField','false'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.name','\"Home\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.section','\"00885ec1-1272-40f5-b824-069712416b50\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.sortOrder','1'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.titleFormat','\"Home\"'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.titleTranslationKeyFormat','null'),('entryTypes.473cd196-cf5c-4baa-a5ea-349a3bb0f6db.titleTranslationMethod','\"site\"'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elementCondition','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.autocapitalize','true'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.autocomplete','false'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.autocorrect','true'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.class','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.disabled','false'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.elementCondition','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.id','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.instructions','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.label','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.max','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.min','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.name','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.orientation','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.placeholder','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.readonly','false'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.requirable','false'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.size','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.step','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.tip','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.title','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.uid','\"15cefbe4-2d32-4b5f-b5a2-40f64ca80378\"'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.userCondition','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.warning','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.elements.0.width','100'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.name','\"Content\"'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.uid','\"ecb8b7c7-4958-401a-869d-e3b7539c789a\"'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.fieldLayouts.abadb628-be50-4798-a4d1-fb77d6beebbc.tabs.0.userCondition','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.handle','\"allCourses\"'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.hasTitleField','false'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.name','\"All Courses\"'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.section','\"e59edfaf-8bac-4742-bfae-b8f0419e4955\"'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.sortOrder','1'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.titleFormat','\"{section.name|raw}\"'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.titleTranslationKeyFormat','null'),('entryTypes.6973ba16-7b59-4d9d-a25d-b356f9073a6c.titleTranslationMethod','\"site\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elementCondition','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.autocapitalize','true'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.autocomplete','false'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.autocorrect','true'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.class','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.disabled','false'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.elementCondition','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.id','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.instructions','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.label','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.max','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.min','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.name','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.orientation','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.placeholder','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.readonly','false'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.requirable','false'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.size','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.step','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.tip','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.title','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.uid','\"c0b3a42c-9599-4aa2-9e8b-871c9176ffaf\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.userCondition','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.warning','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.0.width','100'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.1.elementCondition','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.1.fieldUid','\"3ba98823-b17d-4778-a3a2-65a46d6402b1\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.1.instructions','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.1.label','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.1.required','false'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.1.tip','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.1.uid','\"fc55a076-a860-4a44-81cc-9939c53c47ca\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.1.userCondition','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.1.warning','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.1.width','100'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.2.elementCondition','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.2.fieldUid','\"8ae80f80-dda0-415e-821f-08ddc32f2525\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.2.instructions','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.2.label','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.2.required','false'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.2.tip','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.2.uid','\"b15448e7-6293-481d-8bf5-adc11e5d13d9\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.2.userCondition','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.2.warning','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.2.width','100'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.3.elementCondition','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.3.fieldUid','\"74f6c850-cba2-46b8-b972-12b405727dbb\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.3.instructions','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.3.label','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.3.required','false'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.3.tip','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.3.uid','\"2ffd3723-5ff8-4694-83d9-be709f5c1eaa\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.3.userCondition','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.3.warning','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.elements.3.width','100'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.name','\"Content\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.uid','\"e6019d27-1c2e-48a4-922b-64b3229b9cc7\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.fieldLayouts.6ea8c179-4fb2-48a0-bf61-1622bc76bb25.tabs.0.userCondition','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.handle','\"course\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.hasTitleField','true'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.name','\"Course\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.section','\"9b41905c-1194-4d27-8f5f-afb4ccfb6a18\"'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.sortOrder','2'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.titleFormat','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.titleTranslationKeyFormat','null'),('entryTypes.957247f2-372a-46e5-8e07-811eec1bedd7.titleTranslationMethod','\"site\"'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elementCondition','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.autocapitalize','true'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.autocomplete','false'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.autocorrect','true'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.class','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.disabled','false'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.elementCondition','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.id','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.instructions','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.label','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.max','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.min','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.name','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.orientation','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.placeholder','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.readonly','false'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.requirable','false'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.size','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.step','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.tip','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.title','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.uid','\"01078df6-7542-4696-aca6-ac33f8840c21\"'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.userCondition','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.warning','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.0.width','100'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.1.elementCondition','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.1.fieldUid','\"74f6c850-cba2-46b8-b972-12b405727dbb\"'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.1.instructions','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.1.label','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.1.required','false'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.1.tip','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.1.uid','\"3a4ae417-b0ed-4118-8d65-5b223eac51bf\"'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.1.userCondition','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.1.warning','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.elements.1.width','100'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.name','\"Content\"'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.uid','\"bf92a2db-2903-468f-bd68-f61a743a0c30\"'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.fieldLayouts.7ab08eb5-45f5-4d5c-b8b6-79e869234fb7.tabs.0.userCondition','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.handle','\"lesson\"'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.hasTitleField','true'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.name','\"Lesson\"'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.section','\"9b41905c-1194-4d27-8f5f-afb4ccfb6a18\"'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.sortOrder','1'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.titleFormat','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.titleTranslationKeyFormat','null'),('entryTypes.b21277df-0868-459b-aa4f-825ec466acec.titleTranslationMethod','\"site\"'),('fieldGroups.7e4af13a-297b-44c7-9e6a-e48fb5e523e7.name','\"Lesson\"'),('fieldGroups.98e751bd-c025-43ee-9615-2ee39bbcbc9b.name','\"Common\"'),('fieldGroups.ae727592-cdcb-464b-824c-a2aefc697ada.name','\"Homepage\"'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.columnSuffix','\"vtcivwkx\"'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.contentColumnType','\"text\"'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.fieldGroup','\"7e4af13a-297b-44c7-9e6a-e48fb5e523e7\"'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.handle','\"blurb\"'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.instructions','\"Blurb for this display card\"'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.name','\"Blurb\"'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.searchable','false'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.settings.byteLimit','null'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.settings.charLimit','null'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.settings.code','false'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.settings.columnType','null'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.settings.initialRows','4'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.settings.multiline','false'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.settings.placeholder','null'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.settings.uiMode','\"normal\"'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.translationKeyFormat','null'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.translationMethod','\"none\"'),('fields.3ba98823-b17d-4778-a3a2-65a46d6402b1.type','\"craft\\\\fields\\\\PlainText\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.columnSuffix','null'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.contentColumnType','\"string\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.fieldGroup','\"98e751bd-c025-43ee-9615-2ee39bbcbc9b\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.handle','\"logo\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.instructions','null'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.name','\"Logo\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.searchable','false'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.allowedKinds.0','\"image\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.allowSelfRelations','false'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.allowSubfolders','false'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.allowUploads','true'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.defaultUploadLocationSource','\"volume:70e6fcab-0d35-4b12-89a1-47822b74bd85\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.defaultUploadLocationSubpath','null'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.localizeRelations','false'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.maxRelations','null'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.minRelations','null'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.previewMode','\"full\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.restrictedDefaultUploadSubpath','null'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.restrictedLocationSource','\"volume:70e6fcab-0d35-4b12-89a1-47822b74bd85\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.restrictedLocationSubpath','null'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.restrictFiles','true'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.restrictLocation','false'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.selectionLabel','null'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.showSiteMenu','false'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.showUnpermittedFiles','false'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.showUnpermittedVolumes','false'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.source','null'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.sources','\"*\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.targetSiteId','null'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.validateRelatedElements','false'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.settings.viewMode','\"list\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.translationKeyFormat','null'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.translationMethod','\"site\"'),('fields.6898c965-368f-4e26-a4a4-8054b918a827.type','\"craft\\\\fields\\\\Assets\"'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.columnSuffix','\"uydzvoip\"'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.contentColumnType','\"text\"'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.fieldGroup','\"98e751bd-c025-43ee-9615-2ee39bbcbc9b\"'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.handle','\"redactor\"'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.instructions','null'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.name','\"Redactor\"'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.searchable','false'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.availableTransforms','\"*\"'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.availableVolumes','\"*\"'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.columnType','\"text\"'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.configSelectionMode','\"choose\"'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.defaultTransform','\"\"'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.manualConfig','\"\"'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.purifierConfig','null'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.purifyHtml','true'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.redactorConfig','null'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.removeEmptyTags','false'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.removeInlineStyles','false'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.removeNbsp','false'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.showHtmlButtonForNonAdmins','false'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.showUnpermittedFiles','false'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.showUnpermittedVolumes','false'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.settings.uiMode','\"enlarged\"'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.translationKeyFormat','null'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.translationMethod','\"none\"'),('fields.74f6c850-cba2-46b8-b972-12b405727dbb.type','\"craft\\\\redactor\\\\Field\"'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.columnSuffix','\"ftfyjoff\"'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.contentColumnType','\"integer(10)\"'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.fieldGroup','\"7e4af13a-297b-44c7-9e6a-e48fb5e523e7\"'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.handle','\"orderIndex\"'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.instructions','\"Number - 1 is first lesson in a course, 2 is second ....\"'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.name','\"Order Index\"'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.searchable','false'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.settings.decimals','0'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.settings.defaultValue','null'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.settings.max','null'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.settings.min','1'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.settings.prefix','null'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.settings.previewCurrency','null'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.settings.previewFormat','\"decimal\"'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.settings.size','null'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.settings.suffix','null'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.translationKeyFormat','null'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.translationMethod','\"none\"'),('fields.755298d6-91c9-4de3-b4ed-1be63429983f.type','\"craft\\\\fields\\\\Number\"'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.columnSuffix','\"kvudlfgi\"'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.contentColumnType','\"text\"'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.fieldGroup','\"ae727592-cdcb-464b-824c-a2aefc697ada\"'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.handle','\"tagline\"'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.instructions','null'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.name','\"Tagline\"'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.searchable','false'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.availableTransforms','\"*\"'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.availableVolumes','\"*\"'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.columnType','\"text\"'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.configSelectionMode','\"choose\"'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.defaultTransform','\"\"'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.manualConfig','\"\"'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.purifierConfig','null'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.purifyHtml','true'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.redactorConfig','null'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.removeEmptyTags','false'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.removeInlineStyles','false'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.removeNbsp','false'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.showHtmlButtonForNonAdmins','false'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.showUnpermittedFiles','false'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.showUnpermittedVolumes','false'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.settings.uiMode','\"enlarged\"'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.translationKeyFormat','null'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.translationMethod','\"none\"'),('fields.7c94ef32-b523-4f2c-9b33-6a6a88e9071b.type','\"craft\\\\redactor\\\\Field\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.columnSuffix','\"dmzzalgn\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.contentColumnType','\"string\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.fieldGroup','\"98e751bd-c025-43ee-9615-2ee39bbcbc9b\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.handle','\"courseTags\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.instructions','\"Tags to sort courses\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.name','\"Course Tags\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.searchable','false'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.0.__assoc__.0.0','\"label\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.0.__assoc__.0.1','\"Lighting\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.0.__assoc__.1.0','\"value\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.0.__assoc__.1.1','\"lighting\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.0.__assoc__.2.0','\"default\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.0.__assoc__.2.1','\"\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.1.__assoc__.0.0','\"label\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.1.__assoc__.0.1','\"Sound\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.1.__assoc__.1.0','\"value\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.1.__assoc__.1.1','\"sound\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.1.__assoc__.2.0','\"default\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.1.__assoc__.2.1','\"\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.10.__assoc__.0.0','\"label\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.10.__assoc__.0.1','\"Level 3\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.10.__assoc__.1.0','\"value\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.10.__assoc__.1.1','\"level3\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.10.__assoc__.2.0','\"default\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.10.__assoc__.2.1','\"\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.11.__assoc__.0.0','\"label\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.11.__assoc__.0.1','\"Industry\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.11.__assoc__.1.0','\"value\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.11.__assoc__.1.1','\"industry\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.11.__assoc__.2.0','\"default\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.11.__assoc__.2.1','\"\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.12.__assoc__.0.0','\"label\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.12.__assoc__.0.1','\"Design\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.12.__assoc__.1.0','\"value\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.12.__assoc__.1.1','\"design\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.12.__assoc__.2.0','\"default\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.12.__assoc__.2.1','\"\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.13.__assoc__.0.0','\"label\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.13.__assoc__.0.1','\"Apply\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.13.__assoc__.1.0','\"value\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.13.__assoc__.1.1','\"apply\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.13.__assoc__.2.0','\"default\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.13.__assoc__.2.1','\"\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.2.__assoc__.0.0','\"label\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.2.__assoc__.0.1','\"Stage Management\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.2.__assoc__.1.0','\"value\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.2.__assoc__.1.1','\"stageManagement\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.2.__assoc__.2.0','\"default\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.2.__assoc__.2.1','\"\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.3.__assoc__.0.0','\"label\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.3.__assoc__.0.1','\"Audio Visual\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.3.__assoc__.1.0','\"value\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.3.__assoc__.1.1','\"audioVisual\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.3.__assoc__.2.0','\"default\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.3.__assoc__.2.1','\"\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.4.__assoc__.0.0','\"label\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.4.__assoc__.0.1','\"Livestreaming\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.4.__assoc__.1.0','\"value\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.4.__assoc__.1.1','\"livestreaming\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.4.__assoc__.2.0','\"default\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.4.__assoc__.2.1','\"\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.5.__assoc__.0.0','\"label\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.5.__assoc__.0.1','\"Production Management\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.5.__assoc__.1.0','\"value\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.5.__assoc__.1.1','\"productionManagement\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.5.__assoc__.2.0','\"default\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.5.__assoc__.2.1','\"\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.6.__assoc__.0.0','\"label\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.6.__assoc__.0.1','\"General\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.6.__assoc__.1.0','\"value\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.6.__assoc__.1.1','\"general\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.6.__assoc__.2.0','\"default\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.6.__assoc__.2.1','\"\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.7.__assoc__.0.0','\"label\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.7.__assoc__.0.1','\"Intro\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.7.__assoc__.1.0','\"value\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.7.__assoc__.1.1','\"intro\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.7.__assoc__.2.0','\"default\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.7.__assoc__.2.1','\"\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.8.__assoc__.0.0','\"label\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.8.__assoc__.0.1','\"Level 1\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.8.__assoc__.1.0','\"value\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.8.__assoc__.1.1','\"level1\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.8.__assoc__.2.0','\"default\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.8.__assoc__.2.1','\"\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.9.__assoc__.0.0','\"label\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.9.__assoc__.0.1','\"Level 2\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.9.__assoc__.1.0','\"value\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.9.__assoc__.1.1','\"level2\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.9.__assoc__.2.0','\"default\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.settings.options.9.__assoc__.2.1','\"\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.translationKeyFormat','null'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.translationMethod','\"none\"'),('fields.8ae80f80-dda0-415e-821f-08ddc32f2525.type','\"craft\\\\fields\\\\Checkboxes\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.columnSuffix','null'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.contentColumnType','\"string\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.fieldGroup','\"ae727592-cdcb-464b-824c-a2aefc697ada\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.handle','\"heroImage\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.instructions','null'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.name','\"Hero Image\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.searchable','false'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.allowedKinds.0','\"image\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.allowSelfRelations','false'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.allowSubfolders','false'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.allowUploads','true'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.defaultUploadLocationSource','\"volume:70e6fcab-0d35-4b12-89a1-47822b74bd85\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.defaultUploadLocationSubpath','null'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.localizeRelations','false'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.maxRelations','null'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.minRelations','null'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.previewMode','\"full\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.restrictedDefaultUploadSubpath','null'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.restrictedLocationSource','\"volume:70e6fcab-0d35-4b12-89a1-47822b74bd85\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.restrictedLocationSubpath','null'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.restrictFiles','true'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.restrictLocation','false'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.selectionLabel','null'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.showSiteMenu','false'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.showUnpermittedFiles','false'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.showUnpermittedVolumes','false'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.source','null'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.sources','\"*\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.targetSiteId','null'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.validateRelatedElements','false'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.settings.viewMode','\"list\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.translationKeyFormat','null'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.translationMethod','\"site\"'),('fields.c32a631a-0aee-45aa-a428-01aaa1231be6.type','\"craft\\\\fields\\\\Assets\"'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.columnSuffix','null'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.contentColumnType','\"string\"'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.fieldGroup','\"ae727592-cdcb-464b-824c-a2aefc697ada\"'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.handle','\"cards\"'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.instructions','null'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.name','\"cards\"'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.searchable','false'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.settings.contentTable','\"{{%matrixcontent_cards}}\"'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.settings.maxBlocks','null'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.settings.minBlocks','null'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.settings.propagationKeyFormat','null'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.settings.propagationMethod','\"all\"'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.translationKeyFormat','null'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.translationMethod','\"site\"'),('fields.cb874278-0da4-4d05-906b-675ebd60a53b.type','\"craft\\\\fields\\\\Matrix\"'),('fs.base.hasUrls','true'),('fs.base.name','\"Base\"'),('fs.base.settings.path','\"@webroot/assets/base\"'),('fs.base.type','\"craft\\\\fs\\\\Local\"'),('fs.base.url','\"@web/assets/base\"'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.elementCondition','null'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.elements.0.elementCondition','null'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.elements.0.fieldUid','\"6898c965-368f-4e26-a4a4-8054b918a827\"'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.elements.0.instructions','null'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.elements.0.label','null'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.elements.0.required','false'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.elements.0.tip','null'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.elements.0.uid','\"0a6c52a5-c3a1-4a72-9272-4154e5874f16\"'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.elements.0.userCondition','null'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.elements.0.warning','null'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.elements.0.width','100'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.name','\"Images\"'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.uid','\"c48a47f5-7194-495a-af55-39d21e2e5b09\"'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.fieldLayouts.e51ca82b-101b-4ea6-ad55-f289bff6df4b.tabs.0.userCondition','null'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.handle','\"branding\"'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.name','\"Branding\"'),('globalSets.f971d1f8-9a89-4080-84ad-31ae80b8bea9.sortOrder','1'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.field','\"cb874278-0da4-4d05-906b-675ebd60a53b\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.elementCondition','null'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.elements.0.fieldUid','\"45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.elements.0.label','null'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.elements.0.required','false'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.elements.0.tip','null'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.elements.0.uid','\"66a0b977-b659-493b-a872-39d92cf4f45d\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.elements.0.warning','null'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.elements.0.width','100'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.name','\"Content\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.uid','\"e6d0d193-12d9-42d0-b927-d0d734099cdb\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fieldLayouts.4d86fcfa-d683-477e-baa3-e5634f718986.tabs.0.userCondition','null'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.columnSuffix','\"xrtsojkt\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.contentColumnType','\"text\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.fieldGroup','null'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.handle','\"redactor\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.instructions','null'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.name','\"redactor\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.searchable','false'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.availableTransforms','\"*\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.availableVolumes','\"*\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.columnType','\"text\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.defaultTransform','\"\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.manualConfig','\"\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.purifierConfig','null'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.purifyHtml','true'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.redactorConfig','null'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.removeEmptyTags','false'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.removeInlineStyles','false'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.removeNbsp','false'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.showHtmlButtonForNonAdmins','false'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.showUnpermittedFiles','false'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.settings.uiMode','\"enlarged\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.translationKeyFormat','null'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.translationMethod','\"none\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.fields.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.handle','\"card\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.name','\"card\"'),('matrixBlockTypes.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0.sortOrder','1'),('meta.__names__.00885ec1-1272-40f5-b824-069712416b50','\"Home\"'),('meta.__names__.0a9d780b-139b-4b2b-aace-e65b023e50a0','\"StageCraft\"'),('meta.__names__.3ba98823-b17d-4778-a3a2-65a46d6402b1','\"Blurb\"'),('meta.__names__.45d3dd5f-9a76-4ef1-bd92-34b4b7bc7b58','\"redactor\"'),('meta.__names__.473cd196-cf5c-4baa-a5ea-349a3bb0f6db','\"Home\"'),('meta.__names__.6898c965-368f-4e26-a4a4-8054b918a827','\"Logo\"'),('meta.__names__.6973ba16-7b59-4d9d-a25d-b356f9073a6c','\"All Courses\"'),('meta.__names__.7003e51a-380b-45ff-b5c7-8170a7148cc5','\"StageCraft\"'),('meta.__names__.70e6fcab-0d35-4b12-89a1-47822b74bd85','\"Base\"'),('meta.__names__.74f6c850-cba2-46b8-b972-12b405727dbb','\"Redactor\"'),('meta.__names__.755298d6-91c9-4de3-b4ed-1be63429983f','\"Order Index\"'),('meta.__names__.7c94ef32-b523-4f2c-9b33-6a6a88e9071b','\"Tagline\"'),('meta.__names__.7e4af13a-297b-44c7-9e6a-e48fb5e523e7','\"Lesson\"'),('meta.__names__.7fc1bae6-7ccc-49ab-b70e-7f5a8f3796d0','\"card\"'),('meta.__names__.8ae80f80-dda0-415e-821f-08ddc32f2525','\"Course Tags\"'),('meta.__names__.957247f2-372a-46e5-8e07-811eec1bedd7','\"Course\"'),('meta.__names__.98e751bd-c025-43ee-9615-2ee39bbcbc9b','\"Common\"'),('meta.__names__.9b41905c-1194-4d27-8f5f-afb4ccfb6a18','\"Courses Structure\"'),('meta.__names__.a21c3685-7a35-4b65-95f8-6fbfe911725b','\"Public Schema\"'),('meta.__names__.ae727592-cdcb-464b-824c-a2aefc697ada','\"Homepage\"'),('meta.__names__.b21277df-0868-459b-aa4f-825ec466acec','\"Lesson\"'),('meta.__names__.c32a631a-0aee-45aa-a428-01aaa1231be6','\"Hero Image\"'),('meta.__names__.cb874278-0da4-4d05-906b-675ebd60a53b','\"cards\"'),('meta.__names__.e59edfaf-8bac-4742-bfae-b8f0419e4955','\"All Courses\"'),('meta.__names__.f971d1f8-9a89-4080-84ad-31ae80b8bea9','\"Branding\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('sections.00885ec1-1272-40f5-b824-069712416b50.defaultPlacement','\"end\"'),('sections.00885ec1-1272-40f5-b824-069712416b50.enableVersioning','true'),('sections.00885ec1-1272-40f5-b824-069712416b50.handle','\"home\"'),('sections.00885ec1-1272-40f5-b824-069712416b50.name','\"Home\"'),('sections.00885ec1-1272-40f5-b824-069712416b50.propagationMethod','\"all\"'),('sections.00885ec1-1272-40f5-b824-069712416b50.siteSettings.7003e51a-380b-45ff-b5c7-8170a7148cc5.enabledByDefault','true'),('sections.00885ec1-1272-40f5-b824-069712416b50.siteSettings.7003e51a-380b-45ff-b5c7-8170a7148cc5.hasUrls','true'),('sections.00885ec1-1272-40f5-b824-069712416b50.siteSettings.7003e51a-380b-45ff-b5c7-8170a7148cc5.template','\"index.twig\"'),('sections.00885ec1-1272-40f5-b824-069712416b50.siteSettings.7003e51a-380b-45ff-b5c7-8170a7148cc5.uriFormat','\"__home__\"'),('sections.00885ec1-1272-40f5-b824-069712416b50.type','\"single\"'),('sections.9b41905c-1194-4d27-8f5f-afb4ccfb6a18.defaultPlacement','\"end\"'),('sections.9b41905c-1194-4d27-8f5f-afb4ccfb6a18.enableVersioning','true'),('sections.9b41905c-1194-4d27-8f5f-afb4ccfb6a18.handle','\"coursesStructure\"'),('sections.9b41905c-1194-4d27-8f5f-afb4ccfb6a18.name','\"Courses Structure\"'),('sections.9b41905c-1194-4d27-8f5f-afb4ccfb6a18.propagationMethod','\"all\"'),('sections.9b41905c-1194-4d27-8f5f-afb4ccfb6a18.siteSettings.7003e51a-380b-45ff-b5c7-8170a7148cc5.enabledByDefault','true'),('sections.9b41905c-1194-4d27-8f5f-afb4ccfb6a18.siteSettings.7003e51a-380b-45ff-b5c7-8170a7148cc5.hasUrls','true'),('sections.9b41905c-1194-4d27-8f5f-afb4ccfb6a18.siteSettings.7003e51a-380b-45ff-b5c7-8170a7148cc5.template','\"lesson.twig\"'),('sections.9b41905c-1194-4d27-8f5f-afb4ccfb6a18.siteSettings.7003e51a-380b-45ff-b5c7-8170a7148cc5.uriFormat','\"courses/{slug}\"'),('sections.9b41905c-1194-4d27-8f5f-afb4ccfb6a18.structure.maxLevels','null'),('sections.9b41905c-1194-4d27-8f5f-afb4ccfb6a18.structure.uid','\"17062b14-8a61-4f6d-9da8-04735720a568\"'),('sections.9b41905c-1194-4d27-8f5f-afb4ccfb6a18.type','\"structure\"'),('sections.e59edfaf-8bac-4742-bfae-b8f0419e4955.defaultPlacement','\"end\"'),('sections.e59edfaf-8bac-4742-bfae-b8f0419e4955.enableVersioning','true'),('sections.e59edfaf-8bac-4742-bfae-b8f0419e4955.handle','\"allCourses\"'),('sections.e59edfaf-8bac-4742-bfae-b8f0419e4955.name','\"All Courses\"'),('sections.e59edfaf-8bac-4742-bfae-b8f0419e4955.propagationMethod','\"all\"'),('sections.e59edfaf-8bac-4742-bfae-b8f0419e4955.siteSettings.7003e51a-380b-45ff-b5c7-8170a7148cc5.enabledByDefault','true'),('sections.e59edfaf-8bac-4742-bfae-b8f0419e4955.siteSettings.7003e51a-380b-45ff-b5c7-8170a7148cc5.hasUrls','true'),('sections.e59edfaf-8bac-4742-bfae-b8f0419e4955.siteSettings.7003e51a-380b-45ff-b5c7-8170a7148cc5.template','\"allCourses.twig\"'),('sections.e59edfaf-8bac-4742-bfae-b8f0419e4955.siteSettings.7003e51a-380b-45ff-b5c7-8170a7148cc5.uriFormat','\"all-courses\"'),('sections.e59edfaf-8bac-4742-bfae-b8f0419e4955.type','\"single\"'),('siteGroups.0a9d780b-139b-4b2b-aace-e65b023e50a0.name','\"StageCraft\"'),('sites.7003e51a-380b-45ff-b5c7-8170a7148cc5.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.7003e51a-380b-45ff-b5c7-8170a7148cc5.enabled','true'),('sites.7003e51a-380b-45ff-b5c7-8170a7148cc5.handle','\"default\"'),('sites.7003e51a-380b-45ff-b5c7-8170a7148cc5.hasUrls','true'),('sites.7003e51a-380b-45ff-b5c7-8170a7148cc5.language','\"en\"'),('sites.7003e51a-380b-45ff-b5c7-8170a7148cc5.name','\"StageCraft\"'),('sites.7003e51a-380b-45ff-b5c7-8170a7148cc5.primary','true'),('sites.7003e51a-380b-45ff-b5c7-8170a7148cc5.siteGroup','\"0a9d780b-139b-4b2b-aace-e65b023e50a0\"'),('sites.7003e51a-380b-45ff-b5c7-8170a7148cc5.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"tech theatre.nz\"'),('system.retryDuration','null'),('system.schemaVersion','\"4.0.0.9\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elementCondition','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.autocapitalize','true'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.autocomplete','false'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.autocorrect','true'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.class','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.disabled','false'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.elementCondition','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.id','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.instructions','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.label','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.max','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.min','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.name','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.orientation','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.placeholder','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.readonly','false'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.requirable','false'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.size','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.step','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.tip','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.title','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.uid','\"d9700913-d0fd-4900-bdf1-cf97f93e970e\"'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.userCondition','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.warning','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.elements.0.width','100'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.name','\"Content\"'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.uid','\"e36e9de4-af4d-4c58-ab1e-355ca58c7816\"'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fieldLayouts.844dd100-ff9f-4bad-94bd-7673f6d6c96f.tabs.0.userCondition','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.fs','\"base\"'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.handle','\"base\"'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.name','\"Base\"'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.sortOrder','1'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.titleTranslationKeyFormat','null'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.titleTranslationMethod','\"site\"'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.transformFs','\"\"'),('volumes.70e6fcab-0d35-4b12-89a1-47822b74bd85.transformSubpath','\"/transform\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (3,6,56,NULL,54,1,'2022-08-25 02:30:26','2022-08-25 02:30:26','dfb50e68-c823-49f4-902c-d9015e0bc25f'),(5,6,58,NULL,54,1,'2022-08-25 02:30:47','2022-08-25 02:30:47','0fbff030-0643-4fa3-8c45-18abc4e1c5bf'),(6,6,59,NULL,54,1,'2022-08-25 02:37:03','2022-08-25 02:37:03','a01cf907-c733-43d8-8cf8-7166277e8a11'),(8,6,73,NULL,54,1,'2022-08-25 02:38:05','2022-08-25 02:38:05','14521d68-8211-410e-9787-29eb55cc55f3'),(10,6,77,NULL,54,1,'2022-08-25 02:46:14','2022-08-25 02:46:14','f789bdb6-7486-41f7-8d26-bc67c7de088c'),(12,6,81,NULL,54,1,'2022-08-25 02:52:40','2022-08-25 02:52:40','c83112b9-b004-4d1c-8592-325f74baa5ec'),(14,6,85,NULL,54,1,'2022-08-25 02:53:04','2022-08-25 02:53:04','76e2b2fb-63da-4c2d-8b91-c2204e243678'),(15,6,88,NULL,54,1,'2022-08-25 02:56:04','2022-08-25 02:56:04','19e64158-027c-4ed2-9835-17183b2e6049'),(17,6,2,NULL,91,1,'2022-08-25 03:03:55','2022-08-25 03:03:55','601d9a98-a559-4c4c-8a39-82cae1d294f5'),(18,6,93,NULL,91,1,'2022-08-25 03:03:55','2022-08-25 03:03:55','a18277e0-76c9-4013-87f5-89e494b855db'),(20,10,96,NULL,98,1,'2022-08-25 04:06:52','2022-08-25 04:06:52','b4a5fb42-8a79-4b4a-94cc-3dd7cef80b40');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,NULL),(4,6,1,1,''),(5,8,1,1,''),(6,2,1,4,NULL),(7,2,1,5,NULL),(8,8,1,2,'Applied “Draft 1”'),(9,14,1,1,NULL),(10,14,1,2,NULL),(11,17,1,1,''),(12,17,1,2,'Applied “Draft 1”'),(13,21,1,1,''),(14,21,1,2,'Applied “Draft 1”'),(15,25,1,1,''),(16,27,1,1,''),(17,29,1,1,''),(18,31,1,1,''),(19,33,1,1,''),(20,14,1,3,NULL),(21,14,1,4,NULL),(22,14,1,5,NULL),(23,31,1,2,'Applied “Draft 1”'),(24,29,1,2,'Applied “Draft 1”'),(25,31,1,3,'Applied “Draft 1”'),(26,29,1,3,'Applied “Draft 1”'),(27,29,1,4,'Applied “Draft 1”'),(28,29,1,5,'Applied “Draft 1”'),(29,29,1,6,'Applied “Draft 1”'),(30,2,1,6,NULL),(31,2,1,7,NULL),(32,2,1,8,'Applied “Draft 1”'),(33,2,1,9,'Applied “Draft 1”'),(34,2,1,10,NULL),(35,2,1,11,'Applied “Draft 1”'),(36,71,1,1,NULL),(37,72,1,1,NULL),(38,2,1,12,'Applied “Draft 1”'),(39,71,1,2,NULL),(40,72,1,2,NULL),(41,2,1,13,'Applied “Draft 1”'),(42,71,1,3,NULL),(43,72,1,3,NULL),(44,2,1,14,'Applied “Draft 1”'),(45,71,1,4,NULL),(46,72,1,4,NULL),(47,2,1,15,''),(48,71,1,5,NULL),(49,72,1,5,NULL),(50,2,1,16,'Applied “Draft 1”'),(51,71,1,6,NULL),(52,72,1,6,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' emailnzjoe gmail com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' home '),(2,'title',0,1,' home '),(6,'slug',0,1,' lighting basics '),(6,'title',0,1,' lighting basics '),(8,'slug',0,1,' intro lx basics '),(8,'title',0,1,' intro lx basics '),(14,'slug',0,1,' all courses '),(14,'title',0,1,' all courses '),(17,'slug',0,1,' lx basics intro '),(17,'title',0,1,' lx basics intro '),(21,'slug',0,1,' introduction '),(21,'title',0,1,' introduction '),(25,'slug',0,1,' what is a light '),(25,'title',0,1,' what is a light '),(27,'slug',0,1,' how to rig a light '),(27,'title',0,1,' how to rig a light '),(29,'slug',0,1,' lx basics '),(29,'title',0,1,' lx basics '),(31,'slug',0,1,' how cabling works '),(31,'title',0,1,' how cabling works '),(33,'slug',0,1,' how to rig a light '),(33,'title',0,1,' how to rig a light '),(54,'extension',0,1,' jpg '),(54,'filename',0,1,' pexels tima miroshnichenko 7991498 jpg '),(54,'kind',0,1,' image '),(54,'slug',0,1,''),(54,'title',0,1,' pexels tima miroshnichenko 7991498 '),(71,'slug',0,1,''),(72,'slug',0,1,''),(91,'extension',0,1,' jpg '),(91,'filename',0,1,' webheader jpg '),(91,'kind',0,1,' image '),(91,'slug',0,1,''),(91,'title',0,1,' homepage dude '),(96,'slug',0,1,''),(97,'extension',0,1,' svg '),(97,'filename',0,1,' stagecraft com svg '),(97,'kind',0,1,' image '),(97,'slug',0,1,''),(97,'title',0,1,' stagecraft com '),(98,'extension',0,1,' svg '),(98,'filename',0,1,' logo2 svg '),(98,'kind',0,1,' image '),(98,'slug',0,1,''),(98,'title',0,1,' logo2 ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,'all','end',NULL,'2022-08-21 04:10:07','2022-08-21 04:10:21',NULL,'00885ec1-1272-40f5-b824-069712416b50'),(2,1,'Courses','courses','structure',1,'all','end',NULL,'2022-08-21 04:10:57','2022-08-21 04:10:57','2022-08-21 09:51:51','760c17e8-b9f1-44a8-934c-82ba2d5e67dd'),(3,NULL,'Lessons','lessons','channel',1,'all','end',NULL,'2022-08-21 09:54:00','2022-08-21 09:59:55','2022-08-22 01:11:39','8551c7bd-273e-4f34-9466-34aa4f58bb85'),(4,NULL,'All Courses','allCourses','single',1,'all','end',NULL,'2022-08-21 09:55:24','2022-08-21 09:55:24',NULL,'e59edfaf-8bac-4742-bfae-b8f0419e4955'),(5,NULL,'LX Basics','lxBasics','channel',1,'all','end',NULL,'2022-08-22 01:11:54','2022-08-22 01:11:54','2022-08-22 06:19:02','698df3e4-75a1-4cc5-ab30-40996ee867c8'),(6,2,'Courses Structure','coursesStructure','structure',1,'all','end',NULL,'2022-08-22 06:19:53','2022-08-22 06:19:53',NULL,'9b41905c-1194-4d27-8f5f-afb4ccfb6a18');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','index.twig',1,'2022-08-21 04:10:07','2022-08-21 04:21:01','d7905c81-9e93-4da2-b50a-46d1af6a950d'),(2,2,1,1,'courses/{slug}','one_course/index.twig',1,'2022-08-21 04:10:57','2022-08-21 04:23:23','41f5f6b4-9605-432c-9a92-22cad04ea8bc'),(3,3,1,1,'lessons/{slug}','lesson.twig',1,'2022-08-21 09:54:00','2022-08-21 10:12:05','4e2472dd-106a-441c-90de-ee594b240bc5'),(4,4,1,1,'all-courses','allCourses.twig',1,'2022-08-21 09:55:24','2022-08-22 06:38:13','2a0808d7-aa19-477e-af2c-075149c97026'),(5,5,1,1,'lx-basics/{slug}','lesson.twig',1,'2022-08-22 01:11:54','2022-08-22 01:11:54','86db1519-deef-4159-a100-9de28d8ff5b9'),(6,6,1,1,'courses/{slug}','lesson.twig',1,'2022-08-22 06:19:53','2022-08-22 06:19:53','86bc88b7-1160-4098-9b23-f82efb56985e');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'StageCraft','2022-08-21 04:07:40','2022-08-21 04:07:40',NULL,'0a9d780b-139b-4b2b-aace-e65b023e50a0');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','StageCraft','default','en',1,'$PRIMARY_SITE_URL',1,'2022-08-21 04:07:40','2022-08-21 04:07:40',NULL,'7003e51a-380b-45ff-b5c7-8170a7148cc5');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,2,0,'2022-08-21 04:12:17','2022-08-21 09:51:41','76ccc792-7568-4039-9455-96b9a725ca38'),(4,2,NULL,4,1,8,0,'2022-08-22 06:20:13','2022-08-22 10:17:51','b4019e49-ca56-49e9-b99e-9ec1def99101'),(5,2,29,4,2,7,1,'2022-08-22 06:20:13','2022-08-22 10:17:51','ff44e97e-f26f-4ce0-874e-7bf337655799'),(6,2,31,4,3,4,2,'2022-08-22 06:20:23','2022-08-22 10:17:51','65b3af19-a4a3-49d5-8fcf-9090bf6d5468'),(7,2,33,4,5,6,2,'2022-08-22 06:20:41','2022-08-22 10:17:51','98305b26-2d70-471b-843a-8c471267a7a4');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,NULL,'2022-08-21 04:10:57','2022-08-21 04:10:57','2022-08-21 09:51:51','8e5d7dde-97ef-4fcd-9f58-0f7e63c6efee'),(2,NULL,'2022-08-22 06:19:53','2022-08-22 06:19:53',NULL,'17062b14-8a61-4f6d-9da8-04735720a568');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"notificationDuration\":\"5000\",\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'Admin','',NULL,NULL,'emailnzjoe@gmail.com','$2y$13$dBP/H4ylq5T2eszyvlZmrOQxHBn6aHeT7c2OC.xSuhNfQF6bBreWi','2022-08-25 23:44:46',NULL,NULL,NULL,'2022-08-25 23:44:29',NULL,1,NULL,NULL,NULL,0,'2022-08-25 23:44:34','2022-08-21 04:07:41','2022-08-25 23:44:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,NULL,'Temporary filesystem',NULL,'2022-08-21 10:49:47','2022-08-21 10:49:47','ff52f005-ea67-42cc-8fb1-ba57a242f95d'),(2,1,NULL,'user_1','user_1/','2022-08-21 10:49:47','2022-08-21 10:49:47','28814895-6964-4b3a-a792-eb01c47323e6'),(3,NULL,1,'Base','','2022-08-25 02:26:30','2022-08-25 02:26:30','c6843c3d-f6c8-436c-8129-1bc7b23ca159');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,9,'Base','base','base','','/transform','site',NULL,1,'2022-08-25 02:26:30','2022-08-25 02:26:30',NULL,'70e6fcab-0d35-4b12-89a1-47822b74bd85');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2022-08-21 04:07:43','2022-08-21 04:07:43','2a44f404-e7c7-4da3-846a-8a54fc724577'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2022-08-21 04:07:43','2022-08-21 04:07:43','e879abe4-6cc7-4cd2-9cb4-dfdda9d9c6c1'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2022-08-21 04:07:43','2022-08-21 04:07:43','18a08331-16bd-40aa-830c-133ce79ef4a0'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2022-08-21 04:07:43','2022-08-21 04:07:43','b10b21db-7183-4f1f-beff-fd6730973bb0');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'lamp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-25 23:45:00
