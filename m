Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792726344;
	b=PyXBHpRKQ2U+XIWhKIYOQVeEkAybh9yU2TpwT6NRzRZ/9W6MQCoAU/Rl04erGiI6gUWA
	 OE3JNIJ4jPePFi7MyHf7mw7E7tcRf62C0tT/CwKI/8lj0blZV0J88UQhMkOXyFDOczHe+
	 3WauQ+HZXkc6TLfaLGiYeI3WKq7RVL+v6SHYgkVdEjlwWAUxVE13L38XK+ZesiRqOiXH7
	 gHEpRYHTwXEix729+lyJkF8c2cgWA/1Ul3KsZYPXQ0qV6K5K+kQqhQzEhtbNy9/KiWgjr
	 z2fvf+jn1I3dKtUGX4khG1sxl6JlNXFDcdpfLpNwFFcTRFiR+8Z+er1xuFVwkU+HxGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792726344;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JdXSaosetq8sVAlMuKXdtbEpDh87tAirH0svD2ujfO8=;
	b=tttfrOJpDWNZLwT0ewPN+6Gt0+UKpOZs1qe3xxX4isvd0VOemYyOdfY7aYgLE7jxS9ns
	 AGkhjprY68T7b3Yc1vGr3ZfKdeq2gfj6KUjxh1Ls3Uiygh8R4IxzhhW9RSoILttZy6MHT
	 Q/RT7M/i1a84OpyO05ZDfImmagSqWD+JS6I/MY5wr8S6tql7E7bOtoEZB/EY8gQEDfVjG
	 YKT77sK6yOC3Cz7rddUVhFHpqFj2lkT5sFO6fvvcSNQpaz1eiJdZr4YxSEYcf9sggWOqs
	 7w4RJD3EYYvsz/3NELe73W3uqJzKNxqSB/kWpxW/O43OJXNdmgsZv21BmNJWkyczS+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=s4fOxE0u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.42
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011042.outbound.protection.outlook.com [40.93.194.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10542606A31A
	for <virtio-comment@lists.linux.dev>; Fri, 23 Oct 2026 03:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10542606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=s4fOxE0u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOxi5lc/y266sqNC8FbmJeE4D7T/vjmKiCOxtheRplCozEh5yLqbnTvnCsyczJYpLl43XeZFcY1uoc49h3dN0KNdA6gdS68MKf5dbcCtwSRlPG5nc9J9R8Bddl8qeW9s8l7eDjFUHJcLx7+2H/vfBSg84yg8eoaTPxrGcxmJZq0YxCuKNBZXgee+KvKy/cvG0qqS7mR7qFvwWnJpwLc3V5M8Jk4lP4LTtr9FkMMnFGd4YwklanuXLJXTWFhHDd674Dqhc8jEMVZ0zmTubir1Cvcm5qydB4BdEq6p6XXNH9m0BGsE7oLe78CEfsb+A3LfwCawnAXixoiGDV7BJqVE2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdXSaosetq8sVAlMuKXdtbEpDh87tAirH0svD2ujfO8=;
 b=OwlqPiLn/aculJKfYhB3bTcKd7OhmZQqyIiHIEk9yWVxaxsMCu4QoqEMDa7G98ZIYG9e5wYdygDpp6v8q0BvZknNF90SpWRcoukQpAhxvc0IlQK903G8UY7KrLhkV4WB4Xmos6/C3oAl582cpi/tKJy7f0wnJq42at6/bBCp5ohXLUvcldLCxEfnO/Ao9Kh8puKLxknLmtzL3PDCQvVsTGyE7GEtA/GqHKdByncaRsaEdaTGFpfp5uDwAEbyLQmsniHIM7aMmkftXaO2CNGdgDbnXvq2/19LOqza4G5N3WFZJ/za5s/U7hYxygx7/ZAtSDL4OL2YN1lQbMHRsf3qXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdXSaosetq8sVAlMuKXdtbEpDh87tAirH0svD2ujfO8=;
 b=s4fOxE0ub4CDBI34SHYwxmqPx4Ur76WuZSP1vbdVuVYn/TXXk9y1XDYIH8GpUWuBItQ2N7xJBDoA7Eq2KGKbYH+mq/quB2J2q9l6JmrJnXfQ6G/7yvpAjapi6j9yA5jisU9ZQc4U4XjvtovEt9Ge/y5idkzstGYIZCLZoA9qGH1ehN6hGiV8RDDmaFXXFmuIXQBCEwWWcIHaoHrf71/IuKQQAAWq/Mx67F3UFOud6pYh9SqtEYBG3lBw++uUkrIhY/He6cufgoX4L+YEfp04Q9byFgjbwUKQ7Dv9X/wFEeKxcd0FbdgFNSYUffcikjU7h3xZtfnykwM6cxkzw0igmQ==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by DS4PR12MB9707.namprd12.prod.outlook.com (2603:10b6:8:278::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 03:32:18 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%3]) with mapi id 15.21.0522.017; Fri, 23 Oct 2026
 03:32:17 +0000
From: Parav Pandit <parav@nvidia.com>
To: Peter Hilber <peter.hilber@oss.qualcomm.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Cornelia Huck <cohuck@redhat.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Manos Pitsidianakis
	<manos.pitsidianakis@linaro.org>, Demi Marie Obenour <demiobenour@gmail.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Jan Kiszka
	<jan.kiszka@siemens.com>, Stefan Hajnoczi <stefanha@redhat.com>, Trilok Soni
	<trilok.soni@oss.qualcomm.com>
Subject: RE: [PATCH v2] content: Reserve ID 52 for QPSFI device
Thread-Topic: [PATCH v2] content: Reserve ID 52 for QPSFI device
Thread-Index:
 AQHdYYZ8aLR7Neu2k0aXypdMBau4wrcIYNKAgAAHHACAAJKLAIAAKoiAgAAEoYCAABWGgIAATaoAgAANYYCAABBHAIAAB92wgAACUwCAAABL4IAABWgAgAAEdNCAAAMpgIAAZ3UAgABRNDA=
Date: Fri, 23 Oct 2026 03:32:17 +0000
Message-ID:
 <SJ0PR12MB6806374D41479985A30B4461DC642@SJ0PR12MB6806.namprd12.prod.outlook.com>
References:
 <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
 <20261022091645-mutt-send-email-mst@kernel.org>
 <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
 <87h5id3he3.fsf@redhat.com>
 <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022114028-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org>
 <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
In-Reply-To: <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|DS4PR12MB9707:EE_
x-ms-office365-filtering-correlation-id: eeed75b6-2578-4395-23ef-08df30b63d1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|7416014|1800799024|261021121427099003|10067099003|56012099006|261022105027099003|3023799007|6133799003|18002099003|22082099003|38070700021|11063799006|4143699003;
x-microsoft-antispam-message-info:
 KGBTVfKJcL4NMB6/43sEPsp75QtY/kqg0BNb55663C7TnHOQbAlSH1Xii7oxxWklYJ2SyEt557xtP+UPIkSyrLuQEZOhxMkleNz29z/v5ydPOxLjog1wBjDxDEVcUDd9MyW1sJ/Cv15C//AmtoXUJr7ORCf3VjRpzxz8aB0g+sAWLM404dEKUdezJeG4OfHOt/DkvoQDeLLaIHUHgEVLsGh8pqzSvREdqJ6GDvzVnXLltS4Q7BX51MyeQekkZ8St11udzTRgxYrOstYi2MOhLg+6cjb1HKkQm+Mbn7zGO3Gom5gXyXeDuL4dv2bQtN12/eVEDt8L5XwHagCuLlOcMjtjMxWDmgrHJ9tBQLw4IQAiLxeLogNGH5Q79B/MzR408cW09Maw+4rDE92b4OPhFT1GxJiEYCvRU7CFb1OmBm2L3ALika+XyZzIx+lUZ9RYKK/bvCrr/uc8EuDfPo0IQ2cU7+Pgsj89bTmt18fPnMuBIlSVAFxkAIVGw9gHlnmb848OaGEhXx5LvvXzOU1hQ42v8H71NmaN1WHZPLh/Dw3f6V2Smc3AX7GTa7pKRzo7Jl1nXCSHpd+1mhFhTzlQ0m7mK3upvq0ki4OClhIPGFG2im8Pemg2B4yt9ZjdqvjaAsAtEaVV1TCM1LnS3TA7oC8kOG/jB0FLEimxga+orEE2mQaIwHy8hqwjV843gl/UBcdrv+aHAXEhx8c8oxUvsxkB8QetwvH2HsZ/nrMjWlc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(1800799024)(261021121427099003)(10067099003)(56012099006)(261022105027099003)(3023799007)(6133799003)(18002099003)(22082099003)(38070700021)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8rOquO0ZrOwFjQJvo5xA5xaGDi6YxxnzfiMqt4zsbvg9Qdu0Htvahy+jie4O?=
 =?us-ascii?Q?JW29SlvMYWODeRjkgKTvSy35ivfPRIyLkxml9l7m8dGNWzpLs9QEdyl8QWct?=
 =?us-ascii?Q?WiIh+AoWsJafO7YFqWfjC6TbOBGJ+QD7m0/0LCC03CHQKy0F7M5H4LYrNDd/?=
 =?us-ascii?Q?lJApFx5MGyD5glPLEWxQGvMr/pydtWa9yn/fPiI7IyfdcQlHFQBM2VGUwUUu?=
 =?us-ascii?Q?QUldfGPE6tWHomiwgiRAKywXksqfTAjW4G0+x7E7AXNZTOtPYyXnX/qHJYe/?=
 =?us-ascii?Q?T1Jcvn5W1YGLTV0P2jVQ4sumsDuIVsO1bJoXdTZpwJ2Y9+1GoMkKZsq9gpCo?=
 =?us-ascii?Q?6pXzFzcn3ql+V2Wqv8X3DNN+JSmJ4q+c2y4oSeBOdVetZDEVpNblpUvhtB09?=
 =?us-ascii?Q?7NJK6GWU3PXhavGjWK4djdIUeKXoyN0Co8Up3rzBuy543nBPCMwM4qUbEyKe?=
 =?us-ascii?Q?xfE/32j5BzsCkNsFsfk439WqZkSW3QcFAvrDotgCtyU+z7y7YPX7DrKBkhHT?=
 =?us-ascii?Q?jQMwmZo/DFOihDeJEJnbHBZZzC/nf4RVoUz7No6FMVCyTKHEwe9OaEaJW98W?=
 =?us-ascii?Q?3vVJV+bH4GDjCIpwrbXaNHhX1rBggM1Toy+5PhwrIhKowtzZ28ToAmGiZwpS?=
 =?us-ascii?Q?o9AyLvHY7AHlsEiQZxmCytyZZykienU6E796rMIoNzfEKVxMuPA90TVjgX1o?=
 =?us-ascii?Q?AmqUnBzunuXm/CnwJhjEMafge6ClxC0rnkxF36g2TkCtByt0QinUlak+BlU+?=
 =?us-ascii?Q?9PyvqAxfpQqkehHvAf+NE+jrQJyVrY2Gqet+e/cBzl7c5NJoMR1+NW+NQNWQ?=
 =?us-ascii?Q?U3SPn1+91WLktgpPbgMxvJrVt8Li+7uw9cdqySSWjZ2vmSkGpwprFlsqGapZ?=
 =?us-ascii?Q?qv/Jug92DfYc8NnvESt0hAAGONzUmswetK/7qCT3DppdDowSlwGLRvMII+kU?=
 =?us-ascii?Q?aNvygkeVgeAY7cxsxB4vTT8tx5/EH3+Ve+qmYLN5a+z/qUpSTzLXatdXKHax?=
 =?us-ascii?Q?AgOURdaa59pi8mguGI6jv0EqpJ0iWXEFem/E8b7h7j4VqBNElVHF6Mmmyfnn?=
 =?us-ascii?Q?ca4R4oIzaRFKHwu+6HsSApG2PZowEO771EAewxXnexTjkCi2a/9mROtP9iGu?=
 =?us-ascii?Q?8MJ426yaiH27m+gUnA6bRLvR97mtqL23MLpbgjiXTWfsQ30kYubjLSac1GLg?=
 =?us-ascii?Q?FwqBh5oUKNxMTj6wGQBpiQOsoFFrs22GJYMsIQI3O0+TUjVTY7gHyqNimquQ?=
 =?us-ascii?Q?ogK7lqr1CxLWQsNda5m9GZ4CJEG6tROo4cXmcmPQyGF2yt+IOYrbADIwseD9?=
 =?us-ascii?Q?eKKuS6PZyf94niwy/I1egMTe33MAuz0DtcM4MFZLMKmsEjsBjz9/pBBvO6nM?=
 =?us-ascii?Q?GafAow8LdZXYzrLHdIl4/efbKCc/h6FbtPuSGhKhtzLeud1fuNR8GRtFvTsu?=
 =?us-ascii?Q?m9/oD70g4Qgie5DiV/U6v8p8OJLzdiEPJJ2C8B77mbseOFczptxCFuGQfcFj?=
 =?us-ascii?Q?cnoqug6Z18ybZY/T14TEd0E9G3DIfv9AMnXDIC8bkDAlhBv5puh3hqV3Tz0z?=
 =?us-ascii?Q?KzFQ48/9KcScVYkJtSo30/xqSo/Sp6/8toFWOoz4eOAOtNK1tHvv4VF99LF5?=
 =?us-ascii?Q?yeJxfGz1O0NEVgUWlBBvsEMdxdUbOeodNcSVomC2zgSA1NIERA2kJDNQitSM?=
 =?us-ascii?Q?gjzG7wHUua3OxtRTKAi8z3KEaczA9BVeYIlL/UFxo3kOf7Bf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeed75b6-2578-4395-23ef-08df30b63d1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 03:32:17.6746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wDxw6DvhJh5eNk2tJlPQmTQvboPJ6aK9TxVBTlyOOnXOOT3L5o+yHMET7RpeeHoLWCZ8BfyjfL4S9qBXXzIKiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9707



> From: Peter Hilber <peter.hilber@oss.qualcomm.com>
> Sent: 23 October 2026 04:10 AM
>=20
> On Thu, Oct 22, 2026 at 12:29:31PM -0400, Michael S. Tsirkin wrote:
> > On Thu, Oct 22, 2026 at 04:20:51PM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: 22 October 2026 09:32 PM
> > > >
> > > > On Thu, Oct 22, 2026 at 03:49:51PM +0000, Parav Pandit wrote:
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: 22 October 2026 09:12 PM
> > > > > >
> > > > > > On Thu, Oct 22, 2026 at 03:35:51PM +0000, Parav Pandit wrote:
> > > > > > >
> > > > > > > > From: Cornelia Huck <cohuck@redhat.com>
> > > > > > > > Sent: 22 October 2026 08:35 PM
> > > > > > > >
> > > > > > > > On Thu, Oct 22 2026, Dmitry Baryshkov <dmitry.baryshkov@oss=
.qualcomm.com> wrote:
> > > > > > > >
> > > > > > > > > Let's define some standard way for the vendors to declare=
 that this
> > > > > > > > > device is "Qualcomm", "NXP" or "hobbyist which doesn't ow=
n PCI or USB id
> > > > > > > > > block".
> > > > > > > >
> > > > > > > > Are we able to use the first <n> bytes of config space for =
that? I guess
> > > > > > > > that is the only way that can possibly work for any transpo=
rt.
> > > > > > > >
> > > > > > > > Then, maybe something like one or two bytes for a vendor id=
 (including
> > > > > > > > one for "testing purposes" or so), and the rest to be used =
in a
> > > > > > > > vendor-specific way.
> > > > > > > >
> > > > > > > device ids are independent of the transport.
> > > > > > >
> > > > > > > but Peter already announced that:
> > > > > > > " Reserve a device ID for QPSFI devices (Qualcomm Platform Su=
bsystem
> > > > > > > Firmware Interface). QPSFI devices expose functionality acros=
s SoC
> > > > > > > subsystems through a common Virtio-based protocol. There are =
no plans to
> > > > > > > standardize the devices."
> > > > > > >
> > > > > > > So, I am unable to understand why should it be part of vendor=
 agnostic virtio spec?
> > > > > > > Why a vendor specific implementation of device and driver is =
not sufficient?
> > > > > >
> > > > > > I don't really think we should vendors burn up device IDs every
> > > > > > times they want something non standard. Reserving ID 52 as
> > > > > > "vendor specific" so vendors can go wild sounds good,
> > > > > > but a bit more needs to be done than just reserving:
> > > > > > document what is expected, e.g. no auto load based on ID
> > > > > > alone.
> > > > >
> > > > > First, you indicate to open virtio to vendor specific extension. =
This is huge in itself.
> > > >
> > > > Not as such.  It's just reserving an id. People always do things li=
ke
> > > > implement some crazy spec saying "we will upstream later" and later=
 they
> > > > do not.
> > > > And then the ID conflicts with a standard one. Suboptimal.
> > > >
> > > > So if we can tell everyone "always use this ID, and use platform
> > > > specific tool dor discovery, until your device is in the spec"
> > > > then that's not too bad.
> > > >
> > > >
> > > >
> > > > > that should be first discussed.
> > > > > If you suggest this, may be every device type should be able to e=
xtend, and not just demux at device id level.
> > > > >
> > > > > Second, one reserved id is not enough, because a given system may=
 have multiple such different vendors devices installed.
> > > >
> > > > I don't think we should care.
> > > >
> > > than all 0xffff as one experimental id once for all is good enough.
> > > than vendor FOO, BAR, differentiation is not needed.
> >
> > I don't think we want 0xffff, a lot of systems treat that value as
> > special, pci comes to mind.
> >
> > > And if it is not for experimental purpose, not sure why would vendor =
stop at only one device.
> >
> > They can reuse that id as many times as they want and differentiate
> > with a device specific or out of band methods.
> > First X bytes of config space was mentioned. or whatever.
> >
> > We can add a recommentation maybe if vendors desire that.
> >
>=20
> Thank you to everybody contributing to the discussion and to the concept
> of a vendor-specific device. Just for clarity, Qualcomm intends to
> upstream Linux kernel drivers for this new device type, so would
> definitely want to use a registered device ID.
>=20
> In case of an in-band approach, I suppose we would then have an explicit
> vendor list in the spec where vendors have to register?
>
Given this is vendor specific device, I am unable to find the value of virt=
io-community to maintain the device and it spec.
Motivation is unclear.

virtio spec is something that multi-vendors can implement.

Hence, can you please keep the driver and the spec outside of the virtio sp=
ec, and keep that in Qualcomm domain?

=20
> Best regards,
>=20
> Peter
>=20
>=20
> > > > > So why to bend things so much and re-invent the wheel?
> > > > > Why for say PCI transport's any vendor and device id are not suff=
icient to indicate a vendor and device?
> > > > >
> > > > > and if so, why to even document it in the virtio spec?
> > > > >
> > > > > I guess, I am missing the basic motivation part.
> > > >
> > > > For the virtio spec? Above. For Qualcomm since they decided never t=
o
> > > > upstream - donnu. Don't care much, either...
> > >
> > > ok. so yeah, let vendor's platform device be in the vendor's OSS zone=
.
> >
