Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2085.outbound.protection.outlook.com [40.107.101.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16B11D0DF7
	for <virtio-comment@lists.linux.dev>; Wed,  6 Nov 2024 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883618; cv=fail; b=aUuSBgJkzAcDON1l6w0mSmHB/2rdk4uFjRLHNDohOThbR47apsDRvi/j78u1P3r6ESbmVrEm9f+6nh1+GschQTyHAArPQESO/w25o4rlD9p4t28AnObsGX8uviEXj9xuk1+1wcLJNgUfLKSwQCt0hhPLil8lg4SXsclGkAO+NUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883618; c=relaxed/simple;
	bh=tGboKoTeywtNroW7J+cwn6OFgkdYgdVh+k5Bl87qt1E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S/nBsKzURymaahWDvyZ79bFq/MhQKJJndLaPOAD4EVogTmneB2ES4dBDX9JF+WojBPJcI3F2oyghWP7oH6j832tmNVLmLy9ciqaIwIQc0PVzKjA8R1GDC/Se1tTTmsCQHCDaADNvhjGxs9hm5+MMqfGgsQlgNWzy4n8cj5AXVFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kmeixM2Y; arc=fail smtp.client-ip=40.107.101.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kmeixM2Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wx0WrjzJYWyML4TJAPhIdVJc+F4K/VARUR4hz/KfoNkVE2L00M+0fBH2oHViHsgVXwqJA3o9qCamu2h6yWGXI94AMdQutvCm8uJhlaO6J9ZtGSVRZnHpfrzgmR0C/f9JK4kE50p40bAszHAjY9H/A4H8HapqiFs/i3WG4GSoHUSM9Y4f+8JkN6QFsfwE/yT1VQm8ycEpQdGj8OTxkADYCvbo2VM+GzD4nNo9PbgR4xcaIUkejb0XOS9nREdH5qXImRKpQNvVlawCCHovRL5xM3IE4tfq5r8R4pxLXvkykMAliQMeTMYrpuRYTYWSibC6qB8UF4SkZgcN4vQRlAZNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SD/j18bDlrNpHNAV80kEYZtXn8BR7ruq8sitPKkVd2Q=;
 b=kWkE2c7yyRHYM7fyPTdXPnILFvqLz4f20mYoJlrWaNpFT4jQAvZS0Y3/AFpuLmbt131o0EhKy2dKfF+vaq4pCRM/TyYwr5h0kPGok0GTKHDlBMz8eBzaGU0IHkMJ3EBSeLBha+EUxEvrtVzx+YhXrX4UMZoKBZvun3XN8FkwwxtkQObsumxRcI5HSZqE65lNfYcr+dtHmrNUFIbl6HFHXpOJ9brwBAJdzvwcp4W3xBzoZuLHw2wsZTYuv5z5816tjPowKAYuwyxQdL1JT+d7dyiaLNfWWS1vO0tVr6hQGdYDMOtA4v0tXhpcQHYYT2xujQxdo3+na2UtOEfYFClVrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SD/j18bDlrNpHNAV80kEYZtXn8BR7ruq8sitPKkVd2Q=;
 b=kmeixM2YZhVQWvfKGRdPUOE4lRu6m06R4ev65mLTNxVM0uBwtNW/4WzKhvueWNAGcjbwEkAD42eGMav9faz8gU9T0aIHzIq2+vklvZCHw8FzT9kzN350eqkBCxBXwso972ex5Td+VoGHpPATJx1ZdAlJhqygL/QggLDVjFG0pVDCRENjsnQltswyIs6YhQf1FX9p2bN88VnKu2jYTtLNHg6NDgOMEhvDpL0MSQnyUQ3X/LU3YhLAUlw0gYJLqglPsrqlXzulQPT9dqmKpcIvYxIDFCMP+UpD5EH0oxrw9XdwJn9OYijBn3MEWcqrjnz/NmOu3w25jkqhPcHBrdSRKQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 09:00:11 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 09:00:11 +0000
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Steffen Trumtrar
	<s.trumtrar@pengutronix.de>
CC: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH RESEND 2/4] virtio-net: support receive ptp timestamps
Thread-Topic: [PATCH RESEND 2/4] virtio-net: support receive ptp timestamps
Thread-Index: AQHaxicKKiZNC2sXoUSr8cQ5sBa8PrKqxfeAgAAB+ZA=
Date: Wed, 6 Nov 2024 09:00:11 +0000
Message-ID:
 <CY8PR12MB719537A58251DE1CD8F5E7A8DC532@CY8PR12MB7195.namprd12.prod.outlook.com>
References:
 <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
 <20240624-v1-4-topic-virtio-net-timestamping-v1-2-fa3c163e4aa9@pengutronix.de>
 <1730883117.586029-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1730883117.586029-2-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM4PR12MB5844:EE_
x-ms-office365-filtering-correlation-id: 2dd9d2cf-82e1-4c4d-d596-08dcfe416bef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3LhaUrzj4CIqyhy5AI65mp0NIjVB7ConziUMcLKe1FXmBptP+n1uHJVCneBF?=
 =?us-ascii?Q?khk62B4j0R0+3ZIMEEBTBk7tmlFO9C7rBZsnE+kNiYu4EL8chHbU0F2ZnXoD?=
 =?us-ascii?Q?bvH2eqrjG01vRfzdMER2HLfXMlPNDhRBua4nWjKzXO+wLH7RdZAv56LiMhmt?=
 =?us-ascii?Q?AqbTb4ym6ScBhNe6FS9fZPI8k9ViiM2cntsF3djZn9u4zg+IKOkucXDjMKxC?=
 =?us-ascii?Q?ifu+Jsh+mwdnjDLVFjM3OmaRmJH6Uu3TxFXRy3R2H52LWLi4i7vzv2bhiOse?=
 =?us-ascii?Q?4CULyUYBI1juUyGDk+TLEey6a5XLSwABsxIeP/r1JFUr+E8sx7IRSJ5MXU59?=
 =?us-ascii?Q?/DSlTvOiYU1InkjIN6wjYpewLXDnMR3gTQSyYUar6CKe7jWIRndKdtMslnWR?=
 =?us-ascii?Q?GFZiENUYf0wK827zW2G/8NfWI4gVx09fMY2cGCVrVXtYUWqA2diCfVK1qLal?=
 =?us-ascii?Q?1rFYwmV4MaFIcP7/Bluxgy06p8hs0Qx85HCJhPHIDx4/gQRDd398YYUKcA9Q?=
 =?us-ascii?Q?fh3E4nln2i6NummUQx6FQ3T7jTzsselGburXay31AfVqZ1+Vl39co5CERM7S?=
 =?us-ascii?Q?U1jfSNBO/fwHotnld/OU7BQ53DzfgZGNJ2oBqVtPvKnXz4HU9FTXM22KtXku?=
 =?us-ascii?Q?KUYJ1+/c4ySC480tJdK7qgtn8Q6LA/wAJFgAABrKic2PcQcdrU0xPH3Efg9I?=
 =?us-ascii?Q?oY862kCiF0NVioWAFlZ4L0rZM2GKH9CcVU0ZfablKsTAUS6i2qgnS8hF4CT4?=
 =?us-ascii?Q?A2PTuZcCVIA8XovUyAQWMnF4zgklfRg8cfoCb8y2rFg2htIuv8RsYeMU2dEB?=
 =?us-ascii?Q?fpAAesF6CR2TBvhJBQJiZV6qMErRbGJydU4wp2UTcKBWr/c+k/VaNJtZn0NT?=
 =?us-ascii?Q?3QxErrcJrFDZ2aY/ZJYdEX1DhSeBSRxwZv5Nm//X0PHSnPzqe+swRqX/7bto?=
 =?us-ascii?Q?CDHjjd8GdnWuMbQJkCreS8KBTeVitPAq4nr3jmiO1OP9HPVOH8W6qqqPH30Z?=
 =?us-ascii?Q?iqnVelifcxJ2CsO1GDXRoYz0Pp4549CuzKMV9VjTqrZt6+spYturO54q0Sow?=
 =?us-ascii?Q?m1sjQcjdww2gb45UKSEBtOz7g/8AUIGZEtxyj3/uyO9eXPxl97D7HVZaSBh3?=
 =?us-ascii?Q?CtE0n0b3XH6p3xeP2OtMCegQCkq86/0iy1qD1ds4PWrYhwX89O+G1vrqZOt1?=
 =?us-ascii?Q?OOu1pxRj9gcEjUASK4QR9HF51sVupKF+4qGDh91uUBfsh/tH7ZqFTffq+/bS?=
 =?us-ascii?Q?d+vjmL32DYHvu5FvrdGpCpUMLTctlWReEOrH9qAhFak/EULAeL7ut4EjTQqj?=
 =?us-ascii?Q?C7G/NCUkNLR4pMxBi3zFx5eVZ+AMdi5nGm3xJPze9uWDR/jDe+1I60qmKBd+?=
 =?us-ascii?Q?8CwCJ1k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?47Wh8MfLQu3/6LfizSrGH5yo/Y/celY5dZQ9uEm7/o5W8pmZLg+gXWTmb+N/?=
 =?us-ascii?Q?pYV9UoNelkeCzDKYxHnNB86uTcBdBlixCSSHxYYgL4C/W0D5ahsBUNUyrX7X?=
 =?us-ascii?Q?qzQNTKpwI3LHwL5+yCSVawDdiXnnFjqt5N4IonlVLfZ8XFEm1XVZQ3NszIbe?=
 =?us-ascii?Q?Xb4RzLRm3Ska6cL2tTYehiGgLzUABwms8M2NhJ74vnyMpp8fu8TU3L5hTP2K?=
 =?us-ascii?Q?VUV7hx7jxuWjx3+86znUSaPWx6UHrDtpdP+yW1kQf0WB8Lw4UbGSSw9bTAZY?=
 =?us-ascii?Q?md6LDQDz6irRDFZh1Q/l+H7kEhc86R8MNK1YVm1HLV38zZtTf7oKL7PWStgo?=
 =?us-ascii?Q?TdPqI+7NM+R3Vv0KBgTd/hop1xu0X+wHtdI17AtvqlrlEj4LY5eeJgz4b8Py?=
 =?us-ascii?Q?u/5HN7mRFTYN0PE0gQIp+9F4KcGjIgY/w98os6uFsnwgp2P1TCMIEcdZEmTw?=
 =?us-ascii?Q?ueJ7TJXHnXCLR+0KiBCLrnA3d3ibs0YR6RqSWzxn4TfPSRzo8Bo/+AEg8p9V?=
 =?us-ascii?Q?bxGr5nQ933rmAn3VmkHol3hx5N8xcijmsnx5IHrw9LbkGuAUIj6xdlyut8+u?=
 =?us-ascii?Q?Xb/FYB1qexAp2euuontFnFXHIX8QKS4mZMnpq1M9v9RYrf5/gYHnEwaThT37?=
 =?us-ascii?Q?OiB081+iZCSsAQPi3eH63k/+CdjDd23Zl4YYtIHzf5boxNeT76UtEc5r32me?=
 =?us-ascii?Q?Xsr5IJ4hPaOYhk19p5vAgFoQQf7LFEZBro4bQ4K3k1ypnSCeNxNbcYbxtwwg?=
 =?us-ascii?Q?po/bRdIT0+4tszHrdtLWjlEXGvsqPKuwQuWGqxYuCJ/OmqFjX4UYWvRDDrUI?=
 =?us-ascii?Q?xC+DQ4y9hKH9wZpyf83Ss2EjIneSe99urUB5OP9w2uI8hC03Ed64SOjpMNCv?=
 =?us-ascii?Q?oc7KdXtpHcsDCeUCHcWE8n83Im0Gf73RPGWprnfxP9vzvF6KhHwrRhWzSGY5?=
 =?us-ascii?Q?AdCv9SfXzT6fnD+u2X3PAWSEWTo49uXi2Ny6cg/0wzimwIT3hXx/Rp/CS3mV?=
 =?us-ascii?Q?HtmaPwZlysNcOGFFGCXHW+gdTiEVa32BEmZefbeFiUtDtcz3tZEqKts5hJtp?=
 =?us-ascii?Q?LBogdnELUdzMpULjCe2jJ9RTkaDGWjYueWAVny/WLCdvk0JHgiMQmT8ZHmaa?=
 =?us-ascii?Q?GuaX28IutP3uUr6CFgRUxWF1690eTDNvy18FA7AEo5nBT1v8rVeGoqiGyoLf?=
 =?us-ascii?Q?Umj5HukHGuWVr62qsxDzw5xCWf/rRx4kpP7P0KJaIYdGpPmlEPZQUQj4Iw3u?=
 =?us-ascii?Q?R7wmw1hHyU5ARiN/lJEQhhoD75+dAEEfFnUS9k9/tS+wH9UM5L5kmWuwQYLV?=
 =?us-ascii?Q?wooH5HkTsA0J3j0cZ3z/cvXfALd42lSFleJbwLl77I1MaCKO95tRuwtIeenq?=
 =?us-ascii?Q?T8K7e11/dboI/beTjQf+zKURzno2pfYN0PysmcA9wptnkSfw8cls+xhAJgp0?=
 =?us-ascii?Q?1Ew1d56jasgGuFXvcDHK//2v94Rgq8tUmHC8pmtTro5XVkSJQLTV4QSo6/dD?=
 =?us-ascii?Q?SZOlx9Pqmr0DjQUnM4wPUQqfRplzPGDA/5xFBAY25XmA12M1+1WpfZ0wJ40z?=
 =?us-ascii?Q?kNTfvOvp95KjHAGSuho=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd9d2cf-82e1-4c4d-d596-08dcfe416bef
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 09:00:11.6613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cvL1q/yFhxpWnn+KFqfnhYS9yHsvek6S5V8sjjrvo//RKBpI0D3HPsgGIiEimkS/D5OCYVFXIRvz4ITE3PP13w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844



> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Wednesday, November 6, 2024 2:22 PM
>=20
> On Mon, 24 Jun 2024 13:09:05 +0200, Steffen Trumtrar
> <s.trumtrar@pengutronix.de> wrote:
> > Accurate RTT measurement requires timestamps close to the wire.
> > Introduce virtio feature VIRTIO_NET_F_RX_TSTAMP. If negotiated, the
> > virtio-net header is expanded with room for a timestamp.
> >
> > A device may pass receive timestamps for all or some packets. Flag
> > VIRTIO_NET_HDR_F_TSTAMP signals whether a timestamp is recorded.
> >
> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > ---
> >  device-types/net/description.tex | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/device-types/net/description.tex
> > b/device-types/net/description.tex
> > index eb2c08e..09d9c28 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types /
> > Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> Set MAC address through control
> >      channel.
> >
> > +\item[VIRTIO_NET_F_RX_TSTAMP(48)] Device sends TAI receive time
> > +
> >  \item[VIRTIO_NET_F_TX_HASH(49)] Driver sends hash report
> >
> >  \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level
> > statistics @@ -415,6 +417,7 @@ \subsection{Device
> Operation}\label{sec:Device Types / Network Device / Device O
> >  #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
> >  #define VIRTIO_NET_HDR_F_DATA_VALID    2
> >  #define VIRTIO_NET_HDR_F_RSC_INFO      4
> > +#define VIRTIO_NET_HDR_F_TSTAMP        8
> >          u8 flags;
> >  #define VIRTIO_NET_HDR_GSO_NONE        0
> >  #define VIRTIO_NET_HDR_GSO_TCPV4       1
> > @@ -659,6 +662,7 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De
> >        __le16 flow_state;
> >      } hash;
> >      __u32 reserved;
> > +    __le64 tstamp;
> >    };
> >  \end{lstlisting}
> >
> > @@ -1177,6 +1181,13 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network
> >  #define VIRTIO_NET_HASH_REPORT_UDPv6_EX        9
> >  \end{lstlisting}
> >
> > +\paragraph{Timestamping for incoming packets} \label{sec:Device Types
> > +/ Network Device / Device Operation / Processing of Incoming Packets
> > +/ Timestamping for incoming packets}
> > +
> > +If the feature VIRTIO_NET_F_RX_TSTAMP is negotiated, the \field{hdr_le=
n}
> is set to the size of the virtio_net_hdr_hash_ts struct.
> > +The device may pass receive timestamps for incoming packets via
> > +\field{tstamp} and signals this with the VIRTIO_NET_HDR_F_TSTAMP flag.
> > +
> >  \subsubsection{Control Virtqueue}\label{sec:Device Types / Network
> > Device / Device Operation / Control Virtqueue}
> >
> >  The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
>=20
>=20
> This has not been updated for quite some time, but for us, the RX HW
> timestamp feature has always been crucial. The TX HW timestamp feature,
> however, has not progressed due to reasons we all know about.
>=20
> Could we make a compromise in this area? First, let's complete the RX HW
> timestamp feature. For us, the RX HW timestamp is much more important
> than the TX HW timestamp.
>=20
> @Jason @Michael @Parav
>=20
> Thanks.
>=20
Having rx timestamp in vnet header can be a good enough.
