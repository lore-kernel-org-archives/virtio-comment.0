Return-Path: <virtio-comment-return-7321-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C85CEE57DF
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 16:03:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 76E44613D0
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 16:03:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62F52986485
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 16:03:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4FD6D98642F; Mon, 11 Sep 2023 16:03:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F556986436;
	Mon, 11 Sep 2023 16:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elUa8ierfrBbN+XbPu/WKZetT6wtTLqr0Cn7H7qE5BzjxkTJgeU/Wz9LmXZGgD2SpEjxqGLuuSu16F+EzlN6Qaw9x8ldAc9XAP1P5PG8t9dluY0rc+wa2NEDloZwq6puwrzykDzyXEC6Gdo8wy6RKk1nYOukawFyF4ELbw6ds8TRKu0tS4Ci9MClO81iISrF35LFWR+dAA7FGWGxnsdm9wcene3SIVX7iJ4OiIEXdW2AF4dlBEQ0hiZAUfHuOqtbnb1K+OefL/kVEn4FICIJGyIC+tsvYxmdMfmNakYBSBE5TE4hJIi3ctvUoykkA2SrPADg8fCe/J+COaKZKnz6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXfeRtNRha7a2AzwuYcvtCxqT/xsz7K0dD18geNpWR4=;
 b=nrG0+wqPp9bSXBJA0o9qnZNR0pNm5z0rN1F1FTUIBjvn+mc2KPHLoZadCFoIZrhXkW7aWnmVXqR25ZBSNBqSA1ao+58/ECYCOe1/Iwd4F4eYXfMuvWcPskJlZH5qeTpxmqGNoL2bhY0uu3pWNXTuPZrmc5IwGJRPTmVMLUtqzZQGbiTtz1kT1dzS0kFx8ny2B34kT1ycES0HafmxG9doKJzMeAE3sbYbx9E/dcwzWWnocEmZRvno+gyX5aeKm9d3Q2KF9duGDMVXuyfTyScM3MTG1sLq7HSpTW6JATSCwMtWs49p6NF8rt4hEKBebIBWsUP4IDhqluNOJx2KBm3HFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "david.edmondson@oracle.com"
	<david.edmondson@oracle.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [virtio] [PATCH requirements v5 3/7] net-features: Add low
 latency receive queue requirements
Thread-Index: AQHZ0Y2OPkkXezMnckKK02qC/AGznbAVydaAgAAlFGA=
Date: Mon, 11 Sep 2023 16:03:10 +0000
Message-ID:
 <PH0PR12MB5481F9484EC98BB1A6CD6E68DCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230818043557.496964-1-parav@nvidia.com>
 <20230818043557.496964-4-parav@nvidia.com> <20230911134715.GC3803963@fedora>
In-Reply-To: <20230911134715.GC3803963@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5826:EE_
x-ms-office365-filtering-correlation-id: 144d6199-2014-4e7d-5bc3-08dbb2e09895
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5k9eR9pgHsAw9IYorYNkmfxJ+Mi4yUVvfzdWUHBpdAk/xGpdsWGXEPhmMCWjS3drL4OZ27PWr7OlwS+Kk/HNC5a0HtiIqbXC4H3mWAbzfdPMGaTesZFi2Af4ksYZ89gXr2LtYAjWVTJxFmVjUMB0z01Az4AH6y4UG2GLQmXNlaCOFgwNiKbZws6XrcijAWJ85sVVAkO/6kw4Qc+ZDCh99s1Uq/0oCWt4B9d6nOhith3KtEWZK2OstnH6xg28zUWmcxT2Kx4XngLrpQLLnaOEcq5fwaI8/H4iiRWRTKaVXY5L5zINkf82bJb+9MOw7LBvLWl5K+udVZDTVzkUJ6eLQek8gKUlazKEvjmU7Gi7rX98fSUY9GnqydNananToOrs0EcRfs6M0Gdi62S85SOdzYv+wqWFJngCcHFakNQZnalXN40nwYBaDJSQe8NAjs+DMvva5aJ6bHETuHSRtlxdi+H1mfH+6cVCqJBAqc4fwkdAmB2tfZW1NRxRhNyKkwuyMonby/EzeP/TRHSfXigVISapqo5XlvJco8DyMLc28H+j3YvIs8CFhECfBtKUy1wpY+GO2bt3r8aHwIbEk9hIUlMyD6eiwmlt9DSTwqwSZoPb81Ax8uDfw6J94/i1reNE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(366004)(376002)(451199024)(1800799009)(186009)(122000001)(7696005)(6506007)(52536014)(71200400001)(86362001)(33656002)(55016003)(38070700005)(38100700002)(2906002)(9686003)(478600001)(83380400001)(5660300002)(26005)(316002)(76116006)(8936002)(8676002)(66556008)(64756008)(66476007)(4326008)(6916009)(54906003)(66946007)(41300700001)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GUPSutsjLps05oaFz6OMxVdtRky1bbUom2wdvHsFMlLQgoCxxObmR78ah7nj?=
 =?us-ascii?Q?o0m/OQ87d3QUrkrtkBlZivXTebw8IwULmfnpusek/PTDE3L39cUHPruKZ5zy?=
 =?us-ascii?Q?9eP4gb7Ao91KfLvNMhaJxqQZHJ5R+W6KX3PG3eqTgVqMhSMUddQ8oqrOFvvJ?=
 =?us-ascii?Q?mz8zFNr7hDIFn63w6/HFQC2z9iPlojG3S6SdoHH2ZDG7738ky44eZnmcI5Zi?=
 =?us-ascii?Q?Jp0my+TM3B3s3CodFXmx6DoqidW2GOqXzh64t4Ne1U6bNGAO2mmugJ2/92qo?=
 =?us-ascii?Q?UDA5jm8YCIha7pMYvcVBXgKxoOmlQI831UNMOZOkbTzBy2XjdVsL01Eewxyg?=
 =?us-ascii?Q?jGs4yS5XAxVk9sKBsqdstXOo4jXV2SUsPMQAp3kpba9upJ8J6OQsgLi876bg?=
 =?us-ascii?Q?oUrwJNRe640Gt0hHe8FXeJJI+xOqNNNVK/0MSaXshFlGUqVr+LwtSmu6u1Ay?=
 =?us-ascii?Q?GZ/livnrht8avBiLOIj74/ceeKjcWuVgIODRhae/D3MxnwcWCjUICUZOx1Fp?=
 =?us-ascii?Q?KpWmGjJp7hxWTbUfVbU/X+FCVkfK0W15smEi3uhdb7yrLoEgN182A8SIzCQL?=
 =?us-ascii?Q?bqmumOkEXcjZa41QU0awGCtMd7nsogAfgdekh5Nv1wuUiUSYfYjcbxyBjPyw?=
 =?us-ascii?Q?MVUry9y7Bfsma2P/XBc7A9JJQGNcu94RMwlA2XyrdCvDucs60uuLu/RU/3T+?=
 =?us-ascii?Q?cyMQCA95MlvEj14PRxvn2mo8HoFLgHrRL8fTRb8TngpwOn6X7qS9MMHLa/U2?=
 =?us-ascii?Q?fXfD1aDwYfSI7vEUd2gpGRIHYi5+0b6jGMriCS87nE8SaBh4M4tylVRvF1MF?=
 =?us-ascii?Q?f3ao8ZZJyAd6uPOD3qObkdU6QXyQX8R17ru6mmS29W55uiRi6KXR2krsWQW8?=
 =?us-ascii?Q?UnjaWx/otIu7VFPQ6BjW/vC9D7qHy9+UxUz/iEmaGORsOmJ2Ca/1HNVfQOGY?=
 =?us-ascii?Q?Cr5F/dVuMmYPIFQiqaqZvyBf9F+0jfY7ZbwPK0JrB1AFh2Tnd7t/TrlOcMHD?=
 =?us-ascii?Q?td8Y9emebsDlrEETB44YdOPGONHdGFbdZBiK38G6HBjeBjuD7as1MQl6wSIX?=
 =?us-ascii?Q?qMhcyoYZWmvxPSN5TO8eq0jn+yu5Bi/jNH+Yq7kvwnOgGhIF28vUAx8qhtRB?=
 =?us-ascii?Q?+K0pHbg63teG3iYfMyzmQyTe+ldMoqeghrnaa9RFKVcTXlau2dgPUeLz2/Xv?=
 =?us-ascii?Q?yrGvJAnBmVd8fr5K5PZ578r2tqhMtVPexMNrW6KuTdhwHtuCgeR5wvjwDLP2?=
 =?us-ascii?Q?8z0OOVFP7L/43Ykt/Q1QGv0Ga5JFHyQGpYw/eX3RtQD+AiG7sjIuTS1vKY9Q?=
 =?us-ascii?Q?ky/mqcc17hZl/43Al1sbQ1ZS1SVHgkW3q2I6Mb9gNKwF5HyPsTdSghbfynO9?=
 =?us-ascii?Q?B+h7vnjmBIOyDEr1K++iHKPTNBFr10pqfW3By8Zz/C9wzN+3hlMy/cOopUiY?=
 =?us-ascii?Q?XUV9DBvwprPJ6Di2nK8IeWbrvjAEzHbzGMrzlgc05c53oJeChnokF7AgINue?=
 =?us-ascii?Q?8wyko1DkbMNbIyrK+cjA5EhT/c64nOg4WlTBJr6nTU6PMIK3P2O/ZGtGWyPV?=
 =?us-ascii?Q?5tmRYZqC/Ah5sFh4vRI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144d6199-2014-4e7d-5bc3-08dbb2e09895
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2023 16:03:10.5188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tBCqFlWxCKIlN5k55KoFCoxSUVw5lrZU5W29Tw5gv4feb5ZyJEAChJP3kck7wm5F0ttV0mAA7pyicQpiROI2rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5826
Subject: [virtio-comment] RE: [virtio] [PATCH requirements v5 3/7] net-features: Add low
 latency receive queue requirements



> From: Stefan Hajnoczi <stefanha@redhat.com>
> Sent: Monday, September 11, 2023 7:17 PM

>=20
> If I understand correctly there is no longer a 1:1 correspondence between
> driver-supplied rx pages (available buffers) and received packets (used b=
uffers).
> Instead, the device consumes portions of driver-supplied rx pages as need=
ed
> and notifies the driver, and the entire rx page is marked used later when=
 it has
> been fully consumed.
>=20
> The virtqueue model is based on submitting available buffers and completi=
ng
> used buffers, not individual DMA transfers. It's not possible to do DMA
> piecewise in this model. If you think about a VIRTIO over TCP transport t=
hat
> uses message-passing for available and used buffers, then it's clear the =
rx page
> approach breaks the model because only entire virtqueues buffers can be
> marked used (there is a 1:1 correspondence between available buffers and =
used
> buffers).
>=20
> Two options:
> 1. Extend the virtqueue model to support this.
> 2. Document this violation of the virtqueue model clearly but treat it
>    as an exception that may lead to complications in the future (e.g.
>    incompatibility with VIRTIO over TCP).
>=20
I don't think it a violation. It is an extension of a new model. PCI and MM=
IO will support it.
TCP transport may not be able support everything that exists today in PCI.
But I am not fully sure at present this as limitation.

I will consider #1 later in this month further.
This week occupied with the LM and flow filters that we want to review on W=
ed meet.

> I think it's worth investigating #1 to see whether the virtqueue model ca=
n be
> extended cleanly.


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

