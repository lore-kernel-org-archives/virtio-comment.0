Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2055.outbound.protection.outlook.com [40.107.102.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4380B2594BB
	for <virtio-comment@lists.linux.dev>; Mon, 30 Dec 2024 11:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735557674; cv=fail; b=fcTlxaN0ufJpVu8o5q+H3fxfhwQPsCDsgD/sgR3HKeOgjQK4TooOrEwu3EVJ+nP0Q7E6ahKIgwuFg0r3pVTKi44gjpJsr4VCEaa4Ygp0CkcOYX5S9SmSQ/4U9cXq35UIXdJB+DX6Gf7z3uK4pExX+BSJxfBZPnu4Eqhn5nGX6eY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735557674; c=relaxed/simple;
	bh=gdHDQj9EOVp509lkBp22qY0k1ZPavBa5AQRA9RrHv4k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RpiOOXJFjlWQBXUBJl8mLF2ziGsDBesqX1f9lc9GJ9hETzMxsbg2Raac2ZBZMivkcMaJ2fMWGltPsYUh/rr/fIumDJ2PiDrNzKXGVN8ccPdIUmzLG1Ji9mFsYMVcw9sklR3F+2Ot11MPFt7Q806aFOeC5xa8BK6rZs0mhsp+pOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YT1eTnp6; arc=fail smtp.client-ip=40.107.102.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YT1eTnp6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAKzU5IMMwECNEwUANWoGUW63rpHcYzHClYGDNZcrQrxb5b1oO1rJbauURF4a+hrQ8eh9aZTLo9uiblmOeSt3FpWglMtA9EZI58UdRAjlsKmiyAHjurcH1xcwj0YlEppm+DW+TDM985lzBu2+F7kslPp+GosPzx+vU0+DEyTkbkSzDeRSUudqGWOnsB8G7qFnxYJfFRJKSFONcaI/kwLa9GgXQ8ZiSdAwAzYOP2Ddi1ebgVWQjDYsUJItiLTLL3Jjl0trW4yndAOoMGeAUAV2KXUfq/D35yHauEZWlLot6oM8vDsQRzFB9Q3zUACRGsVq170snsKG+BO5zHWc2L3eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXv0uD3SZ9dlgTg44ybXnqa1tZtoG/ekDYieE/0kkKU=;
 b=Asv2PzqixDIdUC+Cxpx9VbGLtzVp1HVYuTGMT7K8V/MkN3inMRxlq587UVJzlIILuIqAvfFKPv/vxdKirqlCbdk1gNnSxTFnZihTPcbNXtEceHLcg1Y8kaS7RTY9a1QQyv23YPeapzzlAJgJEoiQrIJpyfdAPpoTD3ECJnwzlsu0QnceCmmPMPZMTe65oWFW/M19ye7fNkkRNrc/ZO5MjqoR15ZGj9oSHM4v/HewHJUfJ+w3lro5I/uyMd5zTzV1qUH48tAUSVhgoiTiE/4vYLKaHFu578fBjS0f44mS/CoFMzEt5LugUlrtRsdIH38BEx8XKdDdWcdOOGs46kp4Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXv0uD3SZ9dlgTg44ybXnqa1tZtoG/ekDYieE/0kkKU=;
 b=YT1eTnp6htY4Hs+fm/sdNNsB1mHA4ND/TX0k2rX114duAfvyyv9ztONmjQVDhvZ2O91o3mmQb0rcBV6py34GSppBO+nRS4jXJUcpQom1HCdIElQjRvHSaR31l9ewLlItauxg35152He89bJLSLU4In31APAC+rzfTqqNxq7/S/0VpXae0CzKeeKfmLbqFpvxa5ZfWe2fhVVVu/z+yq3RCsiQucE5aUAfyf8eB46EFwLPeDLZ1xxw7pXrS+dQ9EPLoLmXYlWebddRXbCfg3NvFshJVRY1Yjx/hteiOMC6fe3pBh5mqFLuV2viYWU/DhGb/dLbHzEmAaLWz7vuTdRANQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH7PR12MB7019.namprd12.prod.outlook.com (2603:10b6:510:1b9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 11:21:05 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 11:21:05 +0000
From: Parav Pandit <parav@nvidia.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
CC: "fupan.lfp@antgroup.com" <fupan.lfp@antgroup.com>, "mst@redhat.com"
	<mst@redhat.com>, "niuxuewei.nxw@antgroup.com" <niuxuewei.nxw@antgroup.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v5] virtio-vsock: Add support for multi devices
Thread-Topic: [PATCH v5] virtio-vsock: Add support for multi devices
Thread-Index: AQHbJeOUaqXq2o8qzUO1VqAKj4wkMLKZX2BAgD4S0gCAJ5R+wA==
Date: Mon, 30 Dec 2024 11:21:05 +0000
Message-ID:
 <CY8PR12MB71951ECD54EE431247FC1E13DC092@CY8PR12MB7195.namprd12.prod.outlook.com>
References:
 <CY8PR12MB7195365CEC62D25A06F20CA5DC482@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20241205062908.4193685-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20241205062908.4193685-1-niuxuewei.nxw@antgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH7PR12MB7019:EE_
x-ms-office365-filtering-correlation-id: 69e18740-55ea-4483-39c0-08dd28c40ce7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5EKgDwXbAVH/hIsjIShoMm6eiJ3E2wsWiqyoVqE8zBoGRd3sXI8FFi8ino1K?=
 =?us-ascii?Q?7MwuXmCYzElbjMnsxQudpp+RBUQz/FK071BS/HBaTyZat49+lcweWvpRVwI4?=
 =?us-ascii?Q?1Uk1n+yqd/cwtbc7YQ9kcXlcGX02OpwNCbG0xWN7/P2MjyHMi2ir+98an4JR?=
 =?us-ascii?Q?qaMEdXOXP05zhektawiSqtTTL2HXf81JPcIzdEWhP9lc+rUlBqL/xCBKiKeL?=
 =?us-ascii?Q?/ORaYQe6CifjyylaJXYD44GM1WcOCeImvKSWYNbIgtmZig4LX0W9SMWGn6oG?=
 =?us-ascii?Q?RVPs0ZDXhMGYkuL49m4SbyvORK6i1srSfuY6nZRQov98vWrETGEFVeyPUdAg?=
 =?us-ascii?Q?mDH49ZRBcsSJ8xufKDshbKLo1KL5gx5kNk+2BJbh+EFdxLl142I3J86NYbRG?=
 =?us-ascii?Q?cV3ZhSuDdYVdD1LEVnpnrHVBwkY34oPLDWHV49I6wmfynLa5hLwQx1MCakdh?=
 =?us-ascii?Q?O5UAFzzWyMCfLaCc/FouEKLz4VG6s6Nfk4P+lklmJUCsAzywBscmSDDkPX5Z?=
 =?us-ascii?Q?LecF9VSTplJWw1rS8Ma4IqtMznKRgtL/1OXK3Y0PiYamIK5eYw7lhwAz9ldw?=
 =?us-ascii?Q?M8s+9UJkp7MsNd3tCHM8K8L75xBHxlRdxVpbrKTOxcJgM6OJByOuHA4qZM3C?=
 =?us-ascii?Q?0cBX9kLbwxaR90Q6iFdqL7HSAMgJJoe7i8FIHuesqYMXKMicMhffp0nBc5Ih?=
 =?us-ascii?Q?5ad5HG0uHQR96fwCGtckiFzVeCbcdLOix1KR/rctHbrQ3p9VbXN2cFWMiL4l?=
 =?us-ascii?Q?VnXmhfBB+bmjIKam5avS3NdKUnO6wpwiqz5wFJatZ/dA1JwvFUSGx0GcvGvp?=
 =?us-ascii?Q?JLNfjGmgqGGJGqG4j/oTsWRV9KFG9SHxvazEx9GYL2ooFxF0KKio8/y4S6b6?=
 =?us-ascii?Q?kGKCyoLItQwgYSPE6wlQ6FgiM5A0KvZlsPaG7JaRyJYCSfTEjMnueXUX3BwF?=
 =?us-ascii?Q?C88itFRf314pMPXZH+48l03GQagDYUF7QJyX+pWP9zgpAohBdwExFkLi8cs9?=
 =?us-ascii?Q?sS2QW6+A2BL7e7Kpxeu30o4mGUzxie4sS/UE+G4XgS1YOQeMGYYj8BmwDdrM?=
 =?us-ascii?Q?S1O3tpmfoqsr21xOJc02Ngn9cxxD58Fqeg+xDSo5bhIebrh3S0bFI/dPmInE?=
 =?us-ascii?Q?WBeC80L/AluX58gKEtk3wctByRmqXqH3xP4rzHTw7mlhWTcbM/gF8jzRHaBe?=
 =?us-ascii?Q?D2hIsv5Dn2xxmC/HvEKd6mbBpG+WzttZr7uaeS1Bs8fHqbpg3de8V3exAUe2?=
 =?us-ascii?Q?ndvZLxGuSZ2g0ZhNADQt2p6OpXFn2BwRvQX15K+Z9YgU9JWnSA1M4OZn0usZ?=
 =?us-ascii?Q?KBdgPbEyTtlfpzbphjwVN4FXpxsYDdx0pfY9e5edAO9vsJGaehTCKmbPZfX2?=
 =?us-ascii?Q?tAPTYPDiWiNlE/uEngIKi9O7AUtAH2JoqCwvxCvyTDuXZRadMLSSELT0A9hU?=
 =?us-ascii?Q?luOA6erhzUJoBtgpte7fKEkCmeJ5hAyZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sr76yx12h0vnlTfTR9KJ890LHGZDAIqLltwBV0Fn3V19pqozGYJihS2CI9YZ?=
 =?us-ascii?Q?+RzMW9FthAAlZf/t4jWsxmT1teIuCFWOHMfFtP5dBlmVQcN/ym/fp4NxAt0T?=
 =?us-ascii?Q?MUbsWnuPyd4iB4S/qNkdEISzXD7D811WzSgBmB/v2rJJ86exxXklXLX5Qb+O?=
 =?us-ascii?Q?gDMeWKqoCZ8fGUhi+AuO0OV8m9GbJAdW0c/zBLg+Xvhbp6RvEXG3F/KB+i0i?=
 =?us-ascii?Q?E/jAFfNdFwJC4tgildOMWuIcyL86gAJAKf6TTQ7HcsPimwVUNacCfFAB9zKR?=
 =?us-ascii?Q?Q+PRp+8TZ+TKq//DC3dmYQAOhqs2U9DfTnkjkmqqsqspabKK6Io8VMDGYpMN?=
 =?us-ascii?Q?3RQUuFSRwoIXvT3xgrFyLLjADQzmwPrHXsHeTRBMyMFdjLSOfmKoQMYeLE/i?=
 =?us-ascii?Q?oyaMCCfarLWMeXw3h9D3aB2k0cR5zGxZUDtWMZBiB13Sl/pxl5D4N2uO6jrj?=
 =?us-ascii?Q?athodXyAgbo7g3UD9/Ad+5ZITvtGFyqpOMY3B4lkHmVkLZX8zo0XDx50cjjN?=
 =?us-ascii?Q?F8DfbkRBxyNXApIybTtmoWRqHn1G3IMiF9zM8DgntNiht2a0o+8YoQUSDzLy?=
 =?us-ascii?Q?vWHsyMfV8Dx3nDew9Kc6g0D049UVI3bftXRYojcYvWklTH5o87VaQM1WMbbb?=
 =?us-ascii?Q?M+dupxDrAL0jvc4eL2Er87Vx7JYHuqf+dzae5dkJjyFMUGS9FD9R9C+M8+Bc?=
 =?us-ascii?Q?KyqgbFd9j/SRP2q34dJQ6oD0IJ2yLXQQSRdBoYo4L5+VhwnNz3glLWUFDCkj?=
 =?us-ascii?Q?edjEZnRtaajDFjRQ69C/CLKQYFGD9syIqG7EolvGqxwtA+/gWU+WjqGak5NE?=
 =?us-ascii?Q?ZXwQED63LlekqVlFs9wOBL60bwW0WIInCcDva0GembnalBW0aMdajWDqdyCR?=
 =?us-ascii?Q?eNq3e7osyXQ2E8v4PFh3uS1Cae2xwumwBrf+ZoDWy5lk+1hpCxOLrjT36IiO?=
 =?us-ascii?Q?tIrHf/yC/DymC4B2bwOKnhvsA7dVdOuTcE9J6taUIAmSsGHN1/ryGvwpBiSH?=
 =?us-ascii?Q?U+17Dd2I346JWiaHiNmJfBswR5VCWTDjX5epOqqr8X4/wjQXwqxu88T7HgPN?=
 =?us-ascii?Q?cuzOF0Dpow0juWUGcjxDy6ZTZkv29uUQxP9bEq3uWBC/S0zcjwvz/fHcwFU/?=
 =?us-ascii?Q?fMxmliDVTFg4SmXYfGVFt/NrfW73w5MUWMuRrU/31JNxcbkuCgslZ6BtZukh?=
 =?us-ascii?Q?2XwXrh/6n1muWcH+GRGM27BBT8AusgTYQK1slheQvUGFT6SH1hHrD3ImqGBM?=
 =?us-ascii?Q?6LB5RemalZpObWzGJHCU+4LCqFEEKGNlKhgHun5QO1r65ZqRjP53StR3GThn?=
 =?us-ascii?Q?fnBf575Pk8f11pkmSqiIxwxa37OWB6VYOkIil0cKnbNcm0LZ72JPAY7070Uo?=
 =?us-ascii?Q?x22/38lzxPG1o3C0b16tZV/EaPICctS6877fqC9a4oc6D+LtQY07BJFdkSK2?=
 =?us-ascii?Q?QpjCFET9zbMOcf/2dkpML5hC8DDT2AHWiTKd7td8AdY6e3FxSLpOdycZeKk3?=
 =?us-ascii?Q?PRj5W0yhacVe2hC5dIbhD3mJaXABNNTFjXRLnm6JFcqOTbgvJjbGkv5P2DUR?=
 =?us-ascii?Q?QZoD0Oh5iEukaIPxWdo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e18740-55ea-4483-39c0-08dd28c40ce7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 11:21:05.1332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: El4BLEWvF+IHWHhPHp6Yu5G5F4r9xVqW+e1rz+0aPPNdgSxYVevXQqU6ZZfbWagpYcQCUhizXWj2yOPXJRdvNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7019


> From: Xuewei Niu <niuxuewei97@gmail.com>
> Sent: Thursday, December 5, 2024 11:59 AM
>=20
> Hi Parav,
>=20
> Sorry for the late reply. I was super busy in the past few weeks. I hope =
things
> become more regular from now on.
>=20
> > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > Sent: Thursday, October 24, 2024 12:38 PM
> > >
> > > This patch brings a new feature, called "multi devices", to the
> > > virtio vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature
> bit, and a "index"
> > > field to the config for the virtio vsock.
> > >
> > > =3D=3D Motivition =3D=3D
> > >
> > > Vsock is a lightweight and widely used data exchange mechanism
> > > between host and guest. Kata Containers, a secure container runtime,
> > > leverages the capability to exchange control data between the shim an=
d the
> kata-agent.
> > >
> > > Currently, the virtio-vsock only supports one device, resulting in
> > > the following
> > > limitations:
> > >
> > > * Poor performance isolation: All vsock connections share the same
> > > virtqueue.
> > Do you have rough estimates on how much performance is affected (or is
> poor) due to single queue?
> > I am not familiar vsock application space.
> > It is something like 10K socket msg/sec or 10 million socket msg/sec du=
e to
> single queue?
>=20
> Yes, but the data shows the performance doesn't grow much.=20
If so, please update the commit log description to not have performance as =
the motivation.
Rather performance as side gain.
Please write it as main motivation is ... TSI etc details.

> I think we can
> skip the performance part for now. Here are reasons:
>=20
> - The biggest motivition to make us support this feautre is mutli-backend=
s
>   support. In the Kata Containers cases, we'd like to use Transparent
>   Socket Impersonation (TSI) to use virtio-vsock for data plane. The
>   limitation of the single vsock device is quite clear.
Do you mean TSI functionality requires multiple vsock device as the only wa=
y forward?
I thought even one vsock device can do TSI too?
Which information is mandatory from multiple devices to do TSI?

> - This feature gives vsock device the capability to improve performance.
>   Apart from the driver side, optimizations on the VMM side are also
>   required. For example, VMM spawns an exclusive thread for each vsock
>   device. But we don't have enough time to do that.
> - Stefano said that they have a plan to add support multi-virtqueues in t=
he
>   feature to enhance the isolation of vsock devices. We are doing the sam=
e
>   thing, but with different approaches.
>=20
> > > By the way, although multi-queues can solve this problem, they do
> > > not conflict.
> > > * Cannot enable more than one backend: Virtio-vsock, vhost-vsock,
> > > and vhost-user-vsock cannot be enabled simultaneously on the transpor=
t.
> > >
> > > We'd like to transfer networking data, based on TSI (Transparent
> > > Socket
> > > Impersonation) technique, over vsock via the vhost-user protocol to
> > > reduce overhead. However, by default, the vsock device is occupied
> > > by the kata- agent, a control component for Kata Containers.
> > >
> > > =3D=3D Typical Usages =3D=3D
> > >
> > > Assuming there are two virtio-vsock devices on the guest, with CIDs
> > > 3 and 4 respectively. And the device with CID 3 is default.
> > >
> > > =3D=3D=3D=3D Guest -> Host =3D=3D=3D=3D
> > >
> > > Use the device with CID 3.
> > >
> > > ```c
> > > fd =3D socket(AF_VSOCK);
> > > bind(fd, 3, -1);
> > > connect(fd, 2, 1234);
> > > n =3D write(fd, buffer);
> > >
> > > // or use default (no bind)
> > > fd =3D socket(AF_VSOCK);
> > > connect(fd, 2, 1234);
> > > n =3D write(fd, buffer);
> > > ```
> > >
> > > Use the device with CID 4.
> > >
> > > ```c
> > > fd =3D socket(AF_VSOCK);
> > > bind(fd, 4, -1);
> > > connect(fd, 2, 1234);
> > > n =3D write(fd, buffer);
> > > ```
> > Above and below example is not using the index that you are introducing=
 in
> this patch.
> > Can you please elaborate?
>=20
> When we have many vsock devices, we need to know the position of those
> devices. The devices are arranged in a (linked) array, see below:
How does the driver know how many devices would be accessible to the driver=
?
I suppose it does not need to know it. It can just work with current number=
 of active devices. Isn't it?

In other words, say, if the first vsock device discovered, is index=3D1, ca=
n cid=3D=3D4 make progress with it?

>=20
> ```
> [0]: vsock device (cid=3D4, index=3D0) <default device>
> [1]: vsock device (cid=3D3, index=3D1)
> ```
>=20
> The index is only used for determining the device position; for data
> transmission, `bind`, `connect`, etc., the CID is used.
>=20
So why not driver maintain some linked list of devices and use one?
The relation of cid and device index is not clear if there is one.
If none, the device index is just driver internal detail, right?

> > If the binding is based on the CID, than why the new index needed?
>=20
> Think about the case of using the CID to determine the device position.=20
Do you mean CID is used to derive the device index?
If yes, if there is one to one mapping, than the device identified by the C=
ID itself can be used directly, isn't it?

> If we
> want to change the position, we have to change the CID. If the peer doesn=
't
> realize the change, the connection will be broken. So we have to decouple=
 the
> CID and the position, one for data transmission, one for device managemen=
t.
> That is why we need the index.
>=20
> ```
> =3D=3Dfrom=3D=3D
> [0]: vsock device (cid=3D4, index=3D0) <default device>
> [1]: vsock device (cid=3D3, index=3D1)
> =3D=3Dto=3D=3D
> [0]: vsock device (cid=3D3, index=3D0) <default device>
> [1]: vsock device (cid=3D4, index=3D1)
> ```
>=20
How is this mapping dynamically changed? Is this driver only decision?

> > Or the example is stale here in commit log?
>=20
> No. It's up to date.
>=20
> >
> > =3D=3D=3D=3D Host -> Guest =3D=3D=3D=3D
> >
> > The usage is no changes in this case. Send to device with CID 3.
> >
> > ```c
> > fd =3D socket(AF_VSOCK);
> > connect(fd, 3, 1234);
> > n =3D write(fd, buffer);
> > ```
> >
> > Send to device with CID 4.
> >
> > ```c
> > fd =3D socket(AF_VSOCK);
> > connect(fd, 4, 1234);
> > n =3D write(fd, buffer);
> > ```
> >
> > I've pushed a version of code for the implementation of multi devices
> > to lkml [1].
> >
> > [1]
>=20
> [..]
>=20
> > >
> > > Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> > > ---
> > >  device-types/vsock/description.tex | 46
> > > ++++++++++++++++++++++++++++--
> > >  1 file changed, 44 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/device-types/vsock/description.tex b/device-
> > > types/vsock/description.tex index 7d91d15..f2e663b 100644
> > > --- a/device-types/vsock/description.tex
> > > +++ b/device-types/vsock/description.tex
> > > @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types /
> > > Socket Device / Feature bits}  \item[VIRTIO_VSOCK_F_STREAM (0)]
> > > stream socket type is supported.
> > >  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is
> supported.
> > >  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is
> > > not implied.
> > > +\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple socket devices are
> > > supported.
> > An individual device cannot indicate what other devices are supported.
> > The question is, when multiple devices are accessible to a single drive=
r, how
> should driver choose which device to use?
> > This is the question that driver needs to solve based on certain inform=
ation.
> >
> > Therefore, the only thing needed in this patch is a feature bit to say,=
 from
> device point of view is:
> >
> > VIRTIO_VSOCK_DEV_INDEX This feature indicates that device configuration
> space has device index.
> >
> > And somehow application chooses which device to use to transport the vq
> entries.
> >
> > Right?
>=20
> `VIRTIO_VSOCK_F_MULTI_DEVICES` is to let driver know that the device
> supports multi-devices feature: read the index field from the config spac=
e,
> prepare an array to store multiple devices, deny device without the featu=
re,
> etc.
>=20
How does driver prepare the array, if it does not know the array size?
What if two PCI hardware devices are plugged in, from two different physica=
l cards and each has the duplicate index?

> IMHO, `VIRTIO_VSOCK_F_MULTI_DEVICES` is better than
> `VIRTIO_VSOCK_DEV_INDEX`.
>=20
> > >  \end{description}
> > >
> > >  \drivernormative{\subsubsection}{Feature bits}{Device Types /
> > > Socket Device / Feature bits} @@ -34,6 +35,13 @@ \subsection{Feature
> > > bits}\label{sec:Device Types / Socket Device / Feature bits}
> > > VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
> > > VIRTIO_VSOCK_F_STREAM has also been negotiated.
> > >
> > > +If a device without VIRTIO_VSOCK_F_MULTI_DEVICES has been
> > > +registered, the driver SHOULD ignore all subsequent devices.
> > > +
> > At driver level in virtio spec, there is no concept of registered.
> > It should be something like
> > If the device index is not present, the driver SHOULD pick some default
> device etc.
>=20
> "Pick some default device" is not much accurate. When this case happened,=
 it
> means multi-devices feature is disabled, then the driver should ignore al=
l
> subsequent devices.
Multiple vsock devices belong to some single group is what is needed, if th=
at definition is needed.
And just providing an index does not help for it in my view.

Is this some kind of multi-pathing?
If so, providing some common such identification is necessary between two d=
evices to indicate they are part of some group.

Please explain more I misunderstood.

>=20
> Will replace the term "register", see below:
>=20
> If a device without VIRTIO_VSOCK_F_MULTI_DEVICES has been present, the
> driver SHOULD ignore all subsequent devices.
>=20

> > > +If a device with VIRTIO_VSOCK_F_MULTI_DEVICES has been registered,
> > > +the driver SHOULD accept other devices only if they expose
> > > +VIRTIO_VSOCK_F_MULTI_DEVICES.
> > > +
> > >  \devicenormative{\subsubsection}{Feature bits}{Device Types /
> > > Socket Device / Feature bits}
> > >
> > >  The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM
> > > feature.
> > > @@ -52,6 +60,7 @@ \subsection{Device configuration
> > > layout}\label{sec:Device Types / Socket Device  \begin{lstlisting}
> > > struct virtio_vsock_config {
> > >  	le64 guest_cid;
> > > +	le16 index;
> > >  };
> > >  \end{lstlisting}
> > >
> > > @@ -77,11 +86,36 @@ \subsection{Device configuration
> > > layout}\label{sec:Device Types / Socket Device  \hline
> > > \end{tabular}
> > >
> > > +The \field{index} field indicates index of a device, and is
> > > +required for each device when VIRTIO_VSOCK_F_MULTI_DEVICES feature
> > > +has been
> > > negotiated.
> > This is not needed. A driver should be able to make choice on which dev=
ice to
> use.
>=20
> IMHO, this is necessary. It is a rule that DEVICE must provide the index =
if it
> want to enable the multi-devices feature. It's not a rule for the driver.
>=20
> BTW, making choice on which device to use by the driver is according to C=
ID.
So let driver maintain its own data structure without the device index.
Why won't it work?

> The index is only used to determine position in the driver's device list.=
 (This is
> the same as the previous explanation.)
>=20
> > > +The \field{index} is 16 bits in size, enabling support for up to
> > > +65,536 devices.
> > > +
> > Bit width is visible, just mentioning maximum device size is good enoug=
h.
>=20
> Will update in the next version.
>=20
> > > +The source socket is allowed to not be bound to any CID. It is
> > > +required for the driver to choose a CID for the socket. If
> > > +VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated, the one and only
> > > +device's CID is used. If VIRTIO_VSOCK_F_MULTI_DEVICES is
> > > +negotiated, the driver uses the default device's. In this case, the
> > > +driver selects the device with the lowest index as the default.
> > > +
> > If socket can choose the CID, why does it need new index?
> > Its confusing to see relation of CID and index here.
> > Can you please explain?
>=20
> See "When we have many vsock devices, we...".
>=20
> > > +\devicenormative{\subsubsection}{Device configuration
> > > +layout}{Device Types / Socket Device / Device configuration layout}
> > > +
> > > +When VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the device MUST
> > > offer
> > > +an \field{index}, which MUST NOT be same with the \field{index} of
> > > +other devices.
> > > +
> > > +When VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated, the device
> > > SHOULD
> > > +NOT offer an \field{index}.
> > > +
> > This should be MUST.
>=20
> Will update.
>=20
> > I don't see a need to write this.
> > In other words,
> >
> > If VIRTIO_VSOCK_F_DEV_INDEX is offered, field index is supported.
>=20
> This part gives two rules:
>=20
> - The device MUST not provide the index that has been already used.
> - If VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the device MUST offer
>   the index field (if not offered, the driver might read data outside the
>   config space, as the sizes are different).
>=20
> > >  \subsection{Device Initialization}\label{sec:Device Types / Socket
> > > Device / Device Initialization}
> > >
> > >  \begin{enumerate}
> > >  \item The guest's cid is read from \field{guest_cid}.
> > >
> > > +\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the
> > > device's
> > > +index will be read from \field{index}. If not, the device's index
> > > +will be ignored.
> > > +
> > >  \item Buffers are added to the event virtqueue to receive events
> > > from the device.
> > >
> > >  \item Buffers are added to the rx virtqueue to start receiving packe=
ts.
> > > @@ -167,6 +201,10 @@ \subsubsection{Addressing}\label{sec:Device
> > > Types / Socket Device / Device Opera  consists of a (cid, port
> > > number) tuple. The header fields used for this are  \field{src_cid},
> > > \field{src_port}, \field{dst_cid}, and \field{dst_port}.
> > >
> > > +If at least one device has negotiated VIRTIO_VSOCK_F_MULTI_DEVICES,
> > > +and the source socket is not bound to any CID, then \field{src_cid}
> > > +should be set to the default device's CID.
> > > +
> > >  Currently stream and seqpacket sockets are supported. \field{type}
> > > is 1
> > > (VIRTIO_VSOCK_TYPE_STREAM)  for stream socket types, and 2
> > > (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
> > >
> > > @@ -233,8 +271,12 @@ \subsubsection{Receive and
> > > Transmit}\label{sec:Device Types / Socket Device / De
> > >
> > >  \drivernormative{\paragraph}{Device Operation: Receive and
> > > Transmit}{Device Types / Socket Device / Device Operation / Receive
> > > and Transmit}
> > >
> > > -The \field{guest_cid} configuration field MUST be used as the
> > > source CID when -sending outgoing packets.
> > > +The \field{guest_cid} configuration field MUST be used as the
> > > +source CID when sending outgoing packets.
> > > +
> > > +When VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the source CID
> > > MUST be
> > > +one of the \field{guest_cid} configuration field of the multiple
> > > +devices handled by the driver.
> > >
> > If the guest_cid is used to distinguish between devices, why the new fi=
eld
> index is needed?
> > Can guest_cid be sufficient?
>=20
> See above "When we have many vsock devices, we..." as well. If something =
is
> not clear or incorrect, please feel free to let me know.
>=20
> > >  A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received
> > > with an unknown \field{type} value.
> > > --
> > > 2.34.1
> > >
>=20
> Thanks for your comments!
>=20
> Best Regards,
> Xuewei
