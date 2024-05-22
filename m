Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786677710E
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716399924; cv=fail; b=Qu6wLgPBpHGWx65Hy4GK9lcrwrDQ3QmVidNWjvlC3zRXkUeqjUqz3Fz8fx4CjzHEe8zgxxPUNNVfXk2G5HwUt/R29Q2zzuA7pWI7vVNZrqMUr+CD4QWc5oF5bKsp6kugAgOEG09EzED/XgarpDAx7+tXw3S1DCXs8mhKYru6dDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716399924; c=relaxed/simple;
	bh=04AXUWtuq0VVpu4L2k5me6IzriZzzQr+2+Of8oNem/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KrkmUm/M83ua64fsS48oEiHjJezOs9lwON8VIjShGCf11cGuElBGqDUWV2yT4a3WD95DDpf1o0qD0n5XoGzz0C6+8EmRiVAlne+99qW42JUzalKNx2quwDEzBd2mqb6qks7a0VWE13nzW7ZJWfUImPHfuq1o+bS6sBHcpsWkbt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=0rpeQ40v; arc=fail smtp.client-ip=18.185.115.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="0rpeQ40v"
Received: from 104.47.7.168_.trendmicro.com (unknown [172.21.191.80])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 00F3F10000D02;
	Wed, 22 May 2024 17:45:20 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1716399919.612000
X-TM-MAIL-UUID: fa51cd53-643f-40bb-9d63-6af2b2152572
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.168])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 959D51000031A;
	Wed, 22 May 2024 17:45:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gj20ZsJ/1FOZxmE5PUTT132wGHhMk5NOM2puFGtqOi13nkWDK3xiKkewHQVr49ZyR2P7SEfyPMS9NE5tStF6sUaEMLC9Lkhj/0idNa7U+BeGHn/9SGjmlgzAxoFbFeG1FR81qzaePqqro/RZDjfkieUrlg9FNP1HnEBixZyzI7Cz/YnBocP+IyHt3b6chuuIXDVYgayAEmN5Arwq/cF6WizMTfhmUaxb373BnCcdJdvDEJ4Q13x9iU2UHgEF6aV2NBNFbJsxFscvARdA71wcvAssPemLzqrtBq4y/9n3836xrv27MyIwlP61r4Y8dSBIamCnrRZPeDgzChb2MJ5PKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3oy0crXrnFxftaX3Iqzz1JUeNfyi/L6G0E2tec8jJ8=;
 b=gxvzuh5DFKVsTTmyWxribVvBPrH/DrJQdLoZLTwjZI9CgHDeih0avFqV4qJvhp3pPmdtqcc2NPf9jSY4QnRXG3KpKf3nS5VuPA0/h1CvxonfigAF/WzAl217Nazdxtu8nsyzVPqzK8BVvgLMKeoKiC1iPHgBWbw1l/XYg5loigWmszATod5yM13eqgdAMdk6/v3flcj94xM5JkEsI7EtlJjHcorRi0/zQOx5/+ZiKZwdm958lCOTCbTVpu70kIorcE5uagRLiQP/P9cbSgguISWto2+ORymBTihWaJ99TqHd7yO9+tNBpEE0vpRDwH/Hx4KKGZ1BhgMFr7XOhwaK7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 213.61.166.92) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=opensynergy.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensynergy.com; dkim=none (message not signed);
 arc=none (0)
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 213.61.166.92)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensynergy.com;
Received-SPF: Fail (protection.outlook.com: domain of opensynergy.com does not
 designate 213.61.166.92 as permitted sender) receiver=protection.outlook.com;
 client-ip=213.61.166.92; helo=SR-MAIL-03.open-synergy.com;
From: Peter Hilber <peter.hilber@opensynergy.com>
To: virtio-comment@lists.linux.dev
Cc: Parav Pandit <parav@nvidia.com>,
	Peter Hilber <peter.hilber@opensynergy.com>
Subject: [PATCH v2 0/2] admin: Fix requirements wording inconsistencies
Date: Wed, 22 May 2024 19:45:02 +0200
Message-ID: <20240522174505.57675-1-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A790:EE_|FR6P281MB4191:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9ed17b0c-67a1-4dbc-73a3-08dc7a86f1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|82310400017|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JhLsOqJJq7xEfZEY6CS80LUvu6EUNqI/P6ceHXUZgM1x0oa9QhIgNCUiwqIM?=
 =?us-ascii?Q?2BuzLkk8ygb3hOXMYann9sl5IGfZKSFP80I6XULz9wyttNrjPtPR99xcx3AH?=
 =?us-ascii?Q?//jjLEeJnUdRUBdJR5hghpnlxREM9TeohrUsIU7do6pxPeCcuc2A7tjqYkaZ?=
 =?us-ascii?Q?4p8xy7ytoXUfiwbIcLGse/qgMXordCKoGkuTgZNIbCWwXACXEIQQt8jSBEC5?=
 =?us-ascii?Q?v4EKO9VE/ZllITVLyJDZgcUJwP+o7jlq7gvh9vNCoGzq12L2Dbs6jrVClFtk?=
 =?us-ascii?Q?mcnJRGHGNETltss0E2t6CieyXeLP+ge3hDm9TcuMH7YaKetR4rWI8o+wUrl8?=
 =?us-ascii?Q?Bc2XELIHipVkkzS9LFPVaBKRmC1TvkThkZFjT+2M74LpQRAyum1Zh2+7ki9s?=
 =?us-ascii?Q?al08Ox5gRdcaKuW8lx9R10b5YvvvirjFwa2KNcK6wG2qz+QbI0P6Y5w8kDSx?=
 =?us-ascii?Q?o/2nI69AqkOrEW9dh4sO0iu6LtCGtENkZhQKO5dyVbIkZ00YQsixOuueb+lP?=
 =?us-ascii?Q?jxUMqwwfxZbv4eZoIsczEV1o1JG9v9/fXE+80wv0utuDhNdWOSJZ2Rbom6fq?=
 =?us-ascii?Q?AnMTLyrWVv2C2rhP8ERgLrzhRBE+InlpaTrtPNIS4oIPlIJLXvoICDE9J6WB?=
 =?us-ascii?Q?3Schg/YoTyUNVPUiLIA3P9dIAjER0a2geQ6a2CttuEiU32cxgk/pevkgKeQN?=
 =?us-ascii?Q?sSHO2t1mIPhhKs1q5kNKNxetIBUrYZm+ZOdJnG+/s4ypj2aRTDIfk5PAxa2A?=
 =?us-ascii?Q?xoRIuCDcLbFcrah4T662UgoqxnL1ZG0WZyPXhDK7QXWRuOP0aTs3XNYC0KOl?=
 =?us-ascii?Q?XczVvdg7gzE2VKnL72R4zOslEvGoHkT00v5SJ2m5ySzCDWgPe6BzsFqz7QlO?=
 =?us-ascii?Q?1kcs3J20QzCAmS2fHXxosAXgV/grKJn+fWqUlxl/4+agXMIeapnxB1TcAhOb?=
 =?us-ascii?Q?Pc7DCVsqX5XbX99ApgqCaPunJeEVACE/fWFcLpl6sOcYcUPspQkFGkXa8kun?=
 =?us-ascii?Q?nVos0YseYusGOvm8ZNhglbKRGyyjX7OeLujovqOAZqaPeLaGbCHOJ2rZbqC1?=
 =?us-ascii?Q?zF1C2YpF23MWUP4kSfFlZFxJGnxkCvai+weh6Bs4hIJ6iOZCU+GyEP22d7lZ?=
 =?us-ascii?Q?TwRJ+GnmFPpVHRJSDNQuLXC1d8HLJ6TrEdLNwfkxn/1P27zi8xnHApKeoZYv?=
 =?us-ascii?Q?LE/zIZc9Uv1PNLgd9YwBEK5B4Jc4iTuBFhxgJknlfHKQEClpRcqMeHwDfS1d?=
 =?us-ascii?Q?GuJZHXVfIBY+5kioG3ItScYPJ7TIHr3Mbtjtk8fmP7AsRziDZVKRTC4+LawD?=
 =?us-ascii?Q?Z3wGfLmKzmQVZzywoiLWxDhP29nTPscsDsdYkhaaf1eZrjVr1yl5EtPZ891x?=
 =?us-ascii?Q?i/R8R3Y=3D?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(376005)(82310400017)(36860700004)(1800799015);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:45:18.1564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed17b0c-67a1-4dbc-73a3-08dc7a86f1e3
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR6P281MB4191
X-TM-AS-ERS: 104.47.7.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28404.001
X-TMASE-Result: 10-3.202400-4.000000
X-TMASE-MatchedRID: MjQqGTIHxkvMuRev46IJiJtnlFv6A7oh7gd5SqHIhjLGhmdxjnivFj4z
	WkJArHvIKij8XYxyJTd47M8LMng65QJdikbdsraSsZIjJc0QK/YNcVqny2FrAfD4paoNCOyZhes
	1L7EqVuqxA7pVyH8J9nJJGWCs395hn0BIsZ4CCBPW3wsW3PHhSyFDAZexX0lKM6E3dEajW/U0zI
	7+eiZZ8EQnvb3s98Y9uX6LpmgAkTviNU9OSe5uNCQTINsH6RsntSZJjyMWX08=
X-TMASE-XGENCLOUD: da4561b7-98f4-990a-9534-2cf12f505d77-0-0-200-0
X-TM-Deliver-Signature: 9142AEB6CC39ABD62F61188A84CE5B97
X-TM-Addin-Auth: lDHeKpoKj8cu9ZQyhy9roLnR6NqVQ3xR+WssEHUv2Y+IGle94KVKWpslfMS
	hSR4QCgeBcG+ZczxxROBnEE25nooOeYsLFBJgBFUPGXV5v2x/ZPE8pvqUcQGJr5l6dfk4injABn
	DMfzkv0yg++sfSULsG0/3ICM2gCsf26viAVVBGPu08HVlwN16CnATYdVc73OdbyeNef3Eu3ArLl
	ZJ4oO2sEYbXlA5W3fG2QfzIi2ql46U60xJ95prOUi6xt7Kq6RVjIzpBTzbCMHhziAXHOBo34JWu
	CQlVMg+YRMsKyLQ=.LD1aSkuProoCyl3UsXHcAKTgN19q3xQD6csDDHMf4B73BnhNIzwdvCvgZ2
	d5mpMS9Iaxpux0aL/ykSZeiZTYkUxvbX88K7juUuZIsiFkN9bvg9JAy7xEn2MlJaa31gthdSKT7
	hb/bBPcasYOAzZ0jOxDMmbXjZRnj8EknBgtYbOoBxOQTEvRp+nIiTMka/kBuFETI+b99Idr7pkc
	0u28KiBYu6Qh/PBq5sVC/C9yKt+kUUpL23EW0WGd+6q3JkRhMHRWNW0gQvt63dVW0PX8M/rf1ue
	02iS15yQNPFudIpnueRqZrR6hrVBYFVjnrw7wRjMpU4yEmDEaU/h33l7Svg==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1716399919;
	bh=04AXUWtuq0VVpu4L2k5me6IzriZzzQr+2+Of8oNem/c=; l=532;
	h=From:To:Date;
	b=0rpeQ40vGk9qU4WH+eAEAeceWalNWU3wDwb+YdJaO43oB8uH1MhazUQo0MrJ40dAq
	 dfq1Ssi6d4x5rFQWb9jK0BvoP8tWplOjTciJbLJgg7YfrRa+acMY9UhSjAkwhxxqde
	 GTl5zLnTC+ag/tQM56DdsRdXuiBkccAVoWhKn1fjmfGgsO7oCmiR22pMSMmvENQhC6
	 4vDkhhdPUpmA+d3+Dq9M3sWgzv7fcevJd93DV38Kizdwz9v1Atoon2VZRiv/oJzvlX
	 mAG0x5qh6tUltyoGcoi0kdJDezVLv6fXdZzrKsJa/BCed9Uq1Ek3GpaHFU4nuTOvVJ
	 oq37GDd5JKHEg==

I stumbled over some inconsistencies in the administration virtqueue
requirements wording. These patches should fix them.

I think they could be considered editorial fixes.

v2:

- Be specific about case without order constraints (Parav Pandit).


Peter Hilber (2):
  admin: Refer to "no order constraints" only for different queues
  admin: Fix driver requirement subject

 admin.tex | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)


base-commit: 71fe8e907c9d20c53e8327bea99360cb3c529ade
-- 
2.43.0

