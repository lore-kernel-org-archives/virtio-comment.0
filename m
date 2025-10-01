Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E801519AC
	for <virtio-comment@lists.linux.dev>; Wed,  1 Oct 2025 04:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759292632; cv=fail; b=lRObMmns64Wgq20lY7dA5hwzxWF2XrrUjVNX0kSfticHR+ND0MgGF5AdciG4Yb3x4nbVdPkIWjXCxQyhzUevP7JBCzYCg7UkbHGi2lhWM3pZBlJofDJ+xZetbNtAzeHFtVGrdw99BhcwOP8MKoVqfxi99CBTgnxb5YxPGwwP36g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759292632; c=relaxed/simple;
	bh=GvfzOzLc83KVzBXDtrkwVNT2KHE2xONuzSpHBeoFMmg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OypgvaatmuxyNfro26n6MmIMhljL/J+OIgItn5QLiUJGS25Ev7WL2Nxkjq6/NTAq+NoXGO6XdtAkKyLobyQwonstSbhrD3L7CFhmMONTDcVBvyB2J6b0+bL01IBQbTy60XqMr+Iek5AhPl/azf8gMpNokfgWO0iWQ9uGG09X8bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VpAP42w+; arc=fail smtp.client-ip=52.101.52.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VpAP42w+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDIhRtgTP5UVYE72lHOc128bxc/uzaQc6amJv/RGR2UiiwArKb7bG/GI+TQOn3leaqmG3SPvpM+dBWrQrK7ootEzVYBtJ2FpDFJel5QTcNA+GX875K7q4AQzbfxVq7VwJn3ZrfUziSAKo8EaPEsChp3jtUSb+b23Nu+DoIxXcn+IYYnVRUTPWxCsOMRROI9ynaqA1yjKMMElX1wO/wsA5Zi7hSEn2PGc/PPiy3btuvGFYh+S59MoHCWbXUXWyp8XIC8/N33p0wT3+hWWs26Czqi40IHbMGO4HLiqGBRXx3LKlWUmx8pNa1Rg/DlryFZ0YlxXB9c5WEGl8ZcTd5ZZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvfzOzLc83KVzBXDtrkwVNT2KHE2xONuzSpHBeoFMmg=;
 b=Ro2Md9kurI6HpvpZx1SqsQtQk2t/bXDBHzFNDQN5WSEcv8OR/MfcUJd+uWRpn48vjG1o+BiilnWV3X72rHbVh3fGPTKb0GQr6l7s/a6eFmKkbZLcft74V2XdSXzR3O1dYvsf5zox0JsXFm3i6HjZMSRBTjAu1egHrUfN0CgO5XZKZJqflaFfBczveMrEkm+hVYRRanE1Ldo/q41KaSP0/aIMHe9H1JBl9gPPXLqUm7+Rph1dYK51p0fBiptXj8mdiKzyVako3rj1TvfCzeKSAeQCqMRcxYKF/v1b4ZAoNbp/SVAiQByGWtZ6uusyeV40wA9Na41sfQ1acjJ2h4qynQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvfzOzLc83KVzBXDtrkwVNT2KHE2xONuzSpHBeoFMmg=;
 b=VpAP42w+YptslHca6PGeVMod2UPvp7Be/TlqLdnzQp7tpbTv3uwlYDlKV4qxRx+Hp8to+NNuhJ5wdfzDwe+rrP9oi+eQ0jcrU8E2uuDl85vMOfEvv7sQIYg7JbxGgmYR9NZDo0jv8VicVP+o7cj8XqhWi9DwjmZFYpvJDix1obF9lWGzagTzCMfjf0q0NpBO8fwgrAIGtnjQimkYtUBblcYV/z5ryzUbbvNsNBkG7Ux3XoV4gchfodaFUVr4SJlS4jbY/N50w44aYmA8tDaR2x1g4OpUykpBsZNXhX8aLyGhjTrSsW0niYBLqv+Xn0wem/TkSNgQfu/pdsl+5+f3xw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA1PR12MB8264.namprd12.prod.outlook.com (2603:10b6:208:3f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 04:23:47 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9160.014; Wed, 1 Oct 2025
 04:23:47 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index: AQHcDRMxc7D2+BxJGUa3jiZ0uZVtV7SqECZQgACnIACAALBIAIAAa1mAgAEnxVA=
Date: Wed, 1 Oct 2025 04:23:47 +0000
Message-ID:
 <CY8PR12MB719523226B3E785B8433C823DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <20250814120118.81787-2-chia-yu.chang@nokia-bell-labs.com>
 <CY8PR12MB7195670B68CC8F454DA821C6DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79843798615E61FA134A5428A31BA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <5f1f310d-8a17-414b-ac70-80028832a78b@nvidia.com>
 <PAXPR07MB7984310A505E7EDDCA0CBFA6A31AA@PAXPR07MB7984.eurprd07.prod.outlook.com>
In-Reply-To:
 <PAXPR07MB7984310A505E7EDDCA0CBFA6A31AA@PAXPR07MB7984.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA1PR12MB8264:EE_
x-ms-office365-filtering-correlation-id: 36059c78-68c8-4b31-4578-08de00a250b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|10070799003|7053199007|38070700021|13003099007|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TsbVWmoSbLZKfHu935UzXMLz9JGqKmnzCV63FbTulq+6Txltat7GyjtdHx1m?=
 =?us-ascii?Q?5raE2dUZXwqGz1gQ37keghQlYmbnz2fK3pYmspCpy1OCyYxn6DUioM1vg8zw?=
 =?us-ascii?Q?tlvie0Bzw5vLEaPK4IaH60rWzcTodUTuH+ygdRlvvwe5jWi/NRHMSJRFZgFi?=
 =?us-ascii?Q?0UsO3BNpWo5dctmqqezGrBPgkHGVS3TqX6xIMcNm29kSdth9Yk6FzkebzNLm?=
 =?us-ascii?Q?3DH2s3Jmb1ELX1PJdboy2/TOd8rzZq4cd82ok3XvllcqHfbr9HKeRjyACsdX?=
 =?us-ascii?Q?jUDpwNtzegBEc9iiGDYdWzhVEkgZGgRvnnMifwIeG5VTpdOlzSeLhPYADwx9?=
 =?us-ascii?Q?eN9hhOs9V8IBCxzppL2AimdyyfcvbYFrTL19AEU693+iNtCiBCiPClRM7zGI?=
 =?us-ascii?Q?3G9gTeZtfpdJhfrMZCNNERs1q7ca5BNs7NTOaZojkA6xs83EwZmBqzM1pAcU?=
 =?us-ascii?Q?KRbBjhTO/xtGRsRTPTfRUws+HeyNPqvCTzhoVZRlaNdPMBlcFTt7TxV2TiBl?=
 =?us-ascii?Q?qn/WGv8qTdipZwUK6rdm+IzVeXeGqfRjm66jjERjXy4F7TCh4OlX9QNqqebj?=
 =?us-ascii?Q?vuGTFOGt8axwuPt9zRBJgmIlcMpfoTRYOsZUbZiaKVRuka1KQJj8XYBHGUCY?=
 =?us-ascii?Q?vFVLk0kUJShV1vG92d4GNjKQikT+3Uy69cNDCc/Cz1RvTB0PGPsCmB1COlvy?=
 =?us-ascii?Q?/lAHXXWf2Wzx3Lqf+X/XhM/JEpNA2/DmUSc44Ixp9UK4arO8WoMBpMVoGKiA?=
 =?us-ascii?Q?Dh33xMiAGKQYTyj1Dfnn1EM9iO0r3qYPDBsBMBs7Zv75v4i0E2IwDNSOq0Km?=
 =?us-ascii?Q?WN6w9EqSbZO6mkmGVwCwlhXI8Wdjq69vyMkvxSVYeh0sdeilC1GjpyNP1FZi?=
 =?us-ascii?Q?MKrOHQfS1+rHLwnz3yItQRdNRxRmYTBlJNbeN5VY94hmd30UsNDHVdr20loC?=
 =?us-ascii?Q?5VxrlGjCaUmFt/VS2SsUKE2z50PuPDVvPI9BaMMr53eSx6fCcHfsszxsbckU?=
 =?us-ascii?Q?jxSHxwanDYcni55enHY0P9cpeppmgyQkfx9uWLp8ME7mbKWl6JM94cxqJ7fo?=
 =?us-ascii?Q?l+2oTolEkuOTl/PmHQYkPM2YZz2D+KzcuqDC+vm15VcQWWt5eFreGTjXBZYC?=
 =?us-ascii?Q?jMMOPf1tBmrQ19QuY8mg/mfJ7/O4qcHrzbVoiQztJ0k+sghaRvMuBHGIMAa6?=
 =?us-ascii?Q?34BnTXU669L3z93tIXD7+FdbTwfCIPMbR02Rwuhq9bWrViRLIRpUskefG4B4?=
 =?us-ascii?Q?8dtzQ15QF+NTSSGDAtdOy9AJZR8jb+8DzEGe0QMPjopxAAZEpmNosvhrgUbt?=
 =?us-ascii?Q?QT8nCZPULsr1dJtGDhfjBR0WMgE0QpWtrtrfcxbtf+hGYPUil7y7LFXhyK9+?=
 =?us-ascii?Q?94Aalqy8DvfX+LukGfDDC6UCrlxJ17PLxbR4VnhoJFyU26LsOQ2V4B8dJM/U?=
 =?us-ascii?Q?oPXm6VEnBw5Ts+xDyFe0Bo4t8ZT5gZdwxeRB+cXLaUISiofLjgzQbUFVlQUI?=
 =?us-ascii?Q?/Acc/eMVfo2ZHWY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(10070799003)(7053199007)(38070700021)(13003099007)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UXgY8RHIL+gg0PhxbrCwU3rAXzpTOG37PetrWF1MrgizIrxn+5tCUbbXvLVF?=
 =?us-ascii?Q?daRjazgdXVyeF1Rrxb+zFQB/H8KgMWWnBFtMsjSi5xu2Fx7cwoty5XlWLUWF?=
 =?us-ascii?Q?Op/3w/dvtD1n4ZFGFgS80j/WRYWY1D5B78PHNMxCEX0Ga3UQo0zhz61gBsrN?=
 =?us-ascii?Q?QFYa27pEYMaPl4IDL3Tb1myMD8O0XqZPEJsxEnF0nT5tG0SbK3em1fGGTtJD?=
 =?us-ascii?Q?fnLF1yPSn2+c0FEKa0CqvP+eix85aywKYBWaSPINGWKUYXlN69ZcAJ+m1l2r?=
 =?us-ascii?Q?TWD7ltpnyGaM22Ss/evIgBxaB/D21O11oKS8d3uB/Pi3w4skyCRWak3mfKV+?=
 =?us-ascii?Q?lm1xAN1fJqR6/2673F8PIoGLoWsZw2RTzWCrX24A/TYZigJrgVfgvvSxHUpb?=
 =?us-ascii?Q?+6z4gb2mdMkQdmlAW8/6/trdjg0z9C2+hhDdNBR8yBLEXytuNiWBWtU2bKdR?=
 =?us-ascii?Q?9BkN5bN8uNqyiPUQ6k0hg8jRCjwbF/tlKd9VYpI/1bPV/uqiPUCcSb+5DSJ6?=
 =?us-ascii?Q?IR0+eNmf2cAVlzD3PmKnGau2VVOe87C1Zp8Ot/C4fsjo2hYOY8yz1UiIvxOt?=
 =?us-ascii?Q?R50k+ldumNlVfkowIfryPfUWDXNXD5I8A90Ja0ZOsaA3FDHiDEp5HB6E0NYG?=
 =?us-ascii?Q?p/Og/53fzWBpmJq+eZgnGu2XXufTZ3Ke5KuHt3hnH2DoigmDfZmkKfM/GBXW?=
 =?us-ascii?Q?crI96NqIFw3n4B2+MShztQ8UYXX4fG6kNuF4/UAvD0ea2xDIJ091N4JicC1o?=
 =?us-ascii?Q?aZy3NAa/dk/kY8ukqfPL0EQZhdPlMKjH067l6MmTdhnSuqGTA0WXlcLqmLqd?=
 =?us-ascii?Q?mA4d+BSMSaSMkD0c7airrIWxz3ts6jkXqq4PjCvBRC84UijesJC71aLq3o8F?=
 =?us-ascii?Q?4IuBtkbyl9isCWiCXRMZ2713PYyXI3TcIAzV/ryJK6qaQLjhdj3cxee3i6fh?=
 =?us-ascii?Q?T2K9HLuYDek/Y5KzdOG3GeQroyExjUzclEbxrfh011fvoABa8SSo6WwsQ9ZX?=
 =?us-ascii?Q?OpML5PQ6Q7E9En761qPnZgGx4uh/dzlQ7hShfwZAwwkvhvqjUxvkQOFWT6bH?=
 =?us-ascii?Q?qcqt4J/2Ovmul6MaBsHxYOK95yQugi/mRbs3JPs+YFwOmu//LFKzezxzQaHb?=
 =?us-ascii?Q?8l8i75X2lD6al6ZmnvEiQ2JqcLekfVSuLz6EhHZlewr/ef8uGhwxcGlHwZhZ?=
 =?us-ascii?Q?KgmSYt3/AKmGQMnFBg2yi17QT03j4ecIGpgjgBwhZivJ+IwEZQvnsKU2nbxa?=
 =?us-ascii?Q?Zye6eZoHuZLZX7SIh+TXZPAWQKwCnP0W1N4gDIzKWYhPIt2AMjF6G/SG1Jxs?=
 =?us-ascii?Q?Esi/+UJOV7dGQkvOgutpPYVl7hUiX5jtABN9WUtLMdH8hc7No4pjFPNFubde?=
 =?us-ascii?Q?+uGwjuB6W7qJyRo2bbJJjl4ejsXqLUlUXSbPnw7J4QYX5Gdzklwm4xatp4Ez?=
 =?us-ascii?Q?n6MKV1j90d5yjEsZJLINFZ4mrWkmeZDdK2iYZw2cA7AIuX6OZ2DBlJfTrWys?=
 =?us-ascii?Q?TMxjTbvz0LNOQQVJX/hIdsl2fB7qnDa9v+7NWTwlxiDcyJn1fkr0E6cvd9qu?=
 =?us-ascii?Q?Qn88koKFfEmS7Wkx+h+qtaLK4LrYDM/lPa/HO2SvUBQi0HBksJf4Pq4o80FL?=
 =?us-ascii?Q?pgpZSIK5VqSsgumDQDjkZos=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 36059c78-68c8-4b31-4578-08de00a250b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 04:23:47.1558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IVytLQyMzAv5L1Azi5GjjnH5eQbHBbqYFJk1VRJQZmOxV5LywZgAOZIA0yBwk5yUHs+DAyM1f23zIoCdZJfTLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8264



> From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Tuesday, September 30, 2025 6:15 AM
> > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;
> > mvaralar@redhat.com; jasowang@redhat.com;
> xuanzhuo@linux.alibaba.com;
> > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De
> > Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > g.white@cablelabs.com; vidhi_goel@apple.com;
> > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > Subject: Re: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
> >
> >
> > CAUTION: This is an external email. Please be very careful when clickin=
g
> links or opening attachments. See the URL nok.it/ext for additional
> information.
> >
> >
> >
> > On 29-09-2025 11:14 pm, Chia-Yu Chang (Nokia) wrote:
> > >> -----Original Message-----
> > >> From: Parav Pandit <parav@nvidia.com>
> > >> Sent: Monday, September 29, 2025 9:48 AM
> > >> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > >> virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;
> > >> mvaralar@redhat.com; jasowang@redhat.com;
> > >> xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org;
> > >> ncardwell@google.com; Koen De Schepper (Nokia)
> > >> <koen.de_schepper@nokia-bell-labs.com>;
> > >> g.white@cablelabs.com; vidhi_goel@apple.com;
> > >> ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > >> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > >> descriptions
> > >>
> > >>
> > >> CAUTION: This is an external email. Please be very careful when clic=
king
> links or opening attachments. See the URL nok.it/ext for additional
> information.
> > >>
> > >>
> > >>
> > >> Hi,
> > >>
> > >>> From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-
> > >>> labs.com>
> > >>>
> > >>> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > >>>
> > >>> Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not
> > >>> mean that TCP has IP-ECN set; instead, it identifies that the TCP
> > >>> CWR flag is set and will be cleared from the second segment of an
> aggregated segment.
> > >>>
> > >> Above text is seems to be clarified only in commit message, not in t=
he
> spec changes below.
> > >> Can you please add it in the actual spec wording, including
> requirements?
> > > Hi Parav,
> > >
> > > This is to fix current error in virtio spec:
> > > "VIRTIO_NET_HDR_GSO_ECN is a flag within the VIRTIO_NET_HDR
> structure that indicates the TCP header of a packet has its Explicit Cong=
estion
> Notification (ECN) bit set, signifying congestion in the network"
> >
> > I am unable to find the above cited text in virtio spec.
> >
> > Do I miss to find above text in the spec?
> >
> >
> > What I read in spec is:
> >
> > The driver SHOULD NOT send to the device TCP packets requiring
> > segmentation offload which have the
> >
> > Explicit Congestion Notification bit set, unless the
> > VIRTIO_NET_F_HOST_ECN feature is negotiated, in
> >
> > which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> gso_type.
>=20
> Yes, you are right.
>=20
> > > TCP header does not have ECN bit, and this flag shall indicate the CW=
R bit
> of TCP header is set when doing the GSO for the first packet.
> > > The corresponding texts in RFC3168 are "When the TCP data sender is
> ready to set the CWR bit after reducing the congestion window, it SHOULD =
set
> the CWR bit only on the first new data packet that it transmits."
> > >
> > > So, do you think adding above texts in the commit message is ok?
> >
> > Yes, but only commit message is not enough. We need equivalent text in
> the description and in driver + device requirement section.
> >
> > Something like,
> >
> > When the device is transmitting packets of gso_type of segmentation typ=
e
> A, B, or C, and if driver requested gso_type of HOST_ECN, the device must=
 set
> the ECN bits in the IP header and CWR bit in the TCP header in the first =
data
> packet of the TCP or UDP segments.
> >
>=20
> I think the text changes are already proposed below.
>=20
> Or you can refer to my original email for better comparison:
> https://yhbt.net/lore/virtio-comment/5f1f310d-8a17-414b-ac70-80028832a78b=
@nvidia.com/T/#mc1750dcc26d74c9b19939c4e86dae8bbade6ec78
>=20
Above link indicates to follow the requirements from section 6.1.2 of RFC 3=
168.
Section 6.1.2 largely describes how TCP state machine to set the CWR bits.
It does not describe when doing GSO on tx, how first and non_first packets =
to be prepared by the device.
GSO of virtio net is stateless operation and segmentation does not interact=
 with RTT.

If I understand it right,
The requirement from the device is that if 64KB segmentation offload is don=
e with mtu of 4K, out of 16 packets, only the first TCP pkt to have ECN and=
 CWR bits set.

If yes, then we need to spell that out in the virtio spec requirements sect=
ion and description.

Similar wording to apply in patch_2 for accecn too.
