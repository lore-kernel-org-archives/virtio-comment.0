Return-Path: <virtio-comment-return-8556-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA0CC61D97
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:44:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 359462A8F3
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:44:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1723D986899
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:44:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 01B0F986384; Wed, 22 Nov 2023 13:44:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E622B986896
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 13:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWakgZNP7IcaKGXLwLQA716oTiTpzSJOqX0xW/ARGS5Nnm43DVImPhJDQUr1zJ3uLbNMSprpM5FdEATuX8T5HyPTlLGJc1GfHdGtTWEwWT1X2FNssEbyFI9UN/90E4B3N2xY0I+eSQ3iXf3cmoQgshyM0D+XFY7ymOtN2H1TOyq2KjZ4ScK6MURLc1zrnLt9woIYpiVPpmzAlAiHo46IE4wtgeWG0YBX9FG7CQ8RkouuYKSaxP45Vfc7jEIfaRzoJwFnTjY5YBOyihNFnVJ6MF5WKHNHLF1q8ip7hyCE18CzTF3eJ5VYCiyk6U9BW97ZujUAoT1ZO1AsNdsTM1PX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nt6YLV02SEDszJxRQntb8qSX9hgecEV2FshnjME0SAo=;
 b=Jr5UCFE1uA/KwHFPtNtd1CW+KOINBENnhzyzz91fmKkLlzgDKE8I8D7BHl3NJRj6typS58X4KicCKoKZ+KhcY9KO4j1ZRVeS7zoupGLky3s3TTNCVUfXxxK0cJi0uBswCqGvvVC8M04GI6bAEg2dz/CX7Bmmzaanjhc0z0LkSR4ArelPTTH1ISOxPG28qhtw4ZEdi/ylZKeT7E2E7zwk8sxv9uOwVNDUv1u9VkYBmPuUnM8PzTr7YLyx2SJIJRgBM3/D08et7B83k6Y3BGeWYxlX3LQs1yFiq+hnGXnADmPadS8FQjEJ5POcsuSve9efhxD9e8ssaugdNPNSJ5kK9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>
CC: "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Thread-Topic: [PATCH v6 2/5] virtio-net: Add flow filter capabilities read
 commands
Thread-Index: AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGaqcAgAABGQA=
Date: Wed, 22 Nov 2023 13:44:09 +0000
Message-ID:
 <PH0PR12MB5481A0C90CEB3B78E9D639F0DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com> <877cm9lxh1.fsf@redhat.com>
In-Reply-To: <877cm9lxh1.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB6399:EE_
x-ms-office365-filtering-correlation-id: 5aacbf2c-1d2e-47f4-9c4f-08dbeb611a9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 T1iIzQu5bvwZWh3qdGJ/nEe7VxRmOFhtDlzf7hmtBw2a4Y+xjTALBK30koYrK2vOlIj2iEF11VYWxlf50567ISdk8nrpdA8urcVa7rNZV+3qOhfCAn10ExiZkLK8nD9ketS/k+zN5QbrADfrqqVnr4+kantvtBccrckbWzCaDMaEqkDDLTUrEYua5NCNllTUDXucUziVkJWUxaUr/0zEd2Pd8Bxbeg/4MiChyIRF/zRaU1HZ5oWoG7h5bosKP7LnwljnRJxcIIsvloeKmZx21w9s0IPhbzvhlPkhiN08wubRjGC6dY0JMVM9XDqpTKIwTbjkImcv+J1yf/B930JLm+Cd/zRT1EjQB8deQszzyIpqloBzPvscuSkk6Ka11128uR/exVCFWxvDRTJMemj2H6Ir4uSwSZHLpIpW/1bn9BP7xEOq5x+1MdCbkMwasjVkiL+2Cz/TQ6ixv5LAwLjCJO5DDmXBQvIJ5Y8MGtgMx5asYElvOQu/3CbA8htQRxxMdt7HajnFWYNwVEgTEUbuh7mvBXh7MkMLpaE4zwGIWHWtiHbbox32MIoKZ19iM7fZSWiH8nVKkpihXr5z1JOtfK+CVBLSl0f7DG8OVTy737s6eGR+nU08yUBy8kShL2OK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(396003)(39860400002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(66946007)(30864003)(55016003)(2906002)(5660300002)(4326008)(7696005)(71200400001)(478600001)(6506007)(38100700002)(38070700009)(52536014)(8676002)(8936002)(26005)(122000001)(54906003)(86362001)(83380400001)(110136005)(76116006)(66476007)(33656002)(316002)(64756008)(41300700001)(66446008)(66556008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?35F2DIHK4T54SVEUFcORZ49f5IEljvQX62vQTR3zfsAVue8zQpk/NDc6Q1x8?=
 =?us-ascii?Q?RJ9TJDnqhGhKp8SEL5NF1sGl046PqscVQaBSVjKgF/Kw8lCtsiWFJC5VTirA?=
 =?us-ascii?Q?BKOSAnUovWciNvcqmVtQpekF1DTcL1GrOc+W0XiW9el1gjulU/JaEUPQj3qn?=
 =?us-ascii?Q?Ei6d/cwvLM3kPAFEPIWBjVd2Ahxv4oIug1/KIK5YdGApWbW0NlPB4gAm/iLw?=
 =?us-ascii?Q?l88rxvx/AAeNbBryZL81Fgx3xqBlSlk0qGyuWYwx6qKWtdbcebSue7i0HmXB?=
 =?us-ascii?Q?nqgDGk4r1eRMrTG00imATvwVJ8Rhbo2dWn50xA2Myjq76g3U1mPZ1sQh0fM1?=
 =?us-ascii?Q?m0IvSH5T5WHni9M1e5hS3CJ6s5q8/K+yJuTh90v15uVvHlYq05ahFPgV8Djo?=
 =?us-ascii?Q?VWvqSKowt6XccM5juBx+rY9J4E7dS5ZjlVXZ+vs9XwP9hR8++NKtmzeLcZMN?=
 =?us-ascii?Q?xDiyucfmlzM3kKYp8Sa/9hg4yVvMAnsEMF7dWN250mqeKLPQZO44DjBWrjMl?=
 =?us-ascii?Q?levj6Z9B2YxzzZq9eAW67MPspbOXHMwGUzy3x99S0Vuc+X5pi1oh7oc4iWYF?=
 =?us-ascii?Q?tDdvtijYxzuaoixgsj0XFTonOr/z8O3cFiwf0pYqxegu2xOLf+e+F6zA4Xgn?=
 =?us-ascii?Q?HZhQ8FbpMo+7HWejRho1yVZpwzVsyMObCrJjwjDIXhUDSsOHmGIfgG2rT8zO?=
 =?us-ascii?Q?0IzmEysCcMpSutwV1eutkcOo/jyf/qAfsYIZZdrqNE5PaaWJoXlzJq4mftMD?=
 =?us-ascii?Q?PNkMO+PSbw8N/EbtAwUQbjUqQOcjR4Nt3oDY+WgZJvZFlYV52M0a2ewcwAp/?=
 =?us-ascii?Q?pNhI7YkahC2vABHP2iuKEV3ci6CvoBbsSG8vJPgVvXdBVpGPKZ4NfreD4Ykl?=
 =?us-ascii?Q?rLyGlgxPKXIDH4jervllgIMW/IbuTTDoLKO9Ft6/vdib48uyl9nlIWLslwJS?=
 =?us-ascii?Q?ZVNJfS1e+9n2LOI+OeahlAf5ZfOkb9Dpv4iyx/iuVpVkDbFzFGcnJtmVSKe3?=
 =?us-ascii?Q?BOjtQa0ptC4USyKUXH5Y8YYRZNX79zng5z69/CqOO796hHwtR8+4apag6fMH?=
 =?us-ascii?Q?W9Qm0iZhmg+WYxPtYPIdGtLXMP+f2VDRlddoT1yTE5wLmOhkQA9N5dxeWvRq?=
 =?us-ascii?Q?0lYggZ7EP0x0TqxIDx43moEGTdgN0lJTDS6ySI78cUWlWThZw0Bf41juxaeC?=
 =?us-ascii?Q?jX1B8+9quuDBYRGHbYboWa4qZIyUUwSMyx2m1G6xuWv1wdsb5438wOjIKK3M?=
 =?us-ascii?Q?wBJqZHLY1gD//EHXWAzKfrT412J4U/ZZBJ0ZguYltLki0Ai77ruAh/vxKY6v?=
 =?us-ascii?Q?y/jByNwevY4S517tlAWXa1hJpd49xSAl+1XQ0Icn6IVerYAHN4YAxcBTeqiB?=
 =?us-ascii?Q?WvY3D35SAmo/Fr+nexzc54zw/exGuwIIo2vfvblVHz4ZvLIldd69+wt2d3tc?=
 =?us-ascii?Q?aWeGYqNUKSh3c3Vv0TXYFty+0rq77MhSCs3N+djcdYNidYN95YwA4LhUxaje?=
 =?us-ascii?Q?Jlnu4HXtH9Eh8Dz5t/1WzySKxYgzFTsNwqmKLCInu+NK1gViXSNB9nhLZMPY?=
 =?us-ascii?Q?fqw/r3arylUlz5AaQS0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aacbf2c-1d2e-47f4-9c4f-08dbeb611a9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 13:44:09.3561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YD+2YQC3bvJJRzpE8LjVdn+La/PzhJzo5NWeWmDe10UEwDL48apFmlp8iOYf1CEkrT4JCFUFJ4bjNFrAQTvi6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6399
Subject: [virtio-comment] RE: [PATCH v6 2/5] virtio-net: Add flow filter capabilities read
 commands



> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Wednesday, November 22, 2023 7:08 PM
>=20
> On Fri, Nov 10 2023, Parav Pandit <parav@nvidia.com> wrote:
>=20
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
>=20
> Wait, if this uses control vq commands, what are the "flow control
> virtqueues" mentioned in the previous patch?
>
As I replied, please ignore that text where you gave example of M, M + 1 et=
c.
I am going to remove that stale left over text.

=20
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
>=20
> I think you added this in the last patch? Just drop it?
>=20
Yes. it was some wrong hunk.

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
> > +\field{type}, the
>=20
> s/When the/When/
>=20
> > +device can perform masking packet fields with the mask supplied in
> > +the flow
>=20
> s/perform masking/mask/
>=20
> > +filter match entry.
> > +
> > +For each \field{type} the \field{fields_bmap} indicates supported
> > +fields of the packet header which can be matched.
> > +
> > +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields are
> > +represented by a bitmap in \field{fields_bmap} are following:
>=20
> s/are following/as follows/
>=20
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
> > +are represented by a bitmap in \field{fields_bmap} are following:
>=20
> s/are following/as follows/
>=20
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
>=20
> s/are following/as follows/
>=20
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
> > +represented by a bitmap in \field{fields_bmap} are following:
>=20
> s/are following/as follows/
>=20
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
> > +represented by a bitmap in \field{fields_bmap} are following:
>=20
> s/are following/as follows/
>=20
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
>=20
> s/are following/as follows/
>=20
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
> > -2392,6 +2525,77 @@ \subsubsection{Control Virtqueue}\label{sec:Device
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
> > +The \field{max_groups} indicates total number of flow filter groups
> > +supported
>=20
> s/The//
>=20
> > +by the device whose group identifier can be any value in the range
> > +from 0 to
>=20
> s/group identifier/group indentifiers/
>=20
> > +\field{max_groups - 1}. The flow filter group can have any priority
> > +in range of 0 to \field{max_groups - 1}.
> > +
> > +The \field{max_ff_per_group} indicates maximum number of
>=20
> s/The//
> s/maximum/the maximum/
>=20
> > +flow filter per flow filter group which can be added by the driver.
>=20
> "flow filters"
>=20
> > +
> > +The \field{max_ff} indicates maximum number of flow filters across
>=20
> s/The//
> s/maximum/the maximum/
>=20
> > +all the flow groups which can be added by the driver.
> > +
> > +The \field{max_ff_priorities_per_group} indicates maximum priority
> > +value
>=20
> s/The//
> s/maximum/the maximum/
>=20
> > +of a flow filter within a group. A flow filter within a group can
> > +have any priority in range of zero to \field{max_ff_priorities_per_gro=
up -
> 1}.
> > +
> > +The \field{max_match_fields} indicates maximum number of fields of
> > +the packet
>=20
> s/The//
> s/maximum/the maximum/
> s/of the packet/of a packet/
>=20
> > +which can be matched by the device for a flow filter.
> > +
> > +The \field{max_actions} indicates maximum number of actions for a
> > +flow filter
>=20
> s/The//
> s/maximum/the maximum/
>=20
> > +match entry can be supplied by the driver.
>=20
> "that can be supplied"
>=20
> > +
> > +The \field{max_flow_priorities_per_group} indicates maximum number of
>=20
> s/The//
> s/maximum/the maximum/
>=20
> > +priorities supported by the device per flow filter group.
> > +
> > +\subparagraph{Flow Filter Match Capabilities Get}\label{sec:Device
> > +Types / Network Device / Device Operation / Control Virtqueue / Flow
> > +Filter / Flow Filter Match Capabilities Get}
> > +
> > +The command VIRTIO_NET_CTRL_FF_MATCH_CAP_GET indicates which
> fields
> > +from the packet can be matched.
>=20
> s/from/of/
>=20
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_ctrl_ff_match_types {
> > +        le32 num_entries;
> > +        struct virtio_net_ff_match_type_cap types[]; };
> > +\end{lstlisting}
> > +
> > +The \field{num_entries} indicates the length of an array \field{types}=
.
>=20
> s/The//
> s/an/the/
>=20
> > +Each array entry of \field{types} represents supported match fields
> > +of the packet by the device.
>=20
> "represents the fields of the packet which are supported for matching by =
the
> device"
>=20
> > +
> >  \subsubsection{Legacy Interface: Framing
> > Requirements}\label{sec:Device  Types / Network Device / Legacy
> > Interface: Framing Requirements}
> >


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

