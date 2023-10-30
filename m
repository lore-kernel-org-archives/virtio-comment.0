Return-Path: <virtio-comment-return-8041-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF96C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 12:03:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0D2CB2AEE4
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 12:03:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E73D8986B2F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 12:03:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D15ED986B2C; Mon, 30 Oct 2023 12:03:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C0909986B2D
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 12:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwODhOoDYfSl9OEdV7RTbWTrZCWtyXl+mwBNZ/gVofceAIislpe1HciwxeopRrsBlOnV6+kUwinUDSVMqyO/lycJgENH7ZqZVUkxXY2xdJd5LMA1dwh2jXzt+//4otovCC/i7JXfvrqhSicXfGpsidZIrf9BTV9u0nvFppEgS3PLuZuPVWJ9KD3cDXL7HODwxEotOW5Lwp8RLqksUQROWaKZ85v0NrSXGqq85Mhwy66XvNDYH3Vpp0WA+XNmoJ4JPs//7su8grQk2n/Jwhvr4FCgIapovq0ei1u6dSRDmVbG072A82tg1Fs+EKWEZRvAafgeLlYx486N0paNxhwoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgH3OSAkAeuRsI7h/NatCZanVXJkaoP1m65jBvFxNq8=;
 b=B+5pzVrDw7d91rCrNKN+9V0bkBuLjvGr7EwM2GkxJjxDW7hYxywUrl1D5IcBWjk1/A5FX/9Ys6hq+zQf1bqNfOMGfsU+1N4H+gACuxTmDTs40SxXmB2maivfT4zOUwOPc1RgnkyFlMOMFnSjvcPkthbJTFUnMtCn06bRY3XGwdnW4c07WIXJArRd5OBmSkdj5gA/HTTwA02VejGBnPiJr86z6X4NDd2BX9Rtfea66iF3FckLs0l78i5jsDB853fq7KdE4yJj/7ASC80nCwcxH/b+lULFX+F5EX87ikEyLATvxIz6dMMeyNDosUFglmePoIN6k4C08sma7IEd83tw9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Jason Wang
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAADeVYIAEiiUAgAAAXICAAZfSAIAAAE8wgALlIwCAAAFh0IAGFdwAgAAAUgCAAGlTgIAAAOdQgAAYyACAAAaRMA==
Date: Mon, 30 Oct 2023 12:02:54 +0000
Message-ID:
 <PH0PR12MB54814CF98662DB8F7FA1181BDCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <f2707430-bb1e-4dcd-b0b3-2b9a705e555a@intel.com>
 <PH0PR12MB5481033BB7C0BCABAE329B13DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f9a604b2-7bc9-49ce-bd28-59909f0a5fec@intel.com>
 <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9604eb82-8efd-46cd-8b15-90fc637eff0c@intel.com>
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231030072937-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231030072937-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CYXPR12MB9441:EE_
x-ms-office365-filtering-correlation-id: d4026166-fec3-4f27-58b4-08dbd9402651
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nxevpb8kY3SWHyT0Gfz36rczWSV9L5ondyuK2JrjFNOoB9bsWfnd0Psj+hqNU05vKPREV6XVLcXqgRSlC2IU+JSTj5CwjCKRSDvIRaEyoU/vkoisSvFQjA1enlxDw1xTMJmwE/D046YzN6PbSb1+CT5DTgfx/4ItEBM75n0KkALDdFV9cNo0orLhpNQC8FkUkXrRt3I9TgZebjXPEJDEpgl7RgX+HAgc4ZjqCvnww4RrzegsDT6xGxk8XAFa29zrCw0d+q/1FdhBlWjMeKDondEpWZ8lv0EiPUrV6SMUmzl08q1h7x3qNOuG+SUrV5snVF+Xh3FLFJS3LjU/bLzUnCG9EbzMXq1kg11vT7pvV6hd5UWoWYZYq4h/db2IDxnGRxObfFjFpOZXGCCcw+atcL6y7J0TiHMQSrCJbROxDkVoOTZDv7Vl76HX0Q0Q26YsuIzqzqauTTLJFYFY9hWjkplZRJ0xc2Gvob8XZqbJuT3vzurBFWCg5KbatrBPvOg1PuG+t5z06yNX+gHeq/A6yhBZdAyrjOh6XO4hgOuJAE9DjUXJpu3P3EmEjVVL12whjHAn0QL3LPtXN5Qs0XS/CJQWyTFSLituuVFBUkhWyMw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(2906002)(86362001)(33656002)(41300700001)(4326008)(8676002)(8936002)(52536014)(5660300002)(38070700009)(478600001)(9686003)(55016003)(122000001)(38100700002)(7696005)(6506007)(71200400001)(55236004)(107886003)(6916009)(54906003)(316002)(66556008)(64756008)(66476007)(66446008)(26005)(66946007)(76116006)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RQDp8Ts+ilgmH7ujXCw8vR/8rNE/nQ/2nvbGR8Q4r/6UuQuoiPQN1uQ271Dw?=
 =?us-ascii?Q?WWtrzeQ2/xNgcccp2so0KGgJAMR6xWYunpw+ruConvI1z6V9JoBTRRFx75Ev?=
 =?us-ascii?Q?rSvVXxkEAoAf2YepE3jo0dIWKgP0lfygF4ukEokmKQmFgbiUDGrqj31jCGaN?=
 =?us-ascii?Q?zGbhpkZeh7aKDG7ytvpLb/UNAWygJ/2lh82H6kYydhYpcOHdsYigD0+Ejav7?=
 =?us-ascii?Q?k2NrkP1j3cXrEtNUIzYucdQO9C6vywUBwiE330KW/+qCdhZ3EyFyPPVfru/J?=
 =?us-ascii?Q?65AxpgcJnoE/DCi673eLHY4z50q2/F05sT1a2nAFd1S2peE6Fkb7pIUDGOU+?=
 =?us-ascii?Q?ryHcRve8VdC0ay5VYX2uFA06j/cOQhx40dzwagXXSd3WU9MBGfuq4nv0uj5L?=
 =?us-ascii?Q?06azhuFnPdfNNTs4KGiGD+GxtnnN1TF5r3VuuqlYIvxNTIeMNKr8TbgGwMZo?=
 =?us-ascii?Q?YsvjzdHEz7T6mXRyVBDwVYMugo133nCqs7TcO/nUrsPppjlrKaP+N7qmV/IS?=
 =?us-ascii?Q?BmEiu4ePoak1GRHcGW7Qyif3jzoUuIX5xPuaIc19VVRSr/UaK2bYZsTjdLcZ?=
 =?us-ascii?Q?NPoa5mdJ7gAeMQQLgOzLjnW6p13Dg/VnO9itrlGDuG4SD+8TFQc9OD32QNeu?=
 =?us-ascii?Q?DB2GriaTTXB8K8x4cRiHQ99N4R1/f+cZoukIhypwfaFSZNr+6jtECYpX1/Nl?=
 =?us-ascii?Q?CqlS3OomswZV4BUqIBcve4vTyEsoC5+8JAQs5+lMIUf8HYy8e8A/tk8OtydV?=
 =?us-ascii?Q?AOMGzfL+9oieZ5KIxRCiahXTTjxdCMcHehvCwgfQvEhGjC9QF2Yd+kzaY0Yx?=
 =?us-ascii?Q?p0Gkq9zgu+TilCajGm0JVG3RieBUOwJxuvkHmsAd/FjTvUi8zTGtPLau6ule?=
 =?us-ascii?Q?ylwsu7WCTT5oWisxthcNQbR9KcOhahlUQiI3HiaSEAsJQ2mg4z9Eon9GVKpL?=
 =?us-ascii?Q?YBtq2OyvKHb2wJyzPAB2zJD7h9vV4qvi56GyWUsxRAj29wX0ViX9D7q40gBh?=
 =?us-ascii?Q?NCcGkvpY7RnDh/VcjDZeBItxKYkNHGrAaW7oIpJmmWQqo5W3AkrIvpUmUNLZ?=
 =?us-ascii?Q?VNowJwodcJ+hIp40qBWC4D469CftDI3tg7869Fuxi4FKcOLzteqpumSh4R+V?=
 =?us-ascii?Q?zYv4bvue07xfLwLLaDzZA4LSG5yQhMCEJDAgtkiPy83yqpzwPxvvEkatyiOg?=
 =?us-ascii?Q?3cuTy/NX6k5CQP2UejlvsD+TWtG1uxFjheTWypnexaWXsFGcwa5dUzVfPxzx?=
 =?us-ascii?Q?I4SiBsqcphGKkzT8Xi6b31YPBA9GDPtAGTgpEIoNviFyLhskycpbY7N4NjvP?=
 =?us-ascii?Q?cuL778es5WZpzYeKfUlzGuqJl9ISgLu4p+cN0jEIuqWlK183g0mcVnHM2iW0?=
 =?us-ascii?Q?/wzjZI80qpYsczkd3U9vuZi0o7bdv+KkR69GK0sRBQ05463/sV51to6GyWUs?=
 =?us-ascii?Q?HiLfXWSduv2kXpVB0jusjg+w6fkFw7SMrshsQPZSERnDGQBPQ/Yaoalh6MDQ?=
 =?us-ascii?Q?XFNnuJRycmPrcNuB/fuaUsU/8sws1HrASNLNErmRS4wa0tbTxkt5DiBTotg8?=
 =?us-ascii?Q?T8X0HXv7Ok6L4AR0ms8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4026166-fec3-4f27-58b4-08dbd9402651
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2023 12:02:54.7023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JOt/Rby7frKeGjyhktga93jSBnFy9TDvqeLBPkb17q40W6tdLHZ4En15YlSpLFggOIqOpP/vbL9RaiiGMg0vzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9441
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, October 30, 2023 5:05 PM
>=20
> On Mon, Oct 30, 2023 at 10:23:14AM +0000, Parav Pandit wrote:
> > > And the helper driver could be considered as a part of the
> > > hypervisor, or the guest vCPU can not access the host side devices.
> > >
> > > For example, the path is hw-->vfio_pci-->qemu-->guest. IT IS NOT hw--
> >guest.
>=20
> I think above makes sense. Nvidia decided to standardize on VFIO and that=
's ok,
> but there's no point in calling specifically VFIO "true passthrough" or w=
hatever
> the marketing term du jour is. This is not a VFIO TC here. I do wish one =
of the
> sides in this discussion stopped promoting their architecture and the one=
 true
> way and tried to actually build interfaces addressing multiple architectu=
res,
> though. Otherwise we'll keep getting stuck.
>=20
There are more than Nvidia here.
And yes, for sure I am not promoting vfio_only use case.
From beginning it is listed as one use case as member device and owner devi=
ce follow the same virtio access interface being present in guest or hyperv=
isor etc.

> > In virtio spec we only talk about the driver, and the device in context=
 of
> passthrough device.
> > So for virtio common config, dev config, cvq, data vqs are guest driver=
 ->
> device.
> > There is no other entity inbetween.
>=20
> No longer true - with admin commands we have 2 devices: owner and member,
> and each has its own driver.
Sure, when describing the config space access, cvq, data vq we don't introd=
uce the term as owner and device,
Because from spec and device point of view, it's the driver accessing it.

Only the admin commands or group commands talk about owner and member drive=
rs.

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

