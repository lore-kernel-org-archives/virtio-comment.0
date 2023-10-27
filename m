Return-Path: <virtio-comment-return-7998-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC98EC25B67
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 11:55:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0E45E2A89C
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 11:55:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DCBBC986A9C
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 11:55:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BFC28986A92; Fri, 27 Oct 2023 11:55:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B088A986A91
	for <virtio-comment@lists.oasis-open.org>; Fri, 27 Oct 2023 11:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdOtT51T4uMRrkmvAiqpco1SpZdRVwKLjSmP88TLoS3Y0GMqtTBgS2zDmXz9xafodSZTG/ploigjmJkhgJGjGJG8JmWHC5DbkwO2Sv4UTkh6MG+Pk8pHijqmfjHDk/YnWa2M7ru2VsJnaDsUewYE7pmDjGNj6DM4TOqLGO3AoXqTUv9iAcfFq7A1j8J6KYb1D4/pHIF5f+s50JLP5CpbHVMGnMer/zFo6bnEO8+bceKncA0wcaUTG/VPBosQ1Js9eBq5Yqewhx8KdZwPA9+JJEh86ISJEvDuvsSRQeN0yu24Ri92MyuQSO7mAzbrCiFvXBijTkGDomOoW/PeM3c3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUGHNmG/LJAroRBuen9vP1siBAOiYoenBXyIgbqTPDc=;
 b=GjbQjlOZ8qnpCgN5jK+A7I+RoYVhnCMnbd18hbPcYow9J83UlJWoACdc0yF49ZT5ZA0PkJU8UGUcrrTIck/moQm1ehnXtdUkgySFp8ti7NPS27UUzI8A+eB1hZArGuVs+kXgZnBYIPxTeAKse4Sqs4dJkocst2sD/UTGixt23naHhE0PT1Pz2cyTQ8P5M4g9da0/s8ezDfKpgLmJOH8rJOQDvUhVRacOjCmIA9keUkoxQWPvv2Q8XawXpeMEvWQk0GfKj4Z22FYPOdePta9lDcyHHDOBhNV0U2n0nmEVVdha8X9lPqXmdGJpDhrq1QKSByrJMwu2xeCvfPyrQqWNLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: Eugenio Perez Martin <eperezma@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUCAAAgxgIAAAJFwgAAH/ICAAAX5IIAAA0oAgAADzbCAAss+gIAACFOAgAEc2TCAACXpgIAAAYlggAAtfgCAAACsgIAADLCAgAAB9BCAAAFbgIAAA0OAgAGb4oCAAACzMIAAGTIAgAAAh6A=
Date: Fri, 27 Oct 2023 11:55:51 +0000
Message-ID:
 <PH0PR12MB5481CEA539D310BEAF04BBC8DCDCA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWcFKGTpHSUsHePUA4sTp_NthrTs9dzdVKoRcuM6e0G-kA@mail.gmail.com>
 <PH0PR12MB5481402BCC52DCEBF6A90A7FDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026051240-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548176388094EBC243F879DBDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026052637-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F967B7040B19272D1253DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87msw4s794.fsf@redhat.com>
 <PH0PR12MB548177BAE9336982471430C4DCDCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87jzr8s2yn.fsf@redhat.com>
In-Reply-To: <87jzr8s2yn.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB8696:EE_
x-ms-office365-filtering-correlation-id: 58a1b836-3cc6-4945-daf4-08dbd6e3aac5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 b+nkLNM+GjsFdvdLqMWfsU7zrE51XG1RLNHTGfaJGoj3l2LiC0ZTjPYjRNzJfQATlxAr2tGZciP9v6qh/3Y3SMN44225LrV0WQzaS9HxPO/V3qGN1vt19nhY+AxsCyQhev7EFcg4dkxYzmqE0c+rQQdi7YwbhMTbqg9oPVSE3oY6x0g2LHyZ+OA6DS8VX3T2pL+vvHka2hZsVGVVNf4DxqPbQhqceEVrgYHQ/aZaQIdAti03PZR1vL6rEOW0k0b+ANfTALhTB2Bw3DjswGcD87n1zvTH4m6OXWaqGQ9u+SRffiHy6+90Mk0NIKOPB6dABpUQVhzMusJJMMS+a88wY0sQyAcdjlAIHfypVBV9S3WAYCE0IrDKVL2J4KANF73jqVDWRVYxxrJJE3vtozGDo9olGLhxTxmAVpZN+7b/qOkX84nROWO2X7rlBKPIO+XMLAcg7hdzxdP7PuaB3WSSfom95XFxJMUDgzDKUzBA5Tp5BPjSI0nBa9aqUVfLsk2GGtnAkDDiSaM17/I/1CFpvyZ0sFyYebmYLCmcVYAvrfO1z99tX0i7hu3o/THghQngBTGSc1zTlVx5dw12TtIT7gp90Dsng1xVpm6d+/dbHbrCJYPluYJogTSUqkP3q+/f
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(346002)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(66899024)(33656002)(55016003)(41300700001)(4326008)(5660300002)(52536014)(2906002)(86362001)(8676002)(38100700002)(478600001)(9686003)(107886003)(316002)(122000001)(71200400001)(83380400001)(54906003)(7696005)(64756008)(66476007)(26005)(8936002)(66556008)(66446008)(6506007)(76116006)(66946007)(38070700009)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BfxkgYVE7yj9tDS5yJC/UHkbM4AFWeUuDl4ps9D0uWzm0ej4Eb5lYcxQMGbD?=
 =?us-ascii?Q?aLOpEvBnCOCZTFrYXv6yPwbiJ0p4bXmS+bYfZ6J7RWgNF6Z0juAhvkPytkZb?=
 =?us-ascii?Q?/pysOL1ZKKU0i+YgJw5oRPNZE4Bg0a9qrlPl1TNeR8hEeHzO6y1MxAw036Go?=
 =?us-ascii?Q?3SBHzStbVJZdcxriq0pv4E6pyN1bf6WP0bPD6SxXHNKejYYHmkUJlhZUIMqM?=
 =?us-ascii?Q?1woOF9AFx0IhPER7gT1JWgaieS6UMRN/KGXL3YR6Fp7kNoPHbXf6jK96H3WH?=
 =?us-ascii?Q?MHEa5dRQ6QBm1yCZa/mvMiLJGdix11VkphI3vxE4OPdlLP+wcMVj/sVCuGwa?=
 =?us-ascii?Q?9wsFkdtIYGLIYy1aOUN6t1BRf705UrqGlxpxxs1bEx4NL5OSnBPY2nfKZsHN?=
 =?us-ascii?Q?wszcaiKC6B4qVnNlQSxuv8yoEKmD4+JP5RtorkIwCiTY1dnk93DsrK4oN7zJ?=
 =?us-ascii?Q?15cUU7mTnr3GmBz8IDxjvs3UKXWNrZtTkB8xi9obWw+ozVu1T1+iBYPQ9eNZ?=
 =?us-ascii?Q?XXADntgHZMuyRifDeg4XFVaGKJbHhbw/l7yNYrwRB4bZCt5ei5UYrklPqVfs?=
 =?us-ascii?Q?JMQYXQ7r4B9UKQBIXY0Tbdo8YChjaRAdiTpMgQJZ54PGmNKrWJobTpVR3rUc?=
 =?us-ascii?Q?puQeuzIjdsvm2moRPouwMqdU+BieKzlMjB2TxgVyadwawEEdP5rdYS6Iaf0g?=
 =?us-ascii?Q?0JaS3XAKfSMRJU+onvM1KKhFjO4wXZQhgU3UZBEGxHH9bftY4wS46za1Eohc?=
 =?us-ascii?Q?tNopbUncL/UF0MaBGoeWqEAbZEQgCmL68pYP1ivIJ/eBk1pnpggWT8Xlqba7?=
 =?us-ascii?Q?0bwuYHRGv6z+NeJDVDempO/hLiZN5eRLZDutIsmuqMCKyhBXS+comxtmwtBm?=
 =?us-ascii?Q?ERbdkF9VZX5aLwKngn3uQ4kiCLWC9mWHMiXd8mWK0IMjXg8V1CfSnxQ99c+t?=
 =?us-ascii?Q?nf67Ibupu0yJdm7tPlt0gmsVBqcn8oDtcaOpvEecIgC/YkM1NIDab5dWA0HS?=
 =?us-ascii?Q?HD0YQjidEzISIj7KCa7Eqk/czKjNjpTlZwU83xbH3r1fCvDTMEzVdWHS5PUw?=
 =?us-ascii?Q?Z+AK3bNFo9W2Cg9d0iQe1Wv2XYXqKk4wnxCA0v221XBBrKzERqr27UjTmnba?=
 =?us-ascii?Q?Lbh2cQH/FNO8U4+TrFVpaCVnVyO9CL9Me4rrDng3YhW+pm1Ce8TjkdyieEBq?=
 =?us-ascii?Q?nE3id0rpiHcyS/cf7+QAnGPJn9OHNGIuYiY1K6qD+IbrVJuNlu9FkaIlwnn7?=
 =?us-ascii?Q?twREjfGWPUcpBsPqIPZ9z1zTUbUzO3/TXfQ+0M22eBCh470bGxe4ZI48LEk1?=
 =?us-ascii?Q?SU8i6Ln0cz/mBMdDCVGs31aIR3CEAyzeQJKwEQZSBKJUHz/pl8pM6LuxS14V?=
 =?us-ascii?Q?YVG8oSURdS3xfAfXbKC/FJXTRS0Ic/WcsA8c8SeTQFHPn63eWuBb3VB0yYl1?=
 =?us-ascii?Q?JRWhqR6wVK5Fer3o6hc86Bzruxm+iLLkxohyprjk2ch9+9uOwawJ/0j2WLFh?=
 =?us-ascii?Q?hycUii09qHlyqpGIohVoUfbX1isEIt9mcpMWSYgVtAnpKgH//X5uKpJmo7p1?=
 =?us-ascii?Q?OQzIxQ34uijbqzmvzUk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a1b836-3cc6-4945-daf4-08dbd6e3aac5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 11:55:51.3465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j2nMihQ7HxEuiQYT6FP6vLGFrSEhlW2yp7ATUHcoSfc39w6vXaS9XyU3jgmmZflhG7e/jqprczLb0sg1W387Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8696
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage


> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Friday, October 27, 2023 5:16 PM

> "config registers" are transport specific. If they aren't an efficient me=
thod, then
> the transport needs to come up with something else -- but it's the task o=
f the
> *transport* to provide something useful. The device should not need to do
> anything beyond specifying that it can support adding vqs dynamically, an=
d
> exposing the upper boundary to the number of queues.
>
You are welcome to propose to PCI-SIG such enhancements. :)
We cannot keep blind eye to transport and say, virtio will expand infinity =
registers without caring about underlying transport limitations and efficie=
ncies.

There have been many discussions in past across many device + cpu vendors i=
n various virtio and non virtio forums.
I would like to share that the industry does not prefer to put things as in=
finite set of registers unless its most fundamental thing needed to bootstr=
ap the device.

> >
> > Out of 19 devices, 6 devices already has cvq.
> > Out of remaining 13 devices, 12 devices have fixed number of queues as =
they
> small enough in functionality that won't need a scale and dynamism either=
.
> > So for dynamic resource management reusing the existing cvq is more
> efficient for the devices.
>=20
> They have a device-specific cvq, which is used in a device-specific way f=
or
> device-specific purposes. I don't see how turning them into frankencvqs i=
s
> "efficient".
Sure, they are device specific, but we can define generic set of commands i=
n basic facilities, which each device type can send via their cvq.
It is only matter of drafting it.

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

