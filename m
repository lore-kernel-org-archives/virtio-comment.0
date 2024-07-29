Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6C574055
	for <virtio-comment@lists.linux.dev>; Mon, 29 Jul 2024 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722248410; cv=fail; b=Q+BFdDe4tc+BppKCw9RVEhepIjeeyDQrN0OzIXtf+iFIxj6nCwRIBtbDUTjN6BQlxQx/CBmnpRCd+rwgusxnQqAoz33pmM3F0aKqpxvov2ZVxBrbvzukCtDEt9xx4fj6eelysSZZSwQ1CZ+iJ8JnN+UyaNQj+RTroJ01Xa84yZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722248410; c=relaxed/simple;
	bh=BoYpSrWjWsD6TiUvXTFwCB6lFqwWxDNJQVP56OkWkzM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=asUtaygtIRiE6mC+t8a3O1w3remQBE96/dziEf8Cwhp8q4p6X0AXQdMsWzS79kkguR1ZXAAMuAZoEnIZGL5Go/VgxafojVkCp6C6o2s3BlpEH3QwXlS8ynu75ZP7jMnfGrTigpP4Da/mNh1G/35AEvfYiLNmFgIhwQ2aEyB4fJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o52S1G2u; arc=fail smtp.client-ip=40.107.244.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o52S1G2u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2L1mm1rTLcpp6KMaI3HTaurcyqnMpqaJcPBkpMcLbhy9CfdvGTCe7vqwfAIIo9Zr2eYUScmqDgQMcNuw1AUU+CtF+oohgeCanH2jPAZ92PilFpf8FuL5gTfX50EA/BJOCRs5WYHZmHCsToUuxgFxq2zSdqMY/9SxMsHaeub6PcRAAv9Tg2P5tGOP1SxpJtW7TaQuV6k0LKo29MZRX4WJ94LGlDOL8x3QCUdeJtXFlg1hQ7uQtYpptFhJ3reLFMDvsqyTzoeDK0XXPsO50bZgDJADz7H/KAV8e0eDko0+5jT9aWPhByzXRBAh9aE6zZ4+x4X5Iqou7ZkbyVB4uI19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7/uU3Qe5yYGyNMDh/tZ4Jh+7/ElNo4qm6327pWd9ig=;
 b=aSUe8Ndk1DMuVVQmt4e/Aqn9G055Oy64kRuh3lqbv53/baIsFvY2OcXC+2yCJaN4Fz+WsR6TOF1qbZbfFsbFSIlsNQ+Qp2HwkTLj5TSvuONhL6J9ZSnbDSHZUCjgG8R/s3uxjlUs5qoSKS4yWaBLD65EjNWZ8he6venx2O8Vj1PqWKteY2H+p80+MP4lh/iz6X8TP4p+KEVuSwHKvGrd4dhwUmMntNwKM0FkBcTWh1Gj42XCNqFpDET/2IQiQoWU6qp2Cfm2cRB2e/ISBCpEmYaKHKXsZFgAkqQdPoFxKnodJ0qfFVm2Dxgn4N3U6at4Opy2MFcu7qpRmWdi2Uzn9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7/uU3Qe5yYGyNMDh/tZ4Jh+7/ElNo4qm6327pWd9ig=;
 b=o52S1G2uBxr9u2ueWAjlQAVAo3h9MGrJRFjeFUGCzAd6dWRjgvR/Yg/8NzcojPQtI4AQcy9rPuXOtJR+qfdzJnEHZFzbiC276MekS8UBNhjjIucw0Jg6g/Do9BhM87RHnhRlUBlWe6yn4SuJXgnnVcie9sutukVFDGGEyzbTRZyOiD0EM0v992rW0qw/DNGCNAf3m39T7bFlXzgUGqmajZaCsSllslZh1vm+hkVqeLCAMziYGv8FTr6nUll4dySlH9N6xP9FENC5vhciFri9HPqvXxxu8rWH8S8B2LFmW0HtM7AOWeCG5PFmC7sjTgFi7JjYlHwdmm4fE0oUs8QNeA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by PH8PR12MB7111.namprd12.prod.outlook.com (2603:10b6:510:22d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Mon, 29 Jul
 2024 10:20:03 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 10:20:03 +0000
From: Parav Pandit <parav@nvidia.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH RESEND 1/4] virtio-net: support transmit hash report
Thread-Topic: [PATCH RESEND 1/4] virtio-net: support transmit hash report
Thread-Index: AQHaxicH0QA68WaqpkmDvXO27MuHErHX7TuQgBmdYFiAHCmsEA==
Date: Mon, 29 Jul 2024 10:20:03 +0000
Message-ID:
 <PH0PR12MB54817E470295969945A7D22EDCB72@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
	<20240624-v1-4-topic-virtio-net-timestamping-v1-1-fa3c163e4aa9@pengutronix.de>
	<PH0PR12MB54815E92763ECF9C4CEB21A8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <878qy8ruw4.fsf@pengutronix.de>
In-Reply-To: <878qy8ruw4.fsf@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH8PR12MB7111:EE_
x-ms-office365-filtering-correlation-id: 0431260b-c660-4022-1da5-08dcafb802b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Ck+6K5XF5iABsqyWJvf6ynF2PNm1Bah8ykH2E4dsh2jyMlptkc+3eoAWFNsw?=
 =?us-ascii?Q?bztUE+sQpH/WJtO2oh2K+3swVPS8ICcahXaGUXIz7ZxXMHKj+gSmja167Ytx?=
 =?us-ascii?Q?UHJwDI/y7YxAe3kxePp3MOPFp+rz+Va57bIAfADFjVGdv2STnYa0fwhufT/b?=
 =?us-ascii?Q?VubtztCViIu8EL9OUiArx+s1Cz3KgIx3dHP7TFyB99aYoiU3puAn1QEjxJdm?=
 =?us-ascii?Q?SoyP5fVZ3NuKvF8MLbnoC13vMRQis3VG+CtmZknFFVQPXKCbRtaGzZpHaIaO?=
 =?us-ascii?Q?5cFvJGU7KDWwFQbf2xASMgAvDc2s+YJ0gdIosn5UJivHNQcHoCArxEVDvWNr?=
 =?us-ascii?Q?LIJDH+qcEBTWb/AVGWrUohEWVqdHUCv0hapyTFBvqeU+7sMcm5LL1HRHMx1W?=
 =?us-ascii?Q?FHKm0ydkfDrg2gZCuLXkP7B7ZLRrAREl8dqjZjKFyRDHBpzaJohmmW6Nf5oS?=
 =?us-ascii?Q?XaIkUB8O8JAYoab8QTg7efowa2xFIucVsw8wq8PLNQgNT5YJcge5A8HgIt8s?=
 =?us-ascii?Q?+2JJHMZQdVel7okwPmbmHRClfAN1bt9gAc9grVpx2Rr4MTulQM0uHZ8yr7a4?=
 =?us-ascii?Q?AayIjoECHPM7AFKtqmgsmLmBmBDe4/EB2dqvi+F6Gfq/qNwjvVUDqRoZIEzX?=
 =?us-ascii?Q?n05wMA1tgZyywN/q8fAxOzGObOf+MbebR0BP87P2uvVRn9JZ5bcqtwEXrkXj?=
 =?us-ascii?Q?4m/zK/ONommUcnbKNO+zhM3TpFMOrU3G1Yt2P41++B9J9DQn0DhYYQNHN1RN?=
 =?us-ascii?Q?cT1uzcVtswouekECCmIq5Uzc+Hbzc4AaBdOq49MYr5Gxg/TgMJkPuGITnIUh?=
 =?us-ascii?Q?/XRJJ0nuAFE1Kc8rXvhu5Yl7vBpzGezTipMdALWIFkJIHObrBxh/tdKxPpD4?=
 =?us-ascii?Q?SQQlN0gXy0WQy6PBhpLRpFaPMxu3Lqyhhmo+1jUMpLVgohaFE7ZDbYiBI/Lk?=
 =?us-ascii?Q?UxUv6pWOfBcwvjfDMbbmvXCrdvB9QkXKDD1wv/ymboR9QRu472LXxaN7wAQz?=
 =?us-ascii?Q?NNhKIi7O10kl6vpdd1RexAb/JB8Gs94C61c9i2JjBKAGWEubarJ2as5F00NS?=
 =?us-ascii?Q?712GeFeblVcpNpi/NU04mYj4IUK0qL6PH3a5532CS5zgO86qIHv5tBEJ04gC?=
 =?us-ascii?Q?mOXT/OSCemxb/CQp1NDqFBi5IFMGqJMFQRelsPoCqnW5HKnqS/czWhResO9s?=
 =?us-ascii?Q?xbWw7bu20KSZmw9d2Woia5jvPXA7yA7X7jV2UW5tZGxgu+MO+QxXvA8abyAO?=
 =?us-ascii?Q?y9MNjabQ8ItfNqw6z7xXiT9PBzIjyzgkEz9qs/ZMal2i72is/bAC4LkJQMgC?=
 =?us-ascii?Q?pHriX1vE3RpgSiALu1gyVROEmmKkEKNb0GMAVwMwzPtDnknfWZniX9/mGuS2?=
 =?us-ascii?Q?SrNHxp1bgNtnuxXt2tm6R+tdQObBYdwpAvHYGzCJWrn3LU63Rg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xkmq9KAlAOYJI3CqVymFe/4MjL++0vIlPha5kXnhBCUUZFjyxYRjTHIQ0CqB?=
 =?us-ascii?Q?Rif95E5YnlHiJu8X2q96+rFaE61N8Up2+sDiLavxJsSsFMXyW2EnLSOuJU7H?=
 =?us-ascii?Q?Va5zmp11BZbBljnZbu7I+W7Wlrq3FRX4DNRfge2kNnqGet5xFyqEnvFVbfug?=
 =?us-ascii?Q?/TUx/0BCKBlz3l49CrCRVBVYvM3tMo2GlZ5YQxNhk2b/OCXt+XGtq0w7QKqo?=
 =?us-ascii?Q?oPLuaPMRVJI91PbWvphANO5/pPrmYGsruRDBGfeoKclWPzQa/FSBehJKCsot?=
 =?us-ascii?Q?0952z44OGjFzO7eOsiCGwQBcgJDtcwcYOA/0zN4Xo9SoCrHyilif5cvAortm?=
 =?us-ascii?Q?q1rrQo64QecCnyua2MqW9nPz+cOVgWDCKIBU0GaoW+q6rh+jCA9HLlaFuLQV?=
 =?us-ascii?Q?8gULo035A1eH8jy3TanLZiZY7I6ZsBh95sBre1RoyRkULNiInwqhyUCyhdTB?=
 =?us-ascii?Q?Ci6O0aQZZ0okBLZIFIcPY7fST6qZ2VxKnvZEYx41sFtFib/AUlp4A41ueO6t?=
 =?us-ascii?Q?iWWa+Mgpw7P/Rdz91+jCOQnBmxwf/b4xRH6DwYRbDuXJIdjnnpQSDy/y3cN4?=
 =?us-ascii?Q?rQg1GQ1kwdITazHLXoe8zb4HcoWZeFxbu2p4ou4WZP1Olx5MuCCpMP14avOf?=
 =?us-ascii?Q?jmhnRyZGacG7kQt5tJDgIAYYLbw/SzFGDdLkefpXpUnFtN28lBf+ne8Fd7GW?=
 =?us-ascii?Q?hrymO+bf2N5KvZ9A/sQHnYWa5tHl3mb7BRe/sg0AaVmkKMncGRxpxjxtPmcS?=
 =?us-ascii?Q?yOlaYh3mcoA0DH94bBq5cd3GkWkPArNvutFGsLpw5t3HqQ5NIehJI24+GOI7?=
 =?us-ascii?Q?At5CSVazf4Uc8NkEsPrKK0KD5mipD1MRh4+AsTuOFpdpgnVD39bJv7ghyA/U?=
 =?us-ascii?Q?ruYAJgd3B+he+ykoGmQqxN6W5ytiU6r48mZYb7BRgZ39ol9cMNgkr3o/dFyI?=
 =?us-ascii?Q?mbMG01YqJYSx0jsyIbRUSVlAefRkGuHWQ5lgWC+hsn4uiEUORqZN8NvkpidE?=
 =?us-ascii?Q?vBBprrWRYyBZOMGLlqwbU8QfBt7kzLQTiwwSK3sdYwvnuwRSOrjyFOU7bs+H?=
 =?us-ascii?Q?xtEqlGVTS8r8xBWh1GI3L72UkJDGUMs1A/DKvf2lvc3uoIgoOI8FCVg/Hg13?=
 =?us-ascii?Q?BlMlmgeAbEIjxkEFrHmZ4GOhbDp8tYVsxiz0jW+ecAIGzmdlvccWS/F8G+II?=
 =?us-ascii?Q?tUXKAOBebKtj62yx75Q2AayBfd/aum0hzp83KIVBYsBfx4mlY0CkIyefdTc7?=
 =?us-ascii?Q?EfQZEHq7JEUQF92nGEX5LhpwXpS2loGuH/y5sXYrLb1jtLgTeGkdQGj8G+YE?=
 =?us-ascii?Q?RY6phXy/qWO6hRYlKPcFXay9y1/RkdGu2JhM8AjzXjRxuQNRKSPSIECSIEZ4?=
 =?us-ascii?Q?vohVeJ4Nd5R5ZUCik+2mgV3Ahd/dXtSj0KgcZP/ArANKi1caAoBJGh+XSoiL?=
 =?us-ascii?Q?IPzSsOEfJ3SFj2Kz8lHv2JfA4ZKPY+SGLR3tEyD6S+Sra0cR6450tSQrlShK?=
 =?us-ascii?Q?8zB6MmNFJWhzyNAsxObyIRnHFKzsho3PIj0QqrzPVGi850OdfrAdfW3Y7TY8?=
 =?us-ascii?Q?MSDfVUWtgXflyKZIE3w=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0431260b-c660-4022-1da5-08dcafb802b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 10:20:03.4031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kWeCot1kKtvKcoSJUF5NEOQuEcc4TNWYaBjrB43/x+8aP0OOqq4Mt4IGzQK8ePSDyvbPJJjg24c6TGfi6M/9bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7111


> From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Sent: Thursday, July 11, 2024 5:41 PM
> To: Parav Pandit <parav@nvidia.com>
> Cc: virtio-comment@lists.linux.dev; kernel@pengutronix.de
> Subject: Re: [PATCH RESEND 1/4] virtio-net: support transmit hash report
>=20
>=20
> Hi Parav,
>=20
> On 2024-06-25 at 05:07 GMT, Parav Pandit <parav@nvidia.com> wrote:
>=20
> > > From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > > Sent: Monday, June 24, 2024 4:39 PM
> > >
> > > Virtio-net supports sharing the flow hash from device to driver on rx=
.
> > > Do the same in the other direction for robust routing and telemetry.
> > >
> > > Experimental results mirror what the theory suggests: where IPv6
> > > FlowLabel is included in path selection (e.g., LAG/ECMP), flowlabel
> > > rotation on TCP timeout avoids the vast majority of TCP disconnects
> > > that would otherwise have occurred during link failures in long-haul
> > > backbones, when an alternative path is available.
> > >
> > Can you please explain how does this related to the virtio-net device o=
n
> transmit path?
> > The value proposed here is only between the driver and device. It wont =
be
> part of the packet. Did I understand right?
> > If so, which link do you refer to in above description? Virtio-net devi=
ce link?
> >
>=20
> As I didn't develop that patch myself and I'm a little slow on the virtio=
-lingo I'm
> not sure if *I* understand it right O:-)
>=20
> So, in the kernel patch the TX hash report is set in the skb that is send=
 with
> xmit_skb.
> Does Qemu change that packet? Qemu is the "device", right?
>
Not sure how is this question of "changing packet" relevant here.
Or device either..

You initially explained that a flow label present in the ipv6 header used b=
y ECMP.
In your example if was for backbones (and not in a end point NIC)...

So that is already present, why is the hash of a packet needed or relevant =
to virtio-net?
Is this hash always calculated/present?

I have a disconnect between the problem statement and the proposed solution=
.
Can you please describe both of them?

> >
> > > Rotation can be applied to various bad connection signals, such as
> > > timeouts and spurious retransmissions. In aggregate, such flow level
> > > signals can help locate network issues.
> > >
> >
> > > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > > ---
> > >  device-types/net/description.tex | 30
> > > ++++++++++++++++++++++++++++++
> > >  1 file changed, 30 insertions(+)
> > >
> > > diff --git a/device-types/net/description.tex b/device-
> > > types/net/description.tex index 61cce1f..eb2c08e 100644
> > > --- a/device-types/net/description.tex
> > > +++ b/device-types/net/description.tex
> > > @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types /
> > > Network Device / Feature bits
> \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> > > Set MAC address through control
> > >      channel.
> > >
> > > +\item[VIRTIO_NET_F_TX_HASH(49)] Driver sends hash report
> > > +
> > >  \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide
> > > device-level statistics
> > >      to the driver through the control virtqueue.
> > >
> > > @@ -641,6 +643,34 @@ \subsubsection{Packet
> > > Transmission}\label{sec:Device Types / Network Device / De
> > >
> > >  If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
> > > rely on the packet checksum being correct.
> > > +
> > > +\paragraph{Hash calculation for outgoing packets} \label{sec:Device
> > > +Types / Network Device / Device Operation / Packet Transmission /
> > > +Hash calculation for outgoing packets }
> > > +
> > > +If the VIRTIO_NET_F_TX_HASH was negotiated and the packet includes
> > > +a hash, the driver uses the structure virtio_net_hdr_hash_ts
> > > +instead of
> > > virtio_net_hdr and increases the \field{hdr_len} accordingly.
> > > +
> > > +\begin{lstlisting}
> > > +  struct virtio_net_hdr_hash_ts {
> > > +    struct {
> > > +      struct virtio_net_hdr hdr;
> > > +      __le33 value;
> > > +      __le16 report;
> > > +      __le16 flow_state;
> > > +    } hash;
> > > +    __u32 reserved;
> > > +  };
> > > +\end{lstlisting}
> > > +
> > > +The driver fills \field{hash_value} with the value of the
> > > +calculated hash and
> > > \field{hash_report} with the report type of the calculated hash.
> > > +
> > It would be better to write it as \field{hash.value} because there is n=
o
> hash_value field.
> >
> > Instead of defining new structure, proposed feature bit can reuse the
> existing hash_value and hash_report fields.
> > I guess that's what you meant in above?
> >
>=20
> I mixed up the linux implementation with the spec.
> Thanks, I updated the documentation completely according to your
> suggestions as I now understand what is actually happening.
>=20
> >
> > > +Possible values that the driver supports in \field{hash_report} are
> > > +defined
> > > below.
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_NET_HASH_REPORT_L4             (1 << 10)
> > > +#define VIRTIO_NET_HASH_REPORT_OTHER          (1 << 11)
> > > +\end{lstlisting}
> > > +
> > Please described _OTHER type of hash.
> >
>=20
> Yes, will do.
>=20
>=20
> Thanks,
> Steffen
>=20
> --
> Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
> Steuerwalder Str. 21            |
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww
> w.pengutronix.de%2F&data=3D05%7C02%7Cparav%40nvidia.com%7C4ead5f4
> 482924b64791408dca1a29460%7C43083d15727340c1b7db39efd9ccc17a
> %7C0%7C0%7C638562966877257668%7CUnknown%7CTWFpbGZsb3d8ey
> JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C0%7C%7C%7C&sdata=3DdTdeYxHxwR%2F82aCvUFh0wQKZQ7P30qXtKD0Z
> hBUYnAA%3D&reserved=3D0    |
> 31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
> Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
