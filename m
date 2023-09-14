Return-Path: <virtio-comment-return-7407-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2214DEE021A
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 02:42:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 62A532B019
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 02:42:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A17798663D
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 02:42:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 35E90983BBB; Thu, 14 Sep 2023 02:42:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1F01A986639
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Sep 2023 02:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crrZOt/atW/9xBq6gqABsMgLUnD+u177elQQ+H/li82TfNuerEICvcHCTHtrKtpeNBulZo+T5kysXOgMrvfOGYF/m1+hRS5hEFiS3YExd5bYlp2NyGenZO8TJzJ3rWhcOAkMJ+rshgJ4f61FMCAlNbyHDzkq/psKHfZvyeom5PcPr3ACQBC93dg6pK1/ByZLqRBFU6uE8koeHc2yY66xNJewEi9MWD9tlEN7cJrvBv0+OurrjxQ/u4iJ0F3KGbWCG77KpNCPNYNB9Tjv03W3Pzayj5yGIIK/hX6rgMOTaa0LU1LK4NRLsr9SCJlKMHaMY35aTO3MvZRddOZ5Nag71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=202/Ljk3Yx4/EfUPFhNO2QxMYxPWKj+h53VT3mqI75c=;
 b=odmJcbNRrUblgc6jMmErawEF7clNxaq9OPTIOvulTPcjAbqqb+ZZUZPtmZ06CCQnoQmRlcFdk67fqoOFpVxIcj3fDetR4FUoKhXamdOMfCq+8+1a1GTR7EcwAeQ4kPJAN04ChNsDpdHrDenxL786xKJiPmXHHVv2pXZMDZRFFJaY/z3QzSQd+2oSlyA0q7MK+yFx/zDNIpUkR+49WCw+51kLAt9pbzXBisrRXwkw4rVgnQJV5M0feyVssLtovD4ftPJXgID4CV9Hvhu5gQ3QJO8Y70wB+iHnk8fTmzhqDm3qAqDDUz9tNIWdB/UBsCrlCaF130n84Kef2AbAnXFzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, David Edmondson <david.edmondson@oracle.com>
Thread-Topic: [PATCH v17] virtio-net: support device stats
Thread-Index: AQHZ4VFcizzRxaDjyk+9nFKWIkpGi7AY5kXwgAC+dLA=
Date: Thu, 14 Sep 2023 02:42:53 +0000
Message-ID:
 <PH0PR12MB548177E113CBB3DF4EC4DB87DCF7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230907060546.12730-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481C32DA10A84488E421328DCF0A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB5481C32DA10A84488E421328DCF0A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|LV3PR12MB9188:EE_
x-ms-office365-filtering-correlation-id: 0cc02827-ff1c-41ea-ae10-08dbb4cc4b47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4OfmKQ2ItpWWlQ9V0lrZNnPIGEy0jeERgirv1xyn4/59MYX2X2Agpaz1dN88ByBwAeJu0oT72fso0mdQ8OYhUSNRA3XIRb6I0TUfvUuVnkoVBk8/XowRbTkYYbkZZi2KW5oegef0XClViCzHX5CMdOg4T3za+LfeBsOXZlKcyqPVCLTgIXjQaFALHSsEeFHvUL+hCQQRWJxyN1kuItuU5jhpqRS06KpULHrP3O5jAwsW5UYMCIsDv1/QY3zRAIdXuBjRTF5kM8+ULiHyvWBsI4t9SFl9PGyYWRk+akOxNBE23+hh/gZDjxf2J70Ppr7Qc8yYZLyNqQs5P5RtpO8ESwD/HJpsr7m8M9eGQXnVeMm37FQsTxZeQI7fVK3cYp6Pvn9L6IuF50gXl2xEnK2YX2AABiksaHEC/Fl+W5iTYodcCjTJ2of7iQW8FAITeUvFC3NtYBCBYcJAgCKURDaIrAZho1AKP1JoStu3Rq5vHBl9Oiy0JeOtboaN+Q3DiNIum8F/aQ/qp3CmaRNmVZbniGOgaStbDyUuq7NVcT2gDcENLnGqJm2J2EHdKSiS5NHT/JpeaCcADgCdY/uV8dVf1M95EGaNZgy7iTheWPj0LzfweO/O062aw0mVNWjx47aX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199024)(1800799009)(186009)(38070700005)(38100700002)(122000001)(33656002)(86362001)(55016003)(478600001)(66946007)(7696005)(5660300002)(6506007)(8676002)(66476007)(54906003)(66556008)(8936002)(52536014)(66446008)(64756008)(2906002)(71200400001)(4326008)(76116006)(4744005)(9686003)(41300700001)(110136005)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VjQwWAjJX7fH0Lg/GJRjhoRdOhYh2fnSRX/qQjeSZR7YaQdKeJETHfsQJpMl?=
 =?us-ascii?Q?jRDMz7079yJxo8fwpQpuPGjjM8lAYGx1iotRu6uCsA46ytGpQTOu3TjvlyPs?=
 =?us-ascii?Q?TSefUpOwzxfvO0I3ur4st2axcTUK9ccGiGyX4alKAV7vsUMoXVPMxFWDzkzA?=
 =?us-ascii?Q?mkvr5CaEzasO14eHM1oy+k9MB4oReS049p1kNvQvc+fOAFsjFMv/gaKz9mOP?=
 =?us-ascii?Q?E6RTud8A84eW80BijKnFqgNWT730wZxa8t5Goa+enB5N98knJVwb3A7HDa4R?=
 =?us-ascii?Q?+rT8kBDoJgT0fq7SxLIaKzrzE4BOuZF0H58CJwxcxYLYk/VDIBEv1Z8ih6C1?=
 =?us-ascii?Q?7936iEip3WSjedzi/6+hYRh+xo4DqtR8U2XKjBfm3wTMJLc1rvhCOXQBmRph?=
 =?us-ascii?Q?k/fEVqg9bAsLUqLnoebPtXIyq/zbIoWqw2QKTlJTEaj1TGdrKgTTpMmVW/9w?=
 =?us-ascii?Q?PrOcxyJ7JYlG52Wr/Fd4UcKjgf5kprAN9xgV5WskhTaGxcjoP2lC/Qr/j9g1?=
 =?us-ascii?Q?TDsL+dH4sRds7MwAZ/HAOzK4Qk3dp3/w8q777oVuMDs75K5b/U9X19DkuzdC?=
 =?us-ascii?Q?+eh3lSZrY9OhUmkfDLtaFaG4sDe3MHSqpSptCuhaiI8olrGkQEu/A523OdVK?=
 =?us-ascii?Q?1pj1m/8eBdY437qyl9109pKLiS6mS08pM9KMwNfuOQn6V/kQSVqZi8lrsaor?=
 =?us-ascii?Q?ZbZipOpBgQlD1QTx/oPEom1ej+emFqcwd4VpYUDP3DHJUfKYce5M14k3h9nA?=
 =?us-ascii?Q?dcVKhG9wOLNqAY+MINpsz50gxYSdknspcjTJCNjwuqMHHT7R2dhxFcBPcHLQ?=
 =?us-ascii?Q?X61ZmCZiKHctu/8Py+VfF+JJ0iQb8/7J8ZbaHq/jnSbg5/biT8+h0xD4ZECo?=
 =?us-ascii?Q?tQ+P+siTbTIh6Prad30XARdr4idFuEdColeqlKTliePZ9IedADPV/iNavxD9?=
 =?us-ascii?Q?/YNvd8/4N9T9nvhc+5meY13KtTefkaQrI+Nx/lA8seGCBsWPMWd82dCVOGDr?=
 =?us-ascii?Q?hq/Tmd9+SkX7uqXosQrMdAYow2uLNK04stfuh5CJLmwovoYEo5RW+boc4Ie7?=
 =?us-ascii?Q?nhWuyT0TBlWHmwb4Cijunkd8YiVcdlc+E/3SVrY49LBENh5u9RocA4fICxFN?=
 =?us-ascii?Q?OusEGLC+jK6XTAuokzB76RedUgjpkqP2HgLQR30NKjJ1qWqbf+C27YJoz5ao?=
 =?us-ascii?Q?ofOffn4XMr7e4UTNiCG62H8eFPB2q9h+YuLWynUVLdu0HaXVXs8z1Vq+1i+8?=
 =?us-ascii?Q?kV76D/msfg5xzS96BLtLQQEqOGqGrLA0oq/DqqhsoN8yIxAr4PTDDqK7gvnE?=
 =?us-ascii?Q?/CZqHWZaBipu2Ou3SsAyNW2Z4qUvVR/c5R57t/JslOGaNhi0d0ssT6QmHkrr?=
 =?us-ascii?Q?CgoVelcz5U7j5YUaZHlBTInZIF6c0pNFmNqjEYMH/B+EoAKSmGmphPxADKGO?=
 =?us-ascii?Q?ErYZBJHfZlKJL6enU+WWtPJZBZ9+rLOhaF3miNG2NP15xXWLrYTeQfp3DVtJ?=
 =?us-ascii?Q?HfCciRsMGbwMnHBz3Euvthu5Up+qQpenQWcDf5sLLJ1WkJF8PCh0P2XHowtJ?=
 =?us-ascii?Q?66a8GL85oa8JBRW80kiCTLAFUd58+nWO8EVxBwrHUL9dsZmJw3Hd4/LBXm7i?=
 =?us-ascii?Q?KghP7/ema6yfCu6jUshsl38QRdpLaJ2NRvmFgbxjhnwT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc02827-ff1c-41ea-ae10-08dbb4cc4b47
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 02:42:53.2121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 84jflA5B5WfbrIide8Tk9Q03h8Mfdt5VG/pRaiVd+m3LZ7c/VhQCHvezayHeZoUG3t9WqvT34wD25J1LiOwLrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188
Subject: [virtio-comment] RE: [PATCH v17] virtio-net: support device stats

Hi Xuan,


> From: Parav Pandit <parav@nvidia.com>
> Sent: Wednesday, September 13, 2023 8:55 PM

Two more points I forgot yesterday, can you please include it?

1. Even though 64-bit counters takes a really long time to wrap around, we =
should write,
That the statistics counter wrap around to zero on overflow.

2. rx_packets consist of received and drop counters both.
For debug purposes this is hard and not clean.
rx_drops is already counting the packets which were dropped.

We should split the good and error counters. i.e. rx_packets to only count =
the packets which were good receive.
If a new category of drop counter emerge in the future, one does not need t=
o keep subtracing rx_packets from many other counters.
It may not be even reported, when the driver buffer is small.
Hence, we got to split the good with err counters.

This split will align our counters with similar interface standards like mi=
b/snmp and more.

(similar for tx).

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

