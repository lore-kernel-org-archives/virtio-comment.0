Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7658D210FB
	for <virtio-comment@lists.linux.dev>; Fri, 14 Mar 2025 02:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741918545; cv=fail; b=mwEjrl33Dx5CHmh6a/FkkXkdNPNK4qHyHGWifdLdVBonwSVBk2RCNt7ED8J0v9QYl7bhb6MZuTh9ctEBP8RtuL6ryoN+iyshjig5u9dSku6GRdADRqq4FBWuHk0tA8Go33duxg7GDWSetyW6pOJrsogpUAJBxD6D0NiZPf5134Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741918545; c=relaxed/simple;
	bh=U//WEyxwEg0WxyqkTfneuZZ2wVC8Uh8ndu8RXdnOV7U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iNMxAef9oVPfv0LxgUyIvgs7dmzzi+64XsuBtIoxh2dyj9/ueKnjXVffWZcMy/6onONqRmaq6xOW9AtwcaB/bkFDRDvxJph3bBqEKx1srtasD0pz9I2lB6zIm80O/ZZ+zRb5Vu4DTR3C+UEPPnAkfuuJlxf54VkfTX/DEegvpqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dfLfm2WG; arc=fail smtp.client-ip=40.107.237.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dfLfm2WG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqEIy1cByT6VlPa2MN6yVCkQ8N4s8dT5JU1jn7eG+Usmb9pm7ZAvDTqtzIm4Z8lzN4gQmskh4/U14KQj2pLlQtSXxkL5pV7cfyQxq/uF1FfyJlKAdf4UvdHmF5xVVTMVgWFX6jldZ0eSKBo8kg0IAkAPedjFxPqTekeHpPSM/fBFFWCN+9E8Q9HHLKrltDWDW+aNCrO27YTY2FabdWlhhZDWznVpLZcZlMnxFYiZLnK9jee6hH79J4TL0k8EhSTyVcMWYyNyKjBqOj1eF0haAYeGzc6gJKnl95szqG7AB3tBsoJi3C86SVaiToNXRgfLpM1YewwNlA8e926tDOOE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0g544PliPJrDAMRoGUjI9C6BC81XGHiLcfa7ZU35DE=;
 b=MI5PqT1N2Bn0axTYjut74PEZneRVAVWNWhTYbUQpoyoW55/QZEkz2pXGrbrax1eMWEhjFter9azNmlhrgoAQO9RhfMx/jjjjG1pFgNQBPJ5W4ImoSrMtidhfbhiyA0+qO0ut7C/qjOyu84s+lHh6eo15iT/OL7kD6Te0sBfMdd7mTTUb4cKdky/Tr1gMJP0JxeN8YpieLpGHXiz5rLQdxt1wnAhqAh3uaGfHgm7VY8omYFCbVVOwYff/PMNIWy3zeHlQ4af9VJhFx9VmUnxhgtVDIRSd2tgIvjPRL0oeW7fNebFAGNIwxEC73rZEoNMej3t9nTuNTGGNA+XL5Da0JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0g544PliPJrDAMRoGUjI9C6BC81XGHiLcfa7ZU35DE=;
 b=dfLfm2WG7kvtRoJUSPq42/QIppNvoZveqj7yNF4+Ae1Wa4ikZwZcyI09pbpORQpix4CQ4aq9rJe2x6lEkdNaLYRKyiwM94f/+UjdN2SNjPZ2YhqBi7E7onsJ3xLyePp7bV4t5yM47O8DiRR8ajha+T3kFlqboUNvzHeC97GYjBXpl/YNCDhlzFTIacjZppovyGt4mzCd63DSr+wE++MlBdaVTEBbMheHyO+/mEu/v4bKou6WTBPfKbMqKC9vMYd3NoA//AH1HrgRPnAWIJ6bvxE4GkS7YxCI+YeeIRxBjWOVFGAXSm9PTX5ypodiUZKRbP5UN5JVURw++ZP4A5w6ag==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SA3PR12MB7781.namprd12.prod.outlook.com (2603:10b6:806:31a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 02:15:38 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 02:15:38 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Zhang, Julia" <Julia.Zhang@amd.com>, "Michael S . Tsirkin"
	<mst@redhat.com>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, "Zhu, Lingshan"
	<Lingshan.Zhu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, Matias Ezequiel
 Vara Larsen <mvaralar@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Thread-Topic: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Thread-Index:
 AQHbiDDvdx0hNqTsk0elfmK82iBGrrNZZ+iQgAr+CgCAASisMIAAMHuAgAYLvtCAAENTAIAAK3ywgAEhAgCAAAdoAIAAPDSAgACAObCAAP7BgIAAP0BQgAEkCoCAAXvRYA==
Date: Fri, 14 Mar 2025 02:15:38 +0000
Message-ID:
 <CY8PR12MB71957E86BD3271121B8501DDDCD22@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250226092753.1082042-1-julia.zhang@amd.com>
 <CY8PR12MB7195EBEA5FBA0B13536B0289DCCA2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB65324C2D9E0FE9BCD192FA54F2CA2@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB7195D7401E120B34306AD4E5DCD62@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532E2CFEC070CFDF3D4E115F2D62@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB719585647964E525917BD761DCD62@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532B13A9BE99961E6D79722F2D12@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB71950B845BB9E5C10D864F39DCD12@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532DB3DD088B6F11351C645F2D12@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB71956575D93118AF3C425B51DCD12@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532768F74BE1198A9F7D100F2D02@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB7195003C2A8F7C8FE289EEDEDCD02@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532CD94403647007FD05EE8F2D32@IA1PR12MB6532.namprd12.prod.outlook.com>
In-Reply-To:
 <IA1PR12MB6532CD94403647007FD05EE8F2D32@IA1PR12MB6532.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SA3PR12MB7781:EE_
x-ms-office365-filtering-correlation-id: 2f85fb14-ddc7-45f7-3ef6-08dd629e1ce6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hk00ilZiAL9TnX/VQOrBjuAzGrhut/g7DL/uwoURaYGjjgWyVCvsvwI0sv8J?=
 =?us-ascii?Q?ROKr9Hbw4yBDFDnElOZ1MIFEAr/VpOJx3xge6ehNi9EmCWqDHMRpdKVNUFBV?=
 =?us-ascii?Q?8h96Vl0kh/DRxvT19UTzZNRgMkOMmVJA3Bog3Q6pMe6pFn39M9ZVC1hps/mA?=
 =?us-ascii?Q?0PhcuhwGOrSoGcvLRLBF3w5cehyxFh82RwBD1mikzjAGl5uTSPQFerhHexgf?=
 =?us-ascii?Q?SM3a5VRkUdp6pTvORGCtpYFrjXSY+mmNzF+T0fifwUTaQmEiOz/8dAguD1C+?=
 =?us-ascii?Q?bLIoT9MN8eaWeesq1YWgQH/0QVgTFQxYpiQiuAP0PPHHaO9V1paRjnQdwXCa?=
 =?us-ascii?Q?iIw5kWD6ZG9loqfJ7YdS9NrJq2iO+8DisrRO7rEoFf3yEF4iwT3cGwrz5Voj?=
 =?us-ascii?Q?3KQ2X/0KQqhfInSCBPeVUiIhzfz58UNJCbg+2vrLrqfOyqPQWlKiIoq8bdaq?=
 =?us-ascii?Q?T9PiYziMemWS2GhWlVz03ppf1zbSOAR3UzZM5ZyXrR7bAj9gf9iHJ1rrg82g?=
 =?us-ascii?Q?99EcwbBKJVofuxKqQ0n6DYwkiqid27nupfRlfHqNkm++oCLjXW7C0qaMSWnI?=
 =?us-ascii?Q?6TuLVcfOY8Al+UCj3IiSoJC9oY/tUhKnt20Kabhx7NucmA+cL2LO4swcuKfa?=
 =?us-ascii?Q?y8HK2+V4BUEvfuuvJiBjvy6bV6X5OhHZ7eqAcASZG1eQ45VMpuqBFjxoS4tn?=
 =?us-ascii?Q?YP7HFEimgSzo3yBeUhpLtcJmk6to6v0ROctSGTX9J42yx4cmYZvHS+/x7bAL?=
 =?us-ascii?Q?EnjO/6TXES2xeBvn41nuQm9a5x88YW6xtQ1gZVomNvOInmXTK7ya0dvgHnCM?=
 =?us-ascii?Q?kD4nfCjYCKrYJUuPFp63RB8jbEURTqhBm9muAoECHb20WG6L0FRIuLyQojUv?=
 =?us-ascii?Q?X+UBdqjSVHrTraTBhTE+jpnOju923Y7E3iNQ0gFugF5oTsxAlyZeJstQBR3R?=
 =?us-ascii?Q?UZLVGY4Iuwvyv7j63nR2FkFp+P2n3FtPBXcRsVWnwUYodyCxce1EecAG1x3h?=
 =?us-ascii?Q?I7C0D3aMf1K5bNZDcHFzk5tfdx9vwKvUD+nmM/dsDHdGZOTDKUYcP+dr9xF4?=
 =?us-ascii?Q?xyQB0XHyR1M220M41ppasHcCl+zkZVyYf3hu5ouBvIdopYT2rAcjhMsQIqBY?=
 =?us-ascii?Q?OelMqhgTZXcL64JVeG4EQHXeaNUoEMH6XHKQb0a/fxBAcSy5StgCWyyEIcYP?=
 =?us-ascii?Q?8w1WzeygJtskL+8p01HTYk0jV85kFvwYwRHF9+BhvTvX23J4vDD9aaVnDQyL?=
 =?us-ascii?Q?h9NlKnq7CNiTzy5mHgDgnEeLeCEPh8ICzcJwelrbK+qvAfHtALcDuZ353FYH?=
 =?us-ascii?Q?PY0pSjn4WYQcDIaNWD6j8Z2EPfRDosf23JsusPJ5dpW8WvwjS8wmOwLFNAfW?=
 =?us-ascii?Q?3XhKFoOVa82vBLutyk7L7+IEu8aK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WvMv1efivxyHFvpcrGclWqgvMvWxRDvuQTRi5LwosZNbuez/agqTajZI8cVc?=
 =?us-ascii?Q?VIQbGPYpheY8pQvluoEJS4DtuE6GhAyb0xHoqEPpfurrI96ScyZrJRa6MKRU?=
 =?us-ascii?Q?65FZ0G7weWyv30vXQuP7dvn0N0qaXy1mP7W9p50iKDF9CK52ko/EYDD0CzYI?=
 =?us-ascii?Q?hhvcHeci4h38IViQFuo4wdQeS0qAJX3guIdIHYkJQJA4mP1h5hSJPmJKL5D1?=
 =?us-ascii?Q?JPZc63jQrTfSvY+ikUK+t1UxFOuugKkLOfxXkatRDSYz+QyVtxhx9XIQbLA6?=
 =?us-ascii?Q?Ldi1nUXY1fCir21AWrx3qkCcvG+rZImmetPyAU3punUFBD9ydYIHrkaK2cur?=
 =?us-ascii?Q?8XOXpV1c1dv163qDhKqS2+06PLz3TZRQn2PcagQ4BvuOLrP80sCOYUiTHYEV?=
 =?us-ascii?Q?40rI9RoKzkAav6XRdNuIiUENc5n9Xk040HImaGxdilgKYXsnJJ3nEMPIqC8w?=
 =?us-ascii?Q?Uac2XV16oRA9UCO//5QfTPgiwDpaymWZiHUKWHubraQ4WgXtnoB7wf2IP3fC?=
 =?us-ascii?Q?D+G/QeeITyR52TXab6ejbC9YFN5ddEasOtJJRQrcLb9Jkm/KJbj+hnrFJoRt?=
 =?us-ascii?Q?umriTAxRW7D66yuMRdKNpZMu5lUX84ha8hnVKy3OYX/kWVILpATz+lzbw8R3?=
 =?us-ascii?Q?V0ASgkQh/K8yrgSlhp3FGr+XusYzOe8TNXAi1A57EAYpKpwafwl58GEn8/KL?=
 =?us-ascii?Q?WNqnBugQaYmbKgp9bXDONaQcvijSysrqsLV3U3f0p0vlLrdVqmoS5qpDJ5vC?=
 =?us-ascii?Q?DPNPuHDJph225tdCoQoG4bBkaSJEPUhPOeRzDJfpdGc4S+YPH/tpAd8HLc0P?=
 =?us-ascii?Q?YFEpNuEJvaJpAkd2k5zOEYmHNbpERsOuvENP3/HRTuKjlDtVb73qoLOEExa8?=
 =?us-ascii?Q?NzFN3gGNIFsT3l3wXqn9NTNUSUC2AiX+qWz9sTEIfvwi+5XbK2jyY5rX158m?=
 =?us-ascii?Q?BnL4fAWSS3fUq/uvf3aV3BGg5PaJx22qI6eLrbgkmKsusWhFnYUIIkmBdyff?=
 =?us-ascii?Q?YR5v0nP2DbtNKI30IAplXI4vdCxo7s24/bT0sLkrkSqxQSdJUQEaWKrc/eyb?=
 =?us-ascii?Q?ywHSJDsA7i7MbybLe4Lz4BC2uKwAWUnCn/LTBSuXEAJj3qJ2H1PwpAoSw44Y?=
 =?us-ascii?Q?+SmLjZLc7UNQSxnGN6KtlWYhL4QnRFEqlwyF5Hrio1z+jfHwrQm4SwnPCb3d?=
 =?us-ascii?Q?08UmZWrwZ/X5gLTzxiygh75O9tJF/ubuclVqkk383HOAQr3wfXoLPDQQZgK+?=
 =?us-ascii?Q?NQ5sT0Bo7cN+8diN4GAxyiBiQ1auztzK/mMZl2A8JAAm+bw0dUg5J90+o6tK?=
 =?us-ascii?Q?ax41TCeY46ZxJGkjhE2Rg4hVeCj56i/BsxCgjUgudrsSoz8ikJJQX8rfXwoM?=
 =?us-ascii?Q?cPmAkcKq5FgihmSgcScfTHyGKbZ3p5Pt+zEbqYrJdQNbtw7pGqdjTLSOz0I1?=
 =?us-ascii?Q?t4QDpzORJnK9StjZ91MlxkHOct8MV+9EfHmczVlU2+fhIDyrYReeCG3ecicG?=
 =?us-ascii?Q?HG+VufdyrjjI+gJEDhp6PSIQMZEMswlmjf6YqgqsKs8aNM94exmqH6LrljZ+?=
 =?us-ascii?Q?9LewhIIO74qbY6djD6w=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f85fb14-ddc7-45f7-3ef6-08dd629e1ce6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 02:15:38.5368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U5h2Lvu/35RZkllrU6o8y0oHrb3rXe/9WLVstZ4oHug6daVamFbsEX5j86+k3s6bJKnBVhMrWZH2WF/GiSlZ7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7781



> From: Zhang, Julia <Julia.Zhang@amd.com>
> Sent: Thursday, March 13, 2025 9:02 AM
>=20
> On 2025/3/12 18:11, Parav Pandit wrote:
> >
> >> From: Zhang, Julia <Julia.Zhang@amd.com>
> >> Sent: Wednesday, March 12, 2025 11:50 AM
> >>
> >> On 2025/3/11 23:14, Parav Pandit wrote:
> >>>
> >>>> From: Zhang, Julia <Julia.Zhang@amd.com>
> >>>> Sent: Tuesday, March 11, 2025 12:59 PM
> >>>>
> >>>> On 2025/3/11 12:00, Parav Pandit wrote:
> >>>>>
> >>>>>
> >>>>>> From: Zhang, Julia <Julia.Zhang@amd.com>
> >>>>>> Sent: Tuesday, March 11, 2025 8:58 AM
> >>>>>>
> >>>>>> On 2025/3/10 18:18, Parav Pandit wrote:
> >>>>>>>
> >>>>>>>> From: Zhang, Julia <Julia.Zhang@amd.com>
> >>>>>>>> Sent: Monday, March 10, 2025 1:07 PM
> >>>>>>>>
> >>>>>>>> On 2025/3/10 11:48, Parav Pandit wrote:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>> From: Zhang, Julia <Julia.Zhang@amd.com>
> >>>>>>>>>> Sent: Thursday, March 6, 2025 12:47 PM
> >>>>>>>>>>
> >>>>>>>>>> On 2025/3/6 12:29, Parav Pandit wrote:
> >>>>>>>>>>>> From: Zhang, Julia <Julia.Zhang@amd.com>
> >>>>>>>>>>>> Sent: Wednesday, March 5, 2025 4:12 PM
> >>>>>>>>>>>>
> >>>>>>>>>>>> On 2025/2/26 18:51, Parav Pandit wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> From: Julia Zhang <julia.zhang@amd.com>
> >>>>>>>>>>>>>> Sent: Wednesday, February 26, 2025 2:58 PM
> >>>>>>>>>>>>>> To: virtio-comment@lists.linux.dev
> >>>>>>>>>>>>>> Cc: Michael S . Tsirkin <mst@redhat.com>; Chen Jiqian
> >>>>>>>>>>>>>> <Jiqian.Chen@amd.com>; Zhu Lingshan
> >>>> <lingshan.zhu@amd.com>;
> >>>>>>>>>> Huang
> >>>>>>>>>>>> Rui
> >>>>>>>>>>>>>> <ray.huang@amd.com>; Julia Zhang
> <julia.zhang@amd.com>;
> >>>>>> Matias
> >>>>>>>>>>>>>> Ezequiel Vara Larsen <mvaralar@redhat.com>
> >>>>>>>>>>>>>> Subject: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> PCI peer-to-peer DMA transaction may be used in guest for
> >>>>>>>>>>>>>> some
> >>>>>>>>>> scenes.
> >>>>>>>>>>>>>> For example, dGPU prime feature will let virtio-iGPU
> >>>>>>>>>>>>>> access to passthrough dGPU buffer.
> >>>>>>>>>>> Virtio specification does not describe dGPU and iGPU.
> >>>>>>>>>>> So either describe it in the description or please drop that
> >>>>>>>>>>> and explain the
> >>>>>>>>>> motivation without referring to those terms.
> >>>>>>>>>>
> >>>>>>>>>> OK I see.
> >>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> To support P2P DMA transaction in guest, virtio-gpu needs
> >>>>>>>>>>>>>> to check the compatibility which is represented by
> >>>> p2pdma_distance.
> >>>>>>>>>>>>>> This defines a command
> >> VIRTIO_GPU_CMD_P2PDMA_DISTANCE
> >>>> to
> >>>>>>>> allow
> >>>>>>>>>> guest
> >>>>>>>>>>>> send
> >>>>>>>>>>>>>> virtual pci notation of two devices to host and get host
> >>>>>>>>>>>>>> physical p2pdma_distance of these two PCI devices.
> >>>>>>>>>>>>>>
> >>>>>>>>>>> [..]
> >>>>>>>>>>>>>> Ifsm1M5xIb37T9Tg%3D&reserved=3D0
> >>>>>>>>>>>>>> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> >>>>>>>>>>>>>> Reviewed-by: Matias Ezequiel Vara Larsen
> >>>>>>>>>>>>>> <mvaralar@redhat.com>
> >>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>> Hi all,
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> We are trying to implement dGPU prime feature in guest
> >>>>>>>>>>>>>> which will let
> >>>>>>>>>>>>>> virtio- iGPU read rendered data of passthrough dGPU.
> >>>>>>>>>>>>>> Before that, virtio gpu driver needs to get
> >>>>>>>>>>>>>> p2pdma_distance to check if P2P DMA transaction is
> possible or not.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> To implement getting p2pdma_distance, QEMU needs to
> >> handle
> >>>>>>>>>>>>>> the command from guest with virtual pci notations of two
> >>>>>>>>>>>>>> PCI devices and send it to host kernel and return host
> >>>>>>>>>>>>>> physical distance back to
> >>>>>>>>>> guest.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> So this defines the new command follow the suggestion in
> >> https:
> >>>>>>>>>>>>>> //lore.kernel.org/all/20241207105537.542441-4-
> >>>>>>>> julia.zhang@amd.com
> >>>>>>>>>>>>>> /
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> changes from v1:
> >>>>>>>>>>>>>>         - add issue link to commit msg
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Regards,
> >>>>>>>>>>>>>> Julia
> >>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>         device-types/gpu/description.tex | 29
> >>>>>>>>>>>> +++++++++++++++++++++++++++++
> >>>>>>>>>>>>>>         1 file changed, 29 insertions(+)
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> diff --git a/device-types/gpu/description.tex b/device-
> >>>>>>>>>>>>>> types/gpu/description.tex index 4435248..9d0f30b 100644
> >>>>>>>>>>>>>> --- a/device-types/gpu/description.tex
> >>>>>>>>>>>>>> +++ b/device-types/gpu/description.tex
> >>>>>>>>>>>>>> @@ -223,6 +223,7 @@ \subsubsection{Device Operation:
> >>>> Request
> >>>>>>>>>>>>>> header}\label{sec:Device Types / GPU De
> >>>>>>>>>>>>>>                 VIRTIO_GPU_CMD_SUBMIT_3D,
> >>>>>>>>>>>>>>                 VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
> >>>>>>>>>>>>>>                 VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
> >>>>>>>>>>>>>> +        VIRTIO_GPU_CMD_P2PDMA_DISTANCE,
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>                 /* cursor commands */
> >>>>>>>>>>>>>>                 VIRTIO_GPU_CMD_UPDATE_CURSOR =3D 0x0300,
> @@
> >>>>>>>>>>>>>> -236,6
> >>>>>>>>>> +237,7
> >>>>>>>>>>>> @@
> >>>>>>>>>>>>>> \subsubsection{Device Operation: Request
> >>>>>>>>>>>>>> header}\label{sec:Device Types / GPU De
> >>>>>>>>>>>>>>                 VIRTIO_GPU_RESP_OK_EDID,
> >>>>>>>>>>>>>>                 VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
> >>>>>>>>>>>>>>                 VIRTIO_GPU_RESP_OK_MAP_INFO,
> >>>>>>>>>>>>>> +        VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE,
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>                 /* error responses */
> >>>>>>>>>>>>>>                 VIRTIO_GPU_RESP_ERR_UNSPEC =3D 0x1200, @@
> >>>>>>>>>>>>>> -791,6
> >>>>>>>>>>>>>> +793,33 @@ \subsubsection{Device Operation: controlq
> >>>>>>>>>>>>>> (3d)}\label{sec:Device Types / GPU Dev  };
> >>>>>>>>>>>>>> \end{lstlisting}
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> +\item[VIRTIO_GPU_CMD_P2PDMA_DISTANCE] calculates
> the
> >>>>>>>>>> cumulative
> >>>>>>>>>>>>>> +distance
> >>>>>>>>>>>>>> +  between two devices before Peer-to-Peer(P2P)
> transaction.
> >>>>>>>>>>>>>> +Request data
> >>>>>>>>>>>>>> +  is \field{struct virtio_gpu_device_p2pdma_distance}.
> >>>>>>>>>>>>>> +Response type is
> >>>>>>>>>>>>>> +  VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE. Response
> data
> >> is
> >>>>>>>>>>>>>> +  \field{virtio_gpu_resp_distance}.
> >>>>>>>>>>>>>> +
> >>>>>>>>>>>>>> +\begin{lstlisting}
> >>>>>>>>>>>>>> +struct virtio_gpu_device_p2pdma_distance {
> >>>>>>>>>>>>>> +        struct virtio_gpu_ctrl_hdr hdr;
> >>>>>>>>>>>>>> +        le32 provider_bus;
> >>>>>>>>>>>>>> +        le32 provider_slot;
> >>>>>>>>>>>>>> +        le32 provider_func;
> >>>>>>>>>>>>>> +        le32 client_bus;
> >>>>>>>>>>>>>> +        le32 client_slot;
> >>>>>>>>>>>>>> +        le32 client_func; };
> >>>>>>>>>>> The requester device's PCI RID is anyway known to the
> responder.
> >>>>>>>>>>> So no
> >>>>>>>>>> need to pass it here.
> >>>>>>>>>>> It is unclear if its provider or the client.
> >>>>>>>>>>
> >>>>>>>>>> I don't think requester device's PCI RID is known to the
> >>>>>>>>>> responder, since the existing function pci_p2pdma_distance()
> >>>>>>>>>> also require provider and client information.
> >>>>>>>>>>
> >>>>>>>>> The existing function takes the provider pci device as input
> >>>>>>>>> at C code
> >>>> level.
> >>>>>>>>> And proposed extension (without provider BDF) will also
> >>>>>>>>> operate on the
> >>>>>>>> provider device on which the request/response transaction is
> >>>> happening.
> >>>>>>>>
> >>>>>>>> Well at first, I just want virtio GPU to handle the command to
> >>>>>>>> get p2pdma_distance of two PCI devices(maybe none of them is
> >>>>>>>> virtio
> >>>> GPU).
> >>>>>>> Using virtio gpu to find the distance between two arbitrary
> >>>>>>> devices which
> >>>>>> are not virtio is certainly outside the scope and looks wrong.
> >>>>>>> It should be done at some PCI topology level who exposed this
> >> devices.
> >>>>>> For our use case, virtio GPU is the provider, we are using virtio
> >>>>>> GPU to calculate distance between virtio GPU and dGPU, which are
> >>>>>> not arbitrary devices.
> >>>>> The fact that in physical world this distance is calculated
> >>>>> without involving
> >>>> the individual provider and client EP PCI devices, in virtual world
> >>>> doing this via virtual PCI EP devices does not look correct
> >>>> abstraction to
> >> me.
> >>>>
> >>>> In physical world, this distance is calculated by calling existing
> >>>> function pci_p2pdma_distance(), which will pass the the provider
> >>>> and client. I understand that you mean virtio GPU should be
> >>>> provider by default, but my point is that when I call
> >>>> pci_p2pdma_distance() to calculate distance between virtio GPU and
> >>>> dGPU, I still need to pass the
> >> RID of them to host kernel side.
> >>>> And because host kernel doesn't know which one GPU is the virtio
> >>>> GPU, this struct still needs to include provider information.
> >>>>
> >>>>> I tend to imagine that one needs to build a right virtual topology
> >>>>> in QEMU
> >>>> or somewhere else who is providing these PCI devices such that
> >>>> guest kernel can calculate it accurately without depending on the EP=
 PCI
> devices.
> >>>>
> >>>> But the virtio GPU BDF in guest is different from host side, guest
> >>>> kernel cannot calculate the correct physical distance from guest sid=
e.
> >>> Sure virtio GPU BDF is likely vRID.
> >>> Guest should request the right distance calculator entity, possibly
> >>> the one
> >> that is providing the connectivity (and distance), which likely is
> >> pci RC/bridge/switch etc.
> >>
> >> Yeah, the problem here is pci RC/bridge/switch of guest is emulated,
> >> which is not going to provide the exact same connectivity as host does=
.
> >>
> > It is the role of the emulated entity to provide topology such that gue=
st PCI
> driver can discover that (and not arbitrary virtio gpu driver).
> >
> >>>
> >>> Imagine a virtio PCI driver asking to to the virtio PCI device, how
> >>> far is it
> >> from the vCPU for NUMA awareness.
> >>> It seems wrong to me.
> >>
> >> It's not asking virtio PCI device to calculate the distance, it's
> >> asking virtio PCI device to pass the command.
> > Pass the command is same thing as virtio driver asking virtio pci devic=
e.
> > How virtio pci device implements is internal details not specific to th=
e spec.
> >
> >> Calculating the distance is still going to request the right
> >> calculator entity, which is host PCI RC/bridge/switch.
> > Ok. so please have such hypercall in the PCI RC/bridge/switch domain. N=
ot
> in the PCIe EP domain.
> >
> >>
> >>> Because it is unable to follow the same flow between virtual and
> >>> physical
> >> world.
> >>>
> >>>>>
> >>>>>
> >>>>>>>
> >>>>>>>> So
> >>>>>>>> when guest needs to calculate distance of any two PCI devices,
> >>>>>>>> it can reuse this command. But indeed, we only have this one
> >>>>>>>> use case at this moment, I guess considering virtio GPU as
> >>>>>>>> provider and remove provider PCI RID of this struct is fine.
> >>>>>>> Right. A driver can issue the command to device without
> >>>>>>> mentioning its own
> >>>>>> device identifier.
> >>>>>> Since calling function pci_p2pdma_distance() still needs to pass
> >>>>>> its own RID, I think at least QEMU has to tell host kernel the
> >>>>>> RID of virito
> >> GPU.
> >>>>> Probably yes, would be interesting to see this UAPI on the host
> >>>>> kernel too,
> >>>> (unrelated to this patch).
> >>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>> But there's another problem: how does host kernel get virtio
> >>>>>>>> GPU RID and calculate distance between virtio GPU and dGPU? If
> >>>>>>>> I remove provider information of this struct, then QEMU still
> >>>>>>>> needs to pass virtio GPU RID to host kernel side.
> >>>>>>> The device implementation side can get to know about this as it
> >>>>>>> has plugged
> >>>>>> in and built the topology.
> >>>>>>> The RID we are discussing are the vRID seen by the guest driver.
> >>>>>>> I probably missed to clarify this.
> >>>>>> But only getting the distance on the virtual PCI inside the guest
> >>>>>> is not enough to figure out if P2P is possible or not. We need to
> >>>>>> get the real distance from host side. Please take a look at the
> >>>>>> discussion
> >> here:
> >>>>>>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2
> >>>>>>
> Fl%2F&data=3D05%7C02%7Cparav%40nvidia.com%7C44fb34c8931c4aaedd330
> 8d
> >>>>>>
> d61df99f8%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6387743
> 352
> >>>>>>
> 99455726%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYi
> OiIw
> >>>>>>
> LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%
> >>>>>>
> 7C%7C%7C&sdata=3DVOWFlscDn%2FxG4%2FgT0Ge1M6IuZgisTYCqzSAUJo9AJU
> c%3D
> >>>>>> &reserved=3D0
> >>>>>>
> >>
> or%2F&data=3D05%7C02%7Cparav%40nvidia.com%7C9538a40c459942853759
> 0
> >> 8dd6
> >>>>>>
> >>
> 12df4ca%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C63877357
> 22
> >> 4449
> >>>>>>
> >>
> 6025%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwL
> >> jAuMD
> >>>>>>
> >>
> AwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C
> >> %7C
> >>>>>>
> >>
> &sdata=3D10ypT8BuukdQ1cGF6OY77wPdOo4H3owSPHoATgCX1lw%3D&reserve
> >> d=3D0
> >>>>>> e.kernel.org%2Fall%2Fbfe6a8b7-adcf-40e2-b7a2-
> >>>> 4e64dc96862d%40amd.com%2
> >>>>>>
> >>>>
> >>
> F&data=3D05%7C02%7Cparav%40nvidia.com%7Ccf5112991dc145cd786508dd6
> 0
> >>>> 6e772
> >>>>>>
> >>>>
> >>
> 9%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C63877274979663
> 7
> >>>> 911%7CU
> >>>>>>
> >>>>
> >>
> nknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
> >>>> MCIsIlAi
> >>>>>>
> >>>>
> >>
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> >>>> 7wrTh
> >>>>>> 4PogFwvK6YzRgBQi2GeOus0CarX0%2Bu5DerCQWs%3D&reserved=3D0
> >>>>>
> >>>>> Finding out the distance between two PCI devices in physical world
> >>>>> is role of
> >>>> the PCI bridge/switch topology builder.
> >>>>> So why should it change for the guest VM?
> >>>>
> >>>> Because as discussed in above link, before letting virtio GPU and
> >>>> dGPU do P2P, we have to check if these two devices can communicate
> >>>> with each other by calculating the distance in physical world.
> >>> Ok, so that distance should be provided by the same way in physical
> >>> and
> >> virtual world.
> >>> The hypercall should be in PCI RC subsystem, not in virtio arbitrary =
device.
> >>>
> >>>> It's not just the role of PCI bridge/switch topology builder.
> >>> Well, I think it is. Because this is how the physical world able to p=
rovide.
> >>>
> >>>> Checking this
> >>>> distance is a necessary step before P2P like amdgpu does:
> >>>> amdgpu_dma_buf_attach
> >>>> ->pci_p2pdma_distance
> >>>>
> >>>>> Why virtualized topology cannot be build in a way such that it
> >>>>> matches to
> >>>> the physical world to get the accurate distance?
> >>>>> At least to me, doing this in the pci RP domain (and not PCI EP
> >>>>> domain)
> >>>> seems the right way to go forward.
> >>>>
> >>>> Because the BDF of virtio GPU and passthrough dGPU on virtual PCI
> >>>> bridge is different from the physical world, which makes guest
> >>>> kernel cannot get the accurate distance.
> >>> I suggested one option is QEMU to build right topology as that of
> >>> the
> >> physical world so that physical and virtual systems can run same code.
> >>
> >> Changing the way QEMU emulate PCI topology doesn't make any sense.
> > Why not? If the QEMU is enabling P2P communication, it needs to enable
> guest to discover the way PCI driver (not virtio) discovers in physical w=
orld.
> > When guest access the vCPUs the hypercall is in the vCPU domain. Vcpu's
> information does not come from virtio device.
> > Similarly, PCI topology info in my view should come from the PCI
> RC/Bridge/switch emulation side.
> > I probably repeated myself here, by providing more examples of drawing =
the
> parallels between physical and virtual world.
>=20
> 1. When amdgpu driver need to calculate p2pdma_distance, the PCI
> information come from amdgpu device instead of PCI RC/Bridge.
>
Do you mean amdgpu driver invokes a driver internal API to talk to amd devi=
ce and it does not invoke pci_p2pdma_distance()?

I have no comments from such driver as its outside the virtio scope.
=20
> 2. In guest side, PCI topology info is from QEMU emulation, which is diff=
erent
> from physical world. Do you mean QEMU should emulate exact same PCI
> topology as physical world so that we can get this distance from guest by=
 just
> calling pci_p2pdma_distance()?=20
Yep.

> Can you explain more details about how to let
> guest discover the way PCI driver discovers in physical world?
>
This is QEMU or VMM level implementation question on how to build the synth=
etic topology.
In libvirt and other places, there is a way to describe the PCI level BDF e=
tc details.
You might want to check with the right owners on how to achieve or extend i=
t.
=20
> Hi MST,
> Do you have any suggestions about how to get physical p2pdma_distance
> between virtio GPU and passthrough dGPU?
>=20
> Julia
