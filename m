Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013041.outbound.protection.outlook.com [40.93.196.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90FB221FCC
	for <virtio-comment@lists.linux.dev>; Fri, 20 Feb 2026 06:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771568044; cv=fail; b=QQYlKNJwFnYIReGMP0d5YtlIbfTuCIubRyE/dVEM7Fb5s5iejPEZQTIEriSo/7QuvTcOrjoGz6UN7oK4bYWfoQ795eBgyUs+CpdLJpletXJ6KQ9kQzABRuLE733iPl4wgsbXfsysHUceUf6kOCfNVMmSqk8dduwhjQXD6oMSs8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771568044; c=relaxed/simple;
	bh=akDD8q8pTMlrZ82IN7CNY6z4zV7FyiLGtImSgjvAG5Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Bktos5imQiFbFqaMfpN3WZQM7DZE8SeWzzLHMkrUOqnB9Q3PJSj0Rov9xmk20V14C9oUeXHnUZAFWTTTS5AsZVUENLBeutPiNKrf6QhNZnYlkiLhCiuVD5MYYRzH+SQ47NrKvk7xPl+WDMgKuu1U1efvxQLRQlDB6cIEUwfJlQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RgtXgYNw; arc=fail smtp.client-ip=40.93.196.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RgtXgYNw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SX2pCtF8zfCASRZkAJSjhAOK4wfwPP7tebwOOEWqdLmCqQ8l3xbTEgyBoCM0jpQZAAv57ScpKt8AyADqyBReGROxwikzBgeceE2Y5v8YfT1Ikok6HGqDbxfdeuKUp0ShChy5TykATcpf+Km6t63eAKGiEgY+/Yr3/z1DyVY7nrJdsN+HAK8JfqM15/oTRRHRSy+I4VaDsDhOHmFOclTtl0tKSv5XDxlHWMvqi0MdPdTfHnc7S5RPaBsl5nAXSzYCsQJbT7EVuwZqP6109mfv2L0LDViMo66zOOlTbWfaG97I0SrXV7Q7u/LmT5sso7zfoNxp35FSq8BkYx40powRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpCLkGzQJC/hNuNTh46N9IBGPgZRkWOzSXfBtO9Bqh8=;
 b=niJEon6n9g/nHqfVTSKJ0TxoTjySyHsU0+UuRYd+/l2WnSzgrKoBpCRazOqRXthI24N+o9m/ZKg1SmTysBXPH0ws3UddRK5rOGOX8vl4VLYNEDeoY8XXHvsFdxtMwAaf9HWkiOgEHZ0S8IVzXEp5GxY3DzcJ1iGMlSjwmOiRJDwTqYdQJPBDCoahK3PPIbrCaXqH5rF+WfUUM24h9xENmjYEvwGQVlrn9JhGgVhVRNlD7I18BKwx3N0xeprv53cyQPO4hfNoHwLarggd7hRMc21ctT+JY7X6O7EdXmUv5yeMhvn1AiNusOln76+kPgqS1RZvhh9gGQza7Vf3rP8a6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpCLkGzQJC/hNuNTh46N9IBGPgZRkWOzSXfBtO9Bqh8=;
 b=RgtXgYNwN2M+6o/7ZAv8/tkNTngtuzRBfCTctdo5KC041nW1fsyWgXGO5ZyNahITvKANhxTeRArrXWRahjzw6SeAkUtZO1RO+lCCD0jmpwCz+Cx2IgOBtIu3x8wVu1s0X+C3a7PKpUBnovvcUk3aftkXPvOoVN8Lx5c8aJDQwD1cmCCHTJF5//2Z608DjOgxEJf1XmCDRfzfAN6bnnz/3lKq238czDcsknAp1ArF9iQvHfp5pV0He8U3qlbExSlvDCINzjs+kC2sSaxkHjpU9+x/pmFgAmzotRNNwXCob3kwl8TyJvTAGew6lp2EqrWhJwZsW6rdFp6D7TnTqeqAEg==
Received: from MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 by BY5PR12MB4225.namprd12.prod.outlook.com (2603:10b6:a03:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 06:13:57 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 06:13:56 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%6]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 06:13:55 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Bill Mills <bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, Bertrand Marquis
	<bertrand.marquis@arm.com>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar
	<viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>, Armelle
 Laine <armellel@google.com>
Subject: RE: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index: AQHcjuFu3dyU46FhXkWSoPS8nyUxT7WAvzgggAoZRoCAAGdhoA==
Date: Fri, 20 Feb 2026 06:13:55 +0000
Message-ID:
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260219185034-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
 SJ0PR12MB6806:EE_|MN2PR12MB4144:EE_|BY5PR12MB4225:EE_
x-ms-office365-filtering-correlation-id: 6a955b20-e4f0-4348-396f-08de70473a77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7142099003|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tnn8+GT+gItVuV6YpqY8RH4jlrpBm4REdY8LE7QE95uilYn1OTTdVQM+ZS6+?=
 =?us-ascii?Q?njB1asOIyrKYaRGS8ryDYr3dcxX7pT+PyFVnYDEQEF4MhPLc6hA5Jxa3FlZA?=
 =?us-ascii?Q?u3pg1krtE/JClbeVq0UIJ+ukm3DRV2D5nZ+TcaMEI8wUAXho9rL1/pu/yGGT?=
 =?us-ascii?Q?25NHJCKemPQ0e447IwWLwrI9ZFZBZ/ko+lHptYw3cF9niZGq3y3CUBKhk8lN?=
 =?us-ascii?Q?QDsVFxZfY8Xmxv/ay/XGRGsc7LYmsJPGBGfJFjWZXWhEidKzHyzre1mJRnFd?=
 =?us-ascii?Q?Cte8s3HB+wd4IN0v5CNO4D3BTzEQ7q4h14ggZYY0OWjt4pg13+iSDf44m91e?=
 =?us-ascii?Q?nQrZolTIXxIHgjmlXGWILHx5cDys3Yrvs4M9vs71PV/i4YReueMNovwJWUEe?=
 =?us-ascii?Q?rpGAhKXCZSOwwbMEF04WPkgtRd5sgRkdbsuHc/oWDZIYjVyy4jgva5cvtWi5?=
 =?us-ascii?Q?grDxSSr03gfTQgf+7mLDl4gNJK0IJ5elvnBsCiUGGV4AJQjsaWBvWsVK6ICO?=
 =?us-ascii?Q?Ch86tyTMgycFNA1rR33/vD6HBk1oiqOioZLnxYdICJ4KsKlsZKIIvgPhsGQQ?=
 =?us-ascii?Q?FqyWicmhT4kd6aKOe1v80hvhWeZTS6p/OJO9EBRk0thq5PCwRQ5oRi8RfvkS?=
 =?us-ascii?Q?1uLrjoHjrKfiUz+3mXVXNGIvNjkLscUlEfnuQ0Z06ZeRXeGBdlZghJxPtlfO?=
 =?us-ascii?Q?/j0JGn+XnQ8q//+Mykr0kPxeQB2ztQx9HX0cXg5bf4sR9mqLRIH0D6z+kDPO?=
 =?us-ascii?Q?w18xkQApR5Cwa3XZ/8nulA+pHCSw1k6/oMWf9Vbti79/Z2vcxmJk3VUxwFtg?=
 =?us-ascii?Q?jRN03OkKojdbn3SgYaQ6bac9ZSPiIz4auZKuxQqJ5EIHRXPhSPqKczV9j875?=
 =?us-ascii?Q?gL6QnSgnGlPMkLiJGvAQA/q5L20Oz0nJuG9t9xaLl8m2vPhiTy4oUCQ3uOkq?=
 =?us-ascii?Q?FF6t7tIxgNYf+Q3F7iFg/uFAPyez/nzcKr8PTf2DA4MaLSrA5DStOmbv+rOi?=
 =?us-ascii?Q?MR8tgUtKvBkZL5+RlunsST9peOBupVKMhLX0Br6DexXzhl1nxWI84QNpdpRl?=
 =?us-ascii?Q?47okO+YMe2TQgV11dxDdg67dE6JCQiTcrisCtxK2HAI8GcBU2REbUgC9AZlx?=
 =?us-ascii?Q?2sjC/0Kcckd4GD8g2ZnsPLQGpWCXHawLRLzs9soci+Ep2hujlCxkXkGxcLYh?=
 =?us-ascii?Q?Sh/lK3skXZgUzMgMeqa4NJdlzUbWyWdKbjFN4c1Vumg1UfSx1sZBzszMwxSo?=
 =?us-ascii?Q?fk6tHJPkvoBr6zbXC8HckSg2uBLscnly+rTksIrT1tel1GKCPV+onwdYVZt/?=
 =?us-ascii?Q?gMQrlCZ28Yr1ygSAc5QadaTpVwd8hV5qx3RyVRfKgB2e6MxO/EPr+PlukhKG?=
 =?us-ascii?Q?09+BbsGvjWxCFlSh/kFlqPeKrWT0oibwULhgkwYviL8gz7mHugSq+zjcAfoJ?=
 =?us-ascii?Q?E9tGyQFha0w/i5gBH67c5ZTzuRMQRJ43n1rWXHPa3IVO3elDVAX5S/0zmxsA?=
 =?us-ascii?Q?+c3Njqxq1caTR2h1Sp/yuUIEP1d9XOiyT3JEhD04uxaU0G4s9KTW6oL0Csnp?=
 =?us-ascii?Q?uccKPnk/B/67P9bj6Ao7Pm57QGkNyRGlZShz0RMO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4144.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7142099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aumyi/1vKHy96irKf+4XJkSWNoqkU77tekmGlYkeUZL8u6sbWnGMklyeVdIg?=
 =?us-ascii?Q?gle8TtTsbVQCrHSMlsa/iFrSyAiMnJ7GSw08+a67ZLwN/ybKc/xqki7DIeQ2?=
 =?us-ascii?Q?7wk1vkn6Zs9CBuzRIpM3tFCYlKEPawiUumsHDWDpTVkAQQPKAvtkwOR1tF78?=
 =?us-ascii?Q?oENQyuvTUHahWDQX3qyrjrkrvFZKNYnXkn3QWxpwoZmjTeca6QkecH9UXLDl?=
 =?us-ascii?Q?r0p+1SKUfU/Wnxu1Hbf66KaGwfrG5gz4OkUYENPvkeJWDUK2vPxEWywayPiS?=
 =?us-ascii?Q?mvRlylGyc0SORa2l/vQME5M+zNesHGkY101D3Un96xM51VwsJmDtRNe6S5CL?=
 =?us-ascii?Q?8dmMy9vKaOoOJz/O23Xg+sd4KxDVVq6nfYiA7pPTCUbytSpWye0nZQUfORjR?=
 =?us-ascii?Q?IL81BUp9iY75oro/g4EYPMXKt6mCZ+1QP2rN8gZTLMM0Gx0l63E0R88Dbs6s?=
 =?us-ascii?Q?iZGbVQU+YhBD+aywo9ySMUQxeMA53SNsFz+fvVlAdgxuluhwmxaBZm+7ynNi?=
 =?us-ascii?Q?Fx7wCHyArnxX0s8YpehEZD0jAxCjgjOEMumH7t7dMUvpI1uPrqjd7tmcF+QB?=
 =?us-ascii?Q?e1wouO2UWx89Mzn/0B8WvDIIgvvfpkLrmDyTXGSDKglNiuC6TXbAgRMYCImC?=
 =?us-ascii?Q?WbIXwLFtL7PbdzYnQc3uS7bKxEkpfrVEbi9/8bZLyeul/80eOOQrOGYbE9ca?=
 =?us-ascii?Q?hecilgtZi8Oor9zaP4dGeyCc6L4n6Vyj1+LV2x9tRj2ZbDS0Rlkfy02elZ5V?=
 =?us-ascii?Q?SwYAKtcO99Wy/knX+Klyv5XHE0b+UZiPBiQJ8hRk3LyqsTuBcTRq4D1mtHx1?=
 =?us-ascii?Q?X57lGQXiVK1XcLmgkXoo5KgtdxxmSgrsUwLBEwlpnAQ48CKctbaEAWym5U81?=
 =?us-ascii?Q?rLe+Qz37y9zMlsd8CwK5bKMGbxsuNy8XRIqXezmEZ+TNIzAP7GXbR0lnlhdb?=
 =?us-ascii?Q?VYVVPGFS337L27ggtdsyFb/a9kKA/y0PoE9Nu8zXlTcE+Xt7jWIGQ7f0NTJc?=
 =?us-ascii?Q?faAYvUVnscZI8dE6CskAwsvBKHVEY2c0DyAxMrMgRpzPkGKzTbPwYF2H/5aq?=
 =?us-ascii?Q?yfsend1g8Cl4of1eZ4rBSx5qEgUT+/b4DOf5RDl7zN1/kCBn8zVsRNgpct/P?=
 =?us-ascii?Q?VHvOOOAfoEDM4AQKbVdou6zbIxhlxvEwO3fcYZjjj7PF/yhvvVNM/hQdDTVR?=
 =?us-ascii?Q?DpCkPUixbkB487/fXSlNwi4P7/rp/ZYJPGDoeKyZ57VpjBAIOWBmi66DDFyK?=
 =?us-ascii?Q?ukR/whps1DN3deu+cwif2SweHBIiqkt1WWWsxj1llCDuOQj82kTaOG3dqgPF?=
 =?us-ascii?Q?+q1AkFAYu6AT55h6fjvGmTDq9aqeWe0w6kAU1NhaopJiPlqEB+3alL8YZXLZ?=
 =?us-ascii?Q?O7gkmPm1PlplOu1wwZ8pzZxhhVgpVAGavNr++v/nkc/P5kzHYZ2UihLRmkpj?=
 =?us-ascii?Q?a901eAU0jobzJ5qq2d54J8mMXSLTgzVuukQhM/vnPZQqkkXeyd6e7Vogk/Pn?=
 =?us-ascii?Q?/wImwSgpS+ESGzlx6yjMt00HN4PcheSRlnkPVX+vnIrWfH9aVH69vz7HXuO0?=
 =?us-ascii?Q?4sASpoe4jMzboqrHw76bqGuB+YKUCvptWdss2b4FJTtdhxsnL8dMwgTzb0Um?=
 =?us-ascii?Q?5qug+UrGR8dpMUPtlxK4LsHy9WAWidpG6Xr/EE+9TE7QoHKX9rGi2JNGhh/3?=
 =?us-ascii?Q?EnTupkHJ3V8JkHK8hWu3u1GCPVGQ59facVLlig2uHbQEgAGC?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a955b20-e4f0-4348-396f-08de70473a77
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 06:13:55.8727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zVLH1AXwB6/5ahZtPx4J+LddKUFnz2QJnMsR8KxjeZpTtGpO+6OPHN7L8HXFsUdYyfVxCTpsluWB52kpnG5RcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4225



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 20 February 2026 05:25 AM
>=20
> On Fri, Feb 13, 2026 at 01:52:06PM +0000, Parav Pandit wrote:
> > Hi Bill,
> >
> > > From: Bill Mills <bill.mills@linaro.org>
> > > Sent: 26 January 2026 10:02 PM
> > >
> > > This series adds the virtio-msg transport layer.
> > >
> > > The individuals and organizations involved in this effort have had di=
fficulty in
> > > using the existing virtio-transports in various situations and desire=
 to add one
> > > more transport that performs its transport layer operations by sendin=
g and
> > > receiving messages.
> > >
> > > Implementations of virtio-msg will normally be done in multiple layer=
s:
> > > * common / device level
> > > * bus level
> > >
> > > The common / device level defines the messages exchanged between the =
driver
> > > and a device. This common part should lead to a common driver holding=
 most
> > > of the virtio specifics and can be shared by all virtio-msg bus imple=
mentations.
> > > The kernel implementation in [3] shows this separation. As with other=
 transport
> > > layers, virtio-msg should not require modifications to existing virti=
o device
> > > implementations (virtio-net, virtio-blk etc). The common / device lev=
el is the
> > > main focus of this version of the patch series.
> > >
> > > The virtio-msg bus level implements the normal things a bus defines
> > > (enumeration, dma operations, etc) but also implements the message se=
nd and
> > > receive operations. A number of bus implementations are envisioned,
> > > some of which will be reusable and general purpose. Other bus impleme=
ntations
> > > might be unique to a given situation, for example only used by a PCIe=
 card
> > > and its driver.
> > >
> > > The standard bus messages are an effort to avoid different bus implem=
entations
> > > doing the same thing in different ways for no good reason. However th=
e
> > > different environments will require different things. Instead of tryi=
ng to
> > > anticipate all needs and provide something very abstract, we think
> > > implementation specific messages will be needed at the bus level. Ove=
r time,
> > > if we see similar messages across multiple bus implementations, we wi=
ll move to
> > > standardize a bus level message for that.
> > >
> >
> > I would review more, had first round of sparse review.
> > Please find few comments/questions below.
>=20
> I'd like to comment that I think it makes sense to have a basic simple tr=
ansport and
> then add performance features on top as appropriate.
Sounds good. Simple but complete is needed.

> So one way to address some of these comments is to show how
> they can be addressed with a feature bit down the road.
>=20
>=20
> > 1. device number should be 32-bit in struct virtio_msg_header.
> > >From SIOV_R2 experiences, we learnt that some uses have use case for m=
ore than 64k devices.
> > Also mapping PCI BDF wont be enough in 16-bits considering domain field=
.
> >
> > 2. msg_size of 16-bits for 64KB-8 bytes is too less for data transfer.
> > For example, a TCP stream wants to send 64KB of data + payload, needs m=
ore than 64KB data.
> > Needs 32-bits.
> >
> > 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMOVED (in=
stead of READY)
> > But more below.
> >
> > 4. I dont find the transport messages to read and write to the driver m=
emory supplied in VIRTIO_MSG_SET_VQUEUE addresses to operate
> the virtqueues.
> > Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
>=20
> surely this can be an optional transport feature bit.
>=20
How is this optional?
How can one implement a transport without defining the basic data transfer =
semantics?
For example for TCP transporting, driver side OS is implementing header for=
mat foo, and device side is using header format bar.
How does it work?

> > Also, the queue notification message is missing at bus level.
> > But I dont think queue notification via message good idea anyway.
> > We rather need a more higher-level message for virtqueues.
> > Such as posting the descriptors to device. And this should translate in=
to a VIRTIO_MSG_DESC_SEND or bus specific binding.
> > Without this msg transport is incomplete.
>=20
> this too can be a basic method and upgrade to a different one
> with a feature negotiation
>=20
>=20
> > 5. msg_id to be renamed to msg_opcode, and token to be renamed to msg_i=
d as it identifies the msg (as written in the description) in
> >
> > 6. Bus requirements ordering is too strict for implementing any perform=
ant data path as data response may not be in same order as request
> for reads.
>=20
> here too, relaxed ordering could be a feature bit.
>=20
Well the newly defined transport scheme is not even able to fit for the exi=
sting transport of PCI.
The BAR for new transport definition can't be this low..

But before we go there, I would like to see the bus binding details for the=
 data transfer semantics.
Without this simple thing is incomplete.

Will wait for Bill to respond.

> > 7. VIRTIO_MSG_SET_VQUEUE does not have bit field for individual address=
es.
> > This requires caching all the values on the driver side before sending =
the transport request.
> > I think it is time for virtio spec to shift to virt queue create and de=
stroy model using the admin queue interface.
> > and no need to bring this VIRTIO_MSG_SET_VQUEUE legacy to new transport=
 bindings.
> > It may require more plumbing, but it is cleaner interface when a new tr=
ansport binding is created.
> >
> > 8. We should have the message response header for req-resp method with =
status code.
> > (even though they are plain MMIO writes for pci).
> > As opposed to that, proposed messages are doing composite tasks, hence =
we need the status response.
> >
> > 9. virtio stack cannot handle hotplug devices today, at least Linux.
> > So if the intention is to fit into such a system, DEVICE_BUS_STATE_REMO=
VED will not be enough.
> > A graceful method is needed.
> >
> > > We are working on a few reusable bus implementations:
> > >
> > > * virtio-msg-ffa based on Arm FF-A interface for use between:
> > >   * normal world and secure world
> > >   * host and VM or VM to VM
> > >   * Can be used w/ or with out a hypervisor
> > >   * Any Hypervisor that implements FF-A can be used
> > >   * We have this working with pKVM and Xen
> > >   * We have this working with Trusty and OP-TEE
> > >
> > > * virtio-msg-amp for use between heterogenous systems
> > >   * The main processors and its co-processors on an AMP SOC
> > >   * Two or more systems connected via PCIe
> > >   * Minimal requirements: bi-directional interrupts and
> > >     at least one shared memory area
> > >   * hvac-demo has 2 demos of this
> > >   * This is working on two hardware platforms
> > >
> > > * virtio-msg-loopback for userspace implemented devices
> > >   * Allows user space to provide devices to its own kernel
> > >   * This is similar to fuse, cuse or loopback block devices but for v=
irtio
> > >   * hvac-demo has a demo
> > >
> > > We also anticipate a few more:
> > >
> > > * virtio-msg-xen specific to Xen
> > >   * Usable on any Xen system (including x86 where FF-A does not exist=
)
> > >   * Using Xen events and page grants
> > >
> > > * virtio-msg over admin virtqueues
> > >   * This allows any virtio-pci device that supports admin virtqueues =
to also
> > >     support a virtio-msg bus that supports sub devices
> > >   * [We are looking for collaborators for this work]
> > >
> > > Changes since RFC2:
> > >
> > > Spec Functional:
> > > * Made the common message header 8 bytes and added a token for option=
al use
> > >   when parallel outstanding requests are possible
> > > * Made the 8 byte fields align to 8 byte offsets.
> > >   This effects the {SET,GET}_VQUEUE messages
> > > * Many conformance cases have been tightened.
> > >
> > > Spec Editorial:
> > > * Major restructure to better align with virtio spec
> > >   * Conformance model now matches other transports
> > >   * Use C structures to define messages instead of tables
> > > * Added a section to describe how responses are matched to requests
> > >   This includes the use of the new token field
> > > * Redefined / better described error handling between transport and b=
us
> > >   layers to eliminate the need for the bus to generate fake response =
messages
> > > * Included editorial feedback from RFC2
> > >
> > > Eco-system:
> > > * Added virtio-msg-loopback demo
> > > * Arm has published the first draft of the virtio-msg over FFA spec [=
6]
> > > * virtio-msg over FFA has been demonstrated with both Trusty and OP-T=
EE
> > >   secure world
> > > * LKML RFC has been sent [7]
> > > * QEMU RFC has been sent [8]
> > >
> > > This is the first non-RFC patch series. The known short comings have =
been
> > > addressed. We ask for review in earnest on this series and thank you =
for
> > > any feedback you can provide.
> > >
> > > Background info and work in progress implementations:
> > > * HVAC project page with intro slides [1]
> > > * HVAC demo repo w/ instructions in README.md [2]
> > > * Kernel w/ virtio-msg common level and ffa support [3]
> > > * QEMU w/ support for one form of virtio-msg-amp [4]
> > > * Portable RTOS library w/ one form of virtio-msg-amp [5]
> > >
> > > In addition to the QEMU system based demos in the hvac-demo repo, we =
also have
> > > two hardware systems running:
> > > * AMD x86 + AMD Arm Versal connected via PCIe
> > > * ST STM32MP157 A7 Linux using virtio-i2c provided by M4 Zephyr
> > >
> > > Please note that although the demos work, a few have not been aligned
> > > with this version of the spec.
> > >
> > > [1]
> > > https://linaro.atlassian.net/wiki/spaces/HVAC/overview
> > >
> 05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf88d95%7C43083d1=
5727340c1b7db39efd9ccc17a%7C0%7C0%7C6390
> > >
> 50419790817373%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLj=
AuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIs
> > > IldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DJnCO8QgAIiyGAprBLkprUd8A3162wCF=
pmGic3JKoHXo%3D&reserved=3D0
> > > [2] https://github.com/wmamills/hvac-
> > >
> demo&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf88d=
95%7C43083d15727340c1b7db39efd9ccc17a%7C0%7
> > >
> C0%7C639050419790868944%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsI=
lYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIj
> > > oiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DXeBuS8Hr%2FDETKfSyidK=
KGoGq6OTUcOYoeSGDouUMcf4%3D&reserved=3D0
> > > [3]
> > > https://git.kernel.org/pub/scm/linux/kernel/git/vireshk%252
> > >
> Flinux.git%2Flog%2F%3Fh%3Dvirtio%2Fmsg&data=3D05%7C02%7Cparav%40nvidia.co=
m%7Cf7f430294c37485df25808de5cf88d95%7C43083d1
> > >
> 5727340c1b7db39efd9ccc17a%7C0%7C0%7C639050419790913867%7CUnknown%7CTWFpbG=
Zsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
> > >
> LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C=
&sdata=3DPuLq68Y0ZNCYbfrgDZlipfm44xHZp1%2F%2
> > > BLu%2FaKQBBB%2Fo%3D&reserved=3D0
> > > [4] https://github.com/edgarigl/qemu/commits/edgar/virtio-
> > > msg-
> > >
> rfc%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf8=
8d95%7C43083d15727340c1b7db39efd9ccc17a%7C0%
> > >
> 7C0%7C639050419790960971%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUs=
IlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFO
> > >
> IjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DxyowKD9KG3IasQTiYCzfCRG=
qCLSF%2Fa1g4%2F2%2ByKb1OoA%3D&reserved=3D0
> > > [5] https://github.com/arnopo/open-amp/commits/virtio-
> > >
> msg%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf8=
8d95%7C43083d15727340c1b7db39efd9ccc17a%7C0
> > >
> %7C0%7C639050419791007707%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWU=
sIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkF
> > > OIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D69OwO2wXi0%2FEhDDS=
R2uLG2iis5RYzI%2FLnlfkcRYao9o%3D&reserved=3D0
> > > [6] https://documentation-/
> > >
> service.arm.com%2Fstatic%2F68f647791134f773ab3f0a7c&data=3D05%7C02%7Cpara=
v%40nvidia.com%7Cf7f430294c37485df25808de5cf88d9
> > >
> 5%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C639050419791052848%7CUnkno=
wn%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRy
> > >
> dWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%=
7C0%7C%7C%7C&sdata=3DcD5VqKnTuIFqlN2XV3j%2FHQ
> > > Wvsz8UVe5PM0ZjMU3o0sM%3D&reserved=3D0
> > > [7]
> > > https://lore.kernel.org/all/cover.1753865268.git.viresh.kumar@linar
> > >
> o.org%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5c=
f88d95%7C43083d15727340c1b7db39efd9ccc17a%7C
> > >
> 0%7C0%7C639050419791093596%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydW=
UsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsI
> > >
> kFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DNmhmL%2BuyVqnpHT5r9E=
fI2uzPf9LSXLga7bUw3FO5x4w%3D&reserved=3D0
> > > [8] https://mail.gnu.org/archive/html/qemu-devel/2025-
> > >
> 10%2Fmsg07438.html&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485d=
f25808de5cf88d95%7C43083d15727340c1b7db39efd
> > >
> 9ccc17a%7C0%7C0%7C639050419791139232%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1h=
cGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ
> > >
> XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DosI1FttOO9=
%2B01e%2B5EtwnYe%2Fl1%2BIvFjH%2Blyz2ipM3RM
> > > Q%3D&reserved=3D0
> > >
> > > Bertrand Marquis (2):
> > >   virtio-msg: add new command for bus normative
> > >   virtio-msg: add conformance entries in conformance chapter
> > >
> > > Bill Mills (2):
> > >   virtio-msg: Add virtio-msg, a message based virtio transport layer
> > >   virtio-msg: link virtio-msg content
> > >
> > >  commands.tex      |    3 +-
> > >  conformance.tex   |  105 ++-
> > >  content.tex       |    1 +
> > >  transport-msg.tex | 1640 +++++++++++++++++++++++++++++++++++++++++++=
++
> > >  4 files changed, 1746 insertions(+), 3 deletions(-)
> > >  create mode 100644 transport-msg.tex
> > >
> > > --
> > > 2.34.1
> > >
> >

