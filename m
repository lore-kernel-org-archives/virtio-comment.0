Return-Path: <virtio-comment-return-6869-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60906C0015E
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:16:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B0298190918
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:16:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A59BA98680F
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:16:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9C0999867FC; Thu, 20 Jul 2023 02:16:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 885CA9867FD;
	Thu, 20 Jul 2023 02:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnqHV9VysQCFFwSUm0oyqZMhU708Qzg7xEtmJIMPQsty8IdQK1wDoKLTT4rq+JWFp++RKZQEJ3ShdaXd5hk6jiB96KKGFmkyvD6POS7RPGpI7U6Z1L70SThmU94INg1j7luNPKWq2g5F5yx4vb3bdqm+xuvCOKIBeRWFJ4qy7siZWfOR6WJqzUuvZpEQd0tdwBma44+v22MJ8X+zVTjIsJLluagtfSQADQYhZg0Ecp2epz6Ol5seTJAkns/BbOrIehNqxgbNtfdqWamqTJYcOB5o8TcPgBG/lHMWQwm6NUVTqH1DKucjYvwnQpGsMGP2LPaZNaSQ2V6QDaVebyffjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93N3sejKPljqfOPRqGPmeiFezYACiLrBHge5Q6fGCbo=;
 b=AdvppC1q155iwvxTxT6Ne30im4IiDNPTcahzKGgfa6WfI1jbqs+sndIef8i57sreC1+Kvlb0OrnRHep/0i7Va6zMy+uUco2LaRvmbpqa059W2pJtww/nxfHJUz9/E1igplBIs/s4zUC8+PnieZ3f7PpXXsLVwXwea2IzZQP9jaaxQSLEbGLp/I0zW4K3poPjOzLQNRf9X54fvRiZHUPb4kgc9sxtkx4Bp2nkWU3CXT5B9g3CzNdQbV3SiMqpV3rTWZmjyHX7TKa5FL+fiPUS6qZgJm/sRiD5WMSZHbHXInCXosSDzEc2bAW48U4QJUjjjoJvqhVoYd6Atp1p8IZzkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio] [PATCH REQUIREMENTS v2 1/7] net-features: Add
 requirements document for release 1.4
Thread-Index: AQHZrT8jNCjRuk4NTEuKX7i9Zc6hZa/CBD0AgAAA4FA=
Date: Thu, 20 Jul 2023 02:15:58 +0000
Message-ID:
 <PH0PR12MB54811C0E74827E5130B3AC1FDC3EA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230702234410.47546-1-parav@nvidia.com>
 <20230702234410.47546-2-parav@nvidia.com>
 <1689819034.2537746-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1689819034.2537746-2-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY5PR12MB6204:EE_
x-ms-office365-filtering-correlation-id: c92aa057-7069-4dfa-f09a-08db88c741f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Ep/blq5WQyCfMlJ7QR19/pDIdV722PjEIRZOXL3UZj6D08NYyIxWtvCWPGe9KoleECDpNERIE3P86sdxGRVgsCHb0oaaY1dGnJN3n2eww6HxLe2Ob7RQLYnEM+qbEwL2ewT1IjgmGHrLbouTQ9Bv4p8K9XvpElqCmdVCj5V+FXNE32ndU5JMj5rAI9yWrVR741NudLEO2IzEPLfAc3vUEL91O+iIURUPkBVBbFULJmHSoZw+QKzFwWYcXLlJjMnP2N3sE18DBqiz3ZXg3acPH6RMnqr5K709UI6D8Z8IhPeRS4VonkBUdDokFBZRE41tfi3xTP3vgDOMuctzV3xlsl9p3JqTzV4X+itpMwAoqbsUOjSZXTAeXh19KK5tmd2tz66zYUCaBqyzMRMyATadiTU5b7VLA6lu7La9PgxvZmnVzJBin9JYTfoJgnXv6EHAtDXYusrsXii1J8GWwPF6C++y/c4ykdDkzIMzEjolOK71x9uf838ex9Ru+5XktUcuEv2Pb/AFhvuy59OfI2u9s3GTOwwwR/6nLsh6M4/A8ryfW13RnWy4j+WgIbWDMPcezfwUAOcxAu1bM7v7M03rwxZuBDI+8b64SBtIRIIwSVibox5WkTw9os+xvaa+PN8wIaR0+I5nx6/S+69Et9jb7x8vr66RPjRw3/+57e1GEjo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(26005)(6506007)(966005)(9686003)(55016003)(66946007)(33656002)(54906003)(38100700002)(122000001)(38070700005)(76116006)(52536014)(2906002)(41300700001)(4326008)(86362001)(6916009)(316002)(66476007)(66556008)(8676002)(66446008)(64756008)(8936002)(5660300002)(7696005)(71200400001)(478600001)(83380400001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hDPJtzol4uPolr8ktQW/Yyf3/3Z00THW7M4sBIDZqy5kOorwQvdtFj3rzEGS?=
 =?us-ascii?Q?O5Xh2gTX58KYCZSuQU2NIVDZZvQ6UAf053uuHflcTozfvCuAMYa9N1DUDQYm?=
 =?us-ascii?Q?+XbOM6gBj8/wq9f4UWWJxKANpaYdyQNU0HRzUVJMsH+oYeWMAI7CI0smIZAV?=
 =?us-ascii?Q?mtqtgu/oVLZBHLwUWQJkkyObAPymhwAseBifdbgYjCPnuuYmT3riNRqTfh8C?=
 =?us-ascii?Q?SJS/zHCTisZpZAr2lVdBiE4TbeLdTng+UyvnZFK2arq2OaMpICaEw3RJAjwW?=
 =?us-ascii?Q?hRg5ZwZaMgIHzq3m0Deb7JwKUutxv8p6WsD3GnvOkvk7HQXuKvgl/5QCyRVT?=
 =?us-ascii?Q?cfa2qu8GlWi809dRWxppsGFYxeggk+bSk+gcreUnY05FO9MeNAsxijr59W5P?=
 =?us-ascii?Q?8eBebneJDLHK8Y7cp0nLwviQRJ0xFyn20Ib3vf7jNBc5ogaPYL4IzUEhwRbZ?=
 =?us-ascii?Q?h5PzZfzr0Nx1pWlbKukmy9Mz7q1vPbTiaSfU7xqDSvUNVvy858Nz+9ZpYDn8?=
 =?us-ascii?Q?rMpzNU/dL8j/OwiU3AaHdymTbMUGYDnhDpioa7KmbTUYFg26MkpthWc1dZmq?=
 =?us-ascii?Q?Eh18pR/uCUavGtRWysPwB/snIXwwrzjMJMiEUwZxrSN07krUV+K/qC8z4d3m?=
 =?us-ascii?Q?Fi/PnOvnpdQkY2E554C2x6Ur7N1DeYcvHPkPyCeRLdc+95UL6vYfj/N4Z8Em?=
 =?us-ascii?Q?JDTKF2Bi4bw3UCkVK8YjyQJbl+VtXLx7swksavzj/lilZ2bp0Vio39vtg+ch?=
 =?us-ascii?Q?6It+yB7hVbYi7D6qMUW7+vOCDhE188bShIM/+npqjJ7xnCs8lXw4etRGAIl2?=
 =?us-ascii?Q?d3snmCJKaEZCUP14aztRaHo3J4boWuq10RUu/wxaKQbLWkt5VC+M08awoWb/?=
 =?us-ascii?Q?TwvG6kGNd/0bb4JGzSsgHbj4/h7kMO0P577WSB69rm4X6tkW42/jzJNEM8Fr?=
 =?us-ascii?Q?LfLS3jnwzh5ojGTJxqT/Ncpb5ysV62AftsEFYLRXpn1tBbc0tLQ9BUhHpKie?=
 =?us-ascii?Q?rdptG8oAdgj438OBlcCdc9plAaR8pHVnw3XKbdY9Mz24QbQQTb1XsOjSxo5Z?=
 =?us-ascii?Q?1VWNW+JB/fDNow4ZvRr6LYhnjhE+BueSzcA0RMk0hUnwr897Nbdj8zRrOMdG?=
 =?us-ascii?Q?8qKmk1rKFJlJloagsb7mCkH+5sbMjmaTa+TlaCzhRwu6sadYLLFjf+mbyXb/?=
 =?us-ascii?Q?l2wY3h6A4wuygcox3MmUkPfqzNZUg718iZD7zVUjcguxj5CaVltYsEeIa3V5?=
 =?us-ascii?Q?9f5dzoTRRCkBV9nwlV9DTZMefpuE07A5HsgvG9r6ZwtnFVBK+g3jXpN8UBHk?=
 =?us-ascii?Q?E9Sqw1KtQde3LjCHKe3ATSHgtbmC4+j++7aSI1gemVOZFzcGeC+qe0UoOn3i?=
 =?us-ascii?Q?uxVrLwYnSxHYTTCGFV2nEj4KIe5okTg+y/cePp+yWV+XzyaSxmKej2qUCv4G?=
 =?us-ascii?Q?m3B3i9j/PdENTypGOKnjsvkk33sqf3jipfk5H6+N1o7r+TwBn9CjSws65U8l?=
 =?us-ascii?Q?DL38yrCSICUJfHmKginSPgbYeQTMK3M57yofnpZIj3U4kQ+adRG03OKIZWfl?=
 =?us-ascii?Q?q2zl1Aw/L1LsetwMvNc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c92aa057-7069-4dfa-f09a-08db88c741f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 02:15:58.8815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MxeRYJR/0Kq3IEnWg3WWaz9NbB21YcHKYe8ZCqSSmeMfo05bYd0g+zrD39+niZHnEH7OlSzi/5Wiy53m0MvNvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6204
Subject: [virtio-comment] RE: [virtio] [PATCH REQUIREMENTS v2 1/7] net-features: Add
 requirements document for release 1.4



> From: virtio@lists.oasis-open.org <virtio@lists.oasis-open.org> On Behalf=
 Of
> Xuan Zhuo
> Sent: Wednesday, July 19, 2023 10:11 PM
>=20
> On Mon, 3 Jul 2023 02:44:04 +0300, Parav Pandit <parav@nvidia.com> wrote:
> > Add requirements document template for the virtio net features.
> >
> > Add virtio net device counters visible to driver.
> >
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> > changelog:
> > v0->v1:
> > - removed tx dropped counter
> > - updated requirements to mention about virtqueue interface for counter=
s
> >   query
> > ---
> >  net-workstream/features-1.4.md | 35
> > ++++++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 net-workstream/features-1.4.md
> >
> > diff --git a/net-workstream/features-1.4.md
> > b/net-workstream/features-1.4.md new file mode 100644 index
> > 0000000..4c3797b
> > --- /dev/null
> > +++ b/net-workstream/features-1.4.md
> > @@ -0,0 +1,35 @@
> > +# 1. Introduction
> > +
> > +This document describes the overall requirements for virtio net
> > +device improvements for upcoming release 1.4. Some of these
> > +requirements are interrelated and influence the interface design,
> > +hence reviewing them together is desired while updating the virtio net
> interface.
> > +
> > +# 2. Summary
> > +1. Device counters visible to the driver
> > +
> > +# 3. Requirements
> > +## 3.1 Device counters
> > +1. The driver should be able to query the device and/or per vq counter=
s for
> > +   debugging purpose using a virtqueue directly from driver to device =
for
> > +   example using a control vq.
> > +2. The driver should be able to query which counters are supported usi=
ng a
> > +   virtqueue command, for example using an existing control vq.
> > +3. If this device is migrated between two hosts, the driver should be =
able
> > +   get the counter values in the destination host from where it was le=
ft
> > +   off in the source host.
> > +4. If a virtio device is group member device, a group owner should be =
able
> > +   to query all the counter attributes using the administration comman=
d
> which
> > +   a virtio member device will expose via a virtqueue to the driver.
> > +
> > +### 3.1.1 Per receive queue counters
> > +1. le64 rx_oversize_pkt_errors: Packet dropped due to receive packet b=
eing
> > +    oversize than the buffer size
> > +2. le64 rx_no_buffer_pkt_errors: Packet dropped due to unavailability =
of the
> > +    buffer in the receive queue
> > +3. le64 rx_gro_pkts: Packets treated as receive GSO sequence by the
> > +device 4. le64 rx_pkts: Total packets received by the device
> > +
> > +### 3.1.2 Per transmit queue counters 1. le64 tx_gso_pkts: Packets
> > +send as transmit GSO sequence 2. le64 tx_pkts: Total packets send by
> > +the device
>=20
>=20
> Hi
>=20
> About the device counter, I will continue to push this patch, can you rev=
iew it.
>=20
> http://lore.kernel.org/all/20220315032402.6088-1-
> xuanzhuo@linux.alibaba.com
Yes. I had trouble working this week.
But want to review later in the week.

A quick glance at patch,
we need a bitmap to indicate which counters are supported by device or not.
Seeing zero from driver for unsupported is misleading to user.
So we want to avoid showing those counters in ethtool which are not support=
ed by the device.

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

