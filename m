Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794940875;
	b=RV0FHuzanX6OOIu0gC9xvcrvoomw9cgc/jhCFPtH7GjM9h7OYjD/+rIASNuPnBSSvCCE
	 Uug7jYzB54EUtSZN7KdLE9uDCC9iD+53VSI6iAnU53Up+isbRSTV2cNZMUfGHyn5YBPr2
	 ywTt5J4yU2ZcqK6dq0Rs0OjYiistG72z4hacIOmLoiUrui6ygQE9Dz9m85xyzZeXWuWyt
	 eHyMfctAMJqoA+yXQbL3TmOrUR95k7wc2PWwXVEklJw2aIGRjSL/HMHGd/8Umk6GgkbEl
	 IxqUiQDHy7BLlBzERRUZAjUu+3Al75UXZgb3MJjPteqSCjGCgNSk1Gylucsq+MZertQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940875;
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
	bh=YsuYIv/En86Q7gl9oF4CKXQtbIECwJimKahC6a7MWAg=;
	b=wHJrjtxCGS/Ml9ULsnfNOcX5OxVegBNKRRFT8Ci8n7DmYwYeSdAYbg4u+3SG1/Nl+UH7
	 yVZ8iu4peCX9Tbl5vtpYudegDqTnEPq+7ApKuMKTVvldeBR2HLSNEgQvaUXr+jVP6nQNf
	 cvcIePe8+F3H2osZjhyI5dtTRi0XnlNutAkcYD/v7BiwR1wYI1M9eUJTPJhsmhCLW22h+
	 rhXSLS18XfiULlXe3yraFptOUg8av5UHQshEP7gRQ6BnFuPvtJAY9la0T7lqco1lO5FGo
	 xO17KQtWo7FNQyrOkAEG/D+WeJmPNFDHzSjdQL5sHH4iO13c+qklUzvCIBxYK1V3OQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XcOgOwnI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.24
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F68606A32A
	for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 18:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83F68606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XcOgOwnI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLr75kcTyZVwsiX666JEgnLmiyrz4G/ul6NLcqcAzIBPP5sb9hy3DY5bUs4/ke0x2cIhLRFm5S4J3anbyJGpljgVm38VO9/ze95v87oSG4o60/pSLQVVBP9B2hdfDPhJGoWl6Fh93y84JZ9L5KwzzyFoENVOIxQD6mlL7TRk7WfRtdATLswDP4+FGvjm7ZDY+WwAyvuCeLeHzpjsYikewwV8O0abFxNDplQRmVYFn7D3kx+n6JsuYo9R/Rh14alz8qba6itOp77qCBKBfWVBQMpjYFYO+MHOuopFN4gD2Z/TSEe8ZhAU/HPj2Wb23KUk5YGc8NXBkfbvVUBPHI2TXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsuYIv/En86Q7gl9oF4CKXQtbIECwJimKahC6a7MWAg=;
 b=Bsb0Npc0vCCzVmxQ9Yghstlr2TR4WL5qzqgqM+51y8a5XKs/6gpvHVVY6zqWJpDjjKezzwopt/KtongBEPlVw6upakCpu3zG43D27MzExaRuq5W2wFF6FJwIjrY6s3vj6999uoK5bkcaDAkXIZUOyeed/T9tdGAuSL5XCRhOPWxtHNKnzXo8TUV+mypIh4+n2gvBoGxGsKjRAUjy6nMfpu87OzM4BnSm5BqNPLU/BI2MHkeVr8fzlJjYEBk+5bhP39xsUL07kBV+tQ/V9O856R+1VStPxuHEiNChjn8lCtHygD5j29cGRQCM6FWjXhrn1jrOVo40/jlZc4MIQNVOMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsuYIv/En86Q7gl9oF4CKXQtbIECwJimKahC6a7MWAg=;
 b=XcOgOwnIHMkcjLa9Qq/G5w3id/w6qWKnEzPgWEMr5aHsDKg9RCJlmnYfw7j3taXEW45MtIbBeMFvcgjRQNxERpcynwhv0uxdXI8gcTKFHNG+fNIeBdaOmp/KZD6iLEMZX77/5mK51qLysfDU6tY7ilsmQ7KOfieD8MaAt9T7reQoGLT4qTIzGBeJm9L3yLHv32DrsoPCzQj/Tomgof7c991yT/rhIrgDJP0fDe1ESUxoDiHJq2IIx6pw4igdEIswNsnVZ8/43pJ2EYb23N1aA3JorPZLYD6Kyg4xHi9O162zm7H2SzSp6VMaavvz1ex7x6u3Z5mzAm2h2E1leLunCw==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 18:41:05 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%3]) with mapi id 15.21.0615.012; Tue, 17 Nov 2026
 18:41:05 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matti Moell <matti.moell@oss.qualcomm.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Peter Hilber <peter.hilber@oss.qualcomm.com>, Cornelia Huck
	<cohuck@redhat.com>, Demi Marie Obenour <demiobenour@gmail.com>, Manos
 Pitsidianakis <manos.pitsidianakis@linaro.org>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: RE: [PATCH v2] content: Reserve ID 52 for QPSFI device
Thread-Topic: [PATCH v2] content: Reserve ID 52 for QPSFI device
Thread-Index:
 AQHdYYZ8aLR7Neu2k0aXypdMBau4wrcIYNKAgAAHHACAAJKLAIAAKoiAgAAEoYCAABWGgIAATaoAgAANYYCAABBHAIAAB92wgAACUwCAAABL4IAABWgAgAAEdNCAAAMpgIAAZ3UAgAB00wCAAACjgIAA//sAgARLZACAAyIqAIALA5UAgAADiICAFKy7AIAAAqoQ
Date: Tue, 17 Nov 2026 18:41:05 +0000
Message-ID:
 <SJ0PR12MB6806CFA20D1EBF3DDD4AD8B0DC7B2@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org>
 <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
 <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
 <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com>
 <rltfxbrlfrqixbuevqknfake6hmcs62vjwgpk66tzvyswvfuej@6imyqn2npcby>
 <875wyo3557.fsf@redhat.com>
 <mkmnrjrkzjg6gdh4u3l6lib7ggovl7oiqwki76pkdboue2szdi@lhpg3ik33w7y>
 <4222d5ec-e44f-46a1-8a14-a2f3fb6d84d1@oss.qualcomm.com>
 <20261104094014-mutt-send-email-mst@kernel.org>
 <ce7dc70a-13d0-4c8b-9b0c-b46e9a0af54d@oss.qualcomm.com>
In-Reply-To: <ce7dc70a-13d0-4c8b-9b0c-b46e9a0af54d@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|DM6PR12MB4202:EE_
x-ms-office365-filtering-correlation-id: 3e04797a-3a0a-4fc6-ece0-08df44da56ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|38070700021|10067099003|11063799006|56012099006|4143699003|261026121527099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 WMs7HapLhklMuOPbuPyYGqNrUeNkWLT32wwJEjIDXWtKz8XZciFcY1niL7LqL4mTA1AcQpiZtA5YIYrbttWIgtZ53smxb+OJ3vu+c+T4PJ9cgqAjgGyoV4lRyxmuP+kIOoRwZHB0b9UnI4ZmjLNTjwehWC2MNbORRyU8BJ6S7O+H6wwJC14lMvSlyPKOlOJVCMLuUJY0QcCsZykdgIwEgrOCRnUEfYoa4l/SQyHNFgLOUa+zV4AkhJEJgPr5JjvZrCcVrIY+csyfMIZxLfjGf3GzyEB6pWCLo0dB3rcsaQ9U9N3SFJPlX6gKaHA4aobzCNufUVOHyFmk1q7KqIM1PEhywta1PWh8b9Fkiw9qbD8QlG2DnNX8gGVzITnJkIIRnS+TVKADrYjyoXV5byYhoBzAqw67e7Xjm4SXBvjvrO6hUQzI9SX/EXhJgbWr81SgFPIKoPARWhNIS+DzYPJeEWJTX2RtW2Ytk3czZO4zGS2kxfghf10Ln3vchQjr2cG/4NZmkBP/K7CYATahC3/sIYrYM9Y/gpxMlvUfGpeXBCKkBDFPiSTXRlvauNFEu35CCUMgjMjh8oFmdi/4hfgk7iY71RB7HfArbFkkUtaDHEAOd4wS2ZZmjGjpybJ2LJdNImO9d28zOKN1bUhYneM+T8KhWO3CGiIYakmKEzZN1Lk9KcVGXX9hqdq2GtBEPmVfjB2OegDksxo/8wKpO9TLrNQBHAIN9Lh8U6d+PT72Phk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7GxRfva2MtYMWmVRzAO9g6KqFNNVRJ1IgoqVW09eiBwYCzTS1+N6UhZnbRRa?=
 =?us-ascii?Q?1763IAqgB+cBaRmvv9zn1Zs6Od/kDKQGzmn8JHq61bixFfLhWZ4tWWSq/Rjx?=
 =?us-ascii?Q?ECL8Utf9F93LdGTZ3mOUaRANB6alCi85yeug7Zy24Arodmut5V5Q/qyMTzsX?=
 =?us-ascii?Q?0ES+fA8zoOT4tJ09pKzmoPwJplfKWPTo5Gb1d1pdXUlJ7o5Kwas9CkMisM4n?=
 =?us-ascii?Q?z+EAKOfupDj8YmSsBKa67O8Z967AEhMoDCyFDxWW7i//0hHvPJW2jaFl15Bq?=
 =?us-ascii?Q?L5QeTnHRhliMApZUSEWqRzxUHkt8xjh2BsAnsDlVzigpepKf3y2amrz9YVsi?=
 =?us-ascii?Q?Q45YC1qxorQ/KujkAVbW7Gjz4Ugtpzbzk1IDdGNDrV7NXC+I+eRRLoi2nWAv?=
 =?us-ascii?Q?KrtfL2CpvYxLlyOghQkAeYlMG3uDoYUAIsfw5tHnQwBm4LPoW40zYS7Ml80v?=
 =?us-ascii?Q?FSB4JpJgRgmpbs825BiS9aWMKpF5uBzQMlmwIKxeTqOMa5JbU50kGh8WGLjk?=
 =?us-ascii?Q?ToXripGXSTn1UM743Y9V8IdAdxr6J2lfKjoGg3cx5cCKg9ZNuR3x3DrlMB+Z?=
 =?us-ascii?Q?1q/XYJiMiAXAOyDNJ9pqWV5ViXxTTHCcQM5wBCh2/aMHQNstK04gxTh+u0ZY?=
 =?us-ascii?Q?Lv5iQqqkfRx6ZqGSOISQwD9RQpIrzVbaQE60shJCGV0nB29HkWklWSOJeCK8?=
 =?us-ascii?Q?UMrLXjUaGJsfvTPkpCs495QdaS5+k8lP37MuF7iIMiXTP76D7ZwokAM0OFGD?=
 =?us-ascii?Q?jvDCXISYUbZg4cQ9JPXuvgbLvda/rw+RXxTC5st9KGmyr/A6yQzct0Jl82dW?=
 =?us-ascii?Q?zh6jHxxBRTHjCNJJYBarWK6kctVtjA8iuO5Z9I4ulpYFM3p7U8gzeSS5mFne?=
 =?us-ascii?Q?IYh9zlgKbbI4a7rshSGiZIGueMoGNl7le4qJDX2HdfdAWKLm5XReqQiMGmEq?=
 =?us-ascii?Q?Hi57wOVw8ugM7mlt5i/D7PVzmIjVkZjzGfP4tQKG29EP0x6r++6eCgJ8CLUj?=
 =?us-ascii?Q?Egf79aSrAoCldvzBqLbpOaHLciT5GL5SntjVnN54ps4JPGuABjhcxMz76zp4?=
 =?us-ascii?Q?V/rtBcR4+wknosVGprCCgmDwK2Twb6n47bV6O/anremledFUgKCgbaHgQ9dV?=
 =?us-ascii?Q?UKSDBAPShfQ8uEUPnhtsLfC/sDPV6ltIhfbzSy9wE7HhT0zQJiWGBXW1AjCV?=
 =?us-ascii?Q?6QDX+MA0LXmlJTRlMwz8ZuIUoEFYMR9LSQ4/GBESXP1Nfsq9FMf9Hk1EFGum?=
 =?us-ascii?Q?lACON2ZoXP0/MtUl5/qQt2TLgSpYGeK3iIf6KthnnbFOsV59KX0lNcimRmYr?=
 =?us-ascii?Q?H1EHQLowYOCqP0ZYb1bjV9/G4s12v8Oexal+cYNvQWk+pxXWYgRC6J8ybyt2?=
 =?us-ascii?Q?4Gzc/qF9+aW6+MHaomt6mPQAdkDHGq0+OT/uYYCqWUXRsN6pxHlJ7f/nR6wE?=
 =?us-ascii?Q?kC9a77qv2dIP6r4G6RFBwt6EXx/4AF2qeRsWHqzbzeEIlJefihfB4DfiPJjn?=
 =?us-ascii?Q?30TOlNWlLZDM7fX6J/5cneN+GOVxtTr8XXC8sK1nClzNajCt1nu6ohGq7Y7e?=
 =?us-ascii?Q?K6VpiR05XFSF2aICeATyXm1tK+ASmKYQK6WB5VGE+OHt9s8EY5WHWCCJ8pvl?=
 =?us-ascii?Q?LsQall8CCtgMS5AurqAjlftLSJeHvuE5FdHZAC08pSxuFrdQFM7ymE7Lrrqs?=
 =?us-ascii?Q?vHjm+qwhLE9HTMd46Dca7Kz6qMBaQzqJFz8XMI4zQoU4h6Uk?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e04797a-3a0a-4fc6-ece0-08df44da56ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 18:41:05.7406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pmjdVcp9WbYz7WoZXYZ+16428GAQXzV/8ACKYIZ68euCRyXR9gI+vJ+xQgbVHX4IaOjGhG1tDYu56SXqtSvkTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202


> From: Matti Moell <matti.moell@oss.qualcomm.com>
> Sent: 18 November 2026 12:00 AM

> On 04/11/2026 15:46, Michael S. Tsirkin wrote:
> >
> > Ugh. Let's keep it simple. Reserve ID 52 as vendor specific, qualcom
> > can do what qualcom wants with a qualcom subsystem vendor id,
> > or just you know, use its own device/vendor ID.
> >
>=20
> Just for clarification, so you'd be fine with reserving ID 52 as
> "Qualcomm Subsystem"?
>=20
for me at least it is bit absurd to transport non virtio messages using vir=
tio transport.
it does not make any sense in virtio specification.
