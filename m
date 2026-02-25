Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1103B95FA
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.55
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026218; cv=fail; b=OIHkaf3kNbEojPDDwgTzGPVHuNawBSnq/QYFJt3gIfIxNZjQJ8YiCbtiqD/c4ZNT4mR9zUMeuVkqJECP7Mhy3hX1gCo9OVTAQCDqh2hZcOgMky/Une8tAjQJoBPxf470Lg+YqR14unrpnc6KJ3pAMst2/JqcD9GP3vgMTe/4LLM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026218; c=relaxed/simple;
	bh=b4QPH880X9q+zGfoAFnq34gLUSF5aJQimPDyd8Ynag0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HaFANjR4Jy8VfwpHPStCqlY6GDIy5m4A/i41/o8bvwY6/gcuNRipJClzUokToGXo+nugGj50dnTLhRt08hIU/UPCA7C0EBdU1JqRYxGZChNl5miWmqxp98m1QjDyQCNfWs+w/lvqNSSAuIsybufBUDx4aZqRux9ULAvpQuNo1YY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=miA17d2b; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=miA17d2b; arc=fail smtp.client-ip=52.101.70.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="miA17d2b";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="miA17d2b"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qtOETv6R6qXlAPxu7Fjm660Jh+8BDAOmILSwL1BWOnwXBG3TQXAyt/cxxilvwyvWhlUQjOusd49hBSrIqt03KNvOtgdC/SjUuRgH8ZNZDo/u2ws7iSCHU3MfGP0lGa8bmxl3FqVEGoBLSQZ1w7ZnFdWmSUhMAnKDDE5qHywl2xVr8BWXonxb0LwxP+cSgUVLXxUSMIc4d7cfcOYJCR+uypVgg+Hex9Ps1DiyiqE8xrMHDBeczW7mCcaAKlPGlnyix8wePabMmjAz1bHTzQCYfXK2cHj2TUoGg5crqg6sXpgaSlPiXCGoW+SXWKR2bUwhbCg2Yido4ycYoA/uyhegFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbIAT2cz5rqStEKxrP8frDmr5+dvC68y39uyFk/nD+E=;
 b=jfEe/+m0+rK7lTLCZIZBCO5VA+vhqkBL+Tv23xhuNrDjnMOZEMFlrTUfrtjgPfqylqQslwws/DjxWr2RW8bSLJJOjXTSqqeMxLF+kERi83+VAKxJrQwMaPRgusulr39u77rIS+OETIe++mkwfkK1Ne2Rp3I9XP5JAegnqMBcZvBf6WQTajrFALuGbKy/W8ownJ0xKAte07F5r6nM/xNdfr2XOkzhRAwt21MiVQ4nRptEHxk8GYvJMrvLdcvHaWC91Sogx4NmOOg+T3NWf90/b4nv8OZQXWEWCDyq/RJfPlMyc2LIu9cB/mJuBn3ms3GqkFdVvSog5GZHJWht4ez1wQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbIAT2cz5rqStEKxrP8frDmr5+dvC68y39uyFk/nD+E=;
 b=miA17d2blg50B0i/je2cmwHqfFNbIMeujv4zNri/2kdKUZ7F6NJOAdr0y2quzGOKdmpOO1YKYmaP/JP+Mamn+/ONyLobqw+TJoEq45xhpkYlG09faqQP7RGv69HysmQPwW7acIPfK3u0taEmNNxvOJ+CKH5LBnv9efQHVlO72OI=
Received: from DU7P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::33)
 by DB9PR08MB8203.eurprd08.prod.outlook.com (2603:10a6:10:39e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 13:30:05 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::78) by DU7P191CA0019.outlook.office365.com
 (2603:10a6:10:54e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 13:30:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12 via
 Frontend Transport; Wed, 25 Feb 2026 13:30:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zV1xG+mg4lLs1zRD6t0JxC5hrhzzf+zUH0ZVClszz3TCfSIcppEYk7JuNcLi6rjRpc3kefkIQEePozgOFU8VuEt9uiiISgwwR7o7+4HMw+7jxqLZCRfk/55uH6enPxHr+fljI/XiHIH4CmXFpXDtppp6tOj1p+crTZBWq5ydW2YanTXHgDbJXiiS5hBD71op/WZqbSop22hWqTBXATM1HJv0FYP+vV2T3LlnOszIrx79AuHFOJ7OiVLNpEWRPrYdU/PrtNf8+06NtyZ/NtI6CG5U6nAaNxlFP7GrQrQAzW5Mipw/GMSKHTM3BTo4FsIZYHbnCRos2dxVBb45YJ3QzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbIAT2cz5rqStEKxrP8frDmr5+dvC68y39uyFk/nD+E=;
 b=BjXcGLBB2/8K/FkU3OByW/IBsOl+19r5yqEVjRs9oNZLqmHqxvNbkzdF+CSzmgnZyEIiUxRcJCgVF4SajoxNTrsbEZVRgdnMRQ5JUOaWIoaO2Pkp7tQaECoQAZHoKGhTkH0PNvcU9BbYOpim/93pBTEe2TkN9LQ2T+iLPANkD/qLJ1Irw3bnjlM2Zv/KrubvkWoSimV7ww10t4KPQZk5rvndYfMHxmB4pYqPIPZJ2jkoyY26xxN1ZlVNXFK4STOeH/AbFce4mrsZXFuudjK38pc8x1sN5t14F78gbfftGgMPjKDimANdv0NdC5ft1cbZ8YNmBcwR22Jj9YqPj9E0Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbIAT2cz5rqStEKxrP8frDmr5+dvC68y39uyFk/nD+E=;
 b=miA17d2blg50B0i/je2cmwHqfFNbIMeujv4zNri/2kdKUZ7F6NJOAdr0y2quzGOKdmpOO1YKYmaP/JP+Mamn+/ONyLobqw+TJoEq45xhpkYlG09faqQP7RGv69HysmQPwW7acIPfK3u0taEmNNxvOJ+CKH5LBnv9efQHVlO72OI=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB10345.eurprd08.prod.outlook.com (2603:10a6:20b:57d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 13:29:00 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 13:29:00 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: Manivannan Sadhasivam <mani@kernel.org>, Parav Pandit <parav@nvidia.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAGnugIAALveAgAfGPgCAAFYhAIAABF4AgAAA04CAAASkAA==
Date: Wed, 25 Feb 2026 13:29:00 +0000
Message-ID: <26A32972-A227-44B6-BC71-C278239A4A96@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <71d106ec-a4b3-4382-8044-001def36027e@gmail.com>
 <tfpemcac7vkfaw6omv64pilbtdvdehiduwvd4mgdxsrusskftt@jpnczfiakaxv>
 <da9a832c-fedf-42c9-92f7-fa3e323764eb@gmail.com>
In-Reply-To: <da9a832c-fedf-42c9-92f7-fa3e323764eb@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB10345:EE_|DU6PEPF0000A7E0:EE_|DB9PR08MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 88a8d513-da7d-4fbe-ae90-08de7471fc8e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 FB/vgf3F6IQ8LvDOuzhWDWOhaBm/Roqryg3BC36/Wm/4XK0Pbuv4dOuDKTluVED7gkoFh6flnlzsViFmn7Ezrq0iE1UrR1mSx9auOLRMUa/nGGY6ubj+br73rfG5Q0xNjCS65i+dwKAvz/jeAU24ZGyupjMiH5eeSz8NTNwRlbNjN51JRf34bfY7CJL6Kg+j56IIijovDKiV/VS/vipAZXscdB4ObB7o/7EHgNYOV9HdPZpnrZNytmRl/+QvksV/L/n6/N2YK44WGb1wuf4qA/RPpHqRKSu7Iwp9Mt2Xad0/WEYAnDJy1jkLdigDU+2VsCGwEI5dCO8hO3OzbAckAvHJ2pMz7UaYs/tBkEt3iXQ4KFVIcyClkm1pAkcf4BJ9YH6lEjHXgeEp/6PhcbxoY5qfs1qs2NiiL1tNX9IzN3bfglnxn9MuEABQ8FjEBZpN31/p0dQp17ElZBUyalsnUU6EL2hMSYqLGf4e9z3yhTzyQCuEm5w1++U2jjJnJhhuU5zUuDYC9ibwbJNkdb5bsGVZ7BfOjmxFGKtXRJSPBSb1zTzifxInSvZzXK4723TjJ1ke/eImmfXhfgQ0vrHsUjO2GjSEWYvQ7lyxK/NLTSEaoi4CVxvclBNysovdhIbDnnQiq1xTRA9fBI8k+JFc74WY+a3PH2Mte1a/YAA491nbFvWD/O1zT9GtnaCmrLzHtFHluNfQwyPDTlUdaKiUzr1reEs9DcDb2xmSm4F4mwJlzltosrNIK/aXmXwiUQJ5FnFM7hR61LvKq13AhDJ4PtZ7YvuXlBW5hQWjL+Plce8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9BFE439A0877EF4D8497C3EB3F6CDBFA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10345
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea15f382-ef9d-4629-d066-08de7471d649
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|7416014|35042699022|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	vDVHAUao8Sr0/F/9KPZLVmCL6eqyyjkHFMXcFGR8DqrHBq3u4d3PwUjrh5AV++kgk4ty+4JA8O08Nvkn0W9whm7fkWua69TED2xJvV3Kb1GI+HXOJGQMi5r18beNt/dI/kunj9oWr7oZIfE09g+S0uWmTQvNE3A/FN9BPTFN8aGppNuzd/cU/pnFzMRd5x93KI/il2V+6hYk1mljAJQlpb5aDbdnt7MseDIp3h+gx5K14x5GL9iU4W0qRyRYwDxR790r32NxcvIBOADECBOtFjM11ZkAOrNYGZHbeB5Yuu03V09nn9tUGdRlox0yrLxR+Bwofw60rd3fLTzF5UWDAzPK0csuhTBkmuml5XreagGm/wxDIo8Z26YNaEUcgMVtiEDRByNheGuA0z0zZjS0QmOAk8oIUV/hcqlARC0kO7mZB8iXzjYyCqZB7mmy7fq9ASfMRVVX8BvTOKFYPoXr3fbWRzBkawIXpi53tcBxSLYBZLUsdkth4gx8vXiJOYPNqwcxrV0lCNi0gL69P4DDgdwCZfYseVHxW6nGZMhPdnphbCrJyEnqM3eOKIDDo4ho7n7ERhVb4vONKaXL4FQNeuYovf2XLdxQVu9mk7ArWD4zfsWIxG4RoyJE/LnyhtnjrhzFuNFlpw/Yb2B8dLtKtgU5NgYRwAUmA8LkRdILxAoodly6s6v9pXId1iBcwLOZGY/IWCfv6TjoFQtDWb1Od89dh2q4owXi6ae6k2tbCPwkJB0QXc2iZTddpf2njvKNfo736KrtyzH3RyPScZtXy6+l7YmQqu0whviEI5fymANo4v+avMGutM8oQYPolzRdOXcHvdI8z4Zh8UmOGErSrw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(7416014)(35042699022)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NFs7tQgWZ31q0W+f4JPveImNqyAyTI6I+WY0dTxcSOJy7orRJhNHAhwoYB04Q8dN6UipWQ3XBevOpoqCF/f9/U+RD1XNZgVndgY1TBBgVR0LBVfye/GTwhWizvagoLZWjjrGjhSRcH4oLcIjEgF5SLyD3Zv9CHxam58suTEYMiS4z2hM7X4oAKXQZmxW4c1hFqWRXtztxrmhzmbt+LnFiDjYmoY0kR6Z78IsSmzIHxbYePbJfaJvFYECYDXcUDAdF8kLCiOJ1k71YtwY9N+G1vZYsSHgkDhb4r9eOYHlLr1ePYqnErTLfL/9Ll+XWqDaf/TvPMQZKK1eBXZmDttNVaUQm6VM06gMoqVck2VfPAvb7O3RXN4qoY2om7yl6WLiC5ELB7eCmUwwsq/hXBpNlqD1Qbglc3FaXvydQiCTCIXMadmJgfM46qeJyVgSC0bP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:30:04.9548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a8d513-da7d-4fbe-ae90-08de7471fc8e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8203

Hi Demi,

> On 25 Feb 2026, at 14:12, Demi Marie Obenour <demiobenour@gmail.com> wrot=
e:
>
> On 2/25/26 08:09, Manivannan Sadhasivam wrote:
>> On Wed, Feb 25, 2026 at 07:53:38AM -0500, Demi Marie Obenour wrote:
>>> On 2/25/26 02:45, Manivannan Sadhasivam wrote:
>>>> Hi Bertrand,
>>>>
>>>> On Fri, Feb 20, 2026 at 09:02:12AM +0000, Bertrand Marquis wrote:
>>>>> Hi Parav,
>>>
>>> (snip)
>>>
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
>>> Would you mind elaborating on "over PCI"?
>>>
>>> I can see two meanings for this:
>>>
>>> 1. Virtio-msg over a physical PCI bus for heterogeneous multiprocessing
>>>   environments.
>>>
>>> 2. Virtio-msg over an emulated PCI bus for QEMU, Cloud Hypervisor,
>>>   and other existing VMMs.
>>>
>>> Which one are you referring to?
>>>
>>
>> Physical PCI bus, that's why I mentioned 'trap and emulate' which only a=
pplies
>> to emulated PCI bus.
>
> Is virtio-msg appropriate when the PCI bus is emulated, or should
> the existing PCI transport be used instead?

No existing PCI transport should be used, virtio msg over PCI is just for a=
 specific case
and definitely not when virtio devices are pci devices.

Cheers
Bertrand

> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)<OpenPGP_0xB288B55FFF9C22C1.asc>


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
