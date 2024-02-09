Return-Path: <virtio-comment-return-9098-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246A9C4828F
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 11:46:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6AD072B07B
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 11:46:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4344A9868F3
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 11:46:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 28D729843C0; Fri,  9 Feb 2024 11:46:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1A5609868EE
	for <virtio-comment@lists.oasis-open.org>; Fri,  9 Feb 2024 11:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbubfAuhqLF0dXdQdE9YZ2mUwiYkfxZuS+61Q7ZxTsRbd8q180zxuWyAea2aslVjWIO6MMVsN151LWnlwwPKa/Gjo0JAu9XJqDPaFS+iNpQA5Qm55zg50iTtQ91mKiIaMHRTbdN84aAkIneIS2dEL06AJ9yYqnuCjtweZ6sz0r32ACETthuUACxXFxwgYhmoMBenVRabGPBsMuB5JM+wlT+X/qPkrf3Pwiae8OJv1eg89SCrP/Cr54n8NsJ4alEv/BKe1zjx+r3+C+C+GhzSrZYC2yVg4bxZDv7uCmpXDcWOd9JtDdd6cJginsByTKKP73M3KOY7VqgAovVmbcSsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ej6fgqawhtTMBlC5GsweSTryovOxGcd3WX9E6NSTXo=;
 b=H0q8tD3GlXHhDs4OEZa4uoeCKepqW/ue0yoHIMubXdUeskRjvGRjaVwG5tMvrITCZvCxq1RLbefY8eB0NmMMpWt4VqptgMvXIT9EZ/kR53RcVI+9bcBgoVRG5fSTHf23kdDejoBqYHIJakSTHIk7ZAEUqyTK+RF+QGq9BYJuoV63bKAmfPjyr5U0/1yirZ+0GI+wUg60oXebt+laPCJvj4zXIFoaXpVnqd3Wm1cd1B8VEyUFQlHMW+yJNepLU2TimMQQT5uZQcwWXcVXnPncwHRlwrxR4wDfnLCzKBoC5hC2Y7EzIhwZ0nm7uq/uA7RRrqnXqjlQHRVFduKA856SIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"yuri.benditovich@daynix.com" <yuri.benditovich@daynix.com>
Thread-Topic: [virtio-comment] Re: [PATCH v2 1/2] virtio-net: Fix receive
 buffer size calculation text
Thread-Index:
 AQHaR5W52J2qfmVC+UWFja2twvUrIrDbFOyAgAC4IFCAAHrbgIAABXdAgAAVRoCAAAmUcIAABKkAgB+NYwCAAAxA0IAGAT+Q
Date: Fri, 9 Feb 2024 11:46:11 +0000
Message-ID:
 <PH0PR12MB5481EBC58CACCA6CBB9D4C9FDC4B2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240115093141.3539316-1-parav@nvidia.com>
 <20240115093141.3539316-2-parav@nvidia.com> <87r0iimtrg.fsf@redhat.com>
 <PH0PR12MB548114CE959557968F5124D9DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87o7dlmtgo.fsf@redhat.com>
 <PH0PR12MB54815BB31B88DB812507A8A4DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87le8pmp16.fsf@redhat.com>
 <PH0PR12MB5481E369486C3B9DA686CF74DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240116082825-mutt-send-email-mst@kernel.org> <874jenj5vf.fsf@redhat.com>
 <PH0PR12MB548197C15EB3731B7012F9F1DC472@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB548197C15EB3731B7012F9F1DC472@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB7583:EE_
x-ms-office365-filtering-correlation-id: 5de55947-12f4-4297-602d-08dc2964b685
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1npCEYxCGH44Cn5gFpiubX+LZaZ65IH9tPEv6UsdMYnktFlXsdCjXorQc7qQH0ijhAoZxcl+C4gBIxtm5ScTu2KkUJ30pWp7ARuq0o9bvfxrn75w/1kQ3ISf3Q8ay37pAiScIz1Yd7xQgzoh/xLgcskjc11Lvql8oso6l3LrH5ZYATojCgN49FHXTMYDBGpF4eeUy4Q8wAlQCgRLxEkrXvkBpicffreP1eWAB2j1FQwTm7dzCCzqGKesOHbYCITbh2c8XRBtGnUEpq8b88OodnekWmOF/wZAj7yetKLBTYLp/7edRDbekDW56CvCYREizrkz9k11PV4bLFo8Uu4PNC2r4WWR9WTH+TCpqPUoxVQ8IiTS/tShnht5GM3kZt9ktY7jlJ5Lc4t2hOH9Zk678D9dre2rxj39DxTgDDd57LU23tHwzTm3HPBSW/Z5DKnvnldo5bvVS9M0k+q/e7UcsTxVjRJQCcP7HDwjVC/suVpm9/fPWzwjWCWfuhdBEqRSYxRDho9Ge5BeCzH/P9wVb31h3+V1n8+8NLFnse4gY7MWEp7O1ngTw3fgdMpERZezoyGQtpk+a69JGZpVF2sv1k6sT1Po95GMWH8zlnKGtccRy2M4VsX21K9jIwoWneMV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(26005)(110136005)(66556008)(54906003)(122000001)(8676002)(38100700002)(316002)(6506007)(7696005)(5660300002)(66446008)(9686003)(76116006)(2906002)(478600001)(55016003)(4326008)(66946007)(8936002)(52536014)(64756008)(66476007)(86362001)(38070700009)(53546011)(71200400001)(41300700001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MVT3ghhWE/YMUMe38z9CviWOqiNnkMQJImEgdaRd4h+sHZ7h28cjwMCa8Luj?=
 =?us-ascii?Q?eq2ELOG+4RlADM2etz5XnkX3vkaBPtdoA8+foFmkHiQWkVnuSpUBmz5l4iXC?=
 =?us-ascii?Q?OULy0+Mh8RMDBOv9Acw7CNgdybhZhdopDKrMz3GPw8u89mniVqKlrKlSu04n?=
 =?us-ascii?Q?FxNXe5H2c54DQcRRBJ1vjg2KgeKnIGvvN47tAzm2AIUlTt6IPYW7oDF2ST/Q?=
 =?us-ascii?Q?D/AUJZXOlnCfpkhYf2WU0H4FNYivCeUuJAEUJMPvQ/KEe0rKBV5FVik+tnNw?=
 =?us-ascii?Q?i0GwU7uyX5LhWCzdaJTpvAOfYNlyjDAkxnfG8PsvGP/6l282IUEbW1o9sCLw?=
 =?us-ascii?Q?1Pr6cPb5+ZtTdduegWXkFRdkwj6P0eOm4e9ATB+AJwrRDzJvtPhllFFkL4Zu?=
 =?us-ascii?Q?+JpEJhACoIOdJjlxsQVDB9ElOrvJmcG67v45iY5PsKs0iKGMWxirvlNvn3WM?=
 =?us-ascii?Q?2UNzeNn0BtkgzTIjwPHNYZfYjZMx7KIZkHYZtnaGKAjaWJc2M9RaX4hAtrPa?=
 =?us-ascii?Q?EWhX9UtFSFmJjko+meKTXifVZ0dpZDfXrJpUNi3MhJ8udimQpjGo2LUxfKwc?=
 =?us-ascii?Q?Tl8wRspJfgbc7/6bOdg6tioTA+a8YhJNqUkQdfI5rwJMRoSykvBmu/ycjLSN?=
 =?us-ascii?Q?luXcqXuFA5F/oti8ORXX5JRWz+FTcCphJMxP/hh+krCdDQUN6LqDGSFA68Qd?=
 =?us-ascii?Q?n5BAVxcU372XRjuFX65tlKUAdzZbl6k2ce3jDRUDLWPx/gnlAbDYanwEImgs?=
 =?us-ascii?Q?fTiJO2CUhiucDASc71i2OPKXTkomtNcT93gOpgP6hzfTp5hYvL9dMl/H7IR5?=
 =?us-ascii?Q?FGTYvcAlNgb/Ciy3ozyFuvxOre4C9rodxr2XZG9XOB+3pC4yh/wLllI0HLV5?=
 =?us-ascii?Q?91YWeX6y8U+qOROidsECaWPdiQQx9BHMLX8QXXkkqGZjG/VFyf02d5YjJI2G?=
 =?us-ascii?Q?fL5Mor9SQ8drGqhM0IcbrlSsREJbupruui6etElSm0SP24A6pnQsw9QrdRe0?=
 =?us-ascii?Q?3yWWb236JSpt8k/gDWQ2qjhzkbHJ9l/Koack2v6vQI5oa+++Qv2U1RyjVXHe?=
 =?us-ascii?Q?hgONcayZgKQUpWxmX0+ZFGn6KrtGp40vZ8X6u1oaSVtF2tyfCljvg5ZIHVrd?=
 =?us-ascii?Q?XJG5OwZu38fAm4s4rlw8GgrY+P7gRsbUxA+FQaBoDaCOSNkHw2iDfsEqQMeP?=
 =?us-ascii?Q?5wNVqLSMHkN62HRPxdRBcfvDgqGpeLXdzifptCtLtlAUSn+y4SFFET7k0Unx?=
 =?us-ascii?Q?g8VRdv+X4RF2rQaPEzuNycUQANkU9vjaaPDKy/jXu5ADW4nPYxSgVWrKix8S?=
 =?us-ascii?Q?57+OkE1l7QjzYsLodhUhMLUuqM/yuvnZ6tQPbEOagAmfIUSiS7owTvkXdX4u?=
 =?us-ascii?Q?3sC7UXiPDR+y2AWao58rsjpE+ibuaB0QFH/0o2jkrS5pnKEc1roBCEkQHMlJ?=
 =?us-ascii?Q?7hAmqiLUPs6s65+9m4I2gJ8vi7sqlvi386nqwxgky8nlTR2/RTuQH//INrWs?=
 =?us-ascii?Q?dUaP8MANqqBgwlO1fc1z7DySVqKrUg4/ZZ8YIL0Y2FVJvtUfQjqAzuogyoZl?=
 =?us-ascii?Q?gKXgSEVlLfgjueoxjos=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de55947-12f4-4297-602d-08dc2964b685
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 11:46:11.5346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vpfeT2MPi+slhDaaPK1id3Ak4/PEHTjJish+qTHEFmfXPF3XIG8GY56bqTWUBDKuCBh15mKsoI10QXA54d0kqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7583
Subject: RE: [virtio-comment] Re: [PATCH v2 1/2] virtio-net: Fix receive
 buffer size calculation text



> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Parav Pandit
> Sent: Monday, February 5, 2024 9:54 PM
> To: Cornelia Huck <cohuck@redhat.com>; Michael S. Tsirkin
> <mst@redhat.com>
> Cc: virtio-comment@lists.oasis-open.org; Shahaf Shuler
> <shahafs@nvidia.com>; xuanzhuo@linux.alibaba.com;
> yuri.benditovich@daynix.com
> Subject: RE: [virtio-comment] Re: [PATCH v2 1/2] virtio-net: Fix receive =
buffer
> size calculation text
>=20
>=20
>=20
> > From: Cornelia Huck <cohuck@redhat.com>
> > Sent: Monday, February 5, 2024 8:50 PM
> >
> > On Tue, Jan 16 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >
> > > On Tue, Jan 16, 2024 at 01:18:59PM +0000, Parav Pandit wrote:
> > >>
> > >> > From: Cornelia Huck <cohuck@redhat.com>
> > >> > Sent: Tuesday, January 16, 2024 6:08 PM
> > >> > To: Parav Pandit <parav@nvidia.com>;
> > >> > virtio-comment@lists.oasis-open.org;
> > >> > mst@redhat.com
> > >> > Cc: Shahaf Shuler <shahafs@nvidia.com>;
> > >> > xuanzhuo@linux.alibaba.com; yuri.benditovich@daynix.com
> > >> > Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size
> > >> > calculation text
> > >> >
> > >> > On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> > >> >
> > >> > >> From: Cornelia Huck <cohuck@redhat.com>
> > >> > >> Sent: Tuesday, January 16, 2024 4:33 PM
> > >> > >> To: Parav Pandit <parav@nvidia.com>;
> > >> > >> virtio-comment@lists.oasis-open.org;
> > >> > >> mst@redhat.com
> > >> > >> Cc: Shahaf Shuler <shahafs@nvidia.com>;
> > >> > >> xuanzhuo@linux.alibaba.com; yuri.benditovich@daynix.com
> > >> > >> Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer
> > >> > >> size calculation text
> > >> > >>
> > >> > >> On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> > >> > >>
> > >> > >> >> From: Cornelia Huck <cohuck@redhat.com>
> > >> > >> >> Sent: Monday, January 15, 2024 10:14 PM
> > >> > >> >
> > >> > >> >> On Mon, Jan 15 2024, Parav Pandit <parav@nvidia.com> wrote:
> > >> > >> >> > +The driver MUST consider size of field \field{struct
> > >> > >> >> > +virtio_net_hdr}
> > >> > >> >> > +20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and
> > >> > >> >> > +12 bytes if
> > >> > >> >> not.
> > >> > >> >> > +
> > >> > >> >>
> > >> > >> >> Requiring the driver to consider the size of something to
> > >> > >> >> be its actual size seems a bit odd :) I don't think we need
> > >> > >> >> this, as the
> >
> > My comment here still holds.
> >
> It is a variable length data structure with few trailing fields as not va=
lid.
> The "actual size" depends on negotiated feature bit, which is what is wri=
tten
> here.
>=20
> How about below?
>=20
> When calculating the size of \field{struct virtio_net_hdr}, the driver mu=
st
> consider all the fields inclusive up to \field{padding_reserved}, i.e. 20=
 bytes if
> VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.

I will shortly post v4 with this as there is no objection for this one line=
 change.
Thanks.

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

