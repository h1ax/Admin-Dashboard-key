-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th5 19, 2024 lúc 09:13 PM
-- Phiên bản máy phục vụ: 10.5.23-MariaDB-cll-lve
-- Phiên bản PHP: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `th1axsite_core_panel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isAdmin` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `isAdmin`) VALUES
(1, '83168e6cb289d732cc78427b51f93153', '83168e6cb289d732cc78427b51f93153', 1),
(7, 'a74ad8dfacd4f985eb3977517615ce25', 'a74ad8dfacd4f985eb3977517615ce25', 0),
(8, '61f489f942527c776f81d2c2004c2d87', '202cb962ac59075b964b07152d234b70', 0),
(9, 'fcc57f86c4affb85abae0c3bc7582820', '202cb962ac59075b964b07152d234b70', 0),
(10, '007be3acd5669d100711b13d79e23369', 'a12913f454ff60fc810610776f554bc7', 0),
(11, '650d5ec38ac4d21d37f98e97e3610de9', '87ef067531ad5e77c15a8709c37953ef', 0),
(12, '779f1ada394f9185cef93a0af9506dbb', '202cb962ac59075b964b07152d234b70', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `all_keys`
--

CREATE TABLE `all_keys` (
  `id` int(11) NOT NULL,
  `admin` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `len` int(11) NOT NULL,
  `udid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `all_keys`
--

INSERT INTO `all_keys` (`id`, `admin`, `key`, `startDate`, `endDate`, `len`, `udid`) VALUES
(95, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_X7ZJsyTTr9GAMC2', '2024-05-17 19:59:09', '2024-05-17 21:59:09', 2, 'f22cb70294da2eed'),
(96, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_6gzAp5LkjMkAOid', NULL, NULL, 2, NULL),
(97, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_pgBJSd41DGiq8GA', NULL, NULL, 2, NULL),
(98, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_HM2anxKso6MHtgN', NULL, NULL, 2, NULL),
(99, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_ox2iwzyL8sduDQ3', NULL, NULL, 2, NULL),
(100, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_bxjxPWQ9w6fTaeS', NULL, NULL, 2, NULL),
(101, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_Mn8rSSK9EpnPVtf', NULL, NULL, 2, NULL),
(102, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_bvIKmR2AZiJ0ZCH', NULL, NULL, 2, NULL),
(103, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_rqGZiNOVfjrctvg', NULL, NULL, 2, NULL),
(104, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_1rXAhCnQU2D6VFi', NULL, NULL, 2, NULL),
(105, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_X3CDcly2XhEneSE', NULL, NULL, 2, NULL),
(106, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_FtGjwsZC20m3uUS', NULL, NULL, 2, NULL),
(107, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_Z4IQZXI2AEVAI0B', NULL, NULL, 2, NULL),
(108, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_3XoM0dLYbCzbDvj', NULL, NULL, 2, NULL),
(109, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_AoPK0TjOeTDsPeT', NULL, NULL, 2, NULL),
(110, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_ldy0OYLtKtHgH7s', NULL, NULL, 2, NULL),
(111, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_yKbE1dA2cjrnjUF', NULL, NULL, 2, NULL),
(112, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_0U835ZJC46NogKj', NULL, NULL, 2, NULL),
(113, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_IP2pcVlMJMJ3rEf', NULL, NULL, 2, NULL),
(114, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_vG6CZn5yzTgSo1q', NULL, NULL, 2, NULL),
(115, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_2yBdsxGvGKCnTXS', NULL, NULL, 2, NULL),
(116, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_vSeJczftWFlML8c', NULL, NULL, 2, NULL),
(117, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_Jifv8AwFcusUwvU', NULL, NULL, 2, NULL),
(118, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_cHBcgew5Fqrby9p', NULL, NULL, 2, NULL),
(119, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_Q6MwQV8dCObV5sD', NULL, NULL, 2, NULL),
(120, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_GdAczapZ3guWrIO', NULL, NULL, 2, NULL),
(121, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_EbtbkqSioYqTB8U', NULL, NULL, 2, NULL),
(122, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_NW3vXBmxYyzbmUE', '2024-05-17 19:34:52', '2024-05-17 21:34:52', 2, '2fc0490b55a25115'),
(123, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_ilDgVsvxFwvCtQ5', '2024-05-17 14:23:15', '2024-05-17 16:23:15', 2, '2fc0490b55a25115'),
(124, 'a74ad8dfacd4f985eb3977517615ce25', 'core_2H_J6UUfExhqWTAadz', NULL, NULL, 2, NULL),
(126, 'a74ad8dfacd4f985eb3977517615ce25', 'core_7D_QvPQoYzO6egRqAK', NULL, NULL, 168, NULL),
(127, 'a74ad8dfacd4f985eb3977517615ce25', 'core_30D_l1lPW8znQPbLxM7', '2024-05-18 11:51:24', '2024-06-17 11:51:24', 720, 'f22cb70294da2eed'),
(128, 'a74ad8dfacd4f985eb3977517615ce25', 'core_30D_1mb5RLJGn1rkcjs', NULL, NULL, 720, NULL),
(130, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_5X38ZM5MTtfGZzH', NULL, NULL, 24, NULL),
(131, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_kgFi743tjii652n', NULL, NULL, 24, NULL),
(132, '007be3acd5669d100711b13d79e23369', 'Sniper_7D_Q7dtKu1QpvOzeBO', '2024-05-17 21:52:54', '2024-05-24 21:52:54', 168, '46f36cc6b745c41f'),
(133, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_mEZSMh1VVFjuFP2', NULL, NULL, 24, NULL),
(134, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_Dn6SkFpuQvttyaa', NULL, NULL, 24, NULL),
(135, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_IrLNJfHuvU0KWva', NULL, NULL, 24, NULL),
(136, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_23cM0XemDF4cVj7', NULL, NULL, 24, NULL),
(137, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_I8M7NHs8LhD8foW', NULL, NULL, 24, NULL),
(138, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_9LKZz5hxfaaNvvd', NULL, NULL, 24, NULL),
(139, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_4OP55m7LjvW6DPR', NULL, NULL, 24, NULL),
(140, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_xrUX7dJaI0dyB2h', NULL, NULL, 24, NULL),
(141, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_GundmZO4PZNksH2', NULL, NULL, 24, NULL),
(142, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_rqBh3fAgQmD0DRo', NULL, NULL, 24, NULL),
(143, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_vWTtQ21R0JU5DXb', NULL, NULL, 24, NULL),
(144, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_G6WrbbPYF4has0q', NULL, NULL, 24, NULL),
(145, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_Vb052juuJCbFsdn', NULL, NULL, 24, NULL),
(146, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_q4twMBYz1ehxkMc', NULL, NULL, 24, NULL),
(147, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_o5rLBE4LykGsM4N', NULL, NULL, 24, NULL),
(148, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_Um7XPV7sxWFOdi5', NULL, NULL, 24, NULL),
(149, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_zNCReotCdcjcBCf', NULL, NULL, 24, NULL),
(150, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_tcJWPRcoEwd7TYj', NULL, NULL, 24, NULL),
(151, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_DZrgHQew8qX9PHu', NULL, NULL, 24, NULL),
(152, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_WOkMjDxbTNMA4St', NULL, NULL, 24, NULL),
(153, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_Zpt0wAhB8hT0qJK', NULL, NULL, 24, NULL),
(154, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_gQaIrw9lFCjnH6N', '2024-05-18 09:19:33', '2024-05-19 09:19:33', 24, '2fc0490b55a25115'),
(155, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_qmlAhaxwrulPAqW', NULL, NULL, 24, NULL),
(156, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_d0q3sF9RnVMjzsU', NULL, NULL, 24, NULL),
(157, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_ZLiO16xrSwhwSqE', NULL, NULL, 24, NULL),
(158, 'a74ad8dfacd4f985eb3977517615ce25', 'core_30D_ARZgHdIyVflO6fE', '2024-05-18 11:55:21', '2024-06-17 11:55:21', 720, '2fc0490b55a25115'),
(159, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_r6NWniJXaxcPzkm', NULL, NULL, 24, NULL),
(160, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_IGnd6bTfa3wYLtd', NULL, NULL, 24, NULL),
(161, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_ndda0DrsJLMBua5', NULL, NULL, 24, NULL),
(162, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_RDVtopoddP4xhWE', '2024-05-18 15:59:07', '2024-05-19 15:59:07', 24, 'abdcfaf7afa863b5'),
(163, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_Shr9l3IBJbVKWrI', NULL, NULL, 24, NULL),
(164, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_j9Sgbs5hvvxYf4y', NULL, NULL, 24, NULL),
(165, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_PsPEMzLRGwqJUOk', NULL, NULL, 24, NULL),
(166, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_ko4PDQyhoRteRrd', NULL, NULL, 24, NULL),
(167, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_0jH26tJzm7IWBWY', NULL, NULL, 24, NULL),
(168, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_Brz1omnAbDo4zl8', NULL, NULL, 24, NULL),
(169, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_yEkyyXYYKz3vTLt', NULL, NULL, 24, NULL),
(170, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_hL9ltCIfHqZXyJL', NULL, NULL, 24, NULL),
(171, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_m1gulsM9mr78ACy', NULL, NULL, 24, NULL),
(172, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_bI5qIjHiJhXSmHf', NULL, NULL, 24, NULL),
(173, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_gZsRQb734r1vScd', NULL, NULL, 24, NULL),
(174, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_AvGxE0bbWqO4nxs', NULL, NULL, 24, NULL),
(175, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_hcjcUqznGmZv10H', NULL, NULL, 24, NULL),
(176, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_l46X83SRlHqxKFu', NULL, NULL, 24, NULL),
(177, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_OObavkR9um4cPDX', NULL, NULL, 24, NULL),
(178, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_KtoUZSYBkXmeJfY', NULL, NULL, 24, NULL),
(179, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_89GjxKzTxy0ydei', NULL, NULL, 24, NULL),
(180, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_DTkjWZBKShgK3Px', NULL, NULL, 24, NULL),
(181, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_fFTgvTYDfTiWIY8', NULL, NULL, 24, NULL),
(182, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_ewSdGKFTy8fTdOe', '2024-05-19 10:26:00', '2024-05-20 10:26:00', 24, 'f94de6a4f78377a9'),
(183, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_wyM984bhBa2FuLM', NULL, NULL, 24, NULL),
(184, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_IBK4B9zhT6aac0P', NULL, NULL, 24, NULL),
(185, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_OQffDnfRI8zJwBr', NULL, NULL, 24, NULL),
(186, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_1wvyrhoowcbz9w0', NULL, NULL, 24, NULL),
(187, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_rasQray4v7FGi6Y', NULL, NULL, 24, NULL),
(188, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_QOEzVXlHqnPLG9Q', NULL, NULL, 24, NULL),
(189, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_H7WAtdjD2a6LKAB', NULL, NULL, 24, NULL),
(190, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_WdPyDRR2lfbNVN1', NULL, NULL, 24, NULL),
(191, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_urprNlCVoYuKQvd', NULL, NULL, 24, NULL),
(192, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_hk9UE4yFG0nXZxm', NULL, NULL, 24, NULL),
(193, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_CvqWUeMJleEC4zi', NULL, NULL, 24, NULL),
(194, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_czcSYCnryq6F5ex', NULL, NULL, 24, NULL),
(195, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_yEcTn7zx2yaWODH', NULL, NULL, 24, NULL),
(196, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_mIRUIJKm2Iwgooa', NULL, NULL, 24, NULL),
(197, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_TilCPCCiShakObK', NULL, NULL, 24, NULL),
(198, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_XrXxIDHbDyDLwuj', NULL, NULL, 24, NULL),
(199, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_Lkv9jiluc43K46W', NULL, NULL, 24, NULL),
(200, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_y30mjzPLDDaayaA', NULL, NULL, 24, NULL),
(201, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_H9rQVoq3ltcGxCL', NULL, NULL, 24, NULL),
(202, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_80I4FXLO8mLkTyD', NULL, NULL, 24, NULL),
(203, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_LWUrHIibVbpSR8Z', '2024-05-18 16:21:52', '2024-05-19 16:21:52', 24, 'ec60ee613dc8fd'),
(204, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_ftYbMLdhIBbpvsm', NULL, NULL, 24, NULL),
(205, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_N8GaXNXWiQg5lms', '2024-05-18 19:49:29', '2024-05-19 19:49:29', 24, '498f48a7b140b61d'),
(206, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_V4o2mWcovmADiXz', '2024-05-18 17:15:37', '2024-05-19 17:15:37', 24, 'ad72b0fff25ce1e7'),
(207, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_ri6I9rFQFYLdOPX', '2024-05-19 00:39:56', '2024-05-20 00:39:56', 24, 'ec60ee613dc8fd'),
(208, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_8MbBY44JHRhoVI9', NULL, NULL, 24, NULL),
(209, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_PdOqIpLeBDc5h0X', NULL, NULL, 24, NULL),
(210, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_ZlLiMFYurQY7h0I', NULL, NULL, 24, NULL),
(211, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_LxeUbumMfgiUPlW', NULL, NULL, 24, NULL),
(212, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_oYc6tC89TZpK0kh', NULL, NULL, 24, NULL),
(213, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_YPwav3vcgWjbQE3', NULL, NULL, 24, NULL),
(214, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_PCbkw6dokVqeWfD', NULL, NULL, 24, NULL),
(215, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_1NbvzQuUxCHVUTI', NULL, NULL, 24, NULL),
(216, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_mxs9U00522cIGvJ', NULL, NULL, 24, NULL),
(217, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_jxRdRotUaST7GNL', NULL, NULL, 24, NULL),
(218, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_vx6mZUFM4Agi4uK', NULL, NULL, 24, NULL),
(525028, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_WxPBGoXcdJ3WsEu', NULL, NULL, 24, NULL),
(525029, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_RR24usXL7vtJjVB', NULL, NULL, 24, NULL),
(525030, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_b1lG4ZwCCyrrR9j', NULL, NULL, 24, NULL),
(525031, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_Vm4n2MZrn4g1ZCF', NULL, NULL, 24, NULL),
(525032, '61f489f942527c776f81d2c2004c2d87', 'CoreXYellow_1D_AbSiAWTqscNY4ji', NULL, NULL, 24, NULL),
(525033, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_hK1VBQlHjBVaPWX', NULL, NULL, 24, NULL),
(525034, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_Jfet12nJeqXTLit', NULL, NULL, 24, NULL),
(525035, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_dTUvWaJoefAquOH', NULL, NULL, 24, NULL),
(525036, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_ith4vc7LGZY1RxA', NULL, NULL, 24, NULL),
(525037, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_7t82lvocje5yr25', NULL, NULL, 24, NULL),
(525038, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_3GKzJYcLbIkHK2T', NULL, NULL, 24, NULL),
(525039, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_BDBpFIWcM1riYpP', NULL, NULL, 24, NULL),
(525040, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_cglEiLaMEKqZLEK', NULL, NULL, 24, NULL),
(525041, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_cjBUhSO7oFiplYF', NULL, NULL, 24, NULL),
(525042, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_beLMskkLtwI85fK', NULL, NULL, 24, NULL),
(525043, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_yXGbdbe2AMBOC7w', NULL, NULL, 24, NULL),
(525044, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_dqDCbrjYFSkqdfA', NULL, NULL, 24, NULL),
(525045, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_xfNoVIRcTJk8t9X', NULL, NULL, 24, NULL),
(525046, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_hJrjBcQrkAaIxTY', NULL, NULL, 24, NULL),
(525047, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_n75jAKCQOluWypS', NULL, NULL, 24, NULL),
(525048, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_W5ac4Wqtd7jnuGX', NULL, NULL, 24, NULL),
(525049, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_tUIRsfbRtJbn1SX', NULL, NULL, 24, NULL),
(525050, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_s10AHqKlNgCAKb9', NULL, NULL, 24, NULL),
(525051, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_ezbLt9p2uvmi1Ji', NULL, NULL, 24, NULL),
(525052, '007be3acd5669d100711b13d79e23369', 'Sniper_1D_J1G7q6xGJmnlzel', NULL, NULL, 24, NULL),
(525054, '779f1ada394f9185cef93a0af9506dbb', 'bew_2H_aOxagpniaZAhNOz', NULL, NULL, 2, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `all_keys`
--
ALTER TABLE `all_keys`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `all_keys`
--
ALTER TABLE `all_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=525055;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
