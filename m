Return-Path: <virtio-comment-return-8562-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1ACC61D97
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 15:01:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 57CA241F32
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 15:01:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 242DA9868AF
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 15:01:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DD9B0986898; Wed, 22 Nov 2023 15:01:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CB944986899
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 15:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdo2buhgdWhLv2nH4bfGHWpZCD2nFhJOzF24v5RPq993OCdqhLJ3aZ/iuQJCOQh4Mkr7DMqvukySPTb1Qd5ENDw6L+x5IMmK/DDmDpoSpCxg1Zj94OWl+STeD8Dfsr2mMpT8+VlD32xwcuJPpV+vYKA4uHSDgBEea3pILX81gwEsMjWZcrV5JCYgr555CsWyOscyriz7kE8dLLpPwVZIcy2yJYRXYBrRCKDrmHJL8hwSfxny3rVbjBVdmf4k0hAHcnIQXfK4PYK4b54wmHgTH5B5B+UW1nE0zaIrEVcGkIzIYcxIXITsx1lLtoJkLv9qAzG6Q28SKSygfdo3GQGNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZM+pKmPeG6MKUTHpz3lS8mBVvxUmC8M9A+xZpmlo8+c=;
 b=I7KV9mMHXsg3fmEJ/kknijSEuPslt1eejIgxFe1qwXm59MA+CxGGwH4AFsZzKMCMbYNsMdL3gHFCWop2IMQl2+TUtpYI7x1R/byycwx8bjaSWt/r5jG3TWstjJjHMXoBGnRcNIqt10Y20KLMwRQq1hfnIkSnqf1xxS+IwExjcM7ki8qwE3yPN6Q37I80Y2rPMVVIbeHeljxP6gOcLv7MH8CdjTC9bcCS8k+Z5VQrWf5L6d04Wh+swPDj9EcmffeCsGH+YzM0k/kHJjRfrATQ/PcWXz5CZFqOQc8KDyyNaIWlJYpRnZBgO7ncQpZwIIXxjVHmN8DVMziNyMTzs91zUg==
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
Thread-Index: AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3CAAA00AIAAAVTg
Date: Wed, 22 Nov 2023 15:00:57 +0000
Message-ID:
 <PH0PR12MB5481839D119A0A555B40D7EADCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231122094431-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY5PR12MB6201:EE_
x-ms-office365-filtering-correlation-id: 508d4ca7-1fbb-4715-5eb3-08dbeb6bd561
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 RxEQl9q4pgMzuZjE5sEomx6qeTrntUNsYFLBZ0/Ib0kuIW72G4FXwnT+xBbtLYElYJX7s2EaZoLEL0wtQI5ePQX5kJ46dITd62x62ldfpwYKD6AXSnJcIf23q02Qu7oBx3Y0tywQg3954NhqFVIhbMb9ZwwNPSM6GDtMDDXqZKB2f0CKiqtJ/kpvg4r+xKxj+UzXTgJ9X0u76XgxVuSPhH3VZtDM35ZlvIH8eeWdRHXD4FbYwj/Y2FZtnn4BjhpMqkJ+Xg3u66T8YiKrgmQF0VYd3Y2oMI896uJ9I8KAwJgIC84Lb6jD0QBuyc+hciRfyiQxYT2mSDazoB6X8wEvUe8LaYn+gAW7CjLINF0QRGgwbClVqHHGKUg2P1GEBWGKSThjcRoSPM2nPMzLun4DS+PSEXQKLRSOepxLQ98ZJUzixhaFhPEfLQXZG/bKxfJuKlR1KjzqF/LiM7MAcZxxsIPgrz57pOxwVyTtkMI5B52yRAqocWgbIguyCJmylt3HWemZvsK4ZsK1dglZdc8A3luJU6bSJucP4DLG5P69D0zqBMztDnlna2FUfulTrIaJu7jSZiN4OAYHdv8ehkRIf9n/t+qqjbJUMek83cD8dKam/boaktU1tXgcUrQUBUh1Voje+C0ifg2B6kw/yx0wKpwcwHWxX5njqeGGliRWt2DvnSQSWISZJ78hLVeOhkKOUoLSgNtF4AQ/hlsvrpuHJep/wGQnh4fHIYeiCsGhMp8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(122000001)(83380400001)(71200400001)(6506007)(7696005)(478600001)(966005)(55016003)(26005)(19627235002)(6916009)(76116006)(316002)(54906003)(66446008)(66946007)(66556008)(64756008)(66476007)(4326008)(9686003)(8676002)(8936002)(38100700002)(2906002)(5660300002)(30864003)(41300700001)(86362001)(33656002)(38070700009)(52536014)(5930299018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lJWGrXra5kfHjYAmcLHIqe2VSBpWYilOMNJSfFHrNI4H6xjEi5plWklchrMu?=
 =?us-ascii?Q?bEpSGPZ72QTb42VB71izGQn+ep54wgSrOH/KuefzzTOEs/JxHmeBvVp9hJPF?=
 =?us-ascii?Q?sSUPvFGYn67wGyS3D+qi66mQ5iNLqqnja7m88xOPXIh2dIJdv4xd65m3yxGO?=
 =?us-ascii?Q?qrBJeZL2JHNe4UncwjCPZfgWvaySJp2PVblCq1QTp1scYqc4UMwC09lww7Wx?=
 =?us-ascii?Q?hO41F/0/KYTxCyu9g5NqyqxQn/9/SBXIHl4EMHg0PRYmFghmMvOvHyMV+31b?=
 =?us-ascii?Q?xB4ml28b89vVVpMf2YDk9N8O9m0oGjP8NiSbbLUEQqr7X6RqQevXN2s1RLq6?=
 =?us-ascii?Q?0/dZ3CnOGC5uZ/P6x4aVmqDRVlCot1ujUkOdzOqUJBydq/jNdTV0mJSOWV0j?=
 =?us-ascii?Q?KXSRGfnBIcaB0OEWhHL/DanzqFS7W0X3WnWoJ2umWoB/SBt1046IppydrkSQ?=
 =?us-ascii?Q?etSfFookc+7KrXKjYO3etKnNxjL9lmy4Lwge5DP8699AkqHyzonAYvfQqUSE?=
 =?us-ascii?Q?Jdw9NdTxryvYCZ7WQalrptXdKeXfEoE3xbrF+ESUG80s2ht1hh/4tWNLYsFr?=
 =?us-ascii?Q?QMb+wGidTR77bNe24mZ9rT+kguX1//LuFE9v7utg7aVgbMYMHryehr60NjQE?=
 =?us-ascii?Q?US/U63kWtZA9ITsinddl8R/Ohbgjq9KbM4sjxlj/NPlJ23E6j0dX+18Ha0KM?=
 =?us-ascii?Q?AwJ3vXaEyupbNlAr1YZPv2wjVL5rwWxkx78CnjvqVBcznCYEWjoKNqCKyJlR?=
 =?us-ascii?Q?FJ5nnsqk+r1305CPHWFFXtMcbgtYIVyu9dKl2ppuHoi2o2vxtI4EaU6H2n9Q?=
 =?us-ascii?Q?fpAtZYWnzah8aBtcjUo7+gEnfyUJhV4R/bk0Nyy3nRSK5BLtgJETHTiAlJpC?=
 =?us-ascii?Q?LhFqIez1JnbSSBtOjuJEsEFETw22x9GJhaCFNTbAToN7tLq8hY9jr3jqt0Bz?=
 =?us-ascii?Q?hN3ObTHNiIBzQyNLX9AJqedsibsxmzmgExAkk+PxxBji09osCsa6XaXWiyen?=
 =?us-ascii?Q?ImaAMukBcpq7AsPMAqmXYBXdu7+zD7vkPI73dj4oHt9Izvzghk6X95wU0lBe?=
 =?us-ascii?Q?JHLgjqrjSIsULVNSxJACJvJY3qlN0s16YaexuDCxQzLBMesFCljo3zPHTCfK?=
 =?us-ascii?Q?y8pQTOrlFOnA5uvYVr2sOMEAtYTWw2a0t+YQMPHxD8kPy5BVNeJGcwqVOKT0?=
 =?us-ascii?Q?6C5OKIYQ0klmqbn3zQmngv8v/DbE1hY53iiaNfCvm4FljWyg8s4Aqq2C63m9?=
 =?us-ascii?Q?cpprQxFKSkm7DYaUEifLcppNMvJRLxOmGXg+cdx2Gi+CbLhRA5jh29CNjPIt?=
 =?us-ascii?Q?o7tDZmt+IDk36w6jTHKbjgFLAkhynUzbqhUx7ydM6u640fblfAq8yuQgYyhD?=
 =?us-ascii?Q?qRqryZguU73vx8+zsFHxH10BmlSgBgbhEOo48xvWIRbLsInOeb0J4ourc81+?=
 =?us-ascii?Q?S4tA+pHvmy534/LzDIdRMfOrqGU/84kLU42mZsbvpJCI7dUDnKLNiT6OFtlp?=
 =?us-ascii?Q?ZDZnI/BQ8GOlMK9qNr3SYjPpPpwzgRomuck0qLvi4tOh0QlAStWbcW8pesgP?=
 =?us-ascii?Q?FyYkiT3vpIaUG8XAqXg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508d4ca7-1fbb-4715-5eb3-08dbeb6bd561
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 15:00:57.6696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DWtzcS8b5rokyRw7NJ+F+17z3C1Du9fjykyHAX0EP9/JyogvhaLjBPSnjHTD1D/+jg0nd1st/yjpxzhS6brtUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6201
Subject: [virtio-comment] RE: [PATCH v6 2/5] virtio-net: Add flow filter capabilities read
 commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, November 22, 2023 8:21 PM
>=20
> On Wed, Nov 22, 2023 at 02:10:29PM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, November 22, 2023 7:32 PM
> > >
> > > On Fri, Nov 10, 2023 at 02:38:50PM +0200, Parav Pandit wrote:
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
> > > >
> > > > ---
> > > > changelog:
> > > > v2->v3:
> > > > - rebased on virtio-1.4 branch
> > > > - removed reference for flow filter virtqueue
> > > > v1->v2:
> > > > - addressed comments from Satananda
> > > > - added vlan type match field
> > > > - kept space for types between l2, l3, l4 header match types
> > > > - renamed mask to mask_supported with shorter width
> > > > - made more fields reserved for furture
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
> > > >  device-types/net/description.tex | 208
> > > > ++++++++++++++++++++++++++++++-
> > > >  1 file changed, 206 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/device-types/net/description.tex
> > > > b/device-types/net/description.tex
> > > > index 30220b5..eccd8d6 100644
> > > > --- a/device-types/net/description.tex
> > > > +++ b/device-types/net/description.tex
> > > > @@ -1173,7 +1173,11 @@ \subsubsection{Flow
> > > > Filter}\label{sec:Device Types / Network Device / Device Ope
> > > >
> > > >  The device indicates the flow filter capabilities to the driver.
> > > > These  capabilities include various maximum device limits and
> > > > -supported packet match fields.
> > > > +supported packet match fields. These control virtqueue commands ar=
e:
> > > > +\ref{sec:Device Types / Network Device / Device Operation /
> > > > +Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
> > > > +and \ref{sec:Device Types / Network Device / Device Operation /
> > > > +Control
> > > Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
> > > >
> > > >  The flow filters are grouped using a flow filter group. Each flow
> > > > filter  group has a priority. The device first applies the flow
> > > > filters of the highest @@ -1224,7 +1228,136 @@ \subsubsection{Flow
> > > Filter}\label{sec:Device Types / Network Device / Device Ope
> > > >        the flow filters in group_C, the flow filters of next level
> > > > group_B are
> > > applied.
> > > >  \end{itemize}
> > > >
> > > > -\label{sec:Device Types / Network Device / Device Operation /
> > > > Control Virtqueue / Setting Promiscuous Mode}%old label for
> > > > latexdiff
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
> > > > +When the \field{mask_supported} is set, for the specific
> > > > +\field{type}, the device can perform masking packet fields with
> > > > +the mask supplied in the flow filter match entry.
> > > > +
> > > > +For each \field{type} the \field{fields_bmap} indicates supported
> > > > +fields of the packet header which can be matched.
> > > > +
> > > > +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields are
> > > > +represented by a bitmap in \field{fields_bmap} are following:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Bit & Name & Description \\
> > > > +\hline \hline
> > > > +0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the
> packet \\
> > > > +\hline
> > > > +1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet \\
> > > > +\hline
> > > > +2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
> > > > +\hline
> > > > +other   & -    & reserved \\
> > > > +\hline
> > > > +\end{tabular}
> > > > +
> > > > +For the \field{type} of VIRTIO_NET_FF_VLAN_TAG_HDR, VLAN tag
> > > > +fields are represented by a bitmap in \field{fields_bmap} are foll=
owing:
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
> > > > +represented by a bitmap in \field{fields_bmap} are following:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Bit & Name & Description \\
> > > > +\hline \hline
> > > > +0   & VIRTIO_NET_FF_SRC_IPV4 & Source IPV4 address in the packet \=
\
> > > > +\hline
> > > > +1   & VIRTIO_NET_FF_DST_IPV4 & Destination IPV4 address in the
> packet \\
> > > > +\hline
> > > > +other   & -    & reserved \\
> > > > +\hline
> > > > +\end{tabular}
> > > > +
> > > > +For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields are
> > > > +represented by a bitmap in \field{fields_bmap} are following:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Bit & Name & Description \\
> > > > +\hline \hline
> > > > +0   & VIRTIO_NET_FF_SRC_IPV6 & Source IPV6 address in the packet \=
\
> > > > +\hline
> > > > +1   & VIRTIO_NET_FF_DST_IPV6 & Destination IPV6 address in the
> packet \\
> > > > +\hline
> > > > +other   & -    & reserved \\
> > > > +\hline
> > > > +\end{tabular}
> > > > +
> > > > +For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields are
> > > > +represented by a bitmap in \field{fields_bmap} are following:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Bit & Name & Description \\
> > > > +\hline \hline
> > > > +0   & VIRTIO_NET_FF_SRC_TCP_PORT & Source TCP port in the packet \=
\
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
> > > > +represented by a bitmap in \field{fields_bmap} are following:
> > > > +
> > > > +\begin{tabular}{|l|l|l|}
> > > > +\hline
> > > > +Bit & Name & Description \\
> > > > +\hline \hline
> > > > +0   & VIRTIO_NET_FF_SRC_UDP_PORT & Source UDP port in the packet
> \\
> > > > +\hline
> > > > +1   & VIRTIO_NET_FF_DST_UDP_PORT & Destination UDP port in the
> packet
> > > \\
> > > > +\hline
> > > > +other   & -    & reserved  \\
> > > > +\hline
> > > > +\end{tabular}
> > > > +
> > >
> > > This is such an elaborate structure to report just 12 read only bits.
> > > Please let's just follow the example of  le32 supported_tunnel_types
> > > and add
> > > l32 supported_flow_control.
> > >
> > supported_tunnel_types was let go because cvq is efficient.
> > None of these fields are needed for init time configuration of the driv=
er
> before DRIVER_OK.
>=20
> I really basically disagree. Whether control flow is supported can easily
> influence how many VQs are needed.

I don't understand this line.
Can you share example?

>=20
>=20
> >
> > It is a very narrow view of 12 bits. It is going to grow and many.
> > This is far more structured for each type done here.
> >
> > >
> > > After you were trying to add kilobytes to megabytes of memory - I
> > > see little reason to save 12 RO bits that can be shared by any number=
 of
> VFs.
> > >
> > Completely wrong reason and very late review and also does not align wi=
th
> every other command we did.
>=20
> which other command? hash and rss are like this: capability in config spa=
ce
> config through cvq. For the same reason.
>=20
> > > However, I do think we should create an option to access config
> > > space over DMA (preferably admin commands). Let's add this quickly
> > > and then we don't need to worry about legacy guests accessing flow fi=
lter
> through MMIO.
> >
> > CVQ is already there as single interface forget and set for rss, rss co=
ntext, vq
> moderation, statistics, flow filter caps and more.
> > No reason to bifurcate.
>=20
> The reason is so that we have a single consistent view where e.g. you wan=
t to
> provision a device with a specific capability you just specify how its co=
nfig
> space looks.
Provisioning will have single consistent way to provision, some will sit in=
 config space due to history, some will not be.

>=20
> If you start shuffling capabilities off to VQs that will be much much har=
der.
Not sure harder for which system component.

>=20
> > I won't be able to absorb this comment of DMA interface.
> > If I discuss further, I will repeat the whole document [1] and I will a=
void that
> now.
> >
> > [1]
> > https://docs.google.com/document/d/1Iyn-
> l3Nm0yls3pZaul4lZiVj8x1s73Ed6r
> > Osmn6LfXc/edit#heading=3Dh.qexbtyc2jpwr
>=20
>=20
> I really worry about how provisioning will work. And I do not at all cher=
ish
> replicating all of these query capability commands for provisioning.
> Instead, I propose commands for config space access to solve everything i=
n
> one go, for all device types.
Querying the new capabilities via the dma interface is same as using CVQ wi=
th disadvantage of creating yet more registers.

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

