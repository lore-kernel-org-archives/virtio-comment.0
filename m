Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010019.outbound.protection.outlook.com [52.101.85.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3884A38E13E
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011146; cv=fail; b=Y+Aj7dGET7YgDKOF7puzbzcc6bQrjhCZaUqmmd3qGEwm7KHNHqFCENeeZa9zqdzHVkV9EDd76DeDUoZaII51c+evxf1ae2ULrdN1yVjLpE2kZr5aEbKvSTXyEkVWsv6/8k0GsvPtScXsGqX9j+WMqgTFFbUUI9yLiYlNhP4Z+sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011146; c=relaxed/simple;
	bh=vlYrzkJQwmFEqnMfEh6e4Z+6xEy+DPiZHZbFmwgp9+Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CV3eh5KdYdAJlIuq63VxnEjUS38EK31YbVEYPnFmhp0m/TnC+N5PKuHjDxG4+xsLsGugzmC6jSkaER07QMDA5ZbtDapyn5wx6AE7mwpVYf+TzEGcFHpAzPuzRvHHHIBt7IGrmHkSfSeHY1pwRviiA+BF43PkBh7YEim5Ex6v+mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l3f7stDT; arc=fail smtp.client-ip=52.101.85.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l3f7stDT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYgC8IXxUj40JmrdvQwi09uaCO2rAQqLFK7CBKdULXcexhsAedUfZ19KiVYzh0XUYhj4VVJkuRolrvgDzOfe2ZQGTD9N3EyRlV/WR3804k7rVvhMLsT5sQu96mpRdgh+IYl14JNfW81T7vdZ/RznkjUHX4ZKhwhuhrrsS/3d+4Hcpz/i8jOBmyrymt3WE5xRyLN2A7goKs21nsxEMucGXKTpvHYZSFdxyMvKHw0ANqvWS6JoII7PlSYbqulVsL2pdTznMHSgimHWPI2RaVtoPimm2/BNz5Euvqt7HL0QdTqvPbkXg0AKfWfpmDzE4Km5l788V3d03oDJmscFKuZrqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwUwYdxlUAKPmfJyrC2NjwLfZ08f9wG/Y4Y9OkhQbBw=;
 b=ZJ32JaD9ISjrxmGE+M6eXl2rB92hqtQGyKyjA6ABGT8h9Ahxpp8gJrpcVgEHb/AGGwjc+5FsrdjD4cRB3vzYI7UAt6jkMwBw1rIaEI50jkyrItK60lrm45YQJTDwk/gjRmRUo5mKjWXb4+LDBSEIwfV1oV42KFiRmqb/Hfc3nTcYp/v9vlPnvNYpxNKHDdeeouoKNsWyqFCF7p1i8y41QLFtDDaUmDiyqiSzMn2oP+96D5VemHC2T/cfwObESntaqShQnQdulaidKtBcH9q52sdbUDQCERYHSiBEgcgPvqcZ2nvd/AxiLNQfjge1n1Pu8jxjC3ZUgSDbmQV2r/ewvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwUwYdxlUAKPmfJyrC2NjwLfZ08f9wG/Y4Y9OkhQbBw=;
 b=l3f7stDTh8rp1IBIFQBlzjG1JUD4x6T+ELSYDvSppnNK7Rd7rN2vqmBE5gmH4X8pJWqF10i4QAg4jQBe57POE5LlF85n4fcxybBVVWBuh+NAa1nx7zTLquQk7XC5t17sbjzcoFkONr0uCUJFCmQgWzEAhPx1L+dTZOt1CHmyJqGLvnM+8t2szTygQ4HZnQSgkUObIH2A8xcS6nzTg6oF0z2BayfJsFd8H3stE9kW+k7dC2LcNWbnf0dYPz12rO6z78i6LN2tgbSZ4yeeD+wpa10OEdYOnMTHqUchsk4KgTaATDJIVa5782wbMqCyQ6bfYhVbKSJXUu7jmKRkbABI1g==
Received: from MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18)
 by BL1PR12MB5994.namprd12.prod.outlook.com (2603:10b6:208:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 25 Feb
 2026 09:18:59 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 09:18:59 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%6]) with mapi id 15.20.9632.010; Wed, 25 Feb 2026
 09:18:58 +0000
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
Thread-Index:
 AQHcjuFu3dyU46FhXkWSoPS8nyUxT7WAvzgggAoZRoCAAGdhoIAAQqYAgAeGvmCAACixgIAAGLDw
Date: Wed, 25 Feb 2026 09:18:58 +0000
Message-ID:
 <SJ0PR12MB6806E3A4D9783E5DB5FA5EC4DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260220050136-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806139282845EA52421A9E2DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225022229-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260225022229-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
 SJ0PR12MB6806:EE_|MN2PR12MB4423:EE_|BL1PR12MB5994:EE_
x-ms-office365-filtering-correlation-id: be19d4b5-b882-42ce-8f49-08de744ee86c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 EqXe5jzt4FvHRsHa+ZFDWhQT3AT0yvF970u6c2R0ly+6lKDWB2DkGvw123ykgmOWHyVtUL+6E+R+FLjaZdFw7Otu+Ml7tVfn0hld9d2g9J4+65I/LxZoIdNo6HwPchjrKBp4d1hJyckeTa8LClFIrmVEKuD2b0FVxoafOrH1Z6XyQb7AWeBSvyMXN2GXd08Tr1io+vP8D2m4wbk5hAVlkae51TYs+bBTlsl9U099i6wk7Q/upBZIY9PM+A0OaFB40tFPcD39NazX75NZBJh1fO3lG/t7D7TlbeRQlnNH78Yh6HvUX0oCayzDIxinPvMp+OmWjugecqC1q53wjmpmAnRhHAbc49zmFOyNzIW4Z7fzDDAtebc3FF3viRqdX1jHE7cn7feGaDgVDbd5Rv8JwhLzjDCv18z8EteQLucGZJGILGv8qej5GQaRvbLdb9i/aP12YA69ztrChl79LxSQeLg47Z+R1DQVpwiWzJoLhXqBwTFMU89p2yOPtp3BJjv0nXHlAy3uziG6cDJ7NhcR1S+WiGTlGUUjlBdy57wnw6KENo/YkqbzKFcD2VUjAbBY9ChOM0AbCRX74AHl8O5kb6AbZB3yH8YaOuuUqSzHSmmL/5YVf7G316gkqFPA/kG8OJZ4Q/XsB5ydTpHIBZ3rav1AJA/ZRIFLGM6CANP7AjoSjRIZKp8EsWYKltnbAcLftXJxvg79c7VcGc1z1q5X5iIttL86BRROG/hJC8DGD5nKS2C+4MZRFC/wD/pYNByJJL88mLyHXjKETKuZjmOaf9TPSE/RMhtm+vqMWA73vSQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4423.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UkPmg0avGEY1EibT2kVPllNvjm8TKT8LIE5vvoasL1wT2Lh+KUKMQGyBqNEx?=
 =?us-ascii?Q?oc84se20igwfuCy2ys0JYsu9Dt1wPGG9JEcXoBkhII3bkRQXz4V2KeOOr74/?=
 =?us-ascii?Q?kOtiGxijTOSeGuahNHgwfViZXD6CjD6XQp7yneQABwk0suCTm8m5Xm2ddwes?=
 =?us-ascii?Q?Cspbrhf3UdC/tN+qaZaVMsunlQb7I6KEEd8crT1tbfvoVNx/VDmWhqpmDr98?=
 =?us-ascii?Q?1Z/dw9nIxY7gcQ6XPsHGnsq6U37MV0CqMLKvuAGizeBqiVsbeJ9Mv6TM55ce?=
 =?us-ascii?Q?E1B0/VYd/o3wb022kLRcKqYxRstCNnhZlIkqdzVeNRxBPrVnuwaqhp7ga0ru?=
 =?us-ascii?Q?E4fK/ONk3ywBx6XgDVCXrr7fGUr3BRsA0creWV6ssuGRKLfI9iY4XOUGQFPT?=
 =?us-ascii?Q?OYwtw1Z+tbANqiP6t6rIGr3gxCwO5xsTfig4WvMSD3uSOMnG0n45ulVCP/WE?=
 =?us-ascii?Q?zsLjgvM8/wsihjhO7D0PuEjm8SISnG9EgtmuclKPaK4+OwQH8NTz+Hmlsogk?=
 =?us-ascii?Q?VBOrl33iH7fka/dbBuNzRgiHv0qN2my75nceM4453giio3oUQcImVGePPJ1B?=
 =?us-ascii?Q?yY3HG7QEJcvdQvd6NoIWxuQVPSAr+4yrSIfnyMWgX1np6ZQbcHvF/1kEnYIp?=
 =?us-ascii?Q?3p7Cfnhx8csUhN0wYY6P0Dcy7EkXDWipZEStUA57WXO4Mi1TTjt78Bi+uBBh?=
 =?us-ascii?Q?WeAQxfDoIsdvVdLYO7b+aJxh5lovzmnIPaKCQnLq7yhPZs5MnYTi+Bh3D4IZ?=
 =?us-ascii?Q?gUJGf98wVGwcl0oWPUq78aS8dJRkKYGy7TkdhZzTaUykwbcdpkQ1L+IrEuU+?=
 =?us-ascii?Q?cFWkxAH+xRI8B3utVBgu076ZAjQcJ8KoU0V5cszgs0ehlvxgz7Zx4VUYBYPb?=
 =?us-ascii?Q?7cM5mzAE9T3oNqe0+sPGO2RdRKkTFk1YPrQ+qMaFD0VnGPGEX3h7wF0+kcxx?=
 =?us-ascii?Q?+ToOaduY5scDhlm2buyXjkqmnGSvo9vk4LSPxLWBTpAxV34ZgXFEgQPHqcgF?=
 =?us-ascii?Q?BUoQZMYO9R9BzjQp862E7Dx1FWOjhdU2KnROk2Hm8LxGy2IFZZpQt94aapns?=
 =?us-ascii?Q?VH6eiRVlvwtZPlbY1cb6wf9Z6aOVBWhx4GrxXTJdlvu6IPobJO8IIIk4WT3x?=
 =?us-ascii?Q?uRSCLgyF5htvFyD7piZjdk+uhfajLF718WZIil2OWyHWKg6YzGg+O2E6GKlD?=
 =?us-ascii?Q?mXLODb5VhzAbMAylRYTd7yYhUo5hoU3aXBL/pQU5Pprf1e1VjKEpdogcuHN8?=
 =?us-ascii?Q?0hyTWXBEbo2FLd42a/HpJINfZlmycngn+eY+bRAPqVcrf4ACvQvX1lbI8QJO?=
 =?us-ascii?Q?roheQsGbNmcTPRr4ap8FiYA743mCny5PTLMLJ62UK2Gt+bEJnaAP135Mrb7n?=
 =?us-ascii?Q?r+sUmgLzUwdv76FEjPH4d9Ar1arUZU6sN9RldBbJn8Bqwv31zcwI9qcZKGBm?=
 =?us-ascii?Q?W1o2gbjfkGtUkygUIn+uEVl3ervIa6/aB/Aft7CJDF7oyh3meo2G90kvvDHJ?=
 =?us-ascii?Q?jp+Wi17OL4c3gBghi/GKrsenGIV03r5a0vDqM7Jv7pwvsN2JkK7ArmQicXOv?=
 =?us-ascii?Q?J1dH6IU9zO0VOMh682ZJJrL3J+hPBiodeNnJL3htG/JsVMTvG+ue9ehN85IF?=
 =?us-ascii?Q?0kXn+BBc3emS4zs144N6hemEITlBye+lI8lHbw66oHCTZqutBhh7u8sEEU3j?=
 =?us-ascii?Q?bb0SX9OAbFfW8VziCuAQQ17U65qNZWqoeq/iO1QkenkShoOK?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: be19d4b5-b882-42ce-8f49-08de744ee86c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 09:18:58.8831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N7HaOmEuSUBGs96j13LgaUGR9MGE1z3/DxHcMyhe5XeiMZeThVWVSADT2jRM+21rV5cGua2IACIAJJnaN3FXjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5994


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 25 February 2026 12:55 PM
>=20
> On Wed, Feb 25, 2026 at 05:09:45AM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: 20 February 2026 03:33 PM
> > >
> > > On Fri, Feb 20, 2026 at 06:13:55AM +0000, Parav Pandit wrote:
> > > > > > 4. I dont find the transport messages to read and write to the =
driver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to
> > > operate
> > > > > the virtqueues.
> > > > > > Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and resp=
onse?
> > > > >
> > > > > surely this can be an optional transport feature bit.
> > > > >
> > > > How is this optional?
> > > > How can one implement a transport without defining the basic data t=
ransfer semantics?
> > > > For example for TCP transporting, driver side OS is implementing he=
ader format foo, and device side is using header format bar.
> > > > How does it work?
> > >
> > > I'm not sure what do foo/bar refer to, or what TCP transporting means=
.
> > This proposal is subset of past proposal of [1].
> >
> > Proposal [1] covered transporting virtio control and data operations us=
ing something other than MMIO and PCI.
> > And current proposal is similar, except that it didn't define the trans=
port binding at all for the specific bus.
> > It is only a partial 'control-transport'.
> >
> > [1] https://yhbt.net/lore/virtio-comment/20231023104647.290759-2-pizhen=
wei@bytedance.com/
> >
> > So foo and bar are the definitions I expect as listed in the patch-5 of=
 [1].
> > If it has to be done by the bus, lets write up this as 'control-transpo=
rt'.
> >
> > > The simplest way to do TCP on top of virtio is to layer it above virt=
io
> > > net. That uses VQs for data transfers.
> > >
> > The intention of this proposal is not to do TCP on top of virtio.
> > The intention of this proposal is to do virtio on transports other than=
 MMIO, PCI and channel.
> > Such a transport can be anything - not defined in virtio spec.
>=20
> > It could be FFA, some two SoC as written in cover letter example, or it=
 can be something else such as TCP or UDP or vsock or whatever else.
>=20
> I feel this "anything" is simply too broad a requirement.
> I did not see any demand for  virtio over TCP.
> And, making it work with existing drivers will be a mess.
Why would it be a mess? Because of load/store semantics?
If so, would the message layer also faces the same challenge?

> We can scope this for buses that can do DMA for now.
That looks reasonable good start.
However, "Appendix C. Creating New Transports" needs modification.

Following two likely needs to stay outside of the "control transport".

A transport provides a mechanism for the device to send device notification=
s to the driver, such as used
buffer notifications.
A transport provides a mechanism for the driver to send driver notification=
s to the device, such as available
buffer notifications.

We also need to fix the Appendix to describe about control transport and fu=
ll transport.
Current definition of Appendix C is listing MMIO And PCI transport, yet it =
misses virtqueue implementation by _full_ transport.

>=20
>=20
>=20
> >
> > And hence, data transfer part must be scoped properly.
> > Maybe I am yet to read this text in the 1600 lines of proposed patch...
>=20
>=20
> Once we get into "support everything in the most abstract way possible"
> we have already lost.
Unlikely.
Nvme over TCP is present since 2021.
NVMe over RDMA is present since 2017.
iSCSI over TCP is present from 2014.
NFS ..=20
List continues...

The idea is to not define most abstract thing.
The idea is to define the practical spec that cater to requirements already=
 listed, including the TCP one in [1].

> No one asked for virtio over carrier pigeons.
CSP user already explained the use case of virtio over network transport in=
 [1].
Considering above many use cases already done on similar non virtio devices=
 as pigeons is severe undermining the scope of virtio.

One can say, I only want to engineer control transport ignoring needs of [1=
].
However, we must have the doors and vision open so that users of [1] can al=
so use it without creating yet another 'fabric transport'.

At the same time, we must define the binding to the bus where it is going t=
o be used for the DMA.

For example, cover letter mentions about " between a host processor and its=
 co-processors"
And " between normal and secure worlds"

How can one implement a driver if the bus driver does not know how to enume=
rate/discover it?

In the proposed example, of host processor and co-processor if they are con=
nected via Xenbus or AMBA bus,
how should driver discover this device?

If this bus binding is not part of the virtio spec, how can it be ever impl=
emented and yet comply to the virtio spec?
Can someone please explain this?

I frankly expect an ARM FF-A bus binding transport section in virtio-spec.
So that device and driver can inter-operate implemented by two different en=
tities.
Only virtio level messages do not seem sufficient.


