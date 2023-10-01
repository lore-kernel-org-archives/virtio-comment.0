Return-Path: <virtio-comment-return-7579-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26B6E748ED
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 10:59:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5BEB6799A9
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 10:59:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B5739866AC
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 10:59:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 423F8983D6F; Sun,  1 Oct 2023 10:59:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 34DA598652B
	for <virtio-comment@lists.oasis-open.org>; Sun,  1 Oct 2023 10:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJ8vvMmUKHgF2BzieX3C+0YiOBoiNgYgBqv6m8yB37mg43eNWN1eTJp0WS1R30O271JpBLQ93hb8E3mriv+Hlt3VJhySoTC2nP/dVIDwabxwjT4UC+XDFP7r4qKvLwThmMtTTAES74FIvo1MUH/4drs4M6MAQCuvXipfX+n+AqJUeiak033AzXnUkNkDjq98QSKkq5S0P/uzzBOoDGIoHVL5ljRvWvF0PEhtGwXEBirqv1VvOYO7NaurL1mGM1uol5UHoP+K8LtNLd2BU2V/bY1WFBByYm4lKwIXrSeTWqFtaio7ajmYbaCEuEL1FiTW5FOiO56Vy+0eh+9EEHcxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eI68gt5cSZYQ5/uU3t8kvB3QlrxSuMiPDHjD8KJLyqk=;
 b=RNVr8wRMNsD1TAmim8EYQvIzHxQ63Vd+UqtzydRNyyyFdh03D0hZmxUzvoRQNcLsPufGM0BSa9qvkNeZC69U/uwhb6vlnpSuo8b187dA6EgXco/Q/5MuzIt0L37Y3+wikVisP0Etc90ICdk9i8BKT/WEZlbg96jWVDav8ijF8Jski6/7drqsiXPIkcYx4zOVdiCiGLTZTtyGngcXJphOWA0jd6iqZ/fANXTQ5trCO3cx8UNwNgI5kBW2wBB1PYwt1QAKJJT1EZFRj7/0JwvwlKDgUtFYpXx4/5q0uZFpbw6ph+1dOTVZ7P0Lacp8WqfTRkJHkjdpRrh/IdDn9RN6Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Heng Qi <hengqi@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH 2/7] virtio-net: Add flow filter capabilities read
 commands
Thread-Index: AQHZ7VuO2QsQ6gxZqEqNFzMaOTBTBLA0vF6AgAAVcbA=
Date: Sun, 1 Oct 2023 10:59:16 +0000
Message-ID:
 <PH0PR12MB548197DBB690BFF5EC0DE550DCC6A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230922134838.3718-1-parav@nvidia.com>
 <20230922134838.3718-3-parav@nvidia.com>
 <SJ0PR18MB44779AF95836749B77949A7DC3C6A@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB44779AF95836749B77949A7DC3C6A@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB5632:EE_
x-ms-office365-filtering-correlation-id: b4b5061a-2c3c-4c10-675c-08dbc26d7444
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1HcVAhqrkInTmbpJe/K/uj6snComxYdBg7erk1fYDI1FtmwoD68jhxqazqYy7PInNA5cUCgtOUINYwENJGKnZ+jNXLO9xOcbhQPVjG+lYvanbHrVMU3Y/5wS+YyXhE7L++J6/kkR+58rX5D0IpHdcsKlkAK/wUFQBRTZY1sxNLH+ukTnkEXlGLY1cizKRHEez1xz3u/+ZfBtIu6inAyFHxyjZuJZZCGuBivpYmyYX0lX+qAVIUgNWzBLKmjnRV/FqpanccXmFg75TfHrNB/PE+jpiW7JhEaEZYCXGCL2FPC0StkZ5qhQhgxi3CPMFHao70cOGPLzVXfEJ1qp69N3gNguEMOfi7fxmZuLQJChBEk4TNYcbRdp9uezNSAF+jVFlAjgpJqJv7841fD6dd3jYRFgXgmkA8ijtuZ4HOyUz8uZFq1P9ZMy9XQcqzH++58GN/kAJQhwgR03Zj5Jj0TpefixNCSLYSdMv1EdtsQPoi6r8liA4OFy+S6LYI+ikmDulPcrr7e94FIu7CiTIiSmMAn6t5SRGE/6+cNSmQ1AjXNHmZHMLEMl994u5j4jXHUaZ8sJ2wYTo2sQEn7EYhSkil8TcUvHcbd3bzgtJqJOXDl4ELcHDTzNYO+p504HqtUwlItuV3aRqGqHkVEVnUe+hulNQ4Nqw01DdHSVOCt4ZD4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(110136005)(478600001)(83380400001)(8676002)(55236004)(7696005)(71200400001)(6506007)(53546011)(52536014)(66556008)(19627235002)(9686003)(55016003)(5660300002)(26005)(66946007)(66446008)(66476007)(4326008)(41300700001)(76116006)(64756008)(54906003)(122000001)(8936002)(38070700005)(86362001)(33656002)(38100700002)(966005)(316002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TwieZ+0474HowdlzAEzA3rUfVEk0eM+oWuI8MP23+gY3wPkA+pW39cpRIcP6?=
 =?us-ascii?Q?X6LQP8EC5xbe5MaQg6H6Ug0O+vS4TlCkqft71k8sijKZxA2HAAuJ5Fq7wKTs?=
 =?us-ascii?Q?g4sin3lvj86iQyNdc/3Mz+eBO9jr5WhmclW1yNuMp/vmj02eot8CPhRdFqv6?=
 =?us-ascii?Q?jQkhiO/gdXulql0gSlzfVgC6cNY6Q5al1XYnzh4P/yy+1vlajS2KBbd58Acg?=
 =?us-ascii?Q?TdHX3o2XUSv4T7X3RnozmKcJ2CospYymXEEwh4efuXv9DrjVkat0wnEqNMpu?=
 =?us-ascii?Q?pURB7v9qPGNjXW6Gj2ByL3Ewl8LOzE1ix72wbLHFzjF5suC74DWehmjOIchj?=
 =?us-ascii?Q?XbyJ82tH9mYKonKic3vyKCm+vVlLyM9uwe1BeBjCd2bfjGA+Yt7jljpqEm2W?=
 =?us-ascii?Q?PSQY0tySEaj9uK6hslpwoF3qAiXf7H6rO51VZE2NGtqKgp9CF0RG4z8vI0Rb?=
 =?us-ascii?Q?WSva4wegF8K+N/MGB/1eeJWOsGrZmZGaozLagG4J3nUwLp7aC75qSrtbZE9V?=
 =?us-ascii?Q?mFLeIFfJuM8+DVUJuKKni3Xh5QoqkophfogpJGsDtjqfc6dpchLGoN5ietkD?=
 =?us-ascii?Q?5le68skjLl/dqetjVDz6axxI0tGwmZtU0RjzB77inoYhXYmF+whZgc7oQGTc?=
 =?us-ascii?Q?uk9k//u/LKK46xA38Z17lwW6oJlxyLgmPPoLqUshQXw35e/slZwtRA5DdfDa?=
 =?us-ascii?Q?r6WaS7SQgtDk8v/SwvFNHFCdySQb0m8DuMDjAZNM62FhNW2ZrQC8Tzsxx+zq?=
 =?us-ascii?Q?MhMMiR7jfgdQRrOYhypVUGuThtkiiXNG9O8bBUtQn+PU5DMwR7vfGXbbHXlf?=
 =?us-ascii?Q?iE1OoexZi8QK1fePgMvg9xkqBSOEwoxu2mQWJTWMsQ1XDJd31eSFrSOyd6Hp?=
 =?us-ascii?Q?UFiha8vPOrRSddDDsF2ChKGHqiFsLH1nZztm0twXp55KgKlswc7SrppcAaPV?=
 =?us-ascii?Q?w4sgo+pF7/XC50VX+vZ4wgvlTSazZhGTcEUEpN9EmkjfyQfQ8h2N5OElYNw5?=
 =?us-ascii?Q?Kq2+Kjde4bdVy6FxMxogAFt9DA0PmBQZwg6dh3Ba74GdQC6rWPzuOwNKYxam?=
 =?us-ascii?Q?1e4YGqkD08SbJj5X48kBx+Gigyh14V+BFc2VuWJOAchPnnxrrSlCEEi8nvRM?=
 =?us-ascii?Q?y2K4sTTSU5XSOoF4AqhyyiaaMNLsHqOqIokHr0fwJJWPrU+bMbluBywganpL?=
 =?us-ascii?Q?pakjE6pcFZ52Xh6Fp6Ny8gxf0D5w+FgzvHY4p9VrS5Bxs+W8Fq4YIltu6P9F?=
 =?us-ascii?Q?zuRNPoGwAlzCwTtq+3s/oWwLjG7h4hVAwp/vbUD3cCuvfX0Ej9sHTaJ1CfWS?=
 =?us-ascii?Q?/FDgRYf8W9qxgUWzsP1RAzxkUhYM/6jZB+vixHZJAMVSBcKYCNG+a/kRSExA?=
 =?us-ascii?Q?O8gc77Ez5l22Jff5X3h0t+wAEh+zhJ3Cp3bK3BlEiZ4r2FGXFIMSCboA7oJ4?=
 =?us-ascii?Q?EeA6WkULYd589mKedlaZ28TEPqB2qPMY0MUtER611nwW/4QnEZ1bmuU4+cMp?=
 =?us-ascii?Q?/OKrOPMOSJjl9aZ5RVeBhC/6rBwR3lfORJExbmMC3JDUWoq6R9shObAgGRwh?=
 =?us-ascii?Q?M0Oyrtty7cr9uP0yNYo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b5061a-2c3c-4c10-675c-08dbc26d7444
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2023 10:59:16.0536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lwJivYPC+YssiH0cyhrjRM6HyTP7Z12EdWpaETjPrfQtYUhNA/uJIb/WSr5ZXbmS6AUpRSpESGz2eX6WAgRz8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5632
Subject: [virtio-comment] RE: [EXT] [PATCH 2/7] virtio-net: Add flow filter capabilities read
 commands



> From: Satananda Burla <sburla@marvell.com>
> Sent: Sunday, October 1, 2023 3:12 PM
>=20
> Hi Parav,
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Friday, September 22, 2023 6:49 AM
> > To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> > cohuck@redhat.com
> > Cc: Satananda Burla <sburla@marvell.com>; shahafs@nvidia.com; si-
> > wei.liu@oracle.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> > <parav@nvidia.com>; Heng Qi <hengqi@linux.alibaba.com>
> > Subject: [EXT] [PATCH 2/7] virtio-net: Add flow filter capabilities
> > read commands
> >
> > External Email
> >
> > ----------------------------------------------------------------------
> > The device responds flow filter capabilities using two commands.
> > One command indicates generic flow filter device limits such as number
> > of flow filters, number of flow filter groups, support or multiple
> > transports etc.
> >
> > The second command indicates supported match types, and fields of the
> > packet.
> >
> > Fixes: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> > 3A__github.com_oasis-2Dtcs_virtio-
> >
> 2Dspec_issues_179&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DNHDPsfcAYl
> N2z-
> > NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DVZgMfa4Q2vc_6OSqt-
> >
> i7ptCKmBnBVtPWeB8zGHF4AuU0LWpisRhRLj4K4W3GE8VX&s=3DCxdwZkCbr1ldzL
> QMEVrv4
> > F0Bc
> > euW1z-y9HJ4uYkYGiQ&e=3D
> > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  device-types/net/description.tex | 194
> > ++++++++++++++++++++++++++++++-
> >  1 file changed, 192 insertions(+), 2 deletions(-)
> >
> > diff --git a/device-types/net/description.tex b/device-
> > types/net/description.tex index c9a8c52..bf6d4c5 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -1168,7 +1168,11 @@ \subsubsection{Flow Filter}\label{sec:Device
> > Types / Network Device / Device Ope  The device indicates the flow
> > filter capabilities to the driver, which  includes various maximum
> > device limits, supported transports and  supported packet match
> > fields. The driver enables the transport for flow -filter requests
> > using a control virtqueue command.
> > +filter requests using a control virtqueue command. These control
> > virtqueue
> > +commands are:
> > +\ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Flow Filter / Flow Filter Capabilities Get}
> > +and
> > +\ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
> >
> >  The device support transporting flow filter requests on either the
> > control  virtqueue or on the flow filter virtqueues or on both.
> > However, device @@ -1252,7 +1256,111 @@ \subsubsection{Flow
> > Filter}\label{sec:Device Types / Network Device / Device Ope
> >        the flow filters in group_C, the flow filters of next level
> > group_B are applied.
> >  \end{itemize}
> >
> > -\label{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
> > +\paragraph{Match Types and Fields}\label{sec:Device Types / Network
> > Device / Device Operation / Flow Filter / Match Types and Fields}
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_ff_match_type {
> > +        le32 type;
> > +        le32 reserved;
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
> > +0   & VIRTIO_NET_FF_ETH_HDR & Ethernet header of the packet  \\
> > +\hline
> How about vlan?
> > +1   & VIRTIO_NET_FF_IPV4_HDR & IPv4 header of the packet \\
> > +\hline
> > +2   & VIRTIO_NET_FF_IPV6_HDR & IPv6 header of the packet \\
> > +\hline
> > +3   & VIRTIO_NET_FF_TCP_HDR & TCP header of the packet \\
> > +\hline
> > +4   & VIRTIO_NET_FF_UDP_HDR & UDP header of the packet \\
> > +\hline
> > +other   & -    & reserved  \\
> > +\hline
> > +\end{tabular}
> > +
> > +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields are
> > +represented by a bitmap in \field{fields_bmap} are following:
> > +
> > +\begin{tabular}{|l|l|l|}
> > +\hline
> > +Bit & Name & Description \\
> > +\hline \hline
> > +0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the packet  \=
\
> > +\hline
> > +1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet \\
> > +\hline
> > +2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
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
> > +other   & -    & reserved  \\
> > +\hline
> > +\end{tabular}
> I think it would be good to indicate the how the fields_bmap can be expan=
ded
> in future for adding additional fields in header.
Yes. I will add an example or a note to indicate this in v1.

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

