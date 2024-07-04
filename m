Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2115.outbound.protection.outlook.com [40.107.215.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A50C12B73
	for <virtio-comment@lists.linux.dev>; Thu,  4 Jul 2024 02:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720060050; cv=fail; b=QFIsl5kkA42nYYI7B6r1C10/3agyH12+cmiEpOYtbW26IOlYCo9h5NPIIJ2AaZ6UtUt0YcliviUvPHj8uSoI3rAN7ZQ7nOgWcfNIwsfWL6+d3pOup4h78wBirmD0gUtjF+cT5YHQD4/QNRZUZ1Wk4YUQnHyQwqhwPIdSkx91Wis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720060050; c=relaxed/simple;
	bh=E+Rj183ziu60Re3H2ULhm1qGRcy/Vlp4NBl99eETYMY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wyqg9TIcvNWVOIjg+hy+n0++Z5HRoKXV0whU0hF0m5FDYayhdROvWVvNFEJM2kY+OuNiCAKGdLygGVQBc0iu9ltfUcVKPUIe4xjZrT/sZZKR67RwN6ZqXiI8fzpSLhjcpTx5JfkB8jw4j/2brkeLC5ae53gg3ipeD5cnuUtAo54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=UJIiB6L8; arc=fail smtp.client-ip=40.107.215.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="UJIiB6L8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTeoX87GF/YiKDv3OmZEaGTmkitSS88GYALbASYh2656wEagC+Xqa2M1GXb7SaKi9vSs4H86BxuFUVbHXbfLexZ69q/fEVi4dxExZMe9uyhfKkl2/x1YeQaM+ojA2XTKxmNk2g+rP1uqt6CsShwyQJXe2mq70QTEdiuKC5xoZakuGDtU/DrvXYkdfi6105aYvEmkw3247bsuEkzZYmzw3jmFfBPERGcbB+RqEWt3Fez23S4AfoLpOYwA7gtLOgePto7BEmgyx41Ne5RtvQw3d8GCnAjD8V2vEcaxXDR+o0XaeazPD5c6EiBgm9VoQYqFaT8nwsPVrc2MkPUmrSd4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRjYvpYR9yruENg3oDAem36FbtH4ZagVws1GylL6KiI=;
 b=DPadOMJGRGEbzutm+ILy2Kn6o0J1aFoFATvUhy0abDN2kSDTZJeq+X7Tq5uFPSFevIt/NdSq9XBOZUBkkxno+BoYFoiBwv+RD3OwALCoVvWxQDZDrf8XUrJIbIGaF7HpJF6QnR3fnInX1lzSGccXmEedG1ZSqSLWD6XihMjOhE0yXkxvGwDZicUH6GY9lt2ZoefDPv3ULR00YXyRKS6bJ0/02i5P2xwK15mdZ2GOr2FrILJAhFoue/0dlCpdqPfXxl8Gv5Z40nJhJGnjAjJ7PzCrl24TyZ2B/blNam6xyD10WPN8kZcMBsBreXfvqh4Jp/q30APOyxEOQoQvbTaKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRjYvpYR9yruENg3oDAem36FbtH4ZagVws1GylL6KiI=;
 b=UJIiB6L8mVJHWnK0TmXeGt3r5UFT6tx+rmJZGNpPqgqimAjGoAqjXyGlXmg/tr2LbezQ+sSDBIxVmfWx6JRuJY/+7EU8NvBoWWqLnb297GqrdjWlIUTpBRWloI63bewM54YkGXpbty5UTaPNBJ4WgJkd1EJRGsgp9Q/1/ugQ7/ndDeoVpnCcV3rErNdlAIlUxcEBsFKOJw+pUe4uXR2XAhb2dpXgBOIzbwdjO21TSyJ8qME021aP1QSVp8bqDbiCeM0RUSE0HgqPOdoze0zxniagAxTm7m3Ki6wwNyRMcfN5Yxo/kUhYyjRmN/0UrqcKPZTL8rmDu94mhiQrjHqSLQ==
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com (2603:1096:4:1ec::12)
 by JH0PR06MB7055.apcprd06.prod.outlook.com (2603:1096:990:6e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 02:27:21 +0000
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd]) by SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd%6]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 02:27:20 +0000
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
 AQHay2kF67vqaBJYMUW1XCStKdNnOLHjWBeAgAEuLyCAACjYAIAALjYggAAWi4CAAOYg0A==
Date: Thu, 4 Jul 2024 02:27:20 +0000
Message-ID:
 <SI2PR06MB5385F178FF558878062A4D2FFFDE2@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <20240702073359-mutt-send-email-mst@kernel.org>
 <SI2PR06MB5385E3CEC459963A7D079B56FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240703042525-mutt-send-email-mst@kernel.org>
 <SI2PR06MB53851F07C15BDC46C74079B5FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240703083151-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240703083151-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|JH0PR06MB7055:EE_
x-ms-office365-filtering-correlation-id: 865668d1-2b3d-43b1-6c7c-08dc9bd0d4ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?Vcjj7A/WW3mf92c8VJFB3Q7BTjJJjpGHBPvzz5bdRTdLtzK/S2omsbKL?=
 =?Windows-1252?Q?8++xua0/dIJ1h6rMIa1jS/bmFaVIIfSdhqCTaJ3sNSFA7a5vMP89ZAZr?=
 =?Windows-1252?Q?9ieQtxIbzNAvozhuQz3BoH5YgertHqz6mMzgjAFAAwrjvgpehIzEjGbk?=
 =?Windows-1252?Q?jrVfRad9vP/Kyg5BgG84aWciUtFEcP1wKVpPxxgNf94RXfGkv0C9ke8p?=
 =?Windows-1252?Q?UEJ4fa0e7bpdf3uTetVFUMuRTdQa5utxCHT4zwJvC/jOq2QSB5Nmw/Rg?=
 =?Windows-1252?Q?Z8gBuvIS5Pxc2yi1OJA2WFCuRts7AOqqekUmfJq3AYzW9/YHHyd3PhV7?=
 =?Windows-1252?Q?MFMWOn3ucjNsB/JUMIcV5QCIBpyUrFdUl7T7OYrfn79BEqJ5r1FXhrko?=
 =?Windows-1252?Q?KHbccK3RTz+BktzqozbEyjfDY8PLXgN9r7OpLggqXUW50Xtb/8LjOw+i?=
 =?Windows-1252?Q?7Ttr1dKgH/RVmv8voAMVJJUogpj0OGCJD3P5+LqAW3ma753MNuWFWSO8?=
 =?Windows-1252?Q?npUI5+BB5wUmKD8YefCJixm9dJB76SNqQ6gvkjRNnPARF4Ok0To30FSu?=
 =?Windows-1252?Q?F+dDyTVmeYdaoWVXENPjSHAVgXy3o/Va1jw4hO92WSojlK99EYm3XCHD?=
 =?Windows-1252?Q?gpbJ+95JHfb39L/y7xcaTQrr9QR65Ur10++6kT5eUWNOIBUKE05CAGam?=
 =?Windows-1252?Q?KvhSfOQfngTIfEsu5e36FIIBnAnMB82vvwHLrd+gWD/9g/OgiUvo2Rj1?=
 =?Windows-1252?Q?nffjzLWxBryk+/oLydR3xf7c1JgkyvaNZKZQGjbOPwlicnzsUmhJf8vp?=
 =?Windows-1252?Q?LQboTSjiH864k02RCTKXjBKkQK7Y6eaKmgcXnaUwTNTYAy//ggHVpC6y?=
 =?Windows-1252?Q?pO2AvtQmAFnVLr0C9jtJLu9RHuitEY/RS/aGHpscXbY02FQgX7B8Ku49?=
 =?Windows-1252?Q?7wRCYxJeSkw5rmmRZQYeZkOxx59ZjmN+04aew49DG9LrD+fTQoRJ7rwJ?=
 =?Windows-1252?Q?Ob82NFgYDJyM78kArxpC4pw6u/BZFnlvaCK39e7oB69cpiKbOTLP4OGP?=
 =?Windows-1252?Q?RjcGHvjaSzHh8X81jlXVludDZAY/TJjSRS/gAQGGj6+A/dq55lSXpXCq?=
 =?Windows-1252?Q?VB6hZ7SxudxRo8I1fxE5L1dJWUQ8dq2i4M8KSiLOZ8NeZkwbD3otOYgr?=
 =?Windows-1252?Q?nhS/2T2h42udaXfonKtCVNagu8JezDAYYsre47ths+cUeADb4cMYt/CV?=
 =?Windows-1252?Q?WBu11Kcj2rVvEcTIVzrKATW59ku744I6X/1vviUZyaluTAEbNSA8wzWp?=
 =?Windows-1252?Q?32XbJjZoBijGGhG99JF4rQcl5MDWd0J/lc62mTg3j3FnV/X0UPfjvMzK?=
 =?Windows-1252?Q?3e1mmzenhDb+vaeYjLbncypQJyryRNeIqf8EFpJviGlcC0XYk1ORF+H0?=
 =?Windows-1252?Q?apZAuAWsMCAK5O8DwiRGKaXj0FIIVaBRULBC0Xn4hQTE58RmUkhtcA/W?=
 =?Windows-1252?Q?BthFiTei/COKWme5300YELM2UnMkRA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?Iq8/yq+IHj3xnoc4JSmkXHA/SuYLLNP17JjG8rZFQeSe0fbx4VCgQXX3?=
 =?Windows-1252?Q?R4H5CyVPtDhJRFnQmLZQs7JSuWV6qYtRHGQqhbiqft5W2NVVJj4iRXeX?=
 =?Windows-1252?Q?TeG187CYElZnJDBlLFrZy4dnxlzm9SZbCc7dPzcJTuNrphADqNtoICYa?=
 =?Windows-1252?Q?D+fEMgfC2zEATT2VRXQVIb9hEb2j7UZwWiNN9X/0iX3RU8yx11834cz3?=
 =?Windows-1252?Q?eiqA3ebeO72Uf/EDJOhB9M/+d84+WkN/nsVuLyXfZKfRI+vcUWu8MVAK?=
 =?Windows-1252?Q?tfks/zl66jl+/rj1yinwouvcBecrfn+bYFPFUZliW4R9EoB+bS9t4Y13?=
 =?Windows-1252?Q?FyST5pngMahafxmHdJJ2OxPvC32dsDww9RA98LUCREk62GcC3WKKw0/Z?=
 =?Windows-1252?Q?j/sItDKyCdcnX4n3W1/vIqTWBDW/rABUV35yxlv5uQ7/NEWX1K5nPXBR?=
 =?Windows-1252?Q?xyeqkuB3IUaDEAWhBuh0C/R17lwKndADFRY8bkEx3O7VNGuNjCIAtTQ/?=
 =?Windows-1252?Q?GxsI6jgsio2CiPPXU39Qqc+WvrlB/RwjELqRsn+9HKGjZ3MdBKyKB0K3?=
 =?Windows-1252?Q?BHrrozhl4RC91gOOGCJuQpztlTHMHtWkNuCu1a/o+7X5PpNWA/uOrASc?=
 =?Windows-1252?Q?vTcsFpLhyeYs9Lq3LwQGakbioewbMq7Kw/5quRJUggvjblSXLfrpUlPM?=
 =?Windows-1252?Q?aqPBYhJV8AvkgYLm59CmT2xYAtFi8efsYWk+JC7y2G6N89UvMJ51Rsgi?=
 =?Windows-1252?Q?Gc1OG6hg9RghtcbAYnimaXZKXPyAKUduq+CMc8n70l4R0Vv3wtBabS9e?=
 =?Windows-1252?Q?Wn7XRSiBhM9Ja53gASXAW4UQq5OpomlDLIOVZgAD88iXlB55YiQPCOpo?=
 =?Windows-1252?Q?3VeUgHTlU/Y8jzu2ktv/S+PE1OJUpwbdJh43qLLydTh7Uk+mhiW7NRSq?=
 =?Windows-1252?Q?LsmydpjbiIbm9NDpUDT9UpTS4yOh9RTr8Ut01IpMn5hOMFICx6gWprcm?=
 =?Windows-1252?Q?AWjhb4EIFXb/ihTPgYJO1phyafqJr26Z5NRbgBJOx+xg7diG/cjT1YTw?=
 =?Windows-1252?Q?9ZCoMLJKW6ndDmphKL9i1pT7ZmPil1vY+Tll3UAclS1b5bl370AwWcOQ?=
 =?Windows-1252?Q?faPzqJDV9pFVOCNBa4ns3UoywdTwlfwBusa/hmtsTSzt7UTqfLPq84E0?=
 =?Windows-1252?Q?erxns7ort+FPMGyuUvHWkOYlHyQRxFMKAZj89cQL5gl3CTZiUVecqGcP?=
 =?Windows-1252?Q?b3xpbnLShYhoc4qCA5Vi4DMFLJJxWPtxYXg7VNgdunDK7AUA5CxgBqLy?=
 =?Windows-1252?Q?hO8UAbHrumYhpVI0nW4UdzGNNv/GEKpFr8gSnelfD2PFDYj8wQPNaT9a?=
 =?Windows-1252?Q?WDi7yaZlhBtavUBeH6oZ76A043u1KAKLJZJoo2XGDneuh1gI5c2mLtAl?=
 =?Windows-1252?Q?w31XrUzFaKdO1sBBvgXvBsVch6zz/iPQ9r6i7K/Ltsdn80qdloFZ9k9l?=
 =?Windows-1252?Q?UbRgdoxy8vu/Pt0RoY8rQIKBcRY/BrCQw5Lmo+cf8a82XWhRPbb33T1P?=
 =?Windows-1252?Q?0AOteXHk3mD+J27NPjU5krk2PAY6wVSKnhLjf0Ol5ZCpWVvSGkqLjk4/?=
 =?Windows-1252?Q?+RAf4zSAV1GMDTdViZZyynsDfxsjdmPK0dYGXKIUKfVlWy0GWBVieo9d?=
 =?Windows-1252?Q?G40otbvEnIDZveyhdx0SSPWaUoBTnUk1?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 865668d1-2b3d-43b1-6c7c-08dc9bd0d4ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 02:27:20.8283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ncFiK4l+8NIbGqgFc3n3u2jkSHWpHHyh/z44XvsWQMr0IarT4oEQWjCiew2VTJGu4bbZP6y61CIu/go7L6J8xtfj/deXXDa4M63jDqljnSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7055

hi,

> -----Original Message-----
> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, July 3, 2024 8:34 PM
> To: Lege Wang <lege.wang@jaguarmicro.com>
> Cc: virtio-comment@lists.linux.dev; vattunuru@marvell.com;
> ndabilpuram@marvell.com; parav@nvidia.com; Leo Liu
> <leo.liu@jaguarmicro.com>; Angus Chen <angus.chen@jaguarmicro.com>
> Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used
> buffer notification suppression mechanism
>=20
> External Mail: This email originated from OUTSIDE of the organization!
> Do not click links, open attachments or provide ANY information unless yo=
u
> recognize the sender and know the content is safe.
>=20
>=20
> On Wed, Jul 03, 2024 at 12:14:01PM +0000, Lege Wang wrote:
> > hi,
> >
> > > > > After reading this and the text, I can't figure out how is this f=
eature
> > > > > supposed to work without races.  What if the device uses a buffer
> while
> > > > > the driver notification is in flight to the device?
> > > > Hmm, I think it doesn't matter, Only the used buffer enable notific=
ation is
> > > > transmitted to device successfully, device starts to judge whether =
it's time
> > > > to send used buffer notification to driver according to its interna=
l
> interrupt
> > > policy.
> > >
> > > I don't understand what you are saying. If device has some magical
> > > interrupt policy why do we need a notification from the driver
> > > at all.
> > >
> > > Conversely, if device relies on the notification and thinks that an
> > > interrupt is not needed (because it did not get the notification yet)=
,
> > > while at the same time the driver is blocked waiting for an interrupt=
,
> > > we get a deadlock.
> > No, I'm not saying that our interrupt policy is magical?? Let me explai=
n a bit
> > more about its simple mechanism here, there're two basic parameters to
> control
> > whether device should send used buffer notification to driver:
> >   1. number of used ring entries written since last used buffer notific=
ation to
> driver,
> >     say threshold value is N.
> >   2. Max wait time to send a used buffer notification to driver.
> >
> > The work flow would look like below:
> > 1. driver enables used buffer notification initially when enabling virt=
io device
> > 2. driver is blocked waiting interrupt.
> > 3. if the number of used ring entries written by device is equal to or =
greater
> than above threshold N,
> >   a used buffered notification is sent to driver immediately, or if thi=
s
> condition is not met, but the period
> >   specified by max wait time has reached, device will still send one us=
ed
> buffer notification to driver.
> >   And device will recount number of used ring entries written by device
> from zero and start another
> >   Max wait time timer.
> > 4. driver is waken up by interrupt, after it has processed used ring en=
tries, it'll
> start to wait for interrupt
> >   again and enable used buffer notification.
> > 5. go to step 2.
> >
> > >From above work flow, I don't think the deadlock you describe would
> happen.
> >
> > Regards,
> > Xiaoguang Wang
>=20
> 1. device sends an interrupt
> 2. device writes a used entry
>=20
> Will another interrupt be sent, with driver doing nothing at all?
Unless driver enables device's used buffer notification, the device will
not send an interrupt.

Regards,
Xiaoguang Wang
>=20
>=20
>=20
> > >
> > >
> > > --
> > > MST

