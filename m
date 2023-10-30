Return-Path: <virtio-comment-return-8022-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02CCC4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 03:33:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DD93D2B021
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 03:33:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B2701986B1B
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 03:33:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9646E986A42; Mon, 30 Oct 2023 03:33:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 84EA7986A7E
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 03:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhoyNKIe/ZEyEi4srqvqwX0z8+XgMO6d9Fr6t74BzByxP8Dj6lSd4+FHoFCd5WSDWZA5lpC1MhrQ4LQEqr55j7l1wDULvYhoL3XMqSTbVn5OyGM1BecZtuiiEOOn56BNAjiFdABJL07Dz8zLvArvYoLMJ0VR0fQmN2JiaQyOVErkZdpXhVQCZ10fUqkHbXWn2YnC5E6hR3bjqgSlTAdt6/jdF9sbbLy4iaLzLfJNhoYrrCxvNv3X6k513Asaj7mfXurssdizSnPHrmgOsJrsrSh8uMnWGiJGyKnmWo22TSM1GsicfnM3exGyIciNRQ12hkThdqeAfLaooC+Ix94k+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bCqdqYuGp3kt/8Y+7v1GJvVv+GOlIYnhChxwWMeh0I=;
 b=gwRHkrIJh2tJSmpc6TPq2hiShnE6OjWGRmImDN8f3MZRz7Z1Qrpnl491PVstTQNr1+/DTJhW8ucAa2SHAnQKLgmueEtkVnMbnVt5YETCE4HD53Tp0cRacfeI3F71xTAco5uLYWhhJO/4GEmYoyWlB4pXCw9NltFhN80D4cMOXrr0u0K0bb32/EtnqLn7CLvNwKRFhX8ssV7vTfoTMDVkl6yyl7g/40gwRnje4InBIiPUNIUwYQ3B6IqZ2LrpOFwhFTt/W4BIvtX71COUWd7dL5sAJwCnxFffit5bKQ1p8Ui++3lilbbp3ZiqaplGBdSZJXBqMJD+zTnZr+ibifnACQ==
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
Thread-Topic: [EXT] [PATCH v3 2/6] virtio-net: Add flow filter capabilities
 read commands
Thread-Index: AQHaCNjZfH75y3G50UalU4tMggld7LBhkT2AgAAfffA=
Date: Mon, 30 Oct 2023 03:33:12 +0000
Message-ID:
 <PH0PR12MB54816AB3EAB426A5AC8FC0BCDCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231027132324.1349963-1-parav@nvidia.com>
 <20231027132324.1349963-3-parav@nvidia.com>
 <SJ0PR18MB447748C4B448023563A7F6DBC3A1A@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB447748C4B448023563A7F6DBC3A1A@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB8709:EE_
x-ms-office365-filtering-correlation-id: 57e2858a-80f5-4485-b5b4-08dbd8f8f237
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 acRD4CU7eFwwwQ31pW2mGOhqjFxg5Ne8a7qmysr2pnLR7AVxkE+j6cxY7uWUyJuoCuXRmHmnyOu0KMkQvC1I7pLLK80QToNZ7Iy9t9BvUIoouMweeYJXc6mpuDLHNnJQc0VIkWtThwEEmnnCr4cKikpszE5fn/BjLmwax2g83uEtlXxys1ABu6B0+mxu8mp4jjm8acBpAyPJSNxm1D6841Tcecfxpkj8Wg2re3/xUHhhDtid23e3gcu2ML2uAvO62Of4YEc9CIz3ihGTGrvhjmBi3d1bJ8ttmkfPuxJ3z+q0dWdqbHknnH9iHyRLnmhuNxzCqXPvC4o2qTSkro+00iT1EQjsiOX0qdnQZUa+xBD9caCHHYRdAfmVXT0S+OQgSgU2Opq1bKJaLBUbIKaPyZokT7yrp6EQjIuS0uhPmgcymu/ikl7mOvjuo3St+U0a54hAs3LZLenga5iEs3LO0UW+xyWTHmnVN/lZvasRC7O0rMVIE09Y55fQ6C8LtaADmGuhI1tPu9xu0CIVF4T/72YzqZBwnriIbhMrx1lKCDlydrzYP0/wDAP4q9jmrAWcqp7iIOE96y6NUctxdzzdSMwAnrRODG1D7kNAJCkVPljUnVMAvdVnUWj6AWal19ta7FwTEW1j8n+X2pMKc/5aUZom/EFuAWX6si9++XATRtWj/nhRODzIAj7r8CyOuqiK1n7kqZkSSemJVY0BJTl0dQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(396003)(376002)(366004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(1800799009)(451199024)(55016003)(9686003)(55236004)(26005)(53546011)(6506007)(478600001)(7696005)(71200400001)(83380400001)(2906002)(5660300002)(41300700001)(110136005)(966005)(66946007)(76116006)(66556008)(19627235002)(66446008)(8936002)(66476007)(52536014)(4326008)(8676002)(54906003)(64756008)(316002)(38070700009)(38100700002)(122000001)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?m5kKeSTfjbNY6nQqKnFbY2P4bU8ZA+ocH5qDcRF97xh5igEnMZ2CtezyJGeQ?=
 =?us-ascii?Q?lWhAbhNpHqC221QMA+WwUWjUDrULKu+jni8D/xVE/oFqaZtiCz+cnFYOVcU5?=
 =?us-ascii?Q?CkbzsOwK2KOaATjeKtT2RNAm1VgB9EJ5KbXS1ZN7Q7vYEqGDffHUi/4q8qsY?=
 =?us-ascii?Q?u6CAGjnh3qUhLg2lu55QT7x1jVP+Czun/DJ8WlFzgyRJV2Dtgh62cnWNozQN?=
 =?us-ascii?Q?o+WM8uynAVUgzr8y6mOQUESpuEiwSCR6aSfa72duj+SEP1s6wpsXf8DKKf/Y?=
 =?us-ascii?Q?ZZS/F7bFFTrVeRXvt6pLOEBYi28YgMAV13KgIst3rpoyAPvUpGU2hmBS2Efa?=
 =?us-ascii?Q?O5V82x85qvf2zxRtFc3mDQuOEusvz37GqtDFHOzsF2W+l8jj5VHwSN8Cnn9N?=
 =?us-ascii?Q?7vsm5ooNqFAhSPZ/Tx/0eGEvciL6ev6QbS3XLG6CDYG8ppz8wR7x+mTQxKae?=
 =?us-ascii?Q?a/aMJDX6NhDYrhHouChfPR5el7tzqwy+TNk6wyIezO4eQqCgXmBf32W5tPdA?=
 =?us-ascii?Q?hlUg1tdLTRVABxspz32iBvTZyhyqy9QQNjgviQCol7FeRuYFZOadeSLU5KVf?=
 =?us-ascii?Q?UUjtJ5MQfi3hzHqF+bMgqyfRYW8+ol3rF4bzjkxgqDqvRv8kP10q96fu432R?=
 =?us-ascii?Q?aM3xXcsrSlZl42UyunUju4No6Y0SI0HAmxbFIF7orjNuGt8/cF4ecjrBIhpv?=
 =?us-ascii?Q?keixo6D1oKONVkREpusagy4ewKLWJpveJ1ONSbYEVup+Pb/p7gmSqpPCoNg0?=
 =?us-ascii?Q?fQ3SVMybLWMQ+XFScEHRd3u1KaFD3Mxp6Oc69GdY3yLa1z82xkPx85pUzX0Y?=
 =?us-ascii?Q?BcTM9jr07vPuJcEVNM69Qiz8W8+knBU1Aqy5AFdLRcoC+Jg95BT/eLRHFn7y?=
 =?us-ascii?Q?dhld/PiRePmWkpZJJTWyOgS6WOdYZtIj1G75fTFxHaL5Oxy/XLshe5DiOvOZ?=
 =?us-ascii?Q?0oue/9wJe2d3ZwNuRVwC/AJKKnx0ado2axYIeGoHALv7KL4kvtgn3QD70+p3?=
 =?us-ascii?Q?o+nykTDyMCdC2JXsoz2ju1ExkAeoldTBKeNc8aQ9D8nH4BV62egL+2SQrF2a?=
 =?us-ascii?Q?2+mQxFVespnSxwVcinvXuYV/oscG/GmRS9WP+joUu7pwS2YzCQw8J+Jn0JgV?=
 =?us-ascii?Q?cDN45GdJ4PNHnpE4JDr5Kvm59cWLRrW40rrteBEG9f8nMHLJ3s9gUwvg+pa6?=
 =?us-ascii?Q?kgj1Kfujxw70Dj0sRNFFwRvCeB8NCdCrCpXMh5ondilziZeirjTL4qSbzGF1?=
 =?us-ascii?Q?KmxAyPS5qsuMo1yXyQjpbQc52pOJf+pbDOEj6o9i1NyhxmFD8JkplhHTID4t?=
 =?us-ascii?Q?atoM5wD8JpJTK7+MgVRGTaj1jsMrRZbPoFfP77xj/DxnycFU4Rplh0FzVkDI?=
 =?us-ascii?Q?e8MVaYJ6M3Zer5Sl7Wt9vFJpsfIheIPr68GUOUitkE2BNT2OmxhaSMKxS8Jq?=
 =?us-ascii?Q?lkNMVoDOvlgOdGOYyTg5E9nXMf+n6uI5/pB2kSjg9WUAkdgwgYqt9B3V19Ui?=
 =?us-ascii?Q?Zlb1bO0B+08CpSBBUYwt7ajeyvA/wemBVk/PltIH4eStZ0CL93X2hi6c9O2t?=
 =?us-ascii?Q?XMYNhbV8KJ30obMc33Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e2858a-80f5-4485-b5b4-08dbd8f8f237
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2023 03:33:13.0038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L5R81wG6KjfigufwZxVDU8FWsflRrMrJF4mbmEmP2SMjoJsA5eBa+ZUZgPwEyBJMJfEtxgH/hQqXPEhwAzY7qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8709
Subject: [virtio-comment] RE: [EXT] [PATCH v3 2/6] virtio-net: Add flow filter capabilities
 read commands


> From: Satananda Burla <sburla@marvell.com>
> Sent: Monday, October 30, 2023 7:06 AM
>=20
> Hi Parav
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Friday, October 27, 2023 6:23 AM
> > To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> > cohuck@redhat.com
> > Cc: Satananda Burla <sburla@marvell.com>; shahafs@nvidia.com; si-
> > wei.liu@oracle.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> > <parav@nvidia.com>; Heng Qi <hengqi@linux.alibaba.com>
> > Subject: [EXT] [PATCH v3 2/6] virtio-net: Add flow filter capabilities
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
> >
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DGknvLw2Qpf9nPonjhWw3_Lc5eykfV
> dDRg1fga_
> > EJ
> > CtMR5FPF3CjtDKJYjCUT1tvU&s=3DXW811-B24-
> > DCa7KJgZdBUlXx9LYmZMzfByaCAlChmi8&e=3D
> > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> >
> > ---
> > changelog:
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
> >  device-types/net/description.tex | 220
> > ++++++++++++++++++++++++++++++-
> >  1 file changed, 218 insertions(+), 2 deletions(-)
> >
> > diff --git a/device-types/net/description.tex b/device-
> > types/net/description.tex index fc56af6..2aba5d0 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -1173,7 +1173,11 @@ \subsubsection{Flow Filter}\label{sec:Device
> > Types / Network Device / Device Ope  The device indicates the flow
> > filter capabilities to the driver. These  capabilities include various
> > maximum device limits, supported transports and  supported packet
> > match fields. The driver enables the transport for flow -filter
> > requests using a control virtqueue command.
> > +filter requests using a control virtqueue command. These control
> > virtqueue
> > +commands are:
> > +\ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Flow Filter / Flow Filter Capabilities Get}
> > +and
> > +\ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
> >
> >  The device supports transporting flow filter requests on either the
> > control  virtqueue or on the flow filter virtqueues or on both.
> > However, device @@ -1181,6 +1185,8 @@ \subsubsection{Flow
> > Filter}\label{sec:Device Types / Network Device / Device Ope  at a
> > time, i.e. either control virtqueue or flow filter virtqueues.
> >  Once the driver sets the flow filter request transport in the device,
> > the driver can send flow filter request using the enabled transport.
> > +The driver enables the transport for flow filter requests using a
> > control
> > +virtqueue command.
> >
> >  The flow filters are grouped using a flow filter group. Each flow
> > filter  group has a priority. The device first applies the flow
> > filters of the highest @@ -1247,7 +1253,136 @@ \subsubsection{Flow
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
> This leaves 256 types for L2 and VLAN, do we really need so many L2 types=
 ?
In practice, mostly not so many. But kept the space in case.
Currently around 200+ ether types are defined at [1].
[1] https://www.iana.org/assignments/ieee-802-numbers/ieee-802-numbers.xhtm=
l

> > +\hline
> > +0x300   & VIRTIO_NET_FF_IPV6_HDR & IPv6 header of the packet \\
> > +\hline
> Can we leave a few bits (4) for L3 headers and start L4 after?

IPv4 is at 0x200
IPV6 is at 0x300
L4 is at 0x400.

So there is space reserved for 256 for each L3 type.

Do you mean to leave less bits than worth of 256?

> Specifically for IPV6 we may need extension header bits matching in futur=
e. (SPI
> in ESP extension header for instance).
Yes, above reserved space can fit IPv6 extension starting 0x301 to 0x3ff.

> > +0x400   & VIRTIO_NET_FF_TCP_HDR & TCP header of the packet \\
> > +\hline
> > +0x500   & VIRTIO_NET_FF_UDP_HDR & UDP header of the packet \\
>=20
> Regards
> Satananda

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

