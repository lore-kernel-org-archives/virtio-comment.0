Return-Path: <virtio-comment-return-6177-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B9BC7EE2F
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:35:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 59B71F936A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:35:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 44AD3986589
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:35:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 351A498657E; Tue,  6 Jun 2023 22:35:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 22386986583;
	Tue,  6 Jun 2023 22:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+EYOqPPRiCHbTLxsctNHxDs0RLsXy+HVUDbFh9fz0hR77IJkCVXQZ7Z65Brkvz4dC1LCIlE9F5W+kNMmY5lU+RCWGifCofYeq7aNBxxxEQXv2wUKejgKAQgl97rSKyUvnmPsv/cejN65OzKF1kbLv50HaaftcGqrlrzN895XA+6JtnW9ecFYf3ZCSJUF5kJyU+DhiqPJx2btQnPvUv140DNQXw+Vq6+mn67O0bIbe6U0RGrb059SMgIcpSm6c752mh5KcajaLC9kvBGJ85kma3fRAWGNOsO4zQPPAgykiLWAfU/s0D6Or4CplGUcrm5+0JqpWVz4mk1J3xpQX6wKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkjNDqavglZQWfqHMLn9bQZXPiLeZIYCCqF3PkwGU4I=;
 b=UvjoAQ2J/vCxhJvLskh0otWXRo9Zb+z5SqMXHqtFilcIK8cqv7a9jGJjG3hq/gOnAtkstHngtGHRD/f47VLcHwm6QnZ3Cafn/T4Drc/gOjzTHzsaT88l+hcYkVDosNM608VkzYWwweAsTG7F4wiFF0tTakKHHDbCR1oidWxTENRTtgRaJjlHb1Y+hvc6g8hiQmBGOWY9T+YSYbqSPFY4QkbZugaGRVCvFamKT5O/3X4jbslkv7cZEHIM7IyP0ZyLnRLdFrQ5HhzgkAoifCEtzTXLW/E+zpo2B5bVB9y3bmnUv6ld6q7HjXI71RGzc/XZ5SVpXjAlaM8x0uUwCObWqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements 2/7] net-features: Add low
 latency transmit queue requirements
Thread-Index: AQHZlNTpxrdkuQEIY0+feYgd54ULCq9+YgaAgAABPTA=
Date: Tue, 6 Jun 2023 22:35:42 +0000
Message-ID:
 <PH0PR12MB5481C2D9D3CAF363007B84E2DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-3-parav@nvidia.com>
 <20230606181535-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230606181535-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB8712:EE_
x-ms-office365-filtering-correlation-id: b5f580f0-4912-4bce-9dfc-08db66de5c60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4KAIOaKA+L+LWNQfF/1BIt7UYcRD/Y/A+KISPI1m2dI8v3lw9gkX3nUG+Bim2Phb0vDfHAjuyqxT+K9sgyf9p8aEexcjm5Z9Ryq2QxwFyTfPa0kwUKK6vd6JnLaOV5CEUovg9BOI9FMR47pGhEKs2AyQKulxnIwHuW88YU6qA/2PVXEc5hkr90lUgbVLG2vPb+KZUKA6UEe82ldobhwXkSCM+GaHO2aR49Zwej2Ljmld+WsSV5x9uPMAfMos/s/d9XDp/Oit5kACM0BNbh04FgPTdiXICh6Rp7n1StSQCf7TkfqmekFECTMu38tl3wkFmz/MHi5loQ1aWwLYXFUD1ZqK6yvoqS51+788obH4IhqFp4GFjyF1wqd53r0Lhk6+izkaP/+IHmGVwuSmUe0v4ne7vRy+T+/4hVKUAbwdaftN+BAXkG4YnijSpH3ZX30+lgZQYbJbeJxLSKBQ/hAw7mK+fopEmUqeOIWFls4h9qBNqYLPVP2WJ6Mlvyj9mFqi0xJiZGfsXHIMR/tskBkFAKVDBBfibpiJEZ44d72hqJC7qjRseWaotPqCKegMdHnas8So/gnllaUJgp0rWz89IdWOsZQuTU7oQdSpldA3tcA3AXN4/doMYy0diyJ+Jszc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199021)(8936002)(8676002)(186003)(41300700001)(2906002)(5660300002)(52536014)(9686003)(26005)(6506007)(7696005)(478600001)(316002)(54906003)(55016003)(71200400001)(122000001)(38100700002)(66556008)(33656002)(66446008)(66476007)(86362001)(76116006)(66946007)(38070700005)(6916009)(4326008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wh4NDzFJkv+qri+SPSsEgYWuBj5kasXntjYWuRFoSMymgPOJV0FxN/1iGxyU?=
 =?us-ascii?Q?YBPZ630SEW23sEYkJv87EqfkEsTHteV6e3WDTICg+XqLF8aTHJ1p09JjtFLj?=
 =?us-ascii?Q?T52cernGFPS2otGp/59891dowP+92MTB4q8rXvZtgAXbhKgMuY6Ra9vX68vx?=
 =?us-ascii?Q?vVi+E/QJg2OVqMHUUAleH/vaZuDXDynyOJ5Z3GWDJiC9Sr3ynXWZTyydLVHW?=
 =?us-ascii?Q?RPV+a7DgkK4cxSgRiJXnf4Hbm1ljI52sjT3+ZfpbbGRgvCcwn+OYKCKRBU6+?=
 =?us-ascii?Q?dEiGcK5ZUCp5xmIPVL3tFodDtfcex3Sc1txopBeSZHVF4rGSC5b8/ebGf/C5?=
 =?us-ascii?Q?DJqL17dIv4jjKvviiaNJR8YGylwh19/VxEqcuOgTFa6qlKQtfvfZhUuLXjz5?=
 =?us-ascii?Q?HJzEr8rWWHIPqmZYBcHNrdL+g6UsQAHHa/+0Zp8NQXGtwK/Co3D9iE/1/bY8?=
 =?us-ascii?Q?rz2tWxycSD4vfo9f7jROk4JpiUk2KxvrftjuuTf744C30J/nCuOGU9gco2rO?=
 =?us-ascii?Q?xgD8km8dXPBnIN9yIeP9cuaRDLVhFVwoPxmlAmGyjQG5Y5/0auHnIJAACDV/?=
 =?us-ascii?Q?lSiUTDtUw5pPJ4sZKlPe5rZ7P/UZPSq95f6NEPQjPVTwek7EDzoWlI62ESyQ?=
 =?us-ascii?Q?4/LnmHxmsgbhVWbrB1UdWmn/Agk/VMD5NjEDlFojV4TuJ4HuiZKxMsi9oQvL?=
 =?us-ascii?Q?I7cDF93rfPKjMF9f52rM7/6ZWBSHTXiEvknOKWXDyGHJoPq8Ge46vu8aYxnW?=
 =?us-ascii?Q?jwmpLn7slbYcg3qNnmL8uxbPGgW1cGvCJ0LYEHLC7v+hm+jctdHnpOgyZV6n?=
 =?us-ascii?Q?NYbsd7u6GrAKXGqQ3OJd7J8SyktWhg4OZAjsdf1D9DPiybq7tZAMuGxEsafR?=
 =?us-ascii?Q?r8X+QIn7Bc/r+DiQlB6AoeLNTzQ2OpXCSP8YwjuDZBpiVCc2YMA5oIXhFnQQ?=
 =?us-ascii?Q?6xFV/62BjJc4e1AmemzSQPVLpVof70wM5hZFgVNMZGPx5/Okjau3uZL5fkPI?=
 =?us-ascii?Q?HaKVPEhVFrwjdjmc8TkGKjtxB+gApX5YVYYmJk0B2dNHlKscmH73M8OT3tHZ?=
 =?us-ascii?Q?aihPnj/tyxkwAsSuE38EKrsxeqkhPNAhaza6ow1mJ2RsZYtMC/RYFbaVvk7r?=
 =?us-ascii?Q?vbq3+nlbiBdciuZwL/N6w5Mte5y3dtUsx0bccKUi7YrGvENMkQQ/zqNxHLIV?=
 =?us-ascii?Q?9YNaw1MJu/4Er8/XZp2V0x3/UnEXzEzzVns1KaGIpvy/3n7K067PUigkVne9?=
 =?us-ascii?Q?4p41mscQQhm4aI02JeNgqwnDNHdRXlGZplOac0ZqhQDi1peHaQWK09J/PMW+?=
 =?us-ascii?Q?U+RKg71h7RdUqNm1geA0+V0UXBKr+5tdhaYiXmt1WJF69r5kh9DXJ292VIz4?=
 =?us-ascii?Q?UDt4p4Iyv+s1/qP4FsNjA5M8QZSUS19rxsH7Q5tqgwJ7Z2Qp8mjslPP/SbDJ?=
 =?us-ascii?Q?DOnu2ANwxtMN9WLbHKoJCoeSwKuX6LirpmMNNqnhYKWfx/EKTZfmrdFMy9z8?=
 =?us-ascii?Q?kwegAEwaA4sl5HqVUfeWXW+354P1QujzcG29pFnXNGAtpP62J5qtN7FmDbk3?=
 =?us-ascii?Q?17HFYtsjLJoJeWsaxKc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f580f0-4912-4bce-9dfc-08db66de5c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 22:35:42.1382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MQ3KGAShBkV+JVST2O17NcqaqPegELhcjKBiGycjDvP2VeMEHb/JYmjzqZoOZqJ3H9ykF1i8t4hk9AT5EefBrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8712
Subject: RE: [virtio-comment] [PATCH requirements 2/7] net-features: Add low
 latency transmit queue requirements



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, June 6, 2023 6:26 PM

> > +## 3.2 Low PCI latency virtqueues
> > +### 3.2.1 Low PCI latency tx virtqueue 1. Packet transmit descriptor
> > +should contain data descriptors count without any
> > +   indirection and without any O(N) search to find the end of a packet=
 stream.
> > +   For example, a packet transmit descriptor (called vnet_tx_hdr_desc
> > +   subsequently) to contain a field num_next_desc for the packet strea=
m
> > +   indicating that a packet is located N data descriptors.
> > +
> > +2. Packet transmit descriptor should contain segmentation offload-rela=
ted
> fields
> > +   without any indirection. For example, packet transmit descriptor to=
 contain
> > +   gso_type, gso_size/mss, header length, csum placement byte offset, =
and
> > +   csum start.
> > +
> > +3. Packet transmit descriptor should be able to place a small size pac=
ket that
> > +   does not have any L4 data after the vnet_tx_hdr_desc in the virtque=
ue
> memory.
> > +   For example a TCP ack only packet can fit in a descriptor memory wh=
ich
> > +   otherwise consume more than 25% of metadata to describe the packet.
>=20
> For IPv6? With all the crazy options? Are you sure?
>=20
IPV6 may not use all option, for example #3 is not useful for IPV6.

> > +
> > +4. Packet transmit descriptor should be able to place a full GSO heade=
r (L2 to
> > +   L4) after header descriptor and before data descriptors. For exampl=
e, the
> > +   GSO header is placed after struct vnet_tx_hdr_desc in the virtqueue
> memory.
> > +   When such a GSO header is positioned adjacent to the packet transmi=
t
> > +   descriptor, and when the GSO header is not aligned to 16B, the foll=
owing
> > +   data descriptor to start on the 8B aligned boundary.
> > +
>=20
> These alignments are weirdly specific.
>
Not sure what it means,=20
these alignments are mostly specific on the host side to have aligned write=
s.
=20
>=20
> Are these achievable with existing VQ designs? If not this specific part =
is not
> going to be a network specific thing. which is ok but maybe mention this.
>=20
It will be probably a VQ with a type/attributes.

> > +5. An example of the above requirements at high level is:
> > +
> > +```
> > +struct vitio_packed_q_desc {
> > +   /* current desc for reference */
> > +   u64 address;
> > +   u32 len;
> > +   u16 id;
> > +   u16 flags;
> > +};
> > +
> > +/* Constant size header descriptor for tx packets */ struct
> > +vnet_tx_hdr_desc {
> > +   u16 flags; /* indicate how to parse next fields */
> > +   u16 id; /* desc id to come back in completion */
> > +   u8 num_next_desc; /* indicates the number of the next 16B data desc=
 for
> this
> > +		      * buffer.
> > +		      */
> > +   u8 gso_type;
> > +   le16 gso_hdr_len;
> > +   le16 gso_size;
> > +   le16 csum_start;
> > +   le16 csum_offset;
> > +   u8 inline_pkt_len; /* indicates the length of the inline packet aft=
er this
> > +		       * desc
> > +		       */
> > +   u8 reserved;
> > +   u8 padding[];
> > +};
> > +
> > +/* Example of a short packet or GSO header placed in the desc section
> > +of the vq  */ struct vnet_tx_small_pkt_desc {
> > +   u8 raw_pkt[128];
> > +};
> > +
> > +/* Example of header followed by data descriptor */ struct
> > +vnet_tx_hdr_desc hdr_desc; struct vnet_data_desc desc[2];
> > +
> > +```
>=20
> Seems to assume huge descriptors, apparently of variable size.
> Are fixed size descriptors valuable?
>
Its variable size but size is known upfront. So in a way fixed size.
=20
>=20
>=20
> > +6. Ability to zero pad the transmit completion when the transmit
> > +completion is  shorter than the CPU cache line size.
> > +
> > +7. Ability to place all transmit completion together with it per packe=
t stream
> > +   transmit timestamp using single PCIe transcation.
>=20
> I can't decipher the last two ones. Part of it is using non virtio termin=
ology, part
> referring to PCI/CPU unnecessarily, part weird grammar.
>=20
Yes, I will rewrite this part. It got messed up.

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

