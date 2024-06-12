Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C6E171C4
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 03:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718164314; cv=fail; b=NY96UaX1S5xKIlEf93WqU67v3l6kISEXdsaUC6qJVNYVFJF6OpsyjECaBNSvUhnWwqiKGbkfnnDe+zO2W3mY2hGmRyxxVyajfMDCIAqJqrDQwnanJGv6s1zIJoRVAF7GvSOTuG9j79w9KjuoiunH1YGLiJeSy1UG2CDTpAS/Je8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718164314; c=relaxed/simple;
	bh=xSCY+q1d8+fij4dw242ioT08X7I+Z1YUBuNVbDWWmzU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N6WnCQ0xM3J9OJAumwNXkuHWpW3+UhgP6TlsL8KWvTABCy0A7TVKfKFfuElabmRzAwc7JXqAY8M7ORkux3tK2zmtw/c0K3CnWHJVKAtXrba+k0ykeOEhfo1bZayHjPODI3GuryU77peOA9ZHP6bv8KRT3g/m6qINwDKY8pVlVVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Yg6w2hro; arc=fail smtp.client-ip=40.107.243.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yg6w2hro"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCwMpJPG/f9JpaSrrxFNEcJ8Xlp0SrTAwP88yfW7YmYrOxHwRHkpU6qOVlImhByHVEk9ccwDCGxiqQcrpn71seIm6mhSDn4vp0SdM81pIGx7JYYeb95Hr63o3SNaHa97DoD8smaSea7/I6ANfA/D5h/BphiNzAtFJTldNQP6ncQyaBLonvh+4NYgKbd5PMk71Xq7SteYgOcb0ZjDOwasS+HSfx+oHHuhRj6XJpfGKLGkWC012cw+X1+8WUsXy1ZFk+KGTAZNfS8KQsMr/zUvE/qQStak1oAmLpm8uxUZQmyiz7hZQbBDvdTgZ8OXc+98Tb52aacG5HKRA3nJ5doy2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIHy/owD5VxESBLj0TZJaNFYx6nlZPOdabFHFWuSTfo=;
 b=FDwvO3IzLFTTUK//g8O80kn5GAP2ya5Kru5u8/a2yezaVkXYRYDMnnhlzIHYgQN10IKwpwCDAFjFdyU70FCUGYOWKcqiu1k7KkCdx+m8/IMWBy8WRmjjKt8Rz21KjHJNOOe78FQkRnyB+RsvFRGsx2Ho6nis/CZcNQOmZBjFz3rkl1M+KnezeU7XJNMsi+xbfb5yFHNIw62DCc7NL5C8LwFhGCQ+aU6VQfM5lPID/aLGWWQRTq6S6bCjlPm+SxKH0Fz2xUIToLi2uOIVWrbiA4BYiFMFTFlqcSnUqCbTuhVpkuOeAPwvhTY90HpZkX1TNlG3eYx0DsvO8zc3iSOubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIHy/owD5VxESBLj0TZJaNFYx6nlZPOdabFHFWuSTfo=;
 b=Yg6w2hromN4nJdE3R+OKgB6F1dCtQ0rZMPkAHv1CEYYvSlwzK40e08/hXWJAkCM/AoVNz4YB22Iemmp9gwFixR3hu3nUlLVIXntj9Z/kIhfGjouiVVzlcS4WgSeRl7TDyyLtsVuAKTjvlZEzszh2I6G6IWARAr9Ka2vckjYzEDvK2ecZM2oMq2ZOddHjZUgTLf9Q8sOxU69j7s09X9Ct3q7J8aSd+IBTt3t1XrjUV4QwKc+t+6xLSsXQLrUOMoXyZnXyIln0EVqSINJyj6TowJzmui5sH9b4VUAC4nEDJkyuKp49tU/jEVOEhOrqElb/v18aki3ay6GHv75L3UbVoQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by IA0PR12MB7749.namprd12.prod.outlook.com (2603:10b6:208:432::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 03:51:48 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 03:51:48 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Subject: RE: [PATCH] content: Add link for the feature bits chapter
Thread-Topic: [PATCH] content: Add link for the feature bits chapter
Thread-Index: AQHavCjmCNHfYxCVDUSynMuracSoELHDMSyAgABLXfA=
Date: Wed, 12 Jun 2024 03:51:48 +0000
Message-ID:
 <PH0PR12MB54813E40929A98725186EFA0DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240611175721.2550759-1-parav@nvidia.com>
 <20240611190949-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240611190949-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB7749:EE_
x-ms-office365-filtering-correlation-id: 54e1fdb9-9720-4bf9-4d3c-08dc8a92fca1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|376006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?g4595GzJN8JzJKlX9Fi/RnvsH2TnBmc9i+Ezl1d9a3YNwKbdEye9ORyyZCdi?=
 =?us-ascii?Q?xhkBO/GFyTXzHvXG30SSK0SgV6BBExXaK6RmVT89nC4GWXLkZQy9p8OsHn1N?=
 =?us-ascii?Q?HIY7zS2CpIxou1EEvcG4EDwZts2fIILouVlM6OacrYNmp7UZPzF9LrugBAVh?=
 =?us-ascii?Q?Lz8YM1uVfh5IU6QLTnN2VPAo0YxR8Y0lJ0TSbdb4p4Oxubk9scxYaO3Ylw05?=
 =?us-ascii?Q?ygauMJQALvJ/ChyNMyBXo7Twd7MGX783hNclQZwJdGZ2Q6ogRTxU6ijiVkzG?=
 =?us-ascii?Q?i4cg2S+V2sBomrnf6yJ8aafqoWLLhtzoIHwwnYRF08/ldTYCnnGUOfcFBTCh?=
 =?us-ascii?Q?BOkI2j39n94tuIEEi0psEScSscLxoAqFGP42jtZR+TdFWY2ZkJw0WAs/2zP0?=
 =?us-ascii?Q?LhtI1SYYJM+237CxGJCDOZFRJz1GtB7Mq7NfK5pREBakBsM7X5f8rIawbfDs?=
 =?us-ascii?Q?zAhQKHmc4ct+Uc7XaVDFnfmc05+dhc4W3Wg60cWjLKLHpNWsGYAMM0pN0FVL?=
 =?us-ascii?Q?mGZzepmqZdubDihEwyZL7FUwWER0UDBCgrVE6G8ZmF5O6IuCGdIXCglMvL4T?=
 =?us-ascii?Q?YkR07gqTQp5Z5YEWBtF3OyRiPpha/wYSbvXjwX7/8/WsMxVcxyQWZ2ZUoMA8?=
 =?us-ascii?Q?E2Avt0l6ZG7mtWPXC7Uh66HEEvlhQ9OVxqlg3CYApp49h4AAq9nySFJoZhxA?=
 =?us-ascii?Q?NzMD02NA24KXfyFEOwevKEness/QuVKsRSSzIXecHhMPh06lBx84TfXDOdBl?=
 =?us-ascii?Q?oFETguhJccZeZNV20gkd5jxdY+C1Kghcc4NPczt1xQCFjzzhYrLMC6ZtvZrv?=
 =?us-ascii?Q?6hEQezl6jnmc98SMobkCFYtxRuVG3cGv69yKfbrFOSJkrdY37v2uEfN4foF+?=
 =?us-ascii?Q?D0hF5XNc1dpJEL3wZW0l3ErxgPY/5KlSiv4qm4XD6M3Y3E/O9enztyzojbdn?=
 =?us-ascii?Q?SYIAN1Ny9WPjdTQB2VkKytHyfsspQTgMHobw1R740+p0tLagwPwjOxuOD96U?=
 =?us-ascii?Q?L8a+KkGApJl4xUmm1vSEd5FU5m8Py98v5Cc7PdD01lOPzirB0vj7LqpgqsNg?=
 =?us-ascii?Q?MHk0qYPkG5MmFMY4hK13N0MhVTrpXwDY4HzkUWmEWrl483SF+JXr7VeVCMw6?=
 =?us-ascii?Q?KmXGqtNh5O+0WVrkbuMOB7b5zBA4xOUIyMdga3KwqlX+ibnXQ73eR4CGnx/k?=
 =?us-ascii?Q?3xBhPeW+t6NqBvU4VYDKeJVSSiya/EWKra0G+GXTD+KHS3VMxZ4y8t9umvf5?=
 =?us-ascii?Q?+uTFaTH7oADr86ADdoZkpUBPpLVZd5OfWPkj2b6sIXw4rUGFB+Kx8EP8iy/M?=
 =?us-ascii?Q?XZgjW4kFy4bXq7sD83ImEbtz/vNJvKCBVcBQlI1v9iG8jLBB1j5fSlJdrB5g?=
 =?us-ascii?Q?2DJN1MY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?U2Tv3m8RVN5MNPimlQG4JIJ1zfr5biIMt6Lfn5Vv3pff94tSNiAy0BQE7O9D?=
 =?us-ascii?Q?nMPz+P4ME4TDuEiDfAUfM0uD0ul/qsmIsJ/wH1GaE29m8OphZV5iKHYVulsb?=
 =?us-ascii?Q?PSvO8lV2ORgs4GqJc9SRIoe2dXE9duwUuIh7thV89lr9EAje8bQuroig5FAL?=
 =?us-ascii?Q?Ye25pmu65G1lPkohbHQIDBAUyBDlZn10F9j9/3gN7lwu46HUAzCrpP41epwn?=
 =?us-ascii?Q?PQRApdWdWzBInS2dFcSyOmI69w+4FBB060YQAw5eRO9CLGaz1J83IPQwRMGl?=
 =?us-ascii?Q?wgHlnJ2lU1P4H0FhGvAPUjGBtY1/rEuvC4p/uQHzYwuWAWBbnYrYpgs2PdOf?=
 =?us-ascii?Q?fzAtWxspPa8mX+owglIh2YbwJxya9VILgWQ/i9Cc7JV7b55D+eUb/usJdY4S?=
 =?us-ascii?Q?O49M8ztsyio3BnJBuEWVHhN9C7PbyVJxceGLOMP1l4I9UKM2mm5IG56qk+xO?=
 =?us-ascii?Q?DY2OZ/rVoKOUKWANrRdz7tzKoYjk7ka//Q4f2tMuHdWz8zFXW3+AnGWvPdlx?=
 =?us-ascii?Q?C+aDnIEMlnSzFWpxmz8miKdxZybhIr5j6FhxD3rJ3q5P45IxcbZzSefGEPmD?=
 =?us-ascii?Q?wE5POd4Yq+94R1MVJiFwTE33SSeDkai4iuOU1/TcO3qHiXUmA6jZwzYJAi43?=
 =?us-ascii?Q?a0MAuwr1+oypYLjaz6ggug+Ao+cur0MOFd0dG+BotHrTxpFCF5q5hemLB44S?=
 =?us-ascii?Q?tgmI90Wf+0za6cDDabyU6kLGDUEqEZ4UvAmHr4fc3XajdApHq3fOyJ25eUrq?=
 =?us-ascii?Q?u+Np6P4WxrygPKlYHWGObwzRurDZpoKf3a2EzzPEnwILKvhDDxbVc7MroAK5?=
 =?us-ascii?Q?ydbKWjrZ6eHX853Z72PD0AQHLgxakq+Hllwps93R/j3LhbPeeimgpDQ/8YmD?=
 =?us-ascii?Q?zL3WEZaqCDQJ8xVqoZlGQ9ySmtFrw+YoCrncMslV33/lpFcMnYAvZ+0VOFzJ?=
 =?us-ascii?Q?K5OUuVZwkLiMSUiDroseNsy64yAzV21Kc2v41gSJkgOWtBbzqsi7RQzbmdWg?=
 =?us-ascii?Q?ctplcD29hWBfui1y1Xts74NidD6c0jCBqE8oCjSR3yN3GMuwp1Wk+yuCpms6?=
 =?us-ascii?Q?1E8rMmAEn6FeaFBdORsMAH+hhm4QtS22uhVKbxRhTCC7kON3Fphf1Nl7MT8s?=
 =?us-ascii?Q?DoWBNQDVwIPIOvLInWNj/VbnD2dThR3sjcBqa/RefrCepif+/m9upM3XulzN?=
 =?us-ascii?Q?0b3rinQ0xK83WMki/5vP8Oktu7Y+F7fHtm3lXDoWzsqbUjJyF5e8ZCIWmfm3?=
 =?us-ascii?Q?ROH4oLSxuTrM3Hap0YUsYurQLkH1IVb7TKYJRKZDw3+J+Lyy+IpCEQwJ0BFm?=
 =?us-ascii?Q?QXlvckNo+oMysIW3SB+4UnL06i0oYqte0BOYbHKC3u4IPdDn3a0HDw37nAYR?=
 =?us-ascii?Q?LKwOpDHp6GLzSrTxV2ppqNKSMyWV9ITCFwelOP0tQIyjBUxr+q6U/bzi3iLV?=
 =?us-ascii?Q?rDfRaPLFc5Zoui7RvD0YK3frLuPKyIUveNnQB9isKwK4ykxzGPhZV6OZkiCM?=
 =?us-ascii?Q?4b5bBJLjH4ynSFcJiHLgQLbBl5ULeheLEgA7jqxwnDBBIe2GkSvIpX4p2u4n?=
 =?us-ascii?Q?tsPVgGnpXabIze3f3ng=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e1fdb9-9720-4bf9-4d3c-08dc8a92fca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 03:51:48.7508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hr76/XsLtScMRMSavCvBiR0fhhi/sGf1pbhqTXj3qzmOlqZXDzhiUwGBxG5Uk2Kqcq+QjOAeUr7cmo0KwdNFJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7749



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, June 12, 2024 4:42 AM
>=20
> On Tue, Jun 11, 2024 at 08:57:21PM +0300, Parav Pandit wrote:
> > Device common feature bits overview in the basic facilities and their
> > actual description are apart by 24 chapters.
> >
> > Help reader to directly reach out to feature bits definitions from the
> > basic chapter.
> >
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  content.tex | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/content.tex b/content.tex index 8849522..c3531e2 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -97,12 +97,10 @@ \section{Feature Bits}\label{sec:Basic Facilities
> > of a Virtio Device / Feature B  Feature bits are allocated as follows:
> >
> >  \begin{description}
> > -\item[0 to 23, and 50 to 127] Feature bits for the specific device
> > type
> > -
> > -\item[24 to 41] Feature bits reserved for extensions to the queue and
> > -  feature negotiation mechanisms
> > -
> > -\item[42 to 49, and 128 and above] Feature bits reserved for future
> extensions.
> > +\item\textbf{0 to 23, and 50 to 127} Feature bits for the specific
> > +device type \item\textbf{\hyperref[sec:Reserved Feature Bits]{24 to
> > +41}} Feature bits reserved for extensions to the queue and feature
> > +negotiation mechanisms
> > +\item\textbf{42 to 49, and 128 and above} Feature bits reserved for fu=
ture
> extensions.
> >  \end{description}
>=20
> Not everyone is browsing online, printing and reading should also work.
> So no need to be cute, just add (see \ref[sec:Reserved Feature Bits]) or =
some
> such at the end of the sentence.
Does hyperref break the printing and reading?
This didn't add any extra text for reference and reading in PDF was fine li=
ke before.
