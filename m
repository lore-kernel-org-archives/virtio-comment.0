Return-Path: <virtio-comment-return-7573-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC75E748ED
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 09:42:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 99FF32CAED
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 09:42:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 762F19866B1
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 09:42:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5F63C983D6F; Sun,  1 Oct 2023 09:42:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 48EAD98652B
	for <virtio-comment@lists.oasis-open.org>; Sun,  1 Oct 2023 09:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A300zF6NckVqUHwuaPS4X+CMNH/4KD1Hm/Q9g1axJXIgLthS88MGhqVTMzd7g+E/NzMzBm2DBexAiEKMxkzbes1ULyKkOZ6AFVg/sGH9FZ3BVGlf5dSbiFmrqqnS3+s2t9FhyGwFfV40vQ5ORZnEfIvaVUUb4h7gtonThh9KFoP4hfAXgF0zz7dSQOTVKngwvgjM4os6NwPSXqBNBAHaDELffKxWU3q2wte6mt/G+76wudBI9C9lzzvKIU9eL2jYzsEZur/WrMWk4JonGpn/l780K8NO2prifJn0/2h4ViZ2JdZjUcHkz9o3TGYl886tbAHmpTPP56iiuhyan4Eldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMMvi/kjM4nzdwRlnLl8RsSsC5yW/CxZx69HFUjXKVw=;
 b=OaamjIvkD7ZTPmlbKeuQqPsuotlL+3lmG1Eh7oGryhl9xlf8SwkhK9gNbPoIJljN+4qrxbIUN9SB1Mgtuu6LNfieXi6OnYcYog/6ege3uI7s0RFcrisRN3BIJjYTOuSVI2ZxWG4ls4IEgznD7hjieX+sEMOOAVVLTieiWgDkIRj+Yfga52+er8HFtUSUfCNutHKfAG9Gp53MpRkbg7Negmp+1QrVpUN4Nqqic2QU9w0E8z/8NEq+uysfSGWyYu3ITTJosjQ46SWXerSz0n3TwMw7yQS/IJA9GBeblHoW58MZ3UfrxtmIOdrodLVryH6EspmykMD699xGqxV6bIFAuA==
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
Thread-Topic: [EXT] [PATCH 2/7] virtio-net: Add flow filter capabilities read
 commands
Thread-Index: AQHZ7VuPheLPqqM+/UyGyIF8t3YmeLA0k88w
Date: Sun, 1 Oct 2023 09:42:07 +0000
Message-ID: 
 <SJ0PR18MB44779AF95836749B77949A7DC3C6A@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20230922134838.3718-1-parav@nvidia.com>
 <20230922134838.3718-3-parav@nvidia.com>
In-Reply-To: <20230922134838.3718-3-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|DM6PR18MB3571:EE_
x-ms-office365-filtering-correlation-id: a4f0cdd1-b15f-47f3-5bac-08dbc262ad9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZNCUVaqgAJO5O+wFXn81VxPk5RV3SAO0NTitMVwtFefHafWerqTvVzP+4ncrqXej9S/lHJrT+0oIDLTnwS9vky2cVO/Qh19QuAxW+X2z9D0r7GYd3BXjUTO+WVzh5IS4rQTcO+42GoqyqLD2dCZeNuDH2Gl/7/FSJVJpChEXT71+S7oGpK67Y6ixapAPTS1tqKqrqszC6aF933VTaL8nrHbb18h9rmc5pR9C6mmO/Yzyp9U+5485bDFvhfmVrw7HASxMtJNXZGIXZ6ZLeL3lKEUT0q0I1gx701n2XkR01DksZcTMxg75Bcygf/2tMpyMPdxix2NvKZN1qtvh4cNknPJa76rRGmdSTsBPMNydC7kgZw9yhx/Okze2oBmjYm+Ygjp4DTbUBWQU1Pn9qTK5Zoqv5Ho6kZO3J7t4HL7vqpW+zi0XJFyaHFvd4rGvInfrwUjfzq8ZWSEBmhkaLiX7vE76bLX7dUGuLnMN7yQs9y1Vn7ixPeYNTbcAnPoGpxSksyVBnAtZX9T9rvIlKtP12tZvrDo6KyPDfR+t0LxSxbYeswVrbug1jKCIkd0taDg3fZR8N6FJnGrWiadPX/+ZzYHpoJk//tD8XMR2C01KjQo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(366004)(346002)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2906002)(52536014)(5660300002)(8936002)(4326008)(26005)(8676002)(41300700001)(64756008)(66446008)(66946007)(76116006)(316002)(66556008)(66476007)(9686003)(54906003)(110136005)(55016003)(53546011)(19627235002)(7696005)(83380400001)(478600001)(966005)(6506007)(71200400001)(33656002)(122000001)(86362001)(38070700005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bubKQgbneleriIqiC09Sz6Q3VC2VRshG3GPi/ZydGifgosIt1vejL5LwUC+I?=
 =?us-ascii?Q?bLjZuQMlTO9/xku0BPWD9hN+cYzeLC6Vh5XooXV1uilIRz09dUFNimHqh08n?=
 =?us-ascii?Q?ImmjhxF1xVW0sfYbvSgikhUMwrI93D+rB1WPlm+ZT+Yh6ni2sjFCtAy8HJyu?=
 =?us-ascii?Q?DMnR49kTTf5qoiMhNLKNURs7Tal/Y8drjMWNaVE1StMhlF3i8jpq29D4kQ28?=
 =?us-ascii?Q?9Pz8P7pqx4QBwxJJpzW7zRdTrIkyg/+EDua4V8fH0qtR67vrkg+gJZAFa2bI?=
 =?us-ascii?Q?VeJR258h3c0kL6Q8mT7MOyw+RjGM9HelBGw3Clt5MPFRHqgrrI0exPtgHCnr?=
 =?us-ascii?Q?KkTHZrBhfQmxbiTcm6bV3mx+LY79G2LQlv+zvgGy08jkFKuo64R9kxjSoLrr?=
 =?us-ascii?Q?a1A2ndcrHQ9KADXlBROMfrqDJ5oto7Jw5dbJ2X75Bcgst5tkHDCBEhaZHADl?=
 =?us-ascii?Q?yKsmvf+/J8VFyb3IJhXuTbbURpPgk27xI0r5Zd5ac77NmzIcA4O5BGYBxW0w?=
 =?us-ascii?Q?N7HM/rmyWpy1n0d2gOmfDUQQE187wZKhfpXOuYctZF33/DvH5+RP4Rtz4fDD?=
 =?us-ascii?Q?E93G86zhu8ewRmPrG1sEH2SUatv4236CVeAeHKUxtOxU7RoL0dv4HAm6Y4/E?=
 =?us-ascii?Q?bxQnWx0mW0RoSdD02JK8shCPH/SFVRCy29apcUt0X+6giJNxttEHZsqiWvhz?=
 =?us-ascii?Q?9/ihuutn1ZkXgwVfmCglCf9tMRQh1ZzcbacdqIPOox63oKrHTsd9P25Gb70X?=
 =?us-ascii?Q?KCLcJRfHhwbq3ATR5b9QO3kiD41VP4WCPaJAInGc0lwbxUq1+3Z+uCmpGoqQ?=
 =?us-ascii?Q?CsLJK8fHaVY4GBR1Fwxwd0UylJgxpPqs7qqLcdjfGaFDo/3uAtob1zpkv/d2?=
 =?us-ascii?Q?seDlGkPidO05yCSsdALcb/caoN5PyLC/gTTUgbWNDABKEgdypiG2R/3OfVPl?=
 =?us-ascii?Q?tsCTWcYB9jQVq6jiD55evTnX+vU0ccheXFZ5u2GhHkgsekEoAZ1yNMBej1UZ?=
 =?us-ascii?Q?HK2DWigshFEIs0Hy+eqpB/x7qJ0d48QAlCDYm7MV88Y0qyxfGKdzUTpwpeno?=
 =?us-ascii?Q?pM4iPfRD5FV0RgyUTR13REA0/vVIBt+i9WxTgupxsm2/7swIQ5EHG5omKDHN?=
 =?us-ascii?Q?IahVL67MGha4+HVTpuWyvojpmPVCOtA84K0HUOI+/NORetWQhqoRMSmQ/tgx?=
 =?us-ascii?Q?efKs5aFRBvxeSqySQ2M6/kHXvtSr0jaKdEwAMIQehO5GXaKh5lWKrb645+ls?=
 =?us-ascii?Q?Q2b9WUlVdC5ITZesgVhOR9BDHJOdxtue75bKDCeeVmHvuSfUlk5nsQQK1cC1?=
 =?us-ascii?Q?2Zs/tMHuPzpoJanOSbT+WWmKWp+DHn7+7utcvC+dQi6p6X2P1KptiLDDYqmK?=
 =?us-ascii?Q?gg3ClLiqRkadxI+a0LYZF80kkY/oTvyeczfyaKe+wcQhh03xfLgtnA5qlpyg?=
 =?us-ascii?Q?tMkZDBVMhYlPo5tAX+DP6nb5w+QO3WyVQWMwpAyuO1w9MWfPifaTHuNkLks8?=
 =?us-ascii?Q?r1Cpechcd2LqxPfixZpRAOFlczOs9B2p0TiIKEK5+skU5kUsxPW+Z/BszUgo?=
 =?us-ascii?Q?pID78h5stCDt19w0UsH3r5G0/M+24p+PRahKsScK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f0cdd1-b15f-47f3-5bac-08dbc262ad9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2023 09:42:07.8265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oiLSuRPxW9LEt5xM/mn5t3Rpj2Jbre3AvMUNbItYnKnBrtSMWSC11wEHcd2KZnBLGfx67M6BqwpE+Og9IOGM5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3571
X-Proofpoint-ORIG-GUID: fzcHWbZYF9ptcDn1Vph0WovDK9cNm0oW
X-Proofpoint-GUID: bBzjV4iZk89DfmszHFCGvjNlhDdqMPX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-01_06,2023-09-28_03,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [PATCH 2/7] virtio-net: Add flow filter capabilities read
 commands

Hi Parav,

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Friday, September 22, 2023 6:49 AM
> To: virtio-comment@lists.oasis-open.org; mst@redhat.com; cohuck@redhat.co=
m
> Cc: Satananda Burla <sburla@marvell.com>; shahafs@nvidia.com; si-
> wei.liu@oracle.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> <parav@nvidia.com>; Heng Qi <hengqi@linux.alibaba.com>
> Subject: [EXT] [PATCH 2/7] virtio-net: Add flow filter capabilities read
> commands
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
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DVZgMfa4Q2vc_6OSqt-
> i7ptCKmBnBVtPWeB8zGHF4AuU0LWpisRhRLj4K4W3GE8VX&s=3DCxdwZkCbr1ldzLQMEVrv4F=
0Bc
> euW1z-y9HJ4uYkYGiQ&e=3D
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-types/net/description.tex | 194 ++++++++++++++++++++++++++++++-
>  1 file changed, 192 insertions(+), 2 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index c9a8c52..bf6d4c5 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1168,7 +1168,11 @@ \subsubsection{Flow Filter}\label{sec:Device Types
> / Network Device / Device Ope
>  The device indicates the flow filter capabilities to the driver, which
>  includes various maximum device limits, supported transports and
>  supported packet match fields. The driver enables the transport for flow
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
>  The device support transporting flow filter requests on either the
> control
>  virtqueue or on the flow filter virtqueues or on both. However, device
> @@ -1252,7 +1256,111 @@ \subsubsection{Flow Filter}\label{sec:Device Type=
s
> / Network Device / Device Ope
>        the flow filters in group_C, the flow filters of next level group_=
B
> are applied.
>  \end{itemize}
>=20
> -\label{sec:Device Types / Network Device / Device Operation / Control
> Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
> +\paragraph{Match Types and Fields}\label{sec:Device Types / Network
> Device / Device Operation / Flow Filter / Match Types and Fields}
> +
> +\begin{lstlisting}
> +struct virtio_net_ff_match_type {
> +        le32 type;
> +        le32 reserved;
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
> +0   & VIRTIO_NET_FF_ETH_HDR & Ethernet header of the packet  \\
> +\hline
How about vlan?
> +1   & VIRTIO_NET_FF_IPV4_HDR & IPv4 header of the packet \\
> +\hline
> +2   & VIRTIO_NET_FF_IPV6_HDR & IPv6 header of the packet \\
> +\hline
> +3   & VIRTIO_NET_FF_TCP_HDR & TCP header of the packet \\
> +\hline
> +4   & VIRTIO_NET_FF_UDP_HDR & UDP header of the packet \\
> +\hline
> +other   & -    & reserved  \\
> +\hline
> +\end{tabular}
> +
> +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} are following:
> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Bit & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the packet  \\
> +\hline
> +1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet \\
> +\hline
> +2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
> +\hline
> +\end{tabular}
> +
> +For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} are following:
> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Bit & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_SRC_IPV4 & Source IPV4 address in the packet \\
> +\hline
> +1   & VIRTIO_NET_FF_DST_IPV4 & Destination IPV4 address in the packet \\
> +\hline
> +other   & -    & reserved  \\
> +\hline
> +\end{tabular}
I think it would be good to indicate the how the fields_bmap can be expande=
d
in future for adding additional fields in header.=20


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

