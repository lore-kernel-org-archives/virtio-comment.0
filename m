Return-Path: <virtio-comment-return-7957-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B5EC25B47
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:22:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BD3A12AEEA
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:22:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B79F09869EC
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:22:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AD4959869E3; Wed, 25 Oct 2023 10:22:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9FCBC9869E4
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Oct 2023 10:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3AWgEmGH34wANjcSysoyXUOlOVJf0wao6rC8eDfTUOvD1e+QArBkmFHXwx6ujU++apKJpkNS0f3a/pagtJrPoYYihK1IaqGHGbPDG9KvyhFAQFmUADGgWwb9enV55yLQITXyaDVdWE9Mz88NyxoWYOaAL+MQYkRhieNaZ9lWUzzbCssp5AdbaH5rKP5wXOTydwce7DHWag+CEsbOZ0fhAz/lMsRXMlW1ycTGYjI5ZSpnU9tFUCsdoMde9Xr8RtFNrkJHz9cWBvT+n415hl1YeQOWa/pC61E0BaYIIUzKeFaqVMi4kqH4qjFnTkDd1bdmZdOmQh8KDE5MixzT3lbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFMOlr2sdqacTEnF7Emcsr5DfsPyB6hVzfeeVPs1LF8=;
 b=cwWco5k3ix9eTVjL4IYSomt5puSxBhyenwz+CrZwZJlmUwfpHGUUGnR3G4nvZjNvhgeUjQ5NwHjxTjn6NpuHmdLhZlheSJqPq8H1y5vbtUK5+ehDqPJly28rfn6W0xlFM+ErI+ZvmGOzF2VWNUafT/HNvyG6ptIsiDP2ms2PFNoOEPDBqvSpDQXaz34PAiALA4jkG2aqT0cx5hu+VHnFEECcS5vCGAxyaGbenYOxQWf8oPW+TMsGi8WQjFb3p3KDS5/7dRO/gViECA8OWkX8juA1XFO72IIauUmaonR67QJURNui4VM9uw0JVnNm3Bglw9h2/Zc+LZHVSxu8D8zx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIAAFBIAgAABIMCAB3K1AIAADNZggAGZtoCAAFHP0IABBk6AgABdlBCAABa1gIAAEtKggAANSQCAAABWsA==
Date: Wed, 25 Oct 2023 10:22:03 +0000
Message-ID:
 <PH0PR12MB548162B95B329056FFCFB247DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231018055422-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
 <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com>
 <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3nC8G3Xo2EaunQ4k4rnB27UQMUvruXaf81_sZF7w-cQ@mail.gmail.com>
 <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025041653-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B91F71A81D1B57401968DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025061755-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231025061755-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB8600:EE_
x-ms-office365-filtering-correlation-id: 12ac934c-500c-40c2-25cf-08dbd5443b83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nEfvhdpZKn+0uz7eCNipr1Dq6lKl7DCJBlWm5JOhauh7JMQ2HBndhivOkF4+1KJcGelTIhb+yMnB2JbPSVvl/dP86sTRhj8urkdgELon2DgfBDlgN3ajMSxZml6rjlHlTl6SkORB+w0KIK02u1z0dbXDUsJsh2V3IL2GdJjT1dGyM+AYlK50MUkLFUEsXAy4tfpdAPbcUAGbXVzzfOQAQolOG1c5Q7W132FNRCyK9ouzBo3Feg01PbBlBrBxIKm8Fq+I9raisxXO9fQ6M5oO88yoUODcxKRh6cDPwFUQHQnknFVB2CYVY+vZgNg242cxJbq9caU/J9b1Uik4t1aX7c7fZBFJQD2NG8OwYYkau9SaD/IycIogV/+Ekh6ZDJP7Oskv5F1u9JDELFAdGBLpTHBn39AYtBnT/1IGRdNNNigg62XvszagUrUe0kzcwirud+9hOHugOsyDn94VtRJG7b/MvQJtWF/gJ37dLQ4vPXi/juBccBopBDNOvLB0J9Nd/OgzK9/T6zQBQ9h6Wd6XHnXTa3ZX9JXfSjlXJV1Aa2FPQD0Rcr6aJA0LzgPw8No9z3bkiXh1ccXbPVP52byK1G8ayMYrzhBi8Jt0GY6hGNK6nKSNS10Km0h3W5JGn0Le
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(71200400001)(6506007)(7696005)(5660300002)(8936002)(4326008)(52536014)(107886003)(478600001)(9686003)(83380400001)(26005)(66946007)(55016003)(66446008)(54906003)(38070700009)(41300700001)(76116006)(64756008)(66476007)(6916009)(122000001)(4744005)(33656002)(86362001)(66556008)(38100700002)(316002)(8676002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LpIrMtkNx25QnpAV8l9/qaN6zrBRL+vSg1RwQyDNC9kGbctzQLqndjBJRrMn?=
 =?us-ascii?Q?gefKjo/tdobFHT4/YPGhXJg84r0+8CWqyhpuFNJVLqWAITtzq0kFO9PADmhD?=
 =?us-ascii?Q?xq+S/qQV09WPIGQ1/xtmU0Rv+Cpue5FCEPstHUo1sdwOUN66Bl/Nl1u6zXwW?=
 =?us-ascii?Q?W8QRPRPyHqTrcrbido818u9/200kooAlLigMXH3EUQA3tsUZ898MnadTkZIl?=
 =?us-ascii?Q?wX5qLLpfdyX8+nfWuduffl7qH5vIE8reVBHONudRxHqiYujFOLcYIPskkFu/?=
 =?us-ascii?Q?5iV1k2++v2owmjwtCujgys/ADYLKHOOKrtkIVVKKXhtOGU4aMdU7KWcJQ6i+?=
 =?us-ascii?Q?cHe+0HVWtEs/fq6ZWqPs1en7pxD72zymgTujK7ELzGGYtrFIRVUYSe7YltsY?=
 =?us-ascii?Q?asd9rpB8FyYWu+ZugQMluKOWT/AGERgMzZdAD91LcxCJFlS0CPgf2JDcx7AQ?=
 =?us-ascii?Q?dVaGUIZhSbFyEo32sN2vLpml5oH8SaItZLRtTcVkY4fKQ4wOrtqv6lHtpMHF?=
 =?us-ascii?Q?pN4PUGYO4hi3IeIAYMNRL3sTwZqdF2qvZgDT1lA3EmEih2B3MvVTkmwoPpSm?=
 =?us-ascii?Q?89C4Ew7zq4hGFU8zfNw/+ubkYRxKx4disdcnLrbTmxoU1wap5Xinxtv1j1A9?=
 =?us-ascii?Q?MA8N2EMa7uyOixDnqaiJiWpxPZF52/E62gKRYWdKGy36soyzpSfWk9LV164z?=
 =?us-ascii?Q?iY0+kfY6pkxcBEUpjwoflTPHRoj/ro/29zgvLY43lavmOu+ssjCv77Pu3+oM?=
 =?us-ascii?Q?9/RaBJRtd4J7v4G65tzZblPO1U1t09V+m6w42xmuuHMnl97N2homg6iP8JVe?=
 =?us-ascii?Q?21PS9lYp+uIdwgglwc7E8TCGMptdfd5p1fFhhzCzzE9+UuTJb6myk8vxtcD6?=
 =?us-ascii?Q?S+6i8m2hOUyqM4TbaDzaUus7hGz6Pjo8tZ3Skd4/g/62dm2y0z4pjKZXxIJE?=
 =?us-ascii?Q?Q6Chp7AbX7PgrT2jSgCgbLJw3yw5mwLw1iWv1xwnNgPfXA4KOi9Te9+Xarof?=
 =?us-ascii?Q?BDeZEQ0qm3EzXqqeOGPzrV96TbyI2/OGx8mo82rSo0JGA19NQ5X9BLMuRm7p?=
 =?us-ascii?Q?jkoCO6HBpv9+PjGzmAmeTu5r3thUbwEoGh36ITYcU3Oz7ZF5eWnwFkWLcyQQ?=
 =?us-ascii?Q?ZjsjrqzQ+iR6jQTrQzqYJWBe+Gmo1LvggDfApSxAQNqXDD5j49YZ0HzGTvI9?=
 =?us-ascii?Q?Sbm+Xre3GUKREI/9tXzu9F7PEvxxwbzSHsQHs1a/avG3JnJ2pAmBlKDUmz2a?=
 =?us-ascii?Q?s799NJSIH3qDmln+H0A9pC8D8Fctj2Hh20A0p2TFIOBEmSVkxsEojGOz9zu/?=
 =?us-ascii?Q?9LXGTQ+wci/5dGysYgwG/5sQIGEV6MWHIovKVisurhI8PnCd6quwptVtC0Us?=
 =?us-ascii?Q?RTu15ixY/L8BQ78O0PCodaTOm7hLI8Lt93AWLoR+Q3vP2HdijWNj6D+/orzv?=
 =?us-ascii?Q?ph1IwTjaH012Qnc+8CIRqwHJJhgzB0MQeQ2A06MPb3D+AGG73aRnsye9myad?=
 =?us-ascii?Q?1QqsovW7rbLriupLVkM6SZQST6s6zthS7ems+giI06OvkIZNPjkc1VMjQpnC?=
 =?us-ascii?Q?yYWnfOBgKEzSDZGo3is=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ac934c-500c-40c2-25cf-08dbd5443b83
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 10:22:03.5905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nxNqlzuwrXuAdpB4NpQ5TEtNvC3bXD7LPj6iqO7JF1azAMgz5ipojGu4ERzCUq2LRd5PaJdvH7o7qKGqsBLEPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8600
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, October 25, 2023 3:50 PM
>=20
> On Wed, Oct 25, 2023 at 09:50:02AM +0000, Parav Pandit wrote:
> > Hence, I believe device context as defined now is still reusable as com=
mon
> building block.
> > For non-passthrough, such hypervisor can simply ignore the fields which=
 it is
> not interested in.
>=20
> Interesting. So a hypervisor encounters a field it does not recognize. Ho=
w does
> hypervisor know that a field is safe to ignore?

In v2 all the supported fields are published in a query command.
If hypervisor wants to know the precise fields of interest, when the device=
 reports unknown field, it can make its decision to ignore or fail to work.

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

