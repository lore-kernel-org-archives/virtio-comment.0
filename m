Return-Path: <virtio-comment-return-9071-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E3EC48292
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 16:24:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C95681338CE
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 16:24:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9E01E9865ED
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 16:24:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 86F059864BA; Mon,  5 Feb 2024 16:24:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 777D79864C1
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Feb 2024 16:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=da/BCII+mq+FiLWRBxBAsSE52vZOVLUxF2qeOyL2OZ7GhwUDIpIEaK6yN05DMI7mzamhFucYd5kWBK/3Y5iRDSuCILMg84uc0BnsgwXvt72pEhzg+SRSPuCoGWWG4Not/DmGhdBliZydjzg47Ghyg5Yb2aSPIa3txWKGoDT64FlKmZL0L9MkkZxTrfq97HtudqYCkAjYbkJ6J8/hzIGcX4ngDMQLALJL04DSN+/NVLIp37hkaM1ZrBEvjCrEVAbKKBfiAYmtJ+Fdj5Z3DawhfiFATbPL86dpm9MJfEwN5oAdvdamo04McVuBH3y0aPN3+ajW3XKACatXpbTm6oqHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohwAhwe7gWQcbbOT4236eNABHyJ0bW8tAgRxEU6nPPo=;
 b=gOBsdw7924lcV9ozekvjfN6QZKTR3kM3C/zIAuXB2UEiJCpeksWwQgni4ul4yU/SpbWAWnkTMoK0niyAgIHvEV3zWKekUtzb7AYpctYLLWbDVKKsfkLV1rTVhuAsXX01sT3Ahw4lVK0RtCY0Y7rJ5VkpEj/HdRtKiIA1zXSlYgoyEPk/1LtQNG/t0nr5PKUQJ1DlH6UWWdxCASWezcFrgxKvWKJoX0yoosg5Jr17K162C6ehALgAUBmdjlq/sKtbe4nT1Av+hdj3xeMUg9Ct1alIKJWo69tT5mXDgg2X1EU2ea2Ru17m+I7wRbFcFZX8wGgT4CVFVbeI+7PdV0XyXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"yuri.benditovich@daynix.com" <yuri.benditovich@daynix.com>
Thread-Topic: [virtio-comment] Re: [PATCH v2 1/2] virtio-net: Fix receive
 buffer size calculation text
Thread-Index:
 AQHaR5W52J2qfmVC+UWFja2twvUrIrDbFOyAgAC4IFCAAHrbgIAABXdAgAAVRoCAAAmUcIAABKkAgB+NYwCAAAxA0A==
Date: Mon, 5 Feb 2024 16:24:04 +0000
Message-ID:
 <PH0PR12MB548197C15EB3731B7012F9F1DC472@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240115093141.3539316-1-parav@nvidia.com>
 <20240115093141.3539316-2-parav@nvidia.com> <87r0iimtrg.fsf@redhat.com>
 <PH0PR12MB548114CE959557968F5124D9DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87o7dlmtgo.fsf@redhat.com>
 <PH0PR12MB54815BB31B88DB812507A8A4DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87le8pmp16.fsf@redhat.com>
 <PH0PR12MB5481E369486C3B9DA686CF74DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240116082825-mutt-send-email-mst@kernel.org> <874jenj5vf.fsf@redhat.com>
In-Reply-To: <874jenj5vf.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB8799:EE_
x-ms-office365-filtering-correlation-id: 573cb65f-a852-4f14-9742-08dc2666dea7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DOwKsZV1mxCETEHuipjzr/CEqHLKvHK7EbfC9GGcRT6ekzIUB3shPViL+9XLxJ8RWEQb02hA2QHK43CwLErPdSAVVFW25/DgbgLPOnNluKtRpdH/XRvSILQ63ul7mMUQI1PAoGQc1e5Fr+V80pNvWK3exKhZg33IgQN6qTySKz9gRKneKc4oGVs1Z3EllCHnjL2uXRu9Puu8BoJJlnUw//Hllbl3ciyWaYUOabmHyItSYCNQ/I6GLfTY13ikhc4B4KBPzmMy8AIaVxlyk5P2bAvU1ld4oVwHEmHF6imjaINnjqM0m0e8KCOfOvIsjccq0VkXb7I2x60vMp0ZyFBZtiJ9BI0ovhTkRN+2tGKd9QOyk6Ydl7MSJZ3PyNRADXg6RcWUhCZgSAvO4yLXzW72+0kzVsRvjvVPZImgBB/VhbF2lvmjoI7gyrStZny4TDP/rVMnho/wKDbNWit0uxRwJ0dXWFD1KE3WO4Cd8SGREPDcw3g5ag0SWtxbsGHYp9kcgm2DLYPMqM1xGn0KiuTdO2z8snGtpopyosImvOOUffYLMVGQ+CmVND+sQ4QCy40i6sHkleIEdr+wvLA9t2/Q9Fk4GIyzBdOfhR8NzDT8B8oxvWM9784MG3mzUQcUwXny
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(346002)(376002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(8676002)(4326008)(8936002)(316002)(55016003)(66946007)(86362001)(41300700001)(122000001)(66476007)(26005)(110136005)(76116006)(54906003)(33656002)(52536014)(38070700009)(9686003)(53546011)(478600001)(64756008)(71200400001)(66556008)(66446008)(6506007)(7696005)(38100700002)(5660300002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EkGwsXcxfvDKUJ9mmQT54SZY3mqRGXmvZ1T946kg3aiXBcbxuiqiTjfce7WL?=
 =?us-ascii?Q?UHrse88lq7IRxmqeQJHJHmBLho2X/5fVmTFkpk8tg4y8PX7q9hk8HuyUwBbi?=
 =?us-ascii?Q?LhGthIWCruTpZNGv7xvfQ5b4m54gtU8smOXXIg0wwmyI48z0My6U5FeoLUvq?=
 =?us-ascii?Q?7fc8TmOUeixjNwAaU/6lCdOGAObEZn/5meIChW+cJI0x7BSdjZfrjjn0wE1T?=
 =?us-ascii?Q?wn5KKsIGhFEUtP9z0tN9mmlQWgYpYGqa568Yg/DL42HzwVTHulBlzwgjeTo4?=
 =?us-ascii?Q?NgttiWASX+0nWyC77B5pgQcUeGTUH99IFiAW6ohqtDFMu4KUbK/WpZc7T97M?=
 =?us-ascii?Q?a/gFJiCGZiLA7cJByHQbNBT9DwQLVLMKGfEGPwJE37HaVNMZ/omKCpdP8vEv?=
 =?us-ascii?Q?8QsYLpYR9QwTx2IziB7tLDSTZ81JM8sqTJGB3+0nPyqcwyvOPjrPNnlKkkf2?=
 =?us-ascii?Q?/YFA7JIvzfbmz3cVQx7JK5wW7avkfx7rr9aQSxnSv/rNaj81QNhaPFa3gpmM?=
 =?us-ascii?Q?t5nahGYizO1mwip2lbO1jdRP7uUmTvvpl1M2tssvz3GHbSytIuYmNd3jp9LP?=
 =?us-ascii?Q?79sGLMFVWnbOWnTeFqoQ/vg/15xRurn0HymmKmXxmBieir5P+sE3ku+Q4hXM?=
 =?us-ascii?Q?GJHOjGiopnCMqHoWNxY5shRmhIWOKN+doVLWxizcKwZS5j9c/G9Sl9Lvv7QE?=
 =?us-ascii?Q?58+ucdcsDGQ1ULNwnO3EFYEa7v6ARUErfOWSZS843ydw/3epph83Ajg6FbFf?=
 =?us-ascii?Q?2svS1FbAS6bO+Rb/HwA2dIhiV+xCqBo++JtFnFugRkKvbZyuh4prt7lYU8sr?=
 =?us-ascii?Q?mD80zIwKT5yYXfAUFaeR86CEZNS564VeIQlUvvBqvHraE132/zQ21iiBtgMS?=
 =?us-ascii?Q?XmX4q+UcA2/fgfzT3BI4OAUzFTWczauenmOb7JPgEuBWZExOuCo+R02/DWiX?=
 =?us-ascii?Q?fG/pOb3h3zvJSmBOOx2VneIYZ8+VLCZHt8Tr6pG2GMQBJ35MD9N/5M3OsH6x?=
 =?us-ascii?Q?F3P/kzQ5yU5foq/a1VqeRJ4LD+Z1H7Fbbry5gwhgniROQfiFno82ahREr0XM?=
 =?us-ascii?Q?OURCZkPfOLnVMXGVK7wtmMzt4R75pWbKl05yvKNSfon1Toe5HzLtsdod2ePr?=
 =?us-ascii?Q?fgWr9+ZB3NRyf3oXxu9KiGsot9hQ2ZwhrCWJdD7/VcqRot+cw1YDXMVBRhhY?=
 =?us-ascii?Q?sXTuKZTP3tVD1PtUGcCu+7JCBr6uel2jY/rmos9lAMZnxBjkkkVNtS5pmb5D?=
 =?us-ascii?Q?xdKyLUYUyiKuo1UPorwL/zqb/L7vJqqq/AhcxMxWwr5ADOhYJcneKkQoH8AH?=
 =?us-ascii?Q?TvwZHRTHUraj+484Yhi71DG2/l3fLW9e7d5rZ33NvMvjSyVz7N3NvvtMbzuZ?=
 =?us-ascii?Q?/8DvfKXPfIpbHHyPfo19iiInGzxY/9kMu59XP+Clq1+0/xfwVi14e2T0abrx?=
 =?us-ascii?Q?WvBdbVl4VBH4d3meKvzEv5hIHSkqhGoKgOKMIbUOUtR7bzqYSFwsSgCP1iuF?=
 =?us-ascii?Q?qZ8FVBAdbUhoolctoRZAQhf6OOBaNfXnaRnQbhVzOQjJb2mQqkYQMEFNgbsF?=
 =?us-ascii?Q?saHiDJ4RLX9ZdQU5/cU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573cb65f-a852-4f14-9742-08dc2666dea7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 16:24:04.3697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 25XoB5fLo2SKTf1CjWR2EJ8pCjJEvYoXs10+wln2V4glw05/LDFlAeuqVvdlkA2P8+6AqKAMmfZvoVqchgO0lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8799
Subject: RE: [virtio-comment] Re: [PATCH v2 1/2] virtio-net: Fix receive
 buffer size calculation text



> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Monday, February 5, 2024 8:50 PM
>=20
> On Tue, Jan 16 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>=20
> > On Tue, Jan 16, 2024 at 01:18:59PM +0000, Parav Pandit wrote:
> >>
> >> > From: Cornelia Huck <cohuck@redhat.com>
> >> > Sent: Tuesday, January 16, 2024 6:08 PM
> >> > To: Parav Pandit <parav@nvidia.com>;
> >> > virtio-comment@lists.oasis-open.org;
> >> > mst@redhat.com
> >> > Cc: Shahaf Shuler <shahafs@nvidia.com>; xuanzhuo@linux.alibaba.com;
> >> > yuri.benditovich@daynix.com
> >> > Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size
> >> > calculation text
> >> >
> >> > On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> >> >
> >> > >> From: Cornelia Huck <cohuck@redhat.com>
> >> > >> Sent: Tuesday, January 16, 2024 4:33 PM
> >> > >> To: Parav Pandit <parav@nvidia.com>;
> >> > >> virtio-comment@lists.oasis-open.org;
> >> > >> mst@redhat.com
> >> > >> Cc: Shahaf Shuler <shahafs@nvidia.com>;
> >> > >> xuanzhuo@linux.alibaba.com; yuri.benditovich@daynix.com
> >> > >> Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size
> >> > >> calculation text
> >> > >>
> >> > >> On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> >> > >>
> >> > >> >> From: Cornelia Huck <cohuck@redhat.com>
> >> > >> >> Sent: Monday, January 15, 2024 10:14 PM
> >> > >> >
> >> > >> >> On Mon, Jan 15 2024, Parav Pandit <parav@nvidia.com> wrote:
> >> > >> >> > +The driver MUST consider size of field \field{struct
> >> > >> >> > +virtio_net_hdr}
> >> > >> >> > +20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12
> >> > >> >> > +bytes if
> >> > >> >> not.
> >> > >> >> > +
> >> > >> >>
> >> > >> >> Requiring the driver to consider the size of something to be
> >> > >> >> its actual size seems a bit odd :) I don't think we need
> >> > >> >> this, as the
>=20
> My comment here still holds.
>
It is a variable length data structure with few trailing fields as not vali=
d.
The "actual size" depends on negotiated feature bit, which is what is writt=
en here.
=20
How about below?

When calculating the size of \field{struct virtio_net_hdr}, the driver must=
 consider all the fields
inclusive up to \field{padding_reserved}, i.e. 20 bytes if VIRTIO_NET_F_HAS=
H_REPORT is negotiated,
and 12 bytes if not.

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

