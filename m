Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CA0165F1A
	for <virtio-comment@lists.linux.dev>; Tue,  4 Mar 2025 03:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741060117; cv=fail; b=HCWzflHcbSgvUQScBiye03KD8oRfb5VoMnrVVR92H0DyVNEeFruC3vszQKmMmC77+aQP7lOIBwDsf6igXzersR4T9GRg3i/NOtXm+WfY2k5DRm3tTvnETo6IfEjgvOB33bqtZZsxW7nBTrat45LGmTFcALD/VYu2DHenhQnFe+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741060117; c=relaxed/simple;
	bh=vwHuRHI9a6xQkE3N1XFwZ6GamjPkEMyiw+zxzcFVWAI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kYWu/8qEIjDCM1zW/6rBxHLSJeBc7ea24YpnBANLuE5PCVCkssM39O21xtwAZSPRKOSJoAMGcaGfVDTUQcht4+B85XKuQ2nLmEGlYVqJWk1yXP2+2ieDfMUvtaz62GaGOX4RrY7aN6QMWGb+GAuFcEIWFUX2H0Zmgr7tAc7mDiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zcrf0nV3; arc=fail smtp.client-ip=40.107.236.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zcrf0nV3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSxVTa4JWwKAMLXFF22rh6QkBORX07PS5b90MAgRWh3jzMUcpfGriwm2vKiWzOuEsUIXyQnXQK8ctJgBchfq0dvYpoUw3lpKjLCWyZR/6/y8fd19imCwE6BnUWXHQ9fM4Z13xFeq2y5KlpLOCWY7eJXjg68uaIC0UL16DiEsPpP+UAFkEz5yjt8miwtfHpXy66wX0WjTbeFjJ+YLT97a6iw2lcWMEjFaxPaHEtRVW0OVhiyk7ES1T8EH2MKBgsJ0yl6kuHmC5SUbBp8iwTpwzfBCpLE37Dnrqz/lmMtORg0Pnk1Bh/Cju/4w+u796BN9CkZSvkdYHO0Jm7a06eCa1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwHuRHI9a6xQkE3N1XFwZ6GamjPkEMyiw+zxzcFVWAI=;
 b=s1qlupD1HHLsPGIRODL6L1z4lgYmNGI/faTOdA8bqq/dFUW3/6ACLn+fjeC5yA2+XyzSQuY2/s9Zzct7WKTEE12sMq3VHLLUiLy/Jj/ziVV4j0/xMzc+j475lpdCENMZqlq4h2ZjcrUiAYvYhRnk05Zaaz6fL2TUtbyZahs059qzN9w04Xg2DqbTyIUcSgGk8m1/2q2wurSHDO5LWX6PsovCjLO5TekedeqMKjG15TZwblil9SZqIH8C/GsqC8iGHm5QoCG9ZWxeh9Y0BmtcAwT2Fm89BM4p42Efb8Lt/1LZvN7DmU+3n9SYAAvGhn5Gi0+is8olfZ19ylXEH1ZIKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwHuRHI9a6xQkE3N1XFwZ6GamjPkEMyiw+zxzcFVWAI=;
 b=Zcrf0nV3iTXfHimlM+RusJD1LHzyvBmLX4cV2ZqhHB/RwubECd6zgZF3wegpI/nBnuzMArILH2WTRC5Iij/iOe1v4ySXHiiaVEHIvkpd2r5JQf9YQ6SCYMeO88ohFEShCUZ/RiScCe5+djzQa0VZrnu2AuI1WL22ttxdsdaw/NEgsArLD6iZGkcfyGL0kR/kpljLA5Ks8N89rJiZOtKqkSWrY9QoI4wu24hu6Ulf/JQTu/yF2hhmL8BQdlvlUna3AVsVRUFR54u+mtR0s+abC0g1Z5Sp9TkuBUZpsZJHNoGyZV8xiMHAaALcxW95p4DT49ypbjuU1H+1cW7BxoLDrQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH8PR12MB6987.namprd12.prod.outlook.com (2603:10b6:510:1be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 03:48:30 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8489.021; Tue, 4 Mar 2025
 03:48:30 +0000
From: Parav Pandit <parav@nvidia.com>
To: David Wei <dw@davidwei.uk>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Dan Jurgens <danielj@nvidia.com>
Subject: RE: [PATCH v11 00/13] flow filter using basic facilities of
 capability and resource objects
Thread-Topic: [PATCH v11 00/13] flow filter using basic facilities of
 capability and resource objects
Thread-Index: AQHatoNAEJG4OsFrLEu4SXIm11kFB7NjcsAAgACQCMA=
Date: Tue, 4 Mar 2025 03:48:30 +0000
Message-ID:
 <CY8PR12MB719577C0BB1E8BA7D89F0DBFDCC82@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20240604132903.2093195-1-parav@nvidia.com>
 <691016c0-b8e4-48f0-a26b-45296102f501@davidwei.uk>
In-Reply-To: <691016c0-b8e4-48f0-a26b-45296102f501@davidwei.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH8PR12MB6987:EE_
x-ms-office365-filtering-correlation-id: 8ed1a859-769f-4a26-a37a-08dd5acf6e08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SYJ89EUvm1jhoUQmgjOidenJSmYYBXNlkSe62ZZdTiXwVI+WQOzPMvF6R3Un?=
 =?us-ascii?Q?9jCIuW4xeYmnGZXXIsZ8UOfTfp25nTTAWYKUkw+ygP+Cy+ynfIE95+wNgEBT?=
 =?us-ascii?Q?C4p3D572zwlQN1tVxKKNtKiHJ8/JLSxwo9b4dVVOccybSDAaTMSWMGQv/8Km?=
 =?us-ascii?Q?dPvEHQ9VMLoREH0CvlLT7vy2P+PkN94rCiJ85idfKnfdy87sHGTkqskiX6ro?=
 =?us-ascii?Q?hYQ15gwGVm94PawIOyGCQfQNeEKPs7TP0x2UBmo/UhibpKTi3+cadFZzcYcH?=
 =?us-ascii?Q?xCfaIGeYzCT6TRK6xBJ4aqCWT1MkC03/bTJ8ROveqtarOtSXxrznp3I3U5EM?=
 =?us-ascii?Q?+BLmGppgLyOT/i+Dk2H02rN8Qc/KrySqQqgec0baEbrj3nJLtr0j5EIuoQG7?=
 =?us-ascii?Q?vlWYNuNicgoiuQaZMjjxJ645K7jPtwYGZTxwj/Vp/IsrWUv/cJDPLLghH6NB?=
 =?us-ascii?Q?G10V88ZASD8j2GZKNqGV64E4MJj2DUE4GPHRBG2OUaxWa8OCja9eZZUefdYT?=
 =?us-ascii?Q?Iq7v7VZUe7HZEr6B+BHusEA9/sLSwtUhue5tH+aG7Gxxog1uyypfawUkGEEP?=
 =?us-ascii?Q?v21CD6SfrlJm5NbTqTgGBXY3WM9FcuLwbyqLqJGx6I4QCq0zBMPPGvsRv9f2?=
 =?us-ascii?Q?5yag+ZMl9av83xnCr4neluMj5bIb4i762eS9QFVxO58rcH4qz00i1t16TW1C?=
 =?us-ascii?Q?T+6GuWTG3Y/VCYLGFAAheicqOZILSkRR8Rbkh6vpgSYvMhzeuXiFvy9v9EZQ?=
 =?us-ascii?Q?Aw4FMET61BQHEqCEpt+jNSZuBlvQfH8dVso83qiLlfJuGAPqkd0I9gPnPr2j?=
 =?us-ascii?Q?ogsavsHrf8Q6q+6WciMxMEAQX5rZX7+zFPo2wy0yaOpp6MitiSjTGGE9M6Lk?=
 =?us-ascii?Q?K84ca7Lg4tJEI+LTL1p4jXNSn36iIy75U8UT8VZPVtI53Pkpg+dnjrXyZDBw?=
 =?us-ascii?Q?ljB61kV9KiizuGLPLan955sMQ8L2YU3q36A4aiwLxOayWS7HcbKDOKfGFKNO?=
 =?us-ascii?Q?32bxA1VfO0I2vA7BPMX6hHIl38xGft/MTE8CI9U1H1VruZRiu9gT8kyy7sC+?=
 =?us-ascii?Q?wSrtYKtQ1iP3L5wJxsiBxLcPSCB0S27Vjs6irQ7FGGzRRGq4ROv7R5x25Oqc?=
 =?us-ascii?Q?TQjyQru1kItkAB+ZD7iZWoE6z88EPjhN6W20UPLtwOR/FiQbC6cReGnxtjQh?=
 =?us-ascii?Q?dYyF3S3raPqIFCMHUq0EYIGfUgyAN66twU00+0sSdeLcBaTlH2InuMjZQo30?=
 =?us-ascii?Q?eMmvt3XnxyNEb1E7B83VMa4ND4DPlpOOP7vehPrec6ipCv5LfPvo6YBCQEbc?=
 =?us-ascii?Q?x3m03OcipcPgnYnEJxvkwhKbNrSF8ksD6RYI78aywVbOUGVhxfT7NXl4qmKo?=
 =?us-ascii?Q?SlntKFozB7YInkz0SGHcdUUC+On3XYSpSdFdUMdFC2roQX2u2TfHmw9iFEG+?=
 =?us-ascii?Q?J9un+3ikipaWomZd71VtgDzCpT8bXzi4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dzJ4BldwPPiIYoKdgi9NLH1AWHLs42l5MLT/bktW0iqPnuDoaniUSBJNdtIf?=
 =?us-ascii?Q?qYI79TAxfOiaAC1uK1uqbhI7isIcbD7J5j8G5FAlJukQg65Qh4WRgEBzV4T+?=
 =?us-ascii?Q?l0lleLe8IBzXOheElr7/WMOP61nlt0eOEaqW4Pzeld99dp1hrMWd+UxF26NT?=
 =?us-ascii?Q?Xut/VEsdvrDQYLRQ9I3I13xq9EDRIQGueXQW6JPIA2Htne37yMtGJzjJDdl5?=
 =?us-ascii?Q?ENDNTFeV6l7eT/uki2bFbmnYjedqmZiHrIT+Fj6+8zts+5mf/Qd3PzugvJy1?=
 =?us-ascii?Q?ubulgxSNYwy+wzsxGQwWkvkn7fCN3DOcKrTtaSY/M0OGDmO0D8yJcW/b+/uc?=
 =?us-ascii?Q?19OCJw5S/afdt/1nzImVcb8ZB32cngQhnh6Rwa7ngMEtB2ltMJYPsIV9Qm7g?=
 =?us-ascii?Q?zt4YIzXbDhr31P17j60xSdsKwcCYFz3tYwBksLyxvbACKrBZLyH9yFCeRdXK?=
 =?us-ascii?Q?Ov100ecMeNtCbJNxhtMhZwY/WajFGLJ7hAqJKXgtD2HqyjBqQMGBD6LXjTx4?=
 =?us-ascii?Q?Zrf2ZlSwpXQ7R0T0aM7Vwpi5G714fg4Yum5fgbOE2+Y3hr0OkFV4KF0n0p9q?=
 =?us-ascii?Q?/iPzatp89FNcsWWo3RGThmOS/gME5AzQOb9nAIyTQS+ey7fXaza8wZTnuUZN?=
 =?us-ascii?Q?h/TJdtExZbsnd22EFVaL4g9TwicpnCIkMVZ+bp9Vtxi99xH/J1I6uEado+w+?=
 =?us-ascii?Q?GvxTUHdoDh9p+FTwt7ZKf7WWpjH+34rlDSuccZliWG/+kwVF4E5kGym3ELum?=
 =?us-ascii?Q?0ncWP/IEmxdLqPKpiK8XxY/umtkyFSj9aZDu9w370HAGMsiq68RWs0DqadCY?=
 =?us-ascii?Q?KitwEWA6BmdOnEhjmX2QX4G4ot++B5VIjtmlomXtO8mD2hFn0kMFqaDAGvpT?=
 =?us-ascii?Q?4NxqH79EFdfIbHJvnpDexBcJvr2OVmZ3sVSPPxVcPUATmPC634c+8jaGoRqV?=
 =?us-ascii?Q?vHOAtvZReqmHH2shjtFfEkMCzzw1kO6JxIkBPSDDD0hs39vaxxPDi5wmzQeQ?=
 =?us-ascii?Q?ok2UhhtyWlx80swONVhwVJFIu+b//z52O+MsuwGqr24xmckuV9PEJ6R8MqPn?=
 =?us-ascii?Q?WvaBXxHJ0kM6FLn8QeiHVL7PWr3/xzXiUDV/7vGSuCvff8ulKIPZibDbGxuc?=
 =?us-ascii?Q?vRiLZnnbKkFTdq3WqzTkrJx29Zg2CaDX7Gy3b752R3RMu7d1drdFOq4SVNvh?=
 =?us-ascii?Q?TBV71Jl6/ljBEmY9QcVFreLLrvvK67wKnTEnYWVvZ/zGG2mAd2oltrmvl0E1?=
 =?us-ascii?Q?XqneAYSUNFIS0kETyUQenP78hvc1NVrRxzffXvOEDeklVyVbKTKSO8NMH//6?=
 =?us-ascii?Q?f0Mk6OFq8Xnv6+PWB3jsFqirgc7G4V/fPoPW4JyIb6wczxIt41ew4z0gE1tT?=
 =?us-ascii?Q?gHuKDqx4sKDE6EhT6sWf2YHt1Qz/lxes6xvLKDgf4luE1ZTvIOeq0XLEZVAZ?=
 =?us-ascii?Q?4znmBoGIG0Gp/R4uT2yluv8AukxVqtR8YlOmqZF4ImLURZV1S2dCsYn4oej5?=
 =?us-ascii?Q?9pU6cBYir6H/KGhIFT3wwnWkRRuiIVTnPYyVOfLcHqolom9efOnJMRzsmqyN?=
 =?us-ascii?Q?0jdBWaP9BWmGAZuw5xs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed1a859-769f-4a26-a37a-08dd5acf6e08
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 03:48:30.6965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9jZvMdNKEpBz2fSzVwHVltQT3vL3V2oWSAybfweroBlb7h0w23h4TdpEZ6vtV4TjGAXs1cjnUTS362w2XhRYoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6987

Hi David,

> From: David Wei <dw@davidwei.uk>
> Sent: Tuesday, March 4, 2025 12:40 AM
>=20
> On 2024-06-04 06:28, Parav Pandit wrote:
> > Summary:
> > =3D=3D=3D=3D=3D=3D=3D=3D
> > This series improves virtio net receive packet steering to direct
> > packets to a specific RQ.
> >
> > This basic functionality will enable Linux ethtool steering, and
> > accelerated receive flow steering (ARFS) as a starting point, and more
> > use cases in future.
> >
> > It is using new virtio basic facilities of capability and resource
> > objects described later in this cover letter.
> >
> > Those interested only in the capability and resource object facilities
> > can jump in the cover leter to "Overview of capability and resource obj=
ects".
> >
>=20
> Hi folks, what is the state of this virtio spec update adding flow steeri=
ng?
>=20
> I added io_uring zero copy receive which got merged recently. This featur=
e
> requires hardware flow steering and RSS contexts to work. I'm targeting b=
nxt
> and mlx5 for real hardware support but would also like to add it to virti=
o. This
> will be useful for VMs as well as testing w/o needing real hardware.
>
This will be very useful.
=20
> I checked
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu
> b.com%2Foasis-tcs%2Fvirtio-
> spec&data=3D05%7C02%7Cparav%40nvidia.com%7Cddb23076787347ae48940
> 8dd5a8707e9%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6387
> 66258240661610%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd
> WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D
> %3D%7C0%7C%7C%7C&sdata=3D%2Fuqc2fDBoKTCwyo%2BHfri4q4Ep2cR1gVbr
> NUdu%2BvI1so%3D&reserved=3D0 but don't see the patches committed.
>=20
It is merged to v 1.4 branch at [1]
[1] https://github.com/oasis-tcs/virtio-spec/tree/virtio-1.4

We are presently internally reviewing the vnet driver series to enable flow=
 steering to RQ using this infrastructure discussed here.
Expect Daniel Jurgens to post it in few weeks.
Added him to cc.
