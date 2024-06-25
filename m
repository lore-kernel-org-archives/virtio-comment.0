Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF6322313
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 08:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719303488; cv=fail; b=hdOjV3wE4u2B0sInpPGtNhfB8+HikJr8G9QWi671BDB8B+EUgYRLaP6jrtsupj/I1SgbP2G/xp4wkHuyEMYrV9LYvrieUA51WEfxt3ytZCCCOl9Jd34pyML1sRB7L3YEhdgJkzKvkgn6W6M+LFbqClXfwUCQxIRatenSZ8rNLbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719303488; c=relaxed/simple;
	bh=aemmfYGIcbzwVTfmy4PV3EPkV86pe1d+8vgbFj4Gmks=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SuxcbdIeCKSmmblH+5LiMcpVd8XK/14BPH9z41TfK2+v4AYaZRBB35Ot6v+iFCX47PpqtKmW0pLmSGyvsgRRl7efx9+pvYP+W506dlhSsPHIio+2QcLqp3lSt/j+NB0BQfvlqhFrFhG2dkBFxC5+c2X2JR3nRNGuhsQNdP/UWpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JWr11wuT; arc=fail smtp.client-ip=40.107.92.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JWr11wuT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnm3CuAc8V/4iKk9gdxfQg+J7E5ljrVTCxjH1WChyF94bGixQ7rAewWx+STVWDF/2mfogJLJidMmI5UY7b7F674WceRqnvOG9hiSpNvm2F+laJ1LPjIsUbAI8VjwwGyDW8quAOivjFxkvMMh+7cgu3Z16fmRK9FZeo+E69p0qMgH3sjjajP7vhnXV1ls9kZbiPpoZ2faj1OG9VchnzI1+MdbBj54elF9VOEj5ydDouUA7JO1bHFqcDhoTNeJWXjXgDZSQF4m08B/mN4/itf7QAIJ2lyCmVqba55/OxVmzpJCStuyj0qSfEZXMPyDp5hMx4mUowJsQjoj5mTfSViVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aemmfYGIcbzwVTfmy4PV3EPkV86pe1d+8vgbFj4Gmks=;
 b=KrkrI2OMpUtsOinS6ARPjWVxznVMxGq9kR1G0HeRao/XqzEX+PzysZvvuhvKccPp8qwDeGdmIOB5c4xYXThtd2IpC4OPwufBlhdmJXyJj/eNx/C9TWxXdRlqS/6QGgLe2B90SDbvsAPzkir3CVGVizH4HxC6oytvVe7pma3NcqRte6bIrhiu9GNO8tpuQyD2QiGLO+lbnvf4TVMOmGPSV2AFaRanxY4x7005ZWVZi6zvThG/wCYiADuPyG0g6R74aZMTbeFLDm2yWE5Fa7mx6EmtKfyHm+UXsujWOV/YIuaivwkdy4niA9ocb9PzhTUCxihDLZPSOpy8szLrbiSBoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aemmfYGIcbzwVTfmy4PV3EPkV86pe1d+8vgbFj4Gmks=;
 b=JWr11wuTJjN/BnxlG0onwcIofI/GD7Sgl/vtCCP4YbgUJD2hd0pWZUBmUoQz493x9eeLGu3wqQTbuoQTJ8zQYyo4JlqZzEGJKn72P4SZ2O1I80802r4+ctuMaQwGihDMBTrPUTq+k56CfHr7yDr/nHbGezX3lAfq8nWPPdl6dmToytCG6W89r1lsXBuNhn0GnGFINXQ2hs50cupMHjiLhENPptuWez0dyrDU0msjM3fAkJfMRxbtVAhrGBultfmpLv8CLSokgCeQxhDCfkx5yWaFX5DjmX1zXINGIRq1GzbxfDSTjj18tGw6ZbzOpskY9aZChMaaqSeJiHvE1aIXSQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SA1PR12MB8985.namprd12.prod.outlook.com (2603:10b6:806:377::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Tue, 25 Jun
 2024 08:18:03 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 08:18:03 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mie@igel.co.jp" <mie@igel.co.jp>
Subject: RE: MSI for Virtio PCI transport
Thread-Topic: MSI for Virtio PCI transport
Thread-Index:
 AQHaxlJlgAuq+6bd0UKQFZ3mFnzkLrHXz5UAgAApEACAAAWakIAAHyCAgAAAphCAAAN1AIAAAQyQ
Date: Tue, 25 Jun 2024 08:18:03 +0000
Message-ID:
 <PH0PR12MB5481D98A78FB4650F9024E1CDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240624161957.GB3179@thinkpad>
 <PH0PR12MB54812829338B9B950001BA9BDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240625054346.GA2642@thinkpad>
 <PH0PR12MB54817F3736022FFE3B9C570FDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240625035343-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F6B84ABAF617B0571242DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240625040729-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240625040729-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB8985:EE_
x-ms-office365-filtering-correlation-id: 3cffcfa5-20d1-4f9d-b201-08dc94ef559d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/l+IS74Mf86VGE7fB7Zxvbzwa9EKDbPXVgTbFZlVP2RLvGcUNWmlk0aapbE/?=
 =?us-ascii?Q?ms/aH3kLRaH645Cy3AvUMeJ8D6DeyspWGgN16GQriFAMpTPP5Z4I5V7CsJfB?=
 =?us-ascii?Q?55jt0MGD43Lf8RWKnprn4i+TE/bb6MkkpQjrCNaBHMgXUj7qR1BreEDZwsap?=
 =?us-ascii?Q?BFeltwyzzMfRVhRCDiqzn2gdr4xLLp1q3ZPBeFuzCtLy8PVR7qC0cr4l6Nnt?=
 =?us-ascii?Q?K6Ow4gqi+OcFnrFhPYAUsuv5WkfoQJyadtFGFA/2OBOJ72cizA84tj059Psj?=
 =?us-ascii?Q?ax4TJK8ZRcvG/RbGEVo3m3yyeegPGJca6W+nNuKa47FUtRs8vxVXkn6yjA7P?=
 =?us-ascii?Q?/06wvWX6cD8MMtiRd7LKZNy/NEo7yotgRK3fdk7iaMyFjGM76/9RIEKeBrzr?=
 =?us-ascii?Q?ySFigtZ10oaq62lV05frjtR2yqyPG6xlvNYgllUV04RdKAS24E5LRTz0eFYn?=
 =?us-ascii?Q?62iTzL6fwDcpEZXokLaxBXjkzSl0zuVePKisnlT4VaRGIu2gazNsU+Z9/saq?=
 =?us-ascii?Q?SMOdpKUMvqxS7RJwizWXLnjzLJTwCjD52Ja+Q1Ogyt5FuWaBuVUQlJIEGGPy?=
 =?us-ascii?Q?s+tzZq0LQc40khxh7a6Pz6S4fDtPG9ZW0ETetJfyymtp9mq70NYD/8VKWqaN?=
 =?us-ascii?Q?HdPnJw5+1o4lL+eu1WVvAhOh18zNpQQp29GJ5yG4PIA6u/NewyBZlHmgPNZ0?=
 =?us-ascii?Q?pcNnUIU6/Rt2kbnA5w07HJRtv+IG8G025myitnhspxHuMAJAABZv1XX/78BV?=
 =?us-ascii?Q?tvvXlHnNC77dNc4h/lAb6gZDqSpE47lxpYdfnqFNeOoD0CsXWQYGXsmbWURG?=
 =?us-ascii?Q?NBsePa8fpZ5SZP3PmRR6Sj/v852LNNZUVqP2fGjvro5kkzCbncu99IIQDmRP?=
 =?us-ascii?Q?NPF/RsgU4chmKbbMdH8sIselZt453pWjNoWLvFUPzc1T/MKOkYdhZAxH93xo?=
 =?us-ascii?Q?dPPa5hw5scAYJc7EwTQerJHC9t2730rbH3PHuLDpnSh90ARGgyT2lUvkl4fS?=
 =?us-ascii?Q?cEUBN6725aiykPLypbpZntSTMzmdzIF43/I9M1MYI02fRspKhYUHH81DYrub?=
 =?us-ascii?Q?R4mhfYRIMYoDIyE1icEOmN9cag8TsPUe3E8xEWR7nCHgXEe82wrZ41+bJoQP?=
 =?us-ascii?Q?1lyQzdljJ1plK5vyINjgKpqErGzFkQliOQaws/Gdclfh7TvH5lIpHkv/9+NY?=
 =?us-ascii?Q?8/WuGfTJhY+Xu1J+waxCa8WPhcWFjsixggTrS+aqWLHUUVjDJ7FGxngnIobF?=
 =?us-ascii?Q?cXmsbWhuYkUHgmVa18Wqe83ez3zKdC2JL3htXm4SfNMR/9C5kt/Q2s2RPaZd?=
 =?us-ascii?Q?joE+CBThbtTG5en5rT9j6MjDxE8CDDQmQ27N6HJLitr3w93br1i4MXQbOClo?=
 =?us-ascii?Q?pUP3wwXft27o9fl5/MCqu69iVcAddztVx/+khTyphKlRBCuwkQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LIeyhi8JcqbObzODXegPjCkctQlcEUx6r6cZv+nvV3cPbMlrPtZy1qw7O7PR?=
 =?us-ascii?Q?8DCsM3/x16zU0lb7VEpPYa82qU+NTYtrHM47Rr+gocp3CjyoPB3MYjUAlX+d?=
 =?us-ascii?Q?vHnhzb2eWQKrfM2yZqfTPWHC8y/KHWHqeIc366TKrRS0rn+eCYAqamae+oJE?=
 =?us-ascii?Q?aq2SRCRpS0uf+n4gUTxOJnfXCZ8XS8U/u3k8R+qUySitAxdF1K5WFAm0rmMB?=
 =?us-ascii?Q?RDg/f7XotGLx8XT+FnfoUl4NVJt/boi04qCvQEkuiJ2M5mCNmUQ95yOrI6CZ?=
 =?us-ascii?Q?TmVYPrW95AejYqR7uejo20abLYCw0T5Ac9VazRLcTxMgE+BX7FK5dsf8Rm8j?=
 =?us-ascii?Q?CXKc2wvEMLvEF7AQacbripDf+MOVmmWwcqbznRi9JUx6JmM1wNDUcoHLMDi7?=
 =?us-ascii?Q?qIAoptUuRzh7sfKazGcv/YrcwVGzBLoIUHMhGc6gF1fQx0eFCrchT7P98ZE+?=
 =?us-ascii?Q?/QU9u84uNOJnv4Yj2P5AvDhxYmojkFB3xkiKeto9WRcvrT7MQrllEm/xDCb3?=
 =?us-ascii?Q?dfXD5VCIbO/eMMLz3w5dlo5/N1/nwXC+5A7zIWE1BZ2Xwy0H6cJZLdPLnUy8?=
 =?us-ascii?Q?jDtPqu0jpM7ceXGqACJUl5ePaEJ5LQwbFnrUcMtOTyVZbxjfhIhgHpf9lZ0R?=
 =?us-ascii?Q?PWc+FVTEQt3epATo28Ju+T9SUgnTNQtMcqim6MwRlo+ozkKk0rtW9SpZ37qE?=
 =?us-ascii?Q?lP16wBQhBNB0cYnb8PBndytHvZgqYMDaiSxFOT6AfIxzJRPezyMxhRqGlxYL?=
 =?us-ascii?Q?JS9hnuWoLdWXk8jufhnHj2QECMBzYPdAnjvE7b3Ty+Bn45JKM2RdXUrTBVxs?=
 =?us-ascii?Q?GnaE62Ntb/WDZHZVeFyV1sMjOhD0vKfPH3WKEvDv9nAemC8nLP2zP+QAAYwF?=
 =?us-ascii?Q?TVdjw7GwiH+Sfuc57Io3YKLFNX2aFuEMnsuQqVYriuKTxnELENnVEXIept+5?=
 =?us-ascii?Q?++aHwHqBvvhgpJf4fNPSVqFJP8lD17G7BVPk2I+J2pg+WKiZhMkRfOyAz1I8?=
 =?us-ascii?Q?9p/YgoLQ2gxvxuUp9A8obsBTJd+y2jbr4RXCLfei2DkxugSguDhuF6DdMPsN?=
 =?us-ascii?Q?wNdjVN7TY/gz0eq4K5V26WVXRC31XfEyGcJVO4M19s3K9n61v5lWQOXaJRCI?=
 =?us-ascii?Q?9y6UHXGzM+JqpHxMKGg2am4nFj0ff1sLTPVyfggcoiSsQkYQ7+KHsFNTbCq4?=
 =?us-ascii?Q?efmEVSv1dUe3nklQvkEn8hspEw0cPjOYPySIUz7QutmDELN0F3M93DfeXPjy?=
 =?us-ascii?Q?glVaA/AkzvvZN7+gIYM8WUBoX+Fvjmprgyta2CwrbAVmC9d62mnvmgPJ+ek1?=
 =?us-ascii?Q?Ldx6aaNx4SINDiIs2AHcJl/6WAmGvhhGEOci4RDZipQrZP6V5eZPE218Y0od?=
 =?us-ascii?Q?8PjbZmGjtJxX8CCdLYBe4ObhWNwhqqWU9gF9Aw0Zjptqj09d4q1CCMT1SDHd?=
 =?us-ascii?Q?LVMwMGg33E3NhcJZjZ9H3X5v95R4irbzOKf7b/kO7XpQBM6obOc/IAwfv4A6?=
 =?us-ascii?Q?ij52q2NuEuvQMiR/7fPmKGaaAlyzLrZU6LsbsfUpGm+Zx+zDz1dVwPNyGmYs?=
 =?us-ascii?Q?qzLBf8P74MHMar9fHro=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cffcfa5-20d1-4f9d-b201-08dc94ef559d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 08:18:03.4170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KLgq78JtQlbTbDi49ACl1okNNINaggzv8Z3+qmatA22GIL4WRPkWibMz5cZuNZCiEX0mDdtsMi1xkAXWENVauw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8985


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, June 25, 2024 1:40 PM
>=20
> On Tue, Jun 25, 2024 at 08:00:45AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Tuesday, June 25, 2024 1:25 PM
> > > To: Parav Pandit <parav@nvidia.com>
> > > Cc: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>; virtio-
> > > comment@lists.linux.dev; mie@igel.co.jp
> > > Subject: Re: MSI for Virtio PCI transport
> > >
> > > On Tue, Jun 25, 2024 at 06:18:46AM +0000, Parav Pandit wrote:
> > > > > So MSI-X is clearly an optional feature which simple devices tend=
 to
> ignore.
> > > > > But if both are supported, then obviously Virtio will make use
> > > > > of MSI-X, but that's not the case here.
> > > > >
> > > > If both are supported, and required scale by the driver is <=3D32,
> > > > driver can
> > > choose MSI due to its lightweight nature.
> > >
> > > Unlikely, MSI vectors are tricky to mask and this is a problem for
> > > interrupt balancing. So MSIX is better for performance even if the # =
of
> vectors is low.
> > Masking to my knowledge is not used by MSIX.
>=20
> There's a mask bit per vector, yes.
>=20
> > Didn't follow how MSIX helps with performance.
>=20
> Linux uses mask/change/unmask to balance interrupts between CPUs.
> *That* is important for performance.
Ah, I see, didn't know this.
Frequently reprogramming the mask in device is expensive and also requires =
synchronization to not miss the interrupt.
In case if you have pointer to the Linux code please share.
A while back, I recollect seeing reprogramming done by the IOAPIC at the in=
terrupt table level within the cpu (without involving the device) to forwar=
d to different cpu.

>=20
>=20
> > The benefit of MSI is it does not need to store addr+data pair per vect=
or.
>=20
> The addr/data thing wasn't invented just to make hardware costs go up.
>
I am aware of it. :)
I will let other non virtio forums finish their ongoing optimization work i=
n this area to reduce hardware costs.


