Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5850616F905
	for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717069906; cv=fail; b=OQpu4WQpUL9j/BhbR9vfzQDbu9VBfSwqMHgikwpV+3NtTXv9wnLtvYUJ3Cw+ZYb6EKqtISBa5oV7eRix+6D6Y9sP0TlWE9CQJWHhSt0aIIWoDKFD0Sf4XmWf6+G1UzPb4672FhYeLOcl0nN2HDgHohOs72KjHPL87xJwTN0FEDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717069906; c=relaxed/simple;
	bh=693OO4ihXp2wharyCZGAbLMcQLp4Q9TwbWXK9g6s3b4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=d4c/SFzgJHtDGcaG+pHPSY3WZKwDu4lbTR0UqtlSyWMXLTrrUeFSYfDWkqQfcGy1H2RySGMWqYWIvDk4xoh4LRH5CTeUMmRAm3CDCqtesLDGThpWo4YbwwFTbyUPTENHn9xf/2FUKmKupqihoBe4obkJoxy8b/lUohGV98aA7b0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n78djpai; arc=fail smtp.client-ip=40.107.223.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n78djpai"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XaiEgg/dZa47rkDsM6hBA3s/WSfTQiUonqbPjVhOdyOtl5mfqqFfArLamXdYrk4bIxEdZPuHQE7m/dg0ydDKydIbVyGHE3gh1+YdUNz3WyoxRKkjF6VHRLBsJhzEn5xsYCzANGuqe8LO8sRj1fRILfojSPK/PAuIumz+yVogsCfrLfAh8bXNNrJ7p3rEAqt3XjXEoWT5uoiJuiqW4605y26EUQwC+yxKrZQeFXXYjKCVkmR6bRh1tNbv0Wx1o8q3grNKBecbAucFPb3FdiQZIxBvJsfYC06hks1QGuEfhf3qmS4EtOLTdHu1Vb1edGb4XXoMtAAXzYRROMyQGxgjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=693OO4ihXp2wharyCZGAbLMcQLp4Q9TwbWXK9g6s3b4=;
 b=gx9EngbAT/uu7UW2sDT8E14VL8RmM2S2i8KKisT+Lg94Fng+VRppnbPamEDM/2CyCu2ce6yBrjhKuDI7DxfzDFH5a1PmC6g+kDrxT0h4Exk7TR7YyE3NnnIWuUdqiWMn1B+vSZX4PDSb//dSzdypoLRONBOqDpK/FVyEiK2u8AbBjq6HGHMETlZTKs+MANyX1IBt8D3MTlf1mBLm5pDzUNoH3wdS3ne3I2qQyKPf2i9iShzE51MNYUN6/jWPKTHveG+783h8jNcZAfaCPHpnxZaBLmQWV46lNc+0srDixmr48UuhPa2abY9Aawzfw4heIb+8sdO2TIY6voS6fVgKng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=693OO4ihXp2wharyCZGAbLMcQLp4Q9TwbWXK9g6s3b4=;
 b=n78djpaiuZYosnZHTnr9KqmK3OLdarHbOagY+MIC5DUsrgEN/lRpUJh4bkfNV1Oj+JbhyMw4WADfnZVobCSv+Jkm6KNLb0vp/861PfBbtfhl0WYh/c9Vp9xhKWZIQHwDLK/nI+nKwJwEqtuOhR40AEqd5uPx8tObdSoYo3D2qWgiKkyjpfiIIc37u8EGj93F4zWmUHV8EvDU5hz4df3sBvHm5OulGeLX2mpAbZK8E9BvU6NEHm6sjpJmn68sFBaknp0e5/KT+ISUUjoeuh83rCPDG2qiN5ATaX9thwsyjK/qzoU+4Q6fo5i7v4aeOVly9ITY1BB5eQOd1sL4YYufXw==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 11:51:40 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 11:51:39 +0000
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [Request for vote] virtio-blk: Fix data type of num_queues field
Thread-Topic: [Request for vote] virtio-blk: Fix data type of num_queues field
Thread-Index: Adqyh7k88vR9kwlZQ5WFJ5iStacmnw==
Date: Thu, 30 May 2024 11:51:39 +0000
Message-ID:
 <PH0PR12MB5481539C5881166D2E159531DCF32@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN0PR12MB6317:EE_
x-ms-office365-filtering-correlation-id: 03764c63-8db4-458e-8652-08dc809ede0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gYHZYTY9cZW13DXEPWwoalrQTdHcWxeDr0fU4N8665NJD4c2jLd7pYLaEvKh?=
 =?us-ascii?Q?DbTqvCDOZD5CBq9RdhlKNvhYFww2GgNjqikvcIkbhWhRbnvCr9+mmMlkLf29?=
 =?us-ascii?Q?5N766SI7T9qOy9HciwMBWJC/8akSdBfntS0sPN2XQffkWP4+gIAkRCVy3rir?=
 =?us-ascii?Q?lSsDDLyunM8pKA2Sawzarh4MlQ2HlQD71DJCqQ2SPOOxuKwc209yOQ8i8GRg?=
 =?us-ascii?Q?8WMjg15A4XgU+PF9v07tnhQsas6irHp+apK4oDf12TLB3btJFGozslcvGqJf?=
 =?us-ascii?Q?7IdZT0TTts8iskaC0C0tFPPVR7Kx53ceB0bWpOBqYCpDsmmZm1+jnYTf5kwr?=
 =?us-ascii?Q?KSHZ7oa5rhr8RDIZOT26bcdgSAjqV1Z3M6HJeIk2CPadB3dwKdTQ8cL6hpgu?=
 =?us-ascii?Q?FNsGdK17Z0s2Xj1vN10lclDNeydi946UVPdWtsnJL2LVB28Q/qx3f7YfHlso?=
 =?us-ascii?Q?pOdP3qI0LhrpFzh1P7wRAuFeGYBX/IWYynt+khOFfcHMnAP93xZkquZZwjZ4?=
 =?us-ascii?Q?YelNiP+tCgfI0RmEnW8QeHLtmk2EeGqCvH5cO6s+G2B7w7DpaNHakEf54oLb?=
 =?us-ascii?Q?Sw6X2DF51N67d8TUl7buCQHPz59VSfFIWnJd+gSYR2OYBGf/sFn92X8OqLIl?=
 =?us-ascii?Q?+W0WxrKR6PU0yvCSOqDAX3eMhx6tgK8F21t8nEFUebrn9RaJiPRfCf6j+bys?=
 =?us-ascii?Q?Z4i3DPV/ptc6+XSx/BcMzoKB6MQqYAlksvXy2KPv6BuUxR4DLdh5E1fXvBXG?=
 =?us-ascii?Q?VUv7IgKxZbOF2H2k9kXvCzE+q1QMospiD8OB7JkCY0pYSfnOaHnxl1wTMo21?=
 =?us-ascii?Q?pme7O4cs6bIrfM4xcVehezgbupuTlQn+Sv07D2cmb7cx+ZKEGDdnWL79tUiI?=
 =?us-ascii?Q?fQ+MGgFFazS1FaojiGH1otsn48dbve0qNF1t61g9JKoPosrPUzoiah09jINz?=
 =?us-ascii?Q?iT+GX4I/4oDwbso1UY8A5sVJZ56P0rZ0diK6cXIx1I1uiLvgKhjdEUTm1dHR?=
 =?us-ascii?Q?b/QM+5Iz2JOa2XqF8vhraPQMqv19a/8/MBiTTyn69gENGl9hhM7YFwkFx5a1?=
 =?us-ascii?Q?jVVsfJUJC5PWpRycfihJ7r2HKLic+Ldlt2J0zI7WZSadkTytjMsOGshwYKA0?=
 =?us-ascii?Q?yuNGtqIasnyb0b6LF2c3xXzz/BCanjg6JkxdrqaacK7DSBLRHu3KQfWxdeee?=
 =?us-ascii?Q?iVTrba+rTuafqBbursOtC9J+o1GTr0Tj4ZW4Pk1nuQIIvEk1IXfGamjjgnrf?=
 =?us-ascii?Q?XrJPmQ0U1X+FtIcV2EBgqcYA47GYy6BGLj/fsTG2q8cuVteLwQdzI4U333u/?=
 =?us-ascii?Q?z0M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xDAAp+O1a5QBLtibPponXfgclIIhJ7coIbpzTjXUvgr2nyRf4lJ/dne4d4xS?=
 =?us-ascii?Q?NK5jprcBZZLj3SUfpBd5XKacULvU87rkG5YIDcjl7bap26iFywo7EQNbA04r?=
 =?us-ascii?Q?7weG06r9vGCHzs+mYEUXOTzXL6yHx/0J4O9ZAa3PX24aLYGEiHr4sHZJTvqI?=
 =?us-ascii?Q?R79/Cykkhsb1rmCHAB9/15xT+Rll8VvWhdcpBLlCMrOlLVf+J0IP60AW+P6A?=
 =?us-ascii?Q?x3do9mqa9PmLGPoKa4W3y47cnf8HldyYYTp3r8Mal0j90gsRmhofyKg6bchx?=
 =?us-ascii?Q?Q8y6MGiRWlpgazzFsJBWKMRh00OaWHBXrk1E20kC6SdxHmD/Ad6EC8JiZg95?=
 =?us-ascii?Q?DmFzMtUkt+uJGeni0vB7X6K+v2ey6ukmqXvazFdBG7aLH4J6MlPD8hXkET1p?=
 =?us-ascii?Q?7bM7YMk6KqJdhxGzrRHKGNRMYUitGZXdtVb4p9z/SF0z0J5JmUscMz34qXjv?=
 =?us-ascii?Q?ooDfl75HLQaASCnUy/xZTF7ck9Gw5EOuHar12FVyykBrDQt4tZfLul+Q/tx/?=
 =?us-ascii?Q?g5axc7gKi5v2v8O4J/7DAavG4yqy6AJaTfnOHQE9feDaWrInDDREub6I0PJm?=
 =?us-ascii?Q?iWA5w+0soti4wpjj7KJH1H3qw1T0FUtT4ZcESJkKM93q2WaP7X6Kp6+VX0ed?=
 =?us-ascii?Q?Lcczx3IHELYJw9b+Ij+2rD18cCoMlpfB7EgU6T5Msp4VoRlwm/uH4sNztCv5?=
 =?us-ascii?Q?d1ExTojF3ruvC2E7OQJ19AJisAg3oUKw8s6drv/4Q50vlj0gbuJX581qwMv3?=
 =?us-ascii?Q?9+C5HhPGY4xLiGlW3kdoDBwt4HsamHiqoNf124rCmcvqqs06HvNvOWUpBerF?=
 =?us-ascii?Q?TaMrqAQ3AwbgV8waL4ybVMlFZ6QqEb/Nq6TsZesM9iJP6XmphFzoeXSzuh3L?=
 =?us-ascii?Q?aG95CXs5dFMqSLK1LD8PVtsg1FlL3IQ7vlN7Necd/KqEt9kEDpz7yeSSQdjd?=
 =?us-ascii?Q?lcRrXINzXXTcC0Sigqc6jfORHTd3fi+ilVfjf9V/EUgGj9W+s2uBm7tOToNY?=
 =?us-ascii?Q?Rd5VS9PyxeqzI6Om/NO5znEHWlcUBUdIUGF4aJDI/DnY4xCUj0dnxyCY5y7t?=
 =?us-ascii?Q?nNQ7zvz7joDLhSU3Y4kHBnbc2kg80TchKaXfLKhmcVuwK49mLQydpT4UsG36?=
 =?us-ascii?Q?R2FKbefFgG8ljAshzpC+dfX4tyPxC9jhHQ4ck+jDqJ/jLG6YPq5AG3McBTYK?=
 =?us-ascii?Q?v5BGW88O6tSbbLNyfHhj1bXJb1ek3xqEmc4HfqHFA+vKfWWyylkpxwRh2jCe?=
 =?us-ascii?Q?XMsm/0yDUCiyRO6ph9N+6kloSQRsCrs1SjrNQqJIOU96E2wRZvqONATzyu45?=
 =?us-ascii?Q?X/Ewog3SogedtOTCdUMTcIjWbcncHltmo0Fi2lARFSzX4LWpaEAfAhRzCUUS?=
 =?us-ascii?Q?xu9/p5jBfretIUxHu5reLYwN7s1fuXDTNW3qiHlGxxCKG34UFKeKy2OvmWaB?=
 =?us-ascii?Q?e+TVX2ic07TdL98r+0KkD1iI09Link/ZvzCNeuqy5OdBAWEFjz8/KGIUJMwD?=
 =?us-ascii?Q?K+izrAxJH/CWWduaOwFQ5ZbEK59K8ZCsXC/5dJXR/yOBPKGNcgjPsyhZTP+N?=
 =?us-ascii?Q?zZmeBuUB7IZyqyRmBSw=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03764c63-8db4-458e-8652-08dc809ede0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 11:51:39.8042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3YP8B0pqCLcwtDS48mBxHcxFOdGuBWPTgnh80Iiu0WLgSfFz/GtSYgx+kjtTYI/haYXUXrIY3SchXKZttG7cNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317

Hi,

Can you please raise the voting for github issue [1]?
Patches are at [2].

[1] https://github.com/oasis-tcs/virtio-spec/issues/195

[2] https://lore.kernel.org/virtio-comment/hqicqs6p5h4r4xcdhmathfiegvcaly76=
ityqe67erj7c4b65ck@d2n6v53is5ya/T/#t

They are posted on 21st May 2024.

They are:
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Regards,
Parav Pandit
