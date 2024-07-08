Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2053.outbound.protection.outlook.com [40.107.96.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84CC803
	for <virtio-comment@lists.linux.dev>; Mon,  8 Jul 2024 02:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720406276; cv=fail; b=X01pL71LGiT69J7d7eoPy/UR1VmMTAgwSX4OY2a8NWNuds7/oXOoWKji3PMk6vTJY+dm41YxpaOIWteQPXi2FN9CoWocQA9pohT09PsV1aFt3iBVSE70KR1xokpn4Lv1hF9yhJX9bae3llKnLZshGx5w6a7GVe3AlIJPBdJChC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720406276; c=relaxed/simple;
	bh=u1c0sXEGbhV573WcGoLGQW3bkJvu72sEoBX5orjj4WE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FfdPahS+l1vF0Hi4eIa6SWT1mv8JumUW+GvAL02j/mwQEFNShAVjdLdn1oRbcDkm87MGWAJJFZKC3juIvudaKM05SIfOFz+axGtYyc9YJ07PQbEk5SNyR6O4VbyX1JixoK2HShEho314OtfTgMgTM70zr925oqsK+tLX4af+6Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bfW3tV8f; arc=fail smtp.client-ip=40.107.96.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bfW3tV8f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXqwASgw4kQ+MX3mxcZlCJGesBOu0clq2o5Y4TQBdJgEye362fTGNOuing25PDGh5mkmIo27pExmmcq5QrMlmIQR4vnysKZAunomsPRzVIHNJ6M0WS/nLBbLZsiWbEvx1SdRwOc8Gw+C7ydXCMcdaLG4tLK3NnqRHi9O3Lm60TecjCdJEBFUTyPzHAj7Vy/YG0tQEnp0uuTWWHmm2YiTSnq2wzEu8CodOps5RvTjtsnHB9MVprFRggRWXFd9l1gmcm7E4pgZp9xU8dz/egCslpUT+NyTyHdvYgXNAp2lz6WG19XmgQjJoiXu2hDbwc2G4eCxu6lNX9zywFterR4MGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1c0sXEGbhV573WcGoLGQW3bkJvu72sEoBX5orjj4WE=;
 b=iGIz5bb9nxyoFaqi9Gj9vl6u0SEUlL80OVh4AI6a1Bq0hoMQmcQTbTGha2WTqIjcqYxk1pB+fB11cRaTLBOMxBFHLhVVtrsm0ezQxDotlycj0NAxSYvS+KGRcQFljtmJj4kj+DoyjWOULS8MAVO16kH6BsTtqvAT2pPEtbF/W+ea2Db2b8jzfqUX75bzQxlkK0lswb4/8tUROka+uHo3A5MmahaaiGisFkd5occQGIp2uMDcl7u3IYOP1tZhea+Jc/HL87qoaO15iofwibcNPSCoYqM4R9UDqG/7m1jeohmDE6YHwKGtoAmaJ0guUH6WHVv+iJj3vrqMj8LG1VpDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1c0sXEGbhV573WcGoLGQW3bkJvu72sEoBX5orjj4WE=;
 b=bfW3tV8fkfb9TTUNZdZvUq4VEFNQ+EdkgYw/mo73B0iPnXzOwfSfjmUfnGZWkplpgWB1taDFm9OW+Da7F0skanfhputwTxHwtjOTOdol5Bq/JSExL31rIZSZoKq6SW6wvzwqGPmFBkeLrGD9Y56x4ghRYxAaQcmRSqNkXErWtxom0xLj5+ngAf5PKavgZzygDrBFPrJQLl/ZJ8cN6RLb2VA2CnT1Lar6/S0SGxoT+Oq2lb8gS6Z6b4CHMpSz4Lo5ArUR2aWqPpg6lgIA8ADCSBMCE7OFxFlwBR2hfqSeKPCwYGWoTkbK0XnmzjzbTZPl+aVY979GV1qfWSi1AhjLnw==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CH3PR12MB7642.namprd12.prod.outlook.com (2603:10b6:610:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 02:37:48 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 02:37:48 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Lege Wang <lege.wang@jaguarmicro.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, Leo Liu <leo.liu@jaguarmicro.com>, Angus Chen
	<angus.chen@jaguarmicro.com>
Subject: RE: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Topic: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Index: AQHay2kPZP8Br6Dhi060PfrDxcGZPbHngeKAgAAR3xCAADYEAIAEXe5Q
Date: Mon, 8 Jul 2024 02:37:48 +0000
Message-ID:
 <PH0PR12MB54811099E1D77BA02C1C3314DCDA2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <SI2PR06MB5385346C86CF45806EC6E9F6FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <PH0PR12MB5481C9F0175734E5036FA2A6DCDF2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240705034926-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240705034926-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB7642:EE_
x-ms-office365-filtering-correlation-id: 539673cf-375c-465f-bece-08dc9ef6f4df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rY6Tc3lYfJTjdCB5B2xp6YWqMGW39tAglx4mMGo5G3f7euccWKhL6DhpWYuF?=
 =?us-ascii?Q?SyPdcdTno9kGwJmCd+q5MbFQJVnf+BqcS1oCZzKSxx0lYRGNtAmVUvMSsvi8?=
 =?us-ascii?Q?64njdhb8O9TfFpmMjpqrh5ODKvvmEys9RBodJDZvjADU+bGWpJM3lq/ChIqu?=
 =?us-ascii?Q?vkUd3KGX16iXOOz/ft7tV7fQZhHdG1sat567XGYcMA1Z+A/nVPpaiF8ub0D+?=
 =?us-ascii?Q?kHy8Hu9r4rAAhaho7dARz1NHEjcHDobOrzG0KJt1ZjP5tFOLSpcZnRiWAw4g?=
 =?us-ascii?Q?C7t2HPoKmdWPNPkPZeiZZQ/GyhVekvKhCOmemTdzV/6hW76TGQpSn5IXLKlE?=
 =?us-ascii?Q?XWxxWGVgTYym/ppSyrW6iSxdfUcYag/bgbSfNhi7mNMue1A5y1V/bvK3NrjG?=
 =?us-ascii?Q?0680fOtU2LD641TjJFc9AuD1xiKAhSRKhR+6BgcAG9yqlsQ85ZZBQA1LAAMx?=
 =?us-ascii?Q?wN9N8iVtgGZqS3a6vSuyy8dmLhap1XAYevzHP/HI6MC00Ceqk5OLyiCNdKDY?=
 =?us-ascii?Q?iuwJ1LOmKwFtCPkRud29KswaL/5+rM38cBJ/bghGK0nNQFkmds9hx8UQNh1I?=
 =?us-ascii?Q?djqDufwLvnck2Npx1JDEi0G0kt6eNErb0HQDljbwmsejHtjiP9VDE1Ghkw4b?=
 =?us-ascii?Q?c0P67V+iePtKj/fYPYzaPoNFTZpTjpii2bUsEXhyUDNXL9pYTZ6uZfSsHAaq?=
 =?us-ascii?Q?SzucwAmrrbJbqbAcK/TNQe096cuVYUeyNK9zVN9MQRpu3d4bSlQfkujeXnYj?=
 =?us-ascii?Q?mVaTrJNbNzsfd5NIVeS3hLVJzSujhCfuKxa/i99RfdGaBV9KdJ6jfvEd3+JW?=
 =?us-ascii?Q?tBWJBNvqciU0yVePutr/WsGn6PqlXm3Okb0XZywrA5elp+7rUUg4pCtr+56v?=
 =?us-ascii?Q?Mg8J1Bh54pFLrc7uWQWdfxgpzL0Cn5Q7ClOoJ5Mpq1kzdCAJTeeizDQgm8D1?=
 =?us-ascii?Q?PWLfrfIqHzaJbX1tKmHd1L37P0hWyIwV5l8FYkTajeZN+YGPIm6qMU6iAtKZ?=
 =?us-ascii?Q?/Y6M4/HXSSXi6fCAqivPXdQPe72Ozj0PpB0DK+tjzhe7vEj5t5Z/GPNQu1dY?=
 =?us-ascii?Q?vsSAHgM6kdUbux911V6qH3OyVNTfd2qyJESEG13aoQem9XwpJTGaeDjflBOu?=
 =?us-ascii?Q?v8TItdpnBGRIfA5CZvwmZji6ag1SZ4ePJHk8uOjyXgWmaVgQhZWKN1OQtd+r?=
 =?us-ascii?Q?FvUaEGVLqLXNB39C0dcO1bnY9ILU0yMDgtJy6++mIeLFh6lTN2nFXTqIlJ4N?=
 =?us-ascii?Q?lSVD78UXu+H7S171t4UWvV47Km2Hjv3Eky0fajGOm5P50epsMe+mrO6h9WUn?=
 =?us-ascii?Q?xXiDPRQ/5Jl2EHFJF2imflSLCPBq9C5C7bPIp5wP0hqiVEkcT9enGVNpXZ8c?=
 =?us-ascii?Q?GFwex1aovYhAzp9DiurM+ma7+Nhxhve7WVsT6EvRZVRxy2knjw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ocumQb4S/H2966L1PRJN3slraj+3gUq/iyMwf8NQXsp8qj2gBm9+j1hpgD1Q?=
 =?us-ascii?Q?5gtYATgkpq70dwFt4nQs16GIXWpqKJJ3FILHQ4H7SPdUcKcn5WQFbRC2Wz8I?=
 =?us-ascii?Q?iGUXS5fZ7RnynizIy5gcdipgOlgEvSfwWM5MWtEXCpBFZ8TqfQlqSH3C/LVK?=
 =?us-ascii?Q?XdX1Btrlm0/vb7Jk/85R+ekMQJJo5+90aNVYSRVZnPiGiBeAKSQRH1PmOUg9?=
 =?us-ascii?Q?lDnPUIuNLQcIQPzDuFjwxDiP+Klw6flvCiL0LCxWJ+ROLh2sGwjMqJ5MoJjS?=
 =?us-ascii?Q?8QJ+7+By/BdveFtIovFTQsRtlEkwyGdzWmylB/bGHqQLE4wDl2R2Rxycx/hA?=
 =?us-ascii?Q?jA7t/VpGGpgU4aU+h3meP8A8uWq7jLSI0piNS/v2QcJ6fBFxVG1XzFA9+wr3?=
 =?us-ascii?Q?y1RbvcwtdgXxi3QmAQxy7nVRg+hySmspaBiwi8tX7wECqEPMGB1b8514TH8M?=
 =?us-ascii?Q?AUXcCJrS370naadyPEBLfiZcF/IjutoNbUIZV9TBbJ+HBofNTryHtrEG8hTI?=
 =?us-ascii?Q?ZRnd9Qm6b6lhWGGt6ZM9lrc9Ahh5VHyl0E1LHpcECfiRuAMEO7ste9TO8685?=
 =?us-ascii?Q?pESeHKe3vNvLjde8W4Zcc3C/jFwQWlTyM/p91C0aoUb44ur33QPKWK/lMqMi?=
 =?us-ascii?Q?kDXlTYbm9UZ8FuKhXdoW0BRSv0XiZcJP5mTBO3sE3fIBZvGQx6SaJDyH4pXa?=
 =?us-ascii?Q?fbtlU3z1EFBZGmKG3UNM5ZTEsjdLbqsJ/V6rOKss6DPpEsG3kGv8Lrj0P++f?=
 =?us-ascii?Q?SisgNYAmdDdh26FeLIeqVIMqKcQw9VQ6hnLeOUJnKdomh6fVqf+jr6NL1gdl?=
 =?us-ascii?Q?CXIjcM3k5Y5jo5Ws8OHO8MzIO1CfmvHvdLrA7CF86ukdO3vHmlih7vIVPy4K?=
 =?us-ascii?Q?Sr6sAEvNg3G0+yvn4oh0y72y635Kvr08WDB5mdEnVVpV7nJpuHahkbCqf9rP?=
 =?us-ascii?Q?wAoBpdHVxlr4lNyRWqTN4LJJBpCyfWYdZ8XpDos7fXaklIl5BUOcjb0YB+yt?=
 =?us-ascii?Q?gVsMf+U6zhPmA9t8uONXR554n1HRiaeT90Z40hPg7nTlRCWMosWWn7ycMFmM?=
 =?us-ascii?Q?RxJCF4t5Rw95aOFhADD9f9V54fpppltSsWVk9xyUDe0GM9vo/dLb+RkWQRi3?=
 =?us-ascii?Q?EC7XSS/Vx9ETsejvLp7Eje+m4ldyMWS0QaSuKfhsrKQK23KhTEp50aJ0MW+o?=
 =?us-ascii?Q?dfjTqZ/hAVlbwKYuj8OC27bbKptaP4ZrwLpHaNy+YjEkkSBt64emjWHzgSo9?=
 =?us-ascii?Q?+OJXx2S/noBhck4ygjX6i/idZdD6Qb2evlJpshMaeh2kX7tzD9IBt9fTiM8I?=
 =?us-ascii?Q?IHvAm9DYr0CnaCx3tIZ9e9kKIfDOXHShDFwBaZBKimWx+sJ9wpyEgjCuYPkG?=
 =?us-ascii?Q?+nEg2Fsm7MTMJ8q2aS+DPvm47U9OlmRuS+hLWCl25GRh0SiMxWg7Dibhvk5C?=
 =?us-ascii?Q?Z287UsRa9AoM1cG2H73aBulDe46NwF1CXi4JI7/67RCPNM40WIAEPBslpfEc?=
 =?us-ascii?Q?mYDv6s2KZ2sF2q3ID0rTVNJf1tUWp0tCr/q9Ya7MZEicBL9TjGRepYdLvcVT?=
 =?us-ascii?Q?AmNMl/jrrfP7Vf6pYoo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 539673cf-375c-465f-bece-08dc9ef6f4df
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 02:37:48.6620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ujJmwOZRpXzyt5BMJwB44dU2uaw+OQSkh3hDGYzCnVexVXqWH8JZIX58lRFd6PN8+inls1tam1iM0qZqkVqUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7642



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, July 5, 2024 1:23 PM
>=20
> On Fri, Jul 05, 2024 at 04:42:52AM +0000, Parav Pandit wrote:
> > Hi Lege Wang,
> >
> >
> > > From: Lege Wang <lege.wang@jaguarmicro.com>
> > > Sent: Friday, July 5, 2024 9:05 AM
> > >
> > > hi
> > >
> > > Thanks for your comments in previous discussions.
> > > I'd like to confirm that do you understand this proposal's idea now.
> > > If yes, I may start to prepare a more formal V2.
> > >
> >
> > Notification enablement offset adjacent to current notification offset =
seems
> a better approach than adding the new capability for following reasons.
> >
> > 1. pci capability area (non-extended cap) is full to its capacity. New =
addition
> can only work in theory.
> > An obvious alternative is to add the extended cap and add there.
> > However, it is not a good idea either as the PCI spec strongly recommen=
ds
> to not keep adding vendor specific stuff in the PCI capability section.
>=20
> Can you point me to the relevant section in the spec?
>
Yes, the section of "DEVICE-SPECIFIC REGISTERS IN CONFIGURATION SPACE".
=20
> > (even though an option is kept for the vendor capability).
>=20
> Interesting. EP guys are also asking about putting the capabilities in a =
BAR. So
> we might want an option to move all capabilities there.
>=20
> > 2. New area adjacent to current offset can further is simple enough to
> utilize.
> > There is no good reason to complicate by another extended cap.
> > If there is one, lets discuss it first.
>=20
> We might want to pass more data inline in the notification going forward.
> Also kick and suppression can be handled by different entities, they woul=
d
> need to be in different pages.
The kick and suppression are indeed different entities who handled.
I didn't understand the need of different pages. Most nics and storage adap=
ters have them in single page.
Can you please explain why it should be in different page?

> Basically, don't combine unrelated things in one place.
Would like to understand if separate address is enough instead of page.

>=20
> --
> MST

