Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FC929B8E2
	for <virtio-comment@lists.linux.dev>; Tue,  8 Jul 2025 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751962307; cv=fail; b=f1+Og4O1D/bsnkOBboVDVUss85mWxKZ8h1+a6A1CiavNGh89pWlL4oPwTdU9/+ot25kdNaXIY0dtkS7T/b5kOYLnTjdNa+b4EH4kCTp2K2AxT8EnOEjyyohusX2uJgBfkG6TwctKc2XJm/jz0eeOtHYdWxwtzzSmGVteEsRkMHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751962307; c=relaxed/simple;
	bh=cGvN0wV9RWqZrd91bOAh0fFXCwVKfJVoditC1R4GZ5g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i6yeGZYGpB1WHfBPNyCuDXkXOPj6Uf0UJkSHC9QNaWtptWRCAYG0VIDuhwojvJl4stUp1Ds/l1tb/5BTikW4P5PbMpIeuEr1xY2PEIW3JdAmtAmVYByQgCxwVvPwyxTMZnGmrI1gefjF53C7wtn7ZOla9sBFojhlu0l362QpMDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Mhban4vZ; arc=fail smtp.client-ip=40.107.223.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mhban4vZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXOWqwxcEkwflbOTVtqKgwrSTRvtonVaSl1woRCMyn8NeVlrvn0z1mQ67pbgvdsy+vmY8jPnRTshE/DiPq/jgg/t0n409xs032W40SO8uLB2ncxaXbXEhF4/dQFHe1eYDR+G1p4njpigxc9fpaP6ajCc1q8JGZM26p6hyt768LDq8zj4QVKlTZKs8zRHyATSU27p7jNOEtwVuWOuAYPnFZ/XygkCzB5V/haXuClUArO60hb4GJov/D3ci96ilu5QKGN83BCkB2ywKw6n5A07JG5rtoOoCMPGUNkGzKvmW76ad/qQcpcO7/7jNqY7BvNQnimVaesNf3jc25nXA40IVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxzJD0dcOufoSMlCc4dkgXQBZ1CefY9Mc17eOfvzR2I=;
 b=ki9+QYworr5/moxGtq2axXrWT/swj0YbEaNHaWt6VWEMYoqluXO3B3QkOsRV0Y6EwLU0Ka0PZDoCD9T8D22qMUO4rF6Y3XyrG3unBeUBAIRx+7Wvd/npKp4k23Ohgn3r7irucS5D0vVoMcE6fFy+SJdkLbjSX/XJ9hmwqYDhiHahqvrx2lYNzzcztwg1i5/CxZVhdB/oGukjvYce9ERuJH5TQDwZIkI+F6w/mN2g7OZzh/cnLB2WpGYd3n652QDBOAGEvpTmJ6GzTPuumj9EtAiE0HjhRNwi+JdRo4+tg+t59UuxWQ4f/61WTBuKYpd4o6vuIBFyHHiED7ENCnM9gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxzJD0dcOufoSMlCc4dkgXQBZ1CefY9Mc17eOfvzR2I=;
 b=Mhban4vZ4TrdVgv239UfJotvCNaM3+FHchvG4ErpEva2DxOd68io/iptWdA9Dh72ClBavsgZb9MlkQ+JvUqqferZUAdUtZVDN9844TjNTyid9otbd49eqa7sfiXu9D35Nyj+VnYmtlcoEV96AfphFLt+j1X8g4qh61l7hToCYC4NgQvUG7SzGth1a+2BFZSN4nYz8Q/fp6zQetkTcShWB4p2urhoePdJb+ayzu970NBhG+Y5tZtxoZiq0DIHDfMVleoj8TR8n5MR+vnyROESF1cZfPA6SvL7RdYJVxawHATpy3ESyeyCw6OCpQxTXD3j9TzTTZ9t3CsXtAn3bXWh0g==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH3PR12MB8755.namprd12.prod.outlook.com (2603:10b6:610:17e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 8 Jul
 2025 08:11:43 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8880.029; Tue, 8 Jul 2025
 08:11:43 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "slp@redhat.com" <slp@redhat.com>, Shahaf
 Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] virtio-gpu: Fix missing driver conformance file
Thread-Topic: [PATCH] virtio-gpu: Fix missing driver conformance file
Thread-Index: AQHb3VgKITqp2x6oL06l3KDqVOKljrQFmJuAgCJXCsCAABQSAIAAAP1Q
Date: Tue, 8 Jul 2025 08:11:43 +0000
Message-ID:
 <CY8PR12MB7195AC481F68F1F828646192DC4EA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250614181302.277794-1-parav@nvidia.com>
 <aE/yNzLLs+lZh/we@fedora>
 <CY8PR12MB7195A50158F11DE199936838DC4EA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <aGzRggamdIHMnHnR@fedora>
In-Reply-To: <aGzRggamdIHMnHnR@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CH3PR12MB8755:EE_
x-ms-office365-filtering-correlation-id: 2f5b19dd-5cc5-47b8-97c0-08ddbdf71327
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?17Mt2zNm+J0ciBrICLeoTL3Nc+EWMQ64996mmAfs5hu/x5LRpoH8xHdg06Xl?=
 =?us-ascii?Q?AfGQ3f9Fp+M8eyO7dPIE8Wbxi9194omWvviciSKhmv71xR9x6j2L+9NNv+tk?=
 =?us-ascii?Q?fvozll+oN3zyNTs0u9cuZ+NDsTbNRnuOYg0opLjoNnKeWsHOUslBji5XySjC?=
 =?us-ascii?Q?FI2X2hc2se1EtHW7IFfsRM9BaL8L4HkDlM9q49sdKd4+wCNr95pbyeSz0Uv5?=
 =?us-ascii?Q?BzE6lo2sCA0sugpXgQVMWWlvMGk0BbrXyRpTUYJM78ybLQGcJY+2iJzDQPPR?=
 =?us-ascii?Q?WlT9jDi7p9n4Msw6EwugTl6IGA4hN172mYLwuC2rEg02vPYdm29WdPrhn70f?=
 =?us-ascii?Q?zUqQXmkMhzTQ7Wd2oKDILAdy8tJMO8J+DY8lp6bS9JugG8RWNXnwUKvh5UjD?=
 =?us-ascii?Q?I956wQ7aofo71B4Js0sUFm5RdJ5dTuWZ63JVuJ+dMgg6/RUP+KdeTynGb73Z?=
 =?us-ascii?Q?7PzoHEAuYFqUsZk49lR2b3LEsooU3if5LnEkfN6hAot+tVeFxW4L+3K1YVRf?=
 =?us-ascii?Q?O7EedhirZF3ShjXmUMik0O2gCs4qvXIJnrmHFUlMUQd9dUmtf1yldMKN+sFs?=
 =?us-ascii?Q?/R+Cpn2Q5ckBzPzdkt/xsSZB9eb+Igu6HU6tXNnpwZOfqUXYPXwdT2qZ04CL?=
 =?us-ascii?Q?C/bq68hZ+aTMsIGIux5WqHlRb2iWft6DO9FDbjCnwvjYyVYJgvsfQli459cb?=
 =?us-ascii?Q?nB52gY6+OTPE61YoYmTtOiCkOmutOEN6Zk9HvQRlTHnpZlnGCQFpru+zU98B?=
 =?us-ascii?Q?BdbClqrcUJXnQKxkrR7s3ZoJgqgEPUm9b8XHgl57MmI3wgjfM/GyzkrfkAJW?=
 =?us-ascii?Q?TbjhRZwLElBNuJXTs1uSPJJltd+TO9fffKo3WQm3g2h52lmoB9SduZ9EbMDt?=
 =?us-ascii?Q?ElloxQxpHiJWu4RlTuAcWD+nqMHu/wr1gYOF1hlO6lirtdb7VWw/HGzsH1hz?=
 =?us-ascii?Q?l3/+QOiZjSx+ciZMveacI1KXm15aWvGN5T5wGVgoauIYShJJBx/vJoR/tr0K?=
 =?us-ascii?Q?AvzdBsXlxKTFgJO1AAUTfS8iymkmmJjFg0k6cRwVBaEoaBiIRmHdEMcooVF9?=
 =?us-ascii?Q?o1O7gYA8fZJ0M4HRknhqRyY2JqrNrykkCiZJSXv4FLvUvrQFA9geNz1A8A9O?=
 =?us-ascii?Q?chlsp4gfjPj7NfvezCUIgb63lmIJwfZ/g3w/SCMSNqmfMI/WoWUBymLndXcu?=
 =?us-ascii?Q?7KODgNGXaE/N8A9meM8kC2OcvhBPIi5mvkHXdXXE23ug26ITryiFowrh2HoB?=
 =?us-ascii?Q?ciFtZrh9TsqWY1L5YeidF+1u8y7GtE0v3ay4LLfhRgz5C92RjH+fdsNrjAFa?=
 =?us-ascii?Q?b1+1e92ygTrbEloVioUQ39tJtvEyX1Sf57YrzFGBQpZm7pc5VrFJgXpWmGJ0?=
 =?us-ascii?Q?TRalzGWwTyMt14KLaqTs0kLVbetIcOPwmk6Gn12KoIz1kUQp5KBalZ6CJQEz?=
 =?us-ascii?Q?NSIgFaENP2i4+uJcTaI8yKYBpVNJGMhHotqCguatMlyHXT8fi5W/3WKJ/nEm?=
 =?us-ascii?Q?reShKrfva9jPXoM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aVH2KJBAj8rSCwEcUfgmEduD146IH7oAvQ6bFofYi8yR0c9ZvkqktGOVfQte?=
 =?us-ascii?Q?ksZsxYb3lawdB42/ca9IQ/hVafea7p/FbDRf2Ua7wHH4VT/Gc0dTjI/ltg+g?=
 =?us-ascii?Q?FVIZAASwu7WLf8zCl2pUMy1MAVohRWrpmyaPXgyvPigyEg2f4E+6ESBlff0v?=
 =?us-ascii?Q?Jm2pqr2hYYVwKFv+P1ZxYZUjW9QbWcDrLIUFw/a8O5p+cXSbUvgZSVFsjpv/?=
 =?us-ascii?Q?kjIRk0tdwrA/QEK+vR5yLQHK5tDjuN/AvQO0VMtf6/gh0VTghVFT4Ywp46YH?=
 =?us-ascii?Q?N+TgJineAqZSbkwuc8bW6a5uC9xpHRNMu9090A4o3NgS4nZNMIdkXL57njcE?=
 =?us-ascii?Q?/7rFMi6c3f6a+tHF9fqRMJ1bZBFqOov2EHR8lioifCZMNTQQ71yDe2fqJAYe?=
 =?us-ascii?Q?xd6GUlJCdrIdGegFb6fdiAvzncHD65gk5OpXBBEU5otADOwcCJw2w518ZRBv?=
 =?us-ascii?Q?g6TxSWF9ntILD0MkMs3DZJZH46b8m3QqL+vI/fQmvaEA1x4wshBQ/McH65SL?=
 =?us-ascii?Q?NBcJCgkBSVg5Z70VqRWlbzc1x8ib6hBp8BmWTTt77MZjmlEPXRCST00KSm6d?=
 =?us-ascii?Q?9eAdW6O7dnSkrrBMcHVvrLIEOEpODP6lmuZxxvlDWNUv4J6kRuXJfgZh8F8w?=
 =?us-ascii?Q?RBnhRUCWiiZIii3bei/B2f8DkYg18UI3f3C/9K++VVJ2wgIZJOspD7uJfH3E?=
 =?us-ascii?Q?PqvV8EkCDlaZ4pnXqGvNai34Jjo2o+o92sB73oVOPyNJm9c27OU4J8TwALN0?=
 =?us-ascii?Q?p8tLlLdbRZxdjz5d8H4OX/UcSp44GPOMCYFNQwzlq8mCHtiVDIGb76V2JAaE?=
 =?us-ascii?Q?XbmLjdikovvruoCHWCwp0EjSI2xFt3pKHLNrE7wu0h3BNKFB5+mUL8PamClp?=
 =?us-ascii?Q?YT7GmqLXQVJuSQxre7e+8skqNtDzh6fYRh2br7syn06xMGAOt3PXWypsHKB+?=
 =?us-ascii?Q?VBf/bHI132+HymcXn4KNxOPkso5xayLNNdrHhclNekNmVG8xtvy34ijz2oLM?=
 =?us-ascii?Q?8+itJIflVxX8VUC1TlGjb2KIKc+VvYqrhFYrPUxwYNqCa3aQvv3WtxfV8e9c?=
 =?us-ascii?Q?Z/y2FtRuCAQSsarmC3Nn8Onhkq5nb2/Ht4Xo1x04KzrSLF7pXznc16SBYGz/?=
 =?us-ascii?Q?v+zSc8yAVe26YjASJRWu1NsT/+2Ag4iGYWM8VzJlyIjAwaFw8cHU3sJUO//q?=
 =?us-ascii?Q?fdmYeGKbwWp6LJp78WM1FfRKcBgyoTnAK9xptsL01M3JLuU8dHv2JMxEcgql?=
 =?us-ascii?Q?oZii2E0P9Kle4v2v7A7R9jKxxN6Wdv4CvdmklJG/ePTj4FW2h33ZQqx7okia?=
 =?us-ascii?Q?qvPclXjMSZQXRXV8qLGiEBxgCTA8eMqt3hHsXkA9xbFFmhsx80nQZ4nZynYK?=
 =?us-ascii?Q?F/Dhm/+2WNEt8u68Gq4nHa2v8EDaWHOHTaUN7N00KhCGzs9Ct18SfeVsbGPC?=
 =?us-ascii?Q?FzobH3NJye7cvDd1CQGOTCxBuY/ivyMRuP4xtMhnBtfLRSvilKh7sK3FUxik?=
 =?us-ascii?Q?mWX5jT+1e9Su3qc/OeJ8WX74Z3fjXRaDrBmUg98weEzwpFgbr70sp2ioR6Au?=
 =?us-ascii?Q?QbbKKZRGAN8TQ/A2DZY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5b19dd-5cc5-47b8-97c0-08ddbdf71327
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 08:11:43.2362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o0hlJ7mB65Mm0PLqrKeJf1jIdeKO5dU+Ost8wPPsdfKPg9qj8ac/aqJ3wOOhDLE3VFhnwm9cbcQqj1KYQuRZcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8755



> From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Sent: 08 July 2025 01:36 PM
>=20
> On Tue, Jul 08, 2025 at 06:56:26AM +0000, Parav Pandit wrote:
> > Hi ,
> >
> > > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > Sent: 16 June 2025 04:00 PM
> > >
> > > On Sat, Jun 14, 2025 at 09:13:02PM +0300, Parav Pandit wrote:
> > > > Cited patch in the fixes tag missed to include the
> > > > driver-conformance file. Add it.
> > > >
> > > > Fixes: f52fb20cbe38 ("virtio-gpu: support blob alignment
> > > > information")
> > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > ---
> > > >  device-types/gpu/driver-conformance.tex | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >  create mode 100644 device-types/gpu/driver-conformance.tex
> > > >
> > >
> > > Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> >
> > Can you please raise the voting ballot for this patch which fixes
> https://github.com/oasis-tcs/virtio-spec/issues/223?
> > I didn't create a new github issue as 223 is open and its half written =
patches
> are not merged.
> > It is fixed with this patch.
> >
>=20
> Why is it still open if the ballot has been voted?
>=20
> Thanks, Matias

I dint merge because basic makepdf etc scripts fail without this proposed f=
ix.
And this proposed fix is non editorial in my view.
So this proposed patch needs vote. Once voting passes, I will merge the ori=
ginal patch + this fix for the same issue 223.

