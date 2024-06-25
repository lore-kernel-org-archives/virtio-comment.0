Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60796143C79
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719302450; cv=fail; b=YZyJ+QB6LkxFcuKj+7xhsga6/V1YXsVY0CtBy77TL4RqiVc69koWSmgF7m26fVvUah/6X+ebFP8DwgWrRHlGF2K9toVbIbZuum5sgGHPv47JMfVAg7CMy1DI9B2ms+A42IqjmPHAzUL+v4g6q04tdumeuR35VyKrPGBTHnUjh+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719302450; c=relaxed/simple;
	bh=IKypqAMy0b1yWirA/5afut7ZYD24FCnI607acIWr+2w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UztQKh9t8gDd/qYpx/+Z2OQO1i7lvCMucrHlvQ4/jtRPsby2GjWnbyH9d4+0FdOfCbiFMxmqECpuu3bFpcZPaZcsRJE45DQpIIE2mu2sSd3TNwFh9KRu4C0UO83PVIh5+soOCRIsuMvHKaSAm8OMhAZMCVYH4FWAAwOa0ZqgTZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Srd4f26g; arc=fail smtp.client-ip=40.107.220.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Srd4f26g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gye1STWJ8N3ut5Aay0a26Mg65FtJAjVjPl8Adwpm/IkiCNlQchi37zmEUE10N6YKt5f/WOVpKTsPEJsvkzchRu+f8I7Sii47MS5qsSIj0OCmrMxbOIPHu9hrj9sp+9lPzxUiOduh5gbhngOQg47l3NwJA5o6yHpOB5BBCUDH7B0KCha1EzCSG8EzVobPBB8Kw0tfzs+yGoAIZhSCnzIfa3uWlBM/rPEYCc8YQVn4dVC//x7G3U5gVpFIRLHtW8QlKCgddm2rgmS40TdErNQhmzTFmC8LavuuDkqTvHX2kSKPkEEdlK97luBBtWEfzis8xs9gZzOd/PSW0AvCNyWU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKypqAMy0b1yWirA/5afut7ZYD24FCnI607acIWr+2w=;
 b=l/htqbkYJnaB03SvcmnA225/Y1twbUA5gZxoHWoPfXCLAQEMGiGMZnZDvMakSrT1lyR0m/4R757+VEpEsFmayfSe6yWht8vj/gnUyO95JGKwRuJhELAV4O2IMSSoE27MtIlil6XU/J+qXpV4BB07MF0gQRv6qu7mbctI51dUAmog2SP+NVkhpvaViJec6cEcpBvdHfQO11pOcSHLSP3z58d21C9rlU55WY1umFCPNkUKjatsQ2NmNHVY8u86ME/ABaFUPyBuRMhAs1CjdzmVN8UHxuX/7bQZX5W76ynkGu+xX0k0l0MkU4W42kkUcqd6wggvf7SmjZ8fIfbI4nDIdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKypqAMy0b1yWirA/5afut7ZYD24FCnI607acIWr+2w=;
 b=Srd4f26gI5OR13voBRISpmyNmoetELX7H1lpN9iv+Fm/DUjvg0nDzasGzkQWelAFLAvQB0GSt1dwdOyHL1qSo94YIXSBIq+PB/vCLz9AoeQDpU/apcG8MZlBCncLO62hWhqg7FAJEWb4xQsn+gRw8jxTgzEYSkIqRZB38bu6FYnY/2NtjhHwbUQWEdhmfxhsZUlNRzjQBrAQBRwmY4zITyrK3f8exEpH8DT8wjILKEn/4N+AbB9OSEi8PG12dTUa4VyfEGkaVrKUYBXj9fRa8ylVn76iixp9NEjGWAVxt5TAoZBN04ArkGowDOOchhus0IC2PgxrxjJBQWB1KBSpFg==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by MW4PR12MB7360.namprd12.prod.outlook.com (2603:10b6:303:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 08:00:45 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 08:00:45 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mie@igel.co.jp" <mie@igel.co.jp>
Subject: RE: MSI for Virtio PCI transport
Thread-Topic: MSI for Virtio PCI transport
Thread-Index: AQHaxlJlgAuq+6bd0UKQFZ3mFnzkLrHXz5UAgAApEACAAAWakIAAHyCAgAAAphA=
Date: Tue, 25 Jun 2024 08:00:45 +0000
Message-ID:
 <PH0PR12MB5481F6B84ABAF617B0571242DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240624161957.GB3179@thinkpad>
 <PH0PR12MB54812829338B9B950001BA9BDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240625054346.GA2642@thinkpad>
 <PH0PR12MB54817F3736022FFE3B9C570FDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240625035343-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240625035343-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW4PR12MB7360:EE_
x-ms-office365-filtering-correlation-id: 96560717-a7b6-4e85-f51b-08dc94eceaff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?b24IWn9FbyFlQSScZAFjVddE6c6kh4UeN23sPGXZsH0oz7QhUVFF3I+/hpv9?=
 =?us-ascii?Q?MAFBLX4JMUSr0+00a0GaZwMC+MTq1a1uril4YAtSt/1oU0KTwt+E+6F0Zywv?=
 =?us-ascii?Q?Sy3B9ff4GsVlTAjTjTDn+8MVCudhQ2JwPtFZfHoOCfub01WNYT7dahiIvT1C?=
 =?us-ascii?Q?+cpeApwQrUa32dh9gQMLhv2kRE2oJiHc3FNqelKUwmSO20ulZn7xKy28Newg?=
 =?us-ascii?Q?L1GTBnFBR+tIfAPlxYA/gK1z1gEjGCBTE+06oZ/nVeyxkcuLgLw5q85mku+a?=
 =?us-ascii?Q?2twhb9Df20fyIJYHUOeRrpboSn9ZM2qtgc6jryGYEmrID8e1xROSKP49gG5D?=
 =?us-ascii?Q?NCvwISdRBNIp26KHtLFeltks3uswxJIGVsf1fBjwOHvQCXL0UIjW8gwWgKxV?=
 =?us-ascii?Q?Lb/EEW+mMztH6MsLf9FNyz8R01j5qUSq3SqyIyk9tFqB2QcVEWJCkL3XM0+Z?=
 =?us-ascii?Q?D2OxAmJ7d2lfGL32FP9htbDNJrQS5mgn8p+GwisSvKvJphdS9IuWIUDamLjt?=
 =?us-ascii?Q?y354410BeoAuGRh3vRT5F9mbc6k+Vddocj2ZgkIaprnMw4vde6CPdaOsKbVD?=
 =?us-ascii?Q?3WIuKzNYN29238WmXQhzzSJap97xrqxoI1YgF7abisIw9EDlRI7DomC9qEEZ?=
 =?us-ascii?Q?m5aeIqgFXlI9QyhAdEk+HVODEZSzau3bIMG8eckPwyRNyiKHpQqSjWHv2M9i?=
 =?us-ascii?Q?zVCFWNZ0FTkjcIrESRV9ydJ9nGVwwmkIQ5MrG/kOThc4BZ55iyogwBo/f0/u?=
 =?us-ascii?Q?yVh7+4RsI82LHio3SVYp9e8jng3fnnv5yN4/lXnkSOW8sG1XS7BIjiFMQ9RI?=
 =?us-ascii?Q?LZlyw+RWb7N1PqkgFxhBqB4mCNiBavTQuKldKXVoVcMEZYOq42SUDvGC3sE9?=
 =?us-ascii?Q?bXIwOzuFGF5jKG8dwR8CV8Z0Gh/gPOlt+PXMONLf36FLoaRiAKLpSdTvgEAM?=
 =?us-ascii?Q?lZE7EAszijUO6injBY4Xim2q3cgk1kkZrK3Y/vchj9EKZBaP+YZHYVVmLcKe?=
 =?us-ascii?Q?6hGhg5WzUAnndHXn/BIJZWkgtxbM+fbbF8PgOJNQj1RoK9VM2PjW+8Xe14cV?=
 =?us-ascii?Q?ZpWxkd9drKJdrFwmeYAvPlYtpLATtZwLQiJkAsiN6td5HM6/KE7JQ5IauVOO?=
 =?us-ascii?Q?9UJEUQlnYvng5r6/XWv0yaF2dDhK3pCrPlhthZ63yYGPuqV9S8PfapJu8erl?=
 =?us-ascii?Q?GQvouI2dYFeIVgovRoVJHRDRtTYot8012astb3f/BlaW9jtc1Uk+cO7jY5dF?=
 =?us-ascii?Q?hHPN2HXKTI3h7IjX2BKsARDqciPD8SBQAp9M3w1kmJmI2uun2YOrsyUiTXUJ?=
 =?us-ascii?Q?9BIy+pqUwB6h0kElLvdbn/HKsHBigyHTAYgabY+s4HPigHCLJSC9SrCnI8qi?=
 =?us-ascii?Q?PxqbJIIbPsIUA/B5iWwE7brWBYNRQldpIPqWBTlnCmVoHwQmCQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?irbx0amj7n20F6Vo75ptb34x6DNywYL/X3Bi2RiuChkumfWd/Ut38RKsZu5D?=
 =?us-ascii?Q?6OzIybfOOznLThMVUznTy6BFIHtMItjLXu2+5nZoOsflxPfKSbNC1Vvzjxkh?=
 =?us-ascii?Q?JlR42inFmRtkCDS0bOnF2P4TRH1d6qQUF2TMzLjqjIDY/E8rQwI4GC/vGays?=
 =?us-ascii?Q?Akf35SB0YoTP1gnuNwqtuIjTVOEPqjMYe1TQpq6+Z1rY8OBxHtuCsnCtSPYf?=
 =?us-ascii?Q?x67dpzZ/+8TMOFCtrPblskNGMkWOhh/kMDcPyslg+PE+Q0dSBuBWnvwrXDu1?=
 =?us-ascii?Q?DD2zbMos5K+hBB104oKkbOwA4A9An/kPWArlTemibECLmUpLlm/fw3nn3vEE?=
 =?us-ascii?Q?X36VlG3pohTFCWHxZVPRkx2AubVZXyprujgMbVnEZ4QNrqDe97XBkEL9qGr2?=
 =?us-ascii?Q?6EhH4sEgV2Ji2eMeSsfQnfspXvEWaqU17JhugnmQj9FstoOL11Y2AXDTMxgP?=
 =?us-ascii?Q?QEuKQ4oYESkjQgnIX698vKirF1Wshw8BHpRGTmlBTCdREUSPYOb80aVFfDnD?=
 =?us-ascii?Q?k9M/02EB5wlK8onfO71gmY651X+hdDkloG9+ZDoKDPUU8Kd/lj+burerkdLE?=
 =?us-ascii?Q?Ry58R18Sg2F81QzwcBmRkHnDZgRk7p7e9HqgGnBAOtE10RAt27OxkAGb3vog?=
 =?us-ascii?Q?jPPnhOTlFQnOf0nSgDlmAk8HCGdMcJXG9foLiZD7zLBclEkPqG4R9T72T8ME?=
 =?us-ascii?Q?ragLVeFpFZV1s4VtMTmYBEcFw3ux9VJuA8ZZEs68MxQrMUoL5yG9vf2wExo3?=
 =?us-ascii?Q?4NF1ibXjReTud0H+REawGWvfwR9dnFQhonA2If6Oe/9Q/lQ6OPCPH950vkTZ?=
 =?us-ascii?Q?O69eE+9tqlgfN6BgP7UNktAaPn+npEGHBtOfz02cKpS04APRT8DiD/gD+V3C?=
 =?us-ascii?Q?Yk4Fy91f9WLj5+foxIuWYN4OnFiVlNq5xwsBqkc4Q3ztus/jeV1hkYC/7FdI?=
 =?us-ascii?Q?ioTyTpKSFdMO4kz/Ch0rAe6VwvEIm5+cFx/ZGGPCnYrY2JO1jG7hGhIKW8tv?=
 =?us-ascii?Q?2bdhMjN6KUTw9Q0RY2eDqvCobnuucZFBZpgOwRf6eDq98W5dO0elAgtoh2yR?=
 =?us-ascii?Q?6zJe1EAkD7Q3eXNH93GzMRlbTjrdHolHgzc8mMinrOrQ3DOnewPmXZgIL1fR?=
 =?us-ascii?Q?E+xzdEPqs8vyc7SbHGaZBMx8CyPf2nkjNJtAFinBiWKIZyACz7MJNwTYrFIn?=
 =?us-ascii?Q?jsBqiqdbVr8Dkn6J8WuRuf7SiRRhBe51KbCrvu3Z2WAh+4w+BxS4ZhviwcS3?=
 =?us-ascii?Q?QBpoitEsSjW69oSMxYGb6xpMSTX2gLmp5+Sjvod2DgW1K751q9BMqnO1zlF7?=
 =?us-ascii?Q?/+QKEvabWNA1iY9bHAOgx9Vd/Gi1Iw0qohXgnISuCuyLczXcN76Te3DrShXH?=
 =?us-ascii?Q?Yar+M6qR/lAolunnWD2C9a75ZWEnp0Gi/RjMq3Sv91xcgaZoSDJsIbSYC+ZC?=
 =?us-ascii?Q?LX5UA/BgOOdMDgTrhkJs27+bHgQHjnFJOdMfe6KQ0/txIzXfTv4dfnLILvl9?=
 =?us-ascii?Q?NiqgoEAvrZKT6cx8EKNXa9zL8zgaxokIBEVFRG4UpY+Zm1p2SDPGCj+sGpz/?=
 =?us-ascii?Q?kehbs3FnQJwOyGCPt0A=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 96560717-a7b6-4e85-f51b-08dc94eceaff
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 08:00:45.5486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AnpsFP+QjjzKIyI7EqrmwgGnmwBCFED90uWkxzoyTw2JDRMO3aLzD2i1x5kaH97nifZxyoKH37DWpZaQgbnIjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7360


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, June 25, 2024 1:25 PM
> To: Parav Pandit <parav@nvidia.com>
> Cc: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>; virtio-
> comment@lists.linux.dev; mie@igel.co.jp
> Subject: Re: MSI for Virtio PCI transport
>=20
> On Tue, Jun 25, 2024 at 06:18:46AM +0000, Parav Pandit wrote:
> > > So MSI-X is clearly an optional feature which simple devices tend to =
ignore.
> > > But if both are supported, then obviously Virtio will make use of
> > > MSI-X, but that's not the case here.
> > >
> > If both are supported, and required scale by the driver is <=3D32, driv=
er can
> choose MSI due to its lightweight nature.
>=20
> Unlikely, MSI vectors are tricky to mask and this is a problem for interr=
upt
> balancing. So MSIX is better for performance even if the # of vectors is =
low.
Masking to my knowledge is not used by MSIX.
Didn't follow how MSIX helps with performance.

The benefit of MSI is it does not need to store addr+data pair per vector.

>=20
> --
> MST

