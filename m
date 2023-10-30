Return-Path: <virtio-comment-return-8020-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499E2C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 01:36:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8426C2B01A
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 01:36:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 72D02986AE2
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 01:36:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5DA869869D7; Mon, 30 Oct 2023 01:36:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 45B8F986A37
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 01:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLxYGk9ItekiuAbZNWAvVf0bebPEdML930LQpjTew4i0On9OHLHrRyliIkxDoMHWlvYkJzCTCinRchoYrgmyTJAP99I4EJks7GCWsvSVOoCGYDEuOXmRrknFSzMj9bPIHezr2OOmqnqgvC330UJ+g6m7FovvdDeKpnIwseupGww4LzZ2tmR9Ixx1//PNmMop4yV5Xsch5xZxWVBgasHKT9N/lYBK6okgj97qzLf7uOLcylE0GlnrTFYnPZmi4iYko54yKqGr/B94f3N1xU3U6bFg0/yoM5PXEuKfLC/pYMtLV4yE7iaf+83LepT8KYU8CWenTDwWOj3hSV6HYlVfvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1z2P/YhN/+wVQ/ho6VCNjCD21XBs34Eg5x4j3fW3qnA=;
 b=YrIOGvqwfh9HQU5OnNrAoe0Knwbuf6IHSsBMiSscCo9areKvyJPA4b+fS/h2nXj237M04Pm49eFnYmxHjt2kGCfcszTKhrtqlF/8DkuEPGZJaBx4TZge7JNLXmq9eN8VEoBRezb1uMDX86amluo9aLhjac8JhgflrvoCkr/f/FiULHRYTahIFAxlfFPV0rqH2jTj2kOF/6UJgYfpQ7DnnMaGGAkMf/np4SwWDUNKUNsQXBvk4reNEhoMc0lfQQ5xtesbBTrg/XQELD0S8SKM0kplKBtqCMfF4UOfneoH+a0DQk+Nf7CLjuQizoQrcJNNZkkv309mYKoAvh9V1PCVhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>,
        "mst@redhat.com" <mst@redhat.com>,
        "cohuck@redhat.com" <cohuck@redhat.com>
CC: "shahafs@nvidia.com" <shahafs@nvidia.com>,
        "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>,
        "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>,
        Heng Qi <hengqi@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH v3 2/6] virtio-net: Add flow filter capabilities
 read commands
Thread-Index: AQHaCNjcfb0lqJTm7UOCp5clir6orrBhhL3w
Date: Mon, 30 Oct 2023 01:36:13 +0000
Message-ID: 
 <SJ0PR18MB447748C4B448023563A7F6DBC3A1A@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20231027132324.1349963-1-parav@nvidia.com>
 <20231027132324.1349963-3-parav@nvidia.com>
In-Reply-To: <20231027132324.1349963-3-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|BN9PR18MB4169:EE_
x-ms-office365-filtering-correlation-id: 50a8eb8d-6b64-4efa-5769-08dbd8e89a5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 beipfZ7+eIdGz/NcNO63g9DwRKrU4RbM3Zni6i743SO626tQ+vCE8IdxXFtamy5Mpp72AaQJNcRZphlv1IyIvHMHot+6C/jIBQrmsGdl2KoWzdoGL1uIKszjSTJhr2UHso0uBPPnUdEECX3tDICaoWsjnL8leUMOW77Een9UWtV6pQuX7acvsaE0enYNJo4UuUAw2q4lrgw6j0JekXK9NNPnDIx4em9JlpZOEit7aTcj2PXJpVigtHDyy7J9FFkVFPE0VX2Ezak3SenPY/lHdJ6oMk+/PD7xF0hRJu6YcFtYysLs+xEf9hhemCUU+KUZiFjeqEEcbfhguscmLdAuV+mn90c44yOASeqM4pAQRKVEaqRWCoaGrVG8iistNhnO9fpTtWRVxBInZm9XlK8hCmILQPyHTQvXX+KtKB94iY/37WBhwTl3DNZ72KFnw8wAEWgx9dFzqmfIoKOl/qxtwITaGOTq09dD5Dqv+X8+2v1cgzFl8Z8X8azFYXsRy7un3wuE0dBC1psYb4lnuql6QvD3+pa4HXlbXSIhLWPcEPDDigklV5Ufx7h0N/aMXYWautb5I9MCvF781+/i02cXd7nF6+eJWeogXZRuEWI3SwrVBkH4i5S7oXNUAHpI16LLObOzYgMO1uI/HwB2oMgs7w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39850400004)(376002)(366004)(136003)(230922051799003)(230273577357003)(230173577357003)(451199024)(64100799003)(186009)(1800799009)(55016003)(2906002)(66446008)(64756008)(54906003)(66476007)(66556008)(76116006)(66946007)(122000001)(316002)(38100700002)(6506007)(71200400001)(7696005)(53546011)(966005)(19627235002)(478600001)(9686003)(110136005)(83380400001)(26005)(41300700001)(5660300002)(8936002)(8676002)(4326008)(86362001)(33656002)(52536014)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?RXHH8DJ+yD4inkI1klVM5Ty69Yp0eCTHQ9cZqbt4AGRH4sMlVcoJBHNC0qZf?=
 =?us-ascii?Q?QhNTyS2kpKjIPWIoDJrWuRPeZyKNQQRhonbzSlqd2qFlDMmPSFnehA4sE4eg?=
 =?us-ascii?Q?qJBWgW79edXrmNrzz4nv9y1IuqMzAzz9Eeq0Ga8hOQT6oNJmJAKoMhybmsis?=
 =?us-ascii?Q?ljK/BOjPRRudfcGYordCmcvJr82VhxGWD1YDlhd+6D3Fl1PsQmx9flu/jvY0?=
 =?us-ascii?Q?6CHWKlVenegW6ALKT/RxgGA32mNAtsGpUAbVcrSRMAqHUznMszDs1Uo/hasM?=
 =?us-ascii?Q?fuUa+EED+g+ZHyy7dvg8cbvzUNntNahxkjyEyVB5vaEZ6nfRyMhYJ0Yscf/a?=
 =?us-ascii?Q?gE5an+2cU3GgudRCdkhDqchlXZHGcyydwMZscz92nzF+njIyi1T4cZXl6p5l?=
 =?us-ascii?Q?1rz5/ukBZxHNRsMnON1NH0YFiUeoDu7T2U71+uk+5exzigrq9b/Ym2VvHdpw?=
 =?us-ascii?Q?DXukG2GKkYX8Hk6a4tZKGVxH2wMSRsCGMOJT93XdSekf0lpEDeF6tkfy2ytQ?=
 =?us-ascii?Q?V3IztP5QuHEMDU8g6tsVvaOG2ihlBrGxxoDlRuGLifwKi/yAORN8g+vqjl91?=
 =?us-ascii?Q?h/Y1Rv+OzE6RedxGjoU8oZZwSQbrnCUu1suiL0j8IdCe9IOsEehSTed7vJlh?=
 =?us-ascii?Q?ma0ba5S6qsN5S0G1wzpxRACAyotKI/GDTev7M/d2Pw52y2yAfN/Hw3i6s3lu?=
 =?us-ascii?Q?0jtn/A2MnBgfDy6qETbG9E5eQHLi6cRAZK9xX+8DVIyhz1E0CfLFUp6xwN3l?=
 =?us-ascii?Q?WkHizxNoF5dagviaYaaJWEOMdE7drM15+BMu7WBfZu/MNQ24I7EtUkGf6F6P?=
 =?us-ascii?Q?vMPHKmOcFWKDdCzfT9XkluCoHOC5pd/g5UrEd60Y+It5EkMKJljz6crxq1xa?=
 =?us-ascii?Q?vtxqykaiKy88cQXtomcHJfE1g1HjVW5rH4nDLw7A+khC8Shu5KrJ4M4XCa/W?=
 =?us-ascii?Q?8WyP3nEBf5okctQFflUVDRwl4OqIxXU0Cnc2nE3Dh9wM9mM/tG0+3tChKCMq?=
 =?us-ascii?Q?tN9sY0EoYPFdmAuVwQUHKH0wEEuBrUxVdgpVDh43gxhR1EjM17SL5+7KBk0C?=
 =?us-ascii?Q?lzr90pvWfAptPj3GewTpUCTyK5S9Vyy4JOwpHzmni03nlcI4IyIV351vDkY8?=
 =?us-ascii?Q?vKDtQjljUOo+vLuUgIMraPIWEfxrbqQ5joZRz/0fAlN2K2l47FoR2sZzJicn?=
 =?us-ascii?Q?+0+FPV3uPRhhE2G6p2zj5tN9lvilyanwLY0G3bM5QAumVf/U1cJRLOqIyOPM?=
 =?us-ascii?Q?5SBqZreZz6FmANGQ3wsF+STdTal1jmONUsJoQcPAD5Pj/ZbTho1P+M2oeF73?=
 =?us-ascii?Q?19N16wvXwJYh1p7XcRZ7F1RssAbJl6OTS0R4YcdOGUpAxl0EDnGmAKC2GQe4?=
 =?us-ascii?Q?HTXGw7I49X2RbC6ULdcTK8asAzs+p+Z7nrZgZ4d+TNkJdvRhq5tzheFTs8Gt?=
 =?us-ascii?Q?mDktyreZHjlf+SMRo7O+0fNltKmmI9xDAAxPJbeh4eX1h/Ngqg1YxCgDc1oZ?=
 =?us-ascii?Q?2usaBGvuJbj/Fwdnplf0Gl/bjVUzgY0bwqed3i6/ehzFuZHp+n+0nt9eFVKT?=
 =?us-ascii?Q?CrwTAOT7lEJJB6nGQSEVkaCwGvQyJQoqClaqfj04?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a8eb8d-6b64-4efa-5769-08dbd8e89a5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2023 01:36:13.6268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oWpP1N2Rf75iSJ9EOzSA0DN0QW/DSj0a1G17RM/OgOMXvUCJSitj4j+3q2ZDqARhso7GxPdb98yQCZ8AEmONiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR18MB4169
X-Proofpoint-GUID: U2aZSUvisE5j1pqHaA_xJMDj0gYHlgZB
X-Proofpoint-ORIG-GUID: UFpbkjTBQ4_teje0DigPEi1l1Q1TCZnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_01,2023-10-27_01,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [PATCH v3 2/6] virtio-net: Add flow filter capabilities
 read commands

Hi Parav

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Friday, October 27, 2023 6:23 AM
> To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> cohuck@redhat.com
> Cc: Satananda Burla <sburla@marvell.com>; shahafs@nvidia.com; si-
> wei.liu@oracle.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> <parav@nvidia.com>; Heng Qi <hengqi@linux.alibaba.com>
> Subject: [EXT] [PATCH v3 2/6] virtio-net: Add flow filter capabilities
> read commands
>=20
> External Email
>=20
> ----------------------------------------------------------------------
> The device responds flow filter capabilities using two commands.
> One command indicates generic flow filter device limits such as
> number of flow filters, number of flow filter groups, support or
> multiple transports etc.
>=20
> The second command indicates supported match types, and fields
> of the packet.
>=20
> Fixes: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> 3A__github.com_oasis-2Dtcs_virtio-
> 2Dspec_issues_179&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DNHDPsfcAYlN2z=
-
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DGknvLw2Qpf9nPonjhWw3_Lc5eykfVdDRg1fga_E=
J
> CtMR5FPF3CjtDKJYjCUT1tvU&s=3DXW811-B24-
> DCa7KJgZdBUlXx9LYmZMzfByaCAlChmi8&e=3D
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
>=20
> ---
> changelog:
> v1->v2:
> - addressed comments from Satananda
> - added vlan type match field
> - kept space for types between l2, l3, l4 header match types
> - renamed mask to mask_supported with shorter width
> - made more fields reserved for furture
> - addressed comments from Heng
> - grammar correction
> - added field to indicate supported number of actions per flow
>   filter match entry
> - added missing documentation for max_flow_priorities_per_group
> v0->v1:
> - added mask field in the type to indicate supported mask by device
>   and also in later patch to use it to indicate mask on adding
>   flow filter. As a result removed the mask_supported capability
>   field
> ---
>  device-types/net/description.tex | 220 ++++++++++++++++++++++++++++++-
>  1 file changed, 218 insertions(+), 2 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index fc56af6..2aba5d0 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1173,7 +1173,11 @@ \subsubsection{Flow Filter}\label{sec:Device
> Types / Network Device / Device Ope
>  The device indicates the flow filter capabilities to the driver. These
>  capabilities include various maximum device limits, supported
> transports and
>  supported packet match fields. The driver enables the transport for
> flow
> -filter requests using a control virtqueue command.
> +filter requests using a control virtqueue command. These control
> virtqueue
> +commands are:
> +\ref{sec:Device Types / Network Device / Device Operation / Control
> Virtqueue / Flow Filter / Flow Filter Capabilities Get}
> +and
> +\ref{sec:Device Types / Network Device / Device Operation / Control
> Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
>=20
>  The device supports transporting flow filter requests on either the
> control
>  virtqueue or on the flow filter virtqueues or on both. However, device
> @@ -1181,6 +1185,8 @@ \subsubsection{Flow Filter}\label{sec:Device Types
> / Network Device / Device Ope
>  at a time, i.e. either control virtqueue or flow filter virtqueues.
>  Once the driver sets the flow filter request transport in the device,
>  the driver can send flow filter request using the enabled transport.
> +The driver enables the transport for flow filter requests using a
> control
> +virtqueue command.
>=20
>  The flow filters are grouped using a flow filter group. Each flow
> filter
>  group has a priority. The device first applies the flow filters of the
> highest
> @@ -1247,7 +1253,136 @@ \subsubsection{Flow Filter}\label{sec:Device
> Types / Network Device / Device Ope
>        the flow filters in group_C, the flow filters of next level
> group_B are applied.
>  \end{itemize}
>=20
> -\label{sec:Device Types / Network Device / Device Operation / Control
> Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
> +\paragraph{Match Types and Fields}\label{sec:Device Types / Network
> Device / Device Operation / Flow Filter / Match Types and Fields}
> +
> +\begin{lstlisting}
> +struct virtio_net_ff_match_type_cap {
> +        le16 type;
> +        u8 mask_supported;
> +        u8 reserved[5];
> +        le64 fields_bmap;
> +};
> +\end{lstlisting}
> +
> +The \field{type} corresponds to following table:
> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Type & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_ETH_HDR & Ethernet header of the packet \\
> +\hline
> +0x1   & VIRTIO_NET_FF_VLAN_TAG_HDR & VLAN tag of the packet \\
> +\hline
> +0x200   & VIRTIO_NET_FF_IPV4_HDR & IPv4 header of the packet \\
This leaves 256 types for L2 and VLAN, do we really need
so many L2 types ?
> +\hline
> +0x300   & VIRTIO_NET_FF_IPV6_HDR & IPv6 header of the packet \\
> +\hline
Can we leave a few bits (4) for L3 headers and start L4 after?
Specifically for IPV6 we may need extension header bits matching in
future. (SPI in ESP extension header for instance).=20
> +0x400   & VIRTIO_NET_FF_TCP_HDR & TCP header of the packet \\
> +\hline
> +0x500   & VIRTIO_NET_FF_UDP_HDR & UDP header of the packet \\
=20
Regards
Satananda

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

