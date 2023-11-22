Return-Path: <virtio-comment-return-8559-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53240C61D97
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 14:10:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B69742A89B
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 14:10:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8D75F98689A
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 14:10:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 72A45986896; Wed, 22 Nov 2023 14:10:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 621FE986898
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 14:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqjU6JLq/7cRgGY5F9mou+G8u2X2dfyhoiEulg+xCjLKB+AJfQwL5F038VwxnbFAXHlJTf51yiCK/pyRzqPxFcujoonTj7H8RbG8JSwizzNKezRpe57QeFv1HGK90AdLIS/bvkY1MVo+49UfnAUDD25vfMbP5fY/kYPQG+AixmDav8I0riUA29iX2ePtIBK7M/CV8ly3yWVOORp5ZZuYfE9kaRwwje2SBApfRr68pXt2xB7A36SpKMO/BQNDcDfpRUKzlZrApFZwBH3av+9rH/kOiSFRS93uonH29fTn02EInYnG/kRK0Kf/442fKjBv3FIfNFMzFu6DPZ5m9J2IfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9fgJ5Kt0XQeIT7VJC7LWvwOjRlIcW5C/71i6gOu7Hc=;
 b=a2kM7xaLLH2Boggf/07O3eO13Jh1eV75ghdhsCJ/QP9OlAYX0Q15HONsCCtZ4zzNmVFN/lgVKNoyAnWv+BAN85hUp1LEGxVs56TH6//8USXAc0S36cyjOFNDX/lSEuF3Si5pBE/NtDdZknNmXdJdqPZwtXfZlwZStwuZCzWe+jQQQB5W/x6EvppSExHQLDZ+Cn1TE4yqMoJMfCD/n7eCjqcCZpBhnJuXSIFrvAJhY+VrlO4IbUBuVB5hkOBRpS+NChVduyNAaSdc9t8mDjwsYsPaWi88bOs7TZXIfRqscDbR0qsxcYAzOpyE0ugvemqltriXANiNTrUgEEZkDvHYWQ==
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
Thread-Topic: [PATCH v6 2/5] virtio-net: Add flow filter capabilities read
 commands
Thread-Index: AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3A=
Date: Wed, 22 Nov 2023 14:10:29 +0000
Message-ID:
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231122084105-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB8436:EE_
x-ms-office365-filtering-correlation-id: a7aae788-63e4-4678-379b-08dbeb64c89f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 HC70BWPq6PbaT1+m12nkw8IGyd6ejgYsU0+ZzocNL4A6rMECkzrILhnLqX2zAhzUk4JFxSs0Qy55S9VwLn+SIgA9prSEHOxnTTY1Xpi4rNfK//waQEzNbRLSUWdGi3fxfXK4YxKp0cMBejIrVboJfRtNBrCQBwKbf3J6AdikbhU2jbt2dhZJGC/abz03b1hmCHNuy5EVu8SumvPQy+kCdeCfO7hv57r7F/bs3LyRei00euaUSl/6WytFkhzQPPSKPHZOcsM+aIig1FbQSNU4LFklmORvyDjrIClLl1tVoguo7Tb6pI+i28wTaYkujIw9IpZ5OfU+i8j3YpaVAnGc59E61wcyTtmQxA+lUHEPmIO+4BYV/OIn/NwXHoHwlr9NObagePfsLGEnb9x0YiJu5HgwqTiZExQYwr9vAcXT+PdnELzXdCUQzkvxdJSQXPLjJJS8qF1tr5S+pGkOibl6/v0YdTcwsjSYn1axCBllkvji9POPlmvk3oAJPuykOyWu6ou2DxtodI7bdXffrJubJ69/9WsYBUEbENkbqJCy9nvMHzK2+mQRo6OZlpw86a7q6cbQOQhFEStbQbiJ4NFdbebxa9/ZliS8dXXNZ6vJyFEmgi6eTD/y5FfALG0Cthu0gV53vdSS0EBGQ+dkkIqkBH/OqTPlBzHZVRbWtr4YGQNiHC++DkxIQvGQNH8yZ1ZF7PRJb82LHh5ApM0I86IGPKb/vlX++5My9hq6rffeCRc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(55016003)(5660300002)(8936002)(4326008)(8676002)(52536014)(7696005)(6506007)(86362001)(966005)(66946007)(76116006)(54906003)(66446008)(64756008)(66556008)(66476007)(122000001)(316002)(6916009)(33656002)(38100700002)(2906002)(41300700001)(83380400001)(26005)(478600001)(9686003)(38070700009)(5930299018)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WbXj2f9mTjG5xWu8i8I07RZu3WF0RDS1wbB+6/wZe5AC/2Q3cFMJ7orMm/zj?=
 =?us-ascii?Q?OIVvl6QF3vz6dB7M7HdFKAAOROa0aG+yrsJTtoP2d6jUB9KB/ZDpkoXw1qXc?=
 =?us-ascii?Q?pfNSLkui0Ca9kO+yIQrW081ZAoB4ziUH7EZsFPQ6UTHpp+X+Yn09bssTazFQ?=
 =?us-ascii?Q?ThBInQ9LdMsUId4R7fUzqqdAhZqIre3pJagaYDPyuNYMpw2xsDMzkwGVIbIT?=
 =?us-ascii?Q?x08YG+As8zqokQpqXgTgoW9mtvxvDmMyWYYV5tvr3GmppA0pgxFMRbmf8Dfi?=
 =?us-ascii?Q?hdnZQP6Sj82PGksRALec9alOrEWs8hCiSlLO3aRao7KA3bkfJDksIgU2Vyz5?=
 =?us-ascii?Q?6Z6Dmmb58M33TduaUkn3G+DfQ9C23Lfl5F+DTobE3UZJ8iZEoaQ8bVEIZjLL?=
 =?us-ascii?Q?5qmz50h5HxH665U/rQ9TCdoUuxTtdYchD8sM/V+68kTP7xuCwq8/GZAiyg96?=
 =?us-ascii?Q?0dQJYDNarhDiltoy3qBBWvFvIhA6eD7R/8uSobOrE9oIvEPByXPvXV7Ewke7?=
 =?us-ascii?Q?rGcf1gFY64uuvs2MHKyaNxJlD4UWBmefj0OLU9F7KtWDJ75ZFtJ7han975QM?=
 =?us-ascii?Q?bNGZPfO5S/Lfwc6shW0eJCxm6qra+oyeWEcHAyLkZDRO1IsfhI+LkhVdReO2?=
 =?us-ascii?Q?+iMXGe5cR2roMyvRRS6gt0Tw2JoRUhxDQnxM2fW7p9QD3Dn6nCYFfkv56rSH?=
 =?us-ascii?Q?GE/m75hzO+zJTGy8M/VDxB7dhhCfOkEzasMQE6Xo91fBdLDRyh+XZCGFwccU?=
 =?us-ascii?Q?YgQy3VwMFGZalWIvV0r3Ubt6TV215z1nbkUQ9tgZ9ud6YO8VQZ8zktDXGYc8?=
 =?us-ascii?Q?N6sK7YF9cgA+cbNWxpbpmpdOIw0AcY5O+K444MLoRrqIvH7rOpERJUQPNIrV?=
 =?us-ascii?Q?1EnWynf8gSeN81Z04YEbU770QgcE9dROqMfCqPJbYq9dy+H6aWtXfNVFW5lo?=
 =?us-ascii?Q?Tqxn6Myvq9xq7Y3dogo0JSymYQT4EHMFZqA/yaqu3G5CqDKt8/ntr93Smklx?=
 =?us-ascii?Q?hzDdTfpck6wpuv1CTEDZQm7nT7t+J3TUkqQiDH/a+q3OHn/QXyojmz4uYeUk?=
 =?us-ascii?Q?iuEbd59fO9ISIZteZa8l6ihRwNR8nGdHyWj5m09gzx610AcmmOuSoNn4UBdZ?=
 =?us-ascii?Q?WkozEMgye6NKQY/q9ctrFZKG2oG1qmpmMrA4xvhKrVGN+Jvu/lYuNhZyVHal?=
 =?us-ascii?Q?jpam+Kquyj9WDEHr8HHbD+J4WdDej//uCMXd/n7KERDCS8lF9XvDAGn/vGTb?=
 =?us-ascii?Q?e2yMoTLJnMZJPrQxjol6chnm3axg4eVJjmbL988EbVhAwJNjs08DVqLegWCH?=
 =?us-ascii?Q?gbTkphkKh95iFF/6vTS3Djp0p9GXICE/vumAdSpjCaqa7W0vebwp8qZ+btB2?=
 =?us-ascii?Q?FRR4ppzU0vLvKFEfcoG48WLjq5ReNPtoJuvghEZoGsSmxnGdovmEea1HvMmz?=
 =?us-ascii?Q?5TyTI9FF9zsFbTh0U+lfmkMptadM7I/IFAODziBrQ64rvhKnImqw2Fv/KIlq?=
 =?us-ascii?Q?sAa1VfriRW2OH3fVUgaiaKIUtcWsc8IJPMY9+7QPF6ISSR93QdW6WT34hMqV?=
 =?us-ascii?Q?SO/V+j62Bc3sGHlrPyU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7aae788-63e4-4678-379b-08dbeb64c89f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 14:10:29.7583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8B0P9G6e9Q2lGdrX62DbOLuGdmNa+4v8mV4Qg2huPgP7TzgLy9oybU24EtWr7/WYEF9M6COnHWJ4yyQBDyaNQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8436
Subject: [virtio-comment] RE: [PATCH v6 2/5] virtio-net: Add flow filter capabilities read
 commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, November 22, 2023 7:32 PM
>=20
> On Fri, Nov 10, 2023 at 02:38:50PM +0200, Parav Pandit wrote:
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
> >
> > ---
> > changelog:
> > v2->v3:
> > - rebased on virtio-1.4 branch
> > - removed reference for flow filter virtqueue
> > v1->v2:
> > - addressed comments from Satananda
> > - added vlan type match field
> > - kept space for types between l2, l3, l4 header match types
> > - renamed mask to mask_supported with shorter width
> > - made more fields reserved for furture
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
> >  device-types/net/description.tex | 208
> > ++++++++++++++++++++++++++++++-
> >  1 file changed, 206 insertions(+), 2 deletions(-)
> >
> > diff --git a/device-types/net/description.tex
> > b/device-types/net/description.tex
> > index 30220b5..eccd8d6 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -1173,7 +1173,11 @@ \subsubsection{Flow Filter}\label{sec:Device
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
> > filters of the highest @@ -1224,7 +1228,136 @@ \subsubsection{Flow
> Filter}\label{sec:Device Types / Network Device / Device Ope
> >        the flow filters in group_C, the flow filters of next level grou=
p_B are
> applied.
> >  \end{itemize}
> >
> > -\label{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
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
> > +When the \field{mask_supported} is set, for the specific
> > +\field{type}, the device can perform masking packet fields with the
> > +mask supplied in the flow filter match entry.
> > +
> > +For each \field{type} the \field{fields_bmap} indicates supported
> > +fields of the packet header which can be matched.
> > +
> > +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields are
> > +represented by a bitmap in \field{fields_bmap} are following:
> > +
> > +\begin{tabular}{|l|l|l|}
> > +\hline
> > +Bit & Name & Description \\
> > +\hline \hline
> > +0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the packet \\
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
> > +are represented by a bitmap in \field{fields_bmap} are following:
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
> > +represented by a bitmap in \field{fields_bmap} are following:
> > +
> > +\begin{tabular}{|l|l|l|}
> > +\hline
> > +Bit & Name & Description \\
> > +\hline \hline
> > +0   & VIRTIO_NET_FF_SRC_IPV4 & Source IPV4 address in the packet \\
> > +\hline
> > +1   & VIRTIO_NET_FF_DST_IPV4 & Destination IPV4 address in the packet =
\\
> > +\hline
> > +other   & -    & reserved \\
> > +\hline
> > +\end{tabular}
> > +
> > +For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields are
> > +represented by a bitmap in \field{fields_bmap} are following:
> > +
> > +\begin{tabular}{|l|l|l|}
> > +\hline
> > +Bit & Name & Description \\
> > +\hline \hline
> > +0   & VIRTIO_NET_FF_SRC_IPV6 & Source IPV6 address in the packet \\
> > +\hline
> > +1   & VIRTIO_NET_FF_DST_IPV6 & Destination IPV6 address in the packet =
\\
> > +\hline
> > +other   & -    & reserved \\
> > +\hline
> > +\end{tabular}
> > +
> > +For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields are
> > +represented by a bitmap in \field{fields_bmap} are following:
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
> > +represented by a bitmap in \field{fields_bmap} are following:
> > +
> > +\begin{tabular}{|l|l|l|}
> > +\hline
> > +Bit & Name & Description \\
> > +\hline \hline
> > +0   & VIRTIO_NET_FF_SRC_UDP_PORT & Source UDP port in the packet \\
> > +\hline
> > +1   & VIRTIO_NET_FF_DST_UDP_PORT & Destination UDP port in the packet
> \\
> > +\hline
> > +other   & -    & reserved  \\
> > +\hline
> > +\end{tabular}
> > +
>=20
> This is such an elaborate structure to report just 12 read only bits.
> Please let's just follow the example of  le32 supported_tunnel_types and =
add
> l32 supported_flow_control.
>=20
supported_tunnel_types was let go because cvq is efficient.
None of these fields are needed for init time configuration of the driver b=
efore DRIVER_OK.

It is a very narrow view of 12 bits. It is going to grow and many.
This is far more structured for each type done here.

>=20
> After you were trying to add kilobytes to megabytes of memory - I see lit=
tle
> reason to save 12 RO bits that can be shared by any number of VFs.
>=20
Completely wrong reason and very late review and also does not align with e=
very other command we did.

> However, I do think we should create an option to access config space ove=
r
> DMA (preferably admin commands). Let's add this quickly and then we don't
> need to worry about legacy guests accessing flow filter through MMIO.

CVQ is already there as single interface forget and set for rss, rss contex=
t, vq moderation, statistics, flow filter caps and more.
No reason to bifurcate.
I won't be able to absorb this comment of DMA interface.
If I discuss further, I will repeat the whole document [1] and I will avoid=
 that now.

[1] https://docs.google.com/document/d/1Iyn-l3Nm0yls3pZaul4lZiVj8x1s73Ed6rO=
smn6LfXc/edit#heading=3Dh.qexbtyc2jpwr


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

