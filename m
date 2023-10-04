Return-Path: <virtio-comment-return-7584-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676B6E7C4F0
	for <virtio-comment@archiver.kernel.org>; Wed,  4 Oct 2023 19:38:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 934FD45B23
	for <virtio-comment@archiver.kernel.org>; Wed,  4 Oct 2023 19:38:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F47A9867FE
	for <virtio-comment@archiver.kernel.org>; Wed,  4 Oct 2023 19:38:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 421E09866D8; Wed,  4 Oct 2023 19:38:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E0839867EB
	for <virtio-comment@lists.oasis-open.org>; Wed,  4 Oct 2023 19:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgSwMxTuH96CVHkbvd2G5VaZ97OhbV26MDv5y9KH0Aq/e2fEqD7zOOpv2bcyESFad5RsXBCjDc0ZmWxMtwvIrFkkMaaXJCpjQp9kiy4mHta5qguKGcdPAJe3uQef1atwPd6L9FquSwvnLkDMCgUjQIdrzvCImyreKexERxhRYXRscu2St3uXcoWsSdBniQoY5IbwqR7YHcZPEZ5bgLMyqSq7Vk+QEksCRjPJM/osCIjT4iCYdtdVsp6kj+R09ESCZ+cM6CnRKeVwBSndOhYkBJEPBlZVJPRMDyX52II4K33e5jFQDDZtcogT8h+0yMDXFt4Bs5AuTyTe/o1u/ztnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYTeIRpzM10QFYZ2hsNYHoQyWr4OCQP+ilC7kHQIrWY=;
 b=CTHXvvVb+mT+LRQ4deoqWmqUis2+82nh5iuTMVJ7IU5zMYs81/DllVRyDpuJdRwvllc+8o9Qw0HHrTMX3wBJulKExG3Y19vVde0TyeQSHDcH8Jxh7JTiIGo9PaQWipvv8HhWEqrGZa/2RNvC5JtvqEIfxttli5TqX9qNOQnn1UXTDufkJc/BIT55LY9ehcpO6pc/uI/qKNyXJtyFO5S74hhQI4Qvo/k5QmGTqzlD8myeG4/jtI8VjRaOp6SuHG16lClSOcwflgVWomIHJjk6HL23N8MJu2ASriO/9yQAF7VixWWISX0cUNieeSsQOBv2UV4+Pwiwv76vom9KoNSNTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>,
        "mst@redhat.com" <mst@redhat.com>,
        "cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>,
        "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>,
        "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>,
        Heng Qi <hengqi@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH 6/7] virtio-net: Add flow filter requests
Thread-Index: AQHZ7Vubs6b2iEb7DEOlGONnSQN0j7A0n7VwgAAx9YCABTUSgA==
Date: Wed, 4 Oct 2023 19:38:28 +0000
Message-ID: 
 <CO6PR18MB4466CDE559C46ED7821BBB53C3CBA@CO6PR18MB4466.namprd18.prod.outlook.com>
References: <20230922134838.3718-1-parav@nvidia.com>
 <20230922134838.3718-7-parav@nvidia.com>
 <SJ0PR18MB4477626C269A031890BB6782C3C6A@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB548173860F1BFC2282056F12DCC6A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: 
 <PH0PR12MB548173860F1BFC2282056F12DCC6A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR18MB4466:EE_|BN9PR18MB4281:EE_
x-ms-office365-filtering-correlation-id: aff541fb-02f5-48e7-d5c0-08dbc5117bc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 szOuvXj9UOl5wP0vYM+fNkRJtnU6U74TMmD6YP/NRSFXEoaWhRg2N+zIFYeapCVXsbk5D2Gr8KgbqMYxGGEmhYdwU9QQuJPOyB1jH1+5UExPun1LY7oxSZP/Wc00OTfLVTvOEfIs7OR+z+WBQgh61c/fsTIfuoPydHip13cGEcB/56GJmos9aRvmLbDpTYBxU2UBi+LdfUofHoydp+tZYzmdYQhBRhPKcJSj9uXCc4unqMhcL3TySpfquZ06cqJV6TJuHqkFGaa75M8bWNRYnSqET4LolWd2tvWkyvq/rNBef0OD4UM1ENVk0VcmlpSs/SmrkMH/pY672poS91CpWUsbJyNLd8zUsBG4B4C5sUTJK0Zxd7+SXOrsqHlMBiKjm4tsrj2ijWckUXuAdoizi2sSW89CaejjyaXMOkQxx0whEaHKJKNE2f7mV+I+xaW3zbmkz4xW6OjCteCqr6rp5WbUdpWRxloKDV0JedZPHOZxAwXA6lLjF0z/TDNt3R9vMtjqVpbtcIZ8qKOEQ0w+qK/YalLJ8me01yzbPyicEf7sVmTJvldAGRKKJkLqnKpPxbMHGBmi16riWpY8YmHiCd4kf8sx2U3zL1A7HmeXvPvcmNt6SUX64h1fUoYXQ4EObT5IPxj6+FUqXBjBnfjAcw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4466.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(396003)(366004)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(66946007)(66556008)(66476007)(76116006)(8676002)(2906002)(66446008)(4326008)(8936002)(52536014)(316002)(41300700001)(54906003)(64756008)(110136005)(5660300002)(478600001)(6506007)(7696005)(53546011)(9686003)(71200400001)(26005)(83380400001)(122000001)(55016003)(38100700002)(86362001)(33656002)(38070700005)(87944015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?kTNfGyr7EBBDs+yZwA7vHEW3iPzvlZPdgaNnhnLKbbz7vXgpEgCYogbUa4A8?=
 =?us-ascii?Q?W/QOSykmQC9sj3JOmAGKlw0y+n9H3bpE0gTzhB2xwIyForkTmnK34GYgCO0q?=
 =?us-ascii?Q?qhW0smD0SiDDr+rLoMHlGlIcGaUBEAziZqT9ObDi5GSBG5WUWMvCOhqL73L2?=
 =?us-ascii?Q?+CBs7Nhr802oZxwKaaRyioP8bkdobtavbffhXzgFlBIj69UE9iSEisuT72Ef?=
 =?us-ascii?Q?i+7y6pexpdaOyn5NO76avXz2TQs744CTGro7ZjDq8tg/rxHJHYBFtP7vdYXL?=
 =?us-ascii?Q?BvlboS/5PvJY6fl4b7SFtq0BaLI53Ffhb4d5LP8Yw7ehnmMR0+XZaZA1ZV7j?=
 =?us-ascii?Q?VuuggQ23ltEfOaXKkDgXCrCAkMeK6nY/5sI95sVQGH0cWS6TeR//ML2EOQOg?=
 =?us-ascii?Q?+UMIpfddiZgs61niAK6ttPMHxxdJNrQnyJQHN91Xwkgv7tVa8epJsUKhq+Dj?=
 =?us-ascii?Q?IEPwQBNBx1C4OgDSfbIfdXKfy4JPoyNteiyrCVKuaAAd22MqxAmM+qlpRfVH?=
 =?us-ascii?Q?k3qOTFPA2/7XI2Kv8yYGJihfUb6NkeaX4VIYSd5QJYFnTSHafWx5EqRhN/q+?=
 =?us-ascii?Q?ZAmnMcm8oMd2Ney9SzJSsTNX8fxOayM28AJMUKl8soMKdFrCiqJ4sbRNeRCs?=
 =?us-ascii?Q?P8hfT6QUm9ZsgLoVVhSJyh4F/jwkTGJAkWpvgMbomxjcYTClho5ePqviC+P2?=
 =?us-ascii?Q?CaCde54DET1AhHh2a4/k2GSki21uSPGdCU+ncptNgBA40gAHZ+KJZv+83YVh?=
 =?us-ascii?Q?CBYx8aYaedPs3zxP+rCtInFsFt8l5zsSSdo141AWnXwf1flfzYrG6Ia8aOLY?=
 =?us-ascii?Q?VA9uGDhau/yOOlBgvA/x59goRNqgRm9UoZ/j+qAWbZZ6rgiFbWu31HFxtBTN?=
 =?us-ascii?Q?KKhdSJtC9EQXfNbPQeoGew1Ut72s0pn0/s2nDNjJaHtfPr3DqfPDVaKl9A7x?=
 =?us-ascii?Q?czMjoyTdpl8NCoFOX4byAV/zAJm0NfE3tF88aG6nBpt0flbAo14GVCINzhD+?=
 =?us-ascii?Q?OfdaJsZ5cIVm/Po6PAzHqmZVDUBaT+kZDH4bGotUVp9JL9ADS5rAenoERtOh?=
 =?us-ascii?Q?PcvftiIq9ErS1Hg1R/OpE+WhUaRUD+3P/yhpZZ+/z6DjEdyETKz1rMH8C97R?=
 =?us-ascii?Q?ToFfAboL/H4ZnsoR7m2T20idbq2lZcDFrYScbkzUaBrY+hxTYFQK5ANyBCNB?=
 =?us-ascii?Q?ErHwhbo8YpzQtyLt+2aTLmqN5QLiTdL3fU0QPwJMr8EtOSlVetTyQGZb4zRo?=
 =?us-ascii?Q?hEivn9N3QglQ532ci2+6qiylD2Z4kSQ8czrKczXHq8bMbcvlnagYXeS48r/x?=
 =?us-ascii?Q?+zfpmGnQr1Vn80+kR2QLojUu41Dx33XTa1J932Gl311jV8k3TFgNNpf28Eu0?=
 =?us-ascii?Q?2d3me+bU2GEIgMQs2v+d9p6di/ls5AM3R844Z1nSMPoUB5cI8mVOxJAiJFep?=
 =?us-ascii?Q?nWEvxcknLUECbdD+QOujHlBPkukKXyQgKw2ZF5y4yHLGicD268zm6eTgdG+s?=
 =?us-ascii?Q?MDwmlQPBRTAVW6+Kbm1u/aSvjhoL73pZ58bb2ouKwyxS9CXHaIpV73YOvB3Q?=
 =?us-ascii?Q?l1q8zLB1/onWi9isPySPeHQm5CWgbvE6QilDB9SA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4466.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff541fb-02f5-48e7-d5c0-08dbc5117bc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 19:38:28.4404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aq53Lbv923FVDtnmaWa7IyYvwMWqTO0/gGI/DPsm9/dzW5F0Nzj/9pFuz8ldlZQftNFPlOC6EowjO9hF/rPkcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR18MB4281
X-Proofpoint-GUID: -uTncsV_ukevHRQj83dI4VZsMjAf-UdR
X-Proofpoint-ORIG-GUID: 7E9xfUKKc7jSC7n785nBMlJZsVdfRNFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_10,2023-10-02_01,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [PATCH 6/7] virtio-net: Add flow filter requests

Hi Parav,

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Sunday, October 1, 2023 3:58 AM
> To: Satananda Burla <sburla@marvell.com>; virtio-comment@lists.oasis-
> open.org; mst@redhat.com; cohuck@redhat.com
> Cc: Shahaf Shuler <shahafs@nvidia.com>; si-wei.liu@oracle.com;
> xuanzhuo@linux.alibaba.com; Heng Qi <hengqi@linux.alibaba.com>
> Subject: RE: [EXT] [PATCH 6/7] virtio-net: Add flow filter requests
>=20
>=20
>=20
> > From: Satananda Burla <sburla@marvell.com>
> > Sent: Sunday, October 1, 2023 3:13 PM
>=20
>=20
> > > +struct virtio_net_ff_match_fields {
> > > +        le32 num_entries;
> > > +        struct virtio_net_ff_match_field match_entries[]; };
> > It is better to fix the network protocol order here.(l2,l3,l4).
>=20
> It is recommended but I am not sure if we should enforce it.
>=20
> How about writing it as order SHOULD follow the packet field order..
> This will cover across L2, L3 and within a given header type too.
Fine with me.
>=20
> > > +
> > > +#define VIRTIO_NET_FF_DEST_RQ 0
> > > +
> > > +struct virtio_net_ff_dest {
> > > +        u8 dest_type;
> > > +        u8 reserved[3];
> > > +        union {
> > > +                le16 vq_index;
> > > +                le32 reserved1;
> > > +        };
> > > +};
> > > +
> > > +struct virtio_net_ff_action {
> > > +        u8 action;
> > > +        u8 reserved[7];
> > > +};
> > > +
> > > +#define VIRTIO_NET_FF_ACTION_DROP 0
> > > +#define VIRTIO_NET_FF_ACTION_FORWARD 1
> > > +
> > > +struct virtio_net_ff_add {
> > > +        u8 op;
> > > +        u8 priority;	/* higher the value, higher priority */
> > > +        u16 group_id;
> > > +        le32 id;
> > > +        struct virtio_net_ff_match_fields match;
> > > +        struct virtio_net_ff_dest dest;
> > > +        struct virtio_net_ff_action action;
> > Isn't dest also an action ? for instance, if ACTION is drop, there is n=
o
> point in
> > adding destination, similarly if ACTION is forward, can we not add the
> vq_index
> > to the action itself using the reserved bytes? based on action type, th=
e
> > additional bytes could be interpreted.
Any comment on this?
> > > +
> > > +        struct virtio_net_ff_match_fields mask;	/* optional */
> > How is the presence of this field indicated if it is optional ?
> > Does it need a field like has_mask?
> Yes. I missed it.
>=20
> > Can this be not added into struct virtio_net_ff_match_field ?
> I think yes, the issue is not all use cases (like ARFS) needs mask, who
> always uses exact values.
> So communicating and setting mask is redundant (also the struct is bit
> large).
>=20
> But I like your suggestion that we can have mask defined as, just
> match_value.
> Since value cannot live without its supporting type, finding it hard to
> have only value for the mask.
>=20
> > The mask only applies to struct virtio_net_ff_match_value. So it may be
> better
> > to just use struct virtio_net_ff_match_field {
> > 	struct virtio_net_ff_match_type type;
> > 	struct virtio_net_ff_match_value value;
> > 	struct virtio_net_ff_match_value mask;
> > };
> > instead of repeating the type again.
> > > +
> How about encoding has_mask in the type, so that mask can be optional in
> the above struct you proposed?
> With that we get both the benefits of size saving and computation too.
Yes. Makes sense.=20


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

