Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2095.outbound.protection.outlook.com [40.107.215.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CDF1474CE
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720177977; cv=fail; b=G5BTcMRIYtGPnG7/nKLLwGsjDkvzAQ96auePBXNV0u5AZAKGvpGnNfpBFMum3hRYBwoBM5Ioz5bNWVzdJqJO7cdqOJXyIx+9jMIAsd/vgNPK7AiRWdCXGaHkATwdjOIr+Hr/1eYZdkXH9UVfEE1lcMNLSojmMSLKOacC60PlMRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720177977; c=relaxed/simple;
	bh=t+xP5XegTkY7BEUhEb1n87NHgZkjm8NNBYPqGidBAg8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F04LkmOYuJwDXnaizBioIuTiUFwXooy6qVE3BtNIXzmxcy+dM5xU1Wxn1jMHbEocUV8gKpGaqCOsS10V4ngeF/8zzK8sF7oFu2EPNVig5rMo/vZScQeFK3a6KCwRZ7vKk0cTZ7O4GQX62dZ+8WpMSe8gZ7miZuxYeeLy8hrGh4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=ZDMH2a9d; arc=fail smtp.client-ip=40.107.215.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="ZDMH2a9d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0A1kgHw89O2nSR9DVTAehFMARJMl7uurqXfD46jbUyT/vRPo1LjI4avJyFdH441xl+HlwdxMKn3zVZ/hVeEH0IdPSqZ76niA5nFmiLSPNs8xTQAtSkjX3QtVB/6jj89hSx04xyx80u+6hZrZzMe8KERVSvYj5Nij+f3RG0s3EFw+04xIMZ603fyEyRJC/7U+n1imc2AIb3YBfGG+SPHoDFg4Qd15sxnYkKzM2t4GTDd707US0sSxE2OFfxhMqLDILQ+Ly9obt7iNQZ7oO0VO87CgjgdDHr9aNfosPBI2sAks2b4eKjmwW3i8ZY+wgW4MAKhi5LjRWyHddCNJvzddA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpRXW+B+sXL3MX9I3aByIHbJbgJ1d5qAS5CH+gVVXX4=;
 b=RsBzNlR4TQhEwuk9zdTypikhbMY6JZCQjBIjPL29WYvKDhf8O0i/MJq1VRus9wa+VO34HwVBFHmQmG0xDSiO09VsU8BgliaithOE/WW2u7uiY2wHCjkFXZTdrAQgjGj+Q9Ntt5dr/mrgun93Dp03HcLplif7CN0iTkRUFBbX1GwhmTvQUMTyWDllcxorwwKlxMZZh7WaYWrwqXL6mppp06Z10N4GeNZLrekZIP8cl0sDO9GiYNDjyRQBA3Rp9HgyG6nuNvEJTbnn1LAmvC7bTYo926kG5ZxQ47wWFlVrURa5X/EfOuQQgYMRn5kKFSUS2PdUpQImwUDJUv5LaUeD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpRXW+B+sXL3MX9I3aByIHbJbgJ1d5qAS5CH+gVVXX4=;
 b=ZDMH2a9dzAnlC3KBkiFLaOQEUL7FwCUzOty6iT1k418t0NfAkWHRRbQVyEqubrtMFSUU3SM5L4X7UKj7tq9aE3rozcyDGaTYW3HDNhNo4Lv870TP02GsrM2V9V6jO+NdApO+CYxV8RK6+SqETHenYOQT5Y1FYFAy6ROlvZTpfyui4HWQvqkBPoleX36/hAuO89cznfQCORFFkGFEcwL6rxvxH0Y9iIlJtXt9PI2SZbHoW51VssKgShoP3zl7f4HE56xERSgRxVm1PIM4rVhlgAteCSii7v9E6P90qmK+qEx6aOgBf6sirxMNCOwSLL9ZdhEL/svpg5qNJSobmkRIOg==
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com (2603:1096:4:1ec::12)
 by TYZPR06MB6726.apcprd06.prod.outlook.com (2603:1096:400:463::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.40; Fri, 5 Jul
 2024 11:12:48 +0000
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd]) by SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd%6]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 11:12:47 +0000
From: Lege Wang <lege.wang@jaguarmicro.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "parav@nvidia.com" <parav@nvidia.com>, Leo Liu
	<leo.liu@jaguarmicro.com>, Angus Chen <angus.chen@jaguarmicro.com>
Subject: RE: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Topic: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Index:
 AQHay2kF67vqaBJYMUW1XCStKdNnOLHjWBeAgAEuLyCAACjYAIAALjYggAAWi4CAAOYg0IAB8S+AgAAQyiA=
Date: Fri, 5 Jul 2024 11:12:47 +0000
Message-ID:
 <SI2PR06MB53853B30A07F8D1AF94A8DA9FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <20240702073359-mutt-send-email-mst@kernel.org>
 <SI2PR06MB5385E3CEC459963A7D079B56FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240703042525-mutt-send-email-mst@kernel.org>
 <SI2PR06MB53851F07C15BDC46C74079B5FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240703083151-mutt-send-email-mst@kernel.org>
 <SI2PR06MB5385F178FF558878062A4D2FFFDE2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240705035349-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240705035349-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|TYZPR06MB6726:EE_
x-ms-office365-filtering-correlation-id: 0df697c4-50d0-4acc-f692-08dc9ce366f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?Au/SxsEg124xzJmoEA3K45SeNFNEFbJ0P3rI0VJjXUr0KHLMyOptnJqP?=
 =?Windows-1252?Q?BsHPfz21Zo2tsECp/bJtcTrqKVumSb5m1tE2Qx9BuJ6vteia60RCN+LR?=
 =?Windows-1252?Q?l23Aa5hW/2tSUY0PIlpv4lm8NWLm3T7vUj191MA21pMTmNdD9XY6HUiT?=
 =?Windows-1252?Q?8xKGhMnQ94hswM5xNYp53ppAjWH0r8zds+9l+3IalEbI6MNGlDU4K99z?=
 =?Windows-1252?Q?cLvqEM/EdRxZSMK8Au+pE51mpPakelXdnoB2zi2ztUBRk+p7mRBSjDE9?=
 =?Windows-1252?Q?GkNfVZw6JkXTdQx8Pfr8oZgYH6ShCizhwxmHMOZcCKppJCgBBQ3pxhIa?=
 =?Windows-1252?Q?X51BNSBfw0vvp415lqjZ20NDhfohmxtlqBJ7wArx42zejba46K2MPmiC?=
 =?Windows-1252?Q?eIcfFVj+v/Xpaw6UT/TYrg47Fz/nbvbMuD2AXp17JZc4Vk7xWmIb+ocm?=
 =?Windows-1252?Q?xv3SqiVxPGanR80fikWelkSw3QLddlILp4v5JWBphOMn1QT/+6LRar+U?=
 =?Windows-1252?Q?dq5iZ6ugGtuVV8LA9jX3qNgI3KHL5gDy9QKr4w7jFn+aVqEZ9D0hNMV2?=
 =?Windows-1252?Q?GDJr7cTWKkjMG48d/LUXHBhaBKMyg4HecAN5k4tIkZuBz4xbxsxYLjjp?=
 =?Windows-1252?Q?uhXReeebnmABZmVr5ylHEi2CV+HiDwDr9gBD6jW82OpB4aRsee0N/0Np?=
 =?Windows-1252?Q?E/xhomz+9+Rnz7A8Uw3FCpdaR+Q+sp3nWQ8gSy+CB+Q9ZlbGTInWhVm7?=
 =?Windows-1252?Q?0H/2Xd8zytRF18zHA6E3oH1+rNO6tma4ujV4R2tyWnips3G9J8rBWezK?=
 =?Windows-1252?Q?/jlCvFtb/qT9EzGSKIVeHfS6gI//+LgRJkA4KQMbj5exiq5kzOGyBu3k?=
 =?Windows-1252?Q?uRPy3BH0bRM3HLcxg/CACUTdRhTuQwXSGcPD6vyXTLO+RnKHzA9ZymeJ?=
 =?Windows-1252?Q?fBB2dxZS1FZhsaI6Olyw2juJRqKRBVGmmKeTuPinNGPkPPcADdrotVt+?=
 =?Windows-1252?Q?tv3UD8vjDRwEgCi5iTBVP05o00pQr9oEZOAs99YSCh0rbqStuT1NOryA?=
 =?Windows-1252?Q?obO568BTGEzgvYQRs1+qjBHgI1UoDdAzwVnR/lxjzeoGj+XcIA04xBsP?=
 =?Windows-1252?Q?0L4b3Qv96UjdEmPvVY5yEHbBrAa6Zl0Wmi96ByA1dyqj1IzO615t2Ii/?=
 =?Windows-1252?Q?QZnB+l96Qo0fubuCtuaxoeuDhq+RIVGw80S0UnGq2PMTEOJQVxN7JIol?=
 =?Windows-1252?Q?REa959xOeXtkZsp3/PPHQ6/6knlRMkM21aO7/k2W/4o/x+GRfx2YPFgb?=
 =?Windows-1252?Q?I9LHkElRaoAmDIua72D6VSZrQo6yaJIgyRodjOBQ7aDm7bTnCEui9Wnw?=
 =?Windows-1252?Q?4UcbC7/4VXSkPIu0S40C/lvaFdpeNQGxG9nAzpcqUgtmaFWqTSLn0rx1?=
 =?Windows-1252?Q?Z8uT28NIFX6fT4H5SpO2R6j1USb6nifRDF5Xx28y/io9GjP77f53Af60?=
 =?Windows-1252?Q?HN6MZbl/rjveNs9zZSOgVlDnoOjphQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?QxDKOP0j1Ntllyfvbs/4ZaIv5olNnOmbNpWraW+Y9jYj+ELFvMADoniJ?=
 =?Windows-1252?Q?QwM/vDTLiCd2yPKhCInDNCBxi+mLLrT+ImDB7TTEgQSU+4z39REHfNbo?=
 =?Windows-1252?Q?giPToGCyJkuBKSWtxHZ/hLLa4SXtuz3D8iyQcVcPrHNdMPeHckvmxakO?=
 =?Windows-1252?Q?uW848Ti+Bvx7xno/KQ+qMbVWdf3pgHGnRsxxvmtFCxkZOF4yItJn/0iP?=
 =?Windows-1252?Q?4ls8t2rUqLk+NdSe5aIQo/ZaJYfJoiX+dtoNjAju89ogGirmnXqh63gX?=
 =?Windows-1252?Q?wzqrfJeSdr6B7HLXq9Hb7iTbNx6uY/71HzFELj3Cq41L/bhcnUP8GGFG?=
 =?Windows-1252?Q?7oyUcB9pzLDwjbvkyxHk3s+jEfDzF8zkI+LYAGJWv+yufGKIHCWxwxTe?=
 =?Windows-1252?Q?wcd8N8tELmvt1wY2wZPgeCEZAxK7me4w50dOG9UByDR0Lx34O44FIzcn?=
 =?Windows-1252?Q?E4uZ1Or3YlPyoHovnY2QMAsgNHADW5zHk0g9IL7WThBXfp4N9J1Rrwpq?=
 =?Windows-1252?Q?rxfzaMgnWZMSROtF21JcCWcTDK4++qgDK3dMUEAc5epiLxlEkmaANKf0?=
 =?Windows-1252?Q?k1lKutWUSZNB57xsG6M5xksSKrJgSogO13tuA2YUY7zGrybTD8Q9ygmj?=
 =?Windows-1252?Q?98wJAdjKF9bBNKYNH2wT+LDT0jYohQW4raH4iLZiYiHO3okdscrZDgMY?=
 =?Windows-1252?Q?qtBqd5nasQ+r3PPCUIjbePySsF/BAvEuisrcnSMp3vl/4QCnVvfRFnf0?=
 =?Windows-1252?Q?OvS4gErkOBk46q/2Hq3YSyEOsvCjXSfVvxkuUxI6taImhnMdqNMLB2kw?=
 =?Windows-1252?Q?QIE3k1MbifHzULZWISszKhnc3ZXny0AEH274LRyK6po7qzU/703TTqSY?=
 =?Windows-1252?Q?7MwTo9R9YzUMAHOCYD3mOSamjooKgfo4GdRYQCeLwDZwp0V1ljQ5uRlm?=
 =?Windows-1252?Q?26e2+CvYfY8g6DEsSahF3+ekHq2x5xlRVaee+UXFLVOqRmBZkqiDGyZY?=
 =?Windows-1252?Q?8jhTkPbh1wWREBBbyhX4ooZb+jwZK6kUkvKzSU9YCDN97McY+9YOg+FI?=
 =?Windows-1252?Q?8OYQ1fKUia/9iQRFByQunNrAGuVJ8QFUklfygvup+us0iYV1LZQaPBfb?=
 =?Windows-1252?Q?8WSXIkc59i108ujqai3wnB5EDI0nXsBoU+UxXO036rOsaYL9+k5kQg4f?=
 =?Windows-1252?Q?GYbzdS8blR35pG/PWVqENVctTKXF6ONKsU9ZgPDaIow67r5xQeXcBV68?=
 =?Windows-1252?Q?tNVihk1MuixRu18vl1Az9xqcX5RifjvxqUWNqZoMQn/p1ee7clTvqJHG?=
 =?Windows-1252?Q?BOaon3UUOkWSmGLxEPVjaInzBKYXub1ZllyTudEXyPGTNnPBVE9nn4Bt?=
 =?Windows-1252?Q?kR2kJk/VQzUzn54uYjtCLQw9TSNUezWopiQNx/TyGG9XH/o/3lZQPD7b?=
 =?Windows-1252?Q?KQKfeD9tPQObjJ2XsnMjWePr2/wb1Prfuc5DJ59JLKNRclCOhYKxfz0n?=
 =?Windows-1252?Q?Xq6wnTpkj2PhaDdPw3afuw3EN6iSqNvsKh43Ih3HLVXBxVOYnv7Uy9p2?=
 =?Windows-1252?Q?oaENJlBtO83Z1DtwVQIAVh48DLmEijCWqyD49PUS9cZLRUoxyO3oU+9Y?=
 =?Windows-1252?Q?4rbxOtqQyszoIMC7vUg0PA5E7vGdi/cPpkLwHVneuAWXh6kiVZxjab//?=
 =?Windows-1252?Q?8Pb2j5LOXVW5eXbGp6v3MK1UFCqpipT8?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df697c4-50d0-4acc-f692-08dc9ce366f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2024 11:12:47.8249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hyP12sV6WJCCuK6LlbJJU3Etir9srKP1bGH4QoP/v3lvijkUA5jYMaE0H5laUBz3PnrIuYTwO1gJVUhMyhfCTNoG+luKgMBqJC/R1iVn66I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6726

hi,

> >
> > > -----Original Message-----
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, July 3, 2024 8:34 PM
> > > To: Lege Wang <lege.wang@jaguarmicro.com>
> > > Cc: virtio-comment@lists.linux.dev; vattunuru@marvell.com;
> > > ndabilpuram@marvell.com; parav@nvidia.com; Leo Liu
> > > <leo.liu@jaguarmicro.com>; Angus Chen <angus.chen@jaguarmicro.com>
> > > Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used
> > > buffer notification suppression mechanism
> > >
> > > External Mail: This email originated from OUTSIDE of the organization=
!
> > > Do not click links, open attachments or provide ANY information unles=
s you
> > > recognize the sender and know the content is safe.
> > >
> > >
> > > On Wed, Jul 03, 2024 at 12:14:01PM +0000, Lege Wang wrote:
> > > > hi,
> > > >
> > > > > > > After reading this and the text, I can't figure out how is th=
is feature
> > > > > > > supposed to work without races.  What if the device uses a bu=
ffer
> > > while
> > > > > > > the driver notification is in flight to the device?
> > > > > > Hmm, I think it doesn't matter, Only the used buffer enable not=
ification
> is
> > > > > > transmitted to device successfully, device starts to judge whet=
her it's
> time
> > > > > > to send used buffer notification to driver according to its int=
ernal
> > > interrupt
> > > > > policy.
> > > > >
> > > > > I don't understand what you are saying. If device has some magica=
l
> > > > > interrupt policy why do we need a notification from the driver
> > > > > at all.
> > > > >
> > > > > Conversely, if device relies on the notification and thinks that =
an
> > > > > interrupt is not needed (because it did not get the notification =
yet),
> > > > > while at the same time the driver is blocked waiting for an inter=
rupt,
> > > > > we get a deadlock.
> > > > No, I'm not saying that our interrupt policy is magical?? Let me ex=
plain a
> bit
> > > > more about its simple mechanism here, there're two basic parameters=
 to
> > > control
> > > > whether device should send used buffer notification to driver:
> > > >   1. number of used ring entries written since last used buffer not=
ification
> to
> > > driver,
> > > >     say threshold value is N.
> > > >   2. Max wait time to send a used buffer notification to driver.
> > > >
> > > > The work flow would look like below:
> > > > 1. driver enables used buffer notification initially when enabling =
virtio
> device
> > > > 2. driver is blocked waiting interrupt.
> > > > 3. if the number of used ring entries written by device is equal to=
 or
> greater
> > > than above threshold N,
> > > >   a used buffered notification is sent to driver immediately, or if=
 this
> > > condition is not met, but the period
> > > >   specified by max wait time has reached, device will still send on=
e used
> > > buffer notification to driver.
> > > >   And device will recount number of used ring entries written by de=
vice
> > > from zero and start another
> > > >   Max wait time timer.
> > > > 4. driver is waken up by interrupt, after it has processed used rin=
g entries,
> it'll
> > > start to wait for interrupt
> > > >   again and enable used buffer notification.
> > > > 5. go to step 2.
> > > >
> > > > >From above work flow, I don't think the deadlock you describe woul=
d
> > > happen.
> > > >
> > > > Regards,
> > > > Xiaoguang Wang
> > >
> > > 1. device sends an interrupt
> > > 2. device writes a used entry
> > >
> > > Will another interrupt be sent, with driver doing nothing at all?
> > Unless driver enables device's used buffer notification, the device wil=
l
> > not send an interrupt.
> >
> > Regards,
> > Xiaoguang Wang
>=20
> how about this:
> 1. device sends an interrupt
> 2. device writes a used entry
> 2. driver enables interrupt

Indeed enabling used buffer notification and sending used buffer notificati=
on are matched operations.
Time-sequence |  driver           |  device
T1           | enable notification  |
T2           |                  |  send notification
T3           |                  |
T4           | enable notification  |
T5           |                  |  send notification

That means once driver enables interrupt, device will ensure that it will s=
end an
Interrupt if there are used events written. If driver does not enable inter=
rupt at all,
Device will not send interrupt.

But yet there is a case to take care, which driver does not handle all used=
 buffer events it received,
parav explained It would happen before. As I said in this proposal, when dr=
iver enables interrupt, it'll
also send driver's last_used_idx info to device, see below handling:
  1 driver enable interrupt
  2 driver submit 5 requests
  3 all 5 request are completed, device sends interrupt, now device's used_=
idx is 5.
  4 driver gets interrupt, and it just handled 3 requests, so last_used_idx=
 is 3.
  5 driver enables interrupt and attach last_used_idx(3) info.
  6 device will know that driver does not handle 2 requests and will add th=
ese two requests to
    the number of used ring entries written since last used buffer notifica=
tion, that means
    though if there is no new used ring entries written, because of these t=
wo outstanding requests,
    device will still send an interrupt.

So I still think the deadlock you describe would not happen.

Regards,
Xiaoguang Wang

> to

Regards,
Xiaoguang Wang
>=20
>=20
>=20
> > >
> > >
> > >
> > > > >
> > > > >
> > > > > --
> > > > > MST

