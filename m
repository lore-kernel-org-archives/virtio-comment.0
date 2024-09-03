Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0138F17C9B3
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 10:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725358179; cv=fail; b=B9ToOt4T2mqzgQXtCLL8hL7GuERZVNPfO+GD/BI/Aq+GMviR13+Ce+aaicCAnnJaD4MQGZzfghrYVTPy6zB+a2/a7Y10s/P9Guw6FPHYAcpqvP4CgxW1IVOIkuRflewjzqCXac7HEq+MmC1U92ENJNyR9vtFRvNNxvrEeVOi/aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725358179; c=relaxed/simple;
	bh=5WrpKoHIeWwc89y6c5M5csoNnajyA0d+jPShOrKDY0w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lXGzds9Zh362clFs0T8LGOlwPLK8+QUjHAwF06bDWxVtdmc51KjEAvAM09/snAHzXam9XH9yz+JTinZwlJn3sWk54Vug7dmcbycxPWUUwzo5MnrX4jNGFp8aaIDUTk2wGE+8Ao+EBeUxJxGuFvVWeljrnZsR7ApFRHaDn4SAaCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ol2zDIdd; arc=fail smtp.client-ip=40.107.244.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ol2zDIdd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwFT14szVqxdLIJlBVIgh55tr7N5eDtZNQSnC2I2mnRV/XyevoxoALWb2Bq+S6FMe4VKS6wBokqabmVN8QgwKox78/SIL9fRiY4HY6Ju/7I8KeOa/nL8wjBMcgxlQuJ9hjlJd1tI94Rg8IRGeSGFWQ3GA1OF8BRSF8nJny/vou1WFzG3nhKTQzFzUWF2N/IXXIFheRXeWzgm1ECZ5L7FiuAo+jNMrW9ls3M88zeSD5OSKrzX0a+2MdqgDDdzciFA/mjGhtoE5XS+inXrHt6/be9nplJy4GauD8XqUpVqmjNwTc5Ec6w6dFF1zwLUSANjqQITCQd2RKZTMm0xvYqzGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WrpKoHIeWwc89y6c5M5csoNnajyA0d+jPShOrKDY0w=;
 b=JUy241paZgeQpY9KaDp4aGAVyHmWMGysi62by9kvJID0RMwq9oz5+TdHWDNfgnj/Ky8l0ow3uzX/YUK/9DQM+T0Zq5Hz+efRPsd39QmBBXn1e5fi6uyc1TLXMnc62VY0l+JWEgcHkKn3iMXqI4xhIFOtFmd05LSkvWG86ViHPP6QcffB2DxfNtyEmAtTB+6iHBYYy58lIa4ZaiqWg5Aam5ZFuIvBrHohbGp0ZEMzUAAv0/3YuugOvCX01pODc4szm3x1olF9YzwNzSr99fKKL3YVQdyUd48bvjQjx3TyRz1Oph3LEWuaFiUffkDjM6eCgppsA4BTOdNy2D3Q25lgcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WrpKoHIeWwc89y6c5M5csoNnajyA0d+jPShOrKDY0w=;
 b=ol2zDIddbiJJh2JeEpn2YOKv3B7IASBCC8Q7UB4haLukKeC4TtQraCpp9VKImAaqTAdMMB7T/67iK4fK50MwnxUwXUVUgPAgrXutYMPF4/MjVhwdYMeTQx8skTJbVxtOOB1FW2Ssld1sSc9uraEm8Pi3IdKkcP3VF787jQa8+F8ZpJuGHrvNJcJw7rHf09ZIaKnbqrXeaZHu/H2zknsCFcaZJ8DnO6xaWjqRBKgXgJbJRKO9824oDTmmIStMhi5vJukIfzktXgzjMQ6HbWEXYZDdCYhWcxS2giAKjZmqDE4OEpQGwRSD5A9BkFHiijz6ltVBavnBD3MwYZ9mZ3Ddkw==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by DM4PR12MB5819.namprd12.prod.outlook.com (2603:10b6:8:63::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 10:09:34 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 10:09:34 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Zhu Lingshan <lingshan.zhu@amd.com>
CC: "cohuck@redhat.com" <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, =?iso-8859-1?Q?Eugenio_P=E9rez?=
	<eperezma@redhat.com>, David Stevens <stevensd@chromium.org>
Subject: RE: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAASmgCAAAEvAIAABvOAgAAF6HCAA0LrAIAAAIWAgBcwMgCAAAT60IAGsmcAgAALPgCAAAWd4A==
Date: Tue, 3 Sep 2024 10:09:34 +0000
Message-ID:
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
References:
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
 <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
 <20240903054018-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240903054018-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|DM4PR12MB5819:EE_
x-ms-office365-filtering-correlation-id: 573e6e5b-a638-4e6b-cc64-08dccc00828c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?07BvtpQN873zBQsrKuYFuZsyT3qWMkGnX8TYbKm6LlO4e1F0LUO3wnYfsX?=
 =?iso-8859-1?Q?ec0JE9w7PZnDkMSL+J5Fz5GS3/q01rr4KBxsuSOAKs64TzI9I+lvkSIou0?=
 =?iso-8859-1?Q?vYyX50MdQ+KlRuZlVBxZBc/+nmlZagdK3LyPeAlPEY/BjdB/pjPE5MQdIB?=
 =?iso-8859-1?Q?rgDUanvezJgAE6bjDTYcHxmjk+DJHVsqAlo0qtwJ6rSinOUHH+UJngdXdB?=
 =?iso-8859-1?Q?hssHw1AizheLvNaNeexPF9nZPSopGBQJkTdDSFASmwUurYGEhukWNHCUVp?=
 =?iso-8859-1?Q?4w6KM3uMed049R8oWYU3qnQuSXWuu1KWJYAUgG9NmI6Eem+yAcJa4lX4gN?=
 =?iso-8859-1?Q?jkZ8sTB2+8btuYVFndvDcQMuICHlLt6xa1uham7TldFP9l83j5s7sTWC62?=
 =?iso-8859-1?Q?OHvFH+Q8xYgsKUntA4qIUSsQPHr6FH//oO4rqDz9EfdX58E0FMJAekfovI?=
 =?iso-8859-1?Q?zXBZXPtiDWHzeXJ6duIwpOSNdDblHlex/Xp1PixizKwUgOX/6CGQKfnoGc?=
 =?iso-8859-1?Q?Jzm+Kk8r0TCxsmQAgQH1lBpr1YZrlDKzVADrxNHE9nbNp/8oWMRjy0I6Ap?=
 =?iso-8859-1?Q?SI0l/kDJsCMmahHjIE8fgT93HVgW0Gki0p4Azb2Y9dG/w3SGMr8Tnv2XNT?=
 =?iso-8859-1?Q?kUbvssS9/geUtHN6bRuF+UJUZtQz1uQgcwVF3D4aC4zfYop2wvyg8TiN/a?=
 =?iso-8859-1?Q?Y+cKK6F0KI5G2rrS/YPK39qT/8aoyE7BtXVv163Ba9ptoHq7AgZa02x1Le?=
 =?iso-8859-1?Q?n1fO0juJULa6n9PgEI8RrU+FdhS9VwQhA2BJMCBwAzoGNwsZk1RENTBsU3?=
 =?iso-8859-1?Q?1sPqAMASW5ha2y78PY/IjguTWyZRAlTSftNcDAESjTGudWOrajK31IaWnD?=
 =?iso-8859-1?Q?kW/PVGyAvkqmvYgdvC4k89mlaUCtKxZOPJMEFd805U0QHElzZjhvxxfQTz?=
 =?iso-8859-1?Q?/OcVmoClRoCHzQ4iccS5hy04xpoAix2B3jYn2pN4Nh67BTukzUbdm7ONmL?=
 =?iso-8859-1?Q?EgI0iXIbntl3TJ8zW8ztG2di8ouo8kWsGb44q8B6KgtAJPgOfAsR1JZC8l?=
 =?iso-8859-1?Q?H1fhDEB/lX0ycQhVEAdhH/Yyrf9N5ywJvNpxSW2GyV1EBpST+b1odWLKlK?=
 =?iso-8859-1?Q?qSb90a9nYB6nhtvesOQDwA8H45rssc4lFUe7MABDLb0WsiaPxZtZbaoYaf?=
 =?iso-8859-1?Q?j8fD4xWQX+ywTznN7UrjhafLgRgeIxlfz329Ipbk9pKCM5r/qn66o3piHk?=
 =?iso-8859-1?Q?wRS5YqLaLUFnaryMJTDWijD7ZTr8B2j2dbsxcLEt97CYVASG/ivRBlzyda?=
 =?iso-8859-1?Q?lw9FUK2BtPA7yt2CocF4905YFEdhYBAU0KWcUvJSGnAZFsSZ/rFhlbw309?=
 =?iso-8859-1?Q?keJtyZAeXFhfpDy0jLyUT68MxhWZeKhw/8STdjzf7ebHhuvRNc4zZkxGr0?=
 =?iso-8859-1?Q?qWQAcTCncgsDIVTZsJjVe5DAlIDg9pCSuaaS6Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pKhCd+R71fsFVAyEMtTlDAzUeJwFqBCt2Mz2jdv7WJlbMn5J2x2t7lPFCe?=
 =?iso-8859-1?Q?/nrd260LfdaS5fLi5I/asWjgjsIZCV8mkusAG4DU1TpcXLzECwwcpG+z2N?=
 =?iso-8859-1?Q?YFURqCeufXS0fXTqVUeBYqTzKr60zMglH7zMcmQPKwMo2bHLEnHU+aRyXC?=
 =?iso-8859-1?Q?JWQwuw120UnNnDp0O9OUDvkHgsfi2g755X+5VrVYCxULToUbjFheLaJWq/?=
 =?iso-8859-1?Q?p9ZWBClmoGsTSFNPGQrYTNlyF606PZ+LciFjcfeLQSALaGXTONjheam6xw?=
 =?iso-8859-1?Q?kGjqy7Go/E6Xz3htICCbnEhbqFZbL/8BdpayD43V0icxtHWnUT2+MWVuDN?=
 =?iso-8859-1?Q?QggOGUi8MBYXlxuFPNXor+XYNLYdjPkPV9y32d0BeM64tcfRBqHbJvimct?=
 =?iso-8859-1?Q?lToYcv2+CJt0XNSdCtE2fPCM5zrbuH2yW23Us5l4B4DtL2hBEXRieSNxES?=
 =?iso-8859-1?Q?4i5Zxc/NBNENq+5fb9CQ5c/VBxHvP6je3FMMnlaMdq5GFh3yff6yP8/hmr?=
 =?iso-8859-1?Q?S+kZ1Cxpe3Tc3w3G7G7gNMb6TQi+Upx/yDVTc2KUEjpj2Mtip5vXE+QWO5?=
 =?iso-8859-1?Q?/pC1W6lgda3IuScf9DxOAyGUqHKsQbNJC5DztvRd0IlD1mq8fa4uwoR2gI?=
 =?iso-8859-1?Q?Vmocq8mn1xyD5tCffyQHxTtM7C//RVyTNDCZbSpo6V0MPtTyUcDjXohK11?=
 =?iso-8859-1?Q?3e66KbEwitb4kbKM9OGAGe4OrgL5PduJmZuJqLX2ciqcjSYsRiDmpGEIs3?=
 =?iso-8859-1?Q?ZUNp+TCls8fUmtrfkvg/LvFoyzTWzr94mmY4wZb9TXKXGmjg7P83QTNTSy?=
 =?iso-8859-1?Q?IGG13oWwLcTtMUukf5EDAK/cSrCbcIRbBOpBVeravrRWEALZfihS2p9UPp?=
 =?iso-8859-1?Q?vc2KJK3/oJLd/hHYd4TjIGEZDtSf1+3Z8ycepwPZzl6wJKI6xmOZgvWPyd?=
 =?iso-8859-1?Q?4tsl3T6x1lNOTfOV/+TTY5x5zDnp8sZ11cyadkXgN5YesqpWSbEJ3iVibm?=
 =?iso-8859-1?Q?203vKKUOc18DuZDSWje7zTkVlnWDnrzbd30EM08mqBdsvVdVjzWZ6aTN4p?=
 =?iso-8859-1?Q?s1BmfTSV3V1IS+EH3o9WoSyA75e1Hga+soIcmAgu1Z/l9z92uYVf8PWgLi?=
 =?iso-8859-1?Q?owevDJxfegToRZJctSXlG3U89NhdET3rDET7qLUHZCiw8rGYUHrUYf2kd2?=
 =?iso-8859-1?Q?OU0/x6/nWc0xxAwVJirMHab88wruzWV8DTOPEaTOoGbNybyLW4jR98FJu1?=
 =?iso-8859-1?Q?63644lVVhN7NYPXBlzn1pR+6Z6IGC6qmGVvsyJsS4DYMn1OpIteGJuVIYi?=
 =?iso-8859-1?Q?E+UsEv352pThg7zA25Si+7NVZk2yJnEF68qI7Y6Lt1+Z44jnOlRYnwM0Te?=
 =?iso-8859-1?Q?1RO1zcrqhbbjPRUGlgLxggP9tFXpyw6pt94ibBfGCPdJKG+g/+7sb3wJGV?=
 =?iso-8859-1?Q?GHhiTNHN5Htn++5q2PQjWi0t9iHi/aGBauz72uo3toszkoonvKNGATpE17?=
 =?iso-8859-1?Q?pnoPKvc/erN3oPKsUQ5dJG3CQpGaSRyfHjK5OjgDaG0BpVou5zItMmGYpP?=
 =?iso-8859-1?Q?JZZ9pnOmMkNPFetI+i2rJvh5cEsnNIkQKr1mc+eE+1+46xAdH9mzprU7Bf?=
 =?iso-8859-1?Q?sjmI+vsO+43pzVgjfK5r/RsU46VdyK7DL5U/EzWc0jYw0GHq9w/JLcFX0k?=
 =?iso-8859-1?Q?oRMoYoR4HPBr8KWpS31x+3HxOgIE4iT8WZzQ94EX?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573e6e5b-a638-4e6b-cc64-08dccc00828c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 10:09:34.1675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sAXDVSsd+dAbinR5m7Mq96dW57dUXrnRVJJOTwu/WdzpZ+UibZNtP8MlaaVIXm0W4fQhoxJp6XVtlkVuDMuZng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5819



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, September 3, 2024 3:16 PM
>=20
> On Tue, Sep 03, 2024 at 05:05:40PM +0800, Zhu Lingshan wrote:
> > >> Are there any similar
> > >> constraining for other states like RESET or DRIVER_OK? Don't assume
> > >> any other states transitions are faster than SUSPEND.
> > > DRIVER_OK does not suffer from it because it is async notification.
> > > A device may start slow after DRIVER_OK.
> > > SUSPEND operation cannot rely on such async behavior.
> > The driver can set suspend and re-read & wait. This is a common routine=
 in
> the driver.
>=20
> I don't buy all this talk about special machinery, some 10 nor gates, the=
 cost
> is in the noise - we are talking about cards with several ARM processors =
on
> chip.
They may not respond back under 50nsec.
How many cores would you like to dedicate and for how many PCI functions?
And how they can be easily underutilized...
So, it is not a noise.

Circuity is the device abstraction that we keep instead of digging down on =
gates.

Also can you please explain how can it work without VM_EXIT? You have bette=
r insight to this than me..

>=20
> But I don't like it that looking at the registers, one does not know the =
device
> state. Hidden state is bad for debuggability.
> We have 4 states:
> suspending->suspended->resuming->resumed
> so we need a register with at least 2 bits.
>=20
> we could steal 2 bits from status but it seems a bit much.
>
This is why letting the status tell the status and control register to cont=
rol thing is elegant.
