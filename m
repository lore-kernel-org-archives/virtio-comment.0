Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010056.outbound.protection.outlook.com [52.101.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C221DFF7
	for <virtio-comment@lists.linux.dev>; Fri, 20 Feb 2026 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.56
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771577958; cv=fail; b=XyUevWOSZJ4RHhaKrXSzoOhzE/GT8JnvuYPY9Ke2j5asYUxxUQOma0RDKr1FM5SB1ZMi6/3C1OdyGixn9Toy4kU4RuH+2K8tzgdkL7glR56qKKUi3I2IvpHjfaMdFt/91lrWM5dVKIi+84r3tjXlvv8DB+SK5gtjscmLKhzfFkI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771577958; c=relaxed/simple;
	bh=D9jG3SWzEou1u4Ag0k3LCEEYL9trdAAjxLorYe884Qc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aTJbEyDEodVZVaYXVYDKu2uoRDZRK4GUS38K1VFkBskgLEWI0LSi63TBInR205TjOjcTNY7sCEmGbKAC0kPVeSvYAZFXP90ZRdZkV4ir6aajAXLV8cjva/TvkcY0AO1dViXHW3Z6TmXBt1ubtQ7XLEPG8Od79b3EUfmLeaKuog4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mqUr+u8P; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mqUr+u8P; arc=fail smtp.client-ip=52.101.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mqUr+u8P";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mqUr+u8P"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=snBTeNDfRrqhn4QfQIyQTJRIWWQJv8yyiJ73fdCOqFg8aaNIH6yp/Q4yU2rzXc2+3pcMGoUFnLOIDI53i2OUZvO6tVpkF9i3m6lZlLNSGdpuS9HGoOedFzKYe3J8PlL7fOl+kh+ws/bny/hQnc/SM9X+96NLPoo5HWpTHwCzUS74nqgr2yIhDUqB8CH1RhqV5t+SfmPTHQtgjB5M8uARHnaNp6Jfc1bo7r/tYf4SkojwqA+mDIl/7lUySUdNUmDr7ZLwZ0D3pg5a64PsjEiaoM+RCTapPOSi1aUqeit7NusyMoqapzvVkcDTn+B659rvR4eu5ahwEqKh7oSttk3ULA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoO00VBpOpua5jpcWwm3Hq+7N/yVp1XEFX2lFd/9+Nc=;
 b=N3tFJGtelP4tt8wBsqAcYEKHBjsc5DfME1CUDoFiZhq4abRTlig+LKHCnG3CvifyTUzWv89iEbTud9SZveqA2FsUc/DiH59vPyIz3YE07Zx5sA7+4U2yF/BvXISYI6rn+gS6rd4kMKo6plMuReroZKQmq1MT+nTXJE4SooUEiatmn45dREqAp/hg8v7rbD4R+xvPMgbvcZqHrEmK/17LNKRfMHRfqxCAM4bHjdBIjtuCZGcNrgb+6dUZpUatDyj36ZDfrgqzCmXWzNYfPT6xf1yP2NrdisVv8GuHTs2dqZWUULvcEVXblHItp0XB1SSz5jyiirtJ++YnppZQNAVLfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoO00VBpOpua5jpcWwm3Hq+7N/yVp1XEFX2lFd/9+Nc=;
 b=mqUr+u8PbhQ1Ed/YLNEEvrcleaXY2AQCOjz3KSTNWU1cl5JtNe1EDF3zu4hzJTRhD0x5hDaQjeVX4FA/4ULwAD/oVp52GndKMWluk3stku8gb8EIMnzqUD+c2OPKCC7xjEKcbTpSRkLR3rDh75pdj7zUWznQTT3Kj3wYCP+U9IY=
Received: from CWLP265CA0390.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::23)
 by PAVPR08MB8967.eurprd08.prod.outlook.com (2603:10a6:102:326::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:59:06 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:400:1d6:cafe::5b) by CWLP265CA0390.outlook.office365.com
 (2603:10a6:400:1d6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 08:58:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Fri, 20 Feb 2026 08:59:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYZOxdMYW6r1CniF9FjZNIRlL6t4Yc53FxmKiW829xPW/rId5WvvefprxtHkNw6wE8UB0uTeyR2KcCbczi09Aoj6tdDu7pwTGEnKX549+Heq0HeHCWp/KqOYsTOlssZWU4M63f79bqLhSo2O5f0/yne5IY27vDoZbA1AB8MN2JBFlvlHUH0C4HSpC+864HVDD5bi4/i1kE2n9o1SNhAnKLLTffRLkrSK4D0k5kssPknkdSpMedaiKysAHg1o/GoFUyo3dJ8GDobEA4kocCH0UUF+d75cG71il6tnWJ3qHfYpejZScRkRlhn6hsZSj4R50gAuH1Btvaztu0zX6JIdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoO00VBpOpua5jpcWwm3Hq+7N/yVp1XEFX2lFd/9+Nc=;
 b=KhRzF4FO/8eAd5PWSMWa3pQDKmHO7DXVjemRzSkTahxJhDNGIQn37rMA3606Fz+smv7r1lOA8f96dAQaeRj6F2RcEFoMbcR176rMbFATkju1bTI5MCAXJ+6as0kZhDZqxPgknlL6TVlz7Y8yMxRy4JEYqXNfEBeoDL2wCn41lwRyFT51Wt9cFuaWyTHyjtHLxmHuWh7fPPKv+gx3mI3QAFs8JZC3iFsP9D/OogIwFOtyOWGGDo/Ca8ARJAwks9iZs8nD1x6HNtCKwVxQrr/u83JHI051mmq69MT0/AYIh4NjK4h/a/7e1TySLhVUYMJgCaEB0exK12OzEqpDwJrmaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoO00VBpOpua5jpcWwm3Hq+7N/yVp1XEFX2lFd/9+Nc=;
 b=mqUr+u8PbhQ1Ed/YLNEEvrcleaXY2AQCOjz3KSTNWU1cl5JtNe1EDF3zu4hzJTRhD0x5hDaQjeVX4FA/4ULwAD/oVp52GndKMWluk3stku8gb8EIMnzqUD+c2OPKCC7xjEKcbTpSRkLR3rDh75pdj7zUWznQTT3Kj3wYCP+U9IY=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU0PR08MB8301.eurprd08.prod.outlook.com (2603:10a6:10:40f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 20 Feb
 2026 08:58:01 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 08:58:00 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Parav Pandit <parav@nvidia.com>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index: AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAJe5gA==
Date: Fri, 20 Feb 2026 08:58:00 +0000
Message-ID: <B50C799E-B04D-47D6-9E4D-D7DE06E4B6C0@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260219185034-mutt-send-email-mst@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU0PR08MB8301:EE_|AMS0EPF000001A0:EE_|PAVPR08MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb522b7-70e4-4258-bac2-08de705e4d90
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7142099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?EdOiInsWvrz6QDF9jMd3E6s0YpN2O0Twzs/cGI+s4L7kCpSZAhSaStJHAcED?=
 =?us-ascii?Q?bZKtYfUIihVcYUFF44+KzlngZxalEeXMWujAs4khQDw0uYozg7Eduos8y1eK?=
 =?us-ascii?Q?uliNaGkmIGF/jUWVSixruaktU9Brrn15vOiZbdsb3GtM+hoxU4idmbjeMAVE?=
 =?us-ascii?Q?QX/CwrXv5jjvc2xnb8+ks/HIMfpYXyCmmPMAftm5x7HYkm4YnGG6My8zxTRG?=
 =?us-ascii?Q?lupKzFLcdQAn3o0g5tsnYCX6z/jsnncVnoEQetj0gKFofvGBuZHzcz/8XvQa?=
 =?us-ascii?Q?+vFowpxmMXug4zvxuGElMVW4cmNzAD56rzWRllbwGVr6NHFuoddPIscL/FLx?=
 =?us-ascii?Q?eJo5bpKOLFHc8jGESTvKfPWRGl+OJpucHGNvI1+kXHO3wwt3LzBJmJzEehkL?=
 =?us-ascii?Q?94VmCWPIGMqAMX33gEFvBkJbdmv6ecqW1EjLYWNwbiOazf/h4yBU1Z5EeYa9?=
 =?us-ascii?Q?FV0cZh3PAg8884eEafCI5WMpStWIb8mGzhCE3xAmgkXI2r0T6O0zChEpV4Lk?=
 =?us-ascii?Q?RxMoguYvEYc3IszsLaHCbI2AKv4uyGwXBDFyF/HlQtaHJ9gDRqJswXIOWw9W?=
 =?us-ascii?Q?zClNig11IMaZEDU7J2EVkd57CMMHS6so0zaFUPBx2RwnNv/TyuQq2fpcyO4r?=
 =?us-ascii?Q?8Upl0CyuDPEHmy/Heg7rONQWrVwzHZrV7VrXPLEklOSTM8AyIW5OJ1ICrQwe?=
 =?us-ascii?Q?6YhHNRUM5oZPoZPVSHXRmzYJap8k/Wnb3Elhd7LettQ5k9I44KGDfoekOIIy?=
 =?us-ascii?Q?35TMdYXEA9n3DtsLG4ZUQAWk30OwH4UGXh2j6PcvmMtAt2rixB3HKhekY1YT?=
 =?us-ascii?Q?FVnvf7q2be4DXudLENNwBv4GgXetN75DrRtfHQYOERKueZdMiCVjcgukozM0?=
 =?us-ascii?Q?1n2VATzCkXdlP47F1ZnzK2j6cTmdbiFk4qi1ePk80xLwxaQHCs82mUSVcqST?=
 =?us-ascii?Q?HTtcPHOaWkPgd17dOTdmdAvZL4/J1pejRWmC91H1YMw8cPcmzLsh8V4BYBQc?=
 =?us-ascii?Q?yJklm2m3PKDEIg2I4583k2VACFxmoO/MO2q/Jr53OYm2CxmRBw3S4GzbAtKx?=
 =?us-ascii?Q?g0aG2lSqelqXArJzoeLjFwqcaTlnX7n1Pn29iiJ1cbZDFyiHB3L8Kv8DccS0?=
 =?us-ascii?Q?ON2Ot4HvFxQinqGlmf81Wg6r30ngoF3O77R/OHqMisr8o0z4FU0s43VP9X9H?=
 =?us-ascii?Q?u4HH9DUZa4JJgRPYZQWj3ZWXvWj/DFD/BiOYML52c7sCSSRUticzMxYbkuqG?=
 =?us-ascii?Q?WSUPtUUCenD1KHT371Eha2SuZqy33gobDX2731DzLtUGd84894wbO5u/UceM?=
 =?us-ascii?Q?lfjQkJI6yeGfQJkgK5wxYm5WZ+zs61UKoh02hGCS0ZgHDQw+9I8JD6fgbb/2?=
 =?us-ascii?Q?cjFp9iRr8oNuhAV/kxEnMP3XGO0/gFEJfsvuPszxBvmw+3S+SnmxKIGutqPD?=
 =?us-ascii?Q?XlamkvySD8xczqQVNNodBacCaIqoomLQSUTxZXk0ZdeGz1zbdYwvwlGSb0w9?=
 =?us-ascii?Q?9+rLlPaUiH/MkmmiDEchS20rLYRx4Mtaz2M0ijs20oGQLo2BiDFls9dAEpF4?=
 =?us-ascii?Q?DJH6LNADbpL6+uRD9iEWDQdR9eV1Wi3govSuwaf1?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7142099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6C2F73C91798C741A1A57D905268CE00@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8301
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9e500f2e-e7c6-44df-8e42-08de705e261b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|14060799003|36860700013|376014|13003099007|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VCJ4oxOOaqmj3aDBqlqPjnb5QkE78apw/2q1VBWlysKCj4xsoJCXomPTVHtw?=
 =?us-ascii?Q?txAqqmAKqW/jQt8eQ2EKIuuRCDnTVQRp9Br1vQvppq32T1aakKIDEVI7S2NM?=
 =?us-ascii?Q?EOk9FeAMhoZXEZU/cQNSxgFEa4V4B6KPSRi9TgMImj+nbuwls9T/7frg410F?=
 =?us-ascii?Q?xt5jz9lzKjXIkC55SU374E7i/IlURmlgzSyEGwMKngBITDO4+EpRALpVet1h?=
 =?us-ascii?Q?MAF/Ic5I7Y5uKW/eJcpDrgmYb5Z7qyq0PhlqTKZMPl77rWjnDrsCG589DL+L?=
 =?us-ascii?Q?M0VLWHOA1S9M81QmDmKDB4TovrP7N0e9RHcGr1KlPD3rLAK8mRWFYb6fiovi?=
 =?us-ascii?Q?KgVq84YBzM/PO0jStvzAkM4AKPVg4fC0gFz41lNGwet0VBIQibVRUeGsbOlT?=
 =?us-ascii?Q?qWlZIgmAgG9/06gQ4rp2QAcGdB20M0PYBA2FM3/opKNyvDoIwKTf206aAZEo?=
 =?us-ascii?Q?fgZmtZcowiU+MiK0Ar6xfwwqchmquvHE5XNORidRCYOwKG2TV+JC0/yg0D1F?=
 =?us-ascii?Q?K0ZE68I/JYhJYwgPkfhK4QXRVhyL9cZENA0+E39+DW2QwVkRQ4KA+GzbaVhg?=
 =?us-ascii?Q?E7VEEPLQM9c2aeqwd+1duVeIEulTvIDcEYtrUoTGUsItJCfPIcDWGqFYvZLo?=
 =?us-ascii?Q?yYorrNOVcamXz75lsRlqa+MeadobkZNW3kWqKFIcdMymTdK61kIH+VkE+1CG?=
 =?us-ascii?Q?0wIbAMx2ed0wxavmAbSBeKMjQcGQCp1lPGEnLj5JmqiyxVLWlE22IVtPhFtJ?=
 =?us-ascii?Q?PyCdvvIlesOJGXtBISFCm59/FkRd2GZtx939DQAw9OdtJBZBhBjEgTXrDXas?=
 =?us-ascii?Q?KTUldzRXB76AmhZ/IZ1IZqPY/9n91CX5wJiQ8O9GWOPW0g148VMIG3aPvB+p?=
 =?us-ascii?Q?WT6KEduR2wb8exer7dcTpEgiH3g6cnKzZeFz2Xaiz663NBEStHWGhxGoiTVn?=
 =?us-ascii?Q?WjGTM76Hm9sYHq8eXlLWOuh94yPgDoTMUJOss+qADVrB06ZEgEWrUWdWcyTV?=
 =?us-ascii?Q?Lhxcuo1srNvcGZLk49bYnJdcYMdiZoQNQyDY+R2DPrTit+V1qAmQGXztP365?=
 =?us-ascii?Q?Gk8bZMVNRSuPRZY1xFcZZYc9WyhiX/WkXCkI7cahf5bAe8B6ba/QtcAE4zhf?=
 =?us-ascii?Q?QpYkn4Y1yKDZmolMKTxCyBs+/ap4+8UPJPPdymyA0mRNh/Rtv2cT815MEtOL?=
 =?us-ascii?Q?PwUe+e/DWPhXC3L6EeX6IzYC1q5Bor3njOpoH2VfQ5U1gbprjoCccLnSQ+1g?=
 =?us-ascii?Q?+gQbUF6M5LdzEUtA0Z6OpeMUjahxQKdGCLA10cu2prmbM5Jz8+Vvzp9ZcJQS?=
 =?us-ascii?Q?Mm/Dbg56VakthadOlfPx+xnagzqWf5SF/RLXF7Un8FsuWTUkARLgit18qrkd?=
 =?us-ascii?Q?61O2ZHv3HSToLto0u2HVPZh2tgXiiFm/weP5H/fQgQ8dvPES+hEoibC641zT?=
 =?us-ascii?Q?KOxWovs1NoWwoANMLtWMx9UYiLn24G3Tl3EmT7s4J2yF1XG3bGG9aqjaWwbQ?=
 =?us-ascii?Q?3N4P4UIogr+Mj1Z/edcKGM++OEWi1Bv0VUpie/oc6umnG2tHeuKJ+E0Yc5KH?=
 =?us-ascii?Q?I79cDnp5n61J9nWp/0YaS4u9/zY9WrgYH0sWM4T2PvKZZHxDCwdufFsAGnR/?=
 =?us-ascii?Q?ayFXGX0WD1wL9W3cQSDnk2A=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(14060799003)(36860700013)(376014)(13003099007)(7142099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	deR6VuzZroVchR93jRL3KdwLA/1kU/pQxJatVDqQ4OAIkJg5LeKx8F7KVbL/8YwU9sEOXrEzk6mku3BF3Vd6KYn8l9MJejogU+mtPO5IgIvOp/FvyZ3so8IHP9VYj4uvKsAHYiyYGmQPec2lLYf716LtwmJaI0Zi8ILyY3HmHdA8ICZH8VfK/fmL01KyNRKmRTSxRouEbFGf2OSszo9O1p/LZ+oFlx3SyfNO9HsrdTjM5XGVODjoVa1fPlo781qZNFFbC9XJVl2Ctdoo/RJ1qIcq+EcaaKoz++2q64UDmViQgOWh3zNxHoh0owZtTAmG7MP6cKec9wqezU4QTWY0GPSKKxGauVOINQA7MwswDAl2EU0Lebh2jdufQgM5WjzRoW+8v/MmVYe5q7SfzRCE+gYodeFJGciRyV7dHD3Ri4A4+LKiIVZZ8UBqi9xYGl+S
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:59:06.2750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb522b7-70e4-4258-bac2-08de705e4d90
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8967

Hi Michael,

> On 20 Feb 2026, at 00:54, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Feb 13, 2026 at 01:52:06PM +0000, Parav Pandit wrote:
>> Hi Bill,
>>
>>> From: Bill Mills <bill.mills@linaro.org>
>>> Sent: 26 January 2026 10:02 PM
>>>
>>> This series adds the virtio-msg transport layer.
>>>
>>> The individuals and organizations involved in this effort have had diff=
iculty in
>>> using the existing virtio-transports in various situations and desire t=
o add one
>>> more transport that performs its transport layer operations by sending =
and
>>> receiving messages.
>>>
>>> Implementations of virtio-msg will normally be done in multiple layers:
>>> * common / device level
>>> * bus level
>>>
>>> The common / device level defines the messages exchanged between the dr=
iver
>>> and a device. This common part should lead to a common driver holding m=
ost
>>> of the virtio specifics and can be shared by all virtio-msg bus impleme=
ntations.
>>> The kernel implementation in [3] shows this separation. As with other t=
ransport
>>> layers, virtio-msg should not require modifications to existing virtio =
device
>>> implementations (virtio-net, virtio-blk etc). The common / device level=
 is the
>>> main focus of this version of the patch series.
>>>
>>> The virtio-msg bus level implements the normal things a bus defines
>>> (enumeration, dma operations, etc) but also implements the message send=
 and
>>> receive operations. A number of bus implementations are envisioned,
>>> some of which will be reusable and general purpose. Other bus implement=
ations
>>> might be unique to a given situation, for example only used by a PCIe c=
ard
>>> and its driver.
>>>
>>> The standard bus messages are an effort to avoid different bus implemen=
tations
>>> doing the same thing in different ways for no good reason. However the
>>> different environments will require different things. Instead of trying=
 to
>>> anticipate all needs and provide something very abstract, we think
>>> implementation specific messages will be needed at the bus level. Over =
time,
>>> if we see similar messages across multiple bus implementations, we will=
 move to
>>> standardize a bus level message for that.
>>>
>>
>> I would review more, had first round of sparse review.
>> Please find few comments/questions below.
>
> I'd like to comment that I think it makes sense to have a basic simple tr=
ansport and
> then add performance features on top as appropriate.
> So one way to address some of these comments is to show how
> they can be addressed with a feature bit down the road.

Agree and i will investigate the possibility to introduce a solution (now o=
r in the future) to
use a feature bit to enable/disable out-of-order when supported as i think =
this is a good
solution.

>
>
>> 1. device number should be 32-bit in struct virtio_msg_header.
>>> From SIOV_R2 experiences, we learnt that some uses have use case for mo=
re than 64k devices.
>> Also mapping PCI BDF wont be enough in 16-bits considering domain field.
>>
>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data transfer.
>> For example, a TCP stream wants to send 64KB of data + payload, needs mo=
re than 64KB data.
>> Needs 32-bits.
>>
>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMOVED (ins=
tead of READY)
>> But more below.
>>
>> 4. I dont find the transport messages to read and write to the driver me=
mory supplied in VIRTIO_MSG_SET_VQUEUE addresses to operate the virtqueues.
>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
>
> surely this can be an optional transport feature bit.

GET/SET_CONFIG should cover this already.

>
>> Also, the queue notification message is missing at bus level.
>> But I dont think queue notification via message good idea anyway.
>> We rather need a more higher-level message for virtqueues.
>> Such as posting the descriptors to device. And this should translate int=
o a VIRTIO_MSG_DESC_SEND or bus specific binding.
>> Without this msg transport is incomplete.
>
> this too can be a basic method and upgrade to a different one
> with a feature negotiation

I am not quite familiar with those principles but definitely introducing ne=
w messages now or in the future is possible and will be done.
Main question is what must be introduced in the first version and what need=
s to be investigated more to be added in the future.

>
>
>> 5. msg_id to be renamed to msg_opcode, and token to be renamed to msg_id=
 as it identifies the msg (as written in the description) in
>>
>> 6. Bus requirements ordering is too strict for implementing any performa=
nt data path as data response may not be in same order as request for reads=
.
>
> here too, relaxed ordering could be a feature bit.

Ack.

Cheers
Bertrand

>
>> 7. VIRTIO_MSG_SET_VQUEUE does not have bit field for individual addresse=
s.
>> This requires caching all the values on the driver side before sending t=
he transport request.
>> I think it is time for virtio spec to shift to virt queue create and des=
troy model using the admin queue interface.
>> and no need to bring this VIRTIO_MSG_SET_VQUEUE legacy to new transport =
bindings.
>> It may require more plumbing, but it is cleaner interface when a new tra=
nsport binding is created.
>>
>> 8. We should have the message response header for req-resp method with s=
tatus code.
>> (even though they are plain MMIO writes for pci).
>> As opposed to that, proposed messages are doing composite tasks, hence w=
e need the status response.
>>
>> 9. virtio stack cannot handle hotplug devices today, at least Linux.
>> So if the intention is to fit into such a system, DEVICE_BUS_STATE_REMOV=
ED will not be enough.
>> A graceful method is needed.
>>
>>> We are working on a few reusable bus implementations:
>>>
>>> * virtio-msg-ffa based on Arm FF-A interface for use between:
>>>  * normal world and secure world
>>>  * host and VM or VM to VM
>>>  * Can be used w/ or with out a hypervisor
>>>  * Any Hypervisor that implements FF-A can be used
>>>  * We have this working with pKVM and Xen
>>>  * We have this working with Trusty and OP-TEE
>>>
>>> * virtio-msg-amp for use between heterogenous systems
>>>  * The main processors and its co-processors on an AMP SOC
>>>  * Two or more systems connected via PCIe
>>>  * Minimal requirements: bi-directional interrupts and
>>>    at least one shared memory area
>>>  * hvac-demo has 2 demos of this
>>>  * This is working on two hardware platforms
>>>
>>> * virtio-msg-loopback for userspace implemented devices
>>>  * Allows user space to provide devices to its own kernel
>>>  * This is similar to fuse, cuse or loopback block devices but for virt=
io
>>>  * hvac-demo has a demo
>>>
>>> We also anticipate a few more:
>>>
>>> * virtio-msg-xen specific to Xen
>>>  * Usable on any Xen system (including x86 where FF-A does not exist)
>>>  * Using Xen events and page grants
>>>
>>> * virtio-msg over admin virtqueues
>>>  * This allows any virtio-pci device that supports admin virtqueues to =
also
>>>    support a virtio-msg bus that supports sub devices
>>>  * [We are looking for collaborators for this work]
>>>
>>> Changes since RFC2:
>>>
>>> Spec Functional:
>>> * Made the common message header 8 bytes and added a token for optional=
 use
>>>  when parallel outstanding requests are possible
>>> * Made the 8 byte fields align to 8 byte offsets.
>>>  This effects the {SET,GET}_VQUEUE messages
>>> * Many conformance cases have been tightened.
>>>
>>> Spec Editorial:
>>> * Major restructure to better align with virtio spec
>>>  * Conformance model now matches other transports
>>>  * Use C structures to define messages instead of tables
>>> * Added a section to describe how responses are matched to requests
>>>  This includes the use of the new token field
>>> * Redefined / better described error handling between transport and bus
>>>  layers to eliminate the need for the bus to generate fake response mes=
sages
>>> * Included editorial feedback from RFC2
>>>
>>> Eco-system:
>>> * Added virtio-msg-loopback demo
>>> * Arm has published the first draft of the virtio-msg over FFA spec [6]
>>> * virtio-msg over FFA has been demonstrated with both Trusty and OP-TEE
>>>  secure world
>>> * LKML RFC has been sent [7]
>>> * QEMU RFC has been sent [8]
>>>
>>> This is the first non-RFC patch series. The known short comings have be=
en
>>> addressed. We ask for review in earnest on this series and thank you fo=
r
>>> any feedback you can provide.
>>>
>>> Background info and work in progress implementations:
>>> * HVAC project page with intro slides [1]
>>> * HVAC demo repo w/ instructions in README.md [2]
>>> * Kernel w/ virtio-msg common level and ffa support [3]
>>> * QEMU w/ support for one form of virtio-msg-amp [4]
>>> * Portable RTOS library w/ one form of virtio-msg-amp [5]
>>>
>>> In addition to the QEMU system based demos in the hvac-demo repo, we al=
so have
>>> two hardware systems running:
>>> * AMD x86 + AMD Arm Versal connected via PCIe
>>> * ST STM32MP157 A7 Linux using virtio-i2c provided by M4 Zephyr
>>>
>>> Please note that although the demos work, a few have not been aligned
>>> with this version of the spec.
>>>
>>> [1]
>>> https://linaro.atlassian.net/wiki/spaces/HVAC/overview
>>> 05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf88d95%7C43083=
d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6390
>>> 50419790817373%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw=
LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIs
>>> IldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DJnCO8QgAIiyGAprBLkprUd8A3162wCFpm=
Gic3JKoHXo%3D&reserved=3D0
>>> [2] https://github.com/wmamills/hvac-
>>> demo&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf8=
8d95%7C43083d15727340c1b7db39efd9ccc17a%7C0%7
>>> C0%7C639050419790868944%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWU=
sIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIj
>>> oiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DXeBuS8Hr%2FDETKfSyidKKG=
oGq6OTUcOYoeSGDouUMcf4%3D&reserved=3D0
>>> [3]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/vireshk%252
>>> Flinux.git%2Flog%2F%3Fh%3Dvirtio%2Fmsg&data=3D05%7C02%7Cparav%40nvidia.=
com%7Cf7f430294c37485df25808de5cf88d95%7C43083d1
>>> 5727340c1b7db39efd9ccc17a%7C0%7C0%7C639050419790913867%7CUnknown%7CTWFp=
bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
>>> LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%=
7C&sdata=3DPuLq68Y0ZNCYbfrgDZlipfm44xHZp1%2F%2
>>> BLu%2FaKQBBB%2Fo%3D&reserved=3D0
>>> [4] https://github.com/edgarigl/qemu/commits/edgar/virtio-
>>> msg-
>>> rfc%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5c=
f88d95%7C43083d15727340c1b7db39efd9ccc17a%7C0%
>>> 7C0%7C639050419790960971%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydW=
UsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFO
>>> IjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DxyowKD9KG3IasQTiYCzfC=
RGqCLSF%2Fa1g4%2F2%2ByKb1OoA%3D&reserved=3D0
>>> [5] https://github.com/arnopo/open-amp/commits/virtio-
>>> msg%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5c=
f88d95%7C43083d15727340c1b7db39efd9ccc17a%7C0
>>> %7C0%7C639050419791007707%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd=
WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkF
>>> OIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D69OwO2wXi0%2FEhDDSR2=
uLG2iis5RYzI%2FLnlfkcRYao9o%3D&reserved=3D0
>>> [6] https://documentation-/
>>> service.arm.com%2Fstatic%2F68f647791134f773ab3f0a7c&data=3D05%7C02%7Cpa=
rav%40nvidia.com%7Cf7f430294c37485df25808de5cf88d9
>>> 5%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C639050419791052848%7CUnk=
nown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRy
>>> dWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3=
D%7C0%7C%7C%7C&sdata=3DcD5VqKnTuIFqlN2XV3j%2FHQ
>>> Wvsz8UVe5PM0ZjMU3o0sM%3D&reserved=3D0
>>> [7]
>>> https://lore.kernel.org/all/cover.1753865268.git.viresh.kumar@linar
>>> o.org%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de=
5cf88d95%7C43083d15727340c1b7db39efd9ccc17a%7C
>>> 0%7C0%7C639050419791093596%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRy=
dWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsI
>>> kFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DNmhmL%2BuyVqnpHT5r=
9EfI2uzPf9LSXLga7bUw3FO5x4w%3D&reserved=3D0
>>> [8] https://mail.gnu.org/archive/html/qemu-devel/2025-
>>> 10%2Fmsg07438.html&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c3748=
5df25808de5cf88d95%7C43083d15727340c1b7db39efd
>>> 9ccc17a%7C0%7C0%7C639050419791139232%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU=
1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ
>>> XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DosI1FttO=
O9%2B01e%2B5EtwnYe%2Fl1%2BIvFjH%2Blyz2ipM3RM
>>> Q%3D&reserved=3D0
>>>
>>> Bertrand Marquis (2):
>>>  virtio-msg: add new command for bus normative
>>>  virtio-msg: add conformance entries in conformance chapter
>>>
>>> Bill Mills (2):
>>>  virtio-msg: Add virtio-msg, a message based virtio transport layer
>>>  virtio-msg: link virtio-msg content
>>>
>>> commands.tex      |    3 +-
>>> conformance.tex   |  105 ++-
>>> content.tex       |    1 +
>>> transport-msg.tex | 1640 +++++++++++++++++++++++++++++++++++++++++++++
>>> 4 files changed, 1746 insertions(+), 3 deletions(-)
>>> create mode 100644 transport-msg.tex
>>>
>>> --
>>> 2.34.1
>>>
>>
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
