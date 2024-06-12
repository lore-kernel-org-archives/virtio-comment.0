Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D2016C878
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 11:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718191606; cv=fail; b=cGujo45+3qUjeqV1iFkiCLrLHjSLQSuy2sFKI31qgXCMDPVjxydnnb7931knP6zJGmvMhzRQRDzZtnhGzcnIs0eVbF2vLPdmagHg3J1JhHkU4yKMFMSs4siWmZyi1+AmsaqwBFcyPC15+xbSqQYSRPcxOMYrsETL8G2LRyIju8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718191606; c=relaxed/simple;
	bh=g87AiRw96g2l1A/HLvDs8KrcykNghAwqn7gLMTMrvpY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZiAVx0XB5sFEqktcdTtYNQWxs8uyiYsMObXIjY+fvuuDQn3IiALbaU2Z7Fzjm5vKWbAE679HotYgGkC/k/aC/dVB4pLcxJv97sgzSSrCYJJrr9H5rRUz1l6kgScY/MMYGtTAOBRPkUPoYp3jggzOBuXU/Krr6HGuFGymDGGO4VI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Qiqu89+l; arc=fail smtp.client-ip=40.107.243.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qiqu89+l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpEzPuK21G8oCY9eIRyx5DBWFI9AvJojAg8YOUDF8ANFT84G1knL8p7oG4wP0AOwIWoYWsmvE70eVoJWGFSrQy42a8S94I8i0VwLRPJ5o7oALOctdohotvOiaG4KTJP6j4kvimQul7zcaDgIKIBGHtF39fQ9gfxn4H/H+0aGLzmaWOvgOhTEqIZ4kNDmI14eWWP8SfmO0HxnPSYM9yeC489eUWfAJTS2b/r5GgQkI0cHL53/y+Wluil9o36/JnVYrAWiTBqTYB6kzinWq4T7hLSdnTFZJkbA+pvVLRDeYcrlfB6Oo2lQMrgMrXP7jKoY6ka0b+s6QcP/5K1y/8cAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zCzsMXv0ZxqsJVtNcrH32E7R3iqLEYQXUvg7XWkb2E=;
 b=YV/z62aiOLfQ6flE/HGWQ995rU15I9rRnRp/+0N7v+edtwFAFq//7CdGoHUFLcxNDWQqg0l96io8kLTeBo7UbwLBpRpbsVKSBFgQ8/QmU3Ul93l6Qldc6VWzJ2FssRgcENRb8ETPO5FK0DyS3NN85g47bp2plqYbAjFSCftV7bxfvmTm0xO1FG5y7+B/dMopiIPlo2grT+UC5ASHNVEgnJzOl5aamxqHXF7d+WGGeyrq+QxzL7dUUVLwMgUrnJVEJ9pRIkDXBTBqGQo1ioFnXkc/aU6GI834Z0YTmMWm9+IGVsON6VfjGkiMAfekyPK+qlON2wCbs5GBir7e70+xvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zCzsMXv0ZxqsJVtNcrH32E7R3iqLEYQXUvg7XWkb2E=;
 b=Qiqu89+lVW5nIGcY3Wjouso7QNYpcZnRa4qyLv63K2h/kHdImPQqdDuS8p1gVuSz5DttUx2621cgnWPldlTGHhgAiehglgWN/uoG+0jS4/M14+CtI94z5NaLrnfJhc6hUGafRaoyQcPwjSwqd+rFU7W/ZmeA2y0peu9AjgS6aMaEbXtk2SFAYb3KLDy/gw/rCCzKHKh/xqlnogQtE9V4kwWocLwgZ/wD2WQzrSr+ns8By1ZhMzK6HByeJMbwHf/OK05zwgrhBsyvkrBbglkggVsYJDWJeysLO9fHoJ+nARQFTJnCoc5e9QrL1VKssz/D/P07hVMiApnmk6pghpMX3Q==
Received: from DM8PR12MB5480.namprd12.prod.outlook.com (2603:10b6:8:24::17) by
 CH2PR12MB4229.namprd12.prod.outlook.com (2603:10b6:610:a5::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.20; Wed, 12 Jun 2024 11:26:40 +0000
Received: from DM8PR12MB5480.namprd12.prod.outlook.com
 ([fe80::d03:f00e:1bbb:1921]) by DM8PR12MB5480.namprd12.prod.outlook.com
 ([fe80::d03:f00e:1bbb:1921%7]) with mapi id 15.20.7677.019; Wed, 12 Jun 2024
 11:26:40 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, Cornelia Huck <cohuck@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	=?iso-8859-1?Q?Eugenio_P=E9rez?= <eperezma@redhat.com>, David Stevens
	<stevensd@chromium.org>
Subject: RE: [PATCH v5] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH v5] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHauK5veGmfTEYzl0u4eTEkaSch67HBLmKAgADZnUCAADjDgIAABE1QgAAOSoCAAAA+cIAACrUAgAAEsSCAAX7ugIAADIHggAAHPACAAA394A==
Date: Wed, 12 Jun 2024 11:26:39 +0000
Message-ID:
 <DM8PR12MB54804F81E1673C09213A4302DCC02@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20240607074246.7647-1-lingshan.zhu@amd.com>
 <87zfrskcmq.fsf@redhat.com>
 <PH0PR12MB548111206A0EEB7EE62421FADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <3319f7da-5c1f-48ff-916d-03791edf1783@amd.com>
 <PH0PR12MB548190E2CCAED2E01410F79ADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2657c74f-1caa-4e5e-b767-b16e059247ae@amd.com>
 <PH0PR12MB548198E64803B0A7D9389E9FDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2f9636c7-06ca-49ec-ac86-f8a2f1f97b4f@amd.com>
 <PH0PR12MB54813032E8F5B0DA32BA1B23DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e25f93cd-baa3-4a54-bf9c-1fc27fa95c41@amd.com>
 <PH0PR12MB54818F69437BBA6D533ABAF6DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
 <395ddde1-f8e9-4b6e-bf90-2f9c42406366@amd.com>
In-Reply-To: <395ddde1-f8e9-4b6e-bf90-2f9c42406366@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|CH2PR12MB4229:EE_
x-ms-office365-filtering-correlation-id: 2fff09fa-38b9-4bce-706d-08dc8ad2876c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|376006|1800799016|366008|38070700010;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?jszXtSdelPkbaiMYGc5C2BcJ0IAmxxeKlahyxaxhi/1LLmReKLgztMS+Va?=
 =?iso-8859-1?Q?uNODKeEplEVrTh76910GVlVb8RZtya5JA4aTRsuO9iNya3AX3fxlHxs8L0?=
 =?iso-8859-1?Q?/gYgHV9Ybchr/aeaLtDxYiIo4J+nm49i36Kq/IP0xMB6eY+JePIc42iTEP?=
 =?iso-8859-1?Q?TlWGcIwDDNFYOT5OdFBhAIOeFD/lx4DYtCsPOfx32vqtQojTmp1Mc0Ukfu?=
 =?iso-8859-1?Q?WMEBKyyp/s/mQrSA5tC5ebpFUVAba/e+fX9n+fasDXC9ARCPMg1JHY+5gI?=
 =?iso-8859-1?Q?N6sa7fvqLVhVSi0GcXblsL8H3Wfww/7EgYaRY6PDaRR82m8Vis0epJAELc?=
 =?iso-8859-1?Q?C8lFUcuCBv7+H7H06gln42PuZt0zB9a9ZJjm2x2YbMuAkDotKHMcyB7mp3?=
 =?iso-8859-1?Q?Q09ng8hMPFZ+G7w0jGzDFzMrwG+8Mce4LHRmJednc9R2XcKw2ZJJA8LTwY?=
 =?iso-8859-1?Q?vfcxYQbWWtBN1HtdRJ654COAW3glYef1IqfOuVIqsu5jRIlN5W2zkyqByV?=
 =?iso-8859-1?Q?eqPf+soAX8fQGLOyFbbcN5aNIiEu28innHtaKff5M2cwoO0GVc0TdyTube?=
 =?iso-8859-1?Q?3Piba3WFlURY97TaWym+L6efdUIFDmkOPlVZTtNakChss3qLP3HWUDKg5O?=
 =?iso-8859-1?Q?F5BUww92kSqw1mnwcIvPbG2WPo9tSitINTYAWIFFX5JQw4kS3SgdXKLvha?=
 =?iso-8859-1?Q?YpFerxRfHcTHhQlUgfq3IVviKY37CiiuVtcPELqGVXHZmsQyUxKnaOuyBx?=
 =?iso-8859-1?Q?JnNrKgw8P2T+v1HYd6VApqrcecNZmkImy2nU1x/TySgSEJlvSY22VvxFoj?=
 =?iso-8859-1?Q?psnJlxzhCKE3laAXv7zH2Jozqh5bFh/uc4FTtPv97CNNLnysjWVjfrLdr/?=
 =?iso-8859-1?Q?FDK1+j9uq0rkeh3U4E33W78vYd3JhVsl7q1vv+AqHtL4g0VoSZOBjvr45g?=
 =?iso-8859-1?Q?K2mOjESGdoeFGIupbEoiVyJRuttP/JTiWXYdkkhC6QpdF1vtnlKtXoA4Bg?=
 =?iso-8859-1?Q?RfehBm5OwRp2hYGdoc3V054b3Awp9R0K9pBsXR675KAcX+p6qs2g87VcEs?=
 =?iso-8859-1?Q?CpchOJ5XdHwXvZKsl6gC9Q+sUyCMz4mvY361jGsFwSz8ceEQ8gGldSgWnc?=
 =?iso-8859-1?Q?KG2iJ4SBs12ObxPf/Waa9k36RQyUIj4FPYlgEeTfGkIV/VJFyYi3sxRKjB?=
 =?iso-8859-1?Q?sOWxsN9fWnEY3ft12YqNGSrDZ0Lc4qsVmwNFmBKnpO9qK2v/bhz4HqESMj?=
 =?iso-8859-1?Q?QA5hC+o8mQ/aVc2JHysonD6IvJNrLFPzagWhFpJMaP53evK0SHNtHJ+TxY?=
 =?iso-8859-1?Q?PCx5dstOBz08G5nnwNr8MTbtiF2dIB3L9EhpMZNuZNZIVAsUbKmQ99yMtm?=
 =?iso-8859-1?Q?70C226fA9FoyQZtSmy9xLD16Dqe6Ub87dNAUXkBf8KFm4YzdBy/nc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(1800799016)(366008)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kMb8dzkbiTE3YEgKK4GevTVEfWycSqgNBtK/WQxFotqbDogj0VWKcjAJaM?=
 =?iso-8859-1?Q?e4dFaVNJ6dw8K9/ZQb+CsHFTK0BjDM95OX1nnZbV4zJySyOTGXIqr0IcTf?=
 =?iso-8859-1?Q?6eQctn9+hPbRczo847ecyExjoFedu4d03N+2StkDI11ed5svfbfjjihyul?=
 =?iso-8859-1?Q?giX+5CbygQCRzCxuC03iY4rc6edDwu7cF+UwQ6ubK93U8LbB2+M/yZitXI?=
 =?iso-8859-1?Q?kMBHufgvtf6CVop+yGIq+PhP/MAclLgRC62ncnMf65qedclIy0cH8k2EE2?=
 =?iso-8859-1?Q?PwqGqx0j14dP5pZslEWOtM7eSGPxHBs2Jawyvbmc13JUzJ/qprd1mIDod+?=
 =?iso-8859-1?Q?iRq1TBVqnyYSWdIfwzWVeWIxKedtrGvdSQOiKbTu1ntBUwNMVgzYE6lPvM?=
 =?iso-8859-1?Q?v4Vu2MycCw+rI2ANn/uK30mBqvJcVTkZqmH9ofW6mHI4uoBTmyuam0VNcn?=
 =?iso-8859-1?Q?Hb21XWLhOYav854kbdmZnNBXbZ0SjLQL4hi/aTV5OVGLAWkloBX7yP1h8T?=
 =?iso-8859-1?Q?PPqQHK7SxsVh4UmCJeTsqyqMCt89BYmBeqboK9tdHVdUwjn8RVpvR0kWX/?=
 =?iso-8859-1?Q?ZRyQ5Qmf3f/rxdyKpNof7aJxVfWKy0D7lcn3HNHxyUvkaenr02XQjEKrbJ?=
 =?iso-8859-1?Q?XhanY6rpF/dI63CXA/OKLK86q1fSv4YbqjqPASqjIgVf+fyaUT2JnM1U+9?=
 =?iso-8859-1?Q?mL1AtM4Qz+M9IdVGBKjTnMH0Un3K+z9Ap8OmXJuyjJ6LjwEfpWcfQaCY3i?=
 =?iso-8859-1?Q?jRczaN1JYe+HEZp54beciZvd+jwPTuvT7qIU2ADJvPVxKJ/jXv5A1jKEbu?=
 =?iso-8859-1?Q?fE+yB6kuB1MJOH83wWE5ChftoXqCGfAzNCUB+zOxOvICwXy5nzS/35K9Rd?=
 =?iso-8859-1?Q?/IbyHi9MRFWX0gC4LsRlowMePUYM9Txj6XJvsw+afaKTOvH5k9PZCI0p55?=
 =?iso-8859-1?Q?2wp6bxO/19YtsYYdgbbVMmf5TCCYyEBtneeMB3jgPCWlz3vjPqDFpeyIVi?=
 =?iso-8859-1?Q?CgJUaL5An8IHCGh5+SiUSVIkuNMozE/5tswT1iDMO3q0DcKADY8dkH7ob1?=
 =?iso-8859-1?Q?14Sg/f3nwAdsWENtYcpP6zRzZdWkxpbX4e8lSHN3ILCD/fhvX3VehEF9K+?=
 =?iso-8859-1?Q?5yjpqegkOl0p4ixKybZm9vl3q6sVKGILZSMdYgzvrAwhtxN2+LHMN2XGkJ?=
 =?iso-8859-1?Q?xntXeFehAbL04lExQuQLiujRsEO7fNF4xDmnvioV0I07+oBJoq1KKJUYbb?=
 =?iso-8859-1?Q?bKYaJmkQwzkg4Y720M+SI33JDb9KJg8Y7b2D5jL3FbV/FZ/6TXz+6niiQY?=
 =?iso-8859-1?Q?7dX9kDFs3TD4sx0nsGR4Yr9MH8Kh5Clx+qqJ+o/7wCoGetNf5ZJlPJ0Fwu?=
 =?iso-8859-1?Q?aX+26hTLMk6r5Q2a0mhWaAy7LJ3B+fmmcf0N33P2DHgt83c5q8AT3C1b0v?=
 =?iso-8859-1?Q?mryGdwqmPpx/iP8xlZUxLAK841QdT3mKwjxkRekLk74j/QBmYMaRqnPuLn?=
 =?iso-8859-1?Q?yWm7N0P0pqDCfWq6hQmSMetlnnnz7lb2RU0I4qjYB8ugbm8kFJwWQyAXsJ?=
 =?iso-8859-1?Q?ChSR5WRnxZg3Yljw2ZpVcEYGkd87qYLwH+21rk+BHhrI+3vHCPTNzNopIt?=
 =?iso-8859-1?Q?lW+XcmXswJ1KI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fff09fa-38b9-4bce-706d-08dc8ad2876c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 11:26:39.9391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AmgQ3nRA05no+264klQcgUSj/suDi8ip1O2tM8oDfoJLa8eYWuq5qjJ79QAh9ysMG3W1y5orrMIbzD/E5tCF9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4229


> From: Zhu Lingshan <lingshan.zhu@amd.com>
> Sent: Wednesday, June 12, 2024 4:00 PM
>=20
> On 6/12/2024 6:07 PM, Parav Pandit wrote:
> >> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >> Sent: Wednesday, June 12, 2024 2:50 PM
> >>
> >> On 6/11/2024 6:37 PM, Parav Pandit wrote:
> >>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>> Sent: Tuesday, June 11, 2024 3:42 PM
> >>>>
> >>>> On 6/11/2024 5:43 PM, Parav Pandit wrote:
> >>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>>>> Sent: Tuesday, June 11, 2024 3:03 PM
> >>>>>>
> >>>>>> On 6/11/2024 4:48 PM, Parav Pandit wrote:
> >>>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>>>>>> Sent: Tuesday, June 11, 2024 1:57 PM
> >>>>>>>>
> >>>>>>>> On 6/11/2024 1:17 PM, Parav Pandit wrote:
> >>>>>>>>> Hi Lingshan, David,
> >>>>>>>>>
> >>>>>>>>>> From: Cornelia Huck <cohuck@redhat.com>
> >>>>>>>>>> Sent: Monday, June 10, 2024 9:34 PM
> >>>>>>>>>>
> >>>>>>>>>> On Fri, Jun 07 2024, Zhu Lingshan <lingshan.zhu@amd.com>
> wrote:
> >>>>>>>>>>
> >>>>>>>>>>> This commit allows the driver to suspend the device by
> >>>>>>>>>>> introducing a new status bit SUSPEND in device_status.
> >>>>>>>>>>>
> >>>>>>>>>>> This commit also introduce a new feature bit
> >>>>>>>>>>> VIRTIO_F_SUSPEND which indicating whether the device support
> SUSPEND.
> >>>>>>>>>>>
> >>>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> >>>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>>>>>>>>> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> >>>>>>>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
> >>>>>>>>>>> ---
> >>>>>>>>>>>  content.tex | 69
> >>>>>>>>>>> +++++++++++++++++++++++++++++++++++++++++++++------
> --
> >>>>>>>>>>>  1 file changed, 59 insertions(+), 10 deletions(-)
> >>>>>>>>>> Can you please add a changelog? Especially as some of the
> >>>>>>>>>> previous discussion has been lost due to the broken old
> >>>>>>>>>> mailing
> >> lists...
> >>>>>>>>>> (...)
> >>>>>>>>>>
> >>>>>>>>>>> +\drivernormative{\subsection}{Device Suspend}{General
> >>>>>>>>>>> +Initialization And Device Operation / Device Suspend}
> >>>>>>>>>>> +
> >>>>>>>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set
> >>>>>>>>>>> +or
> >>>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
> >>>>>>>>>>> +
> >>>>>>>>>>> +Once the driver sets SUSPEND to \field{device status} of
> >>>>>>>>>>> +the
> >> device:
> >>>>>>>>>>> +\begin{itemize}
> >>>>>>>>>>> +\item The driver MUST re-read \field{device status} to
> >>>>>>>>>>> +verify whether the
> >>>>>>>>>> SUSPEND bit is set.
> >>>>>>>>>>> +If not, the device does not support the SUSPEND feature.
> >>>>>>>>>> That sentence is a bit weird: I'd expect the device to not
> >>>>>>>>>> offer VIRTIO_F_SUSPEND in the first place in that case...
> >>>>>>>>>> could this rather happen if the device is not able to handle
> >>>>>>>>>> the request at a specific point in
> >>>>>>>> time?
> >>>>>>>>>>> +\item The driver MUST NOT make any more buffers available
> >>>>>>>>>>> +to the
> >>>>>>>> device.
> >>>>>>>>>>> +\item The driver MUST NOT access any fields of any
> >>>>>>>>>>> +virtqueues or notify
> >>>>>>>>>> any virtqueues.
> >>>>>>>>>>
> >>>>>>>>>> "send notifications for any virtqueues"?
> >>>>>>>>>>
> >>>>>>>>>>> +\item The driver MUST NOT access Device Configuration Space.
> >>>>>>>>>> ...except for the status field, if it is part of the config sp=
ace?
> >>>>>>>>>>
> >>>>>>>>>>> +\end{itemize}
> >>>>>>>>>>> +
> >>>>>>>>>>> +\devicenormative{\subsection}{Device Suspend}{General
> >>>>>>>>>>> +Initialization And Device Operation / Device Suspend}
> >>>>>>>>>>> +
> >>>>>>>>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
> >>>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
> >>>>>>>>>>> +
> >>>>>>>>>>> +The device MUST ignore all access to its Configuration
> >>>>>>>>>>> +Space while suspended, except for \field{device status}.
> >>>>>>>>>> ...if it is part of the configuration space.
> >>>>>>>>>>
> >>>>>>>>>>> +
> >>>>>>>>>>> +A device MUST NOT send any notifications, access any
> >>>>>>>>>>> +virtqueues, or modify any fields in its configuration space
> >>>>>>>>>>> +while
> >>>> suspended.
> >>>>>>>>>>> +
> >>>>>>>>>>> +If SUSPEND is set in \field{device status}, when the driver
> >>>>>>>>>>> +clears SUSPEND,
> >>>>>>>>>> "subsequently clears SUSPEND"?
> >>>>>>>>>>
> >>>>>>>>>>> +the device MUST either resume normal operation or set
> >>>>>>>>>> DEVICE_NEEDS_RESET.
> >>>>>>>>>>> +
> >>>>>>>>>>> +When the driver sets SUSPEND, the device SHOULD perform the
> >>>>>>>>>>> +following actions before presenting
> >>>>>>>>>> SUSPEND bit in the \field{device status}:
> >>>>>>>>>>> +
> >>>>>>>>>>> +\begin{itemize}
> >>>>>>>>>>> +\item Stop processing more buffers of any virtqueues \item
> >>>>>>>>>>> +Wait until all buffers that are being processed have been us=
ed.
> >>>>>>>>>>> +\item Send used buffer notifications to the driver.
> >>>>>>>>>>> +\end{itemize}
> >>>>>>>>>> So, is there any opportunity for the device to fail setting
> SUSPEND?
> >>>>>>>>>> I mean, if the driver is supposed to look whether it sticks,
> >>>>>>>>>> there should be conditions for when the device might clear it
> again...
> >>>>>>>>>>
> >>>>>>>>> Additionally, a suspend operation usually involves saving
> >>>>>>>>> things to a slow
> >>>>>>>> memory (or media).
> >>>>>>>>> This is because the device implementation wouldn't know when
> >>>>>>>>> exactly the
> >>>>>>>> device will be resumed.
> >>>>>>>>> Few examples, are:
> >>>>>>>>> a. A gpu device with 128MB of video RAM when suspended,
> QEMU
> >>>> needs
> >>>>>>>> to store this into a (for example) rotating hard disk as 1msec I=
O
> latency.
> >>>>>>>>> b. a NIC may need to store its RSS, queues, flow filters
> >>>>>>>>> configuration for
> >>>>>>>> several tens of KBs to some slow memory.
> >>>>>>>>> c. A block device may prefer to complete some IOs to a
> >>>>>>>>> threshold level
> >>>>>>>> instead of maintaining large list of outstanding IOs in some
> >>>>>>>> suspended memory.
> >>>>>>>>> d. May be more in future.
> >>>>>>>>>
> >>>>>>>>> Additionally, suspend operation needs to be synchronized with
> >>>>>>>>> certain data
> >>>>>>>> path hardware engines to suspend DMA operations (read and write
> >>>>>>>> both) which are inflight.
> >>>>>>>>> (without causing DMA errors). Same would apply to the sw
> >>>>>>>>> backend
> >>>>>>>> implementations too.
> >>>>>>>>> Therefore, the suspend operation that is initiated by the
> >>>>>>>>> driver, should get
> >>>>>>>> the acknowledgement back from the device that it has been
> suspend.
> >>>>>>>>> Some of the good examples if you prefer to follow, a
> >>>>>>>>> driver<->device
> >>>>>>>> interface needs a suspend register which should behave like
> >>>>>>>> below queue reset register.
> >>>>>>>>> Spec snippet:
> >>>>>>>>> "The device MUST reset the queue when 1 is written to
> queue_reset.
> >>>>>>>>> The device MUST continue to present
> >>>>>>>>> 1 in queue_reset as long as the queue reset is ongoing. The
> >>>>>>>>> device MUST present 0 in both queue_reset and queue_enable
> >>>>>>>>> when queue reset
> >>>>>>>> has completed."
> >>>>>>>>> At minimum, we need, something implementable like,
> >>>>>>>>>
> >>>>>>>>> The device MUST suspend the device when 1 is written to the
> >>>>>>>> device_suspend_ctlr. The device MUST continue to present 1 in
> >>>>>>>> device_suspend_ctrl as the suspend operation is ongoing in the
> device.
> >>>>>>>>> The device MUST present 0 in the device_suspend_ctlr register
> >>>>>>>>> when
> >>>>>>>> device has completely suspended the device.
> >>>>>>>>> The device MUST resume the device when 2 is written to the
> >>>>>>>> device_suspend_ctrl. The device MUST continue to present 2 in
> >>>>>>>> the device_suspend_ctrl as the resume operation may not have
> >>>>>>>> yet
> >>>> completed.
> >>>>>>>>> The device MUST present 0 in the device_suspend_ctrl register
> >>>>>>>>> when the
> >>>>>>>> device has completely resumed the device.
> >>>>>>>>> At this point, the driver may resume notifying the device and
> >>>>>>>>> accessing the
> >>>>>>>> configuration space.
> >>>>>>>>> Can you please enhance this part?
> >>>>>>>> Hi Parav
> >>>>>>>>
> >>>>>>>> Yes they are necessary contents and we will address them in the
> >>>>>>>> following patches.
> >>>>>>>>
> >>>>>>> The register polarity is critical.
> >>>>>>> In your reply to Cornelia, you descried that suspend bit cleared
> >>>>>>> in the device
> >>>>>> after driver sets it (until the device is suspended).
> >>>>>>> This is ambiguous behavior of the register. Queue_reset register
> >>>>>>> was like that
> >>>>>> before it was fixed in 1.2.
> >>>>>> once suspended, the driver should not access the configuration
> >>>>>> space except for the device status, so it should not reset any
> >>>>>> vqs through configuration space.
> >>>>> I am not talking about VQ reset at all.
> >>>>> I gave an example of how the VQ reset register polarity works
> >>>>> (with was
> >>>> broken like how the proposed suspend bit is broken).
> >>>>> Suspend register needs to work the way the reset register works.
> >>>>> Can you please go through my exact text I replied in the previous e=
mail?
> >>>>>
> >>>>> Basically, the bug is:
> >>>>> When driver has initiated the suspend (writing 1), the device
> >>>>> continue to
> >>>> respond 0, while suspend is going on.
> >>>>> At this point, just by looking at the device_status register one
> >>>>> cannot figure
> >>>> out what is going on in the device.
> >>>>> Is driver initiated suspend is ongoing, or it was never started.
> >>>>> It is ambiguous.
> >>>> From the device perspective, there is only one user: the driver,
> >>>> and the driver sets or clears SUSPEND, it knows the status of the de=
vice.
> >>> It does not work elegantly when the hypervisor or other system is
> >>> looking
> >> dealing with this register.
> >>> In current proposal, anyone else than the driver looking at the
> >>> device_status,
> >> it is ambiguous.
> >>> For example,
> >>> suspend_bit: 0x1 suspended.
> >>> 	     0x0 not suspended or suspend is ongoing. (ambiguous for
> >>> hypervisor debugging this device)
> >>>
> >>> For device migration, it requires yet another side bit in the device =
parts.
> >>>
> >>> An elegant and non-ambiguous interface can be,
> >>>
> >>> ctrl_register =3D	0x0 (a usual default)
> >>> 		0x1, suspend the device
> >>> 		0x2, resume the device.
> >>> status_register =3D	0x0, (still) running.
> >>> 			0x1, suspended.
> >>>
> >>> With this driver and hypervisor (both) has very clear view of what
> >>> is going on
> >> and what is the status.
> >>> No more ambiguity for anyone.
> >>>
> >>> Please consider pros and cons of both approaches.
> >> The driver "owns" the device, other components access the device
> >> configurations through the driver, I am not sure there are other
> >> "owners" than the driver.
> > Device migration and debug channel [1] plans to access the device from =
the
> hypervisor.
> > I don't see any disadvantage of separate control and status register.
> > Do you see any?
> >
> > [1]
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore
> > .kernel.org%2Fvirtio-comment%2F20240601145042.2074739-1-
> parav%40nvidia
> >
> .com%2FT%2F%23m14b80fd996e8d2522723967d8af844b70e131a90&dat
> a=3D05%7C02%7
> >
> Cparav%40nvidia.com%7C06c09157b2d74af8b7f608dc8acaab0a%7C43083
> d1572734
> >
> 0c1b7db39efd9ccc17a%7C0%7C0%7C638537850271999791%7CUnknown
> %7CTWFpbGZsb
> >
> 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn
> 0%3D%
> >
> 7C0%7C%7C%7C&sdata=3De%2BBDJMpuFzmj47CKqnWU1jXcRZUXATmqhhMZ
> 7WC8zj8%3D&re
> > served=3D0
> is the admin vq governed by the driver? There should be only one owner of
> the device, or you need locks.
>=20
No locks are needed. Hypervisor is accessing the admin vq on the PF.
VF is accessing the suspend ctrl and status register of its own from its ow=
n MMIO space.
If for some reason, this registers is trapped and accessed in the hyperviso=
r too, it is upto the hypervisor on lock/no-lock etc.

> I am not sure we want to repeat the discussion on the admin vq for live
> migration last year, you know it breaks nested.
I am showing you the use case where ctrl+status is useful without any negat=
ives.
You are diverging the discussion to a point of no return.
I wish you can be more cooperative by seeing larger picture. :)

You didn't answer my question, do you see any disadvantage of ctrl+status r=
egister?
If not, lets converge and progress as it enables suspend functionality + de=
vice migration both using non-ambiguous register pair.
