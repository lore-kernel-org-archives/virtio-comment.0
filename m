Return-Path: <virtio-comment-return-7836-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB55CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 07:30:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 387E5799AC
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 07:30:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 13BF49868CF
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 07:30:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F1E429868C7; Thu, 19 Oct 2023 07:30:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E1E9B9868C8
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 07:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6GZzZ6zhF6kxYF9pS37uLzBxZ8+nBt2clE+cezj4bXB+pXM2xF9GqgfgPxrsHmjXJiN+uD/kTPjN97Rq+lKabyCNSTLO1fqunl7X7t4BlIudbpUi0EUfoQS3wH9FqiauXyY2eMMCM28p4D+8W/BtvBgFoX9fTRrTYPHYuk8I0oIj3l77LWsd/7LdJJGLrgtxb9HCGkEs+Wed71bqAfVhu3kVz+KJdIxDJA1ClmPpcBgv5Y7iQRJT4EqCgw+2Rn0r+2kK1wa+R7TdEsJmudk0Mc8V+aupcMwi2PFAHLmowhSRdtv98VlD10gXWAQRTqSskVx5RzyqPHBu4ipsXH6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvtTpIyTqWFEQtBmPYjH1JvRW+7dtEq71yP1MIxqxbY=;
 b=hqAVjMfB/7OZehKUKtXpmiVH9kvv9+2EifUYoQUXmuNpdaHokvcuGweyOjLoNf9V5OTISegMOEe3XvVd4dCgu9GAU+8JVVlMHQ8/GySVo1IYi2/murA7Vwhwqlt5J+Ct2fzSUhF0SIvdiE6W+k0gAKN18kdcGkmacHTox1NcieyV7Xx0B4dkE5hNdeZeEHNcswwBVkSFBuFZzCerDiRnI6qBeotFjMVKV0FpCdMuzHNmimJkM7To53yjpucP56RCePm1j9afC6FO7J9HDfVsieueB9l713FOLnaWK82J9GOiqfa38SZekS4CC3DWIPgf4YM0qafYVaSKWhGT88WOKw==
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
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCAABMfAIAAAMfQ
Date: Thu, 19 Oct 2023 07:30:09 +0000
Message-ID:
 <PH0PR12MB54810A5AA248384392FC8169DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
 <PH0PR12MB5481F8312139BB197CEB024BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
 <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
 <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMF4JVEQJ6skT2DrEWjop6wjKS6ad6dW2UNOA1oRuPKQ@mail.gmail.com>
 <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019020413-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231019020413-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY5PR12MB6346:EE_
x-ms-office365-filtering-correlation-id: ad5a0418-3894-42e4-eb99-08dbd0753936
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9H5YWxz96EgccNT2tlC4vtz3/ZHrcPAxUOR+p/iap8fCVzZNRQGQKykZaE2XkxVa1bDNTaeERBxEwdFfSBaCYTOXMZzPG+wab4qofSFiuVkCB39exRZ+scg63R8+Cp6XNOEOBhj5T3IboQeDO9iSklNIeBkBuVQXDVKUC6QIC04CG+dK6c5ji1gJOTm3rdQ+NVtUPFwRiPYr3h00XT6UnOkdoQXZNJjZh3MQwpDt06e+78yaJSI/eXAE3WoxjY6TxzJ6INaXyYvtyUyxSX3YRgOsq6ujt0SM1frhjPdFTn+sqXUw2iQiKjVyTKAIOKziNTbolnb3YCeXqqKgALyVx7MZ4Ay+Ib1hbeYA6nY4r2/4wTWp1vak7xN+YAhfNKaZDezn73eTL/su7r6eDir1Q2RGo3F0jmL8N1JeNFPl5UXCKhP5M/TQRRzfi50SBVvOzqi93r/c2GeycwrAOXS9LS0HgR1kfgohxKAZ6s9smi6TYoslaLHyqvnaZk9Ir2jKLQfrVstpEmecRZRD7DSrLC9dsrpu1KPwffolOE1Rf1Maf44Zg+/AA0QZ62BsOcXrUFsHUW/WACglfyShpev6M44NTEFM37Enmx1VYDlUll021yd/p0l0X2fiuzkTQ2Or
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(136003)(346002)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(55016003)(66899024)(66476007)(76116006)(66946007)(66446008)(64756008)(54906003)(66556008)(6916009)(316002)(71200400001)(478600001)(8936002)(8676002)(33656002)(5660300002)(41300700001)(4326008)(52536014)(2906002)(86362001)(6506007)(7696005)(38100700002)(107886003)(38070700005)(55236004)(9686003)(83380400001)(26005)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ydUp0TYJIHLuBd4e+n5d3ee8KPGAl/3IcascgreNvMpBfCXgvCai8sZ6EFvM?=
 =?us-ascii?Q?2r6bIcy5tA+K6Pu/AOWPYFR2b597jLy0QIuIIG1G0HNQoWbJINyznCY51RxE?=
 =?us-ascii?Q?9JKxpkGF01bkOfQfD5ku7KSlCU/3SM0JXZ0wZo7fZnCGMpZyBITSuu6Y2qED?=
 =?us-ascii?Q?gcRka+bUCIRL1sBYt/NgJ3cRW1JODMepqfyLYmM2BnOAllY0wLp5iYGW+Odw?=
 =?us-ascii?Q?fQHSno9fAzMT528Jarb2n2OGJdzx8PDUgVXknMLc83OMEJEfgZU8mv7zVuHC?=
 =?us-ascii?Q?WYKM6aCT9WvlvPX9ayQSwZEmRofW1bXq1isE3g4EA870krZ61qrTj7VJe6AM?=
 =?us-ascii?Q?3Zz+K2k4y40M5mLfhmZOKXLREPjCh2b6/3vcNvFWtVPDtLC5Hq4O9HSEJz+5?=
 =?us-ascii?Q?/L9hC605xfGLMWM4N8dLeX1HyFkxP+IMoobOSpYpIl7kGZKXVc2Z9uStpeUJ?=
 =?us-ascii?Q?m4CESn4PKvyIZzUNrc76tATalh9GFQD4G8SCqxsE+fOmAzEijMHJ28a01zQQ?=
 =?us-ascii?Q?giGgjz2x/j/podZSqvO5TC8PHYQYZSmr6Hbj4wVDjOmaodnakl/XZcLSwuoN?=
 =?us-ascii?Q?0JaEAlCFrWZJEOFWYv/LCEd4mxzsBhs8SQMHly+GmJDgZWwi8lFHsRLRGu30?=
 =?us-ascii?Q?BK3yuXyPKbdzRchEn/iFqZPQm16MCzOWvNbD1vyUw/8y7ZZGSsWahi3o1L40?=
 =?us-ascii?Q?WcJxeYM4Pei6kNumvDW6tD7wQ57Bhm347mda1Nbns2ZOSA+mkagBvn1arp8s?=
 =?us-ascii?Q?4uaae9gV+RRAnbytl0Fg714rTHGMB8v0suSaVDZgu8fRRuIHYqCU1DxBUuDE?=
 =?us-ascii?Q?v/hn7RJrFBv1Y+7b+a5FQOdxwXVFY7YLLXGLUffDaIbAxbGwc0LRy5S1CfGF?=
 =?us-ascii?Q?xuuissUKrJdn/xPCaWse+w3e7Xf0UZUH4JDLLs2LVFkk68ukuVJCuS/5PMwM?=
 =?us-ascii?Q?QL9STddXyMlLZMqQGU18aBvR1buDYQiJDPk80aLpxg8D+bzDrqF9pt2PFx3G?=
 =?us-ascii?Q?hS+7+6kF4kuEVeW62Vk/fx7WjVl3BeElUOgVycF0w0RdB+0PfglJL7ihSRCx?=
 =?us-ascii?Q?J3279B/bxOH1exFoLgrDvvJ8wLJ7EwuhAhNElMgnr+ipez8TczLjc6dsCfx8?=
 =?us-ascii?Q?kyazl1MqBIxCWWhjZK3mj8oXDc13SFJhzgXqIl3s6X5gvLzb9LMRyq4kAeTt?=
 =?us-ascii?Q?ItEbY88j3K5u1o2MI/P3P4SBQiQ8kEGbzC6I6CGSSkhtM+wLsCZw5kRpOltx?=
 =?us-ascii?Q?3c8+3uhldug3WyJh99w6qSjbxE8lXxs2Q6ltnYnjb8Ak3i4ugUf/m28z6cVZ?=
 =?us-ascii?Q?jXKEpePIkPUHgagyd5hfW7RBmLHDVoLI6qsk/C0KN/lK0IGwvVLlNFTiHsbi?=
 =?us-ascii?Q?Nb6ME9TudupO344jPpD10Hw8gxLvPHe1+q+P1NhDRkOwczepm5XHQYwk8bUI?=
 =?us-ascii?Q?QRebbX6IcUqQo7MBvyVtWtOmGOlc/gWCA8RZ4pHHssUTIW3WsgahwR9URW6N?=
 =?us-ascii?Q?pLe5jPXhgIoNfz+LObwuCTF6NoGAtVHHudO1FwsI0mWmwiHXn3rDIXHY+DHc?=
 =?us-ascii?Q?7vjg+Lbh62v8PAewASg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5a0418-3894-42e4-eb99-08dbd0753936
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 07:30:09.2252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VKY2fU/WrUyYuskS4mNKzO7LS3UnJPwwPY1RTBtSW1dJWc25Kww+ZlEoNgG65VNDnKBVfeshOFchEwHXumiG5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6346
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, October 19, 2023 12:05 PM
>=20
> On Thu, Oct 19, 2023 at 05:31:37AM +0000, Parav Pandit wrote:
> > > How could we make any agreement without an accurate the definition
> > > of "passthrough" who is a key to understand each other?
> >
> > I replied few times in past emails but since those email threads are so=
 long, it
> is easy to miss out.
> >
> > Passthrough definition:
> > a. virtio member device mapped to the guest vm b. only pci config
> > space and msix of a member device is intercepted by hypervisor.
> > c. virtio config space, virtio cvqs, data vqs of a member device is dir=
ectly
> accessed by the guest vm without intercepted by the hypervisor.
> >
> > (Why b?, no grand reason, it is how the hypervisors are working where t=
o
> integrate the virtio member device to).
>=20
> I think it's a reasonable use-case, though of course not at all the only =
way to
> design a system.=20
Sure, there are more ways to bisect the device, specially when underlying d=
evice is not a virtio device.
But one can continue bisecting virtio as well as you listed below.
> Some more ways:
> 2- intercept everything except data vqs and cvqs
> 	I think this is a reasonable way to build the system and has a bunch
> 	of advantages short term. The main disadvantage as compared to
> 	passthrough is the need to keep config space coherent with
> 	device operation - the way to do it is device specific and
> 	might get fragile.
>=20
Yes, I agree it has short term advantages.
This is not future proof as you listed.

> 4- intercept everything except data vqs
> 	Here we get another problem in isolating some vqs but not
>         others. the problem becomes bigger is that you also
> 	need to communicate control vq to the device.
>=20
Yes. for non virtio device vendors have easy way to support.
We supported this for mlx5 devices.

> also, with both of the above options, we have a question of how are we
> communicating with the device to keep control path and data path in sync =
when
> device's dma is mapped to guest.
> using PASIDs for isolation might work but again, support is far from univ=
ersal so
> we can't really assume it as the only way in the spec.
>=20
Right.

> Absent PASID the popular way seems to be shadow vq which basically does
>=20
> 4- software intercept for everything
>        clearly that's a lot of CPU overhead, I do not think we can focus =
on that
>        as the only way in the spec, though some hypervisors might
>        already have a lot of migration overhead to the point where
>        virtio can afford any amount of overhead and it won't be
>        measureable.
>=20
>=20
> I also note some or all of the intercepts can always come and go.  For ex=
ample,
> a common setup is that if target VCPUs are running then IOMMU will inject
> interrupts directly into guest - if not you generally trap to hypervisor.=
 Similarly,
> shadow vq might be active just temporarily.
>=20
> Which approach is best? I feel ideally virtio would find ways to support =
them all
> rather than deciding on a policy in the spec.

Cooking all the modes seems frankly very daunting to me specially when ther=
e is no existing software stack to consume all modes and no device vendor t=
o sign of for _all_ variations.

To me, two stacks are practical and common to target at beginning.
i.e.
1. passthrough mode=20

2. #2 above,
I had real technical difficulty to make #2 practically work and build a sca=
lable device and have converged api with #1.
The option we explored to have admin command in some register of the VF spe=
cific for #2 is partially fine targeted for use case #2 only.

A variation of that for the member device, there is owner device, hence adm=
in command on the AQ can be used.

If we can converge on common virtio interface between #1 and #2, great.
If we cannot be due to technical issues, we shouldn't step on each other's =
toes, instead build the two interfaces for two different use cases overcomi=
ng its own technical challenges.

And when in future, someone want to implement different kind of bisections,=
 they can propose the extensions.

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

