Return-Path: <virtio-comment-return-8577-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61529C61D85
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 02:57:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9B3632AEE0
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 02:57:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 82AF29868B1
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 02:57:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6972E9865ED; Fri, 24 Nov 2023 02:57:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 581E39868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 02:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMcWPAdxJMLwoGEwOjhUwvzB2mGtYwfl4g5Op2W4r68ZRodkHiz10X6yyvE2H6aoKU8Bwkr8lkzE2B5T2B4yASDNrulAuHVcbe/XzBxrxPqUyKAEYqU6GAiDgTtMVOMMcIi9t917rI9wH5IFosvz741bQ8PT+dkP34eOrUn0QNqvyICROfHyfLarDaX39ySot2h0ygKMxhgaFwBAW/3raT+LmTKMh189dj69K/8cRAB0VZDT0189tdQaNXrlxXIVZZcYfaO2sR8x8Zh5L5Fckmc0a2tF+NyUEO9GX5x9HKA0eiGVCMdTUyuSONWRwqTwDPI0gEXGUQ39y7gn9N78UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2sYt4r2M4ijQUxyjTXvbHkysX2Lb6g5EyAaXvh0Z7E=;
 b=mMez5RoNSUtJkFAGplZ1WK5g+44lZ2ueJe93aJHKO/ZDcIlDrnTjWJiQonHxGxCeIm7jV3ez/U4E6gyYGhO3GhTqMbfmnJVhKZAAy8HMyLfJNEyP2FBUbCQsHgcQyiyrZmwM9F8TqkJWmuhopIotv40YoIHGBbIQf4vh66g9aJinTZnk+/2kr8RlWmjXdtb0oftVkOWP4avKtInaLa9qCumBkfLpOhQ8rZiuZlinVUuwNUhF3kTQMBC0jvEpofTdU5JRYROF/gbYX7Kw2VrsZhbvrWYGfPQEjO3pQBVn9Y9bL8vHijLESnFlRUnSnWUVDeD28FhSkupnKHL5cY4EMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Thread-Topic: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands
Thread-Index: AQHaHe6IXCl5jgtp9E+7xZjgBxzICbCH8raAgABJqFCAAEiugIAAQZKw
Date: Fri, 24 Nov 2023 02:57:49 +0000
Message-ID:
 <PH0PR12MB5481A6DFAEBD321707E31BDDDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231123092119.2718448-1-parav@nvidia.com>
 <20231123092119.2718448-3-parav@nvidia.com>
 <20231123091129-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481584836D0FD5025B8874EDCB9A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231123174947-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231123174947-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB7442:EE_
x-ms-office365-filtering-correlation-id: b761a2d6-c450-44b6-b07d-08dbec9924b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xd7AsUSSld5pU+ylaQZK7/ZFsuhqJknQ0tk0y27/iyJ2oWxfBHIgRZB0jGwrB6MlRqxpBQE+ouVi9yJy5d1Jb0loBTrSfJYpZibpLKqpabcWTRaZOH3/k3rM2bf7POftDi1JiuWHcCJE6ZglDfogyBEZLmxnU4FF8VA9Z4ENNZDJslyChyqRKGxEAVfaJvMa4Rr0mMnjJOsSepaJOb5+aWeyGdKJWSExLzAQTlExOshxQ2xOfiUJLqbT+ZG1EwJwSyveBAd9VzS80KFEAwdClUv0UsgIYYJgFxvKrH2kXZBho46ZcyF8Hr0Zn3pjeE6J62GZERzVuVFW0m7uRkXaLXExsPjxjG7GOcKSx6a9xKif9Mj3lZWHIHM9hZTBDgs9tLEUgG02PJsd5CdFX/HFRzmELRtGcIBNs+DRFikNDxWuEf/HsBB9etMTHNg+h+Pt49E8nGT3zWVCN6/WTCGRwdUaHt/NbYn+BsZw5e4LrJkubFB6c8YUB0MjxI8tMmCo+vU+C2zbwrkGA9QnDEcf7iZRqoxa6afEbS90le0DZpKLD4jr78IYgPE8tzW75/XivJSNNZ3VGsGz++Rnqw2D//88VVadnyyisGDquug2Gw2Nva3xF4OUbDSIQUlN6YNtDLNM7oFUQcIjxzKA1ZnT98Z0ltGGzxp47rT5KZOURvQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(396003)(376002)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(4326008)(86362001)(8676002)(33656002)(30864003)(8936002)(2906002)(83380400001)(52536014)(55016003)(122000001)(41300700001)(38100700002)(5660300002)(26005)(966005)(478600001)(38070700009)(9686003)(76116006)(66446008)(66476007)(66946007)(66556008)(6506007)(7696005)(316002)(71200400001)(6916009)(54906003)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?D31cB56G1UzbOC26+e1bwhGit00hOrElCScxBZI69PxK1sxl9nXkV+0iNKol?=
 =?us-ascii?Q?G9NT12FpxL6bdcg0J32RLpeWY32TP9dZVlWn4lQAgfIFCD9K+2xJedTgkxQM?=
 =?us-ascii?Q?2W5Sou2njwpD5hs4wXC9UAd49L0qviyPcTvz/RnI9tzGhVh/V453WKp8/iy0?=
 =?us-ascii?Q?jgu2Fj0+hX8dSfJy23RyUXG534VneGITA0CSMAvmjWZ0sb1YE+0PrtyaGv9Y?=
 =?us-ascii?Q?Osq9Escx2P1gBdpOCCKAmVoRVJIdcVtUB38K+eg2fjhgVUjjRFpUHpl8YZUG?=
 =?us-ascii?Q?8+hRBRHuNkFYvImQHL23+eGzFXtyL2WFIVzy4CN7VW42QrMW5ckQYXW3BXfG?=
 =?us-ascii?Q?YjMPWtDxtViYSumt73Y1WBoY9IrPlhofcO1pTytl7T+Ot3a8X+gXouNzoyz4?=
 =?us-ascii?Q?GRI4lmURexPgXN0pPJ2iTGQDP79GNdvVBstiezzLCeePb13hU3QQf1KCYWUl?=
 =?us-ascii?Q?Wwf8Ql66dywYltjeEyEU0yeL1zVRIEIDH+da6lwV7lCt6cey1VIkGQEEiMBA?=
 =?us-ascii?Q?XP5Pfuwf9CbbBa9wDPQedLRAh6RThZA9UckDvsfxFqDwQAeTjK5K+r+fFlC+?=
 =?us-ascii?Q?H++5k2cUBiNvxMgQMofOaM9q2WbXKYEFaGOdsAwlWvm2fYSgYgAqbNh+2mW6?=
 =?us-ascii?Q?G9gLyyi1U2nI6040xsZPBd+PHYErJayBxVFRl5jtPkLP711YtjTP5QLZ13tE?=
 =?us-ascii?Q?G3gyKDuXia+hC49IRlstLZ9xvQM3Cb69m5HBktyDT4szNGd4oFcqfO9FkczK?=
 =?us-ascii?Q?jnEI51C35y/7nDhhn5IHfFefbdAw95WwQEJnHizJ2pNPGBaFtm478GSpuj7Q?=
 =?us-ascii?Q?WSZ46TVR7bhjwLNiBDEoQVxGtbhh8vuvWdVyiaLq5qLgUHVp99G9OCgw6fGq?=
 =?us-ascii?Q?vCUwinze6qL3GXNiDP4xqlOLorAU3M8wCFvLOY6++bn+k66w7nOZ97Eun4Cs?=
 =?us-ascii?Q?lj6w2EufOCqCUsGiMcWtREiYprfsq+yn2LEqqCg2eDN+DFF9rUGyFQexs2Rb?=
 =?us-ascii?Q?vkAfaGk80ZDGD+u4G2Tbbp+yslmuIDPMDuz/wO70Y0Ma7OTzeKtDK4aT1Khl?=
 =?us-ascii?Q?tqMFqI21L2oEJR9RxLXOCNwyRqZUPr9UXjfyBMf0fb3yDr1yIs98S5Mr4iTa?=
 =?us-ascii?Q?qaPLYSqcPOWziyen8v6jPhJLtcfpMDLgfmOuaHK+rHAe7x75iy9EzMz1Bcox?=
 =?us-ascii?Q?8J/1v8fAp1KTK9WQPBzlMRM2iDR0c23oR/CbB+qxlnzITSS5waGq/IbrrfbW?=
 =?us-ascii?Q?5kvobttTfrkJOxidu2ZP0TRW0ewrQsb3Q3fWmY4G+GpZIcWIusBuShSDeeIt?=
 =?us-ascii?Q?pP3aEE1yTvlEZJhVuX9QUfy4KWXHCg5kDruxKTAJaXMMd19BbNorp16YznGW?=
 =?us-ascii?Q?e7njjGOMAdwLBPEL44eghHofSl/nNaHTfK2xVnknXEZbIC69CXnA+U34QyDG?=
 =?us-ascii?Q?Vyko5HmLk1CcctrO4RIOvednDI3RE2UhZjTuMl2x7jYAzyOeM9/paji3VtJl?=
 =?us-ascii?Q?ybtK9tE4iHTV4HsRWx5Ea3KckMDJlq40Z4lF8KAtHfJWTQRW2WeNHd+IzjDe?=
 =?us-ascii?Q?BxNyKhhmey3j/NstLVs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b761a2d6-c450-44b6-b07d-08dbec9924b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 02:57:49.2657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7OOkySOWkHNWx/LZZTYGyQSYwqtdG5MeC/tVEWGgx71OPf2UOnsydKRRj05/H/jT4SRi0TnHW3zu+HeheW/LTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7442
Subject: [virtio-comment] RE: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 24, 2023 4:28 AM
>=20
> On Thu, Nov 23, 2023 at 06:40:59PM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, November 23, 2023 7:44 PM
> > >
> > > On Thu, Nov 23, 2023 at 11:21:16AM +0200, Parav Pandit wrote:
> > > > The device responds flow filter capabilities using two commands.
> > > > One command indicates generic flow filter device limits such as
> > > > number of flow filters, number of flow filter groups, support or
> > > > multiple transports etc.
> > > >
> > > > The second command indicates supported match types, and fields of
> > > > the packet.
> > > >
> > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
> > > > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > >
> > > So I am still unsure about these commands.  What exactly is the point=
?
> > >
> > Two reasons.
> > The device reports maximum capabilities that the driver knows upfront. =
So
> that it does not need to come to device to know when to fail.
>=20
> But that requires driver to keep extra state which can easily get out of =
sync.
Not sure what you mean by get out of sync from whom?
Not from the device.

There are many capabilities here each with a different use.
For many caps, it is to know what is supported/not to decide in the driver.
Certain caps are max to know what is the range of id that driver can use li=
ke flow filter id, group id.

> For what benefit?
>
For functional work.
=20
> > In future one may want to provision certain max limits that device can =
have
> as they eventually will consume certain device hardware resources.
>=20
> I don't exactly see how this helps provisioning.
>=20
Provisioning side will set parameters which will reflect these limits to be=
 same on src and dst hypervisor when device migration is used.

>=20
> > > Patch 5/5 mandates that device validates all fields already.
> >
> > > Are there guests that will actually look at these caps as opposed to
> > > just sending commands and looking at the return status?
> > When the device reaches the limit it would not even send the command.
>=20
>=20
> That's more logic for the driver to implement. Why should it bother when =
it
> can just send it?
>
It can just send it and fail and flood with error logs.
Also it cannot just send some random id based numbers that device does not =
support.

> > For example if the device supports only one group, it wont implement
> ethtool ntuple and will chose only arfs as one example.
>=20
> Sounds like a contrived example why does device even expose flow steering
> then?
It is not contrived at all.

A device may be support one or multiple groups. Each group in the OS has mu=
ltiple users.
One group is enough for either ARFS or ethool but not both.
Two groups can allow ARFS and ethtool to co-exists.
3 groups will allow in future to expose some queues to user apps.

>=20
> >
> > >
> > >
> > > > ---
> > > > changelog:
> > > > v6->v7:
> > > > - plenty of grammar corrections suggested by Cornelia
> > > > v2->v3:
> > > > - rebased on virtio-1.4 branch
> > > > - removed reference for flow filter virtqueue
> > > > v1->v2:
> > > > - addressed comments from Satananda
> > > > - added vlan type match field
> > > > - kept space for types between l2, l3, l4 header match types
> > > > - renamed mask to mask_supported with shorter width
> > > > - made more fields reserved for future
> > > > - addressed comments from Heng
> > > > - grammar correction
> > > > - added field to indicate supported number of actions per flow
> > > >   filter match entry
> > > > - added missing documentation for max_flow_priorities_per_group
> > > > v0->v1:
> > > > - added mask field in the type to indicate supported mask by device
> > > >   and also in later patch to use it to indicate mask on adding
> > > >   flow filter. As a result removed the mask_supported capability
> > > >   field
> > > > ---
> > > >  device-types/net/description.tex | 207
> > > > ++++++++++++++++++++++++++++++-
> > > >  1 file changed, 206 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/device-types/net/description.tex
> > > > b/device-types/net/description.tex
> > > > index 03909ae..10d92d9 100644
> > > > --- a/device-types/net/description.tex
> > > > +++ b/device-types/net/description.tex
> > > > @@ -1170,7 +1170,11 @@ \subsubsection{Flow
> > > > Filter}\label{sec:Device Types / Network Device / Device Ope
> > > >
> > > >  The device indicates the flow filter capabilities to the driver.
> > > > These  capabilities include various maximum device limits and
> > > > -supported packet match fields.
> > > > +supported packet match fields. These control virtqueue commands
> are:
> > > > +\ref{sec:Device Types / Network Device / Device Operation /
> > > > +Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
> > > > +and \ref{sec:Device Types / Network Device / Device Operation /
> > > > +Control
> > > Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
> > > >
> > > >  The flow filters are grouped using a flow filter group. Each flow
> > > > filter  group has a priority. The device first applies the flow
> > > > filters of the highest @@ -1222,6 +1226,136 @@ \subsubsection{Flow
> > > Filter}\label{sec:Device Types / Network Device / Device Ope
> > > >        the flow filters in group_C, the flow filters of next level
> > > > group_B are
> > > applied.
> > > >  \end{itemize}
> > > >
> > > > +\paragraph{Match Types and Fields}\label{sec:Device Types /
> > > > +Network Device / Device Operation / Flow Filter / Match Types and
> > > > +Fields}
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_net_ff_match_type_cap {
> > > > +        le16 type;
> > > > +        u8 mask_supported;
> > > > +        u8 reserved[5];
> > > > +        le64 fields_bmap;
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +The \field{type} corresponds to following table:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Type & Name & Description \\
> > > > +\hline \hline
> > > > +0   & VIRTIO_NET_FF_ETH_HDR & Ethernet header of the packet \\
> > > > +\hline
> > > > +0x1   & VIRTIO_NET_FF_VLAN_TAG_HDR & VLAN tag of the packet \\
> > > > +\hline
> > > > +0x200   & VIRTIO_NET_FF_IPV4_HDR & IPv4 header of the packet \\
> > > > +\hline
> > > > +0x300   & VIRTIO_NET_FF_IPV6_HDR & IPv6 header of the packet \\
> > > > +\hline
> > > > +0x400   & VIRTIO_NET_FF_TCP_HDR & TCP header of the packet \\
> > > > +\hline
> > > > +0x500   & VIRTIO_NET_FF_UDP_HDR & UDP header of the packet \\
> > > > +\hline
> > > > +other   & -    & reserved \\
> > > > +\hline
> > > > +\end{tabular}
> > > > +
> > > > +When \field{mask_supported} is set, for the specific
> > > > +\field{type}, the device can mask packet fields with the mask
> > > > +supplied in the flow filter match entry.
> > > > +
> > > > +For each \field{type} the \field{fields_bmap} indicates supported
> > > > +fields of the packet header which can be matched.
> > > > +
> > > > +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields are
> > > > +represented by a bitmap in \field{fields_bmap} as follows:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Bit & Name & Description \\
> > > > +\hline \hline
> > > > +0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the
> packet
> > > \\
> > > > +\hline
> > > > +1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet
> \\
> > > > +\hline
> > > > +2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
> > > > +\hline
> > > > +other   & -    & reserved \\
> > > > +\hline
> > > > +\end{tabular}
> > > > +
> > > > +For the \field{type} of VIRTIO_NET_FF_VLAN_TAG_HDR, VLAN tag
> > > > +fields are represented by a bitmap in \field{fields_bmap} as follo=
ws:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Bit & Name & Description \\
> > > > +\hline \hline
> > > > +0   & VIRTIO_NET_FF_VLAN_TAG_TCI & Vlan tag TCI 16-bit field \\
> > > > +\hline
> > > > +other   & -    & reserved \\
> > > > +\hline
> > > > +\end{tabular}
> > > > +
> > > > +For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, header fields are
> > > > +represented by a bitmap in \field{fields_bmap} as follows:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Bit & Name & Description \\
> > > > +\hline \hline
> > > > +0   & VIRTIO_NET_FF_SRC_IPV4 & Source IPV4 address in the packet \=
\
> > > > +\hline
> > > > +1   & VIRTIO_NET_FF_DST_IPV4 & Destination IPV4 address in the
> packet
> > > \\
> > > > +\hline
> > > > +other   & -    & reserved \\
> > > > +\hline
> > > > +\end{tabular}
> > > > +
> > > > +For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields are
> > > > +represented by a bitmap in \field{fields_bmap} as follows:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Bit & Name & Description \\
> > > > +\hline \hline
> > > > +0   & VIRTIO_NET_FF_SRC_IPV6 & Source IPV6 address in the packet \=
\
> > > > +\hline
> > > > +1   & VIRTIO_NET_FF_DST_IPV6 & Destination IPV6 address in the
> packet
> > > \\
> > > > +\hline
> > > > +other   & -    & reserved \\
> > > > +\hline
> > > > +\end{tabular}
> > > > +
> > > > +For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields are
> > > > +represented by a bitmap in \field{fields_bmap} as follows:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Bit & Name & Description \\
> > > > +\hline \hline
> > > > +0   & VIRTIO_NET_FF_SRC_TCP_PORT & Source TCP port in the packet
> \\
> > > > +\hline
> > > > +1   & VIRTIO_NET_FF_DST_TCP_PORT & Destination TCP port in the
> packet
> > > \\
> > > > +\hline
> > > > +other   & -    & reserved \\
> > > > +\hline
> > > > +\end{tabular}
> > > > +
> > > > +For the \field{type} of VIRTIO_NET_FF_UDP_HDR, header fields are
> > > > +represented by a bitmap in \field{fields_bmap} as follows:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Bit & Name & Description \\
> > > > +\hline \hline
> > > > +0   & VIRTIO_NET_FF_SRC_UDP_PORT & Source UDP port in the
> packet \\
> > > > +\hline
> > > > +1   & VIRTIO_NET_FF_DST_UDP_PORT & Destination UDP port in the
> > > packet \\
> > > > +\hline
> > > > +other   & -    & reserved  \\
> > > > +\hline
> > > > +\end{tabular}
> > > > +
> > > >  \subsubsection{Control Virtqueue}\label{sec:Device Types /
> > > > Network Device / Device Operation / Control Virtqueue}
> > > >
> > > >  The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
> > > > @@
> > > > -2389,6 +2523,77 @@ \subsubsection{Control
> > > > Virtqueue}\label{sec:Device Types / Network Device / Devi  of the
> > > > driver's records. In such cases, the driver should allocate
> > > > additional  space for the \field{command-
> > > specific-result} buffer.
> > > >
> > > > +\paragraph{Flow Filter}\label{sec:Device Types / Network Device /
> > > > +Device Operation / Control Virtqueue / Flow Filter}
> > > > +
> > > > +If the VIRTIO_NET_F_FLOW_FILTER feature is negotiated,
> > > > +
> > > > +\begin{itemize}
> > > > +\item the driver can send commands VIRTIO_NET_CTRL_FF_CAP_GET
> and
> > > > +VIRTIO_NET_CTRL_FF_MATCH_CAP_GET to query the flow filter
> > > > +capabilities of the device.
> > > > +\end{itemize}
> > > > +
> > > > +\begin{lstlisting}
> > > > +#define VIRTIO_NET_CTRL_FF 7
> > > > + #define VIRTIO_NET_CTRL_FF_CAP_GET 0  #define
> > > > +VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1 \end{lstlisting}
> > > > +
> > > > +\subparagraph{Flow Filter Capabilities Get}\label{sec:Device
> > > > +Types / Network Device / Device Operation / Control Virtqueue /
> > > > +Flow Filter / Flow Filter Capabilities Get}
> > > > +
> > > > +The command VIRTIO_NET_CTRL_FF_CAP_GET provides the flow filter
> > > device capabilities.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_net_ctrl_ff_caps {
> > > > +        le16 max_match_fields;
> > > > +        le16 max_groups; /* valid group id =3D max_groups - 1 */
> > > > +        le32 max_ff_per_group;
> > > > +        le32 max_ff; /* max flow_id in add/del =3D max_ff - 1 */
> > > > +        le16 max_actions;
> > > > +        u8 max_flow_priorities_per_group; }; \end{lstlisting}
> > > > +
> > > > +\field{max_groups} indicates total number of flow filter groups
> > > > +supported by the device whose group identifiers can be any value
> > > > +in the range from 0 to \field{max_groups - 1}. The flow filter
> > > > +group can have any priority in range of 0 to \field{max_groups - 1=
}.
> > > > +
> > > > +\field{max_ff_per_group} indicates the maximum number of flow
> > > > +filters per flow filter group which can be added by the driver.
> > > > +
> > > > +\field{max_ff} indicates the maximum number of flow filters
> > > > +across all the flow groups which can be added by the driver.
> > > > +
> > > > +\field{max_ff_priorities_per_group} indicates the maximum
> > > > +priority value of a flow filter within a group. A flow filter
> > > > +within a group can have any priority in range of zero to
> > > \field{max_ff_priorities_per_group - 1}.
> > > > +
> > > > +\field{max_match_fields} indicates maximum number of fields of a
> > > > +packet which can be matched by the device for a flow filter.
> > > > +
> > > > +\field{max_actions} indicates maximum number of actions for a
> > > > +flow filter that can be supplied.
> > > > +
> > > > +\field{max_flow_priorities_per_group} indicates maximum number of
> > > > +priorities supported by the device per flow filter group.
> > > > +
> > > > +\subparagraph{Flow Filter Match Capabilities
> > > > +Get}\label{sec:Device Types / Network Device / Device Operation /
> > > > +Control Virtqueue / Flow Filter / Flow Filter Match Capabilities
> > > > +Get}
> > > > +
> > > > +The command VIRTIO_NET_CTRL_FF_MATCH_CAP_GET indicates
> which
> > > fields
> > > > +of the packet can be matched.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_net_ctrl_ff_match_types {
> > > > +        le32 num_entries;
> > > > +        struct virtio_net_ff_match_type_cap types[]; };
> > > > +\end{lstlisting}
> > > > +
> > > > +\field{num_entries} indicates the length of the array \field{types=
}.
> > > > +Each array entry of \field{types} represents the fields of the
> > > > +packet which are supported for matching by the device.
> > > > +
> > > >  \subsubsection{Legacy Interface: Framing
> > > > Requirements}\label{sec:Device  Types / Network Device / Legacy
> > > > Interface: Framing Requirements}
> > > >
> > > > --
> > > > 2.34.1


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

