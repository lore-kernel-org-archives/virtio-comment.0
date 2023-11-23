Return-Path: <virtio-comment-return-8574-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602EEC61D85
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 18:41:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 974BD2AEDE
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 18:41:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 74DAE9868AC
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 18:41:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 582B09868A2; Thu, 23 Nov 2023 18:41:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 48D599868A3
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Nov 2023 18:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDOBsYdXniqxfJpf6i/9zHSWp3Z2+jNgNF946yxVhJwZIcpjoKd5C8L8hY++yep4GgcUv+u9i2s1DtT1CtQ9pOoky0U8zHuFdwj3nWY7dXInP9ql0Sju8TNDQuj88/w1gfnYGMuuVXME0Pr5o1881il9S3dXPuX8IorsvIiSAZZsFaK7Exh5t4AcnntDdBTBNMRF21udEe9LoysjCRmA1/Qb3QodKAW1+UFJNpaqA0PSWJv1X/5ulzICGlhESWE2a0NQOpmNCu4ZnIL+XM3udVBA1JiuXRvJVm7yDMKsGf1YHNFM548K54W+lyL3TIXdXKwk/8ctBnIxyUahV5lhow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUSbxoV14peS802h+0XTjAfZp7umGx7c8oknAgiO2vU=;
 b=fYvf4+DLAS7jKnO6AElbcPZT46s056v7/KRGGU66Ux2vDOtkqG1XaXMhhTtszH/rfa72bpz428wwnl/p2lrLcFN8VA7sT9GPwJKpS9mr0GzwmyLbR89TaNJ6tvd86+3/D/Go/DbMsRhjZfiu2x5+vCNdpcmu/qbhKeEoRL2lyFDi+MMfLX9WtuUZIlGxxTWWAbziAugRDoKdCYufEFN7fN/F6169Kkq3hbCTJ+1HHbxuE9T231AkY07IThgezXDN86plGsnRemku9ZSt1qNTwvVWfUh9dADwYxEd2nSdCvwMLJxAR0Zct2OrhMj78rb1fqttyidljWcWC0W01Sq9SQ==
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
Thread-Index: AQHaHe6IXCl5jgtp9E+7xZjgBxzICbCH8raAgABJqFA=
Date: Thu, 23 Nov 2023 18:40:59 +0000
Message-ID:
 <PH0PR12MB5481584836D0FD5025B8874EDCB9A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231123092119.2718448-1-parav@nvidia.com>
 <20231123092119.2718448-3-parav@nvidia.com>
 <20231123091129-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231123091129-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH0PR12MB5314:EE_
x-ms-office365-filtering-correlation-id: 610c5081-b937-42db-5a0c-08dbec53bcd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QjR9RkQgWbWn8kNtG+R4SHgtBMxstrbcqXbigdVT0ERZaKKwOF1jAftsoT0wuWuJH9u21ReW3Ou7QoWC5AQGU/9neGnEVagN8Go0rl3MF5K2BeTjHpF0DpKMLOa7WLT7feGqTVhqTTVb0BEO2/spfKHIVPLYBaMyZ+jq2B8AZUSrACGNepoYIk/F7sTL9G3yHDctTkBqXmijN1zDDonuTuTc0wNDVHqTfpYN7Q/P7ELeuO3SlgCc/EdGdEzCKEqGTAlfTHTmqzzhh+KubMuivfsaGJpJytfUZuFMliAOrXIrA+pDtcQsfDp13b1CcaxV9tZhUu1ude4XbK/kvAmwXDUYRajGCrsVkpXvHoetXxVXDTJuPwlOsaN17J6LT226iuNpb9onOv7/wCRTLbGd+Adkj6xveOiKWEcGvLvgtdmnfcK24obZIaDjp8gpDRZUIbSRasZLsO2H4FZe8hEFHAGe3nqKS5sZl44elUKJExsuuO4pb5TfMTv16RSSaJCdNZPwgLZ/WtZasv+ohbiVA12wzY7RQ92FiBaLCLt+ogwt1AdESo5AQa0Q8F9ED/7vlRnWLyGApln87VJ+JteMvUYodAMnjIT8wyobuxy5TckeNQA283H2txHJVtUDotgZd+6RKpcARAg5rTCmXGc2ZgICdx/GXcUknW+MFZUDA/E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(478600001)(55016003)(71200400001)(966005)(2906002)(5660300002)(86362001)(52536014)(30864003)(4326008)(26005)(64756008)(33656002)(41300700001)(83380400001)(6916009)(76116006)(8936002)(66556008)(8676002)(54906003)(66946007)(66476007)(66446008)(316002)(7696005)(6506007)(9686003)(38070700009)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Q/Y4b1j/XVApwkwX/+wbeTGvSl1jclslTsNRylg1KtVhASB2Vi/xUORLic8K?=
 =?us-ascii?Q?iYWlU0YLn8bGktWLUWTeR7r9iSFlhIP46dmpg3KFEfwpnjY1iCrdjHd3v+Q1?=
 =?us-ascii?Q?eDkhJOMskvbU9l8OG+g3Cu9ptoU3OSBQj6SaS16aLIXEODOouBDUQyyymQuO?=
 =?us-ascii?Q?sec12fvQYy9EJp4t2Nsw90KLw+ykXg0U5PIzil1EYtF0knUftgkg/gqDQLgA?=
 =?us-ascii?Q?ZIfzAIWe5etYA6ZUu4x7nbvFHKgBoL2tOyWkHgbIY/Lxj+a4Z03iWP9Q/bSk?=
 =?us-ascii?Q?w7EAiwY3RT63dvWdP9EZrkrjgHvIk1EYR+uQ6QWvnG91al2p6zkJ79ARyEIc?=
 =?us-ascii?Q?KCL8mqqPmQcgPBzZPqi9+Ev7K6zndx+55UAc85oGc6jAZCFB4XoA7WLBMBj+?=
 =?us-ascii?Q?ki8IUQG9+bBGfDrZM1KUIxoEI2DEuU7qgb9WPId/mr+u1y47UZuRdzpH/ho/?=
 =?us-ascii?Q?4EhxIZ8zgapD4aO15VruybLfuTqvo8UVYBSm0miSgqHJqhs9I96Rb5Q1Xf7Y?=
 =?us-ascii?Q?h1YQNbbLX7DRxt3J9SzmEs/WTDX2OChS1f48BGX7bPMNv/namBD7qB5tiyya?=
 =?us-ascii?Q?o8QGEMzE0PvLd2AB3jK4rIgPCf13Ok2vfoFRGPZ+G3TzTOpaqpCMv7bSAl3S?=
 =?us-ascii?Q?6rSt1zpoaNSPjhS2+2mhOkP7Ed+wchJ8Bzl2n23rRq/zXDi+tZ8Fy5xZREAm?=
 =?us-ascii?Q?bNQ7dOllvYvNWdzVW/3lvaRVlfuCL5G9uxRFa3r6V0lqxP60Gvri20i7Qdym?=
 =?us-ascii?Q?rfc5v6wnF+b6QwNxUvwmQki9oIEmgmH+s5T8LO86fOTxprGklPDFEgekZ5Pu?=
 =?us-ascii?Q?s44NnzQ9cANShMUHLIFYa5vmUMIhJYmkC7LKNTFj86OOWKAg/ZRDhkfdYWNs?=
 =?us-ascii?Q?nV1zrMkW0OCx96DYR2RnKM/+lv+EelR1iXaQ/bj2eCDq0l4IFQLkx/qpQTMJ?=
 =?us-ascii?Q?00rJC6CCtbTNunKIeVqFlWQnFITh3eNgqQBwiSCWKcWDTW5Lwc0h1hVMEAlT?=
 =?us-ascii?Q?MbJWUaX3Qe822X+PHw+ea9CIcCcjvHvgTt+6FHdQosDQseDjqUH7GJA02eR1?=
 =?us-ascii?Q?vu8aiZNTMSOP6uyzGGy4/fjVLTlaEugo5lLevH/XKEFY4dX05s9YxOHsE0hM?=
 =?us-ascii?Q?cwGaE5Y2geqd3n13zn212cS7luP7m4m5f5e47LXyuaLyReZZ15qHXozodQVl?=
 =?us-ascii?Q?LADSfs2/SRxaJY5FSb6JH8i++j734QHMem22Eoyr5kWTwNuZ8z0aoxwL2MM5?=
 =?us-ascii?Q?lWz9Wyk7PE8y8apxnIPc48Fn5eb7nsYActocPN6uUY6TlWvbhDDfLl845cOL?=
 =?us-ascii?Q?D8pp995Ff5f5RdVbjBT9Xwl334IwgmvK1I9Z2SZ7ubvRIgMMXzECwYciABLV?=
 =?us-ascii?Q?VUU/NnX8+hxlTd0Otza7b5ITANBlmUq+xoZGTgWJ09iCwEvtxn2gOtSe2qJe?=
 =?us-ascii?Q?nCSpH2QbApPw7fLZV2PSPqX0ELrX+O7w6KcGXMsyRdBCRgWF6FZmvuA+rSBk?=
 =?us-ascii?Q?54F4jJzi0Esb3Y/DJRZisYiOSQaaJotwDv3JRb8Imt4bVNwDQ9UD8mz9WOPm?=
 =?us-ascii?Q?AnNDHvFrHtTCLjGgHX0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 610c5081-b937-42db-5a0c-08dbec53bcd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 18:40:59.7172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y8uA0SL9uCKHwW/dqNBmd71ZOTM5A5I9IexFV6S2UpMo7o5HfKLpVwTo+zXlFiVNSZAkMky7WK4cqJRpdusuiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5314
Subject: [virtio-comment] RE: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, November 23, 2023 7:44 PM
>=20
> On Thu, Nov 23, 2023 at 11:21:16AM +0200, Parav Pandit wrote:
> > The device responds flow filter capabilities using two commands.
> > One command indicates generic flow filter device limits such as number
> > of flow filters, number of flow filter groups, support or multiple
> > transports etc.
> >
> > The second command indicates supported match types, and fields of the
> > packet.
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
> > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
>=20
> So I am still unsure about these commands.  What exactly is the point?
>=20
Two reasons.
The device reports maximum capabilities that the driver knows upfront. So t=
hat it does not need to come to device to know when to fail.

In future one may want to provision certain max limits that device can have=
 as they eventually will consume certain device hardware resources.

> Patch 5/5 mandates that device validates all fields already.

> Are there guests that will actually look at these caps as opposed to just
> sending commands and looking at the return status?
When the device reaches the limit it would not even send the command.

For example if the device supports only one group, it wont implement ethtoo=
l ntuple and will chose only arfs as one example.


>=20
>=20
> > ---
> > changelog:
> > v6->v7:
> > - plenty of grammar corrections suggested by Cornelia
> > v2->v3:
> > - rebased on virtio-1.4 branch
> > - removed reference for flow filter virtqueue
> > v1->v2:
> > - addressed comments from Satananda
> > - added vlan type match field
> > - kept space for types between l2, l3, l4 header match types
> > - renamed mask to mask_supported with shorter width
> > - made more fields reserved for future
> > - addressed comments from Heng
> > - grammar correction
> > - added field to indicate supported number of actions per flow
> >   filter match entry
> > - added missing documentation for max_flow_priorities_per_group
> > v0->v1:
> > - added mask field in the type to indicate supported mask by device
> >   and also in later patch to use it to indicate mask on adding
> >   flow filter. As a result removed the mask_supported capability
> >   field
> > ---
> >  device-types/net/description.tex | 207
> > ++++++++++++++++++++++++++++++-
> >  1 file changed, 206 insertions(+), 1 deletion(-)
> >
> > diff --git a/device-types/net/description.tex
> > b/device-types/net/description.tex
> > index 03909ae..10d92d9 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -1170,7 +1170,11 @@ \subsubsection{Flow Filter}\label{sec:Device
> > Types / Network Device / Device Ope
> >
> >  The device indicates the flow filter capabilities to the driver.
> > These  capabilities include various maximum device limits and
> > -supported packet match fields.
> > +supported packet match fields. These control virtqueue commands are:
> > +\ref{sec:Device Types / Network Device / Device Operation / Control
> > +Virtqueue / Flow Filter / Flow Filter Capabilities Get} and
> > +\ref{sec:Device Types / Network Device / Device Operation / Control
> Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
> >
> >  The flow filters are grouped using a flow filter group. Each flow
> > filter  group has a priority. The device first applies the flow
> > filters of the highest @@ -1222,6 +1226,136 @@ \subsubsection{Flow
> Filter}\label{sec:Device Types / Network Device / Device Ope
> >        the flow filters in group_C, the flow filters of next level grou=
p_B are
> applied.
> >  \end{itemize}
> >
> > +\paragraph{Match Types and Fields}\label{sec:Device Types / Network
> > +Device / Device Operation / Flow Filter / Match Types and Fields}
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_ff_match_type_cap {
> > +        le16 type;
> > +        u8 mask_supported;
> > +        u8 reserved[5];
> > +        le64 fields_bmap;
> > +};
> > +\end{lstlisting}
> > +
> > +The \field{type} corresponds to following table:
> > +
> > +\begin{tabular}{|l|l|l|}
> > +\hline
> > +Type & Name & Description \\
> > +\hline \hline
> > +0   & VIRTIO_NET_FF_ETH_HDR & Ethernet header of the packet \\
> > +\hline
> > +0x1   & VIRTIO_NET_FF_VLAN_TAG_HDR & VLAN tag of the packet \\
> > +\hline
> > +0x200   & VIRTIO_NET_FF_IPV4_HDR & IPv4 header of the packet \\
> > +\hline
> > +0x300   & VIRTIO_NET_FF_IPV6_HDR & IPv6 header of the packet \\
> > +\hline
> > +0x400   & VIRTIO_NET_FF_TCP_HDR & TCP header of the packet \\
> > +\hline
> > +0x500   & VIRTIO_NET_FF_UDP_HDR & UDP header of the packet \\
> > +\hline
> > +other   & -    & reserved \\
> > +\hline
> > +\end{tabular}
> > +
> > +When \field{mask_supported} is set, for the specific \field{type},
> > +the device can mask packet fields with the mask supplied in the flow
> > +filter match entry.
> > +
> > +For each \field{type} the \field{fields_bmap} indicates supported
> > +fields of the packet header which can be matched.
> > +
> > +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields are
> > +represented by a bitmap in \field{fields_bmap} as follows:
> > +
> > +\begin{tabular}{|l|l|l|}
> > +\hline
> > +Bit & Name & Description \\
> > +\hline \hline
> > +0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the packet
> \\
> > +\hline
> > +1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet \\
> > +\hline
> > +2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
> > +\hline
> > +other   & -    & reserved \\
> > +\hline
> > +\end{tabular}
> > +
> > +For the \field{type} of VIRTIO_NET_FF_VLAN_TAG_HDR, VLAN tag fields
> > +are represented by a bitmap in \field{fields_bmap} as follows:
> > +
> > +\begin{tabular}{|l|l|l|}
> > +\hline
> > +Bit & Name & Description \\
> > +\hline \hline
> > +0   & VIRTIO_NET_FF_VLAN_TAG_TCI & Vlan tag TCI 16-bit field \\
> > +\hline
> > +other   & -    & reserved \\
> > +\hline
> > +\end{tabular}
> > +
> > +For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, header fields are
> > +represented by a bitmap in \field{fields_bmap} as follows:
> > +
> > +\begin{tabular}{|l|l|l|}
> > +\hline
> > +Bit & Name & Description \\
> > +\hline \hline
> > +0   & VIRTIO_NET_FF_SRC_IPV4 & Source IPV4 address in the packet \\
> > +\hline
> > +1   & VIRTIO_NET_FF_DST_IPV4 & Destination IPV4 address in the packet
> \\
> > +\hline
> > +other   & -    & reserved \\
> > +\hline
> > +\end{tabular}
> > +
> > +For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields are
> > +represented by a bitmap in \field{fields_bmap} as follows:
> > +
> > +\begin{tabular}{|l|l|l|}
> > +\hline
> > +Bit & Name & Description \\
> > +\hline \hline
> > +0   & VIRTIO_NET_FF_SRC_IPV6 & Source IPV6 address in the packet \\
> > +\hline
> > +1   & VIRTIO_NET_FF_DST_IPV6 & Destination IPV6 address in the packet
> \\
> > +\hline
> > +other   & -    & reserved \\
> > +\hline
> > +\end{tabular}
> > +
> > +For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields are
> > +represented by a bitmap in \field{fields_bmap} as follows:
> > +
> > +\begin{tabular}{|l|l|l|}
> > +\hline
> > +Bit & Name & Description \\
> > +\hline \hline
> > +0   & VIRTIO_NET_FF_SRC_TCP_PORT & Source TCP port in the packet \\
> > +\hline
> > +1   & VIRTIO_NET_FF_DST_TCP_PORT & Destination TCP port in the packet
> \\
> > +\hline
> > +other   & -    & reserved \\
> > +\hline
> > +\end{tabular}
> > +
> > +For the \field{type} of VIRTIO_NET_FF_UDP_HDR, header fields are
> > +represented by a bitmap in \field{fields_bmap} as follows:
> > +
> > +\begin{tabular}{|l|l|l|}
> > +\hline
> > +Bit & Name & Description \\
> > +\hline \hline
> > +0   & VIRTIO_NET_FF_SRC_UDP_PORT & Source UDP port in the packet \\
> > +\hline
> > +1   & VIRTIO_NET_FF_DST_UDP_PORT & Destination UDP port in the
> packet \\
> > +\hline
> > +other   & -    & reserved  \\
> > +\hline
> > +\end{tabular}
> > +
> >  \subsubsection{Control Virtqueue}\label{sec:Device Types / Network
> > Device / Device Operation / Control Virtqueue}
> >
> >  The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is @@
> > -2389,6 +2523,77 @@ \subsubsection{Control Virtqueue}\label{sec:Device
> > Types / Network Device / Devi  of the driver's records. In such cases,
> > the driver should allocate additional  space for the \field{command-
> specific-result} buffer.
> >
> > +\paragraph{Flow Filter}\label{sec:Device Types / Network Device /
> > +Device Operation / Control Virtqueue / Flow Filter}
> > +
> > +If the VIRTIO_NET_F_FLOW_FILTER feature is negotiated,
> > +
> > +\begin{itemize}
> > +\item the driver can send commands VIRTIO_NET_CTRL_FF_CAP_GET and
> > +VIRTIO_NET_CTRL_FF_MATCH_CAP_GET to query the flow filter
> > +capabilities of the device.
> > +\end{itemize}
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_NET_CTRL_FF 7
> > + #define VIRTIO_NET_CTRL_FF_CAP_GET 0  #define
> > +VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1 \end{lstlisting}
> > +
> > +\subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types /
> > +Network Device / Device Operation / Control Virtqueue / Flow Filter /
> > +Flow Filter Capabilities Get}
> > +
> > +The command VIRTIO_NET_CTRL_FF_CAP_GET provides the flow filter
> device capabilities.
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_ctrl_ff_caps {
> > +        le16 max_match_fields;
> > +        le16 max_groups; /* valid group id =3D max_groups - 1 */
> > +        le32 max_ff_per_group;
> > +        le32 max_ff; /* max flow_id in add/del =3D max_ff - 1 */
> > +        le16 max_actions;
> > +        u8 max_flow_priorities_per_group; }; \end{lstlisting}
> > +
> > +\field{max_groups} indicates total number of flow filter groups
> > +supported by the device whose group identifiers can be any value in
> > +the range from 0 to \field{max_groups - 1}. The flow filter group can
> > +have any priority in range of 0 to \field{max_groups - 1}.
> > +
> > +\field{max_ff_per_group} indicates the maximum number of flow filters
> > +per flow filter group which can be added by the driver.
> > +
> > +\field{max_ff} indicates the maximum number of flow filters across
> > +all the flow groups which can be added by the driver.
> > +
> > +\field{max_ff_priorities_per_group} indicates the maximum priority
> > +value of a flow filter within a group. A flow filter within a group
> > +can have any priority in range of zero to
> \field{max_ff_priorities_per_group - 1}.
> > +
> > +\field{max_match_fields} indicates maximum number of fields of a
> > +packet which can be matched by the device for a flow filter.
> > +
> > +\field{max_actions} indicates maximum number of actions for a flow
> > +filter that can be supplied.
> > +
> > +\field{max_flow_priorities_per_group} indicates maximum number of
> > +priorities supported by the device per flow filter group.
> > +
> > +\subparagraph{Flow Filter Match Capabilities Get}\label{sec:Device
> > +Types / Network Device / Device Operation / Control Virtqueue / Flow
> > +Filter / Flow Filter Match Capabilities Get}
> > +
> > +The command VIRTIO_NET_CTRL_FF_MATCH_CAP_GET indicates which
> fields
> > +of the packet can be matched.
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_ctrl_ff_match_types {
> > +        le32 num_entries;
> > +        struct virtio_net_ff_match_type_cap types[]; };
> > +\end{lstlisting}
> > +
> > +\field{num_entries} indicates the length of the array \field{types}.
> > +Each array entry of \field{types} represents the fields of the packet
> > +which are supported for matching by the device.
> > +
> >  \subsubsection{Legacy Interface: Framing
> > Requirements}\label{sec:Device  Types / Network Device / Legacy
> > Interface: Framing Requirements}
> >
> > --
> > 2.34.1


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

