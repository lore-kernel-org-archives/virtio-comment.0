Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06253D2FF3
	for <virtio-comment@lists.linux.dev>; Tue,  3 Feb 2026 16:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135705; cv=fail; b=Yun9l6j1kzAGf9EqC4VuIvF2D3hhFiOvkk+K5vylpij68VDbURARKGyAU4BPwHNg14U9oBe+ZViElZ7TVn6RUh4x5Jt7WVZpIPDZiBGvdJeeQvNXNPL97ZWYQ/Z0pMTfL/qBKcfDWrBGX4kys0ZHHr43KY39BNfll8dupHbCevM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135705; c=relaxed/simple;
	bh=O19blhxWngMMrivpKD7qe4xITqC9hch6folE3Zey59s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ePyKQaDggOQinRDbuIyj3ahy9EtDC+VzsNlh0PgjQ5Sni2FeeNWDx7ofYLPMnkH22CeUjNQj0VVwyBxjnKqJuu3Yan+o4+jOPb3DOX85jdXq/7BKertcdUIf+yPMQweUYuzza3ivxpjk22QLh5Q1QHXRFmCIFx8A2CiSBYDnEnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=b0NELMy/; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="b0NELMy/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmWBVnzLMheZAEbQU0wl2g/wmUg7LpFu2ZKGZjaXWzcVomzKUxiFPqGbonW8IWFKMbql2IPt58X9mBcU2mWWtlDd94YZs/nEG0GXe55pFBVH0e0JK3fS5Pz7z5wfyRy7SVMuu5Q8vVIuN5XR1D3sXADny2GFe6dosIdZ0+LD5HeE3R3tOtPlhqWKaxBf2UZm+aDju/TdST36F4HvrhOm3Sl1UUBSTYwTW5pIuPuDNcyxpdDbxygjdwkVT7UUSd/VJaKtL8DQqBz++iGXTcedCkmvnVIOm8jH12i6H6PkFSRoU5pRy/3d/nVsiOzGCN4MAK2D9f7B9SNZpao+2aYF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyoOyajI5lQZ4T6nJRMMDGd2qTnJLL+ZvE284AIXWtQ=;
 b=AL/ZPDMhXIXGA2NqkvpkfciLkmtwTacxDOENew6lIc1iRu1FToMqztq9H79G9CHlunjd6DfgKof98WyS265i1zw+EL7S3JehYPtgtgZclfCduiTU5nSvHtCQkDDeGHm6tY0AyMHhlEf6rU2bbkIiDACxr40eaIUbVpaJ3PQuj/x1626GSqJ1bYpzKRgTp2/WkwR+BJV+pYCXSGiUaUZ/h4iw21efdcWk+OCp/KrtiR63JLc3ZNkbmRWHgUU6781ZIrGwEM1bRP0Xpvdvvpxa9aTXB+xVvw4MtkqKNWjODKgALRXP30DspB4498NxWuoQiyH3bKOLbJwC2ndne7fQnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.241) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyoOyajI5lQZ4T6nJRMMDGd2qTnJLL+ZvE284AIXWtQ=;
 b=b0NELMy/lmHgUiBJ4fuqyiOH3ukplbW7qRNsEeT4DCO/zL9ea4o2OfPYmNb2NK+SHXuhlzTePkITAnjkD2XMd04TAWV2SR+y6QH3wcBKKWwQkJxbqyQnv8HSQQVLAXAItzNUbW8bkbvnOZk2tmrx6z9+fdGH/KWNn317NQSRhumi+jo2+8YWzR5KpFTOtzbHo6yOiLh1XcMENXd2bPG3SXt5ayCR3smQkNbBOYq7+eDdpMLhzN8y4RaXc7vIH4drMJHe7GixgFpYqtI824zX83cj0uOlg+exc0iRKNu6hQ0hv7ZFQkayCOQy2k+F5aeE8lZ0DqpB1KppIRd89AY6NA==
Received: from DB9PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:10:1da::17)
 by AM7PR07MB6834.eurprd07.prod.outlook.com (2603:10a6:20b:1b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:21:39 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::68) by DB9PR05CA0012.outlook.office365.com
 (2603:10a6:10:1da::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 16:21:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.241)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.241 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.2.241;
 helo=fihe3nok0734.emea.nsn-net.net; pr=C
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.241) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Tue, 3 Feb 2026 16:21:39 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0734.emea.nsn-net.net (Postfix) with ESMTP id 20299201F6;
	Tue,  3 Feb 2026 18:21:38 +0200 (EET)
From: chia-yu.chang@nokia-bell-labs.com
To: parav@nvidia.com,
	virtio-comment@lists.linux.dev,
	jasowang@redhat.com,
	mst@redhat.com,
	cohuck@redhat.com,
	mvaralar@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	ij@kernel.org,
	ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com,
	g.white@cablelabs.com,
	ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com,
	cheshire@apple.com,
	rs.ietf@gmx.at,
	Jason_Livingood@comcast.com,
	vidhi_goel@apple.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v11 0/2] Update ECN (RFC3168) and Add Accurate ECN (RFC9768) feature
Date: Tue,  3 Feb 2026 17:21:32 +0100
Message-Id: <20260203162134.2765-1-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F4:EE_|AM7PR07MB6834:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5ca773ee-ccee-4fd3-2fbb-08de63404f5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xe8wBAc64LEByj4ItvBP7w/mPrkx3PWxcgadL0NiYuaY3kL1U3PGQhAkQhwI?=
 =?us-ascii?Q?agz/JLmEMpQfG7NdjngvxUXHABbttvhHwP2V2sRsAkl7H+AJq0J2BzVKxxq3?=
 =?us-ascii?Q?23er3mQDTGoUJhCPX8P3FYrPrjk+W0qSiKOBpVagSrOKOu3sz/vSOyljg8QE?=
 =?us-ascii?Q?J8kCK0DPox/aNEoNyjHT/WfWsKUC9GHPK6uIpdTt63YVebfSdvfAQDvufBYF?=
 =?us-ascii?Q?uWP2iG8CTeBQhNnQhVHfF3Tlo5U1Bphrot8MGw5+pTB0OX55BGgbQRwAvT89?=
 =?us-ascii?Q?QuVmOjKEfH4sushmP9MrwwfkygMRTuLIJpF/u0aph7hx6yOJa3ZuTttIZ9eq?=
 =?us-ascii?Q?vboxZ93njKjyIycSrMnDJQfYh1zrXiymnQF+hL+Wn8tFKtFVrxS92vWQkZxD?=
 =?us-ascii?Q?wPUjXuH1AgOYMpHliXqN2Jd+YuZqxPMd1oeV/54zgfUY0OI6KRDEGZhn6ziM?=
 =?us-ascii?Q?/8DcBlsc91TVR3b9G5h90YPwncaRfONPWGs+ukXWHMRZboTf1HL6DwzebZqK?=
 =?us-ascii?Q?I9rCDO1WiyvAGauvUtdSOa1SCM5uS1urJCrSv70r+cT7oebbcCQ5q8gx9SjC?=
 =?us-ascii?Q?szQ54EvsDD2JiqrFUQzxaRnz9zDvhfCXP8Avl0fcVe6usigZdDkZ6aXIpnsZ?=
 =?us-ascii?Q?NLhP8tTDVLxUp7Tzv3mi6n4ThWFzbxfE/mhmzdaejFL7iWH9ogFh5nVv9IgO?=
 =?us-ascii?Q?ctnYiYgXVza46sm7GkkrqPaJ58l68c6lJTct4Ut1o1MdudIQRdrlom8lT5Lu?=
 =?us-ascii?Q?sGpnK0ULhH+r2qhLAsl+QFK8l3nTmUEZHb0If4DumSKyVGE7pNM97SqD7Iwp?=
 =?us-ascii?Q?0Zdx5LVcu5M3JVSYGJnFOpFuhH6UlSML5Wipu7+u5Gbo9CJyuTQZ3bb3OQzD?=
 =?us-ascii?Q?Lt2xeAHMM2m9Kyg0UrLyJTwliLh1OzHuP0PtVM6fhUOqAeLbrcqQSfFfnnM4?=
 =?us-ascii?Q?F/Ch9zLIqvEZGgrXgE8Swp5WGso6gHDQuGmmI+oJ2mTaCes2NCKH9Cd1/Trl?=
 =?us-ascii?Q?naeCbMFe921FveiX/wR4rRn3R5uT/u0uJ+tyvuu2RL2i0lvYGE6RTHR1iG9u?=
 =?us-ascii?Q?Ni3RzvPb1wljYFLeDV/0+TIcmS9z7b4MVztFEbNMvZfos01H3U/KTRdG5DR9?=
 =?us-ascii?Q?rUnbggLvCpkO/9D8uqW9MEdAad1+jEg1N+uFhQV9HUOHUSVm3Hqxb1702RZ1?=
 =?us-ascii?Q?VBp4idP3DxvQtTbveiinIYmnQCkBuAWdrmCJoTWnGzw+esV9zXPrpfmt1V+W?=
 =?us-ascii?Q?moYB+InuO1qwXqIBe4/ue7xHSZPQACQjpm/JQD0xF9dN099JmsMnwaA5xstx?=
 =?us-ascii?Q?YrYZebXh33sAj3XSIuYuo3TcM4JoC+qlu0anCW+5xBpdsZTofq6wvX6oNCM8?=
 =?us-ascii?Q?gRJY7W/W+/970Id22gFGq7A4xq6GoKM3JoXt/U7Lz6UMrax+GOZBxs9Qbo9Q?=
 =?us-ascii?Q?/HtfdVagenSkKXIiCkxJ+l3kQKr5uGTqOO/7j6K7R93GyxDbkOTVHlkWKEYE?=
 =?us-ascii?Q?aRes9IrF2hnypvSqLTp5u3VlxRik+eQhTc+WtoXjE5PRAkLw+dttmiqpj19D?=
 =?us-ascii?Q?Qqm1+hGMk6o2Y/CKFpgeEfBQP3LVPn0dB6HuFKc0B7wliHVehvPd9+0deVPq?=
 =?us-ascii?Q?5T8UJsdGx+yNYHhkGB1dny3wboCegcbg6Ux2ayPSa13/lbke/JgV4vDU84jD?=
 =?us-ascii?Q?Whz33OyHem/Gvj9HmDUZkUte740=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.2.241;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a+uJ87/tS2MOizB3Yf+WZMNvPjNFh9P2n3ARoYakSafM07ZVBdAUNCAF0D3m+BZqUlGtkvrLinXGIEpMUKlmJB6uhJAQYuXEFxFwPgAAZChBS0DQamjabyMHubFwbAECcmU9dmgoDIJFL5yzs+kln2U4ZAAQuInt69rYoF8ZNHh8vCyjqjgFJUJAuBF5zGvppfBJzenBl+96Vb+NiAf0SzHxuXiuk+sG6eOKTijg+9wUY65R8vGkNdmokzW/yMy1svFzrdZlHXqNzJJWFj4KOCIDnMapsyPSX7aNdiXSq3MDnB7rBRj7i8uCzantd1fcazu6O1KNJH6Au7WtrIkBol/zwY7nOVHllpTIhtCcmxpsltuKYFcTmXTTAn834uIIpcXU3futZchiem8xcsUJFSKyiOtjLaHFln9Pi5KnbFOBv64EMEEmN51g5/K20FUx
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:21:39.2763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca773ee-ccee-4fd3-2fbb-08de63404f5e
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.241];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6834

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Hello,

Please find ECN and AccECN patch v11, which aligns the specficiation with RFC3168
ECN requirements with and adds Accurate ECN feature of RFC9768.

Best Regards,
Chia-Yu

---
v11 (230Feb-2026)
- Update commit message

v10 (14-Aug-2025)
- Update AccECN reference and it will become RFC9768.

v9 (19-May-2025)
- Update descriptions for VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_HOST_ECN, VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_HOST_ACCECN (Michael S. Tsirkin <mst@redhat.com>)
- Add reference sections of RFC3168 ECN and AccECN (Michael S. Tsirkin <mst@redhat.com>)

v8 (17-Apr-2025)
- Further typo fixing

v7 (15-Apr-2025)
- Fix typos in AccECN patch (Michael S. Tsirkin <mst@redhat.com>)

v6 (14-Apr-2025)
- Shrink descriptions and make more reference to RFC3168 ECN and AccECN

v5 (06-Mar-2025)
- Update feature bits of VIRTIO_NET_F_HOST_ACCECN(69) and VIRTIO_NET_F_GUEST_ACCECN(70)

v4 (05-Mar-2025)
- Update commit message of AccECN patch
- Add reference to RFC3168 ECN and Accurate ECN
- Simplify feature bit descriptinos to avoid duplication of text

v3 (21-Feb-2025)
- Separate the original patch into 2 different patches
- Fix several reabase issues in v2

v2 (17-Feb-2025)
- Rebase the patch on top of v1.4 virtio-spec

---
Chia-Yu Chang (2):
  virtio-net: Clarify ECN and GSO_ECN descriptions
  virtio-net: Add Accurate ECN support to virtio specification

 device-types/net/description.tex | 83 +++++++++++++++++++++++---------
 introduction.tex                 |  6 +++
 2 files changed, 65 insertions(+), 24 deletions(-)

-- 
2.34.1

