Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B1017C77
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 04:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735187073; cv=fail; b=nOqmbROlwWQfEeTvzs+N1qjlca74cnWJkbvzp/r10a7IP3GOMy6wwYvEk7tYVjidlbngERMh3u5WosmM7HLHu/SBI/Sbq8UvSU7Gy3UMDXjRUY4uYG0su3nl4BjdlqB6Rb09uH8jHfZcEgcOorw2RGrrsCkJucnXRAeitbut30M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735187073; c=relaxed/simple;
	bh=oQDs/PBS3/Ywq6IgA3Ke+e484mQuGlBbAb//TkSLSPM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jcgJ6Jom5Qo7p5QPCCXqg9smycNsDGsm1t0/H94VAx/GSaPTyohIDhC7R/sCNKesaOteWpzCxiqeLFTXqAZ/RjYrQacq6Y9LpPj1298MeJHwzXrX1Zx+ax1iJA+FMIsHVboCNAO5zqKED+u0KxyAw1XvMOgwckPiMM15XetBzZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pLNe9okd; arc=fail smtp.client-ip=40.107.237.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pLNe9okd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlUI6j2xOBfd/IGHa10jP15tdd3+RpWq9WzLcnB+uUx7BWTSk8WPFbJ351+SXE/uXDnxl0jzmxdljR/qwgeoP+hkzuZxa/MWQXpI7TxOfJf6UzHsyLJJoeKvaAr0OE7m+7S+WTCjxkWAZ7rI7K2Un/6Bwwc7l93uIrHYJO28jF+SP9pDfGqavjf7Xfs/UvvvC2/0hye+SJiiOeCeJhRoBCLFe4J9htNv9yKRJj6rCrH3NLh591DsyRc4qzNIXKhUbcLl1N+Z1TjbnIvraCEmtq80e1+OLvFoodsQOvfmT0k2m67OMYEXSMu2GG/H2hYklymCQLa11Yn2mreNcVqwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQDs/PBS3/Ywq6IgA3Ke+e484mQuGlBbAb//TkSLSPM=;
 b=AjsRgK/qBG9hNByNHb2ZeAG0SlJy8dZ2xJegpsggqbyzTd/kmB1NUVKph8z/QoQLltqg6/bruWRwNASHa6i+QwjACnPJyYhjh1Qk2RMhjKJiC8rzpo/43ND3L4WEfzqfz0kzGeqQmYf8+tqu506ug55kBM6LWqtXE8D+xdGx/M9lU0QJ0WCl2MtQw0q33AUvkOyS4x4Lu+MRd53EnPBtqBaNPf5XQFRBTUltmgQOkmV/FnQ7yKEOS/bC8n7lrj2MbgGRbYDrtnReROAKV66/BqoFdQzeK7/PIoKJP8cvRwt2FOFSdAi2GgsWdcacDHa6uqNb0bmf6xrzPTa0kLrBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQDs/PBS3/Ywq6IgA3Ke+e484mQuGlBbAb//TkSLSPM=;
 b=pLNe9okdUwMe4Oy48pPRD2j/CTeq0fF4omSxX0mNr8L3BeWN8hgQ7U/6sRLw783OSeuOSmmEZUCBxTNmJMjx0VIzUzJIEi6RDyeTk75u0qPyVWntXfGtRC+K+S1AeJHcOc9a3J/NaXqxGz5MyFLsKfm4o9dmlPuchuEwr9n/FcKt0/vCnJdpUsWnvL7ApUc/Z9V4XlCck7jm1lRshxT7+SFtGcl8WOvyaJIRsWKn4gU3w1+z2W7gSTbR2UO33GgRc2IAy6asF2NfiUn28lOzFU+xf0JWN+Bx0PlA0xCl04QW70zabJ1l51RMe0ojlGT56eo2rXNdr6iI5yRXZDjRHg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8293.15; Thu, 26 Dec 2024 04:24:23 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8272.013; Thu, 26 Dec 2024
 04:24:23 +0000
From: Parav Pandit <parav@nvidia.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	"devel@daynix.com" <devel@daynix.com>
Subject: RE: [PATCH] virtio-net: Change num_buffers value
Thread-Topic: [PATCH] virtio-net: Change num_buffers value
Thread-Index:
 AQHbVpVXJB3eBmv4ZEexViKG9GakbbL2frMAgAABQgCAAVHo8IAAFAuAgAACvPCAAANVAIAAAUMA
Date: Thu, 26 Dec 2024 04:24:23 +0000
Message-ID:
 <CY8PR12MB7195520E85F38BB409949868DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241225-buffers-v1-1-712e839e8ad1@daynix.com>
 <CY8PR12MB7195705CAFA8759355685905DC0C2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <24facd94-87b2-45d1-97ca-851595e8cf41@daynix.com>
 <CY8PR12MB7195C2A20025389351D15B8DDC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <dcb6ad57-5d36-40f8-b161-7570dacdea4a@daynix.com>
 <CY8PR12MB7195C321CF982819C5393358DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <11feddcd-464a-4697-8462-32c165a7df49@daynix.com>
In-Reply-To: <11feddcd-464a-4697-8462-32c165a7df49@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM4PR12MB6351:EE_
x-ms-office365-filtering-correlation-id: 74b3f902-6c27-4271-bf01-08dd25652d08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KAd638O0Gc55Hnkugq8897zcuALLPLoSBHamAtstjKP5VqRc5kdvBsCb2oMQ?=
 =?us-ascii?Q?6b0UwCIp7/BXY/AWAEQaNpNAIujGjGrwLPvcuOI95HqnzUzE77dgY3QmNSvi?=
 =?us-ascii?Q?zuX0wrrxwIaumsPnnF9M+nhGsBSLYaHUI0tTUdURfC8G5MjNEuLixNoZBzfU?=
 =?us-ascii?Q?4Bb692YJfrRmvFuKWmBvhK4PWbxmU6yaGzkKBbraulqbrl6aVPgU2ZRFBA+Q?=
 =?us-ascii?Q?fE07Nlel4WWVsHh/zNUO6E1axyG2YQOyXp8TKfp99USsPQnTgyNmCZvFvKgn?=
 =?us-ascii?Q?0qHjds+vDPpRZIGRr/aAyJt4rKWe/em4N7iGmqbWhCirIV0+8YYa6wM3KSan?=
 =?us-ascii?Q?VPKurHEf/KINNQmR1acqP3EGBCVwTMSiIAQMtklASB8QRd8zZA3oIeHeRNwZ?=
 =?us-ascii?Q?424/x59nA2eIfKxCF4gbPo4DjOvOD4ITprS3jhM9wfIAtT0IO8o4eyicqQOF?=
 =?us-ascii?Q?gvT9HqqR0wmsEF7QFmJnXX3NsLX6iPQiOqgNkW6k+JBAjYuyTU74dyi6O9Nz?=
 =?us-ascii?Q?msn1PwX0ZjfhknfY4dvb+xnjhMRGFVO9nrqr9QEfxP5Xy/VEWTGHqP05Pvic?=
 =?us-ascii?Q?3iR6syafzyyE6ku3FZDuDHYbX19r7d2I2SMjB5pnhRcqPRQbttFY6Ccsb9TF?=
 =?us-ascii?Q?/IRTLRRJvbdEKG4pALL9KDgrOOvLzm/Dr/IscgFkQpn+PjRZx0csTZkIzJA9?=
 =?us-ascii?Q?zR40YGS2M3RH3oltMlOkgIWAUec7fBBZNTYFe1+HNDdL9JOSfUrwYhnOdx1/?=
 =?us-ascii?Q?VtVI/30EuuwuHQvGqgFoVC+smZRSX/rXdzlwTSALkWdqvqtZX/eOtZdkln6+?=
 =?us-ascii?Q?epd1o0ILeBLnIcyMPWWFQhT9fLyzrxU42mJOw9pPg+34Hrg40llXyUOtt5XX?=
 =?us-ascii?Q?PSK6jB0s7eYC1bFJPgrGtt+HtnJiuWYozHA7F7KXnLZnYCyABWXYwJXzTdIY?=
 =?us-ascii?Q?HjWuQi9+/W60bWmYB4yJlX4Xi7g+aYK3HbjQMmk+RI17/sAHXOCuZZyfMQnG?=
 =?us-ascii?Q?LkLHeh/tznL6D/7k0G2/Rwq7brckX2PV+R6752XAO+zJZnOPO+VIz7NEh7A9?=
 =?us-ascii?Q?42XgBmutL4g4mzxnAClIgNWSkwg15315cHIw2zsgY+lo2QRSFihc2eL+YVFP?=
 =?us-ascii?Q?RCjAXqTTNLauXXhgabwGAQTqoU9LA/LHWJh0wQnprdkiU6wl2RQwyxAheViH?=
 =?us-ascii?Q?lVeNTo+SSZglpSFEhC9CKyqjZkNdKjObY2i/ZnZ4s19TKDF3pAVGkYa8Rzrf?=
 =?us-ascii?Q?cyeSZe4e3dlKS76qgkQcdvEuF8wyXGJGvEhARBVNmc0eWL9IuQdtRkM46ymn?=
 =?us-ascii?Q?789qPlPEJ7KEQmyM6hKWv8tEtW+oMpcX40R6/J9gr3uVq/raHOZScwFvksfA?=
 =?us-ascii?Q?lktZCJpMsEln68k9BbVUMxl/21cyMtCiv4tJWIOyo+USi9tNOjjrjlbWpeTH?=
 =?us-ascii?Q?YgBe9P5avNU05A7LIdx2Cw3Is5hWV23D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?g46FBnNughQpIrAIH61SEyRfGQnV0iGs3p8oDcoMEqrVyreSAYvUCnsOy8Eq?=
 =?us-ascii?Q?qsPF5WxWaaPKLaAT6Yz8v9PpEANRI7pCXVG5yHU1MU9//5fy2hVOuS0vz9j7?=
 =?us-ascii?Q?z9IHPNWv+yglvv8YWahe8LDJanfu95TirrAo7DAzEBqGUDWxt0PFR9zO/A14?=
 =?us-ascii?Q?cPRKoNub7YbdHE+Xk20pQr8lGX/OTHElWY3W7MzQ6KsSEVD1juWQ++53qi6N?=
 =?us-ascii?Q?FUXSUjD5zEuiF8MO817bupSXHFyPZ0K+Y8SVrgX6kCYMYtrA8DeVKoRsgDva?=
 =?us-ascii?Q?ZDwA8egp6X4NKOHOCAivU+V/ZxNzNw7UZUWBip+gf4TsshVcLCZTrSwRC9Uw?=
 =?us-ascii?Q?gU+4ka6Vzl+a+YjcaFfJfyNwNOglalt0Nb9+idcLYyzjT4Y8c0ZFzDqQvbPS?=
 =?us-ascii?Q?N3ZPRfjSJiBycY7nAGBPeZRYcC7NReghaFgOMhow340WLe941cz2Ay8sQUFd?=
 =?us-ascii?Q?fTyxeLqyVPGpHATrAzuPJcffixcGIaMQr+SzBAoHiln68YLddQ2TvtkJW0cl?=
 =?us-ascii?Q?XF+KrxUWEsWbiuFLxsoAkVWAjx0kaMJWS/AEeAlGSMX2DuqoHWjjAmeM1JgY?=
 =?us-ascii?Q?xWcdrJEvvvOzIpknkxU6V8L3XZ/isvWvLzvkhVfce9iD0gqIAKG/NG987Ufz?=
 =?us-ascii?Q?KJjJHZT9PHfP0zm+/nGvd/JSAwBSF4H7PY9V+Q9fbj/qWwF+EhB19q2/04SU?=
 =?us-ascii?Q?jQiZ4/XwRPHuJQzqaqLuMen9UugqduZiy4aQBJPUJHa+lOZZWKriE3qYKItK?=
 =?us-ascii?Q?8qiHn0sCybf/7jK8PvfrbQqM5OQd1RrDZIOByn0vb4iS/7nulcUGauY86edT?=
 =?us-ascii?Q?7pfYt/Lcs3tFIEjHpkUGqA1RIc4oDWvN6KnINLfv+Srf/abN3eVv1x+g3T+G?=
 =?us-ascii?Q?avkik3jNoQKHL4cTh91p5g+C2K2XMUHGj/cYIxWs49XmAh0Y/mEM8l/JOT86?=
 =?us-ascii?Q?Nq455rLlZYJkMNiwh31n328ghLmXQC8hPUA1LA8cHgUOPiX3HGuJkhfh3P37?=
 =?us-ascii?Q?a8MqgPAXLTg1WS7DBH0SCfgX0UmOhjpNe0ycGaAH9qC93hgNeu9Nz9rfDbYT?=
 =?us-ascii?Q?0M5SQzqGthww13E8Cqb0xRdSEYG0126sUSGzKgYQ5JcZ2FINleggiAqX3h0W?=
 =?us-ascii?Q?92TUnjB4QZziHHZ7WLMKgdtChKLbnYObPVYdYgiMZOvwOLjN+xTH9wr9vXBu?=
 =?us-ascii?Q?WDtc9psdHNLNnWg1Hj868Zm/yM31iXiwWrt/83oxQdYQylLS33V9ekiQbEC5?=
 =?us-ascii?Q?KOm0FtgZw5wGsQijiZc34SbQzkHrwVboINxca5T/qqRHZgVpq3mzxgtsGTZe?=
 =?us-ascii?Q?YOMLIbQVIw/TrcYt528Je93OnHEK0uSGcYRHQ8mIfXt9oAsIUiUwwggouXfc?=
 =?us-ascii?Q?EpMaNkduzNs6kUV+3Yt0r/657GEnG9L3Vl9UvgsFzyxayBwZfyhooeIVftJL?=
 =?us-ascii?Q?7vZImNu6ZetilOxiIhVON5dbThO6pmqMPCKRJa/tO8q/JcOVzEUzBVVnXJsE?=
 =?us-ascii?Q?FyIKTguQZG09JLS1gi4qLogDWVa6fO90Eth5fLGe4p2RPAAf7FzJnCAKimqq?=
 =?us-ascii?Q?HSzfZQ0DL5HucJz7xBg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b3f902-6c27-4271-bf01-08dd25652d08
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2024 04:24:23.3439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KRj0BoozWaH1NWEvdY7GLyjuPXRvXzeIw6DMqgAgUPdkaQLlbVzGZQwWPJ8UjAeFmUfWB8ALF2mjb5Bk1X9z3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6351



> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> Sent: Thursday, December 26, 2024 9:44 AM
>=20
> On 2024/12/26 13:08, Parav Pandit wrote:
> >
> >> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> Sent: Thursday, December 26, 2024 9:22 AM
> >> To: Parav Pandit <parav@nvidia.com>; virtio-comment@lists.linux.dev
> >> Cc: Michael S. Tsirkin <mst@redhat.com>; Jason Wang
> >> <jasowang@redhat.com>; devel@daynix.com
> >> Subject: Re: [PATCH] virtio-net: Change num_buffers value
> >>
> >> On 2024/12/26 11:50, Parav Pandit wrote:
> >>>
> >>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>> Sent: Wednesday, December 25, 2024 12:01 PM
> >>>>
> >>>> On 2024/12/25 15:28, Parav Pandit wrote:
> >>>>>
> >>>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>>>> Sent: Wednesday, December 25, 2024 11:52 AM
> >>>>>>
> >>>>>> Linux's vhost_net and QEMU sets num_buffers to zero when
> >>>>>> VIRTIO_NET_F_MRG_RXBUF is not negotiated. Change the
> >>>>>> specification to reflect this reality.
> >>>>>>
> >>>>> Please fix the vhost_net and QEMU to reflect the specification
> >>>>> which clearly
> >>>> writes num_buffers must be set to 1.
> >>>>> (the last hunk of this patch).
> >>>>> One cannot suddenly change what was written in the device spec as
> >> 'must'
> >>>> requirement.
> >>>>>
> >>>>
> >>>> This proposal is based on the discussion happened during the
> >>>> vhost_net
> >>>> development:
> >>>>
> >>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor
> >>
> %2F&data=3D05%7C02%7Cparav%40nvidia.com%7C649e957573c04ca299a808
> dd2563b
> >>
> 763%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638707832422
> 610980%7
> >>
> CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMD
> AwMCIsIl
> >>
> AiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
> a=3Dbab
> >>
> vvZhhh8eCZAsF%2BMv4W0LjkD5KMTZn6OA4%2FzIMOAE%3D&reserved=3D0
> >>>>
> >>
> e.kernel.org%2Fall%2FCACGkMEt0spn59oLyoCwcJDdLeYUEibePF7gppxdVX1Y
> >> vmAr
> >>>>
> >>
> 72Q%40mail.gmail.com%2F&data=3D05%7C02%7Cparav%40nvidia.com%7C227
> >> ecfe28
> >>>>
> >>
> 0c04c7fbe0708dd2560ae73%7C43083d15727340c1b7db39efd9ccc17a%7C0%
> >> 7C0%7C
> >>>>
> >>
> 638707819369398017%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiO
> >> nRydWUsIl
> >>>>
> >>
> YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D
> >> %7C
> >>>>
> >>
> 0%7C%7C%7C&sdata=3DJcJuXC0tHF%2BQwCjrpwDTnEWRrITD0hXwB3cTkwmZ
> >> qOk%3D&res
> >>>> erved=3D0
> >>>>
> >>>> The reasoning here is that vhost_net and QEMU set num_buffers to
> >>>> zero for years so changing it is more risky.
> >>> Less risky for the device or the driver?
> >>
> >> For the driver.
> >>
> >
> >>> Your response implies for the device, but do not understand how it
> >>> is less
> >> risky for the consumer of the field (driver).
> >>
> >> If there is a driver that reads the field, such a driver is likely to
> >> expect zero because the two most popular implementations sets the fiel=
d
> to zero.
> >>
> > Why would driver expect zero there when spec said 1?
> > It can only work if the driver ignored the field.
> >
> >>> If the field was never read by all the drivers, it is better to
> >>> modify the spec
> >> to say following in the requirements section:
> >>> 1. device MAY set any value, or MAY NOT event set it.
> >>> 2. device SHOULD NOT set num_buffers.
> >>> 3. driver MUST ignore num_buffers when VIRTIO_NET_F_MRG_RXBUF is
> >> not negotiated.
> >>>
> >>> For the real PCI devices, this actually can save the sparse DMA
> >>> occurring on
> >> rx packet.
> >>> (telling 0 forces the device to do the DMA for the field that driver
> ignores).
> >>>
> >>> Also please change the motivation in the commit log to indicates
> >>> that dpdk
> >> pmd, freebsd, windows, Linux, QNX drivers has never read/honored the
> >> field num_buffers when VIRTIO_NET_F_MRG_RXBUF is not negotiated.
> >>> Hence, make it optional for the device to set it.
> >>>
> >>> Please work with those open and closed source driver's maintainers
> >>> to get
> >> their ACK on non_usage by the driver.
> >>>
> >>> This change will help to save the PCI DMA.
> >>
> >> I don't think it will save the DMA because it is at middle of buffer.
> >>
> > Its part of the vnet hdr writing process. So its slightly lighter to no=
t write in
> simple cases.
> > How a device does DMA is upto the device on splitting the buffer.
> >
> > And if it does not save DMA, I don't see the motivation.
> > The driver is working with num_buffers=3D1 and num_buffers=3D0.
> > So what are we trying to save?
> > Aligning the spec to some behavior to one device implementation makes
> other device implementations non compliant to the spec anyway.
> > So the risk part is not clear to me.
>=20
>=20
> I'm comparing the possibility that there is a driver that breaks with
> num_buffers=3D1 or one that breaks with num_buffers=3D0.
>=20
> When comparing these, it is more likely that there is a driver that break=
s with
> num_buffers=3D1.=20
Why?
And if so, such driver should be fixed which didn't follow the spec for 10+=
 years?

What will you do if an automotive product driver has stringent check to fai=
l the pkt if num_buffers !=3D 1?
Please get the ack of all.

> Most drivers should have been tested with vhost_net or
> QEMU=20
Please get the ack from the maintainers that driver has ignored the field.
At that point this field to be marked as don't_care/ignored field instead o=
f forcing 0 or 1.

> so they should work with num_buffers=3D0, but they may not be tested
> and break with num_buffers=3D1.
This is hypothetical. Please get the enough data.
We have PCI devices that do num_buffers=3D1 and tested with Linux, dpdk pmd=
, Windows drivers without issues on num_buffers.
