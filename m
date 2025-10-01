Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013068.outbound.protection.outlook.com [40.93.196.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F62C1DE2AD
	for <virtio-comment@lists.linux.dev>; Wed,  1 Oct 2025 10:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759315857; cv=fail; b=PBtNLjuk52HXS9e4XeNZoLB/e+obs+N+mwgoLruwfzvUf8RWZdVi4bDUtXMAuaKgWJvrJg4Y33IUBM09eLN8oyeiGSlIIJR09jwhyL+ml6PMR/QWnP+HIc4DJ7O99frf/3g0F4G06zTPBwfD3sQkxVs9/dGj7JM+BYirYP/yws4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759315857; c=relaxed/simple;
	bh=3fN/QBS8eirv0op6P5drSJykJm4db+5UAYdfDH3CB3s=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aY+Ie0sXHZ4Kqp6CQtRbPRyq768yETXDxqtXvnqPdMmu3uU4ib5lBmKo/Lh53nuk0AAiI6Hq5nqzWTIjxWfZgtWVjb2BKUhuBO35+SQ5LpA2+TqHz3U0gt3EVYP96QXWJ9Q2P8Twuw7aKXltv/FI6m8nYHApL8QUk6r/tukyf6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CVBeTdsI; arc=fail smtp.client-ip=40.93.196.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CVBeTdsI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdQWes4rRwtzY18X+dQauf35Z0PpuEqbdzqfxwcCfKm1XVKlAbRJ5bpzcJCuK03/kDULDtd9RGPrdRn14gEvuz73QvbAoc4RLm4lJxMsyzCb716bDVmVR4LjFSrb8km6BXQoqxpFp3m0zvqMGdHFH8LOd2wTKwfFnQuyiyzbt7+naLB6hR4Mh5obOxbSKFF64lBCQZb3aFkOHweVfL+YEWVeKWFbF6BmGg2lD3s32Vot9MLoAkfYYWT3YN61ZAJrdfXzeHUuCOwceDwfRcY7AnAYAUEMQMsxkyP5wEqs3wTFNwvvyKczjyqbyjyyxNxpyb5gep379ukdlw49McjLkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fN/QBS8eirv0op6P5drSJykJm4db+5UAYdfDH3CB3s=;
 b=E3gxlBY9n2+4Z5D1umcQemlR5Oa+1MhptWwMX9rIXPz5w9pqloqrGPgy24yNGOjcmmKOcqIyCo90UVmLxPjsQX7hbxlH6+3fGdgmwcE+fdIsH/lbCSdvpFC3QtUvKTo011I7I5baIeIVyy75uhYjmwxCxHvBF17u0j6ZV+26hQY3Y35sYR5fjUotPBVaXqX4yD0irroJQYQJdmgHmbSG6XDxoPgS6Wfm9/Sgm0b5pH8IudCz9usVDrbF77ZP5Vd3rzdPhqBiC18aUj0AxKL6n3Jn9Qnq9RzJYpF/oSoq68hCuGN+Kfzra6JJm/SJm7O3miUYDfNnAjeGV4Hs+yp/mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fN/QBS8eirv0op6P5drSJykJm4db+5UAYdfDH3CB3s=;
 b=CVBeTdsIGQZvkxX0JstKoueD+b2UlvQ0QUF0twJG4YPq4EwIxa19d+m2mBNA1F1ZyjIrU9TULAsx3S0bbko4i6mWWnk9MoEJJVCa8zIJZAL/WXjTO7QC0kG6moDVJt3q7R/bP9ZoM/fvaSkngI/2k8CCjKcC4RsVPAIqW/3KEu2Tz7adTkQHvJIalwLndLC/Srgw5I53rw/dpt9La5CREUhcwXroIcCHo2RNoPl/zex/AHPD+cLHPw06XSUKPRD3nGe6+j+Q14BA4wSY2HYYtfBwQswiLaUtjrcc31Edg1GXUGKr20QdAGsFmkfDVIMNG1dIDwkD1kf8kQh0yE1SPw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH0PR12MB7982.namprd12.prod.outlook.com (2603:10b6:510:28d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 10:50:50 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9160.014; Wed, 1 Oct 2025
 10:50:50 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index:
 AQHcDRMxc7D2+BxJGUa3jiZ0uZVtV7SqECZQgACnIACAALBIAIAAa1mAgAEnxVCAADbEAIAANhWA
Date: Wed, 1 Oct 2025 10:50:50 +0000
Message-ID:
 <CY8PR12MB719518C4A8F3EE03690E44B1DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <20250814120118.81787-2-chia-yu.chang@nokia-bell-labs.com>
 <CY8PR12MB7195670B68CC8F454DA821C6DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79843798615E61FA134A5428A31BA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <5f1f310d-8a17-414b-ac70-80028832a78b@nvidia.com>
 <PAXPR07MB7984310A505E7EDDCA0CBFA6A31AA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719523226B3E785B8433C823DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79847467B33487A8F0CA5ED5A3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
In-Reply-To:
 <PAXPR07MB79847467B33487A8F0CA5ED5A3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH0PR12MB7982:EE_
x-ms-office365-filtering-correlation-id: cdf3ff3d-ef02-4019-11c0-08de00d862d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|13003099007|38070700021|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qc0Fmmp1XYB9UPJX9Ygc+dsuAUaQcP44bPLDPkdyQFceWolqjlTDuUNV1lY/?=
 =?us-ascii?Q?3mDB3fAYzkbu08zWKWz4IOyvtvVPy+vAtXcMH6pId1lAXcALxG9YZac9kZVk?=
 =?us-ascii?Q?JfoK+Uu6QJarA/c7zk1QiQHTWwI7pnGi4iw+L0CQGBQbPEC0cZ9Cm6aLvoOA?=
 =?us-ascii?Q?/KY7UAD6UtYSDrueDTKQGhwg8i5nqnUBKi6bNjU5vGAvK6N05XnVC21tZ767?=
 =?us-ascii?Q?TaAMAKxilTl92ZFPL09mfLqXz0/gJWOGoIKCVUl4HoBhkGhSozyoWSOnX4QP?=
 =?us-ascii?Q?jMJlS4Av+dtAwRzrIGsB/TDP+Zc4o84G5jHsna9SLvgVaJYfqYDV+OfWXgbO?=
 =?us-ascii?Q?97l1JMeB80N16bTnhdmwvb7E3cE1iy06HkEr+g7XIu+GR87xDdR3z7JzKQlx?=
 =?us-ascii?Q?vWcRf31JSxtvgcE6R5+q2cB5jUt/lxx1f6n+EUMkFs/FiwMkqmWhvgEDkwm/?=
 =?us-ascii?Q?lth2+B1Ff/0NWdzdJQOjlx8vDNg5RpAMrUwFgA5bliUNqugbS2yYjSd/8WG7?=
 =?us-ascii?Q?KR4cBHfTjMQj+wbJ4eVUBLH574pcDkbWv9Xhfddzgx8A9OeocjCyuHiZ4NdX?=
 =?us-ascii?Q?p7fFJiGKMhtIBdbWBxm0USNzUgEKF2sY1xn5IhfIdEJNHkvQWsGFUOIAn6aV?=
 =?us-ascii?Q?ZbUUIWUTyp15WY5Pr1ivS4fWAFEKvbULsEh9LMfkV5gsOkR+bodZKtnsDW8H?=
 =?us-ascii?Q?1y1jHU/6b+HdrfR3aURJErp8f1uIbso1me+DIdoqrQWE0+FbCgtGX+QXw1Lt?=
 =?us-ascii?Q?rYaB+mIjvZNTI+1mXMBCcc3cXWeURn/4sK/lZuWWQ2nw0LsZpeTxPme5EClu?=
 =?us-ascii?Q?VXp9eGqEWK4dL7M+azAvygQV5+wTWcNdrI9oITo/83oWz0QXlJs8kafWBfR0?=
 =?us-ascii?Q?2Kcoj7yXX1/HLIbhuvyC0BlQQVXa8FiUMhNkoo+WIiVk5WPzhi49XRSgIRM2?=
 =?us-ascii?Q?GzjEir/8DC50k9sXR8nhyDHK/KYL0jHUppJUtH0MWuCTLaWCYZtn2xf8NPiv?=
 =?us-ascii?Q?Fco6f/sXKKB6k+OemCklnACvwynVO5/GcKIIrFh7wRH2Dw/UlTPHXYPbkuwc?=
 =?us-ascii?Q?p7TmQX+JggO1M3cmsPcAqcVkBHzGa8+Oi0/53dogwpeJeynRvJvApcvhovGq?=
 =?us-ascii?Q?6BEVBv+GMIB/dG4+G+GEExVdI/I/Mc1Nz5EhkYcFa1isTISO9szxDU7UQ2aR?=
 =?us-ascii?Q?aLo8i6tWqlXUPCywvaJfM3XtyR8Pf9HQfapROIdMZenjTuogpx5GIBCAbUKG?=
 =?us-ascii?Q?uAQnpLgKUk4+eQ3QwHLN64inDn0Ag44nsmOaMb95yYiWh3A7C6SHWGgUusgY?=
 =?us-ascii?Q?UFDzBre8ZHLddE34eTH43d5nH7yTVJjHyl2a2ZpMLbpJfw+ObY4CmtEUWrdn?=
 =?us-ascii?Q?vaHF/gqGHlfq1Mfm+oaybFaN2kaPjtXr8GB7SvUmp1+1Y3mhgFBZXz2xufBI?=
 =?us-ascii?Q?Bf7a742f9DLJZnshxL879BhlGMEO6HSzHBadt4MZ4sp13woQ+5Dd3hK/x8HZ?=
 =?us-ascii?Q?dwGhXhyCcj6jU94X/ujaNELFkpp5ZhSncna6Mj3ENnbXMimXPkeFRUSy1A?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(13003099007)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mOF/OnBHpalxVQd2gE1leYqr7mLWh1VmKpMnGaty9cWw7Tit2fuaYs4vaxMI?=
 =?us-ascii?Q?tVtf9SmCwUx5dETUyhskAi+BXW+pX3qpYWJ6clVfvrRJ1Pr873MgpF+kQjj4?=
 =?us-ascii?Q?5A1dPCkg50F5M1OnsNZfHoBtoEBtTc2ambfs4cZv7kfXxaulc7cXpGa8fzVE?=
 =?us-ascii?Q?R27fFkuvT3mDC486Le/kTStgTgDLFM3Hmh4DhjNpJb1H1l84NehRPdn/faze?=
 =?us-ascii?Q?jk/aocO8GmJR6lIYq9UDfI0eB0UgAANfwR5hCkjZT1WEfAxmlT5p3kvURJDX?=
 =?us-ascii?Q?q2aU5K14d5bPdg3OGx9dnReeAVaWikR6mIMYSU89F7oTPyMFW6ySbsLmDubx?=
 =?us-ascii?Q?ZAH65YNk6cSAPUV7MBHHHcHSfoHFVNgrZT/KKcRIz9eq9nIPL45DCYbJzKj5?=
 =?us-ascii?Q?x8vdjyaYXacPu0kLYchCNqWqo8Q9ZO18awaIgGCdg8tv0ijVuSnI5kZ1qnjv?=
 =?us-ascii?Q?NM8HLvWJ3qaMgUwQ55Xzj4709xnTNXp0jdjeyiec3O/1aokIC/bVbykD+W0l?=
 =?us-ascii?Q?uJXYj743QjpLgRwAFPeReZnEjxFe/4to/z8u/G1Q/A5odeomZIl2Bg8TxjDk?=
 =?us-ascii?Q?mtMEqM3EdNMzdssiFbXFr4b8jSS0kUrRQdCSq4Q6A7ZihbXKZiHM5v5aHgUb?=
 =?us-ascii?Q?mAyll81dUrXy0l8+s4ZB3qGpBFtfQDhzWstwCrrOynaA1x3YDxveTvx+lkJI?=
 =?us-ascii?Q?c0c07EfYhphJdfTDR9C/YU9yfKVWeStvqCTWO74hjMXo25bs9uX3O1slQzNB?=
 =?us-ascii?Q?MP/9vDKgNQs25zAas3/Uy7ISQurqzo6kd4+zKTaHo5NEllZh1QD8MnIKQvGO?=
 =?us-ascii?Q?t3cp257hU9saUTXTJd5uQRrDVfGIRjvAKYaZl4yoaS/bWD620u4SySwBqvJx?=
 =?us-ascii?Q?ePO18qmfi0z9gbr2EmqtVZNWRRfIPs1SLRDusuhcMFbTtC0LxrX8YmhAOHRY?=
 =?us-ascii?Q?VmLy3YUNIeducm74Qx/Z7rkoFLZEBXD2aoP174tu26zr6Sxz+fSjfpprHkrc?=
 =?us-ascii?Q?IrKqi3SYbQn2w67PqwKaPpaVsGEJUoZoyMyoQ9ixSlz8nP4WlErFh/pPHF9P?=
 =?us-ascii?Q?b647GV8wVxeVs++qb8VeGhB5xlolvQRFqi31gj9kMwe0XvMIlsyfOrPYHT0m?=
 =?us-ascii?Q?4vx5prLl3+pGmsgSc6NVdJjhFHFL8wX8iiCT5kXndLvsPlFTJGv6XJ7ECYny?=
 =?us-ascii?Q?i7SUyB2aW8QusuLzpOVRLWneqN2JGJ8Qz/H7e/PPSjqF5+RkWenRFM7dLbKX?=
 =?us-ascii?Q?3qtk7UIydkDiUMHNJ4YgrVRzx3U3X0SlJavMctEQYVjQ42EU4/RrsniirmwY?=
 =?us-ascii?Q?ZphIcLIZKAnaaUoJeWx9BV2aSDLw0l+dOIiIfB34ryduEEN3Jy9wwEz6Eiw1?=
 =?us-ascii?Q?c/9Ko1dq08bOCO/A4HGi0DAGmSaisZLu1Gw/xXONZ61KnwzCoDlFXnXoQUfi?=
 =?us-ascii?Q?4xz/7xECYCpn4VteS0vYBNUgbFVpt+/p0vsXxw2IDJRLJxttcGKkPsXoyg4o?=
 =?us-ascii?Q?Q+VCGcj3qf29kAeoFY97xCpWqrePYf58nR5k/FnY4AWIhaE+kOoRP0Nhl1xT?=
 =?us-ascii?Q?2xnvmeu7TjDHHZpr58xBXUlaC8+YqKjohV/wGUpH1laCEa0/dJfC5HKswX4D?=
 =?us-ascii?Q?exAvRtLcgSEIZ0uJAo9WVZI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf3ff3d-ef02-4019-11c0-08de00d862d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 10:50:50.3844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /bBKl41Gkoivz8urPHA/s3m/fDCJDBU9+HusHIJVPkIv/vzzDqOUL5IcU1Y47a7RCD0tKFaBUUhMDjo9j198Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7982



> From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Sent: 01 October 2025 01:04 PM
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Wednesday, October 1, 2025 6:24 AM
> > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;
> > mvaralar@redhat.com; jasowang@redhat.com;
> xuanzhuo@linux.alibaba.com;
> > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De
> > Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > g.white@cablelabs.com; vidhi_goel@apple.com;
> > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
> >
> >
> > CAUTION: This is an external email. Please be very careful when clickin=
g
> links or opening attachments. See the URL nok.it/ext for additional
> information.
> >
> >
> >
> > > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > >
> > > > -----Original Message-----
> > > > From: Parav Pandit <parav@nvidia.com>
> > > > Sent: Tuesday, September 30, 2025 6:15 AM
> > > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;
> > > > mvaralar@redhat.com; jasowang@redhat.com;
> > > xuanzhuo@linux.alibaba.com;
> > > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De
> > > > Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > > g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > > Subject: Re: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > > > descriptions
> > > >
> > > >
> > > > CAUTION: This is an external email. Please be very careful when
> > > > clicking
> > > links or opening attachments. See the URL nok.it/ext for additional
> > > information.
> > > >
> > > >
> > > >
> > > > On 29-09-2025 11:14 pm, Chia-Yu Chang (Nokia) wrote:
> > > > >> -----Original Message-----
> > > > >> From: Parav Pandit <parav@nvidia.com>
> > > > >> Sent: Monday, September 29, 2025 9:48 AM
> > > > >> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > > >> virtio-comment@lists.linux.dev; mst@redhat.com;
> > > > >> cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com;
> > > > >> xuanzhuo@linux.alibaba.com; eperezma@redhat.com;
> ij@kernel.org;
> > > > >> ncardwell@google.com; Koen De Schepper (Nokia)
> > > > >> <koen.de_schepper@nokia-bell-labs.com>;
> > > > >> g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > >> ingemar.s.johansson@ericsson.com;
> mirja.kuehlewind@ericsson.com
> > > > >> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > > > >> descriptions
> > > > >>
> > > > >>
> > > > >> CAUTION: This is an external email. Please be very careful when
> > > > >> clicking
> > > links or opening attachments. See the URL nok.it/ext for additional
> > > information.
> > > > >>
> > > > >>
> > > > >>
> > > > >> Hi,
> > > > >>
> > > > >>> From: chia-yu.chang@nokia-bell-labs.com
> > > > >>> <chia-yu.chang@nokia-bell- labs.com>
> > > > >>>
> > > > >>> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > > > >>>
> > > > >>> Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not
> > > > >>> mean that TCP has IP-ECN set; instead, it identifies that the
> > > > >>> TCP CWR flag is set and will be cleared from the second
> > > > >>> segment of an
> > > aggregated segment.
> > > > >>>
> > > > >> Above text is seems to be clarified only in commit message, not
> > > > >> in the
> > > spec changes below.
> > > > >> Can you please add it in the actual spec wording, including
> > > requirements?
> > > > > Hi Parav,
> > > > >
> > > > > This is to fix current error in virtio spec:
> > > > > "VIRTIO_NET_HDR_GSO_ECN is a flag within the VIRTIO_NET_HDR
> > > structure that indicates the TCP header of a packet has its Explicit
> > > Congestion Notification (ECN) bit set, signifying congestion in the n=
etwork"
> > > >
> > > > I am unable to find the above cited text in virtio spec.
> > > >
> > > > Do I miss to find above text in the spec?
> > > >
> > > >
> > > > What I read in spec is:
> > > >
> > > > The driver SHOULD NOT send to the device TCP packets requiring
> > > > segmentation offload which have the
> > > >
> > > > Explicit Congestion Notification bit set, unless the
> > > > VIRTIO_NET_F_HOST_ECN feature is negotiated, in
> > > >
> > > > which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> > > gso_type.
> > >
> > > Yes, you are right.
> > >
> > > > > TCP header does not have ECN bit, and this flag shall indicate
> > > > > the CWR bit
> > > of TCP header is set when doing the GSO for the first packet.
> > > > > The corresponding texts in RFC3168 are "When the TCP data sender
> > > > > is
> > > ready to set the CWR bit after reducing the congestion window, it
> > > SHOULD set the CWR bit only on the first new data packet that it
> transmits."
> > > > >
> > > > > So, do you think adding above texts in the commit message is ok?
> > > >
> > > > Yes, but only commit message is not enough. We need equivalent
> > > > text in
> > > the description and in driver + device requirement section.
> > > >
> > > > Something like,
> > > >
> > > > When the device is transmitting packets of gso_type of
> > > > segmentation type
> > > A, B, or C, and if driver requested gso_type of HOST_ECN, the device
> > > must set the ECN bits in the IP header and CWR bit in the TCP header
> > > in the first data packet of the TCP or UDP segments.
> > > >
> > >
> > > I think the text changes are already proposed below.
> > >
> > > Or you can refer to my original email for better comparison:
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fy=
h
> > >
> bt%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cd6257712d9034f8a9e980
> 8de00
> > >
> bcf004%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C63894900867
> 87709
> > >
> 20%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjA
> uMDAwM
> > >
> CIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&
> sda
> > > ta=3D7zuzqOa56FsTpSJYooypn0zP3eVpaze4oDPCsFSIi5Y%3D&reserved=3D0
> > > .net%2Flore%2Fvirtio-comment%2F5f1f310d-8a17-414b-ac70-
> 80028832a78b%
> > > 40
> > >
> nvidia.com%2FT%2F%23mc1750dcc26d74c9b19939c4e86dae8bbade6ec78&d
> ata=3D0
> > > 5%
> > > 7C02%7Cchia-yu.chang%40nokia-bell-
> labs.com%7C2db0adbd1fec45d22af008d
> > > e0
> > >
> 0a252ae%7C5d4717519675428d917b70f44f9630b0%7C0%7C0%7C638948894
> 348277
> > > 75
> > >
> 4%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAu
> MDAwMC
> > > Is
> > >
> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sda
> ta=3D
> > > 9W
> > > 4P5JaFU7sBOhC7C6jqpo07Xp6TrkrcgIIIJkJtkZ4%3D&reserved=3D0
> > >
> > Above link indicates to follow the requirements from section 6.1.2 of R=
FC
> 3168.
> > Section 6.1.2 largely describes how TCP state machine to set the CWR bi=
ts.
> > It does not describe when doing GSO on tx, how first and non_first pack=
ets
> to be prepared by the device.
> > GSO of virtio net is stateless operation and segmentation does not inte=
ract
> with RTT.
> >
> > If I understand it right,
> > The requirement from the device is that if 64KB segmentation offload is
> done with mtu of 4K, out of 16 packets, only the first TCP pkt to have EC=
N and
> CWR bits set.
> >
> > If yes, then we need to spell that out in the virtio spec requirements =
section
> and description.
> >
> > Similar wording to apply in patch_2 for accecn too.
>=20
> Thanks and Yes, your understand is right.
>=20
> But if I remember correctly in our previous v5, one of the reviewer sugge=
sted:
> "1) It looks like the GSO requirement is not explicit described in the RF=
C 3168,
> so if it's need to be inferred from that RFC, it's probably not the charg=
e of
> virtio spec.
> 2) If GSO requirement is clear in the RFC 3168, there's no need to repeat=
 it
> again."
>=20
Virtio spec requirements are clearly written.
So just by referring to RFC 3168 is as blurry as today in context of GSO.

At best possibly it can be written as "device SHOULD do ECN and CWR in firs=
t pkt.. and subsequent packets SHOULD have cleared".
=20
If that is not aligning, than better to not make it more blurry.
ACCECN feature bit can be more crisply defined in that case.

> The email thread can be found:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore-
> kernel.gnuweeb.org%2Fvirtio-
> comment%2FCACGkMEv2VQA6E6JjmC4jf%2BoHK9np_%2BFJzJ_5i4Td51FCYu
> %2BiPA%40mail.gmail.com%2FT%2F%23m2c34446bdc71be042f0cef5dd4d30
> becd323f55e&data=3D05%7C02%7Cparav%40nvidia.com%7Cd6257712d9034f8a
> 9e9808de00bcf004%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6
> 38949008678793907%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOn
> RydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ
> %3D%3D%7C0%7C%7C%7C&sdata=3D3ULZd6n2kXr4mHo%2BpCG1QLbzaFyTeiS
> NFYTQvPym%2Fl8%3D&reserved=3D0
>=20
> So, could you suggest which section we shall modify the virtio spec?
>=20
>=20
>=20

