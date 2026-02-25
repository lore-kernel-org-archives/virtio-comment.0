Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2295037E314
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 10:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.42
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772015815; cv=fail; b=vGJFvfhsJvh6bIm6+EaOg4J5G29bRP21jqYPLRf1CIvZjfAgpSgGFn0nAIxjcxK4Yxtb3ydhxgAt6/gcf5a8hqhwDAOXNyRkqpzcd7JiDu+HBq4weppjGslCKzhlIC6v0Lr/SaGkI4hw4Df0z3cS+sli9pfoQCj+k/glC9nZnbo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772015815; c=relaxed/simple;
	bh=XPbF+035yQbARND5jNjoBzuWq72F6Po1lVgVkeTRYxc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kj0qMEF67byzQSHri4qb1DyX7/QJEr1pH8trqF3PVNXd1xhWURxOGRzTIydMTTKX/vwJh9j3Fv9zPSLBNuqbR5XTCHXfiZaUiqo5rpEVBz4WZ52352Tl+vaPco0MagNUnAGPS1DqvPmbkVhZ2BBrsspo8m/Wh6FHT/Pf80bdZOM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Vf/sid3g; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Vf/sid3g; arc=fail smtp.client-ip=52.101.65.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Vf/sid3g";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Vf/sid3g"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Qev6DJSkNmVz/+/JMd85bsIKDOG+m/jCDZSW+26aaXcq39ey86BWuSfWZ8XIKfnWA+xp8adeJQrDPDHcCB5TCxqw38JPchFdOqSOPEGniIaaBozor6d+8v1BKbfr8kI2NkXqmrZGoq2kC+ejudIESt416maGhFemxu91bRPLETKRxJZBx/799GiMVkvvDUySKPVPxfOKw9lt0i4Wtgu933OOWsfBx1BTnZ7Yrj2bAC5kMIzF9E73fV48W1qUf9WXY13BjHgbOYXGeG/WPuW8X+DNdmhx0oLvisFjqk64AYYg3dTaC9ipoSt0s6w8mrDfPVbr3zpjMQzMj6V9elYESA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPbF+035yQbARND5jNjoBzuWq72F6Po1lVgVkeTRYxc=;
 b=ME9mDnS0UqGYplMfoySa3Jv11wzpdSWGZZFyl2rW/NRvNVOY+4bY1iquT2Kn+xGuUJ3S7Yccxx2KlUaf02yyaG/Q6TmZUt/rKgCYVU9dh7TYYHNjNkpG8Is7tl5cA37E8Bh9HCShVBki952tOQNKl2W++9iNWjMI9J6bv3bPmckDauXs1hwFkkCS+C9piN+BwEwrWKPn39cW/9+EkhHBjLgSDRIc/i1kZ09s8MvKUbqvjcqiaQIj3OYvAHNc0KKBQ1RubJ5uewjia+ccBJhWDQXzwgUPCt1gaJ7i3ESpGTvs4EYWQlvuPttwq+m6tP9hqfDsXnGhesxZ4bjIs2AAwQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPbF+035yQbARND5jNjoBzuWq72F6Po1lVgVkeTRYxc=;
 b=Vf/sid3gM0nybC/DtXRNYwmAsX29cxYTHtilA7my/vNhapSrTdEwdj4B6A7DsWX5+gn+wrliFgK5IGlu9xG+d6kn4oJhojIvCI5EeTEM6ViPLsYXcnplwMBSdXU6/SfuSEyigEPFC/eLysyUkkuWl71bcYO5HeZZIj3Oxn/TGUA=
Received: from DU7P194CA0006.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::15)
 by GV1PR08MB11165.eurprd08.prod.outlook.com (2603:10a6:150:1f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 10:36:45 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::e1) by DU7P194CA0006.outlook.office365.com
 (2603:10a6:10:553::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 10:36:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 10:36:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFyYxmYBGKbxkbrlp7YTBS4VSQJeCnz0YBOMDckk2KuUwlVNhR+ymi+TcCtFvtrwqXU6hBezWC+dSJOQkTMohbNkZYk9flLVx2OSQkSG2SBSBdxRSHF+ThKuX3cZSFWoaQqBQaN5qZZGrYEXCwPoiBhjfXNljh9302eP34X3Qvai/+odJ+yzh+7kqea7QlHQOiI+1HiDwBem7iFJ/nvhh3SYZ/PRmeUFP9kDkyOHfJkW29ecY92rQ1aWGJeVwexTXE08W7oXrubPqnG8iVj3PbmWkQLwnWRINneoUACI1UaGM7iAqLHQlWd8qwSTTCGt6cY1GPzrEqhtC1ZpO69kNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPbF+035yQbARND5jNjoBzuWq72F6Po1lVgVkeTRYxc=;
 b=qniofLfHYYjvq6TwmmevwpPUuDeeuC+gbAo9pfBIPRFbFET3fbTOdGc3NzFWyDChyriwJIdkj/0zB3fspsTLieqkfpgegflE7OImk2hWURSkJi2+JM+U77GM5F2Grm20bsKJJTyA1llzsqXQnVo3zTSjpVo0Smm14b2Qq+Qnt4+pJynWi4swx/kiqbtQaJN/f5K+x3gKfIRTnwiA8SZqNXaU12dXHeBaju5OhwZ7OS7pJwX5vWK+Z3uV9womV7g8hitYQeWSTL0GMbFPkDMQnJRhjom5/10ewNAt9kxAENyueNAkJwMOTDt/4LBoa6WJvNhk3ZeOc3ppJrSzuEsLRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPbF+035yQbARND5jNjoBzuWq72F6Po1lVgVkeTRYxc=;
 b=Vf/sid3gM0nybC/DtXRNYwmAsX29cxYTHtilA7my/vNhapSrTdEwdj4B6A7DsWX5+gn+wrliFgK5IGlu9xG+d6kn4oJhojIvCI5EeTEM6ViPLsYXcnplwMBSdXU6/SfuSEyigEPFC/eLysyUkkuWl71bcYO5HeZZIj3Oxn/TGUA=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 25 Feb
 2026 10:35:41 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 10:35:41 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Parav Pandit <parav@nvidia.com>
CC: Manivannan Sadhasivam <mani@kernel.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAGnugIAALveAgAfGPgCAAAUZgIAAIl0AgAAFBQCAAAMOAA==
Date: Wed, 25 Feb 2026 10:35:41 +0000
Message-ID: <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
In-Reply-To:
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AM7PR08MB5494:EE_|DB1PEPF00039233:EE_|GV1PR08MB11165:EE_
X-MS-Office365-Filtering-Correlation-Id: deaca138-3b32-4917-96fd-08de7459c5d3
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 lqijH/N1uAGhCw26osi8Vg5G7q4X0pVkvTE5ERolpdG8HPt1YFld+kCxajP9yfAF7tYF5/Cy+3dhS37Df5SvR8Wp8oCYa+7zMhwvUFyNuMMeVb7RrnosK+A2D7pdsQcY05HvL2i0/+jIlgkIr11myoydH1SBVE2yQzI9wvYCGeQt66l+jLPyFuZWPBeSNUgk7aNX/o8uSOxZ7Z6XMdpjgO9OSQmeJjXhiuzeEK7Q/j4rERoVS68hPvLaSsEOnQJ7pfHtA5dnK64e2fdv85uKE365NDHwXnC0PWqT6lKBav24hro5qMTDiw4zdnkOd4PRFcUkEuLra2uTB7GiqsBNRTJPEs3z2NRO57TeQ3nAhcMMFSjP22C7+x86BhueLF9F65s4v6uhTNyvugKaw/j+w4DthwzA50nQ2yOpt7OsucIsXmNL1jDDsHgB+6VR4agLv+/mMDXlXPon9TRqqDpvxLk4zvzXq9K5MXA5U5g1zkOddTV03O5Gs7LQ/YnugwjjvC2so4DPDpJzvhM2GdCKgTW7KQl2W944q40YdFVWcrRhGegeCSXppPANo0xOmT9ixbW+zQL1LOA6HYloOyYp3l8RuIyiAzATXhZ4Uh4Gxlclw4fWgqFq00kNDtpjAT+9PeS9NdZylp5BtjZlV+34k/svmeQuxzYHvu35EpVSRnK0ze8f96hZNrTy621vnPr0BWPwfNVOonV7EPCU75HiGrufo592IVl0/zXrfBnycUpVu84KviKwEhTQcz9HqZK8nO2+Z9P3AQNS3hpiRlAdgg1OZzZS/VRojTI3V0dX3JA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EAFD0D22D9A8014C86531851C874B9E9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2a686f61-7383-4996-5f48-08de74599fa4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|14060799003|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	aOXbePf91YiJjBKEZsc0fi5Qt5N8E1Ny9IkXJ4UEKLTmocaQoPmq1fZ3MMXNBWfidzQL1uJHs7/0a/4sIc8X6lu1fQ9ZZ54YhBrttB0WE9pQcU90PH2iPM9nAVuVqQXZjUZTeepbL7QFaVhl2A4PzQpKKiAb0Ymk2qhIOKNHSIUdBNXeaeXmf911nKdoaWcI28P7RebIHa04LT88/tSEahb4y61vlEpfYrfFf5ME6I9dHkSXN9kEsXJKfMPGnmAcNXRzTOfBtQteMC/Jxk58lIHyPTg4yqxTH3Z1bvRSLmxHZ41bb86rTPJqrZ3zwuIMyzbpd61FoE6PSI1zh1L0/j+ico2h3zelxx/43fi1ilK0V0bjcdSAWxIHWGlVLZxcy1nBcwBAbIKpiDCjDReSWYEMFh53KXJ34jJCobFQ5+3unv187r27xBibMRgBpicoWtiTu7D+KDLMXhMi9t2HmxR9YAsPgECXEJ1/XKbtJ6to90DpCfhOqjrOqBaVRtYNoKpdakJtoMz7m4MIa5NyfM0vagOH5FKXFEHvv41/tIEBCdMXJvKXhAjS2dg2vS1oNKfbpV63B9rCjC0gSP1HaNng8dA0bdoZtTkR7wkxDRMJ0dXhUxz7u00V0fib1gNTDuKKp27FVm7Fn9Jn8ev4Qu15oUrU/wHPzMQf7VZTw3rCVpGz8iPGfwQwPbV5TYacMm2+rNUF8D5IIXjCn1layCPb2wcYXjCseDXsTJviV5GQzzOg6Au3nSk7SxK1Fm+0ugK0NsV3sxKUJY3TiIYR9wwuS+hm322pSbzdRMNYt/IbSEF+wTTO2B3zA9Chh1jKNqAO3sVQGzAL4aiyuXj0Nw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(14060799003)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qj745FYij1PCLRw+G5M55xdG3fDGXJo3EYv5TzkKunlH/6+II/ghrEVCT+JUGqnT6PQWeoBbDB42FnoBwp2SEpxqBoZI9/JtcWhPpvm3LMPWrGiZi2L8hNxDaCYprwzC5WE/N4xAiDGQbYnch3fqqOm76gpMAW2AinD+7x9Po6UiNxe73kKmjQ0T+aarTk5hVFnZWFE8G0Q5wQKOr2CL94HxUljogrW4Uj01HJF5lX5oH5fc8+MWU98LsSV1fSL9GL2iKpplE84Yz6I7hiVtkSqw08AsFjWrhuxYwCCgB1ocurKRARtPKN0hmnkaJyiJ+kf5AONPOszCOJtRBgYf4nGUSYrILIg+5Yu/4Ccd7I4KcEicPOjpP5uJOZweOGnH2qyu5F9+Q6SCMscIRxMSlWzmpYhzvbHggUYhyw0JhAzqa1gfoweUBDZ5aLI6Y6UA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:36:45.1918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deaca138-3b32-4917-96fd-08de7459c5d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11165

Hi Parav,

> On 25 Feb 2026, at 11:24, Parav Pandit <parav@nvidia.com> wrote:
>
>>
>> From: Manivannan Sadhasivam <mani@kernel.org>
>> Sent: 25 February 2026 03:37 PM
>>
>> On Wed, Feb 25, 2026 at 08:03:48AM +0000, Bertrand Marquis wrote:
>>> Hi Manivannan,
>>>
>>>> On 25 Feb 2026, at 08:45, Manivannan Sadhasivam <mani@kernel.org> wrot=
e:
>>>>
>>>> Hi Bertrand,
>>>>
>>>> On Fri, Feb 20, 2026 at 09:02:12AM +0000, Bertrand Marquis wrote:
>>>>> Hi Parav,
>>>>>
>>>>>> On 20 Feb 2026, at 07:13, Parav Pandit <parav@nvidia.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>> Sent: 20 February 2026 05:25 AM
>>>>>>>
>>>>>>> On Fri, Feb 13, 2026 at 01:52:06PM +0000, Parav Pandit wrote:
>>>>>>>> Hi Bill,
>>>>>>>>
>>>>>>>>> From: Bill Mills <bill.mills@linaro.org>
>>>>>>>>> Sent: 26 January 2026 10:02 PM
>>>>>>>>>
>>>>>>>>> This series adds the virtio-msg transport layer.
>>>>>>>>>
>>>>>>>>> The individuals and organizations involved in this effort have ha=
d difficulty in
>>>>>>>>> using the existing virtio-transports in various situations and de=
sire to add one
>>>>>>>>> more transport that performs its transport layer operations by se=
nding and
>>>>>>>>> receiving messages.
>>>>>>>>>
>>>>>>>>> Implementations of virtio-msg will normally be done in multiple l=
ayers:
>>>>>>>>> * common / device level
>>>>>>>>> * bus level
>>>>>>>>>
>>>>>>>>> The common / device level defines the messages exchanged between =
the driver
>>>>>>>>> and a device. This common part should lead to a common driver hol=
ding most
>>>>>>>>> of the virtio specifics and can be shared by all virtio-msg bus i=
mplementations.
>>>>>>>>> The kernel implementation in [3] shows this separation. As with o=
ther transport
>>>>>>>>> layers, virtio-msg should not require modifications to existing v=
irtio device
>>>>>>>>> implementations (virtio-net, virtio-blk etc). The common / device=
 level is the
>>>>>>>>> main focus of this version of the patch series.
>>>>>>>>>
>>>>>>>>> The virtio-msg bus level implements the normal things a bus defin=
es
>>>>>>>>> (enumeration, dma operations, etc) but also implements the messag=
e send and
>>>>>>>>> receive operations. A number of bus implementations are envisione=
d,
>>>>>>>>> some of which will be reusable and general purpose. Other bus imp=
lementations
>>>>>>>>> might be unique to a given situation, for example only used by a =
PCIe card
>>>>>>>>> and its driver.
>>>>>>>>>
>>>>>>>>> The standard bus messages are an effort to avoid different bus im=
plementations
>>>>>>>>> doing the same thing in different ways for no good reason. Howeve=
r the
>>>>>>>>> different environments will require different things. Instead of =
trying to
>>>>>>>>> anticipate all needs and provide something very abstract, we thin=
k
>>>>>>>>> implementation specific messages will be needed at the bus level.=
 Over time,
>>>>>>>>> if we see similar messages across multiple bus implementations, w=
e will move to
>>>>>>>>> standardize a bus level message for that.
>>>>>>>>>
>>>>>>>>
>>>>>>>> I would review more, had first round of sparse review.
>>>>>>>> Please find few comments/questions below.
>>>>>>>
>>>>>>> I'd like to comment that I think it makes sense to have a basic sim=
ple transport and
>>>>>>> then add performance features on top as appropriate.
>>>>>> Sounds good. Simple but complete is needed.
>>>>>
>>>>> Agree.
>>>>>
>>>>>>
>>>>>>> So one way to address some of these comments is to show how
>>>>>>> they can be addressed with a feature bit down the road.
>>>>>>>
>>>>>>>
>>>>>>>> 1. device number should be 32-bit in struct virtio_msg_header.
>>>>>>>>> From SIOV_R2 experiences, we learnt that some uses have use case =
for more than 64k devices.
>>>>>>>> Also mapping PCI BDF wont be enough in 16-bits considering domain =
field.
>>>>>>>>
>>>>>>>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data trans=
fer.
>>>>>>>> For example, a TCP stream wants to send 64KB of data + payload, ne=
eds more than 64KB data.
>>>>>>>> Needs 32-bits.
>>>>>>>>
>>>>>>>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMOVE=
D (instead of READY)
>>>>>>>> But more below.
>>>>>>>>
>>>>>>>> 4. I dont find the transport messages to read and write to the dri=
ver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to
>> operate
>>>>>>> the virtqueues.
>>>>>>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and respons=
e?
>>>>>>>
>>>>>>> surely this can be an optional transport feature bit.
>>>>>>>
>>>>>> How is this optional?
>>>>>
>>>>> As said in a previous mail, we have messages already for that.
>>>>> Please confirm if that answer your question.
>>>>>
>>>>>> How can one implement a transport without defining the basic data tr=
ansfer semantics?
>>>>>
>>>>> We did a lot of experiments and we are feature equivalent to PCI, MMI=
O or Channel I/O.
>>>>> If anything is missing, we are more than happy to discuss it and solv=
e the issue.
>>>>>
>>>>
>>>> I'd love to have this transport over PCI because it addresses the shor=
tcomings
>>>> of the existing PCI transport which just assumes that every config spa=
ce access\
>>>> is trap and emulate.
>>>
>>> Agree and AMD did exactly that in their demonstrator.
>>> I will give you answers here as i know them but Edgar will probably giv=
e you more
>>> details (and probably fix my mistakes).
>>>
>>>>
>>>> But that being said, I somewhat agree with Parav that we should define=
 the bus
>>>> implementations in the spec to avoid fixing the ABI in the implementat=
ions. For
>>>> instance, if we try to use this transport over PCI, we've got question=
s like:
>>>>
>>>> 1. How the device should be bind to the virtio-msg-pci bus driver and =
not with
>>>> the existing virtio-pci driver? Should it use a new Vendor ID or Sub-I=
Ds?
>>>
>>> One bus is appearing as one pci device with its own Vendor ID,
>>>
>>
>> What should be the 'own Vendor ID' here?
>>
>> The existing virtio-pci driver binds to all devices with the Vendor ID o=
f
>> PCI_VENDOR_ID_REDHAT_QUMRANET. So are you expecting the Vendors to use t=
heir own
>> VID for exposing the Virtio devices? That would mean, the drivers on the=
 host
>> need update as well, which will not scale.
>>
>> It would be good if the existing virtio-pci devices can use this new tra=
nsport
>> with only device side modifications.
>>
>>>>
>>>> 2. How the Virtio messages should be transferred? Is it through endpoi=
nt config
>>>> space or through some other means?
>>>
>>> The virtio messages are transfered using FIFOs stored in the BAR of the=
 PCI
>>> device (ending up being memory shared between both sides)
>>>
>>
>> What should be the BAR number and size?
>>
>>>>
>>>> 3. How the notification be delivered from the device to the host? Thro=
ugh
>>>> INT-X/MSI/MSI-X or even polling?
>>>
>>> Notifications are delivered through MSI.
>>>
>>
>> So no INT-X or MSI-X? Why so?
>>
>> Anyhow, my objective is not to get answers for my above questions here i=
n this
>> thread, but to state the reality that it would be hard for us to make us=
e of
>> this new transport without defining the bus implementation.
>>
> +1 to most of the points that Manivannan explained.
>
> The whole new definition of message layer for the PCI does not make any s=
ense at all where expectation for the device is to build yet another interf=
ace for _Everything_ that already exists.
> and device is still have to implement all the existing things because the=
 device does not know which driver will operate.
>
> And that too some register based inefficient interface.
> Just to reset the device one needs to fully setup the new message interfa=
ce but device still have to be working.
> That defeats the whole purpose of reset_1 and reset_2 in the device.
>
> This does not bring anything better for the PCI devices at all.
>
> A transport binding should be defined for the bus binding.
> A bus that chooses a msg interface should be listed that way and bus choo=
se inline messages can continue the way they are.
>
> If we are creating something brand-new, for PCI the only thing needed is:
> 1. Reset the device
> 2. Create an admin virtqueue
> 3. Transport everything needed through this virtqueue including features,=
 configs, control.
>
> And this will work for any other bus or msg based too given only contract=
 needed is to creating the aq.

I think you misunderstood a bit the point of virtio-msg bus over PCI so let=
 me try to explain.

You see one PCI device (regular, not virtio) which is a "virtio-msg bus ove=
r PCI".

When the virtio-msg bus over PCI it will communicate through this device wi=
th an external
system connected through the PCI bus.
The driver will enumerate virtio devices available behind this bus and regi=
ster them so that
the corresponding virtio drivers are probed for them.
All virtio-msg messages required to communicate with those devices will be =
transferred through
a FIFO stored in the BAR of the pci device and standard PCI DMA will be use=
d to share the
virtqueues with all the devices on the bus.

So the PCI device is not one virtio device but one bus behind which there c=
an be many devices.

Is this making the concept a bit clearer ?

Cheers
Bertrand


>
>>>>
>>>> And these are just a few questions that comes to the top of my head. T=
here could
>>>> be plenty more.
>>>>
>>>> How can we expect all the virtio-msg bus implementations to adhere to =
the same
>>>> format so that the interoperability offered by the Virtio spec is guar=
anteed?
>>>
>>> We spent a lot of time thinking on that (this started around 2 years ag=
o) and we
>>> discussed several use cases and did some PoC to try to have everything =
covered
>>> (secure to non secure and vm to vm using ffa, system to system over PCI=
 or hardware
>>> messaging system, PCI, Xen specific implementation) to check the needs =
and try to
>>> cover as much as we can.
>>>
>>> Now there might be cases we missed but we think that having a purely me=
ssage based
>>> interface between the bus and the transport and split responsibilities =
the way we did
>>> is allowing lots of different bus implementations without affecting the=
 transport and
>>> driver/device implementations on top.
>>>
>>> We identified that a common use case will be for the bus to transfer me=
ssages using
>>> FIFOs to optimize speed (at the end you need to have a way to share mem=
ory between
>>> both sides so why not using a part of it to transfer the messages to an=
d reduce the number
>>> of data exchanges and copies) and this will be used by PCI, Xen, FF-A a=
nd others in
>>> practice (so we might standardize the FIFO format in the future to allo=
w even more code
>>> reuse between busses).
>>>
>>
>> Not just the FIFO format, but how that FIFO gets shared between the devi=
ce and
>> the host also needs to be documented. Maybe for this initial transport v=
ersion,
>> you can start with defining the FF-A bus implementation?


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
