Return-Path: <virtio-comment-return-7863-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1415CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:57:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 167BB13E5AB
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:57:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E6DB99868E0
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:57:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D45079868DA; Thu, 19 Oct 2023 09:57:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C47D39868DB
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 09:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+cCxAgPCKM4D/BRpamlOIeQSqrEcLnbQ4u0Khm64JBI6ngmYtok2KJ6dirrSoBF/r3ehbZbNc+kimJh/hvnFg39PUfTSbcqyQ4y7/9OIAaTpr0QRSDdwHxd4IA0nQK7/OEY06Vwd/o5wk3NB/ki+GvbDdA/68ZI4WDrtRq44Qx1XdZvVp3JqVosw3Pkm2peiB1uu8BuTEFm6tQU5OCRu4cpYxiuuMBSv5YRaqqwYUuSfpeshSLeI24BU3IKoU7R4Eg+t3648bMYw/aAktDAjgof7OdOAIM7kXXFxUSidJO52GabxZ0gHTGEICOBs5kNpBXHvbqZBGhQVXLt52Dqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wbyniMu1bZP1ZCN/5vDFMs8uXdrLja3+o2jh4HYVM4=;
 b=R/iJ6zYj3k4LVQjxJ9yTI36LMMxDh3JI5BnusImffTSfKLv3PPoP3+mik4szYl6TTxkjmqAsmL0PNRirZ+cvKGk4Tds/mIoLIpHbOedWn9t3HZcrEBvuGI9n3FZy8zHl3iL/5j8AIaYASEclvNkjs8SW4cWmEmGEj14wfwO73aNJyxT4hm4vUHpOvDNyIkpW4x+dgb/I+7PSMt7NqbLO/kNcNNtKkKeNhMw76dGDyXuFvxIJ2S4WpqaSRn6QxmNHQWJsl8rzvRChfbcbOfmnGVuJcizQSa3382yADKtbW7fxbXHyjkSf/BQiFqawFp3Alcs/0wSHrLWrYaqTFNhYzg==
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
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCAABMfAIAAAMfQgAAfqwCAAAPbEIAAB1IAgAABSRCAAAMRAIAAAebQgAAElICAAAB4cA==
Date: Thu, 19 Oct 2023 09:57:41 +0000
Message-ID:
 <PH0PR12MB5481B862BFC6521DF3F84277DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019020413-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810A5AA248384392FC8169DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019041629-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481373C657AE3EFA123D1C4DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019050553-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819E1EAA41F3CAE420942ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019052328-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FA0DF0C6ABEE8D9A47A7DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019054108-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231019054108-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB7927:EE_
x-ms-office365-filtering-correlation-id: c1955f2a-fcf3-49f9-ed7b-08dbd089d5db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 a7UvONfOXtmm+diR3Sac1O94s92oT4+TDH5ELGPHCUcV8rvI3YIds/+hzRm8xD0HeKRVy9raU1qZKJ7+pqnJmrqOMCHdG7OcvrmdUvK8bRob8QPn+KSsJ6e9d3Krp8oP0e3FSvuOHR8Oz8/eauEZZfl6M1wpJvrN+YV07gYumpQ1WlkOY7NWQMvDmLDcyciZUiRF/HQ0yC56cv97WN3icpZX9w7wT449tNS1j3iwoTEIQyOfkCmW8xOrRRYQNR+c1rQeCuc/I2+bRWrS2I1qcpj+zemLYkYL68HXbxzBqi6GPLyYDwsiVbYEyQym4xd4M9TQy2y43xYAcjYo0Eys3bjBvCU04HKt4cGDmzxioV9I3V7cKfkQiU9UpuORPYh7hn+jol9yivy54RwzF9Y6Io7KFMRIi4UhneeTYFJrZW37RBRTryKjyrca0X2HdV6FbA9suet2bU8MwQlWvMRnw8Zz2edbXbuFUDxGs2IqvW5Qh9TzJ2XiS+Xvi/IyOMdEeyXZlypzAblHJTRqdgMiPOFJwJnWVuvFrlsfV/HvSgZfVqxJFFGW24nQfEfAbt0zEv0SK6sB77styn3V85/XdisIvXsIFtTDlq5ZIhkm1uPZkWkiTP7bVtSNkcp9yl6P
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(136003)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(55016003)(76116006)(66476007)(64756008)(316002)(66556008)(66446008)(66946007)(6916009)(33656002)(8936002)(478600001)(54906003)(71200400001)(8676002)(4326008)(5660300002)(52536014)(41300700001)(86362001)(2906002)(6506007)(38100700002)(38070700005)(55236004)(107886003)(122000001)(9686003)(83380400001)(26005)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?v039zYhBJimg7MBBmKTL3bjBuoXlIEy0maveqgccyXA3PTJ/BlE1tBThmhI1?=
 =?us-ascii?Q?+IA11oEsZtpK8VhPCHsTGXpE0dPrqy7Ifg4QurVgH8IdLYRGZQ9lvtkjQGKc?=
 =?us-ascii?Q?nIMicG+m2qfkdsvyBJeQ+tNeEqGHm99Q0cqFYaT97uG5d0opQiAbKusOklYl?=
 =?us-ascii?Q?4GSiktTQbQM9TwmJ33azRtO+CrNJBqQnn8oPxQP3wdYIkFB4FrE+DEjPQ/nT?=
 =?us-ascii?Q?LfLj95VgYGsdgxRcsxqZIQXra60mh5/QrGVCngOJFlLmAbE6FVV5U56QLBvv?=
 =?us-ascii?Q?bqMRxVxmvjDmtu36QjEbIW1X67AwockCeKIQSJMT12ykYaL83Mw9Mwuu6VRv?=
 =?us-ascii?Q?gvARMzGcWTWyXb1pclri7Nx4L402p6zG8enYHn5fpCRsZw5+5XimMJd/lEIR?=
 =?us-ascii?Q?flksxZHPqIZ3bdMMtx9IDnWnKR1NERWMqwoL3nhmKJ4XZQu9Yk5x81IsBZBE?=
 =?us-ascii?Q?nQo2+qOAmazcrIK1VnJY7cJ7QbxYV0vrpmjUm2v8sAVsEed4z0X3LjSVtz/t?=
 =?us-ascii?Q?5hcdX5aakDF7K9cSMiWFP4SEsmLh5hnm5pCAJelVATsFGo7+uwop8hUkehfP?=
 =?us-ascii?Q?dddnHBuUMbq7uXfpH/vkMNPxZSCeQFX8lEf4BW8aDcCcFWNGbsGZdE+4M5VT?=
 =?us-ascii?Q?te/sSEQZz8NYNGc+/gFR5+BhG3Mbd5SCOmdzCh0ClpOEg9f8plGjvbj/MGg3?=
 =?us-ascii?Q?c6ayydlcdn8OIgEiQov9E6FYoKE7Fm3ig0LZxWq4JrbSU1Cjc1MM9uPj9dce?=
 =?us-ascii?Q?2b48UIkztOnBOmZ+5Le/7H9XfswgNgyGBAEF3227yWw9cyPBeABwIz3UNESB?=
 =?us-ascii?Q?oQ0CkpUtD9UkltunhThlwCUVx5nLcLlx1aNmgSr1ztdwPpMZPKbrPuyqwFSP?=
 =?us-ascii?Q?u0nUFpGDhFsf0P9B2E5BujZs45dolCDKjlQxsAgp4bmXc32lbIRJERsbItZ/?=
 =?us-ascii?Q?MBQ5vQx7yMGTxT/2N++D1sTqSKB6sS40ntZARlDLxs8fAWhUFeCckEL0NuBp?=
 =?us-ascii?Q?UNrFR6l8Em6LgfFqxz5BGGDn9V0Bf/O3w4HXCnlOyiJGachg2eRITyyhxtuy?=
 =?us-ascii?Q?CkbPJ3gIr9lUIH3UozUPjLt/Ctu8tIYn4mGlnjvpqzrNWEUkjIAho+hrFGcm?=
 =?us-ascii?Q?yG9FIwL6Z1foEI16g+LkhqH0tYkx0F9X2hli/7gQMpgdI4iWUakAC/qBnde1?=
 =?us-ascii?Q?nEV8OZBncqpUVZvTfui+b2FjDrLfQ+iHYBwQ+pxrtth9f9/cRkbiOlYNYmg5?=
 =?us-ascii?Q?r4mXCcICJU4c86m5Gra7KAiVrc+qtXJyIzQCcDXFcW37vkod8YXDfkakKWXW?=
 =?us-ascii?Q?bbnENVfnh3UJD+mBwDdvfgvWm7Y2eWloTY3VXj9yJkQXUuwjb8aHqvTZVcES?=
 =?us-ascii?Q?5M6uCpVerV6y4gJEDtQ38NUYFyYYcPfYqu31ImIQJR/pFSKxD/TlgithpBOh?=
 =?us-ascii?Q?BLpEygMSu334H6d0hE4OAz1bAnAAf7qpAaRm+cUCoRbGNKEE83TElLmfvRDd?=
 =?us-ascii?Q?03Qm9cb9dA0neCzPqIQMX4bp/aL0WGMWqISXdqdNwEHbkUB2FrvpGwdEjR2e?=
 =?us-ascii?Q?5LIk0UozF2R5UHvgmxg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1955f2a-fcf3-49f9-ed7b-08dbd089d5db
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 09:57:41.9885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jmKB63aSkDdU0bDdELgsNKHSnppynn2xXYVI6tLeftZHal7GdDVkem74FZt5Xg62EsSdCHmzfFM02uvY3pNQZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7927
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, October 19, 2023 3:20 PM
>=20
> On Thu, Oct 19, 2023 at 09:39:48AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, October 19, 2023 2:57 PM
> > >
> > > On Thu, Oct 19, 2023 at 09:20:22AM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Thursday, October 19, 2023 2:41 PM
> > > > >
> > > > > On Thu, Oct 19, 2023 at 08:58:10AM +0000, Parav Pandit wrote:
> > > > > > It cannot be in the PCI 4K config space for sure.
> > > > > > It must reside in the virtio config space.
> > > > >
> > > > > Why?
> > > > Because pci spec has clearly called out to not place any device
> > > > specific things
> > > in there.
> > > >
> > > > Citation in pci spec
> > > > " It is strongly recommended that PCI Express devices place no
> > > > registers in Configuration Space other than those in headers or
> > > > Capability
> > > structures architected by applicable PCI specifications."
> > >
> > > But of course, we'd place them inside a vendor specific capability.
> > > We just need a version of virtio_pci_cap64 that's suitable for expres=
s.
> > >
> > It is one and the same thing, wrapping dma commands using capability, i=
s
> same as open coding them.
> > Read only cap should say where admin command section is located, which
> must be done when the DRIVER_OK is done.
>=20
> This seems very different from your current commands.
> There's less value in reusing commands if semantics are subtly different =
..
>=20
I mean read only cap points to a location in BAR.
And mediation software who fully owns the member device, issues side comman=
d there after DRIVER_OK.

> > For sure, we wont use this for passthrough member devices.
> >
> > So before discussing where to place them, it is fundamental to agree it=
s use
> case which is #2.
>=20
> Again components need to be versatile, not just focused on one use-case.
>=20
Don't see how one can make a tire in a truck and car both. :)
We are trying, so lets see, may be we can.

>=20
> > >
> > > > > My concern with virtio config space would be that it's not
> > > > > orthogonal to other things in the config space. E.g. you need to
> > > > > look at feature bits to discover presence. How does this work
> > > > > while you are documenting that device can undergo reset at any ti=
me?
> > > > This is why such solution cannot work for passthrough. It can only
> > > > fulfil #2
> > > based approach.
> > > >
> > > > > With a capability you can discover it without poking at features.
> > > > >
> > > > It is discouraged by pci spec.
> > > > Pci caps for mostly doing very small init time sort of config.
> > > > Not to run frequent commands.
> > >
> > > Interesting. where in the spec exactly?
> > >
> > Same above section, section 7.2.2.2 implementation notes.
>=20
> I see. So the valid use case is access before memory is enabled.
> But in fact, e.g. FLR actually disables memory does it not?
It does. This is why all this VF resident registers only work for non-passt=
hrough area.

> So if we want same behaviour as you are proposing here then these need to
> work with memory disabled yes?
>=20
> BTW they also recommend against read side effects which virtio violates :=
(
>=20
Yes.
This is why staying away from these caps which is not the vehicle for admin=
 commands.

>=20
> > > > > > I am sure that this is used for passthrough mode of #1.
> > > > > > So, can you please confirm to write this up for mode #2 only?
> > > > >
> > > > > To me it sounds like a generally useful capability that could be
> > > > > used as basis
> > > e.g.
> > > > > for admin command transport.
> > > > >
> > > > Unfortunately, it cannot be pci capability.
> > > > It needs to stay in virtio area and only fulfill use case of #2.
> > > >
> > > > > > > > A variation of that for the member device, there is owner
> > > > > > > > device, hence
> > > > > > > admin command on the AQ can be used.
> > > > > > > >
> > > > > > > > If we can converge on common virtio interface between #1
> > > > > > > > and #2,
> > > great.
> > > > > > > > If we cannot be due to technical issues, we shouldn't step
> > > > > > > > on each other's
> > > > > > > toes, instead build the two interfaces for two different use
> > > > > > > cases overcoming its own technical challenges.
> > > > > > > >
> > > > > > > > And when in future, someone want to implement different
> > > > > > > > kind of bisections,
> > > > > > > they can propose the extensions.
> > > > > > >
> > > > > > > Not good at all, this means the interface is very narrow.
> > > > > > > Your "propose an extension" just doesn't work practically.
> > > > > > > It takes years for things to be widely deployed in the
> > > > > > > field, by the time they are there are more use-cases.
> > > > > >
> > > > > > We usually see it getting deployed in < 1 year time with new
> > > > > > spec
> > > > > advancement pace for many features.
> > > > > > Building something for unreasonable amount of time without use
> > > > > > case results
> > > > > in missing the immediate deployments that happens in 2024 to
> > > > > 2027 of
> > > > > 1.4 spec time frame.
> > > > > >
> > > > > > > We need something universal and admin commands were supposed
> > > > > > > to be just this.
> > > > > > I don't see a universal solution for all problems for above #1 =
and #2.
> > > > > >
> > > > > > Solving above #2 will cover large part of deployments that user=
s are
> doing.
> > > > >
> > > > > OK. But additionally, if an interface can cover a couple of
> > > > > use-cases we can be reasonably sure it's going to cover more goin=
g
> forward.
> > > > May be.
> > >
> > > Yes hard to be sure. But if it can't then that's a good sign it's pro=
blematic.
> > I don't see it problematic at all.
> > If we write the virtio specification for device migration in 1.4-time f=
rame, I
> am 100% sure that it will be deployed before spec release.
> > Other uses should be able to extend it as they evolve and explain why t=
he
> current one does not fit them.
>=20
> My experience tells me this results in a huge mess of incompatible interf=
aces,
> the further you go down this road the harder it becomes to add new things=
 as
> they conflict with old ones.
Too abstract for me.
Will focus on the above technical parts that is key to draft a common inter=
face.

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

