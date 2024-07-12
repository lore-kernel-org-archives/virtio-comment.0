Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04134624
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 13:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720789842; cv=fail; b=pWr46hLs8gLK9HaGNy09FrHWRd/XUNJ0IbDLeBYqVq4H20tn0mWsGGz5jrspGY8TcnsL40+r7ARPyDkAMMlOOFU9fMMM075f7lWNlONSlpt1t2iKhmp+d8E9A6DC7DfPt69Z09ZrApNcldWn2tplf2L4NHxZl643iG4r7YwZivU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720789842; c=relaxed/simple;
	bh=X8aHC3Fwv0TrioBtgSY5aLZJuDRDdCkqdrkybIMwotk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Xr2jnfbeG0D488EASDaP8JwZ2MkOPjegiEY+NgzPM+VsjBEoyENY4JKHovoVZKiPu5Xq7dh5EvpxMpgOQpM64SqOYsuTJ8ARdWz1W4omLCfI3qoOvMLMXJDRBC3A17EVjEWnsClVfenET0mIXrmE74nvdqQb7NX6jyfc5nwh4qI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RZG88QBw; arc=fail smtp.client-ip=40.107.94.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RZG88QBw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONqD0y/XyGn37lR8a0QW6RuvW3XrQE17aAvhQtx6gLetViFOSVsLaNuUW8TkY2JWzfdOstiQCv3DoP7PT9ys9LBjzqnk0lkvhUr1QutGtRf++Uh760vSpnnKgfObiDPmkTh3QLuAhAyZc8qFsxpyTsFg1Cl+Yyl9Yb0wvBEZYl2ihMuR/hhZbZFShJBZL1jOrTnRGuahD6eL0QKSN46g+Hnxp72oHuzm+QOWwMX4rG8BC2UdbaYzDv+rUkBXrWDcJzH0+5yt3NZP6x4uqKiKPA1qjX/UT0a1Gis1CAeUE3XbHn8uWxl76eS1YMEDK9TDf+k869bfVWxEtbP5ztoo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SO1GgP7tZeXvAoVexDnS2jU1ev6kxCEXCNb9X/UA7s=;
 b=bfmZZZo23LC582CkHHB2UnVViHd/UI76hJ+YN5MXeEAeGW53Mq0/UYteUQv91659TiGSlhiEZfTp5DtbvIMOupfH6/wK3AzSYzNJYk4moIG8UqsmdXPJLEjbEFzvlrSr/aEkBkNsPjNz3O7DoFwGa6OYv1RUCPTn+J9hZO9WkuybROcn3MXHdUGtfzePcXP8FnRL2jkjUXTjvjCx+XkHIu1egxpPphhVTZzbbDVS9ifrzQKWRrbC9/88ZXz92LOBcuqTr3diWamyzWs/r+YYrG2OrxLGcj2DHY/X+LD5phNIxWiy/gqG3vxex27RzmBI6Tne5gNmIYkePuOSpnErew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SO1GgP7tZeXvAoVexDnS2jU1ev6kxCEXCNb9X/UA7s=;
 b=RZG88QBwkobiw4PlEikKUVmeI12NwrYIqLF6yQQoJQ2IlrsPltOrXNEcWmuRlNBjyIDKOdpoNTTH6IZDkAg7nELmnzMiINP7fok+UzLZJT4/DYcseGqtBf25JfXM7jknEQU3I1Qa9fL1NzZBI/PYhzUKxnnQ6QW4gmTtZphY7OB8HI3/oUoRQZoQg56Fe1SuMi9vEB7Y4UHw+DK/oQXoQupKxhpf2p+ONjBvruDYyN1FttZQMN+Q8yc8MiTHO8CvjoxubPlWPZ2uxmmsI/78KFaI8REQA0BGO015vdDDKYVgXJ8wCaHg8/Rmq2KBk14cpbN3Yx894NSoGQ+GCWwDBA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DS0PR12MB7653.namprd12.prod.outlook.com (2603:10b6:8:13e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 13:10:36 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 13:10:36 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit
	<pandit.parav@gmail.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Subject: RE: [PATCH] editorial: replace hyperref with ref
Thread-Topic: [PATCH] editorial: replace hyperref with ref
Thread-Index: AQHa1BIat6yqkExuMUOjMUW3abrvLrHy7TyAgAAkBnA=
Date: Fri, 12 Jul 2024 13:10:35 +0000
Message-ID:
 <PH0PR12MB5481A5D993ED79A9AC2BD53BDCA62@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240712041433.3246718-1-parav@nvidia.com>
 <20240712065953-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240712065953-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB7653:EE_
x-ms-office365-filtering-correlation-id: 616e9c0b-0d78-48b9-f8b2-08dca27404c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?BQ3WGg5GVV2i7h7Bza6Q7+cNZLcnxo3fUS01q3htNDi3yowFCiHlpC+fjrFT?=
 =?us-ascii?Q?/BLy5T/0vaMj27eOFLPYdukaCyOviocEQF6c0nG+waaTH5yPILGXJljVHiUH?=
 =?us-ascii?Q?E2DKaVY1WPaueRGKefHts4Uk4f41qc6nCPIJCKNBi3AT6vh9JduCAqTzp69x?=
 =?us-ascii?Q?nyBKrjifqOmWd5/ozbKSkmDH+GHRNKl64VcyfYM5fLEyCwJxvckD8AC7mgc2?=
 =?us-ascii?Q?bkFMjzERwPl3p61jS36TKizVUVNCkbWJYVmVAw8Ak1b1QkOwf/Li/zIc7uTJ?=
 =?us-ascii?Q?4kjhrSvrJ9Gp+pachRWwtIweFdp0vZYy0Y0MwhrV5nLjWueYtDDvKmqdYCt5?=
 =?us-ascii?Q?GX9us9vC02DQqR43mkzps1f44aye5DmQddtL6dhjmrxP3ZY/zJlpeikw/WGe?=
 =?us-ascii?Q?bjcV7RCN/b12XOzGPoDuooscfsfykXnWehd0vnM8zvNFxYcLpwkCrqCelYyA?=
 =?us-ascii?Q?R4ad0VDv1pX9W1qNJ0iysoLIA74LHkMo7mI9BO91SvXgknBpxfK/slwlxTS2?=
 =?us-ascii?Q?1+d3SCKGf3GT5Qu8QKcFkPMzDoUtA4JNyuf1YSYRO/OpOJfzdDpISXmKmxuq?=
 =?us-ascii?Q?//DyMNO60fgkGYMvfN3IhLZQlwQF1IpfBcKh0z/yzyf81adC0XDBkpMSzYsA?=
 =?us-ascii?Q?2uNdykw7aU7wlWAZ8blqQg1HgVsfvOXnAO63iOoHxkL2krKeGd0/Arg/yk/X?=
 =?us-ascii?Q?rjLaZnc4Q2g4M+iKwa76W5JZqe0qyQ29FshWkvuytAdZZw/BIKxs6ThwEztP?=
 =?us-ascii?Q?3ZqUjxcTru2+zpP3fM3nAPVweB9rXc4Dhz1elk+ZjSfxNqb3JV3XEO7ubgzO?=
 =?us-ascii?Q?iE+7tC6lxBx7BWWEAo4hijNDOyxEH+5kyedo66+qDjbCuvBgG1JRaDIFHJop?=
 =?us-ascii?Q?979CffhCx25k1DeQMeFtHoJK7xKoeLtlzfG+jvvZB5R0RQexJPZBqkpfU0k1?=
 =?us-ascii?Q?rVH4GDCo4z11dYL0c47SQwl8O25oAgevay3FADtl2xl+I/fRwA+bv6uE2Mkg?=
 =?us-ascii?Q?dP/zGq/D5LVcr+bdVdaEeOwFaNPdo4qcN57ggzVmvLYA+AikIWTW6P1ho8g7?=
 =?us-ascii?Q?YVuCM5TU7E3hKrCsWfUm2NmG/TPkbqyYwtbJJ/MZQGTk6y+xBEfkblMRix4b?=
 =?us-ascii?Q?V/kAmV0TaQuP+iY1mf0lofc+2VBpAwq5VYe00WkpsIi0xOPZ4MPo5heC8O/V?=
 =?us-ascii?Q?aJGfWXoVhaRCBvqYI3jS9TIUOoU9jX8nD/uRvZWmx/9VG03hysv25sIg7Z1b?=
 =?us-ascii?Q?E8hyldrd3fMdIG/4P0mNZ1SVgtTwIGApv/EWqmFtUKppOadDcDxnO/SssOMv?=
 =?us-ascii?Q?P8ELZP2jkzAy3Fzb2rdmQLR+tQ+/PYk/WG8zMCeGasiOqeLfcUCfl6/luPnT?=
 =?us-ascii?Q?C4oZeT2lln/MSJiFi89KZX16Vd1QTLx/ac2kWaac8VoI8YiKiA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/C3FpAtg2BN/evQYDJUzioPohQ+tMEiDX9K01d48j8EFLXYET6SED39CXtKq?=
 =?us-ascii?Q?W1OvdDSbNCBQ2iGZZtGJZQzeIrmVyQPPepa/Nrxb7OeWpHDFgwxoRh8rcbR6?=
 =?us-ascii?Q?8N7c0V9Bt9p9U5kDoI6XwZCuz4P+d73yqHxFsmJBKde26IP+3+xfHfw0bB9t?=
 =?us-ascii?Q?jMMz22axpWGdV0ff8/pg0645qEIOYmFO1YPmjuCb/KErqbbuaAPuQGMld3GK?=
 =?us-ascii?Q?rOU8s1xf/9TZ5vHd+y2q9gJkB3hFygaIrAjmydTdsw/bRIUAPGc/A1TNDKpS?=
 =?us-ascii?Q?TZ2L0WfbqsnR1zP7wZYXx3Mea5dh2tA8Xec9SG0NVmZ3Sj9003H/lVqt3t8B?=
 =?us-ascii?Q?5RA4QXIEH0ri1nWfoawYralRx7qpwBP/FOFDpywDgHp7y1abQHiD6vF3DLyq?=
 =?us-ascii?Q?VSZOB1Fs5w13aC+yMUSoG5MEti1zL6OHhMGFTcTwsmolLnPU8EsCdvRDdUAL?=
 =?us-ascii?Q?+mQhviqb7g3Q31Wg16Wx5BZgHs6DTXgsTPPgDRbw6k3sOtFAHHHTM0L44AB2?=
 =?us-ascii?Q?Guo+pHfzISwgC+NUm1QmxFfZq+wq9YAvhwrFGTyBv28gYrXY7xBR3qCDecD8?=
 =?us-ascii?Q?l0AXubBQTEriHPcit0mzIgHmJNxCEw7HdUO8cfN5qmnMDY+YvhWH7K707ya2?=
 =?us-ascii?Q?u2X01Z0O6S/8QAh+X7Cg99ruT0zGonm7M89YHqlLxyxQEI/+BHvwXtBqGsD6?=
 =?us-ascii?Q?SDcJgUhBuhpLPpP4pZ2m8vuuEHilG0sjatvl2nBzfGdZ/Jks8dMvgYCbtZ0q?=
 =?us-ascii?Q?/anzSpG4G6iqWoEJK34exEemmFBALPBZBj8u9T56PrxshZx/3u0O52hyEknF?=
 =?us-ascii?Q?lbtKfWx2JkQnJsGJ7jTlWWPH/MM5BG6I+v+Stg0WhQDT5xKN1J7YdMNxIwkq?=
 =?us-ascii?Q?6l4mhmNURPDdCfER1/4SwbWaZm3PR2YBAObAwi2TfZStD9wywSnOgoWLbF6a?=
 =?us-ascii?Q?2wIrGIBGLtQNlhyI4PLnvWQNp3aRivY61c6ZIOK/aCR0MV31+KHRLSxIHUbE?=
 =?us-ascii?Q?M6VwxMXCcLaTlKXU3DTbw5MNrAIQa9SksSpZtzGRj8YA4/hwKWQw8g5qRcp0?=
 =?us-ascii?Q?IYv3X0Su7JLG5aBiVujleFD+NYSaOnjJYIGzVvqF50A6xYhsX58kj3kxbuqk?=
 =?us-ascii?Q?vXnao58C5iwALfHkNHzWK1KJvAlDhsLZlkGeyZQFkvAKIXAWxuWFF7OqwGEc?=
 =?us-ascii?Q?yfY5zp93Ls9nxqDp/uYqlioMGZAYCtDRh+MQn0zejBQTj/KVFFPYJW3alO/d?=
 =?us-ascii?Q?qM0mJblUVrI9u57ThstoBJT7ZDwivcSWR7oFcTnhT0ISGFXcabfZYGrtanab?=
 =?us-ascii?Q?xsyvbrbCSQG4lu2AFhqNoMhSElGlLcTU/Z/ZbOH6hXUs14rYfY4ZXKKDQUnb?=
 =?us-ascii?Q?LCWpf3+BGxQSyhOk2t4exyavM/5Y/Www5ouaKwDijtKPNVBdQ3isH+vHXVnc?=
 =?us-ascii?Q?YWNdTc4E+aJrT67n0y4rvLsZQ1U2nYOCxzFgzeRrrv8thQvagDLd2fs5UULL?=
 =?us-ascii?Q?JtuvjtRfGfNsa+neqikvV7TaDyAs/d3zhp/39js5/rwL5nQcBfhkpRqcRrUK?=
 =?us-ascii?Q?4yVPrhNF3Ky6XZpD/fY=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 616e9c0b-0d78-48b9-f8b2-08dca27404c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 13:10:35.9809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M5lBpZXGkzat/s35aIGIcC6JT3AWG2zCgkPA0AdHuQ4xJf4VuaHsiNtBNJZ5lqOspC8Jv5dsl0mUbB4At+HdEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7653



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, July 12, 2024 4:30 PM
> To: Parav Pandit <pandit.parav@gmail.com>
> Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; Parav Pandit
> <parav@nvidia.com>
> Subject: Re: [PATCH] editorial: replace hyperref with ref
>=20
> On Fri, Jul 12, 2024 at 07:14:33AM +0300, Parav Pandit wrote:
> > Replace hyperreference with the reference.
> > Fix the broken link refernce for the DEVICE_STATUS part.
>=20
> BTW once you know the hash, add a Fixes tag here for the patch it's fixin=
g up.
>
Yes, I am familiar with the flow.
Will do once, the patches are part of the branch. This patch is sent mainly=
 to fix the editorial in the same PR.
Hence, I skipped it.
Will follow in future patches.
=20
>=20
> > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
>=20
>=20
> > ---
> >  admin-cmds-device-parts.tex     |  6 +++---
> >  admin-cmds-resource-objects.tex |  2 +-
> >  device-parts.tex                | 19 ++++++++++---------
> >  3 files changed, 14 insertions(+), 13 deletions(-)
> >
> > diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
> > index ab6e83b..4aa1464 100644
> > --- a/admin-cmds-device-parts.tex
> > +++ b/admin-cmds-device-parts.tex
> > @@ -60,7 +60,7 @@ \subsubsection{Device parts}\label{sec:Basic
> > Facilities of a Virtio Device / Dev  Before performing any get or set
> > operation for the device parts, the driver  creates the device parts
> > resource object  VIRTIO_RESOURCE_OBJ_DEV_PARTS using the
> > administration command -\hyperref[par:Basic Facilities of a Virtio Devi=
ce /
> Device groups / Group administration commands / Device resource objects /
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE]{VIRTIO_ADMIN_CMD_RESO
> URCE_OBJ_CREATE}.
> > +\ref{par:Basic Facilities of a Virtio Device / Device groups / Group
> administration commands / Device resource objects /
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}.
> >  The driver indicates the intended purpose (get or set) at the time of
> > creating the  device parts resource object.
> >  For the device parts resource object, both
> > \field{resource_obj_specific_data} and @@ -337,7 +337,7 @@
> > \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio
> > Device / Dev  When there are multiple device parts in the command
> > VIRTIO_ADMIN_CMD_DEV_PARTS_GET, the device MUST respond the
> device
> > parts in the  same order as listed in the table -\hyperref[table:Basic =
Facilities
> of a Virtio Device / Device groups / Group administration commands / Devi=
ce
> parts / Device parts order/ Device parts order]{device parts order}.
> > +\ref{table:Basic Facilities of a Virtio Device / Device groups / Group
> administration commands / Device parts / Device parts order/ Device parts
> order}.
> >
> >  The device SHOULD respond with an error status for the command
> > VIRTIO_ADMIN_CMD_DEV_PARTS_SET if the device is not stopped.
> > @@ -455,7 +455,7 @@ \subsubsection{Device parts}\label{sec:Basic
> > Facilities of a Virtio Device / Dev  When there are multiple device
> > parts in the command  VIRTIO_ADMIN_CMD_DEV_PARTS_SET, the driver
> MUST
> > set the device parts in the same  order as listed in the table
> > -\hyperref[table:Basic Facilities of a Virtio Device / Device groups / =
Group
> administration commands / Device parts / Device parts order/ Device parts
> order]{device parts order}.
> > +\ref{table:Basic Facilities of a Virtio Device / Device groups / Group
> administration commands / Device parts / Device parts order/ Device parts
> order}.
> >
> >  For the SR-IOV group type, the driver SHOULD NOT access the device
> > configuration  space described in section diff --git
> > a/admin-cmds-resource-objects.tex b/admin-cmds-resource-objects.tex
> > index 388aa69..d0a6647 100644
> > --- a/admin-cmds-resource-objects.tex
> > +++ b/admin-cmds-resource-objects.tex
> > @@ -69,7 +69,7 @@ \subsubsection{Device resource
> > objects}\label{sec:Basic Facilities of a Virtio D  \hline  Resource
> > object type & Name & Description \\  \hline \hline
> > -0x000 & \hyperref[par:Basic Facilities of a Virtio Device / Device
> > groups / Group administration commands / Device parts /
> > VIRTIO_RESOURCE_OBJ_DEV_PARTS]{VIRTIO_RESOURCE_OBJ_DEV_PARTS}
> & Device
> > parts object \\
> > +0x000 & VIRTIO_RESOURCE_OBJ_DEV_PARTS & Device parts object, see
> > +\ref{par:Basic Facilities of a Virtio Device / Device groups / Group
> > +administration commands / Device parts /
> > +VIRTIO_RESOURCE_OBJ_DEV_PARTS} \\
> >  \hline
> >  0x001-0x1ff & - & Generic resource object range reserved \\  \hline
> > diff --git a/device-parts.tex b/device-parts.tex index
> > 7384408..47ad06d 100644
> > --- a/device-parts.tex
> > +++ b/device-parts.tex
> > @@ -70,7 +70,7 @@ \section{Device parts}\label{sec:Basic Facilities of
> > a Virtio Device / Device pa  \field{part_type} values.
> >
> >  \field{selector.pci_common_cfg.offset} is the offset of the -field in
> > the \hyperref[sec:Virtio Transport Options / Virtio Over PCI Bus / PCI
> > Device Layout / Common configuration structure layout]{Virtio PCI
> > common config space}. It is valid only when the \field{part_type} is
> > set to VIRTIO_DEV_PART_PCI_COMMON_CFG,
> > +field in the \ref{sec:Virtio Transport Options / Virtio Over PCI Bus
> > +/ PCI Device Layout / Common configuration structure layout}. It is
> > +valid only when the \field{part_type} is set to
> > +VIRTIO_DEV_PART_PCI_COMMON_CFG,
> >  otherwise it is reserved and set to 0.
> >
> >  \field{selector.vq_index.index} is the index of the virtqueue. It is
> > valid @@ -89,17 +89,17 @@ \subsection{Common device
> > parts}\label{sec:Basic Facilities of a Virtio Device /  \hline  Type &
> > Name & Description \\  \hline \hline
> > -0x100 & \hyperref[sec:Basic Facilities of a Virtio Device / Device
> > parts / Common device parts /
> > VIRTIO_DEV_PART_DEV_FEATURES]{VIRTIO_DEV_PART_DEV_FEATURES} &
> Device
> > features \\
> > +0x100 & VIRTIO_DEV_PART_DEV_FEATURES & Device features, see
> > +\ref{sec:Basic Facilities of a Virtio Device / Device parts / Common
> > +device parts / VIRTIO_DEV_PART_DEV_FEATURES} \\
> >  \hline
> > -0x101 & \hyperref[sec:Basic Facilities of a Virtio Device / Device
> > parts / Common device parts /
> > VIRTIO_DEV_PART_DRV_FEATURES]{VIRTIO_DEV_PART_DRV_FEATURES} &
> Driver
> > features \\
> > +0x101 & VIRTIO_DEV_PART_DRV_FEATURES & Driver features,
> > +\ref{sec:Basic Facilities of a Virtio Device / Device parts / Common
> > +device parts / VIRTIO_DEV_PART_DRV_FEATURES} \\
> >  \hline
> > -0x102 & \hyperref[sec:Basic Facilities of a Virtio Device / Device
> > parts / Common device parts /
> >
> VIRTIO_DEV_PART_PCI_COMMON_CFG]{VIRTIO_DEV_PART_PCI_COMMON_
> CFG} & PCI
> > common configuration \\
> > +0x102 & VIRTIO_DEV_PART_PCI_COMMON_CFG & PCI common
> configuration,
> > +see \ref{sec:Basic Facilities of a Virtio Device / Device parts /
> > +Common device parts / VIRTIO_DEV_PART_PCI_COMMON_CFG} \\
> >  \hline
> > -0x103 & \hyperref[sec:Basic Facilities of a Virtio Device / Device
> > parts / Common device parts /
> > VIRTIO_DEV_PART_DEVICE_STATUS]{VIRTIO_DEV_PART_DEVICE_STATUS}
> & Device
> > status \\
> > +0x103 & VIRTIO_DEV_PART_DEVICE_STATUS & Device status, see
> > +\ref{sec:Basic Facilities of a Virtio Device / Device parts / Common
> > +device parts / VIRTIO_DEV_PART_DEVICE_STATUS} \\
> >  \hline
> > -0x104 & \hyperref[sec:Basic Facilities of a Virtio Device / Device
> > parts / Common device parts /
> > VIRTIO_DEV_PART_VQ_CFG]{VIRTIO_DEV_PART_VQ_CFG} & Virtqueue
> > configuration \\
> > +0x104 & VIRTIO_DEV_PART_VQ_CFG & Virtqueue configuration, see
> > +\ref{sec:Basic Facilities of a Virtio Device / Device parts / Common
> > +device parts / VIRTIO_DEV_PART_VQ_CFG} \\
> >  \hline
> > -0x105 & \hyperref[sec:Basic Facilities of a Virtio Device / Device
> > parts / Common device parts /
> > VIRTIO_DEV_PART_VQ_NOTIFY_CFG]{VIRTIO_DEV_PART_VQ_NOTIFY_CFG}
> &
> > Virtqueue notification configuration \\
> > +0x105 & VIRTIO_DEV_PART_VQ_NOTIFY_CFG & Virtqueue notification
> > +configuration, see \ref{sec:Basic Facilities of a Virtio Device /
> > +Device parts / Common device parts /
> VIRTIO_DEV_PART_VQ_NOTIFY_CFG}
> > +\\
> >  \hline
> >  0x106 - 0x2FF & - & Common device parts range reserved for future \\
> > \hline @@ -157,7 +157,8 @@
> > \subsubsection{VIRTIO_DEV_PART_PCI_COMMON_CFG}
> >  One or multiple VIRTIO_DEV_PART_PCI_COMMON_CFG parts may exist in
> the
> > get or set commands; each such part corresponds to a unique \field{offs=
et}.
> >
> > -
> \subsubsection{VIRTIO_DEV_PART_DEVICE_STATUS}\label{par:VIRTIO_DEV_P
> A
> > RT_DEVICE_STATUS}
> > +\subsubsection{VIRTIO_DEV_PART_DEVICE_STATUS}
> > +\label{sec:Basic Facilities of a Virtio Device / Device parts /
> > +Common device parts / VIRTIO_DEV_PART_DEVICE_STATUS}
> >
> >  For VIRTIO_DEV_PART_DEVICE_STATUS, \field{part_type} is set to 0x103.
> >  The VIRTIO_DEV_PART_DEVICE_STATUS field indicates the device status
> > as listed in @@ -215,7 +216,7 @@
> > \subsubsection{VIRTIO_DEV_PART_VQ_NOTIFY_CFG}
> >
> >  \field{queue_notify_off} and \field{queue_notif_config_data}
> > corresponds to the  fields in \field{struct virtio_pci_common_cfg}
> > described in -\hyperref[sec:Virtio Transport Options / Virtio Over PCI =
Bus /
> PCI Device Layout / Common configuration structure layout]{Virtio PCI
> common configuration space}.
> > +\ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device L=
ayout /
> Common configuration structure layout}.
> >
> >  One or multiple instance of the device part
> > VIRTIO_DEV_PART_VQ_NOTIFY_CFG may exist  in the get and set
> commands,
> > each such device part corresponds to a unique
> > --
> > 2.34.1

