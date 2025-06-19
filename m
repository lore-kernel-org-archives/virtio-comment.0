Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581281DE885
	for <virtio-comment@lists.linux.dev>; Thu, 19 Jun 2025 04:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750308015; cv=fail; b=W29eoyi00EZ67ewPBJo2s0AhCAQavB2PmT0iDpps3S8yfGk7+/x/IN4KGG4kBxu0XNqodjoorud8Ds/izHnm4o+4p/e37Du4QdTJsm8/Mt8TX/qYjnGTPJvvTiDW2plGCR57I2W8TREqvKuyWFR7iDxHeKz7Th5AKN6cdkddXWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750308015; c=relaxed/simple;
	bh=6lf3w67rXlDiTZGHNmPZQhxaNkjmWnwE2q1Wam8Y6nU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fl8lHQkQG/veUyPewThdJGzlgMiMMNr5OPQUcFUWIxXJmQQsT2cSlUBXERCfl5OhusbjbwOTy1dnTzLLqj9/SJdiwaLzZ4PPgDlwhW0ue+pFggXF2h8Rfrd1ON3RqdbuIojcr0/X7QLEb54rCxHiGuxNTUpkr/xnbXbMckLR3aM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BwBesICd; arc=fail smtp.client-ip=40.107.92.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BwBesICd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApsuBMXWjBTiZpOmt8K/PeybBBu9wWx9cYdcn/pISvCkMWPFvLMGZ6aUkHuB43Tv5WtJ7cSKiWtNpvuY/6fFr2Mm0fwG6DpxYaPy7hCJGv7XtbmVzzBy9xwHAIToAANxHD9YAgEIEIwImO4BTjNWqIBeMzvrUP1V+k/QkfpKO+seOv0BNYnNMFHC6YRiZuf9GU71v9HsaLCiw7NEwU6dz87Vt9ojsWY6bagFW1P4cJLTqUC8MnUyEc3VkHtdlCamXND4mq/24lS0LcYoffX84+c9ca4pQUkCyWZ0Ap5iD3SMQ6VZUMsXFymrcKtVyXSlRMVR544DE24s4BQDJbdF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlfSv1DNNciq99am7Jp3qzeFgn4MLk6aB9gysACRs50=;
 b=DOaJMHttHzzPFBLkuI6KNmIJkex2rUSIKpq76pb7ZCOlFVDlsnQhyr4L866hHdE1fheqgd6yPlFn+M6FqSnx1ZfSWWuPsQPE8ZWKMt3aq78NfpNIsn7hie2uqZbLYkArd39wETWDGAP9dGKXkBCIbFUYKqw3vzvs5QmATp7K+kMLV+INge86IAkeZw5VtRZOEOzDgNugEB5DyyAmyXgDjX21vK3nHkku2xGV0BXCf4H79o2meZjWjvoHdpTEN2cS/iBCX+8MkwzVI32FeYMk1KQxGbcPBWagWLwfRqqjycTdocp1iF36ABWxsjvqz/dJkj8vbhGqBmszInJruTZHgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlfSv1DNNciq99am7Jp3qzeFgn4MLk6aB9gysACRs50=;
 b=BwBesICdQEfIXYlDvJ44lWUZML0xsjjSzpvMaHt6MA7cBZlnGL3+/XDf8Yy+/3OgzeIpyxaojM2qAPvEFy/NYO9mLzLauPS2yfZ5sxuOFLXKVqmPMuuAjmyF/PzWGwQun1CmzAQubxsC+a0I4lsOFrJ7CrPNK+3TM2T7HeCVULHikzzXyonA4i0Sc/9cvKAx2O0Ua7WESeI5L8mxf0Uf2gl9rVpXXb8Btiq4GJxKG9f7JYBMeY764FzMcfJeG89seXnJBh/TGKKfLsFHtln8Ra7Yz4DfjDXz+O8RhkGnfV7+nB1q8NE2zEvC0D4og6SncVnlsmz7TnrsVrWpsib6zg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SA1PR12MB5639.namprd12.prod.outlook.com (2603:10b6:806:22b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 04:40:09 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%5]) with mapi id 15.20.8792.033; Thu, 19 Jun 2025
 04:40:09 +0000
From: Parav Pandit <parav@nvidia.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
CC: "fupan.lfp@antgroup.com" <fupan.lfp@antgroup.com>, "mst@redhat.com"
	<mst@redhat.com>, "niuxuewei.nxw@antgroup.com" <niuxuewei.nxw@antgroup.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v7] virtio-vsock: Add support for multi devices
Thread-Topic: [PATCH v7] virtio-vsock: Add support for multi devices
Thread-Index:
 AQHbq7cy7Mcj3ywZwU+rYtE4WxELUrPZJsIAgADFHgCAKVi30IACkmoAgAAAtsCAAArbAIAAB65ggAAY2gCAAT4eMIAC+1QAgAASUJA=
Date: Thu, 19 Jun 2025 04:40:09 +0000
Message-ID:
 <CY8PR12MB7195BE725E1871233857FE57DC7DA@CY8PR12MB7195.namprd12.prod.outlook.com>
References:
 <CY8PR12MB71953DBC944921FDD7AB630DDC73A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250619032648.1426719-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250619032648.1426719-1-niuxuewei.nxw@antgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SA1PR12MB5639:EE_
x-ms-office365-filtering-correlation-id: 10fcb076-2089-4cc1-bd50-08ddaeeb5f08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?25OD6P61/SI66lYXLrUi+4jg6H+o9lecA98SZJ/BsuNO8UUf8ZsfYWrXAf?=
 =?iso-8859-1?Q?+G5HaN45xKidBbDBzs8Q7xLjoBdkBSANyXNWAUeTMMdClcrRo5omchR5YK?=
 =?iso-8859-1?Q?wMtj4y4QMa9bjpEThLOuaId1kz0dFeu7KirjRT1hA0UtfnYufX+80culp8?=
 =?iso-8859-1?Q?kw6ulhXhF0WHmep3rhAFdU8TUb/uNfc0vxXtM90OyG3W9Oo0y2agR5aIOM?=
 =?iso-8859-1?Q?8FMLJudBnlF+LJFWqPNSYa6pFPaMxpz3IrBy1R7Uh187C+4AVVZRGiZz2W?=
 =?iso-8859-1?Q?bN1fdxd3xkupRvucr2XdW+IoWzheSGnmfwhEMwgQyFoLO33wSsmVRTz5yp?=
 =?iso-8859-1?Q?l/pFk9Q7DZ1vFTIMWv8/dedE2adCUU7e6D61v0SBeKC3eV9L5EEaYO40s0?=
 =?iso-8859-1?Q?4fjCDVDRfeAiTBV+6udwAsGdcW4G9VWJJzA0u1KBGU9HTGMXVbwDzIsr5B?=
 =?iso-8859-1?Q?sNafAkr4w+3C8ylCCHdWxxUlA5yrMfFxtbk6zLeA3T1ZxZD9PxPb4ubfqE?=
 =?iso-8859-1?Q?z1gLZDFaSauXxcZ3x7RO1Rn0IfgF3P/2yVQi8Vwgy2/gjILB0L0Z9WZPNe?=
 =?iso-8859-1?Q?Xjm+mltAMhCxjiXW0q/eNd0NRmk7afHWMJE9qWnbh9Zfo8Sc2mLVSAg0Ab?=
 =?iso-8859-1?Q?NJAhvtwSsLvjESZeyniGK8+tgtJM9XpqnPfWsuzoWTck5WU3dYWHCRPUDS?=
 =?iso-8859-1?Q?dJp1UZM9qQN3vZsSpmubpsGoPnyxFsyNEYrE6LZIpjqgjHEN63rclGh6In?=
 =?iso-8859-1?Q?r6ohXq8a9PTRq4eA5uDFJJiqhe+LnM8ZkAj++eA89QdynNh1ix1FVqGXze?=
 =?iso-8859-1?Q?ltBHiLGsNrcBD6txhkEA4WK9bIN7Ye0V75effWIEBaeVa7nt0RPFWFTQBf?=
 =?iso-8859-1?Q?TJyy///qUbhve4vzch4TNHMxO1r0FlNJ53AeETX+1jb3QJ+HW6G9Nsi2VG?=
 =?iso-8859-1?Q?qHbgC1rxSpCuAukB0KNDisjxDjuLG7dImNqF77co5WY/ZJZ76Mepow/Rg8?=
 =?iso-8859-1?Q?/y4vUHX8qpoBC/hWuOIpGuWrxDi0s0wRdiBDRM9e1nG2siGnM+4SjUqGvI?=
 =?iso-8859-1?Q?SqhxvamQ2+s9QyrheyuCdtn9Cb6PAlYaIsd1IuVSZMBMzqcDDyyEhGDqOR?=
 =?iso-8859-1?Q?zR6+0mKgPhNNPG4t9LBXZamLe2kZqQaSkc7WTBzIbxAPchH/gvj1l4rtXy?=
 =?iso-8859-1?Q?h1dXidRUfvu+F66fCd/MLx5cCezp9pDY9ecpY+WhogXd6e+kHMjG2vut8w?=
 =?iso-8859-1?Q?4ja0GXbNAH71CkNucsdW0OnoRkRXsDm2QFT/BOvJvSCG2BAGSjnpj7CQjv?=
 =?iso-8859-1?Q?o7oZW10IIe71CezuZ2ovWJOPi73SzJIBFOMsIy4AA5r7AEyD2u73UTOyIc?=
 =?iso-8859-1?Q?3JB/e/uFNN+DR05ACGZhdGuJeWJegBquDkX22QWcEZj6dwEygusVqhSZi5?=
 =?iso-8859-1?Q?J1RZmMEn2P1drOskM0TPCMZ+L7Ka5n95WM0fqEes5N7i9asUuPfWF4yQwI?=
 =?iso-8859-1?Q?ywLPp7r6QKk3CtTRdofPTlROsLDeglYYGEzVb1NkiZ8K+grGuzhoedtqNY?=
 =?iso-8859-1?Q?vbGUNdg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Hg82tOoaaZUcZVUt30qCmEqzMbCj+sguqIBK7PbvT9GPVhR4JG7b0tojWS?=
 =?iso-8859-1?Q?zYqgt3Wxg6ruWGZIhmsAK2/Y96Vluzmh7izy++4idzLD1Y8H9lLUW/ozoE?=
 =?iso-8859-1?Q?xoulI/tEIjrhvjGkI7Jd+tptJ0MYU/nqIVE7A3VtyElzsjDI5gZNlNn9oo?=
 =?iso-8859-1?Q?ZbuHTN5hfQQFZ17BfkBhLm3p7Tcj0uHy+Uor506R+JKsYAcBP+NUfpywch?=
 =?iso-8859-1?Q?Q/syJtg0NtpIjdbikMDwwfnZJebW3G4ega6VzzTf5eR34FxMLTUiemNmmQ?=
 =?iso-8859-1?Q?EE44aZM0dMHSUAWbL1R1iIu37sT54VazMRg6UowmotpdwlEd8gzua/79Vz?=
 =?iso-8859-1?Q?mr9swhJ5xnNkExL+CrYJggttBKoJgcipuVFvX2WQpIJBXyf690EYQhmeV4?=
 =?iso-8859-1?Q?K40E0NQkOO3pAoAKSwkmrt9Og2y8Mb28iRnvACDxZSfMhVQJ3fnbwjQMAZ?=
 =?iso-8859-1?Q?cuRDxa4JsFyCEIlj1KQQ+gFtPtdUb7QqbEVMcmmGiiOTgJ0+H8BdzRTOjZ?=
 =?iso-8859-1?Q?MWyxT5YibEShcFxtbE451PyCy8x+IokN9NElBMcbYUexGPffbQzk1I4/UU?=
 =?iso-8859-1?Q?SaQ8YDe1FOb3+KFl3oykjqV9GS6PXsiWjzdYcge4KfpkJfG1tTPWb5GP09?=
 =?iso-8859-1?Q?9pwAXGWBlHJVBXld7wNL1Fxva9DgswxQL8DsREhWtv3gOn2kdHqr4pvsgL?=
 =?iso-8859-1?Q?AzFEi3TS+ruBau4+kcEzdDxBr7QNLosrc5Ke5r3nhHPmJ8o/UZjjcsDwLf?=
 =?iso-8859-1?Q?CA7dhcRwu1cHRz7oTFyG/hZR7ZK9cC/KmtZCJ9mL4h2rtV+qTHQdli97U5?=
 =?iso-8859-1?Q?eMd91H+5ah446qux+u7bOBiqlJyLeHWheaCG7gxXqvw+8XYy9C5AWooE8o?=
 =?iso-8859-1?Q?V3TpYf4NFQRiMAHjhiUECpnfWEjUY0MEj+iS+OCWjjsQ1Qjki3CQO5qi76?=
 =?iso-8859-1?Q?E5U8hU1xy3ESlu2WGAHi4vIWHahP6bPQS8iwsBFZ5OLus6XZYLls1tZO2v?=
 =?iso-8859-1?Q?PY30t4KO1EPaaxX/3p4eZ+VEnPpAKf+PGoktE3pC2YKit0lQHoBXSQapCh?=
 =?iso-8859-1?Q?6aut8ZUY6QPQsw0ZtqZU2Cr2Q8o5KWy3NXe2y0UVM0SZVCaB3nDoAlD207?=
 =?iso-8859-1?Q?fUVhLfnJloko1fCOFWH1b80RC4GgsxIc/eDaS2b4NmxXLdA7mtzC6vSFPz?=
 =?iso-8859-1?Q?ndUFGBV5b4TiiT2X9rIamhkqWzMSHlkCz1LR72ANvx4Jen2707ZdBQh/88?=
 =?iso-8859-1?Q?VNaEmASg6SlT/EdosQZwTQpz0pcyFg3/+GIA6flDSirWh+rDIUmwwWoE/+?=
 =?iso-8859-1?Q?vBKLUE0VmI58Zv+DWxjI4zSmErg5tmooTUUtLmmd4VmGXacYuaEV7lRVn+?=
 =?iso-8859-1?Q?AuksxSOuhN82UMZ1a+X9O6AXvaKiZCrNpVquvE9emmasmkd9xqhFKFxQlh?=
 =?iso-8859-1?Q?/23dHLOO+fpC8Phr7Bwt5jnBiSaP35ABKFkR8Lax6B+skk0w+DMD8ISY96?=
 =?iso-8859-1?Q?UnWJ5qk1LQpbrtmkUubb4ceksrJlTYIMxrJRMjsr4oWPOJHW/v597HMdBV?=
 =?iso-8859-1?Q?Jf4AOAV85yxLnHAXEcTuzGUQ8uNAuOJmfbGNRsddcr/zSdbpUx5BgPSs1I?=
 =?iso-8859-1?Q?bke2/KUhd17YLiBYHN5xxSzuTcKN+9s1oBUSNqAsVjjtNFG4c5i39NjGpZ?=
 =?iso-8859-1?Q?pOsJ7Xc1OfEpyHPr8HU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10fcb076-2089-4cc1-bd50-08ddaeeb5f08
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 04:40:09.1318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1ynaUdGXKt0QB+ey30iRorMlW0dkMJUB6RqB3SIWDhaPuLn2/nsD+0+hCEA2/KHDointC8ufwkMsoMnKZo2rAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5639



> From: Xuewei Niu <niuxuewei97@gmail.com>
> Sent: 19 June 2025 08:57 AM
>=20
> Hi Parav,
>=20
> Could you please take a look at the diagram in [1]?
>=20
> IIUC, for VM0, there are two groups, and for VM1, there is only one group=
.
> Am I right? If yes, I think the group concept is reasonable but we don't =
need
> at this time.
>=20
> I think the first thing is to figure out how to pick the right group.
>=20
> Standard socket doesn't provide a way to access the group information.
>=20
> Source and destination are from `bind()` and `connect()`, respectively. I=
f we
> don't call `bind()`, only the destination is known.
>=20
> However, only destination is not enough to find the group. For example, t=
he
> well-known CIDs (e.g. 2) are valid for all groups.
>=20
> 1:
> https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei=
.nxw@antgroup.com/

Right. Sock addressing scheme is na=EFve presently to select the group. Not=
 sure when/how you or others plan to do.
This is transport layer problem to solve (not to confuse with transport =3D=
 pci/mmio etc).

However, at device level, we should have the construct of grouping.
Without this construct, all devices will be part of single group and one wi=
ll not be able to build the group concept later.
So even if you don't need it explicitly now, grouping the device is what yo=
u need when connect() is called.

So I was imagining a relatively simple scheme:
For example, virtio device level, some kind of group id is present.
So two devices which has same group id, are part of single group.
An example group id format can be a UUID.

And this is completely optional for devices to implement.
Generic enough and usable beyond just vsock device in other use cases we di=
scussed in past.

>=20
> > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > Sent: Monday, June 16, 2025 4:26 PM
> > >
> > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > Sent: Monday, June 16, 2025 2:30 PM
> > > > >
> > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > Sent: Monday, June 16, 2025 1:48 PM
> > > > > > >
> > > > > > > Hi, Parav.
> > > > > > >
> > > > > > > Thanks for your detailed comments.
> > > > > > >
> > > > > > > > Hi Xuewei,
> > > > > > > >
> > > > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > > > Sent: Monday, May 19, 2025 3:08 PM
> > > > > > > > >
> > > > > > > > > > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wr=
ote:
> > > > > > > > > > > This patch brings a new feature, called "multi
> > > > > > > > > > > devices", to the virtio vsock. It introduces a
> > > "VIRTIO_VSOCK_F_MULTI_DEVICES"
> > > > > > > > > > > feature bit, and a "device_order" field to the
> > > > > > > > > > > config for the virtio
> > > > > vsock.
> > > > > > > > > > >
> > > > > > > > > > > =3D=3D Motivition =3D=3D
> > > > > > > > > > >
> > > > > > > > > > > Vsock is a lightweight and widely used data exchange
> > > > > > > > > > > mechanism between host and guest.
> > > > > > > >
> > > > > > > > Even though it is the current use, the specification does
> > > > > > > > not prevent its usage
> > > > > > > between two guests via a host.
> > > > > > > > So we should not assume such guest <-> host communication
> > > > > > > > as the only
> > > > > > > case to add new feature.
> > > > > > > >
> > > > > > > > For example, in the spec only must requirement is that
> > > > > > > > src_cid =3D=3D
> > > > > > > config.guest_cid.
> > > > > > > > Dst_cid can be anything, it need not be well known 0x2 (for=
 the
> host).
> > > > > > >
> > > > > > > Yes.
> > > > > > >
> > > > > > > > With this flexibility in the spec, one can connect vsock
> > > > > > > > devices with multiple
> > > > > > > different backends.
> > > > > > > >
> > > > > > > > For example,
> > > > > > > > QEMU can insert one vsock device for VM to HV communication=
.
> > > > > > >
> > > > > > > It is also able to communicate with other devices on the same=
 host,
> i.e.
> > > > > > > VM-to-VM.
> > > > > > >
> > > > > > > > A real PCI device can insert one voscket device for
> > > > > > > > VM-to-VM
> > > > > > > communication bypassing a full TCP/IP stack.
> > > > > > >
> > > > > > > AFAIK, all devices are implemented in software. Is it a real =
PCI HW
> device?
> > > > > > >
> > > > > > Yes. virto PCI devices are implemented as hw or as vdpa for
> > > > > > many years now by
> > > > > cloud operators and by NIC vendors.
> > > > >
> > > > > Thanks for your confirmation.
> > > > >
> > > > > > > > This means there are two different backends.
> > > > > > > > And these two devices should not be grouped in the use
> > > > > > > > case you
> > > > > described.
> > > > > > >
> > > > > > > I think one group is enough for all use cases. It is
> > > > > > > required that CIDs are unique in global, i.e. all backends.
> > > > > > >
> > > > > > > As your example, let me assume there are two VMs
> > > > > > >
> > > > > > > 1. VM0 (two vsock backends)
> > > > > > >     1.1 device0 (cid=3D3, default), backend is host kernel (v=
host-vsock);
> > > > > > >     1.2 device1 (cid=3D4), backend is HV (virtio-vsock).
> > > > > > > 2. VM1
> > > > > > >     2.1 device2 (cid=3D5, default), backend is host kernel (v=
host-vsock).
> > > > > > >
> > > > > > > The device0 is able to do VM0-HOST (src_cid=3D3, dst_cid=3D2)
> > > > > > > and
> > > > > > > VM0-VM1 (src_cid=3D3, dst_cid=3D5) communicatation, while the
> > > > > > > device1 is only able to do VM0-HV (src_cid=3D4, dst_cid=3D2)
> > > communicatation.
> > > > > > >
> > > > > > In example 1.1 and 1.2 no devices are grouped.
> > > > > > Your proposal of this patch wants to group the two devices and
> > > > > > pick one of
> > > > > them as default device.
> > > > >
> > > > > Yes. I just wonder if it is possible to have more than one groups=
 in one
> guest?
> > > > >
> > > > For example
> > > > Group_1: two devices dev0 and dev1, implemented as PCI HW devices.
> > > > Group_2: two devices by QEMU SW implemented as sw backend.
> > > >
> > > > All the 4 devices has _F bit indicating they can be grouped.
> > > > But there is no indication that they are part of which group.
> > > > And hence the guest VM driver is in dark on how to forward
> > > > requests without
> > > the bind() call.
> > >
> > > I see. Thanks!
> > >
> > > My idea is that there is only one default device, no matter how many
> > > types of backends are. If the users intend to use other devices, `bin=
d()` call
> is required.
> > >
> > > For example, we set `dev0` as the default device:
> > >
> > > 1. Do not call `bind()`: use dev0;
> > > 2. Call `bind(${dev0_cid})`: use dev1; ...
> > > 5. Call `bind(${dev4_cid})`: use dev4;
> > >
> > > Even though we introduce the group concept, if we don't call
> > > `bind()`, how does driver know which group to use? If the driver
> > > recoginizes the dst_cid, it can use the group to find the device,
> > > then the things will be complicated. The driver needs to know the
> relationship between the dst_cid and the group.
> > >
> > Based on the dst_cid picking the right vscock group would be needed. Th=
is
> is vsock level issue at driver level.
> > Driver would need enough hints or encoding or of dst_cid or something
> else.
> >
> > So even though we miss vsock level construct, it should be the reason t=
o not
> group the devices.
> > As both attempt to solve issue at different level.
> >
> > > WDYT?
> > >
> > > Thanks,
> > > Xuewei
> > >
> > > > > > If device0 and device1 are inserted to the VM0 with the
> > > > > > feature bit you
> > > > > suggested, the guest things that they are part of the same group.
> > > > >
> > > > > In this patch, we don't allow to insert devices without the
> > > > > feature bit if there are already devices with the feature bit.
> > > > >
> > > > In above example of two groups, all the 4 devices spread across
> > > > two groups has
> > > the feature bit set.
> > > > Yet, they cannot be grouped correctly.
> > > > Driver driving blind thinks that all 4 devices are part of the same=
 group.
> > > >
> > > > > As a result, there can be either multiple devices with the
> > > > > feature bit or just a single device.
> > > > >
> > > >
> > > > > > When bind() call is not done, host sw does not know which
> > > > > > device to pick up
> > > > > between device0 and device1 when binding the devices.
> > > > >
> > > > > Are you referring to an vsock application on the host? If yes,
> > > > > "host sw" is able to pick up one device according to the dst
> > > > > cid. For example, pick up
> > > > > device0 if `connect(3)` is called.
> > > > >
> > > > > Please be aware that the "host sw" can not pick up device1,
> > > > > since its device is not in the host kernel.
> > > > >
> > > > > > > In a word, a tuple identifies a connection.
> > > > > > >
> > > > > > > "Refuse to connect" will be raised if the device1 attempts
> > > > > > > to connect to the device2. "They are not in the same group"
> > > > > > > is a reasonable
> > > > > explaination.
> > > > > > > Am I right?
> > > > > > >
> > > > > > During bind call, one needs to select the device when the
> > > > > > devices are coming
> > > > > from multiple different backends.
> > > > >
> > > > > Yes.
> > > > >
> > > > > Thanks,
> > > > > Xuewei
