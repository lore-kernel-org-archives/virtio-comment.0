Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC4F2D8396
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 07:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772006000; cv=fail; b=R31lwnBghY9Tc1nfL4MR9PRDyimdrPsUUi2ap7Z0L4gQdNIg9SGzpDAwyiDQ3CX1fPtO6UV4/Tn/CLUez7zIE03obxPx9dFcClC+xJhKA4dpwq3JGPDxY7Ec30B9L72xmQ5rErKhJqZ9lvF0q05ZjO4E9mqotjglejwFCe2uXmo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772006000; c=relaxed/simple;
	bh=BN6AFrLoXZURDZCqLugyWJKo3ezZFwlbC7f06qhIaMg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cNvh9f5IGBauWoMDYkEu8t5xUecHHQbs3OHUjMYy59WaWGjSvDi7vpqrLxdTAN3lwqIr85kpY2vRO1qdeXDy5XebCls0WRVLnr7lFgVrC7h9cCDOJvjO3UpWug1Z55EwK5al8IY3EonFNXvw/rFQ17kSXrJL9sjmpCK9Hr/hotY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=J/jzRd0m; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=J/jzRd0m; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="J/jzRd0m";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="J/jzRd0m"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UeYIia60kMr9j+/95YmD5UOncaJh6oecQsehrRGLVaDrmp0X+oAzBxVd36b3fxRnYlAeKL5iXWm25rgfXrzuArBgKHrmDSAHvmSoIDex+uMDA2jQVyHyzg/H3hR8NafmiSWIvxGZnHWlT7bVCqdri6+nhxSq/RIcpjSsAy40t+1rVz6qMLRJ+5hBsuN3zzuR2WLsiXzBM2bxd/5PZSpPn61WVVof5ADwo0zEs4FzyVYX/lxhNUpmIb8dftbQA0s+0eNzeXQ15+AkweyvgFeqvFxlIMwW2K4AieWS1u/xFRJU5kctXPBgX8WnAfhcH9ttkotCrykwHjA6yuTuvs+sjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BN6AFrLoXZURDZCqLugyWJKo3ezZFwlbC7f06qhIaMg=;
 b=vhRNFndoMxgjs+eL6gXMxtJAjVFURE4tnkIxE64Pxm0h/oH9AdcjfbRgeSBsv7sfLr2LX4o+yiSawFORK6LDoKduH12QXjkAoqut7IR9VsPNi2s3QB9K9iavVCdcNFVobZzllUEZZxJV9Hq6bvrqVnH223pD1noZqB9YJGmNq7x8KwKQv3LG8St0bc1LwWh7ztaP3GyUIQQYIj+XKM9uTxYB1VZBOpz8UXGL3mExed3sMMb8R+NHUTczsDaNErePVjVWYr++wABCGfGgO8dJAc4SGVCJ1cMhghK5T+L3OCugwYJmUx91svdm7853TSFrLxViG+hokl0QxASuVOfvNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BN6AFrLoXZURDZCqLugyWJKo3ezZFwlbC7f06qhIaMg=;
 b=J/jzRd0m+CkYADt0MMD4hXJY47bh0gfI+4QFSvfRjEyF/cNzsZhSkeerHkjCcvaedWrx6GQNExcrxUd5SYktVUC8bBl9YhVFLsn8Oar8adoxtJZJjNqk8Fw1NGlh6EwTWOJjY6kcY2vtegUy2aYJQO9WWKlHhuRpAdNDCUnFpm0=
Received: from DU7PR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::24) by GV2PR08MB9399.eurprd08.prod.outlook.com
 (2603:10a6:150:e3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 07:53:08 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::66) by DU7PR01CA0047.outlook.office365.com
 (2603:10a6:10:50e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 07:53:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via
 Frontend Transport; Wed, 25 Feb 2026 07:53:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbMbFpnlRgkCma4kDJNLZHuRAuazrX7KgRVbk1dIj1SmRyMfXFCghsywj0p4UFJvOEdHeo7JbX865qF7JcpGFA+sUMtckzxXsCvbIL6Skx/VZibmZfyYdzVqOHpBeVwA/INWX8gPFGTh74A0762qnNnTbaFD2C0ZE2o4lbFG3f8ieB9GPaFdUwA9CvkoooN/NnUYqxBa+Tr3v9J0CKTHohIj6oKR5wDqYRwuTGL6xC6XywpcWeeZkvvif2/txMQIsj5FQj3K4bU4fLwfQesP/homOOXR3/UeoWDQwOWtZSgmC7fWfUIRVLjLRHpt7GgV0kbLHo94DXlil+nVEq+iGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BN6AFrLoXZURDZCqLugyWJKo3ezZFwlbC7f06qhIaMg=;
 b=Eg61uV+A4yeC9mLZ/mztP0bHKJHs4UX6VqR7deGg35qu7Fx4AnPn20tLbJvq9MTi6XBmNFvbViLiHeXNy78fDmJ1M2kRzGXKJZr+PPn6YkLBLhEdoIUkuk1lY9DFS2Dln56+xs88vZvtNTeLAslsNZ5ro/PdsISoVqHyNYbOS5chndGLs1LQ2inJvdyoEL3T0gtrg/07B1o+Wjw/R8KXuwiyKyFr7qlVXuRmHdVVHIAmNlXVQs6Td5UCV0cu33RwAT0M0fePufHTIYHJ3WvY0pzl/gdp9LTgjOfHtlTlG7yCTkkNVMDnMLzF5Avn9oI5JuP9q7uVsPCk+c6tQAU2XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BN6AFrLoXZURDZCqLugyWJKo3ezZFwlbC7f06qhIaMg=;
 b=J/jzRd0m+CkYADt0MMD4hXJY47bh0gfI+4QFSvfRjEyF/cNzsZhSkeerHkjCcvaedWrx6GQNExcrxUd5SYktVUC8bBl9YhVFLsn8Oar8adoxtJZJjNqk8Fw1NGlh6EwTWOJjY6kcY2vtegUy2aYJQO9WWKlHhuRpAdNDCUnFpm0=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV2PR08MB8171.eurprd08.prod.outlook.com (2603:10a6:150:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 07:52:02 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 07:52:01 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Parav Pandit <parav@nvidia.com>
CC: "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index: AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAqpM4CAB53BAIAAMF+A
Date: Wed, 25 Feb 2026 07:52:01 +0000
Message-ID: <62E0DF94-3401-42E4-9574-02C557849D44@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <478DE38A-8581-4113-9467-227DA3E0D134@arm.com>
 <SJ0PR12MB68067A563A18F69033F32448DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
In-Reply-To:
 <SJ0PR12MB68067A563A18F69033F32448DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV2PR08MB8171:EE_|DU2PEPF0001E9C4:EE_|GV2PR08MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: e125ca01-86c8-4e39-dda0-08de7442ea29
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7142099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?1v9mzzxw/27pPP5Gs6FcTraCPSj+WAcbDwlqmFX3zkpLTIq9f2REYh8dyh/L?=
 =?us-ascii?Q?mSJ1ZpiOgxyni9u7tpB3Gp2fBl6t8dRxjNPWtLuQrdw/0kJb5/u/6ZK++8Vf?=
 =?us-ascii?Q?V+H1gM3kApFLL5rjyIq3oj5qg59yHDFkcp8p+aHRf7WGq1rG81EdxZeeviov?=
 =?us-ascii?Q?DgWVK+FbfUDSLes1YVvHLZfuiwDcJvZnYxwJ0bZvcS6xHDbRVeDlV5+NPh1A?=
 =?us-ascii?Q?k3VE9qV6EdjbSFvzQmnD1N3JJ0/BWcd9wogDo8Tm5uf/LbTn/yhawWrMBuD5?=
 =?us-ascii?Q?yst4cMaDaEbwsdRUQ3Om7lFNa4a/lkvytSHhloxr/76xiGOMRFnterBXDOvM?=
 =?us-ascii?Q?GXhxjmxh2GWHV9XJfBSPbf7ODaWbevwOFrJChewvwKXMUjYlUrs3BQ9AtC/O?=
 =?us-ascii?Q?fntS94z/fTPOeHnQTMgh7aM50gaRPqrukHdeSrxPG0EXbd3ksHSOkEX5R+zN?=
 =?us-ascii?Q?N+EARa+m6ZiihhGWKtsan7LSjiipc1bLNuODrVgrgY4ItBLdHmxuUYhWz+hX?=
 =?us-ascii?Q?d8zGxkl0gjCoEvHSS6PIUn5dY8AAxUEuuPdn+5x++6KcdvJ85ufGeV3KsUO2?=
 =?us-ascii?Q?4M9WsrN0peSY9yapoM0MSQQxwsDhbbc/F5yDXYd1Eg2Y0Mm9IuiKVoaMQit3?=
 =?us-ascii?Q?7xzs0wNTPMpcsLqIqFciSEZoMUS/CiBtDtmT0Y38BL3R/ysNlqELqAAhx+G2?=
 =?us-ascii?Q?5Fgid1O2mAHbn/8KB9UPfNYBVIoMuhBP8JKcqfC6HQeAy5coZ5lRK4yZv/79?=
 =?us-ascii?Q?gMPPry20LiN9M+267b365bxTbLF77L/pQrbeJ6r50NTACjdBOdtDaam2LcVy?=
 =?us-ascii?Q?8zUdRvfj6y/5SjacKDfm04r5MrPqBd/s8IbXUT4EWL5C6L21rsJpdoVKUzJK?=
 =?us-ascii?Q?f7NAk4MxkOJubCPX8+e4v/FAvy2NK2DcMVIWo6912eYLu3W9dHN74TbuIJOA?=
 =?us-ascii?Q?gmowFmjsRFzR5R9QitLyg9d6ET+WevrBSUFqCcbEJpMrYZfzmXq+uD9IHGqP?=
 =?us-ascii?Q?Ntf7dXvXq/nEQgfj34BqX5CxVBebMLwS3+tSvKbO9YK7CmSb3hytIgmfT/fP?=
 =?us-ascii?Q?GoMMzhIIkn+r6M75YCO6YxEJV0RwhyWaifZDqRz3lMxZBH71eMHm/GnIPvDH?=
 =?us-ascii?Q?HOAlfB50hz5H1a/pP5PH/wv4908awds53YHttX1x8fxiqlEkoTxSM+gRk0tq?=
 =?us-ascii?Q?bqOLFjS+N5Du9YBqZeLHrrxgNfp/zEgLVRargnSCb6QTYePJHengXZCTuA7r?=
 =?us-ascii?Q?MkzNaSPFmPvDvKa8Dyscct0JcYptoeOzWAhcFPAtPO4Eob2BT8mBI1yT/CdS?=
 =?us-ascii?Q?zCngLOD8LTp56bOiQQfFjd40GpixBMdU94KvC8uYAGiHkKCFurrqDsLtyFs7?=
 =?us-ascii?Q?/KBI2EBoZHD2ynm/T55LLfK8KgQPJhOlHC50ScDbNBROZJ3qOaWsF6PstbQl?=
 =?us-ascii?Q?c4/eOWtSwFiYTwXVTqLP9w4MRiP2xXC8pjg9Ns5pL1rbl/zZzFM/AUH4IUHK?=
 =?us-ascii?Q?9joQ3N/Qw5tYRlMlITuycM+xhFuAprZv68laDexl26UrCTMjNFQsuC3buTRq?=
 =?us-ascii?Q?DgARGznU1bfa679wu7VP7z1NZe7XCARY0n1Mu1cURUN2rTwBxq/HJMBPfGCz?=
 =?us-ascii?Q?gy8TnecwPNQa5mEhYnxfLTw=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7142099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <51F89B237BF3874F950FBC1EDE260763@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8171
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	37bb1d4e-c41a-4542-faf7-08de7442c2d1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|376014|82310400026|36860700013|35042699022|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4pOmlgRcYeKtMH8a3zQImi/HTQVNAyQ4YjTXz0VeMMc8O67H1Mdpm9AZD9L8?=
 =?us-ascii?Q?wpYOPDoWj0DRWqcqYlJbO6/vQy8Pq9rNW50ZVXTbgjSKgyhQhv3wceA+S9gh?=
 =?us-ascii?Q?10bnB1q5cfvSwqQyplhCDeJNFwM3o5znNC5p5Fy7T/KaYN3ZSYS7alwwPsdR?=
 =?us-ascii?Q?r1jqRJfohJMTRkWVqSq3RCjEw0dVXw+8bew/ffmObwuIx+IZW+bjD2TU3sBY?=
 =?us-ascii?Q?oVifMpCHxpRJQw+CbIL5gR2P64z81CaTjzsM3rSQNyY3j8umVwDroqXl/SrU?=
 =?us-ascii?Q?P9BgCN0K5ErBQv4FVX0nss0JV+rIMeC205pc9Q1QqRv5ed0OLL/Czsdu3PYL?=
 =?us-ascii?Q?OddKiK5mtB1iV1apBYbj+5S0h7Ad/jHlh0eTz01Hw02vvcHX9Y1KxXCJT1hL?=
 =?us-ascii?Q?l+8BUriBT5+GNh3kSJz0PyCqH2ZuIEQ3i5ec/AB2qp/2YgMymv02C5+sf3kR?=
 =?us-ascii?Q?O7/8lNOVcufBfJH0J8zyMazdoA2woAZ2xPxJW4kTc8LaAN6Lz34/020UvAyP?=
 =?us-ascii?Q?jMThm+Yl67p6RwFQj9N3hK5DjkSX4Mq2sy4v23rWvcR7Npo2XRmL3Ry3GF16?=
 =?us-ascii?Q?Zyc1loMOaSHCO8LEg63FeE8zIdZG8AYtLOQiBIagF2TnfWJU092GKM9VzpOq?=
 =?us-ascii?Q?M06oODFLN3db/0LmSsmrKehFDJkKzcwm8AgRZF+A6D8/NmzkfZSRHa/o+CuQ?=
 =?us-ascii?Q?mzT5cMfAK1YDyxmuoWyhroTytTp/aJVuOMHuMfMN9md3qbGzFxWQj8/cwPFR?=
 =?us-ascii?Q?AWBM1d3dgPips6u/AQULawMlKst+31NIa1kKAH/cH5DnjPFpN8GjwwAZYjIs?=
 =?us-ascii?Q?ucQQRXDxXDysflPHZBF94rhtimkVUwxwCuXZ+CRB3vQ//hglkLtv5E8sNQyG?=
 =?us-ascii?Q?6EGkU++C1FfS9AB3OWmTs+swuAHZ+7zsu3R/pnLFHmaIQ4dHn+tj0EaejM0w?=
 =?us-ascii?Q?/POVQFzSMqYl7WEfw8y5fdwCsqAMYz89ECaGACMV+byGdKNWi5axyWlwttzR?=
 =?us-ascii?Q?KraLEpRkd0ihIFRocT84mSoAqzP6QjD2ItGMNJ1q5G8K4CaYjSto83H6RF5G?=
 =?us-ascii?Q?Y8f7daGqfBC7fWQZSn04s87mQFrNoRV+fOUxo63aoIrC1VCWvBTkqF17Xd5G?=
 =?us-ascii?Q?xnX9ndY0lyQfej0JhLHgo3lUoqSCiw7o8h7ZdNlzdPYxtxCHhWu3Fg/n62kO?=
 =?us-ascii?Q?jrK0VYyJnccsFMNXzQ8dpURAgnAd/ZXegt5CUYUAlo0oNCNnLsT/44Cvzbtt?=
 =?us-ascii?Q?sVyk9ymlwc3/Pv7TvTJIplIFxjc2aatZ9p0qMbaGBivkdeoWHhk/fIxCWrgw?=
 =?us-ascii?Q?Ozs49FHqDhlQOjOeBjFOW89Z7nH9/D+ob4TQMwF5lTkCZ91HBLvNVAt+xqcV?=
 =?us-ascii?Q?sD63/U5uzDn7Uae5lwzpsTTTqnZmiKsSp5TlKs1K09a4SBDWd67Qbp5tQTJh?=
 =?us-ascii?Q?AvIRSsewVYdmZ1YyHuFbUEocySC+rLOmtd8X6/yw75dYiYFo3rTH1f2HW1Ho?=
 =?us-ascii?Q?HnYJsiBGmFsd6YUS4PHZLd1rtrf9A9VGT3c4e5rROWJkwwBF6wMEbcSZMcH8?=
 =?us-ascii?Q?xK1fJOAB/7cXKtR49WUBwiZn/fJcp9beEs2Q8SL8SKzkQx9NBf/3YvV6kWk4?=
 =?us-ascii?Q?gWiJBX8nmKKsqgD/o1BnettnocQYtMmj8HU4q5UNjvt+XQBS97R43AnCrvE0?=
 =?us-ascii?Q?tn8+2g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(82310400026)(36860700013)(35042699022)(7053199007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZL3Kn8qyYADVE7r2FTs+8/cKwY3TTIsYO9g8iaHEsJ+nonK8Qyd4mWWGzjHP4xROnXKbNu2YKWqR7EHt3QIBezhr7MUeZKyRXq5hbxHbiecXwxTMEAAePpoyV6qXiyNuxrh2n7/a0rFDR08m9MJxbDNbVwa4qHVtEP03eniU+sGCORtdJt6HN2HQBplE/uiKX8K1hiJJQnhtdD1JbE4CoTIfHbQfUKy/MiGaSLK0S+Z5E/FUf4lsdSSodef2UrdSXtMbDqEqHCnNis2ELKVNsoXyTDwGlkrwLGd8+hi1K4R0uNuAiu23Mrk93TsHbd2ekfPt78RVm4CIfDM9W4Vccg0aO0lqqKE1+uCX4O3iz8CO+q6G6I+mgvJxsl9a6SO5u8gKjPz1vhMf0u6/rKck4a1b+/AijYBzNr1s4t9p09zoWOyerxU+PYESU2KNJo6W
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 07:53:07.7390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e125ca01-86c8-4e39-dda0-08de7442ea29
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9399

Hi Parav,

> On 25 Feb 2026, at 05:58, Parav Pandit <parav@nvidia.com> wrote:
>
>
>> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Sent: 20 February 2026 02:10 PM
>>
>> Hi Parav,
>>
>>> On 13 Feb 2026, at 14:52, Parav Pandit <parav@nvidia.com> wrote:
>>>
>>> Hi Bill,
>>>
>>>> From: Bill Mills <bill.mills@linaro.org>
>>>> Sent: 26 January 2026 10:02 PM
>>>>
>>>> This series adds the virtio-msg transport layer.
>>>>
>>>> The individuals and organizations involved in this effort have had dif=
ficulty in
>>>> using the existing virtio-transports in various situations and desire =
to add one
>>>> more transport that performs its transport layer operations by sending=
 and
>>>> receiving messages.
>>>>
>>>> Implementations of virtio-msg will normally be done in multiple layers=
:
>>>> * common / device level
>>>> * bus level
>>>>
>>>> The common / device level defines the messages exchanged between the d=
river
>>>> and a device. This common part should lead to a common driver holding =
most
>>>> of the virtio specifics and can be shared by all virtio-msg bus implem=
entations.
>>>> The kernel implementation in [3] shows this separation. As with other =
transport
>>>> layers, virtio-msg should not require modifications to existing virtio=
 device
>>>> implementations (virtio-net, virtio-blk etc). The common / device leve=
l is the
>>>> main focus of this version of the patch series.
>>>>
>>>> The virtio-msg bus level implements the normal things a bus defines
>>>> (enumeration, dma operations, etc) but also implements the message sen=
d and
>>>> receive operations. A number of bus implementations are envisioned,
>>>> some of which will be reusable and general purpose. Other bus implemen=
tations
>>>> might be unique to a given situation, for example only used by a PCIe =
card
>>>> and its driver.
>>>>
>>>> The standard bus messages are an effort to avoid different bus impleme=
ntations
>>>> doing the same thing in different ways for no good reason. However the
>>>> different environments will require different things. Instead of tryin=
g to
>>>> anticipate all needs and provide something very abstract, we think
>>>> implementation specific messages will be needed at the bus level. Over=
 time,
>>>> if we see similar messages across multiple bus implementations, we wil=
l move to
>>>> standardize a bus level message for that.
>>>>
>>>
>>> I would review more, had first round of sparse review.
>>> Please find few comments/questions below.
>>>
>>> 1. device number should be 32-bit in struct virtio_msg_header.
>>> From SIOV_R2 experiences, we learnt that some uses have use case for mo=
re than 64k devices.
>>> Also mapping PCI BDF wont be enough in 16-bits considering domain field=
.
>>
>> That is a very interesting feedback, we will definitely take this into a=
ccount.
>> We will have to decide how big and I will answer that in Demi's mail as =
there might be some drawbacks with
>> having very big sizes for the device ID.
>>
> I am slowly catching up on the thread.
> There are two types of device id needed.
> One is UUID style to uniquely identify the device that may show up using =
two transports to the driver.
> With that a driver can create single virtio_device object, which is reach=
able via two different transports.
> This offers performance, resiliency.
> This is likely a bigger string which is not efficient to use during every=
 message transaction.
>
> Second one is: within a transport, a device id to identify the communicat=
ion.
> I was referring to this device id to be u32, so that transport can suppor=
t more than 64K devices.

We will increase the device number size to support more than 64k devices.
For the UUID part, I feel it should be something provided as device informa=
tion per device, so
we could add a non-mandatory field (nil-UUID when no ID available) and tran=
sfer that information
as part of GET_DEVICE_INFO.

>
>
>
>> In any case this point was raised by you, Peter and Demi and we will def=
initely handle it in v2.
>>
> Ok.
>
>>>
>>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data transfer.
>>> For example, a TCP stream wants to send 64KB of data + payload, needs m=
ore than 64KB data.
>>> Needs 32-bits.
>>
>> The point of the transport is not to transfer data, this should be done =
using virtqueues.
> How comes virtqueues live outside of the transport?
> I don't understand this at all.
> Transport is supposed to transport the descriptors and data also _of_ the=
 virtqueue.

virtqueues do not really live outside of the transport but are defined and =
used in the same way
as they are in PCI or MMIO. The transport provide ways to configure the vir=
tqueues but relies on
the fact that virtqueue content is available to both sides through DMA, sha=
red memory or any other
custom mean.

>
> For example you can see that proposal [1] is nearly complete that enables=
 virtio msg layer over various transports.
> This includes control operations and data operations both.
> Patch-4 defines the control operations (similar to this proposal)
> Patch-5 defines the binding of data operation with the specific underlyin=
g transports such as tcp, rdma etc.
>
> In your case, patch-5 would be for system specific bus such as FF-A or ot=
hers that others have acked for.
> But it must be documented somewhere.

Correct me if I'm wrong but this is centered on transfering virqueue conten=
t over messages and having
something that is network friendly. Even though some of the principles coul=
d be reused, I think the use
case is a bit different.

In our use cases we have remote memory access but what we cannot afford is =
trap-and-emulate to
access registers (MMIO or PCI) or a hardware specific solution (CCW) (for s=
cheduling issues and
performance reasons).

Now what could be done easily is extend the virtio-msg proposal with a solu=
tion to transfer virtqueues
over messages to and answer to this use case.

>
>
> [1] https://yhbt.net/lore/virtio-comment/20231023104647.290759-2-pizhenwe=
i@bytedance.com/
>
>> Transport is only there to allow access to registers, features and confi=
guration, the main transfers are to
>> be done using virtqueues and i would not expect a network driver to use =
MMIO registers to write network
>> packet payloads but to use virtqueues for that (as vsock or net is doing=
).
>>
> Very strange.
> If that is your intention, this transport thing must be renamed to contro=
l-transport to succinctly indicate its objective is for 'control operation'=
.

The proposal is following what PCI, MMIO and CCW transports are defining as=
 they do not mention how virtqueues data is transmitted.

>
>> So the msg_size here is just to fit transport specific requests.
>>
>>>
>>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMOVED (in=
stead of READY)
>>> But more below.
>>
>> Good point, we will check that to make this coherent with other transpor=
ts.
>>
> Ok.
>>>
>>> 4. I dont find the transport messages to read and write to the driver m=
emory supplied in VIRTIO_MSG_SET_VQUEUE addresses to operate
>> the virtqueues.
>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
>>
>> Equivalent of virtio_mem_read/write is provided by GET/SET CONFIG which =
allows you to access the configuration area.
>> So those are the equivalent of mem_read/write.
>> Does that answer your question ?
>>
> No. but I understood that what is proposed here is a partial proposal to =
have transport only for control operation.
> And data transfer implementation is undefined.

But configuration register read/write which is not going through virtqueues=
 is still covered.
Can you confirm and ack we do not need any new message added for mem_read/w=
rite ?

>
>>> Also, the queue notification message is missing at bus level.
>>
>> Queue notifications are provided by event_avail and event_used messages.
>>
> This does not make sense either.
> The operations that related towards the virtqueues should be part of the =
virtqueue operations.
>
> By not defining specific bus specific details, we don't seem to gain anyt=
hing significant.
> So while transport message are good, it needs to cover virtqueue data exc=
hanges too as previously proposed in [1].

Please see my previous answer and discussions with Demi for notifications h=
andling.

>
>>> But I dont think queue notification via message good idea anyway.
>>
>> As said in the spec, a bus can handle this using MSI or interrupts and g=
enerate the messages in the interface
>> between the bus and the transport. It is not an hard requirement to have=
 those done using messages transfered and
>> the bus can do what it wants, but it must inform the transport using a m=
essage.
>>
>>> We rather need a more higher-level message for virtqueues.
>>> Such as posting the descriptors to device. And this should translate in=
to a VIRTIO_MSG_DESC_SEND or bus specific binding.
>>> Without this msg transport is incomplete.
>>
>> I am not completely understanding what you mean here, are your concerns =
covered by the event messages ?
>>
> We need transport messages agnostic of the transport like patch-4 in [1].
> And transport binding defined for each bus of fabric like [2].
> So that message interface can support [1] as well by only extending the v=
irtqueue bindings.

I do think that we could easily support your use case of transfering the me=
ssages over network.
What is not covered by our proposal is definitely virtqueue data transfer b=
ut this could be easily
done as part of a bus implementation without impacting the transport itself=
.

>
>
>>>
>>> 5. msg_id to be renamed to msg_opcode, and token to be renamed to msg_i=
d as it identifies the msg (as written in the description) in
>>
>> We went back and forth on the naming, msg_id could be misunderstood as m=
essage opcode.
>> I guess we will have to find the best consensus here.
>>
> Ok.
>
>>>
>>> 6. Bus requirements ordering is too strict for implementing any perform=
ant data path as data response may not be in same order as request
>> for reads.
>>
>> This was pointed out in an other mail and i agree here.
>> I will investigate how we could make this a feature bit which i think co=
uld be a good solution.
>>
> Ok.
>>>
>>> 7. VIRTIO_MSG_SET_VQUEUE does not have bit field for individual address=
es.
>>
>> Set vqueue has an index to specify the virtqueue index but you have to s=
pecific all fields in one go that is true.
>> Do you need a solution where you could set some fields to a specific val=
ue to say "keep current" and only update part of the vqueue
>> configuration ?
>>
> I believe so, otherwise it cannot work with existing drivers without driv=
er side caching them.

I will investigate that possibility.

>
>>> This requires caching all the values on the driver side before sending =
the transport request.
>>> I think it is time for virtio spec to shift to virt queue create and de=
stroy model using the admin queue interface.
>>> and no need to bring this VIRTIO_MSG_SET_VQUEUE legacy to new transport=
 bindings.
>>> It may require more plumbing, but it is cleaner interface when a new tr=
ansport binding is created.
>>
>> Admin queue useable with the message transport but I would be interested=
 to understand exactly
>> the model you are referring to with create/destroy model.
>> Could you elaborate a bit so that i could understand what messages you w=
ould expect and how this would work ?
>>
> The suggestion is to not use SET_VQUEUE legacy.
> The suggestion is to use admin virtqueue to create queues and destroy que=
ues, as they are merely an object.
> And new transport like your proposal can adapt to the modern style.
> So only admin queue configuration would be the only message.
> Rest of the other queues can be created directly using the admin queue.

In a way, set vqueue message could be seen like that as it is a one time op=
eration.
In most cases, drivers are configuring a virtqueue in one go which is optim=
ized here
as we need only one message transfer.
If we include the proposal to also have an enable/disable directly in the m=
essage this
could allow for even less messages.

Using the admin solution on top of virtio message is something possible and=
 not prevented
by this solution.

In my mind we have an object here as you create/destroy queues in one go an=
d the fact
that a bus can transfer those requests asynchronously gives a solution equi=
valent to what
would be provided by admin vqueues.

>
> One can say it is orthogonal feature and I agree with that reasoning.
> The part that bothers me is that the new transport ends up adding some le=
gacy bits like set vqueue.

We still need to support legacy to have existing implementation working and=
 here we can optimize
them a bit by not transferring one message per field.

>
>>>
>>> 8. We should have the message response header for req-resp method with =
status code.
>>> (even though they are plain MMIO writes for pci).
>>> As opposed to that, proposed messages are doing composite tasks, hence =
we need the status response.
>>
>> You want an error code in the header, is that what you mean ?
> Yes, in the response header.

>
>> We went into this discussion while designing this, the main issue is tha=
t most drivers could not handle an
>> error as this is something not possible in MMIO or PCI so we decided ins=
tead to say that in case of error
>> a valid answer must be generated (all 0 when doing get_config for exampl=
e).
>>
> Well, what is proposed here is a generic transport for future to come.
> So even if driver does not handle error for MMIO/PCI register writes, tra=
nsport would have commands for future to come.
> So creating V1 structure in future just for the status wouldn't be useful=
.

We do handle that but the error transport is handled by the bus and is retu=
rned as an error code to
the transport (msg send returning an error number) instead of having an err=
or field in the message.

We felt this design was making things simpler and more compliant to existin=
g designs.

>
> For LOAD/STORE type of messages, driver can always ignore the error.
> The messages are used for bus discovery too which is outside of existing =
drivers scope.
> So status is useful there too.

I will keep that solution in mind to replace the current one but please con=
sider what I said upper and
confirm.

>
>
>>>
>>> 9. virtio stack cannot handle hotplug devices today, at least Linux.
>>> So if the intention is to fit into such a system, DEVICE_BUS_STATE_REMO=
VED will not be enough.
>>> A graceful method is needed.
>>
>> Hotplug could be handled, remove is more problematic in Linux (you could=
 declare a new device instance
>> at any time and this should work).
>>
>> Could you give more details on what a graceful method would need ?
>>
> Graceful would need a flow something like below.
> 1. Remove device request (sent by device side bus)
> Device continue to operate while the request is serviced
>
> 2. Driver acts on the request and unloads the driver/reset the device etc=
.
>
> 3. Driver (and device) eventually stops using the device by stopping all =
the bus activities.
>
> 4. Bus driver notifies to the device, it is safe to remove and remove req=
uest is completed.

This is a transport side handling possible depending on what the operating =
system provides as solutions to
handle things this way.

Here we have a generic message saying "this device is out" which leaves spa=
ce to handle this gracefully on
top and this can happen in lots of cases where the device is offline withou=
t it doing it knowingly (crash, power
down, you name it).

In a graceful scenario i would expect the driver to ask the device to power=
 down through some device specific
means which would result in the DEVICE_BUS_STATE_REMOVED messages being sen=
t once it has turn
itself off ending in your scenario.

Do you agree or did i miss something ?

Cheers
Bertrand

>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
