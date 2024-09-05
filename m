Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FFA7FD
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 04:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509377; cv=fail; b=Bu8xzMg8A5gmhDfMd0Ps1bcnnrPgI2t9deMk3XfCafgXpEXYU8710JJ66j1aRjQM2sVlRz0SP/79D3rY1dn2nKcurCF8H8Z22WtT8HK/SE6zN86C9C8veKfkO2EAukPqCklZ5v5eUDHvkAD5XP7F393+8uA/wo9lIyw4FX3zg3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509377; c=relaxed/simple;
	bh=pSTVlM9QwlTIlreq3cLAW93AkHI0jaPAX5EFY5zWbGA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DfGdRdSqA6zlN10H/VjUsrUHZwdgHmGjB+XxQsBZ+weI1exL+scoOQ5I886ylnh04yq20nJhslr4rCkz8gdU9CGwcNmTgIBBrTxC/EkigMj/m7hO7BRyidzSrbTGK3GMIWcb9D0qx2ZAtUGmd+aYTVMtN8Rrh8dUEnWZE/Mh9FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I8/r/qL8; arc=fail smtp.client-ip=40.107.220.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I8/r/qL8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAY0L417SX3wulb1rJ2sQZfmionqZFoyt6D6DyAiU8XVdxZCvVQCt6fGn9njGPwwuufmYa/nJMexJQBPbKt0HR5/Z7MjcZ+X7OAf+qrvGubryj40Grv8ploeOo+HYEgs0CUtWlTNaGpwG7/n+x4BbAfCmjG9Rt0lyirx/witeLxbYp6T88otqdu3q+BzOOVljyvIkpNGgMKrII4Pk03O8zPdlN80Ten2T1YfOboJ3by+eywbHpw3zwc9BzV7yc1SmUd6/1Q4SkRVQeAanJRqG3A1elNFNN3Mn14QXDCQNAUIkp9OBy6ZuR8pjZw6Ien9LXFNHF4pGdljxKkktrFQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAAGmM1RLBaenXslaifOYfZxiQ6H6x9ypiZoU1PNXk4=;
 b=xi+P8SXKb5lbUTA4OzQ1LoiPWUxiYLA/05+/o/2+/CsFXpmg0TWONRyYXXra0TQcEB5DT7Ks2PFRtGwHTx1NoqMsZdvoLMVjrDeN9ShCIclzgxmg5jByMv5yxxeNQ4ER8cl2GP1bsTc86WVnsASQFND/QbrtRgKImFLAKBTNfpIXAEokEHjvI9qWfTaPHZaop30S8A9j3wyFQhxIyNVUnfvrrUxyzAfouHjClBATRUqhSEs0ZOXUxwDbofKgnSw4Z7sHggOEEW48CP4/VGadyJQ3++dxAcJV57VplT8A5paCjJqNHkFOaYkuDkEuuQng/+NnSEqN7nUxODNkg58DNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAAGmM1RLBaenXslaifOYfZxiQ6H6x9ypiZoU1PNXk4=;
 b=I8/r/qL8LdjqIPLoK2GgUxbyLTHa08BMOdvx+Ofgw8vDKw/YANF3VgkW+N/JatjhgcN+jEZBy1WTtDIH4LnBqhQ46otvuXk/S//N6KvB5qsjhqApx7MgFfTZJqaLHge+9SSL8z8BwreYB9pRnhPpW+2XonicyO07nedbUDs2EsezNpEvkMkVirytxHU1mNhcSd6AkWLRHMyBODi+ZIT4nwRti/dZIv6GNP3HQuMmoS9MDeYDKTt4yGBcoVAJIIHxvypTGZPOdn4r1Uzw3Ecf52lMu02X5Jb0+a1AwjmhJe5ilGhZpQZE0W15R+ppVzLFkibcLxSENeoZLtd7mv0IEQ==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by CY5PR12MB6178.namprd12.prod.outlook.com (2603:10b6:930:25::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 04:09:30 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 04:09:30 +0000
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] device-parts: editorial: Add missing struct keyword
Thread-Topic: [PATCH] device-parts: editorial: Add missing struct keyword
Thread-Index: AQHa4ZiS6LYVkEntMEu355oh/ZaHrbIiDX+wgAj5ZkCAHcgoAA==
Date: Thu, 5 Sep 2024 04:09:30 +0000
Message-ID:
 <IA0PR12MB8713404CDD23FEE4318DE430DC9D2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240729092005.425107-1-parav@nvidia.com>
 <IA0PR12MB87139A44E0C8184D583EE15CDC842@IA0PR12MB8713.namprd12.prod.outlook.com>
 <IA0PR12MB871323ED310832DCBD1B6F46DC822@IA0PR12MB8713.namprd12.prod.outlook.com>
In-Reply-To:
 <IA0PR12MB871323ED310832DCBD1B6F46DC822@IA0PR12MB8713.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|CY5PR12MB6178:EE_
x-ms-office365-filtering-correlation-id: 7dd4c99a-89d5-46ac-a778-08dccd608a78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?IE8+jwRvXYT0xvDnN6ndzhHYiPSraXHPvvs0G3c5AQL88DVotjbOs7PNowOx?=
 =?us-ascii?Q?mmdY8U6nEQ5Y8JiMG4e/G6DL2YteHpkJXNAVmkn4I6k11TDfEQyBW3YMZSca?=
 =?us-ascii?Q?9g7HzuDQ0qIOjuLEZbdEfRTwu/R1hR9UBDCExVfYnHEmM3+NmiVNgmZtSSw4?=
 =?us-ascii?Q?/zb5cPe3SX3TWfyoTmh+/R3Jl2obwK8o3/4REf6Kj8PB/sKM9cKJRbnfpvGE?=
 =?us-ascii?Q?zhv0Q/ofyvmyCJ6n8XIqXq06j954ggpnBwIi3xPDBuGCW+ctT+9cErwv2+Ap?=
 =?us-ascii?Q?NtRZy38UtS3DgNSTi4HmmGUAX9G6g2cjwXNh0ssbXB8VhgqldjGTLfQGtzzO?=
 =?us-ascii?Q?Yq4kwPrMlZq+sYM9Hda8C+M6gGNLOL9U9FI1kDbmQBGH+gVCHBfy5FmAr7OY?=
 =?us-ascii?Q?hvRAsCeUCGPNOf0AKUnBWsRD5LgJDSQIC/OPSK76HE5K2yJruti27slhzQ7y?=
 =?us-ascii?Q?lFKm+1CCTCQbJ7/Sgq1v1IEqNLT1RRcclhfZWM+7CoLD0crl62X6VweEumPB?=
 =?us-ascii?Q?LYQdP/tHkDuBZVzRmBdE2Hn1NrkMnUuKhLm5oPcHrEhrOBvHf+dfibygza7s?=
 =?us-ascii?Q?aG/L3Np0TSwd6A7ZF7cp3PMCoErEU4hXlRmfesVNowA5Aoc8BRxZpx7QKDJh?=
 =?us-ascii?Q?3F/bTJ6u3gAOKjr2ueGDo6TygafBabjSli7U8zeRBbVm3Og73OiZPZk1rvTo?=
 =?us-ascii?Q?FYEHFvS1Pe4Nqq8kCAz37N2HsCa8jNeNf7Us4YqQp9vlX8y4THAsC0iXIAgn?=
 =?us-ascii?Q?eh7Bd9QfonKjagCfoUpMJ6PT6weHvJkcqRaqpiZElrp2tAsM7bqhRiR2DNW8?=
 =?us-ascii?Q?sD8NWdAaMCX39V4wfTvTjudcRO0mCEu6qEvLExsPHptDQhd/nAM7F5xl+kjo?=
 =?us-ascii?Q?Q7bJKEXXCnnHIZI+k6D04G/YNM1x7jLWUNVabZXF7zQKGaJQu723har5bgA6?=
 =?us-ascii?Q?TXj6DFDUrsZxaFX/h7p23RnEczLOEipPdRKsMMQyJzafxiVBFXOuSiOy5c6q?=
 =?us-ascii?Q?FZuJgQS78KMOkx6XqO/JZgx2fo2NroXCB1IHSsDA1WvNEyOzGJHMvYQUwWqu?=
 =?us-ascii?Q?jMeHtB43MGt5C41u7us/O2222qdpzV/gskf2Pt80N306xetTMcsV+aXXtKhJ?=
 =?us-ascii?Q?kSBbmL13UpyoKtrsKzR0CQVGfvEhsSE/6dHEzlciAf+dlITXfGRaM7kJ9Lqe?=
 =?us-ascii?Q?Hg5KqWlNTOJzdZMMxtaPhiGly+HfUP4FrsrBVEElIq/CKGe5deQ4KqyC0K/2?=
 =?us-ascii?Q?I/gwdVQMEgqqrtmFyoJohJripHT1yPli3zgi27ZRhxzNVrlWn+RH25b9Q4nn?=
 =?us-ascii?Q?51/dj2Jt/yNAA9U2QSupk4mRU7mGYkW+It8B4vSwyiIUMPv+4kKb3Luzbn6z?=
 =?us-ascii?Q?2DsV8oUnIG1g33nSP5w5r3jmfV+Y1uQdJB2MpY6ie5N/4x6aig=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oizgW71OEKiUaXMwz+VgR8EEhUjcq0fti02kXvyoOfhmwX27LlSzVKgcG5uc?=
 =?us-ascii?Q?D42bZuwpnXRLixui9c8Q4dht1vdfEBCBGJB3fSkIsHeb4Q37ZH52lyDvl3p4?=
 =?us-ascii?Q?xhlo00kgMl0h6WJZPzEB5OL0jzEefm/lEOKE6ventbxYAcNlSlxx2s3I5B/6?=
 =?us-ascii?Q?fIJitnU2IiB1tpHqyPeUb0Ty8Tzz5X1EaJl6IFMvKcdAPvMK471plxnr5bnn?=
 =?us-ascii?Q?nS56WLbVExLgNd5RwpP3HGtfEIigebPh2PYPmRj89/1lMl8rOfjMBysFr3A6?=
 =?us-ascii?Q?QXsofUnVvWvJEx7yqs2N5C5LK0EU7BMhmhABnCKTS5rLME0sV7WKsl9nuIZE?=
 =?us-ascii?Q?9uT9j8PYh3VJUCC6UYt27MzaAa81RleWLRJJXYU/NRvauXnPqWaGgV0yYzLW?=
 =?us-ascii?Q?84+2Dkwm5ZJHCu3sV2slCMTVVUID3L1PEpA6HFJmV0iqkhtRTcXq5HOEHwKc?=
 =?us-ascii?Q?06l4pWIWy/XRREs1zBlrQ0ar2UTASeq6hlQlLsOkk0bNgWhrwWg37AAAmKGI?=
 =?us-ascii?Q?mBT2e7W3YuxCUzBU5AHJnACnQQC+BJtqRAzv00WBaCaYAtgINXY50vgESNbD?=
 =?us-ascii?Q?cx5L/PqAUlVnpNmL7NuGP9FYHXv/SoOrERZnJpw1xvxnym/ITNuV7ngTtImN?=
 =?us-ascii?Q?21Bm4eqjYMwWXE7h7Xn1IB4yrzuSGLZFCw/N+2UD0MFsgQFS2q7AoYkykeZB?=
 =?us-ascii?Q?f/SwQxrwjmlA8F5T9zqDYHKHkcUmrZP6OxQzHa8u0rBYmF/kNAP5m/rHAWwV?=
 =?us-ascii?Q?HVTUSG5KX/CgTTqJFjUPombs0B7e1WQKOpL0rszS9Td4As84IT7xOCllG6id?=
 =?us-ascii?Q?7zeM5ztoM4xhBpNHKE7KYE12hPfdIHUNg0kLgjFm4bv8gDdyIwMXpxWWmvp2?=
 =?us-ascii?Q?AKl4WhT1YsqZ8P6myW4jzvUZtq3oPU+RUv2fkBZ6bP+eMafJC29GHYE14R0d?=
 =?us-ascii?Q?WbJq6Vroywecznmraki60ql0FHTnRgT0zq4KFHrNjV48aVQ3DbQFb2D2mqVo?=
 =?us-ascii?Q?JOVdKRSuWv33d55rHLvQB+8c5UlBCPWDNg/f5qzVxfvZBLWgp1UhdEaGXTkz?=
 =?us-ascii?Q?qBAmRXhixeS2eFbRfEgKycFU5rjtcRVZMC/qwmmaZRENIsiBJ4e4pru6DT6v?=
 =?us-ascii?Q?X4retV+sja/OfIZI1gOeIdeMXOnCLjONSotHCT60J+T5H0lj/21L1RbeIfvY?=
 =?us-ascii?Q?59YE+TNKVc4rvOOnZAl9+7WmhrALlQGnqG7Q7Eo+cT+aNVJo175JaQl5aAa4?=
 =?us-ascii?Q?0c6T8vj45pEBrgIII7S74RBtkOYsr/7FXTEPBxUIG8EnmVkaBaZ8cS4AAOCE?=
 =?us-ascii?Q?UDwCpsCUpxkoETHidqvMyaTsmoXyApIK1DZmZnHk6N3dMfPsPxnlTwaNNnc8?=
 =?us-ascii?Q?9z2nhgaEvo8bB6k8PfMfwt217cZP+W70lndHLLX9h0HfWkr6kmNhdy4Eafjc?=
 =?us-ascii?Q?b5k2C4b/K0Ap5r8I0Yto22P0p5OotP/jBOs3V3ndC8fzdXoc12HmVoFKAs6j?=
 =?us-ascii?Q?NjWvKgshh0vbeUj76S8FD6xeHZRopqWEzGa+lLPn9xyREqbEPXlUlQzOrhmc?=
 =?us-ascii?Q?TPeW8/SVEXTbBjGxI0AfjLUbgKttXO2CsG0qOHIerS0gSNu6Ec04UyABf3ZP?=
 =?us-ascii?Q?ijPfAxjabpbbCi6CNa+lBjZ5H3MdY3a160SqHm81xFNt?=
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
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd4c99a-89d5-46ac-a778-08dccd608a78
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2024 04:09:30.3374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JqLSBdKZJZ13meyfhblSFygN6j5uOdimJFk6txn5/QBNB6FSArq0fUQkZTA9a3ePv0BiVwAO2NDwKxd5ndLVZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6178

Hi Michael, Cornelia,

> From: Parav Pandit <parav@nvidia.com>
> Sent: Saturday, August 17, 2024 10:50 AM
>=20
> Hi Michael,
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Sunday, August 11, 2024 5:48 PM
> > To: virtio-comment@lists.linux.dev; mst@redhat.com;
> cohuck@redhat.com
> > Cc: Shahaf Shuler <shahafs@nvidia.com>
> > Subject: RE: [PATCH] device-parts: editorial: Add missing struct
> > keyword
> >
> > Hi Michael, Cornelia,
> >
> > > -----Original Message-----
> > > From: Parav Pandit <parav@nvidia.com>
> > > Sent: Monday, July 29, 2024 2:50 PM
>=20
> Can you please take this fix for 1.4 branch?
>=20

Can you please take this fix for 1.4 branch?
This has been up for review for last 5+ weeks!

> > > To: virtio-comment@lists.linux.dev; mst@redhat.com;
> > cohuck@redhat.com
> > > Cc: Shahaf Shuler <shahafs@nvidia.com>; Parav Pandit
> > > <parav@nvidia.com>
> > > Subject: [PATCH] device-parts: editorial: Add missing struct keyword
> > >
> > > 'struct' keyword was missing in the definition.
> > > Add it.
> > >
> > > Branch: virtio-1.4
> > > Fixes: aa4f6f06 ("admin: Add admin commands for device parts")
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> >
> > Can you please take this fix for the 1.4 branch?
> >
> > > ---
> > >  admin-cmds-device-parts.tex | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/admin-cmds-device-parts.tex
> > > b/admin-cmds-device-parts.tex index
> > > 4c88045..27d8251 100644
> > > --- a/admin-cmds-device-parts.tex
> > > +++ b/admin-cmds-device-parts.tex
> > > @@ -131,7 +131,7 @@ \subsubsection{Device parts}\label{sec:Basic
> > > Facilities of a Virtio Device / Dev
> > >                          le32 count;
> > >                          le32 reserved;
> > >                  } hdr_list_count;
> > > -                {
> > > +                struct {
> > >                          le32 count;
> > >                          le32 reserved;
> > >                          struct virtio_dev_part_hdr hdrs[];
> > > --
> > > 2.34.1
> >

