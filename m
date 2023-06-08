Return-Path: <virtio-comment-return-6247-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368A9C7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:57:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7C4002B012
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:57:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 648DA986670
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:57:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 509ED986655; Thu,  8 Jun 2023 14:57:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3E44798666B;
	Thu,  8 Jun 2023 14:57:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NazJ9iqg5Q3hSxd9jY6YYYOqgS206DnDLHJkJheghgMDwTdlnBtFjrQpk6lxVnfJ1FKTiR4FAxwJNPtSDwV21ODRF9Q/uciagga5XyDaG96wZQMdoptjKNEuCZCmnCMZMK5Tzcae30p1c3qM4Dz2YvR0JSrwtVZRC5mMOAEpl4aMzQz22bWguvnQ/rYd3+j3KUhHGYzS/gDR91mC3HqyTsbqTnL4L+yVaOomhLrAsxv68h4JOKHFjH/snfiH8mYiiN3Ftu3rJnFoJaKl4lOdVgP7gRbh5hrsAc23PUuzjO50JAOBfLtOYkOU3tH/l9WAenvrju7YFzigc73qKbpgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+RVXyyTr/LkFpFlL/cJ5vfG6VVvQWVgQfuElN9PZvw=;
 b=f+5Rr/5iqoTHOZrCjQcWBNtC8bJgRpZJ/8lmXXzq0I3vbp3bvcxeaGvV7DNGNoEWbdr0LmsSO7PWg1poI7PHIlUWqjjwWnnrBVtLXSWv+OT2sofyD6BIkx8K7jrwRkUNZcVHMWHeopgEB9LxAYM8+JNuET5jxODt8HY3cXKgAcdfeMoF9/BjxLOjInHtBZpVnyl7DxC904YFg1bSGsV5TXQ8cDDgtNQJ9tfxSVmQOyXknWLB05YsZs8yy9nCt0syG710NhzzaK2V0NjMPRfreCl5tdh0J+rLN6Bjz9INb38S624qjGY6TpSA24UaCcrT5wqAo5D9DupZ4Q/JWeftSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements 7/7] net-features: Add
 header data split requirements
Thread-Index: AQHZlNTqN2vMFZKlIUSBfZfrilGZLa9+ZmsAgAKelwA=
Date: Thu, 8 Jun 2023 14:57:04 +0000
Message-ID:
 <PH0PR12MB5481916E44050BC88DE941CEDC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-8-parav@nvidia.com>
 <20230606184022-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230606184022-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB7692:EE_
x-ms-office365-filtering-correlation-id: 51689538-e6b7-4637-5daf-08db68309f6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bXxZkSe0OD/O8JZf0NsMZjXGSLVCV9v+I5j924Ot5HFp+P68SEwffezVrBLirZtnN2v4T0krQrfl69xdGBSSCrTR+9rUYWaDSOPEVSgD8ZN3vVAWU2lMcSYeg/YQUmikOwqzcf3wEpIAQ2PDmovitFRmunLuqz5U5In755YCsnntorM0Bwm6buI8IxjT3JV3qPLEoVDCcVqVBNZjCsOY+dQeHf0JRzg3NlVb0hPwuh8i1LyKne9B9d+364e5SKK4ZGDtiAdq4+O2DZYtFtJJtAGLY3kRlr3voUntft+gXOOmlQC3YrxfaXNCjJAFtuiYwbyfGp/qPw4KQOSeYWME2al16vZRg/oiyIrg/xaF6mYIwePEl6vqO7Pox+yj8IUKwo/rG+jEZ71srr3n2jE4RNx0t1HH3w/wf5T61G+CoJeqNnoLe6IMZ2ePru/hmzyT2Pg1bBIImoi0nzdhGSxFIJIA8mL2rgQfgeFVjoDAGsxfW2M9YCqslG4uHqJZm+XtX8zYEjuBcLn/dbIIW34xFl20nFw68dtdyaa95FWuujaY+6/ir/NAc2EugSuUpmtOgaeVBexNQZz07sUulggWjaQbzQdXNaI0wgCOytnIdOUg89h8E/tk/hddVjayZ7dX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(55016003)(71200400001)(7696005)(64756008)(54906003)(316002)(478600001)(6916009)(8936002)(8676002)(41300700001)(66446008)(76116006)(66946007)(38100700002)(4326008)(66556008)(66476007)(186003)(122000001)(9686003)(26005)(6506007)(52536014)(86362001)(38070700005)(2906002)(33656002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?me7wsUBnt5WJHeGaXEWEgC6N76rR4luHVZ0j3Rs4yfjy+9xMscWQIshztmAk?=
 =?us-ascii?Q?i7Z4JOdk+y9m4n46yY6i1sjRAGuvljPYOWxH0OnUv36V+V2vYem2PJJ+s23f?=
 =?us-ascii?Q?+kSOzFilJL9WVWAEGuoDf1j5oRVTDSx5ii6BshSDs2CxIMcWndW5dZmn8GIv?=
 =?us-ascii?Q?UuS4Rk6ZfPON30C+IHa6s5tF2MMQ/Ei3FWJfBGIAb2opjuwIwwHzXUSSWfJ4?=
 =?us-ascii?Q?/SxX94Y7Ahw04elcb0tJsCUwqzcP5sPtahLRKhb/CGINl/jE7L2FrVDYowYP?=
 =?us-ascii?Q?GXhU8JIc6EimgTC65PN8U2Tf54f7c0AFaqhsjedtBsCF2zMdmYQjjV/lNcEt?=
 =?us-ascii?Q?0uLx7S9wjPccYw2gMauJ8TKYv2oROZb6j6Zwr5bizlCjH0ySa/gY0W6yFM/r?=
 =?us-ascii?Q?2lVNAQVRDTGFsGcGjn/NECmyxJhNKHEd67gprN5ZC/Ju3k2oQMsXY+skT63g?=
 =?us-ascii?Q?KJcEIQn1f8Dfi0V9E9V2bRTnlt1F+m5iGwGWAE1nJUxtZ180Lk/RL13NwvfS?=
 =?us-ascii?Q?2rehB8WsPMV1UEb+/+y0B4IoVW0i/GKIjKe1SmF3gRDYyJRH08e3NjkbP3Sm?=
 =?us-ascii?Q?Emq8oI2nkVgNHNAxZb7cBCSl6w1vh2/1XpGkpzuDhiCUVKca9qgm0tgoYqsi?=
 =?us-ascii?Q?U1kT9cCV8O7fUx+n2dhqAT3+A27EeEHKHcObACHe2tIBRGCK7G8U9JxHDzw6?=
 =?us-ascii?Q?WubNOpklI6sPgvukBrG4VQv4h1MnjjWGOgzLoHTZOnjzOOjWJKCrZIIU9xrh?=
 =?us-ascii?Q?hRhDaRwzwfFmNEvBKNJ2jCOBkQcsk0VLpBQf31WBsHzaOKmH6FyCgD2ec+yT?=
 =?us-ascii?Q?CMV0NL27nB0K4eJ7FbUPfNd+078N0woHSj3AwUaibWAZWJ/yVUPsyGvwlXwu?=
 =?us-ascii?Q?RiieM+7YhY5jvLS5492a7g8HOf0VpmvqruxWuDWkA9pRJ0OBVhJbFwvGWs+n?=
 =?us-ascii?Q?bd9oIwlCuhKyCf6bZUBJviuvvaXyUnMbbOLBMamrVXHbJSOr7/0mqLYqh9B/?=
 =?us-ascii?Q?l1F/7Elv0SiDJy6nOT7Lcj8B4n439P0EbPJ+JZq1HFsg4MxEPf/5OOs9um2U?=
 =?us-ascii?Q?Wncv9XGLfjn9ti4DjdH4o6Zf+zEax3pPdq51XwPdZu7MxTcqTbrl8aPUvSXO?=
 =?us-ascii?Q?4UEZicc0nNeg4DIsUXkWKattJ6lPwApAKTHh1Jr2LEtTOur5g3v3anCsFJH6?=
 =?us-ascii?Q?N6UPk+2d6xfL2/EI2bOt/bHispOtts5Twu9LfW0VSDKOdUK4edxsrq9BsSlZ?=
 =?us-ascii?Q?vZJtGwOROQ4blkS5fDvzugLh10KzfxtGPZmi4S2P5JcdOdljZcoszAgRlkPA?=
 =?us-ascii?Q?Ng66yJf9sGZSINcEZnpgN3LzhFK+0RMhHYWfueKDlQooUUK4P9qWrnB/dm7M?=
 =?us-ascii?Q?E98M/SO8Ukhno3xxGN4bt/ZOEjP0+J02C1GyImLDOYwWftjOI1799k828ptY?=
 =?us-ascii?Q?i66+aXSM3JkpvfyQWWd0D6hqMAUkv4J8YmJ1wpYwk64v6LnGiVzzllW4Uwy+?=
 =?us-ascii?Q?cq8O41FeAoB+SP5Oz0KDzFP7TTZZdUthnEw39tuwupWQH06dWbr4XrOWzBIi?=
 =?us-ascii?Q?QtPBF/9cU9oUDkCO35I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51689538-e6b7-4637-5daf-08db68309f6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 14:57:04.4928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Ot6LYKCNrv7XGAjzmGkLO/BTmdlLeQlgFFUGPS9p2S/iJDhbZUQQeiejdiEGsr36TvoMsMI6SscTqgzOS6iGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7692
Subject: RE: [virtio-comment] [PATCH requirements 7/7] net-features: Add
 header data split requirements


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, June 6, 2023 6:42 PM


> > +## 3.6 Header data split for the receive virtqueue 1. The device
> > +should be able to DMA the packet header and data to two different
> > +   memory locations, this enables driver and networking stack to perfo=
rm
> zero
> > +   copy to application buffer(s).
>=20
> what is header here? which layer?
>=20
Usually L2 to L4. To be defined further.

> > +2. The driver should be able to configure maximum header buffer size p=
er
> > +   virtqueue.
> > +3. The header buffer to be in a physically contiguous memory per
> > +virtqueue
>=20
> this is a requirement why?
>=20
Because fetching individual buffer memory pointer is sub-optimal.

> > +4. The device should be able to indicate header data split in the rece=
ive
> > +   completion.
> > +5. The device should be able to zero pad the header buffer when the
> received
> > +   header is shorter than cpu cache line size.
>=20
> weirdly specific.
> how does device even know the cache line?
>=20
A driver can tell how much padding to be done by keeping the cache line spe=
cific details in the driver, but only telling about padding size.

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

