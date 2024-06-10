Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7451E4A0
	for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 15:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032335; cv=fail; b=t5O24ZyakVMLpc/YZBMDuwzYZMvhfsApPKlIbdM6JENLYb2fd20ezXIKFymxYcyT1wSE3SrPG65e6tvNJPSUfrr2lILYopNnwez/BwA9n76Gigl3R1JsuDwNZEZShpISt728OGBI7EHfxNWBENc4bOEybHsXbUyYwLk7pGTW5Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032335; c=relaxed/simple;
	bh=bHtcYU4c7rCYOlxvbC8c7tUlXtAgDYPQTaxwqhZzyVA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pN2/dcfP2Ak/MhXTcfBro6uVrqmMvRN/UmtoTFqv+hIcktKqRG/fwyZZQJmDrV+Lgr0fkakhtoupv+Evuy+96uKBh+ZfJIDLwN6aBanPFhh4+jBhe6iavBekfjfaRM0VGZYY08tLKLfwlxWYtg8kfuL7eAOL+UUnVZ8+7D3AzSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QWKnobp8; arc=fail smtp.client-ip=40.107.100.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QWKnobp8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7yUkTqpCYfNc6rVD3Szu2O8NV2Ac2IIbFZ6VJc3+0c5j/nB75Xs8DzR/aJlPxmW8EESryeGIIrcI1hPi1nyLZBCn8VDxA9Q+9tLcIQYf9ZYu381PwnrB5Bsqr+KniHzHZZGemtVWJBPsYAsvwGtL58Ti4eOiLPNpVVy7mJ+UyapaJHBCg95axvhXByozl1+veW1bNRi+k2HNJCdHYjVc+m7B0knEdrpxsaGyM8QKk/lgWzwiMlgpfacFYEB/dEIUwnJHFJsdSlgxAi5ROQV05J5w/lRlhwynmlX97hloylJMFLA7ghKWU58FiFiAqaChmiyRB06NPMfAeTA7pBAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRbUa6immv1qCgWHkkwAqmq5btQR1nW9uvy4I3zpBxQ=;
 b=XjDfcabpaZhr+U5LlSRg25mB+scAEqUCprQKbhOPQ4Oj3zdsIStTvWvbCUCw/+dZRGr8mu8xZaQF+/n32Zuub3AOLaxgw0YHWqdwJ51NddZXifC88tpYMaimXL6aIos7NLbii2cHUvrW/SmObUnpQCN3HCEYHSyKf6kGfLjQlg90qpLvwKOjbakqkRjJmpDy1lWwmZrRJIU+Vm2Zn6fppRCfOirLPisBhDL7ZBcatwQWp8m5XCmmQ0sMPoII8DQcKusBIa/uyDEDIjzvpMPA9YQLznt3XvIeqZhdUsC5OBnHvvDDKaK/Du3js0JNaD28ltUh0jl6AjeNyBTe5XFiRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRbUa6immv1qCgWHkkwAqmq5btQR1nW9uvy4I3zpBxQ=;
 b=QWKnobp89EKCrYSODvUdRu3l4cuuZcXSPVN7xgMSUAUY5zclygZBVFOvKK3Kzhz3MyfrhsQtQLowWbEm0uuce8V0UUmCoQ578Ar/XENuKQFTbe2Knl3z2sGdB6Xup19xwDmH0BCdtnTq0QqryVQ++RFRb4p9IVJJfk/rIP1DmikkLBO2QpuXvlUKBuk4O3S1rVZnWQ9EnOBk2yRkAqonqPM6eTabsPiurx6ND77wZXqGAg7ZTMTRpt4Boq3becZECqYm/fvuBSqtLf1n1Uy2+EWSrz3ESP7Nw2BEyBiyYDWYapmduTVY4RKJgOBmfDK8rbEEo2Z31clKyricgw4ZqQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by PH7PR12MB6636.namprd12.prod.outlook.com (2603:10b6:510:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 15:12:05 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 15:12:05 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>
CC: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Jason Wang
	<jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: RE: [PATCH v5] virtio-net: clarify coalescing parameters settings
Thread-Topic: [PATCH v5] virtio-net: clarify coalescing parameters settings
Thread-Index:
 AQHasLoaN9ph3vhoUUGX8SYFd1DUAbG8yd8AgABtagCAA8+PAIAADeSAgAAUwgCAAANTUA==
Date: Mon, 10 Jun 2024 15:12:05 +0000
Message-ID:
 <PH0PR12MB548163F53BA81AF6507CB399DCC62@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240607220246.3213607c.pasic@linux.ibm.com>
 <1717814062.4461155-1-hengqi@linux.alibaba.com>
 <20240610144602.57a04723.pasic@linux.ibm.com>
 <1718026545.7557275-2-hengqi@linux.alibaba.com>
 <20240610104618-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240610104618-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB6636:EE_
x-ms-office365-filtering-correlation-id: ace1f826-fc52-4409-1d94-08dc895fb061
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?k+leGxkKCHv4t7WtRHm2fqXHqCCle++JLo3jerAKCIKo/qipomn8jK8CQs3E?=
 =?us-ascii?Q?VoQoiMyRN3jBeOl9mcqiTR17SE5md6GplTLEIGRkjHwiMIj7GeuUIXUbJ24T?=
 =?us-ascii?Q?KjBGBoFD4hAVwCZmKhpvnbYiKqMufv4wBswJn6aeTH3zwsD4B52JgLNAdo5G?=
 =?us-ascii?Q?UEqVf08js5dqO7HvcDagw3bVciW5R1el8fgFzfvD1IejbReZ5Jb7Z+FEFbd2?=
 =?us-ascii?Q?PgK3iJzVkv3bosf6A5XNyGnd2qbEOPauo2m+ujNJhFwGpAt/3Lq5v6FiChcp?=
 =?us-ascii?Q?/bglTDKkKUdmk+Z5lWxzm4r0Q5lzEWlgTFeKc/6NuDWW9toUnl1Mqu7pb40R?=
 =?us-ascii?Q?4jERug9Km5pGf2zdaGRx2aJ1C8X4p0p6OY6SwPS1FjJS4rGC6MCkTLX7FNXf?=
 =?us-ascii?Q?LmrZiDy+GEBOZWlSCxSkdCrZ3HdY+08mTNiQ8lxXvf21viz30G9Mx86ssZxI?=
 =?us-ascii?Q?D4WG5FhkEP1ARKX6vDcKMOmx9T67ZEwbeOhh3zcMMMr+rYEzfIRqSJEpRa4A?=
 =?us-ascii?Q?r3KFRFF8rbIxI9uf7cP/athIznSdmbzs18u1dwm7jYsqd7bQ+86Ydm2jmxPl?=
 =?us-ascii?Q?FIQdGhbPv/Mj0QOln5UXPC+zia8CjC/dyoise5rlw+5/ovAp2yCk1IuIuYhM?=
 =?us-ascii?Q?h/kacRhtv+hh4Ym4GP/vAnrV+kqovgphjPpHEyvKaiAL9SLml8BeNgZXvJjw?=
 =?us-ascii?Q?wp0fZkoFsx1gwAJ8LM8MHgSgCk7fTsw16XM3l3TrfdgEvH/5GqPaihSFlEh8?=
 =?us-ascii?Q?62+vNx4HQIO/RBWjj/6MrxcU5xVxGkbuEdK9IVyNQ62MlK4HLY3oSJ6Bx9jc?=
 =?us-ascii?Q?qM5Pu0tKjLI5dQ8Z3WdJDWnZb0jG2flXWMN8mIcNPHOFqLXMP9cpGX55ar0O?=
 =?us-ascii?Q?hmByAwDqhATELGcu/cp4mKCunuW4Uetam5Gr4+3e5OvtUF+okT0cOXNCF1zZ?=
 =?us-ascii?Q?rXFZBYbeZqiV0+IqsEZBePT0MnKqjTCU052TDq1YE/ODDbNmmGXrQzbK4nww?=
 =?us-ascii?Q?zTr3qD2Oy5XI++yJZ3xzw8qA83yfGmlGhBMWDlTkuzkJ/Wxt3gggyCCDw7ix?=
 =?us-ascii?Q?f4zSfYSvhITOV0dfQ2Klefm4DEfhoS9+SPl5m9b7auSZAt/U6cwlkg5kJgwm?=
 =?us-ascii?Q?HEBuroxAfcrC9pi760jXlKwfDnzuyNwOp3ayZIEfQsRAJyla1rGYiyIYXcp6?=
 =?us-ascii?Q?EJH79L28p6BkYqWHzsd/TCDPIuNn/RcOnUlKasP4Uaoy6rAb3eB6x0qd4NRw?=
 =?us-ascii?Q?0uETbhh8g8t3bGy9D7ZA+69fut2YbFgLmSgfkjlnTpo//NBproGUYE1DXXtZ?=
 =?us-ascii?Q?eqiS3a0Eter8H57MadnBO5OU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GWb8xJ5hRn27P9AtWGO9rVBOm0szvi54GBUjrUJMSrVvVaWD9tuC4JWm+l9d?=
 =?us-ascii?Q?J08zkiGkJZGh+GeX4UKCupS/C+btoLrqMrQ9tX5U38LVWnYsJ39VTud+afRf?=
 =?us-ascii?Q?UWiqkCjsnkjAiITyhjvnd/GPSPvLF5O6tg2AKLUtNZbw745UB5VSLgoaywjW?=
 =?us-ascii?Q?8ROnkzH+BZb5HDCE9XQxy+fWalItwazdXMcGlQOOvi8HhcS4sIZKLlIlY7+8?=
 =?us-ascii?Q?XoOMFZWzmK0eJ2vbFcRhW7ZsO4Zsr4PworNTl8BO0NimJC+XAGn+UL69eJQo?=
 =?us-ascii?Q?/L1ZgFU34+ya1cs9qTLbXTATzldQZduihGSfVwooqaZGe9YndJE3SjX8O2GI?=
 =?us-ascii?Q?SJMhB6BYz/las3JhoVtfE2nXDoFzK8K62ApjVUEY3813yozvX3rGq1FHEOpU?=
 =?us-ascii?Q?Q8Oc1oR2DxjaQUDbrz97qHbQz8tHiNiMJZ/hkZ+1QGVOqjEeu+CpUPLZAqpy?=
 =?us-ascii?Q?j293WX9/EPHJiPibBQa29QvMmH4m6HtAN06tKEkwT1i9e6HtxsQ6qhpxj/OY?=
 =?us-ascii?Q?CnUI5DdQnAwSCCejtEI01t9xWbPkcX1crAHo4EHOu4GHDr+zKPO/EO8aShp+?=
 =?us-ascii?Q?mBe4oFJ+WQxb34lGPHNMqkd+UobCarTdXZDjz5xekJ2QQP5qqXyWWllJr7Of?=
 =?us-ascii?Q?jmWmxZTJmOw/MsJju/RjjGsI75Ieqa0jkiFZk+9M1upPQdzJchMft9H5kx0Y?=
 =?us-ascii?Q?BK4gSP4Jm8ipf3G/QCEQm4rzCeP/gMUEnQLW8SFq1HMCoDw0XLtGUwlSeibZ?=
 =?us-ascii?Q?BzxnL2iVi43/gtK98MthU0tacFRMDxbPQideVxD++3LX0YgKHdzUOBEKXAKo?=
 =?us-ascii?Q?GfUma88Tk72bMZpYHO2S7yEJvjiZIrse0Ifx/fQedyWpnYyuf1Gy5EkawzFI?=
 =?us-ascii?Q?HaX4M/xPxax93rt3T9nhwiUgyXG+vDOnQCkphkhw8bHUwkxoMQ02bEoQEo8w?=
 =?us-ascii?Q?nySqWDMM8bNt4tIbxSsTeU2rh70z7zBfEZRfuizNgSNMg3wmfY4LakBkePlW?=
 =?us-ascii?Q?50I3EQGf2H0jaVuDm9BbQbWsK4mUi3UMuvblR1roFUx+kxdG5rc9R6OIIURT?=
 =?us-ascii?Q?0Vq5SvRx7Yxm2meqit+kK85dtQKk+oQpsIDOG0+dj60LvONGSNTDSgSFiQu3?=
 =?us-ascii?Q?44wJ+mtCK4Km/Pl0O6z8czPKfBHxVB8xC6NAhXS0yBTPfZjQBUrrpMNmyAiO?=
 =?us-ascii?Q?/gIIvYDy/AK67gdovEKfWke0g+0XekJ6SpH6NrPErmZJ0y+JqMc15FOTjzWr?=
 =?us-ascii?Q?dlYA+DhzpwoVSiTi/fBkAPHAUMVBMQ21Y9SnFBmi7UWD+68PNCFMbPHb3R8t?=
 =?us-ascii?Q?TlKEFDClYCISHhUo/z+J6P3cmpv78Asc+buauM0GSmGHQPGUnXlNWWOQsLNS?=
 =?us-ascii?Q?qd8rhX5oM4pMhSpCIUM5VmDROylO7s+LoBeptCOjop3Cv7Rtq6o3fRvDRB9L?=
 =?us-ascii?Q?ImVs2zTBN+h+EsgilsvlmPTky6FHh0oJmOqcF8qi0INZmkNlGrvjz57bY0f8?=
 =?us-ascii?Q?sJY41vfS5+ug2IYyxPLJfaOgsPqMHeFNoCQod8VbS2kXmgxNBVIM4O6LXRwo?=
 =?us-ascii?Q?MEM5B9HCNsU2VOfnwxO/DnaukqI7oMpjeS7AfoB8js5dJIygyK3cwpoVHPGo?=
 =?us-ascii?Q?9wGicWok4IsE4QxO5Gme9UM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace1f826-fc52-4409-1d94-08dc895fb061
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 15:12:05.3349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hn10huIY4Gb4eBUZCZlfVJqjrxNMqVY5KVziuy68rFSKKUWwTuMM7qxPKawmXAwBu0YffIRVyd72ZctdAZBubQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6636


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, June 10, 2024 8:20 PM
>=20
> On Mon, Jun 10, 2024 at 09:35:45PM +0800, Heng Qi wrote:
> > On Mon, 10 Jun 2024 14:46:02 +0200, Halil Pasic <pasic@linux.ibm.com>
> wrote:
> > > On Sat, 8 Jun 2024 10:34:22 +0800
> > > Heng Qi <hengqi@linux.alibaba.com> wrote:
> > >
> > > > On Fri, 7 Jun 2024 22:02:46 +0200, Halil Pasic <pasic@linux.ibm.com=
>
> wrote:
> > > > > On Tue, 28 May 2024 12:47:02 +0800 Heng Qi
> > > > > <hengqi@linux.alibaba.com> wrote:
> > > > >
> > > > > > The device can set any initial coalescing parameters (0 or
> > > > > > non-zero) for the receive/send queue before the setting
> > > > > > command is executed, not just 0, enhancing device performance e=
ven
> without DIM enabled.
> > > > > >
> > > > > > So we need to clarify descriptions that don't fit the behavior.
> > > > >
> > > > > Sorry I'm late to the party -- again! Just for my understanding:
> > > > > how/why is this a clarification and not just a (basically incompa=
tible)
> change?
> > > >
> > > > In my opinion, "clarification" means that something may have been
> > > > described incorrectly before, and we now need to discuss, explain
> > > > clearly, and correct the possibly incorrect description.
> > > >
> > >
> > > I figure the difference in perceived semantics of the word
> > > "clarification" is at the root of my confusion. Let us have a look
> > > at
> > > https://dictionary.cambridge.org/de/worterbuch/englisch/clarificatio
> > > n
> > >
> > > According to my understanding a "clarification", while an
> > > improvement in ease of understanding and/or decrease of ambiguity
> > > (possibly to no ambiguity at all) implies that what receiving a
> > > clarification is not outright wrong.
> > >
> > > When rectifying something that is outright incorrect or wrong, I
> > > would refer to that with words like "correction", "fix", "erratum"
> > > or "corrigendum".
> > >
> > > > >
> > > > > I mean if I read this correctly, before the driver had the
> > > > > guaranty that if the parameters are not set by the driver,
> > > > > negotiating the feature does not introduce any coalescing. After
> > > > > this in theory the device could just pick some max value and
> > > > > potentially introduce maximal latency in certain scenarios.
> > > >
> > > > "maximum latency" also means "throughput improvement".
> > > >
> > >
> > > Under certain assumptions. But not necessarily. Again my concern is
> > > mostly the type of change. The virtio standard maintain a revision
> > > history appendix, and I would like to avoid the nature of this
> > > change being misrepresented there. If Connie and/or Michael think it
> > > is worth fixing, I believe it can be fixed with an editorial change.
> > >
> > > AFAIU VIRTIO_NET_F_NOTF_COAL and VIRTIO_NET_F_VQ_NOTF_COAL
> are about
> > > to land with virtio-1.3, i.e. there is no released/standardized
> > > virtio version where the "initialize to 0" is released. In that
> > > sense it looks like we are still on time to change this. But I am
> > > not 100% certain. In any case I don't think this as a huge impact
> > > and I'm fine going ahead with the change.
> >
> > Sorry for the late reply, I'm on vacation.
> >
> > I agree with this, and I prefer to release this patch as a correction
> > for
> > virtio1.3 instead of a new patch for virtio1.4, because if devices
> > support moderation coalescing based on virtio1.3, and after virtio1.4
> > is released, these devices need to be updated again for a more reasonab=
le
> coalescing parameters.

Heng's patch is bringing only the relaxation to the device that it can have=
 nonzero value on reset.

I don't have strong opinion either way.
Either approach looks fine to me as it does not seem to break any functiona=
lity for driver and device.
It only improves the performance when driver has not set them.

'Clarify' to 'correct' or 'fix' subject line would have been obviously bett=
er as Pasic Halil mentioned, but probably while merging the patch, it can b=
e corrected.

> >
> > Cornelia and Michael, what do you think?
>=20
> The TC is just voting to start the public review process.
> We can defer that by a couple more weeks if there is a known issue to add=
ress.
>=20
> For that I expect we want a final patch  and a couple of acks on list fro=
m TC
> members by end of the ballot, June 13.
>=20
>=20
>=20
> > >
> > > > >
> > > > > I understand that it is probably in the best interest of the
> > > > > devices to not pick stupid defaults. But it is also probably in
> > > > > the best interest of the driver to set those params, and if the
> > > > > driver is going to set its values, the devices defaults are moot
> > > > > unless we assume that those may end up being used by the driver
> > > > > as a hint when deciding which parameter values to choose.
> > > >
> > > > "Any values" is compatible with "0 for max-usecs and max-frames",
> > > > and the device can choose "no coalescing".
> > > >
> > > > "No coalescing" means "latency friendly", but it also means "a lot
> > > > of interruptions and throughput unfriendly".
> > >
> > > To what extent does virtio's "normal" notification suppression
> > > (VIRTIO_F_EVENT_IDX) would alleviate that in practice? At least in
> > > theory the interruption suppression could save us there right?
> > >
> >
> > Interruption suppression is useful, but many scenes still have a lot
> > of interruptions.
> >
> > >
> > > > If the device chooses a stupid
> > > > maximum value, it is his choice (spec should give more devices
> > > > choices instead of forcing them to choose "0" which is not the
> > > > best practice). We can't talk about performance for drivers when th=
e
> devices tend to choose any "stupid" designs.
> > > >
> > > > We need relaxe the restrictions and makes the spec more reasonable.
> > > >
> > >
> > > Hm, I see Linux virtio-net changes have landed with v6.0 and if I
> > > read those correctly the driver -- contrary to my initial
> > > expectation -- negotiates the feature, but does not set the
> > > parameters explicitly and
> >
> > How does the driver know what parameters to set? The parameters should
> > be exposed by each device.
> >
> > > thus keeps the defaults (until userspace decides to set the parameter=
s).
> > > So it does matter whether the defaults are guaranteed to be 0 or
> > > not, and if not it does matter what defaults are chosen by the device=
.
> >
> > Didn't follow this. More below.
> >
> > >
> > > One could even argue that those patches have been reviewed under the
> > > assumption that the device needs to use 0 as the default parameter va=
lue.
> >
> > The default value should not be explicitly specified in the spec,
> > because one size does not fit multiple devices. The source of this
> > problem is that we are missing fields like default_{rx,
> > tx}_coalesicng_params that indicate the device capabilities. No?
> >
> > Thanks.
> >
> > >
> > > Well no strong opinions here. If the community is fine with it, I'm
> > > fine with it as well.
> > >
> > > Thank you!
> > >
> > > Regards,
> > > Halil
>=20

