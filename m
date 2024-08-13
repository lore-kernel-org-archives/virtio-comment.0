Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2084.outbound.protection.outlook.com [40.107.212.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AE058ABF
	for <virtio-comment@lists.linux.dev>; Tue, 13 Aug 2024 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723535920; cv=fail; b=r19cXWwEt5C3X/togbw2z/Hcw0xHncOgpretlvUP20VuMpA6LlsEjSNwUVDIdWdzy1JZdErCu6hFTELBuG1QLz/ayhH9vXO4PodEbAnmuU9y3RDPwq5B0zA9KSSbcZcqgFnPIUGw+qvfx+X5F4BCM3SqNvtaM9vdF3Yk2ddIkWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723535920; c=relaxed/simple;
	bh=pBrbkZJDuJVa5CUmTKU409VPT7cejpKepFaiWYrE+Jo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JDXFqxs/P7JqY4BL6RKE46TqWYdSpQv/plarRsGtah5aCZYBbwjzv82vM4AN1yyyuD0WE4NtnJhkODQP8tXNQRf3Q+sRiDa6fN5UON6Ku8WAbVXc2Z/YiGGIcvOrw8hlWO9U07TbplUlDQ9yByCjc7mimQ1VwWozfl/x3njn2KM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uAiWhMqF; arc=fail smtp.client-ip=40.107.212.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uAiWhMqF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1rIo60ScsUoH1LoM/f4q1zZTFzyF+5K2z8oUUcWcs5MtIkrosl+AIDTN7Om6lN8a/iQL12kqUi5TkCe0a4ddbfBVW0cdiBKM+n+JgroVOy1o//EyWSARwN0ThJwVcrFFVnH1lf1B09IYe3Z1knUxWw4+GFJsmXOm2k2CMg9kjAaGLpuYJgZEnmnJLzaSs05lX4NKBICXaUioBW2+ykepusH2hWDqhmHSIdpF4YjhgYN2QVfkYFrqX+3PCYR/PRlKdeIxi+QWme5p37deRmzMBYxUBIW3P9pnAHex0qI0Y0LY2cPID/dJoK/lnsBTSFm4DwlsGWWso7V7dxIyz83Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7t69uVHusI0YCfHmfItYvqhzmxhPld55Ug3zESLZ3o=;
 b=HKSbNoc8gUdWkFYULqpVwQsKpJphZ1PD7ksx7eKQcToycieaXU2O1AbG/U+oEw9CirSYNoLB4ulEx6VHk6WTP/HBzr6Z8zaGGXbOAHwmGo3+06Us1+dG1fm+87BlKFv4lNKArjIXNojpiWbY5ZliHwP+szr8oS2OpElrKFoRUjzRDAgCdyxV7Z86CS2aNLAVvkGrGKFAYiP2C8Tu7FqrarcgaE80vtjec1O1ytgLqFkpnykPpLxVAv/80RRxHxjkWol8EeRt7LWu7RPiuistMsZoezZY7qRPvuRVcBrdA68MUXVnV5hs+zDpkBGF9Bf/2lTe5ZgROL9BKHo58d/dRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7t69uVHusI0YCfHmfItYvqhzmxhPld55Ug3zESLZ3o=;
 b=uAiWhMqFMdtq0FOqlXObwcNnGmBM6NGv8suliJDK7ZChEUCn+nfFf/gd8viV5TTwEkpBHfI3qCm3BHa77E19iTf+wrYeRryYn2WiQ+CQducH9Ayyo8ESTHAhBriuDqEb6gcmZNxubBteomWwgmhvlxAXlwWSob4PWLHVDOldGaUsJXJrWscxqZ098A4VgXMNKW1E7uoMGXvHMRsyVFtmYhXDAG6ECPM4ksIsmy+5UXibFiB0Fnmd0nrV5QdrMwYmp2Dle78iAmIBuRB/ZPqMi9EOFjM6xi6U20ACqWLhi+qxlSfadsChkkybdev93vtBFgCdfoPiHgNN3wjxD83eAQ==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by PH7PR12MB6466.namprd12.prod.outlook.com (2603:10b6:510:1f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 07:58:32 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 07:58:32 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Zhu Lingshan <lingshan.zhu@amd.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	=?iso-8859-1?Q?Eugenio_P=E9rez?= <eperezma@redhat.com>, David Stevens
	<stevensd@chromium.org>
Subject: RE: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Index: AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAA1+oCAAACdMA==
Date: Tue, 13 Aug 2024 07:58:32 +0000
Message-ID:
 <IA0PR12MB8713365735501290E3174F40DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240813033547-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240813033547-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|PH7PR12MB6466:EE_
x-ms-office365-filtering-correlation-id: 91f8d641-8e58-4ceb-b379-08dcbb6db9bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?doD+inf0QDKgu25pO82afLbgbaqUBtLOgNFxX5DBYEql4CfKPF7scx2IaR?=
 =?iso-8859-1?Q?vLHvKXkfHhwilXrPIlhpCPljHbuS36lMOmTy7p6bwXcxnTtxi7IhMs2nHJ?=
 =?iso-8859-1?Q?ryT8laintEXZBnUbwwf8KvdifTLc2Q4N5ARYBwn0Pzq1eMVOBQh2Omp2OK?=
 =?iso-8859-1?Q?KDDUqTwYDmeb4Q+RIz60gJ9H0138bh0aUTgeonbcng3Mdj0xOeym49xKi5?=
 =?iso-8859-1?Q?/GQJATMSgnkj60HW3hiS5HA2znXZbb6y7ICaIfpU9z3ohQ0BNADegP/a5P?=
 =?iso-8859-1?Q?db66luh2x9M5UpDtc6pqDLOGM3t7aH0i2GLJ/e2ld3CrypqHHEsKKGl8kg?=
 =?iso-8859-1?Q?qnhoDALhDe9CFKLKTSDjaNPXLGDNYGlqsXWBwgD8As4xpAXAz2BuGMMD4w?=
 =?iso-8859-1?Q?1O7pyHa8XeutGayliacdrZVToW1Nzwcnpz5D7PQQPniHMNZQZNqJABMbwe?=
 =?iso-8859-1?Q?GZCq1RwgZEoGXAN7yHyGy5JZpkxweVR2eTZPFn6wWBS2NMd+uPXB0AwFy+?=
 =?iso-8859-1?Q?DN/ZnNTDKha/eWkvk6ODArH3Il1VXgcTphyloWpDqHymk0wbFrkNok4Y8b?=
 =?iso-8859-1?Q?UbTBf3azwiJbPOTvmUfJttJ1TMQrZS2kAZAozQDn2f9v4RPAzqAjZ9xKkt?=
 =?iso-8859-1?Q?StH+N73WO6/0xXge3HSSd99j137ru7IEs9lc+6R+JkOtBKhs6hiDemlEPi?=
 =?iso-8859-1?Q?jBUCIkn7KXb99NxiWV9th5TGu1zBA5fo4Beg+jJ8aNVHbEVq0rEpvMEGHJ?=
 =?iso-8859-1?Q?dPmIrTGikSkOjdS547GffF1Dg/YXTN4HzdjxuLN4mwjG5IJXe2q2tII8ET?=
 =?iso-8859-1?Q?ukzpWqepeqASOWvi67aWGUMpYjPiLRk9f8G/28nclFPVhkQN/3WbRJeYHe?=
 =?iso-8859-1?Q?DVNhK1iWfhzhKEsFQ5Xhy1FlYXi83r3ZiZG7L8+/x1jTPW8P9F2jhmBM/L?=
 =?iso-8859-1?Q?3fe0yOkZAi/dCMPjtlm0kHLE1ziOrvMCQK72RlkSM7JogMHlTzDqY4Gepv?=
 =?iso-8859-1?Q?Dw/CzxtOlKNNGqNM0DWjEp03NFcYzJoITKUE8LDnKRhehU1PpydgWcXSHD?=
 =?iso-8859-1?Q?o8BG3CnGV32kd8KfIWZV7g2V+F8RW7F5R1nFt12zDRV9Elwz3X5ipVuJ2q?=
 =?iso-8859-1?Q?PtULmkN6fjKnXm9QzaUv3WE+Yz09lnpMk8+2/dGxXCJEyfVQBxLI0gF8/X?=
 =?iso-8859-1?Q?ef9vqMgNUYFUO3Hv9MYCqKOPnFD2ECMcCOOlzNob94vHNODofLR3/9ZqRd?=
 =?iso-8859-1?Q?Fd7uDc5ZTMcPUNWltshdVlU/Gqh7uxg+qIMu2NHZHpxRa/ZBQds/whowXn?=
 =?iso-8859-1?Q?Kpk3ACnR50MLCT7FIwn+9tXqd/dUyabJKDU5wkATMx1I+L4hXHnD5R6kGL?=
 =?iso-8859-1?Q?M2Nlsm2/DD4JYzd5Ii2zpjquZRmEfOL3cehctjgud6CLp2nycoA+hNivOP?=
 =?iso-8859-1?Q?zMwbVFHnD7GG9vuRA51ZVbWE37gCGYJ22fo29Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4t9TcWH9v98nTULlEk5mbHfSyFvTV8bJfgXMOlhTQhuKm4ngU91PbtzrR5?=
 =?iso-8859-1?Q?vuSflXu1vr2N3zDXuWVoT0bZyGyTs7S0qySS5F+rfY+h7s4ar9t6dDfsnX?=
 =?iso-8859-1?Q?YqqjHzlg3gFC1pRKgxiLjD0UZMX+qOGBWnoknUoBDlfqCViePogs99f3mU?=
 =?iso-8859-1?Q?j6i1pmBTWvd5iQwQWBqsDStO06OWLQUDofauAsGui1nUau5mF89XJDMQEW?=
 =?iso-8859-1?Q?gCFl9lgRCduWggNJLUa8x309KKRl9PGF+VjMY0U/Ck4+4ghlPqoFMcywMx?=
 =?iso-8859-1?Q?NZ/l0uHXa0G+pxemu//886eaa8CwSvMWArJpVZSmr2JlXFwumoiL+8LeTH?=
 =?iso-8859-1?Q?0TxwLCpeZeQRoRvLQa08rbGr+RZqmaLhc9OCWI4cMTnVFb0D/UZ2c3S4r3?=
 =?iso-8859-1?Q?QVOG0sgTrAFeuchr+zv2IG5ewflQiVzcyPJTY83ditH2GC5dQdpEC8VMn9?=
 =?iso-8859-1?Q?YUm08cqZhairGyp+0QxdHTueijGhw7zMie0rDsJP3Rr6gchJMenOeWygrr?=
 =?iso-8859-1?Q?SLKZfvLPszcSz34KDTaJFbyX3wN3qo8FSbESqdgvZ9MrMteC33lA3OJ1oq?=
 =?iso-8859-1?Q?/y5j4/PJm8NNJsyDNjBrTIXPEiWcoxxEjXovN9Se6ol7SYbDXhGEcjPnW0?=
 =?iso-8859-1?Q?NAVSIXDVgdsbjPq4it80dZ9gvYl3FDBkysxmQd6Ll8Wl2LucRPHILkV9lq?=
 =?iso-8859-1?Q?o8tc3mRJvPbOoNjqzXHEA0O+W6TyvZt8NQPsjEz8SzkcSbNGvJOccd3cTY?=
 =?iso-8859-1?Q?xvgoiAuBKQOEun4ulk5VhUY520Pn3DcZ9JChV3IuKkszIUafbaT8ocB8dq?=
 =?iso-8859-1?Q?EtUYZ6XjfxdmB3ye6OYMTZD52iHVyeW6uZdb0SUtag7Fo0R3KOp9isdr+x?=
 =?iso-8859-1?Q?9erByUqN03iiMZ/NSSVIm7/RTOi8pqvBMLLMWRvewaF2ZaEgHwl/imk879?=
 =?iso-8859-1?Q?EMCwHon7KsPXVDsqhCOVCwCSS93OEuYoXZz04ji2BFgixkbQv92rszP2gL?=
 =?iso-8859-1?Q?IScIFOqMpxPfbu6qmW12NSswlufUWAn12YFDYW9ROvVtuQo8EgomfUdqa7?=
 =?iso-8859-1?Q?erPpki3WBLE9YyDgoq2VV7chrVpb/dajJLacSkQA+THgOJN3d/BQeNFgSB?=
 =?iso-8859-1?Q?43IXuHO8FB/hKBI99zSOCg2nVSHpTpbcRqBc1zYjj5ChxC3peKlRNdySOx?=
 =?iso-8859-1?Q?rp1yhmfLphTqbUqx2lPal7BfFYYgYp4HVsA+hocNgL/CUqoDWAw6oI6f1/?=
 =?iso-8859-1?Q?QDZjyI0NmUVnkwm3l8XCPeIXvgVnmMsDEpqVQ6G3mhS9p6Fy4CAsisk4c1?=
 =?iso-8859-1?Q?0W0hvtOaasBXIC09+aGCkiDf8paDx7SIhHwxhUhvDV0qAJJsfxFg453cT/?=
 =?iso-8859-1?Q?njpozg857QGVoc13h72tg7v/stko7sDXgkHixUnckbU2hOlRLqSSN9HaEm?=
 =?iso-8859-1?Q?xJa0QfmKH6+sOts2W/Wy/ulrzrHyDmdNLsQ6Dr0nTSdbEHx5S1GIeL0odJ?=
 =?iso-8859-1?Q?njz94VgG8wUjjPsuMewIdlVaEMA3ugWrcgXFR60b93BZnygpxUTYsDFU/M?=
 =?iso-8859-1?Q?TM+hPM80YoMpCOkjjDq801nRB4gGngzBhjli7qp9GJrO3TK5fsH8HBLDns?=
 =?iso-8859-1?Q?djsfHVRdGZHnyxM8HsbxyW/5/pf9xizEB+10gB/150sRopF868JO0Xt4XX?=
 =?iso-8859-1?Q?wffJ1rGV9Z+e2TjVVzZRU2lBlx3TCfmIWj98aTBL?=
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
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f8d641-8e58-4ceb-b379-08dcbb6db9bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 07:58:32.1524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShkUZU/xu6ULLICxZzoBzyt/G0rDPalsOtS2bEKEHBh0qHTLkQActrLe1+hzCQZT9EdzrEpxecP8H9VBSNbIuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6466



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, August 13, 2024 1:22 PM
>=20
Removing intel email id again to avoid constant bouncing messages.

> On Tue, Aug 13, 2024 at 04:42:06AM +0000, Parav Pandit wrote:
> > a. suspending a device is non frequent operation (in order of N
> operations/sec, where N is roughly in range of 10 or 100) per device?
> > b. A software-based device may not always want to force VM_EXIT on read
> and write on the device_status register?
>=20
> I just see where this is going.  Parav, if you want a device with as litt=
le as
> possible memory on it, using DMA as much as possible, what you want is
> develop an alternative transport that will let you control status without=
 using
> memory accesses.
No, there is no need of DMA here.
This is not about less memory either.

As I explained, the challenge is implementing suspend bits to operate at su=
b-microsecond level granularity.

> This will also, with time, allow doing this for existing config space.
> We aren't blocking all spec development until you do, and the tradeoff of
> easy to debug, robust MMIO control versus complex but maybe cheaper for
> some hardware vendors DMA based access is up to the device.
>
No one is blocking the spec etc. Not sure why you say that.
The idea is to have suspend as command register, and its status to reflect =
in the existing device_status.

Last time you recommended to only make design suggestion and not go down th=
e exact details of the bit and let author to fix it.

If you prefer to discuss the bit level details, it looks good to me to go t=
o that details.
=20
> --
> MST

