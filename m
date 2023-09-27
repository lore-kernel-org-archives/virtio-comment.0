Return-Path: <virtio-comment-return-7559-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9690E7F159
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Sep 2023 03:39:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 13E682AED9
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Sep 2023 03:39:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EF51B986496
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Sep 2023 03:39:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D75F6986351; Wed, 27 Sep 2023 03:39:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C184898640A
	for <virtio-comment@lists.oasis-open.org>; Wed, 27 Sep 2023 03:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjZ3L8C0Mjf5i9ARgjq3g8i2zHt/qTHy3Ns1CVWiTgFS8h/FV+vq5e7aKtGACa1wr5t50X9q9zXPHFObZJ36f/RikcQOfUll+9yC7uMaZPjslh2/pQvLX1H9J5iKdOS452DX+rfRAsv8Epnd48jkVrZ3asfPmiTc+FCu3BTPhWgrux+OVefaAA3VqfcNFYAJwEdI5tk3Wzfz9G6buFuhY2x2yhOHetGvmEKRnMLLs7FIki3D6OV8JcTuyj5fb/3exODCBkNXmbRUXCe7xQ9n+w09ZjbBy2OtEg/LyWWMR+rMqSG3lRsAy/0OsBxwzKUVy1u+kBr4qyomH8ckwNwcbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rhpk3MXpousJBpgoTFBt/v1ZYs3cc+Ajza7v6EJ6mXI=;
 b=cALVEvFd95pT4f3tKCMYVQhVGsBrzPHLlwPw0KVuQVS9vuuu1zG1YtFww6BUqRkyLDtb3aClEkZSTLn4dPYfT4f9/a1MomuUAyQ/sORIHvT4+BoyzjPOqfFUGlTdrMQcQ4ynZ+cF2u0SiSYinfVyVsuRGR+vpD6sqDc9rpZdoDDNm+v37Ig+n+KN8atpnQO/RJr4zXq/uDKyVonBBZoU0kaJmF1v66BW7qNwBzkltvdOyg2YCamckrWjdi1Ao87PUEH+0fe0ES5K1TJb60dL/Pqn4b8Z3euVci2U6rdWQ6JY7QdnD4BtWaEMzQOp+FK283/oXkoF4/ovSpUoTdT3ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, David Edmondson <david.edmondson@oracle.com>
Thread-Topic: [virtio-comment] [PATCH v18] virtio-net: support device stats
Thread-Index: AQHZ6r+MNcqsK04JW0eobyJ1OnGbgbAt9P2AgAAdz+A=
Date: Wed, 27 Sep 2023 03:39:24 +0000
Message-ID:
 <PH0PR12MB548180536DB712E4063F00EFDCC2A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230919060710.36535-1-xuanzhuo@linux.alibaba.com>
 <1695779537.5892513-3-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1695779537.5892513-3-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN2PR12MB4173:EE_
x-ms-office365-filtering-correlation-id: db6e39d5-cd3e-4e4f-a95f-08dbbf0b584f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dzGC0JPNyO1ZGu3ACNF7zVMJ0RyprLNgeGtjC08PB4hZl0cjOCltHyfmvv48ZhuTx6ItLd2+2oZAs3eSWoqQfTcZe66EFI8Qv9dcJhZM35+6QWY+NdP3lDPy1JOLfDrVhulR1eJnrUir6182LcPfe544ED4F1fHulDdITzQoljZi92ZObEoj7vuA+JiX9Uu6Msd1YIBM7e6cGJlUGbABx/JTlin31/q3Py3Oy3/4t7JfzllpXLo1h2POKrfOsfHusEVexqD6WhxLedildD4ygaTW4VL8m1wqPsLyNZzbO70FiopEQaI4G09vU5RtPXEgDXCswcWUVbH/l9b3TgW17D9n0N7zH3jGuna2jQ6wpHBRoTdv3Z3dCVLCp2Y3DaHNMTm14a+eN/nJrUj+Nr/dfSd0vP25IRyowWHIta7gYJwcBXP/os4gLVhmFYla3M3URghaD5RTMu2AMJttPjc1Ik2VqPJ+WkGrwdYWm+FX644LfQY9hVHWVPDxh2CJnMeWr+nzQR6ZZw4Y7zlFrzOgmGtk4AykBtRq1YdmYznrLZzx9c+j6vtmfA8xhY/PvqZjAJUrTLKIyxuI6yupmNGbKCqj6muE3ESudHl385nMNZdiEsrQHMjjhC8xhSJYBeTobjjq8nAwsDtBwcUafjD7qAJ+Zaij8D3tWM9HS0SScX3crZ2vf3PcXwp+qZ9pTJlG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(9686003)(55016003)(83380400001)(71200400001)(66899024)(478600001)(33656002)(110136005)(966005)(86362001)(54906003)(122000001)(30864003)(52536014)(76116006)(2906002)(66476007)(5660300002)(66946007)(38070700005)(8676002)(66556008)(66446008)(64756008)(4326008)(41300700001)(45080400002)(316002)(8936002)(38100700002)(6506007)(7696005)(26005)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?onz3Q54hXhJ4kw/fxwr6jU3AxGyy2RFUPbsms6BVry4FVc4Bngql+1rLaNfj?=
 =?us-ascii?Q?w3JuwH3J15QNRwIIgS0C/1MNLbhcTaADNDmeHE7cjXJJzJ+nnTeng5EZgWUX?=
 =?us-ascii?Q?qtJEtodLrly3TDuGDLoH4yzbq3n2MoscTGx8TS1yykKl1YQeHZj82L/bgzDu?=
 =?us-ascii?Q?0yMS+M/81dRcnouYh3k1aJDmGbQ3zCAN2oVlb/zYHA4Kx1q9xbp1pwVq/5VB?=
 =?us-ascii?Q?Zjfb2cTIy6UDcInFWuEi+q/MfDRApNQDaBwVFX9h/BhI6myUq8HPvXpAjNug?=
 =?us-ascii?Q?WhryBSmMHGoc+q8SOCIcR4cn2X7C8XIRO0dTJEOEbAx29prw3HAqeaUHUMPx?=
 =?us-ascii?Q?88cp8GHzcDEUdW/LodGnPokgwVa6vppydiPjf7LkXrQLb+DDwIP6zyZBdUtq?=
 =?us-ascii?Q?R03PkTTI364XZJ3IKUuKaxZKi41Y3/DRZw6N0xbrTCrmbDY//qsSRL49oX6f?=
 =?us-ascii?Q?GLEtQQOQYjZ7Xyu2nfEoIgp2jf6X3MFqobqFdZXWg8Un73S4MJWGAhkYPsO5?=
 =?us-ascii?Q?wwN88J61TKAzR1U4CyS5fNQvxIYgihHvE6jj6xAuMogNvQ8Bzki1v78NJYy1?=
 =?us-ascii?Q?qzzPumD7eGIVWx/jwsBYBorFd8DQC+h5zVU+0qht7qLUjUdL0BUxyU1RJNwP?=
 =?us-ascii?Q?rcX5ZYNeYKRRGx9RMvlD+3zkm2byg8X2+g0sB4XwR/arw5vKRGm/MFK8s2aK?=
 =?us-ascii?Q?OV7QpZUvbYa5+p07NunkVhE+jwzQVkuWtzNSDowbRoCMV7uT/6D9X3O3opaM?=
 =?us-ascii?Q?Npz8sHwKWFy0XQGc1Y+Nd4Uh8EVnqcz+iwvWJAe5MPxPTyInI+XNzPFG/w+C?=
 =?us-ascii?Q?+QMGFDIRFTl7brq/GbLXK6jHE3mps6Jq4tU+XKR6GrPONWoIXBjdnsknPnfC?=
 =?us-ascii?Q?KCO0ojJ2tnzSn0IDv8nPWTVDddP55OLf3SA9SykMgLhoBubXUwCGUv/1CREA?=
 =?us-ascii?Q?pKlwufoM98esf8AH19CYezmPSsxa+7f+BsKDLHkrIQfjsDAcxR4yaQ+CQGuK?=
 =?us-ascii?Q?JxCOtKMIKFXGV4jx0otZl3QF8RqxYze4MoMtyxwbV8FxHRz/S3LbTon8iUaC?=
 =?us-ascii?Q?VcPT3smJuVBORhc0jFN2jz1ZitB8NZwEoSEeSTv9Q3zRH4uoVVmMXzTYl35B?=
 =?us-ascii?Q?izPQAzeRoGkvkdWlqULyhGonapYks4mAdlMruNLkpXjOwY3OJ6KKOIKzTk2u?=
 =?us-ascii?Q?9wflBmBfp/RF3GZ3YfSnHrdIdk4sjhVmrYE3xt86lct2k6w0J/ApDs+wIOvF?=
 =?us-ascii?Q?b5ADyvIHxWzpdS41KQ6GT+NyxlWixsIBFLPa8Du6sEEKlMymhduzS88UR9wW?=
 =?us-ascii?Q?GMb2YSzevPVNBsSswlimbIZyWH5H9sQWRk7uQaQEv3dSWdYN8lqbbvO0fD9J?=
 =?us-ascii?Q?vEsiSnKL4Dwrw0kdZYtyvi5s2XXoHf3H79Dvwzw+Av7/gD9l5Fwaif7dCqNR?=
 =?us-ascii?Q?rH7DmA0/rmAtoMTSrIT9H+DksbXEZLg5lX2nX/W8KCYlnueRkGf1UKY4wu9T?=
 =?us-ascii?Q?BpXG11X2+b4w2/eaL+PeO0kTm98Yfc91XhcugdOzJ9rq6wPoU8VnYJDejWpx?=
 =?us-ascii?Q?Q/nasLuGQ8I4GDko5fc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db6e39d5-cd3e-4e4f-a95f-08dbbf0b584f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 03:39:25.0037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9pOq1nmOjG8/ipLwesHslGdlmUOVJUenEl1VLYchDZajc59A1XqJzLoF1Urg/LpDrQWGMKh8fcFMzC3wBZ1xMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173
Subject: RE: [virtio-comment] [PATCH v18] virtio-net: support device stats



> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Wednesday, September 27, 2023 7:22 AM
>=20
> Any other comments on this?
>
I don't have any more comments. Only the last normative fix will be fine.
=20
> Next week we have the Chinese National Day holiday.
> So, if there are no new comments, I'll push it to the next stage in 10.9
>=20
> Thanks.
>=20
> On Tue, 19 Sep 2023 14:07:10 +0800, Xuan Zhuo
> <xuanzhuo@linux.alibaba.com> wrote:
> > This patch allows the driver to obtain some statistics from the device.
> >
> > In the device implementation, we can count a lot of such information,
> > which can be used for debugging and judging the running status of the
> > device. We hope to directly display it to the user through ethtool.
> >
> > To get stats atomically, try to get stats for all/multiple queue pairs
> > in one command.
> >
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >
> > v18:
> >    * fix some issues @Parav
> >
> http://lore.kernel.org/all/PH0PR12MB5481C32DA10A84488E421328DCF0A@PH
> 0P
> > R12MB5481.namprd12.prod.outlook.com
> >
> > v17:
> >    * fix some issues @Parav
> >
> http://lore.kernel.org/all/PH0PR12MB54819EB466305284A8C9F649DCE4A@PH
> 0P
> > R12MB5481.namprd12.prod.outlook.com
> >
> > v16:
> >    * fix some issues @Parav
> https://lore.kernel.org/all/PH0PR12MB54814174FC713CF5640B7B10DC1DA@P
> H0PR12MB5481.namprd12.prod.outlook.com/
> >    * introduce *_{packets,bytes}_allowance_exceeded
> >
> > v15:
> >    * query supported types via cvq @Parav
> >    * fix some problem @David
> >
> > v14:
> >    * introduce supported_stats to config space
> >    * add header(vq_index, size, type) to each reply stats
> >    * add ref to the tx GSO
> >
> >
> >
> >  device-types/net/description.tex        | 511 +++++++++++++++++++++++-
> >  device-types/net/device-conformance.tex |   1 +
> >  device-types/net/driver-conformance.tex |   1 +
> >  3 files changed, 510 insertions(+), 3 deletions(-)
> >
> > diff --git a/device-types/net/description.tex
> > b/device-types/net/description.tex
> > index 76585b0..514554c 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -88,6 +88,9 @@ \subsection{Feature bits}\label{sec:Device Types /
> > Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> Set MAC address through control
> >      channel.
> >
> > +\item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level
> statistics
> > +    to the driver through the control virtqueue.
> > +
> >  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash
> for encapsulated packets.
> >
> >  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue
> notification coalescing.
> > @@ -1156,6 +1159,7 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi
> >          u8 command;
> >          u8 command-specific-data[];
> >          u8 ack;
> > +        u8 command-specific-result[];
> >  };
> >
> >  /* ack values */
> > @@ -1164,9 +1168,12 @@ \subsubsection{Control
> > Virtqueue}\label{sec:Device Types / Network Device / Devi
> > \end{lstlisting}
> >
> >  The \field{class}, \field{command} and command-specific-data are set
> > by the -driver, and the device sets the \field{ack} byte. There is
> > little it can -do except issue a diagnostic if \field{ack} is not
> > -VIRTIO_NET_OK.
> > +driver, and the device sets the \field{ack} byte and optionally
> > +\field{command-specific-result}. There is little the driver can do
> > +except issue a diagnostic if \field{ack} is not VIRTIO_NET_OK.
> > +
> > +The command VIRTIO_NET_CTRL_STATS_QUERY and
> VIRTIO_NET_CTRL_STATS_GET
> > +contain \field{command-specific-result}.
> >
> >  \paragraph{Packet Receive Filtering}\label{sec:Device Types / Network
> > Device / Device Operation / Control Virtqueue / Packet Receive
> > Filtering}  \label{sec:Device Types / Network Device / Device
> > Operation / Control Virtqueue / Setting Promiscuous Mode}%old label
> > for latexdiff @@ -1805,6 +1812,504 @@ \subsubsection{Control
> > Virtqueue}\label{sec:Device Types / Network Device / Devi
> >
> >  Upon reset, a device MUST initialize all coalescing parameters to 0.
> >
> > +\paragraph{Device Statistics}\label{sec:Device Types / Network Device
> > +/ Device Operation / Control Virtqueue / Device Statistics}
> > +
> > +If the VIRTIO_NET_F_DEVICE_STATS feature is negotiated, the driver
> > +can obtain device statistics from the device by using the following co=
mmand.
> > +
> > +Different types of virtqueues have different statistics. The
> > +statistics of the receiveq are different from those of the transmitq.
> > +
> > +The statistics of a certain type of virtqueue are also divided into
> > +multiple types because different types require different features.
> > +This enables the expansion of new statistics.
> > +
> > +In one command, the driver can obtain the statistics of one or multipl=
e
> virtqueues.
> > +Additionally, the driver can obtain multiple type statistics of each v=
irtqueue.
> > +
> > +\subparagraph{Query Statistic Capabilities}\label{sec:Device Types /
> > +Network Device / Device Operation / Control Virtqueue / Device
> > +Statistics / Query Statistic Capabilities}
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_NET_CTRL_STATS         8
> > +#define VIRTIO_NET_CTRL_STATS_QUERY   0
> > +#define VIRTIO_NET_CTRL_STATS_GET     1
> > +
> > +struct virtio_net_stats_capabilities {
> > +
> > +#define VIRTIO_NET_STATS_TYPE_CVQ       (1 << 32)
> > +
> > +#define VIRTIO_NET_STATS_TYPE_RX_BASIC  (1 << 0)
> > +#define VIRTIO_NET_STATS_TYPE_RX_CSUM   (1 << 1)
> > +#define VIRTIO_NET_STATS_TYPE_RX_GSO    (1 << 2)
> > +#define VIRTIO_NET_STATS_TYPE_RX_SPEED  (1 << 3)
> > +
> > +#define VIRTIO_NET_STATS_TYPE_TX_BASIC  (1 << 16)
> > +#define VIRTIO_NET_STATS_TYPE_TX_CSUM   (1 << 17)
> > +#define VIRTIO_NET_STATS_TYPE_TX_GSO    (1 << 18)
> > +#define VIRTIO_NET_STATS_TYPE_TX_SPEED  (1 << 19)
> > +
> > +    le64 supported_stats_types[1];
> > +}
> > +\end{lstlisting}
> > +
> > +To obtain device statistic capability, use the
> > +VIRTIO_NET_CTRL_STATS_QUERY command. When the command completes
> > +successfully, \field{command-specific-result} is in the format of \fie=
ld{struct
> virtio_net_stats_capabilities}.
> > +
> > +\subparagraph{Get Statistics}\label{sec:Device Types / Network Device
> > +/ Device Operation / Control Virtqueue / Device Statistics / Get
> > +Statistics}
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_ctrl_queue_stats {
> > +       struct {
> > +           le16 vq_index;
> > +           le16 reserved[3];
> > +           le64 types_bitmap[1];
> > +       } stats[];
> > +};
> > +
> > +struct virtio_net_stats_reply_hdr {
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_CVQ       32
> > +
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_BASIC  0
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_CSUM   1
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_GSO    2
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_SPEED  3
> > +
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_BASIC  16
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_CSUM   17
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_GSO    18
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_SPEED  19
> > +    u8 type;
> > +    u8 reserved;
> > +    le16 vq_index;
> > +    le16 reserved1;
> > +    le16 size;
> > +}
> > +\end{lstlisting}
> > +
> > +To obtain device statistics, use the VIRTIO_NET_CTRL_STATS_GET
> > +command with the \field{command-specific-data} which is in the format
> > +of \field{struct virtio_net_ctrl_queue_stats}. When the command
> > +completes successfully, \field{command-specific-result} contains
> > +multiple statistic results, each statistic result has the
> > +\field{struct virtio_net_stats_reply_hdr} as the header.
> > +
> > +The fields of the \field{struct virtio_net_ctrl_queue_stats}:
> > +\begin{description}
> > +    \item [vq_index]
> > +        The index of the virtqueue to obtain the statistics.
> > +
> > +    \item [types_bitmap]
> > +        This is a bitmask of the types of statistics to be obtained. T=
herefore, a
> > +        \field{stats} inside \field{struct virtio_net_ctrl_queue_stats=
} may
> > +        indicate multiple statistic replies for the virtqueue.
> > +\end{description}
> > +
> > +The fields of the \field{struct virtio_net_stats_reply_hdr}:
> > +\begin{description}
> > +    \item [type]
> > +        The type of the reply statistic.
> > +
> > +    \item [vq_index]
> > +        The virtqueue index of the reply statistic.
> > +
> > +    \item [size]
> > +        The number of bytes for the statistics entry including size of=
 \field{struct
> virtio_net_stats_reply_hdr}.
> > +
> > +\end{description}
> > +
> > +\subparagraph{Controlq Statistics}\label{sec:Device Types / Network
> > +Device / Device Operation / Control Virtqueue / Device Statistics /
> > +Controlq Statistics}
> > +
> > +The structure corresponding to the controlq statistics is
> > +\field{struct virtio_net_stats_cvq}. The corresponding type is
> > +VIRTIO_NET_STATS_TYPE_CVQ. This is for the controlq.
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_stats_cvq {
> > +    struct virtio_net_stats_reply_hdr hdr;
> > +
> > +    le64 command_num;
> > +    le64 ok_num;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +    \item [command_num]
> > +        The number of commands received by the device including the cu=
rrent
> command.
> > +
> > +    \item [ok_num]
> > +        The number of commands completed successfully by the device
> including the current command.
> > +\end{description}
> > +
> > +
> > +\subparagraph{Receiveq Basic Statistics}\label{sec:Device Types /
> > +Network Device / Device Operation / Control Virtqueue / Device
> > +Statistics / Receiveq Basic Statistics}
> > +
> > +The structure corresponding to the receiveq basic statistics is
> > +\field{struct virtio_net_stats_rx_basic}. The corresponding type is
> > +VIRTIO_NET_STATS_TYPE_RX_BASIC. This is for the receiveq.
> > +
> > +Receiveq basic statistics do not require any feature. As long as the
> > +device supports VIRTIO_NET_F_DEVICE_STATS, the following are the
> receiveq basic statistics.
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_stats_rx_basic {
> > +    struct virtio_net_stats_reply_hdr hdr;
> > +
> > +    le64 rx_notifications;
> > +
> > +    le64 rx_packets;
> > +    le64 rx_bytes;
> > +
> > +    le64 rx_interrupts;
> > +
> > +    le64 rx_drops;
> > +    le64 rx_drop_overruns;
> > +};
> > +\end{lstlisting}
> > +
> > +The packets described below were all presented on the specified virtqu=
eue.
> > +\begin{description}
> > +    \item [rx_notifications]
> > +        The number of driver notifications received by the device for =
this
> > +        receiveq.
> > +
> > +    \item [rx_packets]
> > +        This is the number of packets passed to the driver by the devi=
ce.
> > +
> > +    \item [rx_bytes]
> > +        This is the bytes of packets passed to the driver by the devic=
e.
> > +
> > +    \item [rx_interrupts]
> > +        The number of interrupts generated by the device for this rece=
iveq.
> > +
> > +    \item [rx_drops]
> > +        This is the number of packets dropped by the device. The count=
 includes
> > +        all types of packets dropped by the device.
> > +
> > +    \item [rx_drop_overruns]
> > +        This is the number of packets dropped by the device when no mo=
re
> > +        descriptors were available.
> > +
> > +\end{description}
> > +
> > +\subparagraph{Transmitq Basic Statistics}\label{sec:Device Types /
> > +Network Device / Device Operation / Control Virtqueue / Device
> > +Statistics / Transmitq Basic Statistics}
> > +
> > +The structure corresponding to the transmitq basic statistics is
> > +\field{struct virtio_net_stats_tx_basic}. The corresponding type is
> > +VIRTIO_NET_STATS_TYPE_TX_BASIC. This is for the transmitq.
> > +
> > +Transmitq basic statistics do not require any feature. As long as the
> > +device supports VIRTIO_NET_F_DEVICE_STATS, the following are the
> transmitq basic statistics.
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_stats_tx_basic {
> > +    struct virtio_net_stats_reply_hdr hdr;
> > +
> > +    le64 tx_notifications;
> > +
> > +    le64 tx_packets;
> > +    le64 tx_bytes;
> > +
> > +    le64 tx_interrupts;
> > +
> > +    le64 tx_drops;
> > +    le64 tx_drop_malformed;
> > +};
> > +\end{lstlisting}
> > +
> > +The packets described below are all for a specific virtqueue.
> > +\begin{description}
> > +    \item [tx_notifications]
> > +        The number of driver notifications received by the device for =
this
> > +        transmitq.
> > +
> > +    \item [tx_packets]
> > +        This is the number of packets sent by the device (not the pack=
ets
> > +        got from the driver).
> > +
> > +    \item [tx_bytes]
> > +        This is the number of bytes sent by the device for all the sen=
t packets
> > +        (not the bytes sent got from the driver).
> > +
> > +    \item [tx_interrupts]
> > +        The number of interrupts generated by the device for this tran=
smitq.
> > +
> > +    \item [tx_drops]
> > +        The number of packets dropped by the device. The count include=
s all
> > +        types of packets dropped by the device.
> > +
> > +    \item [tx_drop_malformed]
> > +        The number of packets dropped by the device, when the descript=
ors are
> > +        malformed. For example, the buffer is too short.
> > +\end{description}
> > +
> > +\subparagraph{Receiveq CSUM Statistics}\label{sec:Device Types /
> > +Network Device / Device Operation / Control Virtqueue / Device
> > +Statistics / Receiveq CSUM Statistics}
> > +
> > +The structure corresponding to the receiveq checksum statistics is
> > +\field{struct virtio_net_stats_rx_csum}. The corresponding type is
> > +VIRTIO_NET_STATS_TYPE_RX_CSUM. This is for the receiveq.
> > +
> > +Only after the VIRTIO_NET_F_GUEST_CSUM is negotiated, the receiveq
> > +checksum statistics can be obtained.
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_stats_rx_csum {
> > +    struct virtio_net_stats_reply_hdr hdr;
> > +
> > +    le64 rx_csum_valid;
> > +    le64 rx_needs_csum;
> > +    le64 rx_csum_none;
> > +    le64 rx_csum_bad;
> > +};
> > +\end{lstlisting}
> > +
> > +The packets described below were all presented on the specified virtqu=
eue.
> > +\begin{description}
> > +    \item [rx_csum_valid]
> > +        The number of packets with VIRTIO_NET_HDR_F_DATA_VALID.
> > +
> > +    \item [rx_needs_csum]
> > +        The number of packets with VIRTIO_NET_HDR_F_NEEDS_CSUM.
> > +
> > +    \item [rx_csum_none]
> > +        The number of packets without hardware checksum. The packet he=
re
> refers
> > +        to the non-TCP/UDP packet that the device cannot recognize.
> > +
> > +    \item [rx_csum_bad]
> > +        The number of packets with checksum mismatch.
> > +
> > +\end{description}
> > +
> > +\subparagraph{Transmitq CSUM Statistics}\label{sec:Device Types /
> > +Network Device / Device Operation / Control Virtqueue / Device
> > +Statistics / Transmitq CSUM Statistics}
> > +
> > +The structure corresponding to the transmitq checksum statistics is
> > +\field{struct virtio_net_stats_tx_csum}. The corresponding type is
> > +VIRTIO_NET_STATS_TYPE_TX_CSUM. This is for the transmitq.
> > +
> > +Only after the VIRTIO_NET_F_CSUM is negotiated, the transmitq
> > +checksum statistics can be obtained.
> > +
> > +The following are the transmitq checksum statistics:
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_stats_tx_csum {
> > +    struct virtio_net_stats_reply_hdr hdr;
> > +
> > +    le64 tx_csum_none;
> > +    le64 tx_needs_csum;
> > +};
> > +\end{lstlisting}
> > +
> > +The packets described below are all for a specific virtqueue.
> > +\begin{description}
> > +    \item [tx_csum_none]
> > +        The number of packets which do not require hardware checksum.
> > +
> > +    \item [tx_needs_csum]
> > +        The number of packets which require checksum calculation by th=
e
> device.
> > +
> > +\end{description}
> > +
> > +\subparagraph{Receiveq GSO Statistics}\label{sec:Device Types /
> > +Network Device / Device Operation / Control Virtqueue / Device
> > +Statistics / Receiveq GSO Statistics}
> > +
> > +The structure corresponding to the receivq GSO statistics is
> > +\field{struct virtio_net_stats_rx_gso}. The corresponding type is
> > +VIRTIO_NET_STATS_TYPE_RX_GSO. This is for the receiveq.
> > +
> > +If one or more of the VIRTIO_NET_F_GUEST_TSO4,
> > +VIRTIO_NET_F_GUEST_TSO6 have been negotiated, the receiveq GSO
> statistics can be obtained.
> > +
> > +GSO packets refer to packets passed by the device to the driver where
> > +\field{gso_type} is not VIRTIO_NET_HDR_GSO_NONE.
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_stats_rx_gso {
> > +    struct virtio_net_stats_reply_hdr hdr;
> > +
> > +    le64 rx_gso_packets;
> > +    le64 rx_gso_bytes;
> > +    le64 rx_gso_packets_coalesced;
> > +    le64 rx_gso_bytes_coalesced;
> > +};
> > +\end{lstlisting}
> > +
> > +The packets described below were all presented on the specified virtqu=
eue.
> > +\begin{description}
> > +    \item [rx_gso_packets]
> > +        The number of the GSO packets received by the device.
> > +
> > +    \item [rx_gso_bytes]
> > +        The bytes of the GSO packets received by the device.
> > +        This includes the header size of the GSO packet.
> > +
> > +    \item [rx_gso_packets_coalesced]
> > +        The number of the GSO packets coalesced by the device.
> > +
> > +    \item [rx_gso_bytes_coalesced]
> > +        The bytes of the GSO packets coalesced by the device.
> > +        This includes the header size of the GSO packet.
> > +\end{description}
> > +
> > +\subparagraph{Transmitq GSO Statistics}\label{sec:Device Types /
> > +Network Device / Device Operation / Control Virtqueue / Device
> > +Statistics / Transmitq GSO Statistics}
> > +
> > +The structure corresponding to the transmitq GSO statistics is
> > +\field{struct virtio_net_stats_tx_gso}. The corresponding type is
> > +VIRTIO_NET_STATS_TYPE_TX_GSO. This is for the transmitq.
> > +
> > +If one or more of the VIRTIO_NET_F_HOST_TSO4,
> VIRTIO_NET_F_HOST_TSO6,
> > +VIRTIO_NET_F_HOST_USO options have been negotiated, the transmitq
> GSO
> > +statistics can be obtained.
> > +
> > +GSO packets refer to packets passed by the driver to the device where
> > +\field{gso_type} is not VIRTIO_NET_HDR_GSO_NONE.
> > +See more \ref{sec:Device Types / Network Device / Device Operation /
> > +Packet Transmission}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_stats_tx_gso {
> > +    struct virtio_net_stats_reply_hdr hdr;
> > +
> > +    le64 tx_gso_packets;
> > +    le64 tx_gso_bytes;
> > +    le64 tx_gso_segments;
> > +    le64 tx_gso_segments_bytes;
> > +    le64 tx_gso_packets_noseg;
> > +    le64 tx_gso_bytes_noseg;
> > +};
> > +\end{lstlisting}
> > +
> > +The packets described below are all for a specific virtqueue.
> > +\begin{description}
> > +    \item [tx_gso_packets]
> > +        The number of the GSO packets sent by the device.
> > +
> > +    \item [tx_gso_bytes]
> > +        The bytes of the GSO packets sent by the device.
> > +
> > +    \item [tx_gso_segments]
> > +        The number of segments prepared from GSO packets.
> > +
> > +    \item [tx_gso_segments_bytes]
> > +        The bytes of segments prepared from GSO packets.
> > +
> > +    \item [tx_gso_packets_noseg]
> > +        The number of the GSO packets without segmentation.
> > +
> > +    \item [tx_gso_bytes_noseg]
> > +        The bytes of the GSO packets without segmentation.
> > +
> > +\end{description}
> > +
> > +\subparagraph{Receiveq Speed Statistics}\label{sec:Device Types /
> > +Network Device / Device Operation / Control Virtqueue / Device
> > +Statistics / Receiveq Speed Statistics}
> > +
> > +The structure corresponding to the receiveq speed statistics is
> > +\field{struct virtio_net_stats_rx_speed}. The corresponding type is
> > +VIRTIO_NET_STATS_TYPE_RX_SPEED. This is for the receiveq.
> > +
> > +The device has the allowance for the speed. If
> > +VIRTIO_NET_F_SPEED_DUPLEX has been negotiated, the driver can get
> > +this by \field{speed}. When the received packets bitrate exceeds the
> > +\field{speed}, some packets may be dropped by the device.
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_stats_rx_speed {
> > +    struct virtio_net_stats_reply_hdr hdr;
> > +
> > +    le64 rx_packets_allowance_exceeded;
> > +    le64 rx_bytes_allowance_exceeded; }; \end{lstlisting}
> > +
> > +The packets described below were all presented on the specified virtqu=
eue.
> > +\begin{description}
> > +    \item [rx_packets_allowance_exceeded]
> > +        The number of the packets dropped by the device due to the rec=
eived
> > +        packets bitrate exceeding the \field{speed}.
> > +
> > +    \item [rx_bytes_allowance_exceeded]
> > +        The bytes of the packets dropped by the device due to the rece=
ived
> > +        packets bitrate exceeding the \field{speed}.
> > +
> > +\end{description}
> > +
> > +\subparagraph{Transmitq Speed Statistics}\label{sec:Device Types /
> > +Network Device / Device Operation / Control Virtqueue / Device
> > +Statistics / Transmitq Speed Statistics}
> > +
> > +The structure corresponding to the transmitq speed statistics is
> > +\field{struct virtio_net_stats_tx_speed}. The corresponding type is
> > +VIRTIO_NET_STATS_TYPE_TX_SPEED. This is for the transmitq.
> > +
> > +The device has the allowance for the speed. If
> > +VIRTIO_NET_F_SPEED_DUPLEX has been negotiated, the driver can get
> > +this by \field{speed}. When the transmit packets bitrate exceeds the
> > +\field{speed}, some packets may be dropped by the device.
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_stats_tx_speed {
> > +    struct virtio_net_stats_reply_hdr hdr;
> > +
> > +    le64 tx_packets_allowance_exceeded;
> > +    le64 tx_bytes_allowance_exceeded; }; \end{lstlisting}
> > +
> > +The packets described below were all presented on the specified virtqu=
eue.
> > +\begin{description}
> > +    \item [tx_packets_allowance_exceeded]
> > +        The number of the packets dropped by the device due to the tra=
nsmit
> packets
> > +        bitrate exceeding the \field{speed}.
> > +
> > +    \item [tx_bytes_allowance_exceeded]
> > +        The bytes of the packets dropped by the device due to the tran=
smit
> packets
> > +        bitrate exceeding the \field{speed}.
> > +
> > +\end{description}
> > +
> > +\devicenormative{\subparagraph}{Device Statistics}{Device Types /
> > +Network Device / Device Operation / Control Virtqueue / Device
> > +Statistics}
> > +
> > +When the VIRTIO_NET_F_DEVICE_STATS feature is negotiated, the device
> > +MUST reply to the command VIRTIO_NET_CTRL_STATS_QUERY with the
> > +\field{struct virtio_net_stats_capabilities}.
> > +\field{supported_stats_types} includes all the statistic types support=
ed by
> the device.
> > +
> > +If \field{struct virtio_net_ctrl_queue_stats} is incorrect (such as
> > +the following), the device MUST set \field{ack} to VIRTIO_NET_ERR.
> > +Even if there is only one error, the device MUST fail the entire comma=
nd.
> > +\begin{itemize}
> > +    \item \field{vq_index} exceeds the queue range.
> > +    \item \field{types_bitmap} contains unknown types.
> > +    \item One or more of the bits present in \field{types_bitmap} is n=
ot valid
> > +        for the specified virtqueue.
> > +    \item The feature corresponding to the specified \field{types_bitm=
ap} was
> > +        not negotiated.
> > +\end{itemize}
> > +
> > +The device MUST set the actual size of the bytes occupied by the
> > +reply to the \field{size} of the \field{hdr}. And the device MUST set
> > +the \field{type} and the \field{vq_index} of the statistic header.
> > +
> > +The \field{command-specific-result} buffer allocated by the driver
> > +may be smaller or bigger than all the statistics specified by
> > +\field{struct virtio_net_ctrl_queue_stats}. The device MUST fill up
> > +only upto the valid bytes.
> > +
> > +The statistics counters wrap around to zero on overflow.
> > +
> > +\drivernormative{\subparagraph}{Device Statistics}{Device Types /
> > +Network Device / Device Operation / Control Virtqueue / Device
> > +Statistics}
> > +
> > +The types contained in the \field{types_bitmap} MUST be queried from
> > +the device via command VIRTIO_NET_CTRL_STATS_QUERY.
> > +
> > +\field{types_bitmap} in \field{struct virtio_net_ctrl_queue_stats}
> > +MUST be valid to the vq specified by \field{vq_index}.
> > +
> > +The \field{command-specific-result} buffer allocated by the driver
> > +MUST have enough capacity to store all the statistics reply headers
> > +defined in \field{struct virtio_net_ctrl_queue_stats}. If the
> > +\field{command-specific-result} buffer is fully utilized by the
> > +device but some replies are missed, it is possible that some
> > +statistics may exceed the capacity of the driver's records. In such
> > +cases, the driver should allocate additional space for the \field{comm=
and-
> specific-result} buffer.
> > +
> >  \subsubsection{Legacy Interface: Framing
> > Requirements}\label{sec:Device  Types / Network Device / Legacy
> > Interface: Framing Requirements}
> >
> > diff --git a/device-types/net/device-conformance.tex
> > b/device-types/net/device-conformance.tex
> > index f88f48b..52526e4 100644
> > --- a/device-types/net/device-conformance.tex
> > +++ b/device-types/net/device-conformance.tex
> > @@ -15,4 +15,5 @@
> >  \item \ref{devicenormative:Device Types / Network Device / Device
> > Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS
> > processing}  \item \ref{devicenormative:Device Types / Network Device
> > / Device Operation / Control Virtqueue / Notifications Coalescing}
> > \item \ref{devicenormative:Device Types / Network Device / Device
> > Operation / Control Virtqueue / Inner Header Hash}
> > +\item \ref{devicenormative:Device Types / Network Device / Device
> > +Operation / Control Virtqueue / Device Statistics}
> >  \end{itemize}
> > diff --git a/device-types/net/driver-conformance.tex
> > b/device-types/net/driver-conformance.tex
> > index 9d853d9..c693c4f 100644
> > --- a/device-types/net/driver-conformance.tex
> > +++ b/device-types/net/driver-conformance.tex
> > @@ -15,4 +15,5 @@
> >  \item \ref{drivernormative:Device Types / Network Device / Device
> > Operation / Control Virtqueue / Receive-side scaling (RSS) }  \item
> > \ref{drivernormative:Device Types / Network Device / Device Operation
> > / Control Virtqueue / Notifications Coalescing}  \item
> > \ref{drivernormative:Device Types / Network Device / Device Operation
> > / Control Virtqueue / Inner Header Hash}
> > +\item \ref{drivernormative:Device Types / Network Device / Device
> > +Operation / Control Virtqueue / Device Statistics}
> >  \end{itemize}
> > --
> > 2.32.0.3.g01195cf9f
> >
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and to
> > minimize spam in the list archive, subscription is required before
> > posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License:
> > https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > List Guidelines:
> > https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
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

