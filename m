Return-Path: <virtio-comment-return-8443-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4F6C072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:52:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B90B877C60
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:52:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 79166986E2F
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:52:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 463AB986E1C; Fri, 17 Nov 2023 10:52:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36264986E1D
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 10:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpNWzj/N66RbK0alqZr0blwAAUOaWDdDcqWQeCzUwFT+Z30tYBwGY3NHgVmGTw3PZu55mq4AxfstizPidf/Bb+bZts8LfFqciLtvq9UdJo6fqKkYCUUpPqrCQD9ZFkKiORjW+q3v8p9fdl22kPL8LQXarUyoCZ6UPU8v2tcLfDVOT2Ef6vVPyNDiCBNDByHkLiUbIYEOM/aUR6S3KCVHIU13AEc9AMgTJM6yMfv5g0Cn6FiLMWnkI8vwfB3kpFyQtf/faTcBvBOQiFTEEVpmIjQQDocU6/Wk1Se9ufp8uozZEcYbTxJPKgU2HeGIWs63wn5SHXWAguxeK+NdAaYFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7gjg6TryapiM2H/WrMOb05BQca5aFuZqSNHhz19ElM=;
 b=XR8VGREzCHh7e1TBAudzb+XdCl+wywGICUgRGce7ViZVL6oAnQweDM8TJpNVGglECj+y6cIYcf7FdGT88eJ7tTaoFROpLOy0h9uxe4svT/uhZ4kMfKRbZCo/lJ7NOdC2eo5Pnoh1y+ZhxhnhZh83R0Z7ZCb3FvDrFyixAb5hrl7ILU3QYx5mRmAbmbmf8qhNOHCgJLPaK+SlEUzv1lLC4q9Xnp6rFOCjZU4bkPDx24WHPZp43gerMC312M275+cq+nWnWG1F1zaRJEiUqmkd3epLJjBKf2VzfYvlXT/8uv6VsbarmgjH9O+IdFl7Fq+A1kwecJPSVQIuL5PwFBVe6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YIAADsiAgACQwGCAAGEbgIAAB4aggAAG2gCAAABcQIAAA3mAgAAAL+CAAAy2AIAAAzkw
Date: Fri, 17 Nov 2023 10:52:49 +0000
Message-ID:
 <PH0PR12MB5481632B9E440DDCBEEA7B75DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117044428-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E8342B26739B852B592FDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117053117-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117053117-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN2PR12MB4239:EE_
x-ms-office365-filtering-correlation-id: 55ec569d-45e1-48b7-f747-08dbe75b575c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wyo2tL0TXLKYAQSD6en3X1JuUFO2GEtXFo6xHhFrqkmRz/joWDujFZAFlSxKOHp7ZPCnDgAwtbsHwf/MsynuvjqOuZyVnRWzdgcwM/khC4BNJ6wHksEdOg7KDnlUvrIczhxvPqONcndw13T5ub+luvgKKxpabAhoROS/gLWMMnX6yqssykVIik1KsSoLH7314QepEKkBlagbzG6rntFA1qWRV+iR042BQ5kHWNQPWqDycNw0cV7LyDGsOqyhvtPKkFXd2DtACjIKn4Y++Pg/mqqn3gWLHr43snqkm0faMXCiso1A28Y7N0DylHg8fllx4TgW4PePzKTQZxwF2M4LQ/qU0qyOlnlPuUSmM8rgTqD5TVCQIHKpV4iEw7I42LKqScKH1xWWolLjNs9UetPPtv5ezXZxz4e+95copJrOYA8IqaSTXpxGjoP0NZF50b+Wak4sch58llYBhjUwJQNU9kk9NggoIoKfQbNMzazE5ZpT1/p9YDdCy9skfqBaViulZYGpOCRW6IMivQkFh6CeDP/0YHIAxF1p4ohbQN4nccvb2qXaMRdhIjIoa17qJb1qSSw+2WpN792aCggajv3ob6+LlxP3WCED/zMSLAW8A+eMdYeV+WqqLJIeYpxQ89m5
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(136003)(376002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38100700002)(55016003)(2906002)(5660300002)(8676002)(4326008)(52536014)(8936002)(122000001)(41300700001)(83380400001)(54906003)(6916009)(316002)(66946007)(66446008)(66476007)(66556008)(76116006)(64756008)(38070700009)(26005)(478600001)(55236004)(33656002)(71200400001)(6506007)(9686003)(86362001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?81sUZKwbl6fTN+rkI6sb/Y4pHK34yOyFoZvXOdkVmG6my16K73Y33Omi1Spk?=
 =?us-ascii?Q?nngRK7AZ+mT/YDewPVHTlfG8pc7FlqHvsC49caGjcofYWWtMW9xB0KldVaXB?=
 =?us-ascii?Q?7R601keCwwVzkaIa6DIUNPYXbdN0TetvSoxTOOtGXzMTlLgFKsFE5GfAnlW6?=
 =?us-ascii?Q?YAQzOiuK3ltKefoiJAI7bdcd4mVXKbL9rEF+WXsJ4HXe6F8XSFQMAwYv6GjZ?=
 =?us-ascii?Q?fRw90Iigl7XBF08l2e3RKg/+mcWrQYzS6IGKHBdq7MhObPEah4C+ZTqPhkX8?=
 =?us-ascii?Q?PITfGyxvihJL8ke0vWLZvf60NDwVYjcBbBqqavnA5pflVerQTAFplVLbW9LO?=
 =?us-ascii?Q?GwdVdnJKj0JMS9GXr8NYW4g90Qt5xFVLRSPVc2uoKdpLSB4rdFNh9x83hqjK?=
 =?us-ascii?Q?xpS7DU4gkkSEqM4+YGASPkxG8yN5EYfj8ZJltE+wfmMSQkWZj1C4yKutzH0t?=
 =?us-ascii?Q?NIvhC3ecya1F+hHzL9+3RCyOxFFk/Np7i3CtxLSriEPt3xel2zoMsmye5U2o?=
 =?us-ascii?Q?YmuC+MnzIPLbZ/XbrhhmFc+TY4FcFD/jzXzhFd+uZclAnT8YGhUtHeSIG2+x?=
 =?us-ascii?Q?JU0eH7tJhcJ64t+iPKYBk5uY5hl7OidDRnlWl7jq+DmKPjqVHPvAXAPzyORB?=
 =?us-ascii?Q?e6jKUT4iAJzslm4OKsy5vLsQHNyJE7SXscPcQ01XAUgpunBZCuJlZFHrMLaC?=
 =?us-ascii?Q?cPt5CFWN6mEuiZVZlDifWJaxzwqsLukuJRZGTu8ckVzEimJi01KmDNbTC6tw?=
 =?us-ascii?Q?1MJ3WPaiKUVwM1AaUYGcvxe08Hw/c+HKLWK+tD342NOhKWLONmBJfDx0el4D?=
 =?us-ascii?Q?GBVzSuzvSygCgWrFmM1rZcmNTO3IBn6i0v/Oc0/V2Ny/iTcG8NwVKTqEMbCk?=
 =?us-ascii?Q?2U7eIAuQc5RoQ+yxvqwGfktOBQkUf+UfcZrwaVKKZnQtxL4S2fNOhh9Sq0wM?=
 =?us-ascii?Q?IfN11aIvAg4CZwgG27+zAGuMLqf1rZfCD33Zz80+cDHy64dGDijM8dkxj49e?=
 =?us-ascii?Q?107y9nnbMd+fOkKwwsiiUezGLH0Mta/mbv4yy/dcFWi2qExX8CGe4c4utkvH?=
 =?us-ascii?Q?wNx0HbtgrzURVopx2kCPDFKUV6k1rLT3/B8VvoBkyBM+JSXIJPHj0nEvridC?=
 =?us-ascii?Q?uUa9si4dux6nGhmq9J2Y8LPpvanaWZ+F0rQyTumMJk0P57dJwK6Sz/jV72EC?=
 =?us-ascii?Q?TacEcmhyn36Mlo8h320TWJFZmZ/ogDmhmGJe+dbBBlTDyVvb/9LB9+N4LCXN?=
 =?us-ascii?Q?GejUGx6GuwkAL8+FOCgnuNJP1razM2OuMqgJA3EVhbf1ax9AVpu/RDFQuIUJ?=
 =?us-ascii?Q?/RO3rGu1Jabq0MP70MvUROn4nNj0O2A2ZLAwgI/eox4+QUIpdhFddfsmwe3H?=
 =?us-ascii?Q?IURoUN0mK5UwbgpXtlcuNOIFfLmPrIk/iw0PrGr+YvVoNxJvhgWvSLnKFC2U?=
 =?us-ascii?Q?Agv7GGRGKUifpPcXWx5JqpELjx+6mvevK0gS8p4h58ExsENA+lB/2eb19N8I?=
 =?us-ascii?Q?+dmC7alaimiOWNRErxHu+4U2kFuoAZn93T+gyJq2UMFg8salruJp90zb5V4g?=
 =?us-ascii?Q?90B5v9/jFs6SthC4UvQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ec569d-45e1-48b7-f747-08dbe75b575c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 10:52:49.6713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eaLb2WAw46NpcEonLtnckggHChnmHsHq3L3UZ/QUBz/vJrn+vM5I99joOgiTyG2EnM9O+N09faGFsYaUsoie1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 17, 2023 4:08 PM
>=20
> On Fri, Nov 17, 2023 at 09:57:52AM +0000, Parav Pandit wrote:
> >
> > > From: virtio-comment@lists.oasis-open.org
> > > <virtio-comment@lists.oasis- open.org> On Behalf Of Michael S.
> > > Tsirkin
> > > Sent: Friday, November 17, 2023 3:21 PM
> > >
> > > On Fri, Nov 17, 2023 at 09:41:40AM +0000, Parav Pandit wrote:
> > > >
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Friday, November 17, 2023 3:08 PM
> > > > >
> > > > > On Fri, Nov 17, 2023 at 09:14:21AM +0000, Parav Pandit wrote:
> > > > > >
> > > > > >
> > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > Sent: Friday, November 17, 2023 2:16 PM In any case you can
> > > > > > > safely assume that many users will have migration that takes
> > > > > > > seconds and minutes.
> > > > > >
> > > > > > Strange, but ok. I don't see any problem with current method.
> > > > > > 8MB is used for very large VM of 1TB takes minutes. Should be f=
ine.
> > > > >
> > > > > The problem is simple: vendors selling devices have no idea how
> > > > > large the VM will be. So you have to over-provision for the max V=
M size.
> > > > > If there was a way to instead allocate that in host memory, that
> > > > > would improve on this.
> > > >
> > > > Not sure what to over provision for max VM size.
> > > > Vendor does not know how many vcpus will be needed. It is no
> > > > different
> > > problem.
> > > >
> > > > When the VM migration is started, the individual tracking range is
> > > > supplied by
> > > the hypervisor to device.
> > > > Device allocates necessary memory on this instruction.
> > > >
> > > > When the VM with certain size is provisioned, the member device
> > > > can be
> > > provisioned for the VM size.
> > > > And if it cannot be provisioned, possibly this may not the right
> > > > member device
> > > to use at that point in time.
> > >
> > > For someone who keeps arguing against adding single bit registers
> > > "because it does not scale" you seem very nonchalant about adding
> 8Mbytes.
> > >
> > There is fundamental difference on how/when a bit is used.
> > One wants to use a bit for non-performance part and keep it always avai=
lable
> vs data path.
> > Not same comparison.
> >
> > > I thought we have a nicely contained and orthogonal feature, so if
> > > it's optional it's not a problem.
> > It is optional as always.
> >
> > >
> > > But with such costs and corner cases what exactly is the motivation
> > > for the feature here?
> > New generations DPUs have memory for device data path workloads but not
> for bits.
> >
> > > Do you have a PoC showing how this works better than e.g.
> > > shadow VQ?
> > >
> > Not yet.
> > But I don't think this can be even a criteria to consider as dependency=
 on
> PASID is nonstarter with other limitations.
>=20
> You just need dirty bit in PTE, whether that is tied to PASID depends ver=
y much
> on the platform.  For VTD I think it is.  And if shadow vq works as a fal=
lback, it
> just might be reasonable not to do any tracking in virtio.
>
Somehow the claim of shadow vq is great without sharing any performance num=
bers is what I don't agree with.

And it fundamentally does not fit the generic stack where virtio to be used=
.

We have accelerated some of the shadow vq for non virtio devices and those =
optimizations are not elegant enough that I wouldn't want to bring to virti=
o spec.
A different discussion.
=20
> > > Maybe IOMMU based and shadow VQ based tracking are the way to go
> > > initially, and if there's a problem then we should add this later, on=
 top.
> > >
> > For the cpus that does not support IOMMU cannot shift to shadow VQ eith=
er.
>=20
> I don't know what this means (no IOMMU at all?) but it looks like shadow =
vq
> and similar approaches are in production with vdpa and have been
> demonstrated for a while. All we are doing is supporting them in virtio p=
roper.
>=20
IOMMU is present but does not have support for D bit.

> > > I really want us to finally make progress merging features and
> > > anything that reduces scope initially is good for that.
> > >
> > Yes, if you prefer to split the last three patches, I am fine.
> > Please let me know.
>=20
> As here have not been any comments on 1-5 I don't think there's need to r=
epost
> this just yet. I'll review 1-5 next week.
> I think in the next version it might be wise to split this and post as tw=
o series,
> yes.
Ok.

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

