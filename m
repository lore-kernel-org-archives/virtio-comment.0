Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F8339526F
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 14:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.52
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031317; cv=fail; b=PJrJHz95hMW/5oHrdadr/1XOFpjMk2Cf+6N2Ypw1M4pUapglD35ySCRMghQR3s1yLAT8rGbARJwRk/aMJEVeYYb0rqAEnkGCobPZ5X/Gw/0Wskmf3WIVQPm4knJSlRshu/twdXQAccXk2ZPan/w3vphnLpSkHy5isekWtr30xdI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031317; c=relaxed/simple;
	bh=sQM9XYP828W1+tbHFC8cXYGHOig2tqHMcdpYMmtnBVc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Muy6p77zznhunIgDGPI0/E7JCcvgNcUtx0dkw3CDTkz0Whdmm2tXleihlxogKLssYolCNpr67yvGgKoEIbJtZgb86eSLzt26HEiDs2epA5PMcQ5SxpIhidF/lhISQQzNoHdBC+Pq9D4FFt08RaQD1KzwU7uNv+JMeYaWkUznWHs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VKXI87n0; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VKXI87n0; arc=fail smtp.client-ip=52.101.84.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VKXI87n0";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VKXI87n0"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sFVITR0stAGVeb/IqrFH2eFpKRDyIABfh2d1sGPYbT1fcxpy6nSzQ3A9Gz++Il7U6zk8yawozXv9uY2pUBRYMr4gKpYO1nKNVpwUS9i4vH2liv6obTWxBCWxCcoJb9PFxQq6PtC/YO6oEQdeRRnu0Z6CGhJTm+tYWNrWXbR4rs+hK13lT/W1CUq8lsxDveSqpkvKzhtPtrRQndWFir3Ls1FOFY5cBoA3ihB9kx2hApzIFhZ8qdOI4wuWy7iV+KW73p96giWWHrn9QKlUIbliS++qbhvpYpnWv/YADKWoA5hJ6Mkksi7essV68UxEbImGyvLEcgRnZKba94yTzCTv/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQM9XYP828W1+tbHFC8cXYGHOig2tqHMcdpYMmtnBVc=;
 b=HWKRShG8YDwgXhvxSEPiHh6U3iUirWz4WgFEMCLmcFwsID6CqUvSneYYjpzND9AYJcks+VnxwDPRhrgdvoI4V7G91J98Cslfvx4d7OsWte4MMD/125s6MHyKmFxl2Ccwuzs7KXhDd7qiIKGV1bjjGn8Vu46EoSqa46RYQ85jat0+kfF0CNWhIuKO30l/a1f5hcBPLudnLdC4V45jFspquFE4i3V0/8eAyEBA7QYK7TPzqY+Ww0QIFioGr94H6HmcX0PmNFTaprvfwkczgBnWtftY4m9odheDWlel9Tlzxoje5/5P8RVl7EpdAavVhmdOwn/7biUJK0XiCemroeyaqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQM9XYP828W1+tbHFC8cXYGHOig2tqHMcdpYMmtnBVc=;
 b=VKXI87n050ik4wZtT5wI6F53nHPyaWYlp1Mkf4YQNZtfVIk2AnneRZ7yjY3Afgtt0vneiBr1QENFIiEDg6kt0UugGBA9O7+5bqjGA6pVaMs3V/IitzxdSi+f2F4ywmy9/gIvDBXZr1sRjthNYNfwfwgJ6YnTG4OYIageenk3ETg=
Received: from DU2P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::13)
 by DU5PR08MB10610.eurprd08.prod.outlook.com (2603:10a6:10:51a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 14:55:05 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::d9) by DU2P251CA0003.outlook.office365.com
 (2603:10a6:10:230::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 14:54:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12 via
 Frontend Transport; Wed, 25 Feb 2026 14:55:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcSasdxL6OA8ZSqV9ucFR5gbkW/0NPqUN1Mo3CnLDYjtfnwzp0evzUqiY7uDr/y5qU01X1jegVD0L9EE/FWN66C2il9lYs8vgL5yNo/IgopDt7s9kyQnxCsMihsiyDgaoFpRg23gGwWeJSceTH7bgCCykg1+lapgv298S1v2Hc2PsgKkEtAOKsvuPgCM00E1U3g+6RR6v321qWfPH17qkpm9UB1AclN3JpjeBldqfMegi1xYAtHAnhxO39x4q6uq7+YYj9KzsAMoPWbATLg8OJxr6p2JUrK6WOxhkyPwskAcUckfWK77fOEDp6cNxSKgLRkHQeKRFMqvlerwa10Lww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQM9XYP828W1+tbHFC8cXYGHOig2tqHMcdpYMmtnBVc=;
 b=D5WCKqafBGs6nXROxn0hgOui6TjNhRUUE01p6Aqmht1VyZClstuGkoFSt1y9u84auUvX5fm7seXVksAlgrmPKCYN+z1M6Nh93fVW6GShYaRWMDwOJQy0LTd7shaIXxo/+ZOX2IxaEkGrNjp1/LTUnzZoRB67ayz5n3Dpmo7k5WCv4xfMTDxPmZWN4uznRuWLgM4jXIwGdIC7pxKPGb0/vyf20FmWT9G8NHAelLJbb2ERrjC5+wHmiY0rG4d5xQrK6HrxxCwTYuXSTmqp7KFk2wbqRDCwx6S0kNjg/W/6d3UP8NK43uGPsnFJovZk19ZqJkwddMUeJq80+oTEGrkNWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQM9XYP828W1+tbHFC8cXYGHOig2tqHMcdpYMmtnBVc=;
 b=VKXI87n050ik4wZtT5wI6F53nHPyaWYlp1Mkf4YQNZtfVIk2AnneRZ7yjY3Afgtt0vneiBr1QENFIiEDg6kt0UugGBA9O7+5bqjGA6pVaMs3V/IitzxdSi+f2F4ywmy9/gIvDBXZr1sRjthNYNfwfwgJ6YnTG4OYIageenk3ETg=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB9PR08MB8267.eurprd08.prod.outlook.com (2603:10a6:10:3c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 14:54:00 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 14:53:58 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Parav Pandit <parav@nvidia.com>, Manivannan Sadhasivam <mani@kernel.org>,
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAGnugIAALveAgAfGPgCAAAUZgIAAIl0AgAAFBQCAAAMOAIAARd+AgAABNQCAAAEXAA==
Date: Wed, 25 Feb 2026 14:53:58 +0000
Message-ID: <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
References:
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260225094902-mutt-send-email-mst@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB9PR08MB8267:EE_|DU6PEPF00009528:EE_|DU5PR08MB10610:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd2ac15-50b8-4cec-490a-08de747ddca8
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 417aXxzpv/vPiDuVOWOAvWdjkYWBoBjAgR2YV/9DMPquMFc34s0qv1ylynxUzHPwW7gCdIQwlwnGFgUotCB+mN0BaYShM4dWzM2Hrgh1nGpbfxifmAchfKfbjcK8B2F/XEE2iJLoADhcq5ZstTTyPWY77kEXjpT+X4fDXx2/As5aUXdI0vIhVNHHr8goiMfY8jDI9vO9jmuHsvYLpuP6PLifscfhsK4yLUMviZ+eJrB78p+ixxj20I31h/OTelezl4fO96pm6FkF1an5iGkJ1gApMV3MywGy1z9WLMjGN+fbXe3VSAaFTbnriNKL8irAfOcxGwfVB+6iwONkBqdukvOxKWsFspwBmBtL5Zrnx874BxRVyZgxOKPAmtCr1wQi9qoxHSFGYs7RbpALcWOJ6lwoROWNLZTn1gk+zhfUO5t9DWPP8w1dRxBdWpg0AUFh9W9V4A8zFc1iZCBsAwBYJ4Mx2A3RjWxoYw/w0y5YcB4zltnQcX8arPrX2zZnKPK7Xnf9NI+oTSj1/ZZn+WDogM95H7jTLtQVQdHTvhiU/PW4x8dStul/2vvzNX1t5hrUIZw6F2xZQi5OexRvTTpmvZhaqxkgCSUv5VHJUyk+4oCCV9O4kuaeZ1GFZK1S8FW3Ssj34aQDO7KEIkCGjPRnSsDmvhVwR4qpUe7OZzC8AbG7v9fwFQbsFGaoI/4jpFOEVDOAoJ+3f2Xg5VeCPcwqmYNdgWRAn4XfO0s/DAFFn7rzABDU3DnqhfXM3WC2VwxanH+5R5PO0TVzD9pFJxE2SODHnHAcl3htJSZbbwCszkc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CF3217EEE0BD0041B523149BC731955B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8267
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a18307c-ead4-4023-b78a-08de747db4be
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|35042699022|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	I7XqvPvAbQusQqygrntu/+8p1EyLBfNMZy4h02dddl7uocA2ZbF41Wm3eMw9kj2lsFoqNe+/2ryPR5685nQJRMZReXR7UuRx1FfcJTls/rcevt8b955oUpPUumD9+CeexVstjoYoIQGgLsJQfR7OKWtNnJhR3zddueEPeG+rDKyBD4JdT8QJVkBYDhvY36jeuaLex1S9Z/+ZXQy97gq7itITA4nlF3PruA3K0LeXp7/jcdQrJQXmEAoV5pYSXBqzZ7BmuxubB1Cbd29utc0XbJgNHfb5DByp2387fEJnd0WZYi2gGsdbXaDWbmRvaWSe3MqOVNeMKZofyDbW81kR6WHuSMAd1wmMhlO8m6tW+DuZ6XkwfowsFHE42xwWnhEAQWlFgpeV5/9FHcapAZlXwnHqwygLW3kPPFwRYLdoKjeyYDAtXTF1WeTYu+tv4DBQCvEJxdyzC+iU1OHI2Doxzz6Rx6zavSZjBtDoUUlcXWnzKyub5+savPk3szldgO9LohCOQtAs309SL3LqbPh+2FY+rXz4FJYlL3dPmkn6dYGZYBVHwbnmVpFx/760xGAmu2Rc1aBPu1m4EXN7p76XhLU2eSGybVnVv/xAB5frP2GARGhMGwOIR3BOsMdFN2FQY6CqjUkhTfTosLoGGbu0QjHCu5h9RcOHdaEbL8rlqznEAhojNMeeuN9pnkWDY2Qcd6eThlk7cBUUnJ9uh9wwe+yjUklyuZAY4C16JqQcxUGKKRv4Q96uzn0C5PxJ5DdmuNhglNyFIv4+RT2zBKPDNXlpNEesv7+5OS0Tw8XNjMiIeYhmPBczRYfZ0dPpwjXNCrSU9oA1FfzPaDmtFURh5A==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(35042699022)(82310400026)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8KzISpV3ZgwTSnTslLU/gzGznTlktyhQjcIodKs65X+ax3fFaMT16KGT7JObvgEbRHt1Egh42GwxevorU/1MHGWa40xbFq3S4HX/9MspmN2tXjMnMfITlK3H+XDYhkxkvHKSTSoZXeJOvgWo4OU93SBxVeGl8GfkqEF6gULWT63uLUpSeZddDB6NXrsQ38xBl+O1563RIrSznFmgkLhPiq+cA2HfxJPR/C2URhc2IjTXHjFE5oxKDxQZLPrGRdDdYNmxn/sDg3OL0s0YL0E75tct1qPssMp9TRsWdL5UjfS4LyiOm+ebgSDrUhg6OW+UbAtikjQgYiu8sIl7G98UckB9tsB85LuQVZuKjToQ4e/M410cOpY3P1LwtSOucZBE4bD18jlxNoqPWnA1X3V8LLtVo5nA9CYNmL9ux9GxPVzelpY1JNAkRfZyNYsdR0Cw
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 14:55:05.3772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd2ac15-50b8-4cec-490a-08de747ddca8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10610

Hi,

> On 25 Feb 2026, at 15:49, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Feb 25, 2026 at 02:45:35PM +0000, Parav Pandit wrote:
>>
>>> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>> Sent: 25 February 2026 04:06 PM
>>>
>>> Hi Parav,
>>>
>>>> On 25 Feb 2026, at 11:24, Parav Pandit <parav@nvidia.com> wrote:
>>>>
>>>>>
>>>>> From: Manivannan Sadhasivam <mani@kernel.org>
>>>>> Sent: 25 February 2026 03:37 PM
>>>>>
>>>>> On Wed, Feb 25, 2026 at 08:03:48AM +0000, Bertrand Marquis wrote:
>>>>>> Hi Manivannan,
>>>>>>
>>>>>>> On 25 Feb 2026, at 08:45, Manivannan Sadhasivam <mani@kernel.org> w=
rote:
>>>>>>>
>>>>>>> Hi Bertrand,
>>>>>>>
>>>>>>> On Fri, Feb 20, 2026 at 09:02:12AM +0000, Bertrand Marquis wrote:
>>>>>>>> Hi Parav,
>>>>>>>>
>>>>>>>>> On 20 Feb 2026, at 07:13, Parav Pandit <parav@nvidia.com> wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>>>> Sent: 20 February 2026 05:25 AM
>>>>>>>>>>
>>>>>>>>>> On Fri, Feb 13, 2026 at 01:52:06PM +0000, Parav Pandit wrote:
>>>>>>>>>>> Hi Bill,
>>>>>>>>>>>
>>>>>>>>>>>> From: Bill Mills <bill.mills@linaro.org>
>>>>>>>>>>>> Sent: 26 January 2026 10:02 PM
>>>>>>>>>>>>
>>>>>>>>>>>> This series adds the virtio-msg transport layer.
>>>>>>>>>>>>
>>>>>>>>>>>> The individuals and organizations involved in this effort have=
 had difficulty in
>>>>>>>>>>>> using the existing virtio-transports in various situations and=
 desire to add one
>>>>>>>>>>>> more transport that performs its transport layer operations by=
 sending and
>>>>>>>>>>>> receiving messages.
>>>>>>>>>>>>
>>>>>>>>>>>> Implementations of virtio-msg will normally be done in multipl=
e layers:
>>>>>>>>>>>> * common / device level
>>>>>>>>>>>> * bus level
>>>>>>>>>>>>
>>>>>>>>>>>> The common / device level defines the messages exchanged betwe=
en the driver
>>>>>>>>>>>> and a device. This common part should lead to a common driver =
holding most
>>>>>>>>>>>> of the virtio specifics and can be shared by all virtio-msg bu=
s implementations.
>>>>>>>>>>>> The kernel implementation in [3] shows this separation. As wit=
h other transport
>>>>>>>>>>>> layers, virtio-msg should not require modifications to existin=
g virtio device
>>>>>>>>>>>> implementations (virtio-net, virtio-blk etc). The common / dev=
ice level is the
>>>>>>>>>>>> main focus of this version of the patch series.
>>>>>>>>>>>>
>>>>>>>>>>>> The virtio-msg bus level implements the normal things a bus de=
fines
>>>>>>>>>>>> (enumeration, dma operations, etc) but also implements the mes=
sage send and
>>>>>>>>>>>> receive operations. A number of bus implementations are envisi=
oned,
>>>>>>>>>>>> some of which will be reusable and general purpose. Other bus =
implementations
>>>>>>>>>>>> might be unique to a given situation, for example only used by=
 a PCIe card
>>>>>>>>>>>> and its driver.
>>>>>>>>>>>>
>>>>>>>>>>>> The standard bus messages are an effort to avoid different bus=
 implementations
>>>>>>>>>>>> doing the same thing in different ways for no good reason. How=
ever the
>>>>>>>>>>>> different environments will require different things. Instead =
of trying to
>>>>>>>>>>>> anticipate all needs and provide something very abstract, we t=
hink
>>>>>>>>>>>> implementation specific messages will be needed at the bus lev=
el. Over time,
>>>>>>>>>>>> if we see similar messages across multiple bus implementations=
, we will move to
>>>>>>>>>>>> standardize a bus level message for that.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> I would review more, had first round of sparse review.
>>>>>>>>>>> Please find few comments/questions below.
>>>>>>>>>>
>>>>>>>>>> I'd like to comment that I think it makes sense to have a basic =
simple transport and
>>>>>>>>>> then add performance features on top as appropriate.
>>>>>>>>> Sounds good. Simple but complete is needed.
>>>>>>>>
>>>>>>>> Agree.
>>>>>>>>
>>>>>>>>>
>>>>>>>>>> So one way to address some of these comments is to show how
>>>>>>>>>> they can be addressed with a feature bit down the road.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> 1. device number should be 32-bit in struct virtio_msg_header.
>>>>>>>>>>>> From SIOV_R2 experiences, we learnt that some uses have use ca=
se for more than 64k devices.
>>>>>>>>>>> Also mapping PCI BDF wont be enough in 16-bits considering doma=
in field.
>>>>>>>>>>>
>>>>>>>>>>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data tr=
ansfer.
>>>>>>>>>>> For example, a TCP stream wants to send 64KB of data + payload,=
 needs more than 64KB data.
>>>>>>>>>>> Needs 32-bits.
>>>>>>>>>>>
>>>>>>>>>>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REM=
OVED (instead of READY)
>>>>>>>>>>> But more below.
>>>>>>>>>>>
>>>>>>>>>>> 4. I dont find the transport messages to read and write to the =
driver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to
>>>>> operate
>>>>>>>>>> the virtqueues.
>>>>>>>>>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and resp=
onse?
>>>>>>>>>>
>>>>>>>>>> surely this can be an optional transport feature bit.
>>>>>>>>>>
>>>>>>>>> How is this optional?
>>>>>>>>
>>>>>>>> As said in a previous mail, we have messages already for that.
>>>>>>>> Please confirm if that answer your question.
>>>>>>>>
>>>>>>>>> How can one implement a transport without defining the basic data=
 transfer semantics?
>>>>>>>>
>>>>>>>> We did a lot of experiments and we are feature equivalent to PCI, =
MMIO or Channel I/O.
>>>>>>>> If anything is missing, we are more than happy to discuss it and s=
olve the issue.
>>>>>>>>
>>>>>>>
>>>>>>> I'd love to have this transport over PCI because it addresses the s=
hortcomings
>>>>>>> of the existing PCI transport which just assumes that every config =
space access\
>>>>>>> is trap and emulate.
>>>>>>
>>>>>> Agree and AMD did exactly that in their demonstrator.
>>>>>> I will give you answers here as i know them but Edgar will probably =
give you more
>>>>>> details (and probably fix my mistakes).
>>>>>>
>>>>>>>
>>>>>>> But that being said, I somewhat agree with Parav that we should def=
ine the bus
>>>>>>> implementations in the spec to avoid fixing the ABI in the implemen=
tations. For
>>>>>>> instance, if we try to use this transport over PCI, we've got quest=
ions like:
>>>>>>>
>>>>>>> 1. How the device should be bind to the virtio-msg-pci bus driver a=
nd not with
>>>>>>> the existing virtio-pci driver? Should it use a new Vendor ID or Su=
b-IDs?
>>>>>>
>>>>>> One bus is appearing as one pci device with its own Vendor ID,
>>>>>>
>>>>>
>>>>> What should be the 'own Vendor ID' here?
>>>>>
>>>>> The existing virtio-pci driver binds to all devices with the Vendor I=
D of
>>>>> PCI_VENDOR_ID_REDHAT_QUMRANET. So are you expecting the Vendors to us=
e their own
>>>>> VID for exposing the Virtio devices? That would mean, the drivers on =
the host
>>>>> need update as well, which will not scale.
>>>>>
>>>>> It would be good if the existing virtio-pci devices can use this new =
transport
>>>>> with only device side modifications.
>>>>>
>>>>>>>
>>>>>>> 2. How the Virtio messages should be transferred? Is it through end=
point config
>>>>>>> space or through some other means?
>>>>>>
>>>>>> The virtio messages are transfered using FIFOs stored in the BAR of =
the PCI
>>>>>> device (ending up being memory shared between both sides)
>>>>>>
>>>>>
>>>>> What should be the BAR number and size?
>>>>>
>>>>>>>
>>>>>>> 3. How the notification be delivered from the device to the host? T=
hrough
>>>>>>> INT-X/MSI/MSI-X or even polling?
>>>>>>
>>>>>> Notifications are delivered through MSI.
>>>>>>
>>>>>
>>>>> So no INT-X or MSI-X? Why so?
>>>>>
>>>>> Anyhow, my objective is not to get answers for my above questions her=
e in this
>>>>> thread, but to state the reality that it would be hard for us to make=
 use of
>>>>> this new transport without defining the bus implementation.
>>>>>
>>>> +1 to most of the points that Manivannan explained.
>>>>
>>>> The whole new definition of message layer for the PCI does not make an=
y sense at all where expectation for the device is to build yet
>>> another interface for _Everything_ that already exists.
>>>> and device is still have to implement all the existing things because =
the device does not know which driver will operate.
>>>>
>>>> And that too some register based inefficient interface.
>>>> Just to reset the device one needs to fully setup the new message inte=
rface but device still have to be working.
>>>> That defeats the whole purpose of reset_1 and reset_2 in the device.
>>>>
>>>> This does not bring anything better for the PCI devices at all.
>>>>
>>>> A transport binding should be defined for the bus binding.
>>>> A bus that chooses a msg interface should be listed that way and bus c=
hoose inline messages can continue the way they are.
>>>>
>>>> If we are creating something brand-new, for PCI the only thing needed =
is:
>>>> 1. Reset the device
>>>> 2. Create an admin virtqueue
>>>> 3. Transport everything needed through this virtqueue including featur=
es, configs, control.
>>>>
>>>> And this will work for any other bus or msg based too given only contr=
act needed is to creating the aq.
>>>
>>> I think you misunderstood a bit the point of virtio-msg bus over PCI so=
 let me try to explain.
>>>
>>> You see one PCI device (regular, not virtio) which is a "virtio-msg bus=
 over PCI".
>>>
>>> When the virtio-msg bus over PCI it will communicate through this devic=
e with an external
>>> system connected through the PCI bus.
>>> The driver will enumerate virtio devices available behind this bus and =
register them so that
>>> the corresponding virtio drivers are probed for them.
>>> All virtio-msg messages required to communicate with those devices will=
 be transferred through
>>> a FIFO stored in the BAR of the pci device and standard PCI DMA will be=
 used to share the
>>> virtqueues with all the devices on the bus.
>>>
>>> So the PCI device is not one virtio device but one bus behind which the=
re can be many devices.
>>>
>>> Is this making the concept a bit clearer ?
>>>
>> Yes. This makes a lot of sense now.
>>
>> This is a virtio-msg-transport device that needs its own device id in th=
e table.
>> And its binding to the PCI transport.
>
> ok. how about an rfc of that idea on the list?


I will let Edgar answer on this.

Cheers
Bertrand

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
