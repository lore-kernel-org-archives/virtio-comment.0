Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1011C5F37
	for <virtio-comment@lists.linux.dev>; Sun, 20 Apr 2025 12:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745153066; cv=fail; b=M3ccZpBQegzfyQGSdrlVg0HT0LrgYhEahGWow+S/ETuQQSshBOEHBmvK0S2T9b24UlN/ZZ3BpUz+zFtrKZrXzIRURlqeXUxMTwgH4htYIMGTFlm/ZNy3nntb2CZOdTi91/9dPv9Ep84flmqRo5RXfAPAK7XVqJ12t0RDnOLkv1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745153066; c=relaxed/simple;
	bh=QlIMpSS9Wytxo7I4MxkXZKdp3rhmTAeVD1pJiU8boc8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lBkYI1fXFbvusqYzAerXGZikjhGPJt1jlvaxtb4qrl/upznKL08e5hVRqyMHKCyquyBpSU2S4zk2B7vXV8dGB6Jr9vZGme6D1v1gXwvH9+wUi5rAcg8rjDNiZOl+KNDmQP1tqW3gdC4YhBfES8WDX1U182G+561D8q2hKacgkrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oEXXxybQ; arc=fail smtp.client-ip=40.107.92.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oEXXxybQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fV9c7YTIrp+1Vo5vDjKuXN/TvhgYMGEacSazGTFK75QLi/WjnFBufjIINVQa0Xk89z2ozl9i1lG4obt86ndF7MtcUuYV7n3K4/e36Lzu3hTSdPHa7Kf2LfU40RUVGQEt58nLyfGvMCoTQq7l58tpb7RYDeCc6RYDCg+ktZcDBG3f2eAwVCGYiGL3VpKS+GmnnwTO5LvIHXJPgYG2pPxWNtDXOJyui6+DquHjkJNrM3/BwUhNpkWDe2zh9uav0gKR4EMGMqtFgNGQRlXBT/7uLNRfT/27paf9jSK6eBgjezCWJie/I21IBm3fQg3EbMBAzGeaC8kWLL7FWxC41QyTpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Spu6tlH9QMH+VLcMDq/L0ubwbgi+U010FBu6xOz6X6k=;
 b=bh99TAfVvNOExHy10VbhjQLd1GTf1XwLHSJpVsCdynY6Ne/y3H9qTEdUhAA9Y08LaN1lc+C1NsCB2jhUMIIDcDuBlPtKrSXwMtw23wH8KYsaUIox5L/APgGqyDEB2yLoVIMwlI79+VgAYX6smSDWLgW3efY0Bb8gV+TsH4MD5IvWXVe6YnyHTwHU5iLnnUuKIXMMxB9j/ZFrCyAfMamUwk7voIIFp0pLFhtGYKIlsg3DPBj0sN8FmSBHTy2ZLiWyn+VQroI6K2xwh7znTtz10tL1LAVBHodTt+k536efbL0FmGSJ3oOJMBmXhI5c3CWD5+cQr7rBvIP2Q0R+88Tw1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Spu6tlH9QMH+VLcMDq/L0ubwbgi+U010FBu6xOz6X6k=;
 b=oEXXxybQGzlGiM4iUguj6UgeAxzlOVlWtOlBPeL7ZZjsNtsTAd++OCXeSBgLBAMLFW9ZOJwdQflkHqbY0miYycVuu6Kfohez9VICSspZmxnBKtv3g98GNQngRzYqesmUTalioURhCjHj6lS2J4/dtfidw+rGuThHIMDxJAEfAdvXV8rIzclo9yTXiuZTJLDkIRLQ9U32069JHJw8ZQQj4CIojOLc9zx3f95LmFKfmdcx3AqZMO70jmdyEyLep29b6OA6avCi9bY2MYLOBA1GMx/YdF1Y29O0m1ZDVlh8XUg/NjmY0pKxuUgBk3jbMSaop8SCYOcLQ28zkbORKk6A1w==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH8PR12MB6795.namprd12.prod.outlook.com (2603:10b6:510:1c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.30; Sun, 20 Apr
 2025 12:44:20 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8655.024; Sun, 20 Apr 2025
 12:44:20 +0000
From: Parav Pandit <parav@nvidia.com>
To: Kommula Shiva Shankar <kshankar@marvell.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "willemb@google.com" <willemb@google.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>, "jerinj@marvell.com"
	<jerinj@marvell.com>, "rbhansali@marvell.com" <rbhansali@marvell.com>
Subject: RE: [PATCH v5] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Topic: [PATCH v5] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Index: AQHbo0BCIgFC9JrZUUet0i9nCoAI+rOsnT8Q
Date: Sun, 20 Apr 2025 12:44:19 +0000
Message-ID:
 <CY8PR12MB71952A4DB7191843654451C2DCB92@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250401195655.486230-1-kshankar@marvell.com>
In-Reply-To: <20250401195655.486230-1-kshankar@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH8PR12MB6795:EE_
x-ms-office365-filtering-correlation-id: 75e8be5c-80b4-4a98-0073-08dd800911e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?I4EVDyVTwVKt2csX26SY9j8hdj9E6kOeui1YzOh6woEZf77R6TBhF3DGZoSi?=
 =?us-ascii?Q?dfPTANsYbLA6y7Wd095IgeHxp37zjuGuhAmqW+QIeq3oaMA5Ne27vNIaIzDh?=
 =?us-ascii?Q?zJaNGbkeC2ga4KdzH4OP6dLTN/Af3s9rQCRz0yeJoK513/tIOPk+Bz7j8XHZ?=
 =?us-ascii?Q?PRPq13G2aeLNhPCL/PfV/z6/p25Wp6Ugz1Y125hSK49BD3fKsKr8l9EJEC9c?=
 =?us-ascii?Q?4MELjVNIclH5UZHWmGDQM8d4naf69yAGZM63srRpNtmW8Aw1Q/MuL7NkAVae?=
 =?us-ascii?Q?yh2ARmCHRsUvVuco5QfodSdiU/iRiTYx+2djE4mP1SzdQ6cLvY2khKCR9Qg7?=
 =?us-ascii?Q?WTN2Ksvc3mAGGu80MdH9TbRYB84C2cBMDeiVzZIjtuulXqGQ1vC/dwr83H4B?=
 =?us-ascii?Q?A7K8hTgjoVA11Mp7sLUJCaOjmwszGx4/ytZWdbeD9m4LsaLFUEcxya5a4xVn?=
 =?us-ascii?Q?yaSfM1VjfD70YBvMnC3XomuGzpRzhe13AB3pl06AulzzEZnbIQynP+d89Laz?=
 =?us-ascii?Q?/wdbJ3EQu3G49DQbqadJQ0sqeB06a1ikvOZzKbGnujtgDQEUhznlQauo5NH6?=
 =?us-ascii?Q?/4kQOMXdax311EJjpS5O6jWzlIlPG1q4qj/HQ4YjnWwMeRL3tsd4bVZYHVsV?=
 =?us-ascii?Q?poOz07t6Qcxqc/2xwFX6tSpPjyJehTV0iN1XnGQDE9bmZLb+GU4QHA0gEGqO?=
 =?us-ascii?Q?0bzTMYs8rsWHfDB0NOTLuetnFO3tCocVHwgtHfCbArOXoiFVBeO5aDe2fpQ9?=
 =?us-ascii?Q?btDMxAttHewXMSliQIXP/9q7ive83nSqSojfwK+mmOOCnSxmOdvWyY76wGpt?=
 =?us-ascii?Q?+ki/NmT8y7JegnZOtuYb5yqjzfa6pneJExnv/lL95t6Ii2HTalX/KAsIh0XV?=
 =?us-ascii?Q?yoB54FDrvcqePKlrSCiWs6+TMGqbnxsCwjEN0JpqrZxrjXJZMKXk/UDGEVfa?=
 =?us-ascii?Q?K+D3T0izfyTCztbjftUihFV9owc4FyvEDVaGKzlOneZCQwc/4iMe0i738hNJ?=
 =?us-ascii?Q?gYJAYmshhFx8Z1twhou694+U8m13cbw6zFH/ZPj2qaPvrdRrtggIKV1fvZex?=
 =?us-ascii?Q?3sL5tj/l/6hJMLfI4KqwG7xP1rd79WJA8p5EBPU5PgOG4n4SbErTC0Hm3q2T?=
 =?us-ascii?Q?JIVd6YvdcEZ1r9rgcnLgp1NZ9opDdt5DFI7YLzloc1Qu2Cxo2DxAZ8iCNyg5?=
 =?us-ascii?Q?QusOF5m8seI/KGfyt0kjAN+W0QABKfPwvi/Jb4sTI4M2Q1Xq7WFgDAkzSUeL?=
 =?us-ascii?Q?9YzeP7K4zphQ50uHKcYPLZFY+xfguMRpf4Et7CUtg1BedxUhlleJtx53Jz2h?=
 =?us-ascii?Q?rBkl9aIwElf8vrva4fSZ27cp6WdpyVVWVzBA6zyOJD6ShZjdK8KfVg3h2CrM?=
 =?us-ascii?Q?QZh3sFHH/J2/QycEqxBKj1UbVQWjslvGr4vzrOB41ai2lP6WbB0lnYBN1bgt?=
 =?us-ascii?Q?nAeu+mZ5NK4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PNAetHd7h+ZiOWvgzzC1Ckdjq3cLxNoa7U4oVHUscn+W6tVWSOTEt8ZMFoMS?=
 =?us-ascii?Q?NMwjMu8COBoPORxbL/aeL0yBx3YbF921795g+eKG/Ss8MWPNhj1MnEx+2umu?=
 =?us-ascii?Q?9XtG3zTpItRhx5G5BFVoDMgSPAWaAsTsrvx0fZgJqirRo6P6YsWxhGg7d5qy?=
 =?us-ascii?Q?NigWTbz/HcOEEfXLsBgCRmNRgOcd9pB08Xk1HIjud/0vrXy2bF8rt4/uV3tz?=
 =?us-ascii?Q?4159tPFBTrNRI8W3Su6+jeB4/UYIYdCmRn4YwqE5S1Ag4wmT6BQDrjmIoPkT?=
 =?us-ascii?Q?OKkpef6tU3Tk161diT++/DOu2cYFN71vIN9cr8KIdRevzp5bvreiM6T25Fwv?=
 =?us-ascii?Q?4bGRq4+q6/P+p5FoH0xVGFWgTD3yqnjK2BzZz/RnxE3b1mPA8xiJ19D1O93R?=
 =?us-ascii?Q?ZJMkgDM535DERDdvD4UY00vhziuE+uNDw+kJ8YwXB4XutKNCjtWKvtPSCmWf?=
 =?us-ascii?Q?Mf8Qnt3MX7lmGXp9LXEUqiCR534sLnaz/6amiQ8WEFtq1KNVaH8Nc+tdbf6c?=
 =?us-ascii?Q?KA3AML+AsN62QQ/HLm6jY1DHmy8bI+6c3L3L13igar9yw9eVmv8YxEjwENP2?=
 =?us-ascii?Q?6kJeZiSTU6BzeZqRTJ6q+Gv5jtQVoo2wPoXet0+vodBQ+CCZuOMQHQjdtdj9?=
 =?us-ascii?Q?WCJI1EsQ9zh0cyrAD1CB5CiD36cOg5G7kXcVwNOsAcXro9ppkgLsR5MD0A9/?=
 =?us-ascii?Q?AgpXClprbuYPGL2HCwavp6/AFCACJIW5XusGvQS9v4mOPrwRumcQIrT0htFx?=
 =?us-ascii?Q?KYm5SV4I2oCubnwv8erO4z+U6DK7emn2+szLZW5L1Im42D6gnvrjAz5Ck4cx?=
 =?us-ascii?Q?tOcTMLQRFsZPl4o4bNd18xTbfHm/rrxowtSemDZq+4z0veb2oeKI1V1yYsDX?=
 =?us-ascii?Q?CwwHyvGc7p/zVWBjDYE3IbDZ6M9xQ8Q0dwHSXyKU8fUXl6FoRP2NppEsU1h8?=
 =?us-ascii?Q?ZkIEGyxEWfppFA4bWFTtdovB8UQ+05z/VJ0LX4gpo7zxgvQ0W+thBpBribQE?=
 =?us-ascii?Q?zqlJIpaf7OTPFcUA64GuHSNlh64R/gn/jQZFf9DzxTGHg+3AQtIL1xIVQ+bh?=
 =?us-ascii?Q?S9gxD8u0lgMTBb5xZcQNkBiJfHQQskGGfjKml3fTAXHAAj9RpEWaCTLBxXLZ?=
 =?us-ascii?Q?ULAb1eNlq8V3nZNjBFnIhhGGdob/Dn1RLoOoKFOSU+sqbTgG3MlSIFAWdfqb?=
 =?us-ascii?Q?+R5D48ma25L47Xy7NsUlVlFmgLsRp4eWTdhf9hztz3pJpXblXZwdkh+yI/P8?=
 =?us-ascii?Q?vl9QNtCUEFUJLxbjIlHENMZl6hMbInAO8kMd6ptq4a6SrAqOsO7MnKHzkPQU?=
 =?us-ascii?Q?Pnl+1JQVtBecP7oEUtUTjN72isuqBKaTsfRiMgLfGnvRcIZFVzH2WyfYnIPk?=
 =?us-ascii?Q?jyHwOgyzYT38n/zXaxY+LaUtp591HbR658ogy+1uXxvVlQ7Nd/F5EBWCESmF?=
 =?us-ascii?Q?YKwqhv2WXP9TMKsZU/s+3gOWB90y/uQMKv2jJ/pztI13HwOCBvRlBcsjlC43?=
 =?us-ascii?Q?MyTmsfcLb+eWJ65/aJML3tMrMCKu7nmpjb79eogcsQ7KMvbUa/lnqd05b9a/?=
 =?us-ascii?Q?ys7L1veyvC0asxiDGln5M4ZkkFEVlPh4bINNp/nJw/PRun4JLW+YLU9DiHFk?=
 =?us-ascii?Q?uHy+3ZvKeEVeAQnXiHyuKGgD//7pac2uFTW1cq1BCAWE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e8be5c-80b4-4a98-0073-08dd800911e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2025 12:44:19.9345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ctLO75NLZSOWRFW8715tIXfSVL0OmeFiiiC824UQoNAauf4GMxIUAl/pwo0XrpU4tLukyM+QgrIkv8oXNqfsiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6795



> From: Kommula Shiva Shankar <kshankar@marvell.com>
> Sent: Wednesday, April 2, 2025 1:27 AM
>
> This patch introduces a new field in the virtio_net_hdr called outer_nh_o=
ffset,
> along with a new net device feature, VIRTIO_NET_F_OUT_NET_HEADER.
>
> Currently, drivers lack a dedicated field to signal the start of the netw=
ork
> header to the device when performing checksum offload and segmentation
> offload. This requires the device to read the packet in data path, which
> significantly affects performance.
> Additionally, some hardware implementations require knowledge of the oute=
r
> L3 offset (aka L2 length) for inline IPsec hardware acceleration.
>
> To address this limitation, we propose to introduce a new field in the
> virtio_net_hdr called outer_nh_offset.
>
> The outer_nh_offset represents the start byte offset of the outer network
> header from the beginning of the packet.
>
> This issue was briefly discussed on the mailing list in a different threa=
d, which
> can be found here.
> https://lore.k/
> ernel.org%2Fall%2FDM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2%40D
> M4PR18MB4269.namprd18.prod.outlook.com%2F&data=3D05%7C02%7Cparav
> %40nvidia.com%7Cedf3f285a2444bd9556b08dd71576107%7C43083d15727
> 340c1b7db39efd9ccc17a%7C0%7C0%7C638791342319588176%7CUnknown
> %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> nNqdyyxNprHlSB2XWV5fAxCbwvO3uP%2BgNLXkl2hJX04%3D&reserved=3D0
>
> v4->v5
>  - Added padding bytes to virtio_net_hdr to ensure 64b alignment
>  - Addressed pending review comments
> v4:https://lor/
> e.kernel.org%2Fvirtio-comment%2F20250304075955.208450-1-
> kshankar%40marvell.com%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Ce
> df3f285a2444bd9556b08dd71576107%7C43083d15727340c1b7db39efd9ccc
> 17a%7C0%7C0%7C638791342319616725%7CUnknown%7CTWFpbGZsb3d8e
> yJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoi
> TWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DrrguhqiWyhYF3WqiN
> y361dZoVZhNOE6taSxTEPFJuQ0%3D&reserved=3D0
>
> v3 -> v4
>  - Removed the union of new flag with existing flags. Added as a separate=
 field
>    in the virtio net header
>  - Renamed out_nh_offset to outer_nh_offset to maintain consistency with
> other fields
>  - Spellchecks in commit message description
> v3:https://lor/
> e.kernel.org%2Fall%2F20250217172509.107212-1-
> kshankar%40marvell.com&data=3D05%7C02%7Cparav%40nvidia.com%7Cedf3f
> 285a2444bd9556b08dd71576107%7C43083d15727340c1b7db39efd9ccc17a
> %7C0%7C0%7C638791342319633752%7CUnknown%7CTWFpbGZsb3d8eyJFb
> XB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWF
> pbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DRvjuY5N8yV3uXnETer4gRv
> NN2%2FhF23qrN9r1RFyF9%2BE%3D&reserved=3D0
>
> v2 -> v3:
>  - Rebase to virtio-1.4
>  - Addressed pending review comments related to wording.
> v2:https://lor/
> e.kernel.org%2Fall%2F20250128142152.3662988-1-
> kshankar%40marvell.com%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Ce
> df3f285a2444bd9556b08dd71576107%7C43083d15727340c1b7db39efd9ccc
> 17a%7C0%7C0%7C638791342319647212%7CUnknown%7CTWFpbGZsb3d8e
> yJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoi
> TWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D1IoUxJKQff8XB%2FEe
> 5Zdn%2BXX0Df19o12BsG5Bshp8V3A%3D&reserved=3D0
>
> v1 -> v2:
>  - explicitly state that the out_nh_offset can be set only when a valid n=
etwork
> header is present.
>  - updated out_nh_offset usage in the RX direction.
>  - minor word cleanup.
> v1:
> https://lore.k/
> ernel.org%2Fvirtio-comment%2F20250114171636.3175670-1-
> kshankar%40marvell.com%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Ce
> df3f285a2444bd9556b08dd71576107%7C43083d15727340c1b7db39efd9ccc
> 17a%7C0%7C0%7C638791342319659853%7CUnknown%7CTWFpbGZsb3d8e
> yJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoi
> TWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DDBBnVhotS3Sgdf5%2
> BgahQEfrW48c%2FisMlh7c8I9qvOdQ%3D&reserved=3D0
>
> Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
> ---
>  device-types/net/description.tex | 37
> +++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 1b6b54d..0bb1cef 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -136,6 +136,10 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits
>
>  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles
> packets
>    carried by a UDP tunnel with partial csum for the outer header.
> +
> +\item[VIRTIO_NET_F_OUT_NET_HEADER(69)] Driver can provide the start of
> +\field{outer_nh_offset} value. Device gains advantage by not reading
> +packet
> +  to calculate outer network header offset.
>  \end{description}
>
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Networ=
k
> Device / Feature bits / Feature bit requirements} @@ -599,6 +603,8 @@
> \subsection{Device Operation}\label{sec:Device Types / Network Device /
> Device O
>          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT
> negotiated)
>          le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O
> or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
>          le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O
> or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> +        le16 outer_nh_offset;   /* Only if VIRTIO_NET_F_OUT_NET_HEADER
> negotiated */
> +        u8 padding_reserved_2[6]; /* Only if
> + VIRTIO_NET_F_OUT_NET_HEADER negotiated */
>  };
>  \end{lstlisting}
>
> @@ -633,6 +639,11 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  \item The dri=
ver
> can send a completely checksummed packet.  In this case,
>    \field{flags} will be zero, and \field{gso_type} will be
> VIRTIO_NET_HDR_GSO_NONE.
>
> +\item When VIRTIO_NET_F_OUT_NET_HEADER is negotiated, the driver MAY
> optionally provide
> +   the \field{outer_nh_offset} value. A nonzero value of
> \field{outer_nh_offset} indicates
> +   a valid outer network header with in the packet, and specifies the of=
fset in
> bytes from
> +   the beginning of the packet. Otherwise \field{outer_nh_offset} MUST n=
ot
> be used.
> +
>  \item If the driver negotiated VIRTIO_NET_F_CSUM, it can skip
>    checksumming the packet:
>    \begin{itemize}
> @@ -767,6 +778,11 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  \field{flags}=
 to
> zero and SHOULD supply a fully checksummed  packet to the device.
>
> +If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated, the
> +driver MAY set \field{outer_nh_offset} to nonzero value to indicate the
> +start of the outer network header offset, if the packet contains a
> +valid network header. Otherwise, \field{outer_nh_offset} is not used.
> +
>  If VIRTIO_NET_F_HOST_TSO4 is negotiated, the driver MAY set
> \field{gso_type} to VIRTIO_NET_HDR_GSO_TCPV4 to request TCPv4
> segmentation, otherwise the driver MUST NOT set @@ -948,6 +964,11 @@
> \subsubsection{Packet Transmission}\label{sec:Device Types / Network Devi=
ce
> / De  If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set, the
> device MUST NOT use the \field{csum_start} and \field{csum_offset}.
>
> +If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated, and
> +\field{outer_nh_offset} is nonzero, the device MAY use
> +\field{outer_nh_offset} as the outer network header offset. Otherwise,
> +device MUST NOT use the \field{outer_nh_offset}.
> +
>  If one of the VIRTIO_NET_F_HOST_TSO4, TSO6, USO or UFO options have
> been negotiated:
>  \begin{itemize}
> @@ -1049,7 +1070,9 @@ \subsubsection{Setting Up Receive
> Buffers}\label{sec:Device Types / Network Devi  \end{note}
>
>  When calculating the size of \field{struct virtio_net_hdr}, the driver -=
MUST
> consider all the fields inclusive up to \field{padding_reserved},
> +MUST consider all the fields inclusive up to
> +\field{padding_reserved_2}, i.e. 32 bytes if
> +VIRTIO_NET_F_OUT_NET_HEADER is negotiated or up to
> +\field{inner_nh_offset} i.e. 24 bytes if
> +VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated or up to
> +\field{padding_reserved}
>  i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if
> not.
>
>  If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN @@ -
> 1102,6 +1125,9 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network
>    both the outer UDP checksum and the inner transport checksum
>    have been validated, otherwise only one level of checksums (the outer =
one
>    in case of tunnels) has been validated.
> +\item If the VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, and if
> +the packet
> +  contains a valid network header, \field{outer_nh_offset} MAY be set
> +to nonzero
> +  value to indicate the outer network header offset in packet.
>  \end{enumerate}
>
>  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
> @@ -1215,6 +1241,11 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network  device MUST set the
> VIRTIO_NET_HDR_GSO_ECN bit in  \field{gso_type}.
>
> +If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY
> set
> +the \field{outer_nh_offset} to nonzero value to indicate outer network
> +header offset, if packet contains a valid network header. Otherwise,
> +the device MUST not use \field{outer_nh_offset}.
> +
>  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the  device
> MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in  \field{flags}, if so:
> @@ -1302,6 +1333,10 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network
>
>  The driver MUST ignore \field{flag} bits that it does not recognize.
>
> +If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, and if
> +\field{outer_nh_offset} is nonzero, the driver MAY use
> +\field{outer_nh_offset} as outer network header offset. Otherwise, the
> driver MUST not use the \field{outer_nh_offset}.
> +
>  If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set or  if
> VIRTIO_NET_HDR_F_RSC_INFO bit \field{flags} is set, the  driver MUST NOT
> use the \field{csum_start} and \field{csum_offset}.
> --
> 2.43.0

Reviewed-by: Parav Pandit <parav@nvidia.com>

