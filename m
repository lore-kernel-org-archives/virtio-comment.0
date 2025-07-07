Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2084.outbound.protection.outlook.com [40.107.95.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF08270EAA
	for <virtio-comment@lists.linux.dev>; Mon,  7 Jul 2025 05:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751866455; cv=fail; b=lVYoowxuO9p2RQXxb7DcgGOUOaE36W+gbTjCtVDXEPP++JKv9anS36UIruQoaZ+ol9t75D/0VE6VkT+EHkCFeRyRypxyqyHMdSStkEclSbOlWAibO++8FZwpnmwlGn7sbRMkxFPNe6//XGlR2VqKYkwcoOrB9RiF87LG51mrCaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751866455; c=relaxed/simple;
	bh=MNuBAnB+zagaa+qmk67JyDtcsVUexGQu5fqCYxmERNk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UuC86PTKylwEYNKzj7vEAAq1z7icNnXagprvBP7V6p/NOJw8kdFUVYcvT/x2mabZXBRgJgmK/Npabv0LUnrkDhbCLBxlwjW+BokU/I8e0KEFjRw959aB1UrnAw7F+Az+uLPZQ2ieWW2WZXh7S9CSpNxAQFzhkO3/XyTxns6BAKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cZcLDY46; arc=fail smtp.client-ip=40.107.95.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cZcLDY46"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYZlGhYbnntB5+/gadKJ8HYtmkdpFg2SJCc6zW9gAWPtiPsYK3WHxGAH85HUEKIJbSLGk7PutBcpLurvNP3/UU+x87Umddwhj3w25Ru4j77O5dj2U/Gu2zOvEbyc1bVHt0DatW5HsSyHkSsCXIeHV0V3g+fgfxwH6cV+h3Immpv09+YaO3Q1orjp7whKZ6YEE/UEjK1RfTUkWm2SUpJ7+Y7U2ACPxEwpiCyHt8zJjHGz0SJBm9vXZFKE+PNd+WierZffjpeFLE/DqGaqE4iAPYQMRM166I5LbPt1FqbtDgvTOWkxlZUro6+ZVJ6T6njJdTfN1Y+jI1zF74WDmXYisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ifa1M1q2iLVyLoDbkUW9IeWBg23jvSVZaSVPVFrE5oE=;
 b=iTGLZXSDkT472sxVaSkpZyuzsw8XLFXj7Bk/cy9u8qKjWP4TnhahymGy2R3ukRsaCEEqcII4OMq0R2S89W/FVyj026V0T6434k1Fyfz33zyF0lCUSZvPbdSSThN/SWXGV67O5fojoA7JNgswij68YWZYayOzvylnSVg4B9JB02Np4a1d36SP6Kr2cSYBNB8Pjqb2ngigV6vpo5uoeGVxZoTtIcTwEiXzEdYZL4UVAdtYi1/LOQazRc3GFsEASnmR0sqInTEHOnG7P87DzfH2YGtWiljePW589t3Rkh6zBnKGFnRQHULa8tE4ERybXO8I9/LaCHXdz9qEqUMPGPbY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ifa1M1q2iLVyLoDbkUW9IeWBg23jvSVZaSVPVFrE5oE=;
 b=cZcLDY46+HLY+vNz/7pLljS+Z97ituZ3gPldiCQOWsw7Alwhu+BgfP8TVSpbrNfsDOHLczfd7FlV2p+Qp3mKCQVUItA78q2WsoQagisniAhaREWI6crtj2iCEoSdUfCt9RbGkfGeQj9IfbFJOmlrYmKaT2XPaQBMvkO261snq4m1kW1hY3g9px1TPgStPYugLdpyDw04aveBKNoAWoF9YLMEtYwOU3CajLXHRyxPXlyyCjGeQWcIp0+HFBJP4FCiMb3T0JBbZ58ga7jTbwKVgf93DufQfUisxVnWwtKl1szdSUIg1qMTbSYCti65ZS1KnUPLni8Ij99k9mRdgmXQjA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by BN3PR12MB9569.namprd12.prod.outlook.com (2603:10b6:408:2ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 05:34:10 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8880.029; Mon, 7 Jul 2025
 05:34:10 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "ij@kernel.org" <ij@kernel.org>,
	"ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v9 RESEND 0/2] Update ECN and Add Accurate ECN feature
Thread-Topic: [PATCH v9 RESEND 0/2] Update ECN and Add Accurate ECN feature
Thread-Index: AQHb5BeCIh2hpnd5a0y1aDY3s1sZXrQeTpiAgAbI6ICAAAZTgIABGmuA
Date: Mon, 7 Jul 2025 05:34:10 +0000
Message-ID:
 <CY8PR12MB719538CDDAC1EEA6DDF7E250DC4FA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250623081847.21264-1-chia-yu.chang@nokia-bell-labs.com>
 <PAXPR07MB7984F5C4CFBB42A74690F103A340A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB71958D120A087B79243A79D7DC4CA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250706083812-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250706083812-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|BN3PR12MB9569:EE_
x-ms-office365-filtering-correlation-id: d20dd53e-3bed-4732-6ea7-08ddbd17e653
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?z/jIPzaAKdX6qHC13ihIFK7BBUFy31vio8y0dGuezD5N4ZoNCdPEZTceNwKl?=
 =?us-ascii?Q?EY+trr2YE+UvhJGNq4ZgeJp7AT6KdaUKolJtfMuS+mgbVnL+i9hd3QNuY/eU?=
 =?us-ascii?Q?YJUWESrdSRMXYMwnpuZMPzTFOSkb/JMX4N16C+8VglcWr9BUght14v+boFEB?=
 =?us-ascii?Q?1vjKpnsl2pDj1pFlHPdiXiXOlzewtm6PCea0FSfu94r1UxXxzW2l7JK5Xd8r?=
 =?us-ascii?Q?yu8QFU4lSHPeP0yNJ2kRa8lIWS7MsmQ+LRxb2i3MflGSn/eX4hU6odEtv5NH?=
 =?us-ascii?Q?odurMgp7esfmQcPkgaEBD9QoWbu14fX2rrtVpxcukeRnX3V5T40o0RDbAx+y?=
 =?us-ascii?Q?DdcSecaYxK0rZvg7x/NMGdTbdTidfuF7lWcm282xAYepDSEuT8+B+BzeTgJH?=
 =?us-ascii?Q?QVyOEfIPk3cd/WyJf7Rf5YeroJIgBpZaOCR8mHNb/fFDIm83ANLT/yctKLT8?=
 =?us-ascii?Q?kHAC5/BmYEPMeQpdPVj7S9oQJaMY0p1EN60TkERzjUvkwC8Fx9zNPOj1pwER?=
 =?us-ascii?Q?DeDKaB6k5Jd/F+yssQgqtsV6wxM3QvaA+3zFH1OlJf4r121kYLWbjBLGhjyp?=
 =?us-ascii?Q?Z2OhagrhXg5ruMtB8ERr9atpoQ8RdFf7gFhLIEjfPUfTT5rldBnMs5qyj9M/?=
 =?us-ascii?Q?XYsc9zvCFUBl6kUcyoUlWE1s4kR2gJG74x1JK6akkFGHs1LP63w7HWQsqX2d?=
 =?us-ascii?Q?aUMVjsU02hzB+S7Kkayzwt/NGvGdgbOEjkP6abYdZS+GUk+FLn7nJmKRxlx2?=
 =?us-ascii?Q?8TYJcp5TK1qyZqD0ZHgESjcGbCbThiMLXJvN+3dUX12td9CxBf9+lytdsHTn?=
 =?us-ascii?Q?2/alKeRNYfZokCjD1RcEktzq8sGkBmZJW0a8Hm1saBvqmh+Z2WLolSmStIRD?=
 =?us-ascii?Q?UQdI9wF3TNglmjeCeFyScU10PMOP3NZr2bO5dOhMBkzTv4ZPqPmGMa/V9joD?=
 =?us-ascii?Q?34lph6Fqip+AArCxuiFe8bZbQTDe1MgB/j8Ke6NbTtC3LRJ+pkKAW+QFbijz?=
 =?us-ascii?Q?dC0y0dDjG7pOp7ph0L+cP/mqyllNqaG2ZhsnPBkChXoV82HNsey7c7kJxaQj?=
 =?us-ascii?Q?eyacETfyC/uQcunaq6+SV8eQAto0qJOBCNaVyWpRSHptikjIOBIiJ4wuNWHp?=
 =?us-ascii?Q?HH5iBS4MHLV2tRBjGfy+MsKTZ7CaHCwGEdC3Tl7Mqv+BRTVCnVhM8Z94Kfur?=
 =?us-ascii?Q?qa0ZpPAHjb3Vrr60EvICiEScLSNm7Y6bnHdYuFkdd3DDRik+13YEyJdp1Twp?=
 =?us-ascii?Q?envJK17EE18KiLC3yjic9pm9M2AdRYK/vGE4Zmp2b/IgZ5V8xKLWuR4+rV6E?=
 =?us-ascii?Q?XQtNWhEu2F9GSx7fWb0XCNzvsSnfw+5E6yWXZVRkpe2oxL2smNHPSNBGwK8t?=
 =?us-ascii?Q?PPGU8z+6Hod4FERrjPFe9V3OOf7IwvSA+SLriwviF/1NAn6VKN6NjKreJA4B?=
 =?us-ascii?Q?gEJI3eT9SNsoE8rPN8oDckJK7etU0R5PrmFY/BsuihmVUy/srgdUAB1krJ1B?=
 =?us-ascii?Q?05BrCkINhf7XFdQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ic0oIQZljUVstOyIW4H8AJg05MimxArCuLQJvegjKRrY/zZrk4W58mdAZ+QX?=
 =?us-ascii?Q?KGGnwBql0nEsOwvAW8f54Ix4+yYOINfarP0Fltc+yNl+PufE1FCpHtrCPawA?=
 =?us-ascii?Q?Rq2IXwQtPUUEi0CAR/J10EhR/yerqNCOSyhbTvJIVRoBAg442pS1/rK28c4q?=
 =?us-ascii?Q?SFfUJM/DhflvfzGBwXIlmEvFlv2qwMVpHF2hHlYO1gyy+xkAD6pPfv6qgYjv?=
 =?us-ascii?Q?GMjhwhD80kuDOnTpLhTDpE/l55jvguN0nmBrGOd7otTQzHEuPIz5Z8EfM/rt?=
 =?us-ascii?Q?WVzpkDAmCCKDL8himGgrrvXcwnXOm4R/IUWgK9vGx8APlVeikFHS+pd7iM64?=
 =?us-ascii?Q?qI1qdsYT2liD4ZvuUe+MHtFFXKMaHwGUFKZGVaD94cjDPgiDaj+CtIrsA6p/?=
 =?us-ascii?Q?9O3X/VfzPPjIATtkOVc8cFjFDx/NEyL4K9YP3XH5F/rUms+nmUDgF8Clq9Y6?=
 =?us-ascii?Q?FepqkapiVkPDrdBhZXjqYeNHLoxAmeHBpkyi0rYv03j0D4nHSAe65HLjHKYM?=
 =?us-ascii?Q?7NDkGNayk4lDf4mL2bEeHvM0EVMwBD4ssSHhMhTuslVF9Cpi9aycmNEWLrgw?=
 =?us-ascii?Q?H0wbBFefvR0TNtunUGdw4f7uGV6zuvQedmVmml635DFjgv5C6p5aIFcYmCHr?=
 =?us-ascii?Q?ABdwqUhj2ibX/PULTU/stDvfy7x6+gTaAfcWcO/RpS7EViPgF4cTHcP/0nuK?=
 =?us-ascii?Q?oSTidONaIeWHSe5ierIhkeb6uhwI0k2+003KbWUoRrLTB8tiBaNa/8AGymNg?=
 =?us-ascii?Q?mV9UFPOZdyn0LuHRJFVccv1z37IbdgWwdUwNgdEiZ4ynfNdmTSjTSpptPYjy?=
 =?us-ascii?Q?85fF+bVa7C9hQ34g6QoPvEO4Bl2Y/ghTODnltgmGnwBpT75YjH4zEdi8BLK8?=
 =?us-ascii?Q?WpLbdpmKC+rAhwy2+P9w5m2nNplgKn/brV1mCQUKvrenmkTxGqqjMy/srFs9?=
 =?us-ascii?Q?itCTpf5/jxcPHEyni4NUUuL8tdpHxAlddphjxTfRIZSPyLxHpJhzVGdVLn+p?=
 =?us-ascii?Q?2YbEnqM/7EVXLpDce3GXDbK/8c2mSClYWM/sKSsoHQB30O1YTSLss4pzzCJg?=
 =?us-ascii?Q?e892dxRkxPPY5Zsm3Wb9cEu6+938C+dh63pPx/fPpzm3QioK3J0xUe4MMEB0?=
 =?us-ascii?Q?wMzTTDZa2NcnepWKv/evsHVC6GDJGGrS5bXkd+Ai5ZqgcyJsRj0rhplvRE6R?=
 =?us-ascii?Q?enniKF9zjRSwiVy7TSW5BIcsq9zlzYq8l+FfO2FDRICy2Nn8jR5H/djqbKqw?=
 =?us-ascii?Q?rE4i8c6S3dFqefX8T7RPjLWd3nS4MTyu2aqNVx/GCyo8gEaf9U8Q+nfZ5Aq5?=
 =?us-ascii?Q?2enHaw+LX70bnFl0Ieel2xBPkW+BnoGojW79kaG51WYQsyqHIr/Nd5uNztbH?=
 =?us-ascii?Q?yOMHRQMcduP7fZYqkAicgQwXB3Tf9lumPaKoyg//2ODFfeo/4AbP2XFgFnPq?=
 =?us-ascii?Q?3qUV8KXkMBWGuVF+JMB4K2r5dcfBz+zx2mRaaXa6cbqDA+zT5B9ZqzD6Ita6?=
 =?us-ascii?Q?W7WdUlA3rTDKUiF4xQ69ezLfyKpGxXOD3n6l2Xc35FvimjYkLsDDA83F08LI?=
 =?us-ascii?Q?nhDTKUKzgIwQ+K0yqmc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d20dd53e-3bed-4732-6ea7-08ddbd17e653
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 05:34:10.2044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lxIxz8f8d8PyfynijwLzRZtYzpetU4iMW8NcPxq3zngi1VdYrwL3FiEiv25EyUJ1sEASSO70TfPzwuIrRzxfAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9569


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 06 July 2025 06:09 PM
>=20
> On Sun, Jul 06, 2025 at 12:23:36PM +0000, Parav Pandit wrote:
> > Hi Chia-Yu,
> >
> > > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > Sent: 02 July 2025 10:10 AM
> > >
> > > Hello,
> > >
> > > 	Just want to reach out and check is there any comment on our
> > > submitted ECN and AccECN patches?
> > > 	Thanks.
> > >
> > The IETF document referred in in draft stage that expires on 10 May 202=
4 at
> [1].
> > Is there a newer draft which hasn't expired yet, or link to a proposed
> standard or Internet standard link?
> >
> > [1]
> > https://datatracker.ietf.org/doc/html/draft-ietf-tcpm-accurate-ecn-28
>=20
>=20
> This seems to point at the latest one:
> https://datatracker.ietf.org/doc/draft-ietf-tcpm-accurate-ecn/

Ah ok. Yes. This v9 and respective kernel changes in v12 that I was reviewi=
ng were still pointing to the expired link.
However, the URL in introduction.tex is upto date.
