Return-Path: <virtio-comment-return-7843-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8873CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 08:58:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 334761CA249
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 08:58:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 18DFD9868D5
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 08:58:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0711B9868CC; Thu, 19 Oct 2023 08:58:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EB9D19868CD
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 08:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXhrCyLlAAmnWWD1usfHZUx67D4b6YWxYubqpUKYS9+ih0G49liRjnhfGa4FE/OQLCOhoZIDWmn+STbfA5VeBjwQWSuhjzrx85cB+TLh6ZZRl11rgQDfwCMMGuRdSGwbxUD9gBbW1on2QcmUzPx/haDF9Sw3TKFdydcpuok+ZnL7iGi7cJaC3V6hD6nCIDGHKm4IrjMeIQDqWRPx9wgEBtYoVhW7MwYXRlELkDdGtlHPNkjXtYjPdfNUgczMpe986Oyrlh7Mmw4NR6GbetxP10FCpJdKYqrmTWX7WM+XzQc1XDcwvBY1LdnuWJaqYNYhriKurgnEVdr1aC+AD3VahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPS3Il/ehtkyPtW+UPSNPrd3ixie2jcCJoe4LFReBpk=;
 b=j8knEvpAi0Z39BmBqARZcO5aoNPEsBQ0rVOD2Hmy7ERU3bTekLP4vMOF6I1s6iuyfVdtVtIHKXRGroCYlZGttuxGOsSe/aNK1iPkgUIPHNxXqzjcsklDOc4yfcl4aVvCKhzBstI9hp/NQnXcXHFD4jPjmiIGJ5IGwGIaeZlcfDebqFmXWTF7O3/voi02z6Hv/SQmpn1PwsjleUQdc4Dh9biTHAwyMYLoE+QWZOzWzE/T2wuq7ckRvAdTWj73DObZ70KTr/2PmVbHyyabcPklpDAJqkrCoM283VyiA6biuSpdXWqqzK4xfQVJSir6MwwfKhOpYnzz55sk4UvbQcM4Xw==
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
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCAABMfAIAAAMfQgAAfqwCAAAPbEA==
Date: Thu, 19 Oct 2023 08:58:10 +0000
Message-ID:
 <PH0PR12MB5481373C657AE3EFA123D1C4DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
 <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
 <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMF4JVEQJ6skT2DrEWjop6wjKS6ad6dW2UNOA1oRuPKQ@mail.gmail.com>
 <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019020413-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810A5AA248384392FC8169DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019041629-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231019041629-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB5262:EE_
x-ms-office365-filtering-correlation-id: 368d2b96-575d-44c2-f45c-08dbd0818512
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 htPIW2rrBx2z/IH2USNIfKtWx0v3jjNT7lEFjO+agpgRgkQJ8Vv86KzbsWPiXWH32y9eiDWEScpTviRSfxdqI/5ayv/HTicbM6SUKy8K/M8K2gDvxM2rJoR7w62kX+Z+HqdZ7vVotdn4KOQ3Bz0tHiO9prv2EDdmaQqJx4cLd0kzwnCuTCaPg/NmlUalvddXBlV1ANHRpBpVieUzkvAwgplorCE0bN+4GzQqkIHsmoO0Kep2kqihTEZGPMLLglXoBp2ctcd6S1Lm5WONPOB7lH8YOxGXFiwqeWtoUq2aqC/jaN8sbquCzrnvey2ijuQJWOLYgKA9hyjnyOU4HPBUk6JaKZfnS5VKzRa+nXNm1MbliPnVEWZp9REH+u0RDok7/a1wn0043eCjvR9rdm5ES1fBOU0GtyTufEuF7/LguwN4dHAySnX5HWYxpDS+Gl9l/e2uxv0X/5mH3IxHb5CAB/kA1ZR54f85wR6t+hDQwSJ9S7cI8iYMixu4U3zIJpoekpSewi/Pu0I2LPHoWXqsIyWR2zgOJXH+1C8GnhtM8/22lhU7DlJalP/bJXojpqhJIgAEl+Jxc9pSvhDraO6a7y29C98+781XmCCk0F5jKrFkzajrzHQkJH1IvnanTiEI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(396003)(376002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(86362001)(41300700001)(478600001)(2906002)(66476007)(76116006)(54906003)(66446008)(66556008)(66946007)(6916009)(9686003)(55236004)(6506007)(7696005)(316002)(64756008)(38070700005)(8936002)(8676002)(52536014)(107886003)(55016003)(26005)(83380400001)(122000001)(66899024)(71200400001)(4326008)(33656002)(5660300002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Y63fIFEcLPyv1iMLjvj/n6cWMpEScMruJ5T8ITYbrz4hhwVuRJkdUKHfB2Yb?=
 =?us-ascii?Q?MAwNkQmap0/mi556toS6bOt7SK2ezd6U9NAJl3Z1o7IaYJ6aAXMRNJPbNvpD?=
 =?us-ascii?Q?+FnOWkPtXQS/Ma96tEae8vYkqTPzE/LQGA8W4Pxx28ETT4Ks6735XSUoYOYj?=
 =?us-ascii?Q?ZNkyKa89cpMdBNdIceNmWZS7M8/hTVmFaIuVm2htl2DzCwkZTziDLXoOU8Re?=
 =?us-ascii?Q?Xw1NVXOy7A6leSgLdDbHrK0JnRnUbGSpendyuXw5YSOcjo3iTk/zPLkG6i56?=
 =?us-ascii?Q?2bhMWhvPcrWoUp5HE0vl5hT+V03HmRLjCQGHvF95UqRSlm0sfTY/aVrdcnr8?=
 =?us-ascii?Q?SMePP18HQ2N0Y8Y2zSzgBlr/79O/7YLxBnMDfvM5vBi4P+u5cQgHIFbzFRUA?=
 =?us-ascii?Q?OLWG6wav8LYeU/WtnB4XJGIHs7fnvNNgRxT/6TX7ve0epMi2pfj+QXkssAYD?=
 =?us-ascii?Q?Iy40nJ1p7VzS5xpdepsp2VpA0GJcuAIF/WgFNb9t1TvSrR9Q86K0bHNQm9r+?=
 =?us-ascii?Q?OOZK3CP8Cka5I+397ofXL8rHGE89jHcC6WsAlaNdJHzOmW+ilUfW7HWGbzYb?=
 =?us-ascii?Q?riUF4gGw2l8NR53M/gWQoSfP4+9Re+k8N53Bvk//idw23qqmsCtsn1zZOf5u?=
 =?us-ascii?Q?31MDxLe01rL/HNL7mKbBu/+Nt5aZhTSPbtP7+5OFBnh6axUi58nrcMO3ZWUf?=
 =?us-ascii?Q?DSjELZ4HeUN2WOOKMTyMiJuAVUcGiJdFh65IcIiDIIkpCunXtsGzmHGz4kpz?=
 =?us-ascii?Q?T0epSu+flWmSXCxJc7PYu0BuM2ZJbP7bXAG3iMuP3hIGWX2XaDzd/G87JktO?=
 =?us-ascii?Q?jS9YKxc13y+ETBrP/pr0U4x4tn/6FMwM55g/YlY7hBOgRcRd8OcyQop+uRgm?=
 =?us-ascii?Q?yUngoNpWHLIrAgKRxElvLIlh5tKhzspFh3vlE4Qgo3xvWLZTMyxfbTse0nge?=
 =?us-ascii?Q?7JQGblNm7QChp0UeS1IWuxCt65CQ0focAKqK5uwmQmoBLllx2kLVuZoVULbi?=
 =?us-ascii?Q?vTXIaKf4dl4O6whbTDk8rKs5O0H6F8z73Jn/KpXqVsfVpsd9Dy2Ti16NUCA3?=
 =?us-ascii?Q?PY+WMjeE+sL0yF94WRvmT5lytha8/2MiAUNBC3Nn74gQAW2dW/RxvLy5nkar?=
 =?us-ascii?Q?lBWlkDbdOi53CrxqJm1PzYFQCnhhztippLTszuPC8mRXVPc/FH/tJ0LgPghS?=
 =?us-ascii?Q?lIZAaqexql2wS3CtEZ32p0sMB4ut9hh6NRfWIGukaYfDmq9rftBlcu2BBvEC?=
 =?us-ascii?Q?8hnwFwRRzMUjrdhbPwBF+u2ApebK5EB4IA2zsact1SaCgrYuP22RN3dv4vml?=
 =?us-ascii?Q?WIRMhoy80U9hTqo8bDIe1p3RQo6Ki0Zywp+S/5MFCuaElkV4/Kgd252SSbnC?=
 =?us-ascii?Q?itOfJNVaWG7Lv+EQUk/BJB5OeqU74jzx8kz1br0awSMm8LynFNJKO6cXa+GG?=
 =?us-ascii?Q?uDl4aw2gae1CR11TJZ1V+TNPh82L88vKuD6LaxXCJhYNsidQ5zv1I0MkyFyV?=
 =?us-ascii?Q?WSFbeh+yd+xDUbXfRnwQwuoFaE3fY/bVaMJSbkiRDAm0odkRdZ3MxIvPnJ0V?=
 =?us-ascii?Q?7gefuZidtNOR3iZ1QcM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368d2b96-575d-44c2-f45c-08dbd0818512
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 08:58:10.4908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K3iNwGhCfYLUAeJo/bMpIL8fRaHod7ZsC6VS+BKYSONjib1gVQqwRaWbPGbZ4+JmSnr3kvH8SfhHlg9F/lPTcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5262
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, October 19, 2023 2:01 PM
>=20
> On Thu, Oct 19, 2023 at 07:30:09AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, October 19, 2023 12:05 PM
> > >
> > > On Thu, Oct 19, 2023 at 05:31:37AM +0000, Parav Pandit wrote:
> > > > > How could we make any agreement without an accurate the
> > > > > definition of "passthrough" who is a key to understand each other=
?
> > > >
> > > > I replied few times in past emails but since those email threads
> > > > are so long, it
> > > is easy to miss out.
> > > >
> > > > Passthrough definition:
> > > > a. virtio member device mapped to the guest vm b. only pci config
> > > > space and msix of a member device is intercepted by hypervisor.
> > > > c. virtio config space, virtio cvqs, data vqs of a member device
> > > > is directly
> > > accessed by the guest vm without intercepted by the hypervisor.
> > > >
> > > > (Why b?, no grand reason, it is how the hypervisors are working
> > > > where to
> > > integrate the virtio member device to).
> > >
> > > I think it's a reasonable use-case, though of course not at all the
> > > only way to design a system.
> > Sure, there are more ways to bisect the device, specially when underlyi=
ng
> device is not a virtio device.
> > But one can continue bisecting virtio as well as you listed below.
> > > Some more ways:
> > > 2- intercept everything except data vqs and cvqs
> > > 	I think this is a reasonable way to build the system and has a bunch
> > > 	of advantages short term. The main disadvantage as compared to
> > > 	passthrough is the need to keep config space coherent with
> > > 	device operation - the way to do it is device specific and
> > > 	might get fragile.
> > >
> > Yes, I agree it has short term advantages.
> > This is not future proof as you listed.
> >
> > > 4- intercept everything except data vqs
> > > 	Here we get another problem in isolating some vqs but not
> > >         others. the problem becomes bigger is that you also
> > > 	need to communicate control vq to the device.
> > >
> > Yes. for non virtio device vendors have easy way to support.
> > We supported this for mlx5 devices.
> >
> > > also, with both of the above options, we have a question of how are
> > > we communicating with the device to keep control path and data path
> > > in sync when device's dma is mapped to guest.
> > > using PASIDs for isolation might work but again, support is far from
> > > universal so we can't really assume it as the only way in the spec.
> > >
> > Right.
> >
> > > Absent PASID the popular way seems to be shadow vq which basically
> > > does
> > >
> > > 4- software intercept for everything
> > >        clearly that's a lot of CPU overhead, I do not think we can fo=
cus on that
> > >        as the only way in the spec, though some hypervisors might
> > >        already have a lot of migration overhead to the point where
> > >        virtio can afford any amount of overhead and it won't be
> > >        measureable.
> > >
> > >
> > > I also note some or all of the intercepts can always come and go.
> > > For example, a common setup is that if target VCPUs are running then
> > > IOMMU will inject interrupts directly into guest - if not you
> > > generally trap to hypervisor. Similarly, shadow vq might be active ju=
st
> temporarily.
> > >
> > > Which approach is best? I feel ideally virtio would find ways to
> > > support them all rather than deciding on a policy in the spec.
> >
> > Cooking all the modes seems frankly very daunting to me specially when
> > there is no existing software stack to consume all modes and no device
> > vendor to sign of for _all_ variations.
>=20
> Not addressing all the modes.  We are building components not stacks.
> Components need to be reusable not stack specific.
>=20
> Was the whole admin command interface with its levels of indirection a de=
sign
> mistake then? It was designed exactly to support all kind of models.
Admin vq for multiple use cases including device migration demonstrates tha=
t it is a good fit.
SR-IOV, SIOV will be able to utilize for device migration, provisioning, le=
gacy and more.

> >
> > To me, two stacks are practical and common to target at beginning.
> > i.e.
> > 1. passthrough mode
> >
> > 2. #2 above,
> > I had real technical difficulty to make #2 practically work and build a=
 scalable
> device and have converged api with #1.
> > The option we explored to have admin command in some register of the VF
> specific for #2 is partially fine targeted for use case #2 only.
>=20
> Right. So - a way to send admin commands to a VF directly, perhaps in con=
fig
> space? Do we need more than PA+PASID+some flags?
> Want to try to write something like this up?
>=20
It cannot be in the PCI 4K config space for sure.
It must reside in the virtio config space.

I am sure that this is used for passthrough mode of #1.
So, can you please confirm to write this up for mode #2 only?

> > A variation of that for the member device, there is owner device, hence
> admin command on the AQ can be used.
> >
> > If we can converge on common virtio interface between #1 and #2, great.
> > If we cannot be due to technical issues, we shouldn't step on each othe=
r's
> toes, instead build the two interfaces for two different use cases overco=
ming its
> own technical challenges.
> >
> > And when in future, someone want to implement different kind of bisecti=
ons,
> they can propose the extensions.
>=20
> Not good at all, this means the interface is very narrow.
> Your "propose an extension" just doesn't work practically.
> It takes years for things to be widely deployed in the field, by the time=
 they are
> there are more use-cases.

We usually see it getting deployed in < 1 year time with new spec advanceme=
nt pace for many features.
Building something for unreasonable amount of time without use case results=
 in missing the immediate deployments that happens in 2024 to 2027 of 1.4 s=
pec time frame.

> We need something universal and admin commands were supposed to be just
> this.
I don't see a universal solution for all problems for above #1 and #2.

Solving above #2 will cover large part of deployments that users are doing.

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

