Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C51F2914
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 02:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735181445; cv=fail; b=rTKOZNtZBqzBSiOz4NiO48HQGjQaMUdEtUxd+2SktPSOOFBMVRIO0D5/8vX9A7aBodi7pm3h2dsw/tDBrY5mKilhgrlbNqDX/aI/sm5WOmiel9Z/xjbXPfuGPRhtNr/rPSb7WCJwV5mBqZuw5NEMY9wET0y76yFSwEhb2R67EvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735181445; c=relaxed/simple;
	bh=fmqUo+sC3vCrwPJjbUYhb6o7Lg09A6Ax3teLJiqsljM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HNw0CuglK+rWQZjvc9g/Dvgin8gCxdFW09zPFlGDKPuknV3FfPpO1L1i4kQqocTga3qPBsWoCpZ6MGDxjKl/TKCyy/DpUOpHrdOk9a8rMB4pI/MkmwKlWEb7oOxcKsY3V7aHZBjGfNlvwZSJEyfWbcT8xUKKH3WNjKINyRqEY88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EnYh3a6x; arc=fail smtp.client-ip=40.107.236.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EnYh3a6x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkXluJcP4icSwBTdXL5zHbr3og4XgeSlPJXZtKS4m2j7PSiJkWWKk1eV2FhndlMwM2/e86nJ1PzSSKbPpUsiKNCLLdGgLC1V8clX4PIBM0QOKDhqGpmjq0MCu0IRd5428mJLp+ymYOF1z5czQI0e1GkekfpWtlgTh/HWfd90FEAq7RmY+CzOjDlvrZhonUpa3djDet0eqEuwm42/LmNK49XkyYBMm/7KtMIwlfj1BG29QYwLnFiHDcBFR+xou3HwCgT4E2YM5Jb0/VOeE9jNBIuJSAl3ZjfwP4ADhRxGMK3l62SG2FCXg+lBKul8kVxovtrVOJZzqPa0PHlxn18xKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmqUo+sC3vCrwPJjbUYhb6o7Lg09A6Ax3teLJiqsljM=;
 b=rIBlewk7TBCv1fTjFXQwe4scjNvmI52dqtcl+wFSeU5x/OnXQ49H10oU8yVyd6DmB95ZXlmyDuu0XzWP7DDyhciLRfDL8syNqs8cXsPUtM/7vFyHglF0JhGDll1I4sTKX4B6PFKF/mbzAdvJ70IkDxypB2DnVGWWXyocCjcZi5YIqE+TJpizwnmhji+iZq0pj9CcCHdGx9r17LfEle9DwopE6B40mKP2jsBR12tHno3ut7+9svxkWpIQa3/TEfA2WdNN+JdBpZINxlFlR1Z2tn7MwfNyuOrD1tEGtik/gSst0JpH5VTOeq6+8pvtRHncNSdwIROqmc/RWaOm+SCAQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmqUo+sC3vCrwPJjbUYhb6o7Lg09A6Ax3teLJiqsljM=;
 b=EnYh3a6xsde/4Y8l76ENIgQVELxEdatEu5LPbZcUZdjVgmCs0GDNLQnPhfQMa9fg71tqkGuOcl0dfvqsLGPCK2Z+GOUNU0IgPpGsAODUjcOhcTpH9BeEU8j5CsS3484SOnooaq2Z8hhvWCsElB7zv6hQBTWQli12rvdVMz59sCD8izsohVhWgEKMx6gTOVd62lwOWrN45Kle9x3hvFwXG+cwotNzQ3XAoQ2E2CcoirwRB30+4NRr9NDZsPr9Xw4SxZeqtSGAWeFFlQOzCoirNr2bCdEdOH+zyHfQIuyYr1LZQTobapNqGhq33bUlsqFIs5R0X7rIkryqixScuUKk/w==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM6PR12MB4201.namprd12.prod.outlook.com (2603:10b6:5:216::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Thu, 26 Dec
 2024 02:50:36 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8272.013; Thu, 26 Dec 2024
 02:50:36 +0000
From: Parav Pandit <parav@nvidia.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	"devel@daynix.com" <devel@daynix.com>
Subject: RE: [PATCH] virtio-net: Change num_buffers value
Thread-Topic: [PATCH] virtio-net: Change num_buffers value
Thread-Index: AQHbVpVXJB3eBmv4ZEexViKG9GakbbL2frMAgAABQgCAAVHo8A==
Date: Thu, 26 Dec 2024 02:50:35 +0000
Message-ID:
 <CY8PR12MB7195C2A20025389351D15B8DDC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241225-buffers-v1-1-712e839e8ad1@daynix.com>
 <CY8PR12MB7195705CAFA8759355685905DC0C2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <24facd94-87b2-45d1-97ca-851595e8cf41@daynix.com>
In-Reply-To: <24facd94-87b2-45d1-97ca-851595e8cf41@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM6PR12MB4201:EE_
x-ms-office365-filtering-correlation-id: 086ee9e8-68cd-43b6-6ea1-08dd255812d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ts/C3mK7Sso22a5WX4hXDnwmFGHT48wIRclCy6pkV1ydHWE+txEeQg32SARu?=
 =?us-ascii?Q?zGnSYkRydaxipVh9e9VKk0/fkzJICyKPxkrBNp8cFqXesdYO8Ii9f07DqIfw?=
 =?us-ascii?Q?97jM/Z1g6Qf338kVaxOApP4bcFihNSnJvtqFqEsi+jfgRENSUMF7bKSLwqiP?=
 =?us-ascii?Q?NRA8LqgIh7j83rsoRSleWeHQ7D5FL7K1vF8M7g5ckvXpB+UDtCZkO6QdJ0mF?=
 =?us-ascii?Q?jXdezDtQWKreZyXSTghtJHCWIkWOqLLHLksD/m8CJ8MPpCOA3j0g0Y3EHMzF?=
 =?us-ascii?Q?wNAbF9R1uV9XUPoIdtyxjDkcB3v1NUUlpNddjkMw37pNXat/27B17/5CTa6g?=
 =?us-ascii?Q?uEFxKwGs+IMgIa6ZxB/bMXBFkL1IgQU/aKAF1/r2PxsOGC/O/vx1hNMT1YPZ?=
 =?us-ascii?Q?gFvhDhpOikYktOjcGV+QP6vP9YihMLBiwc6Mo6W9U5oGQSAicdU7fmoTimrs?=
 =?us-ascii?Q?PWlyzx3mZVhTYwpn9dVIVSVnvnrpPOuo5aUtZ1NqQmNaUnwkUUtZ7duhx3Yr?=
 =?us-ascii?Q?G75LP6AZY7CDsE1DHArznYiSCFHIgy5J87diRVS0ssy6pkA3UFcPCAH9EbNL?=
 =?us-ascii?Q?GOkFKZwOK8ZuGjlhdDVbtv/FHiXif+9IRRfiEkWtu53Le4YZApTkipih+gUV?=
 =?us-ascii?Q?50fVKrexHuFFCQ5VKjj4JHPlSUZjt6SyNH5i/zR0D7k4OL8jqEG+ziKlTW1N?=
 =?us-ascii?Q?XIrxQ9Q9c36bGZkkJTu0qI3/PY2VO/L1SLMCq7OLvzHkQ786p+WpWgC8KyE2?=
 =?us-ascii?Q?cyt1d82cCECxeSoUskviC4MDLmwYPIdvct4wCfPSkQLr2MimD7wQQaO34Du/?=
 =?us-ascii?Q?MUBXhJBtZLZCzUOPyCIulSQv6FchTPvoBA7japiTa7Hu7rEKh60V7o/NGQam?=
 =?us-ascii?Q?wx0QFkyRTp6cwZszZSnP658lCh06tbfdAqSnr95m9VPLhF1vt8m4ZTusCyGc?=
 =?us-ascii?Q?XA9iSyStNwiTt3YEzKjyZhQxmo03dtEIIWUD9WtzI+N9dddY0mucbI6MUYj4?=
 =?us-ascii?Q?VZl4QahNE2HfyzZlF+NY5t2KCI2fPQKYICNNoS70+SBSaVtxsNrY4ub9vjxA?=
 =?us-ascii?Q?Zk1iof9uNoUfnl0dxAtz/UIIdHRJE3RM7of3BNJbJxGqBfMaV57bRHTCkN3/?=
 =?us-ascii?Q?Qv8vM18or658VGJ34DUgdQtYx/xizz9mi3O+OawyPCW/i521pyBOwiBEzQSY?=
 =?us-ascii?Q?z2cKUs/kZePsXDj9BNeBkvCx1Gx+R7cInWmzagCobCpY89qeAHfdEZQ77qIG?=
 =?us-ascii?Q?vb71BIv5lqOmYikWMdjxvYupIEBcWeJKbr3yYAlkIoMDSQ4GNks849e8w8Os?=
 =?us-ascii?Q?AVz77BNwzr3c5O7lefroEBYFPhNa5D/itApj7qic2T25VWJskoeVby+CeSbL?=
 =?us-ascii?Q?VgnKxDv7tbtWbEKZCGamGcZYYJClkce3vqFuYg3VD8Thc6qAGN9Cpovzt65k?=
 =?us-ascii?Q?ARpI4OUr5VhGi7eYPSJGhea/JD8JxS3w?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1EIA99CZIKvz8/Sx8m+QBMG+6Dgt8azVG+PJdmcRUI64V+kwLhyQZEirloMG?=
 =?us-ascii?Q?cj0y2g/DKUvQ0vRFHJ/cVsTafh+vLeFU8ZHcELtj2xNWjav6moBgtqLR7yxW?=
 =?us-ascii?Q?G6Szq6paCtAqGafbwb0pNLlR5xceAiG6lDhhgMcwZEyKUpwfOAGQRvJ1KAra?=
 =?us-ascii?Q?vqYCNUNlKPQUxIlwx9I8rcf0oMBAcRWHhLEISGiZG6BtjwUc4Ww4fxHzU2xF?=
 =?us-ascii?Q?mZIjGsnf/2ukHtQGRQ4Wq+y4IRjtiJ/pOBXoRtggeQFXd1Mvsjm2EwUGszMn?=
 =?us-ascii?Q?jS0qc9vLCzPpbJBLKNN3o/vf9ucdhyXG8OYacTv/3LLqpQleeU7F/m8+esx1?=
 =?us-ascii?Q?6NG8ghU4qa1vnnYQ+kOdk+/0bmUK89O9EDhbCl32pQksFAzQhzJxSUL4g1Ab?=
 =?us-ascii?Q?btifyEI2IlD8pkkgGWTCUlpLDjMGRQhFRMpo95Na0Z1B0lO6Ek1ouzVG0cVK?=
 =?us-ascii?Q?8NxTZDAIVUOiUZqE/YscSHEw5tcnAPzL1NNgz74I3h3jd5X2eRfvdiG/zZmY?=
 =?us-ascii?Q?mrCPDSx9GuLuUb9KvcrXYXX7uqwIMsGTh9D6vZwQYhPHVp78xPiCgU6X/G11?=
 =?us-ascii?Q?WtwXfGt02Hd9u3DVkCcgpxjda5oIia3/w2y9VjdoTbMU8+gpQRl77UrNFDFT?=
 =?us-ascii?Q?Ht+dr83AmCQ4YdrsnRra9HugTNaZRSSRc2MeYv2JIbJy+yE70ePTvtoFNTWJ?=
 =?us-ascii?Q?k4cpx9+1fa5dikupB+2NW11SWadNul9joUOJLRlcI9W1mxL/PX7OHp8yFtcY?=
 =?us-ascii?Q?ggqD6BLl9zhTVIvHm6lrIbNpfjMxCgW2sT85JDDdQq62enAEZBFVX24pvypw?=
 =?us-ascii?Q?VFDgceI/jMeEOFzdyFrthrSdZI6okhXZ9f+BoVfyjl8Ltv7aB1MXoVY1fzpK?=
 =?us-ascii?Q?qGHJs/hZAZfkJQ+gmZPknWu19SoiUcvud0XGIsAP9r6kFckH9Cm4335XsT89?=
 =?us-ascii?Q?UnYaBPWUpKZ1CAdzOuDJyS1qzh7MJi7kVnlIyWeb7KV8uHr7SQERsGTaxWkc?=
 =?us-ascii?Q?5X4aQs/Vlw3hApH4bqwMCplQu8A80KBRVQsXENRuTTWLAD5EqSDZWAU7w7nT?=
 =?us-ascii?Q?bkZPrA/Mrp7IVEbbFhPu3a1070liukRJ/D+xgZXF88ph1xWKMoL2Vhh/s0Aj?=
 =?us-ascii?Q?hJokVd6EIz92WOqoLDp53jIJ2RyE3I5ECXKjero+49HKHLfeJ0fxtO9mtCeQ?=
 =?us-ascii?Q?2rDGh6PwqRFHhnZJb3keCMxIVR0dMMEZGUaXWl1/qudGrassDjMnqNt2j6G2?=
 =?us-ascii?Q?1bbCPlk5hhDAYPYPfBlHx93NeviqbHMpAsz5P9/gwiS7jbaeJBiOP/Fg/iUN?=
 =?us-ascii?Q?p1cjPKf6Ey8P/kQtcazvjIeYrHEcCY9pD6fZAk2kihVSzcczURVk3mOycIN0?=
 =?us-ascii?Q?RtceI4SJx65mQ0PFxRqELjeLE/iH/5euwd95iggT4rvewKltAIs9FkNf59Oc?=
 =?us-ascii?Q?8JEr0QENq4qUOF9b50J6RgNfp3AXTjJHXOimH/YCQ/RKX3n/gEcNDeq3Mncr?=
 =?us-ascii?Q?uo2RVG4LH2HZa0sHfMN9huDU80o+U0vKmHKMcpOSarBZ8L8zo4qXvC4Wlurt?=
 =?us-ascii?Q?DQUY0S2oOCKE2wB1FJ0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 086ee9e8-68cd-43b6-6ea1-08dd255812d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2024 02:50:35.9730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c1BFWKvuJbZQwxB7owxSWzc6/uaGk/HYADC+CPo5ZRZPTNOJiVvYpSrKCxAP+SKw1S5FmPYxcE01GwySjHW5MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4201


> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> Sent: Wednesday, December 25, 2024 12:01 PM
>=20
> On 2024/12/25 15:28, Parav Pandit wrote:
> >
> >> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> Sent: Wednesday, December 25, 2024 11:52 AM
> >>
> >> Linux's vhost_net and QEMU sets num_buffers to zero when
> >> VIRTIO_NET_F_MRG_RXBUF is not negotiated. Change the specification to
> >> reflect this reality.
> >>
> > Please fix the vhost_net and QEMU to reflect the specification which cl=
early
> writes num_buffers must be set to 1.
> > (the last hunk of this patch).
> > One cannot suddenly change what was written in the device spec as 'must=
'
> requirement.
> >
>=20
> This proposal is based on the discussion happened during the vhost_net
> development:
> https://lore.kernel.org/all/CACGkMEt0spn59oLyoCwcJDdLeYUEibePF7gppxdVX1Yv=
mAr72Q@mail.gmail.com/
>=20
> The reasoning here is that vhost_net and QEMU set num_buffers to zero for
> years so changing it is more risky.
Less risky for the device or the driver?
Your response implies for the device, but do not understand how it is less =
risky for the consumer of the field (driver).
If the field was never read by all the drivers, it is better to modify the =
spec to say following in the requirements section:
1. device MAY set any value, or MAY NOT event set it.
2. device SHOULD NOT set num_buffers.
3. driver MUST ignore num_buffers when VIRTIO_NET_F_MRG_RXBUF is not negoti=
ated.

For the real PCI devices, this actually can save the sparse DMA occurring o=
n rx packet.
(telling 0 forces the device to do the DMA for the field that driver ignore=
s).

Also please change the motivation in the commit log to indicates that dpdk =
pmd, freebsd, windows, Linux, QNX drivers has never read/honored the field =
num_buffers when VIRTIO_NET_F_MRG_RXBUF is not negotiated.
Hence, make it optional for the device to set it.

Please work with those open and closed source driver's maintainers to get t=
heir ACK on non_usage by the driver.

This change will help to save the PCI DMA.

Thanks.
Parav
