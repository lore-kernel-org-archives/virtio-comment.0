Return-Path: <virtio-comment-return-7171-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD284C001B0
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 06:35:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1355B79515
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 06:35:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CF5FC98641A
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 06:35:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AEBF7983EB2; Wed, 16 Aug 2023 06:35:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9DB0F9863D1
	for <virtio-comment@lists.oasis-open.org>; Wed, 16 Aug 2023 06:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6WFm9Maj2O1wwJ01IXmFQAYGX+Nw9ZsqeAKXblYJ7242Vw/4wdR7UHApHAuHCd4MqVuklIEM1r1tv7s1lcCvI3FxhJ8eOtYp2FFB3IHG70gP/KFqoXh9XG/o7+SrMVY0f9ndcUCuR5Z43FEJnarjfs0WKiCHrZITyr+KHne1Hjrfhq/LZX/6X+WdmUhHE0zQTpBkBmVIf6zhX6T6SCV51C4U5+RPWy/Bspr4qCZYAg7ppZQUaLur/pv3WUPKhbYmjwnbI/IW6L0y7DklDmTvw28mKj8oLQ8L8pbEv4e3AIEWioegtkxQi1GOZ/Wcx72TLhwylPklmw3Dy4a/Y0qWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxdSq3AljvZKKJ4XJu+K0GGu3xiaO97CdX+SJxJUxsY=;
 b=J5+jxnztnjfStRNPrChNyv/Te6melThFy6iCU09XrPmxlJI33VjhjI9ppmd5VZfXOWbknTkK0NaSAZ7VYgjb/pXVs7Ld/V8MeZcTfIcGSu84fldCuEpU6tt9R1+9sbuCT/ILNcs3Tu57hEqNUgGL0LZOYulRijBa3NmJ3sDQ+MaBh8m/+H5w2mmUcfG5Ny32b1qPfHc6TdhMjvkag7oxhZQI4Ftd7CbkR7HtYI4nIxvgzZDZJGg/us8N+AajnmFgsXw+RlKafIUTziQq2Tjtu8XGxSmsinFyNney3ybzfwSpSYb7C1JUEl1OIvV0NC8rOXMj38Zi+I+H0I8RxBQ3HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
CC: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
Thread-Topic: [PATCH] virtio-net: support the RSS context
Thread-Index: AQHZz3UtZhKy++Ul8kWXLFBVjffId6/sd7lg
Date: Wed, 16 Aug 2023 06:35:34 +0000
Message-ID:
 <PH0PR12MB54814C1E441F279D9475778EDC15A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230815123650.38822-1-hengqi@linux.alibaba.com>
In-Reply-To: <20230815123650.38822-1-hengqi@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB9447:EE_
x-ms-office365-filtering-correlation-id: 4ec3f08c-aaa8-4df6-b331-08db9e22ff2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qEHOZL0dc86n4juiLdQPAqt5i3JLjzws+Vlh3J3cxce0EnDX8yZQD/w8LoVjFHXaSDEJZkt2zq8W27R3Y6D84ltDCeyiUQOck8JKeaIYegUvpShiTHU6Sno2bsEFKdchNQc8rx9ItYBrpE71DxIGZV3uP1vtAHOjV67o3t0Eor3PSGg6FKNuEeu78kWROpyetiArnHtdI8313hO3hpw8+QixFm77V6TQkHCg5m3tPEoAhsb1Kh3f4n5wNF+KN4p+YtoJbyZc14l5eSZZ/tVXq5IuXNPnH5yFi5QSaaVmaycaywl0Gcwjy/DggkikCZ6Q7aKs6HVEQ9DtTvOBhKJuQNP2eclGf/xOxLeDtJulRrt13tKvCF8aK1CNd9JlZTRo2KhK4vvhe3SlVieyBPWJjAZvcm28zvquF6CWMsGAPwscHUd9Ur4g1PTkt/e5F/IuwxevHRyv9608o7splaY8NYYZFDI7rHaFrY15upIScjeVbcck/MrX09Eduzb3gmPhPJ8NjwCuZ4PMeYv+/iGtT0Z4tE+Oz8eoUZ1YN2PbobyBzgBYooVKRUZX7ONbkBgMEfPUiA8gZ1MnAol9lSyDPi7+i/oti03umB2zAPfWSv8Lqg4/vxfVf9SP044+IW4b8hFW/XwDXEmx7kqJv3HV0w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(1800799009)(451199024)(186009)(71200400001)(64756008)(54906003)(66446008)(76116006)(66476007)(66556008)(66946007)(7696005)(6506007)(2906002)(478600001)(9686003)(966005)(26005)(110136005)(5660300002)(83380400001)(52536014)(41300700001)(316002)(8936002)(4326008)(8676002)(66899024)(122000001)(38100700002)(38070700005)(33656002)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?m2G83gEi5wh0SPb4q0Rf79I/GxfBKjA33IJBNpVl10Z8nfg0h+EDYktxLEAD?=
 =?us-ascii?Q?GaKPh7YvuYqyAdQheJH6uXdmBkc3QQehLStGTUlmHrS0WhbT5Kb4aQyBIur9?=
 =?us-ascii?Q?1YHvtP/ui42Kop+lUsK/hhnt0w/5BoLeIynqdcPmfzdv8XKytfTz2gs3fWhU?=
 =?us-ascii?Q?8hgY4UVlzRSEH2xqNAqT2RQtCtG9vneYtqVByHV8Zi417ef+OGaBbG3B0Uam?=
 =?us-ascii?Q?Kbb6NFkNJwXL2NFJCUsV/qlIxLnTg/K2Ma27XyXhiZKrH3RJn1EJFMln2oJX?=
 =?us-ascii?Q?FKsmO7oxffIL9SVGgrQFuR6WoE79QdXYoSYUPwprk7QArs8EKyWqolrupNrF?=
 =?us-ascii?Q?f5Bj/68bzlncJPqjiI/Ov80SgI5kpYG1M38fqZvIq/Nlk7BzCkwDiFTR2HUE?=
 =?us-ascii?Q?zagUionoXXyihXwG4xfj5SbItx0U1vqGSYFRvrz3btA1mXybrrmjianwEqLw?=
 =?us-ascii?Q?Yb44c3k5iujfnVCd1haxsB5CTo8BAYiRfJGLYoLWfa72bu+QK+CjX+42mVx+?=
 =?us-ascii?Q?OCRPahzEuGxGO3INF0ATyQGGlNMsY9bRSFeH8bb2l1Y4bxYHxvxaUkYciE+n?=
 =?us-ascii?Q?LHNZZWLq0VEsNuS8AiFuzzMREw61sRo9wzrDRpjB9n1QcpYQ/FFrdVvNnOVx?=
 =?us-ascii?Q?jx297H+TITbRAIB1ANDNBNcy88b+HT9Ttt+VYqkA5+6kREiUFduyvcvsWxyF?=
 =?us-ascii?Q?/FbwU6v2+yYVwnODQR9HWe+1gId3Q3HuLfzKghN1qvtgM4Vo11Lge3OOJySl?=
 =?us-ascii?Q?Dd0qDjkMpp75G9BE3UgSMtMlWomCrnt5/CldupaCZzqdpdbwIAd5ERc8Kdon?=
 =?us-ascii?Q?MVn/0HJEkKKOZi5ECiYKdJks/55vngwGBI1Fc8u+5Jlnkulmkor53Rvtp82W?=
 =?us-ascii?Q?dXa9og08B3yvZnRJ7iJv8em9jS7aOy0JKv5MDQtJgmjUteARwyEOX1XmaBqU?=
 =?us-ascii?Q?U7uBszKZN0C6xXnBJdX3A+IE67GM53+yOJ13Q7ncz48bdsR1r9iJwVPizZsv?=
 =?us-ascii?Q?7rPSA0Roh5OtsggxokvhRKEZ9mPN3x6pb5wm0TTNiMLyIklhABsfrRiZL4Ys?=
 =?us-ascii?Q?4EF4Mp9pXqT6kgaY4Ol1tAAEj3uidG4YQkoj7l9A5SYYiBsQ9ZRsIIp2tRlA?=
 =?us-ascii?Q?Cl7tGGNGHwDj0dQCe8+NzzkiGnChrXQDyvumpbwlM8kBtonb2N+Bir3BebCo?=
 =?us-ascii?Q?54lgWv5jFcBDZ9yhJj71WeCp2A++dnblTlgJiWMQtZR4ib1cCclMImlpcki5?=
 =?us-ascii?Q?huP4Shp7vGGEX+Zx5g4KGvKKHK/+w73dKroIIfIdP1DsHTkxxHoFBI+mF4in?=
 =?us-ascii?Q?tIXmGdDx1uZVwIvG4E1jmIPCUekVRm6+0VQkgmW5c3C6mVDqvThLISmr33Zy?=
 =?us-ascii?Q?aValGxw7As+V5/Jcb8ILE11f+j0NF43eUkpT8iw+4nBdYj1pn+s/FmwH1luV?=
 =?us-ascii?Q?bGW3dl7HltYN9or8I8KEw1EPAiBM4WZkrW2wzBlkSS85zTrTcz+KTWLpPu0Y?=
 =?us-ascii?Q?qBFqDooZ4tOjjEyatBBsekB2x/ny/Xgb5oN427dpjHho3MhJYVt/jnzD3twQ?=
 =?us-ascii?Q?lWBg/lkWBYdOYvFm+o8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec3f08c-aaa8-4df6-b331-08db9e22ff2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 06:35:34.9842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wxqvASABXWuXQAr0SEd1Ez2v8ud/8cnqLEMBwEXn7KjqUfBm4jKodhWX3hSaafNDZic93hgopUzxsvFlmEry6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9447
Subject: [virtio-comment] RE: [PATCH] virtio-net: support the RSS context



> From: Heng Qi <hengqi@linux.alibaba.com>
> Sent: Tuesday, August 15, 2023 6:07 PM
>=20
> Commit 84a1d9c48200 ("net: ethtool: extend RXNFC API to support RSS
> spreading of filter matches") adds support for RSS context as a destinati=
on for
> receive flow filters (pls see https://lists.oasis-open. org/archives/virt=
io-
> comment/202308/msg00194.html).
>=20
> An RSS context consists of configurable parameters specified by receive-s=
ide
> scaling.
>=20
> Usecase:
> When users want some data flows to be steered to specific multiple rxqs, =
they
> can set receive flow filter rules for these data flows to an RSS context =
with
> desired rxqs.
>=20
> How to set/configure an RSS context:
> Assuming no RSS context has been created before.
> 1. ethtool -X eth0 context new start 5 equal 8
>=20
> This command creates an RSS context with an id=3D1 for eth0, and fills in=
 the
> indirection table with rxq indexes 5-8 circularly. The hash key and hash =
types
> reuse the default RSS configuration.
>=20
> Then, we can use 'ethtool -x eth0 context 1' to query the above configura=
tion.
>=20
> 2. ethtool -X eth0 context new start 6 equal 7 \
>    hkey 8f:bf:dd:11:23:58:d2:8a:00:31:d0:32:a3:b5:1f:\
>    1f:e4:d1:fe:47:7f:64:42:fd:d0:61:16:b8:b0:f9:71:e8:2d:36:7f:18:dd:4d:c=
8:f3
>=20
> This command creates an RSS context with an id=3D2 for eth0, and fills in=
 the
> indirection table with rxq indexes 6-7 circularly. The hash key is
> 8f:bf:dd:11:23:58:d2:8a:00:31:d0\
> :32:a3:b5:1f:1f:e4:d1:fe:47:7f:64:42:fd:d0:61:16:b8:b0:f9:71:e8:2d:36:7f:=
18:dd:4
> d:c8:f3.
> Hash types reuse the default RSS configuration.
>=20
> 3. ethtool -N eth0 rx-flow-hash tcp4 sdfn context 1
>=20
> This command specifies the hash types for the RSS context whose id=3D1 on=
 eth0.
> Now this RSS context only has the hash key to reuse the default RSS
> configuration.
>=20
> 4. ethtool -N eth0 flow-type udp4 src-ip 1.1.1.1 context 1
>=20
> This command configures a receive flow filter rule for eth0, and the data=
 flow
> matching this rule will continue to select the final rxq according to the=
 RSS
> context configuration with id=3D1.
>=20
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> ---
>  device-types/net/description.tex        | 70 +++++++++++++++++++++++++
>  device-types/net/driver-conformance.tex |  1 +
>  2 files changed, 71 insertions(+)
>=20
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 76585b0..2deb060 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set
> MAC address through control
>      channel.
>=20
> +\item[VIRTIO_NET_F_RSS_CONTEXT(50)] Device supports multiple RSS
> contexts.
> +
>  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash
> for encapsulated packets.
>=20
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue
> notification coalescing.
> @@ -150,6 +152,7 @@ \subsubsection{Feature bit
> requirements}\label{sec:Device Types / Network Device
> \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along
> with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> +\item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and
> VIRTIO_NET_F_RSS.
>  \end{description}
>=20
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types /
> Network Device / Feature bits / Legacy Interface: Feature bits} @@ -179,6
> +182,8 @@ \subsection{Device configuration layout}\label{sec:Device Types=
 /
> Network Device
>          le16 rss_max_indirection_table_length;
>          le32 supported_hash_types;
>          le32 supported_tunnel_types;
> +        le16 max_rss_contexts;
> +        le16 reserved;

As we discussed in past, virtio net device do not need to keep expanding (a=
) one time read fields and (b) which are used very late in driver life or s=
ometime never read.
They are supposed to be queried over dma interface, which is cvq for net.
Lets please revise this as base line

>  };
>  \end{lstlisting}
>=20
> @@ -235,6 +240,12 @@ \subsection{Device configuration
> layout}\label{sec:Device Types / Network Device  Encapsulation types are
> defined in \ref{sec:Device Types / Network Device / Device Operation /
> Processing of Incoming Packets /  Hash calculation for incoming packets /
> Encapsulation types supported/enabled for inner header hash}.
>=20
> +Field \field{max_rss_contexts} only exists if VIRTIO_NET_F_RSS_CONTEXT i=
s
> set.
> +This field specifies the maximum number of RSS contexts \ref{sec:Device
> +Types / Network Device / Device Operation / Control Virtqueue / RSS Cont=
ext}
> supported by the device.
> +
> +Field \field{reserved} contains zeroes and is reserved.
> +
>  \devicenormative{\subsubsection}{Device configuration layout}{Device Typ=
es /
> Network Device / Device configuration layout}
>=20
>  The device MUST set \field{max_virtqueue_pairs} to between 1 and 0x8000
> inclusive, @@ -285,6 +296,8 @@ \subsection{Device configuration
> layout}\label{sec:Device Types / Network Device  The device SHOULD NOT of=
fer
> VIRTIO_NET_F_CTRL_RX_EXTRA if it  does not offer VIRTIO_NET_F_CTRL_VQ.
>=20
> +The device MUST set \field{max_rss_contexts} to at least 1 if it offers
> VIRTIO_NET_F_RSS_CONTEXT.
> +
>  \drivernormative{\subsubsection}{Device configuration layout}{Device Typ=
es /
> Network Device / Device configuration layout}
>=20
>  The driver MUST NOT write to any of the device configuration fields.
> @@ -1606,6 +1619,63 @@ \subsubsection{Control Virtqueue}\label{sec:Device
> Types / Network Device / Devi  \item If the destination receive queue is =
being
> reset (See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Vi=
rtqueue
> Reset}), the device MUST drop the packet.
>  \end{itemize}
>=20
> +\paragraph{RSS Context}\label{sec:Device Types / Network Device /
> +Device Operation / Control Virtqueue / RSS Context}
> +
> +An RSS context consists of configurable parameters specified by
> +\ref{sec:Device Types / Network Device / Device Operation / Control
> Virtqueue / Receive-side scaling (RSS)}.
> +
> +The RSS configuration supported by the VIRTIO_NET_F_RSS feature is
> implicitly considered the default RSS context.
> +
> +The device offers the feature VIRTIO_NET_F_RSS_CONTEXT if it supports
> +one or more RSS contexts (excluding the default RSS context supported by
> VIRTIO_NET_F_RSS) and configurable parameters.
> +
> +\begin{lstlisting}
> +struct virtnet_rss_ctx_add_modify {
> +    u8 rss_ctx_id;
Please double check if this can be le16, even though current may be limited=
 to 256.

> +    u8 padding[3];
> +    struct virtio_net_rss_config rss;
> +};
> +
> +struct virtnet_rss_ctx_del {
> +    u8 rss_ctx_id;
> +};
> +
> +#define VIRTNET_RSS_CTX_CTRL 8
> + #define VIRTNET_RSS_CTX_CTRL_ADD  0
> + #define VIRTNET_RSS_CTX_CTRL_MOD  1
> + #define VIRTNET_RSS_CTX_CTRL_DEL  2
> +\end{lstlisting}
> +
> +RSS context parameters:
> +\begin{itemize}
> +\item  \field{rss_ctx_id}: ID of the specific RSS context.
> +\item  \field{rss}: Configure the specific RSS context whose id is
> \field{rss_ctx_id}.
> +\end{itemize}
> +
> +\field{padding} is reserved and it is ignored by the device.
> +
> +If the feature VIRTIO_NET_F_RSS_CONTEXT has been negotiated, the driver
> +can send the following VIRTNET_RSS_CTX_CTRL class commands to configure
> a specific RSS context:
> +\begin{enumerate}
> +\item VIRTNET_RSS_CTX_CTRL_ADD: use the structure
> virtnet_rss_ctx_add_modify to
> +       add an RSS context configured as \field{rss} and id as \field{rss=
_ctx_id} for
> the device.
> +\item VIRTNET_RSS_CTX_CTRL_MOD: use the structure
> virtnet_rss_ctx_add_modify to
> +       configure parameters of the RSS context whose id is \field{rss_ct=
x_id} as
> \field{rss} for the device.
> +\item VIRTNET_RSS_CTX_CTRL_DEL: use the structure virtnet_rss_ctx_del to
> delete
> +       the RSS context whose id is \field{rss_ctx_id} for the device.
> +\end{enumerate}
> +
> +For VIRTNET_RSS_CTX_CTRL_ADD and VIRTNET_RSS_CTX_CTRL_MOD
> commands, the structure virtnet_rss_ctx_add_modify is read-only for the
> device.
> +For the VIRTNET_RSS_CTX_CTRL_DEL command, the structure
> virtnet_rss_ctx_del is read-only for the device.
> +
> +\drivernormative{\subparagraph}{RSS Context}{Device Types / Network
> +Device / Device Operation / Control Virtqueue / RSS Context}
> +
> +The driver MUST have negotiated the VIRTIO_NET_F_RSS_CONTEXT feature
> when issuing the VIRTNET_RSS_CTX_CTRL class commands.
> +
> +The driver MUST set \field{rss_ctx_id} to between 1 and
> \field{max_rss_contexts} inclusive.
> +
> +The driver MUST NOT send the VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET
> command when the device has responded to the
> VIRTNET_RSS_CTX_CTRL_ADD command with VIRTIO_NET_OK.
> +
>  \paragraph{Offloads State Configuration}\label{sec:Device Types / Networ=
k
> Device / Device Operation / Control Virtqueue / Offloads State Configurat=
ion}
>=20
>  If the VIRTIO_NET_F_CTRL_GUEST_OFFLOADS feature is negotiated, the drive=
r
> can diff --git a/device-types/net/driver-conformance.tex b/device-
> types/net/driver-conformance.tex
> index 9d853d9..22ff5c3 100644
> --- a/device-types/net/driver-conformance.tex
> +++ b/device-types/net/driver-conformance.tex
> @@ -15,4 +15,5 @@
>  \item \ref{drivernormative:Device Types / Network Device / Device Operat=
ion /
> Control Virtqueue / Receive-side scaling (RSS) }  \item
> \ref{drivernormative:Device Types / Network Device / Device Operation /
> Control Virtqueue / Notifications Coalescing}  \item \ref{drivernormative=
:Device
> Types / Network Device / Device Operation / Control Virtqueue / Inner Hea=
der
> Hash}
> +\item \ref{drivernormative:Device Types / Network Device / Device
> +Operation / Control Virtqueue / RSS Context}
>  \end{itemize}
> --
> 2.19.1.6.gb485710b


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

