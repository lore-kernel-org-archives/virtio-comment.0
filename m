Return-Path: <virtio-comment-return-8637-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23463C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:33:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 77C2F429A7
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:33:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 602CC9863B4
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:33:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 44B9F98638E; Mon, 27 Nov 2023 11:33:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 34729986394
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 11:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTqlTttn3CGqUypXXBUNQtHioVxZHm50gYVmcOSbTEkbDbc3dUF+Ifcej7GQ6CZ06ayzakvqMJKmQSc/4LUJSUWDcBC+p3V4v8sR0NiPg1lVNiJR9teaursz9SrBlrxybCTmp+o9dn3sw3Cb4mxEsYlmRK09UP7FZir1bbjVvSPKLmL2371ek7qA5K2j3OJmaDXwq7yO+llxpF8r3Bk0EObEoYXCEltPweGbnARiY2Ltz38JS3DlxYkLutrtzpSwV3Hur2ifOSXqcYYLYlWIzjxQyslfIwlm41BdgsuBzSpC4NpnefosuxhsfNXUIPmgrJxtjZplLPM5sSvHrJl9tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXoqPCu0sNFmMlxKjw/FvnAAVPSJy1CATa3galnCZKE=;
 b=Ne0CEafi+ZlG73JoMjP/uJYgERqRvZlzLkUhqK8XkmGN3A9XUyShVpK/Fhk9oD3aF1aPpkgh+/QJBSqPAS6hlH1a2GcPfir8Ks9U+mfPc4Hw79emv0RkCxZlalmHm2UbyJJKBrrltcDEqVhQPrcIKLpv///T4PEwNLqanunrhxjgXyZQRW1WjZlyNCW4HM/YiqFzDxbAJsJmFCMkiC30qrdnuZjjbs4kn4qj87Ad6mp5L1JkUtSuenvOCMBTdukSZKBWVHeobmSCsXPDDR6Xi4XPgU+j8QX5kY6pEPJquThCwLeVqLmrsNJ4eBtKNNGARHpDfe1GdZLIquS86ezPbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Thread-Topic: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands
Thread-Index:
 AQHaHe6IXCl5jgtp9E+7xZjgBxzICbCH8raAgABJqFCAAEiugIAAQZKwgAA0KACAAATDEIAAQqGAgASfUpCAACqxgIAAAEkg
Date: Mon, 27 Nov 2023 11:33:45 +0000
Message-ID:
 <PH0PR12MB5481E1567D7D27A9BF18D9ACDCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231123092119.2718448-1-parav@nvidia.com>
 <20231123092119.2718448-3-parav@nvidia.com>
 <20231123091129-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481584836D0FD5025B8874EDCB9A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231123174947-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A6DFAEBD321707E31BDDDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124004105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818AFAE1E2B943C9104B59DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124042824-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548126B6C07BFA6271020982DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127061203-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231127061203-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY8PR12MB7515:EE_
x-ms-office365-filtering-correlation-id: 4e227790-951d-4bd5-3d0a-08dbef3cb707
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Z4YZM1pmHsHoyOSKbgzVSy7N7KmINWyT481lYs0CN/4aVcjDE7Ms2Q/xe55jwjtVuEG2RQX0H055vQwJF6jK/2wPcYM51+dY7flF+5TacSwc2XwQSM6jhfJs5Bxgfl6UJMmwsQwyQ6Oj87gP81tiVXbaCtrEjy2dkxUINKgcBdjXWRQWiVcRLLn6ybq0+SJMVblP2Bj0GTyXuuW2GGk7fkv7aJ7LQxRzs8aMissgzGSgR0/ia6MuycqYQEn7mg/0UYGMGu4beV7QoDPatDGhHWGFf3o0WR3Bzl1tWrW8sI7nQ2YXD6qX1oruGIQjx+jHuDc/Ne9E3213iU+llQlz5E5Rvb6ezv/Z4RzGpKrTIN+/W4e1khcZ+fS2Gg/GYN4HgjjLZBJgfnWl8+XUHEBnsxjTZccTZwprZZqPq4vCgExBAbsBT2i0QtZ+90LQbqPTvevFfej5Em2lgATHc9ij/K9nVF6v5PazVOcElfEOo9MJEBEAnzoUxL9/UlsJe1cw7TBRQpTpAmZFPOtV0QpZBCgKC9HAoFJ/g30xpxel9R4Dn2RMqV1ec9AEYF2kmfsfhmjMVpzfiWRbJ6Cvxwc+b9r6vffgtbKWTGtf0/mKyEjG5cSSnKaFsRXwvqGuF17N
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(66476007)(54906003)(64756008)(76116006)(66946007)(66446008)(83380400001)(66556008)(8676002)(8936002)(316002)(6916009)(52536014)(38100700002)(4326008)(55016003)(122000001)(30864003)(5660300002)(2906002)(38070700009)(41300700001)(71200400001)(33656002)(9686003)(26005)(55236004)(478600001)(86362001)(6506007)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PxZ7smbWa+VapwZfcAnyrV/Ylmuc5DVTtzkYUI8OywHnOs1bIPEN1pV/43PW?=
 =?us-ascii?Q?Bm7/4Vejx3w8tPSLP13JqsdKbkK7FXRNIr9ivboL5C4zGi53uhOc7l4aIFmv?=
 =?us-ascii?Q?geEouQ9uqsYcrS7XuoZZU26Do6w6mqkwKrxFgxkdroUPy47cCeoPUzkYORFb?=
 =?us-ascii?Q?1EE1BL7BnaUCVkYiNBt7Qnz2VJcaOjFKo8pHjAkntm5VwMJPytJVU3IEmv1S?=
 =?us-ascii?Q?Xy1ZeFVZf35crIGl8Cf3+1Joj8eHoK0MLYxMqjIwsGbys3ZQ/xGIb3M79Amt?=
 =?us-ascii?Q?BT/beCCUA7ZzC2SYDKAczd4Bdazv6gYpsI04JOmd4Pkk63+tuSAQuJ1KRnmC?=
 =?us-ascii?Q?vkgWdeIgATFWCbV5XMsZKbRLwRjGpAsM0viPy+BX7XB+o92aG2klFPn+kozi?=
 =?us-ascii?Q?vyRhI66Nle+db8i4ww243/siDmQCW+mvWyc0vK63h2HXGjCVcz+k0w0lYa+O?=
 =?us-ascii?Q?zZFuMY5bjX5w1mxP2QaROKNrU5HpfnGdrULJRbGxgvo4ZlRVYlYIp/siOK/V?=
 =?us-ascii?Q?HwBAdXg5UB1z936LtVBFF+66gD314ImgyGvJJidy5CygouFahnce5zZMAN8M?=
 =?us-ascii?Q?Ye9sRqTZ2dWtCQdXOKhyz6UUMBIMk2xkV7tR+PMNRJlU7tJauzcCpJh0+OYG?=
 =?us-ascii?Q?SlyLKMFZo9f6kuN8ZMlu5lZO7NUyvEI1fse7H16ZVXG9HhAOM0hDbjjpVrQU?=
 =?us-ascii?Q?Nxe/5iUyQ7NUSnhjpSJ3c19KLJs7vEnl2EWaP2FTIvAUQ6eisx647NiZAMwb?=
 =?us-ascii?Q?vi8JbwMApYMY39YyDJk08Ak11VmzLI/qKsodCl/QTAto54G5WbQll/cwSzfz?=
 =?us-ascii?Q?kx7czR5quvbZl2eGpmXvzj9fzMMN2QLbxHq8QJ5sWI/tY4egOWNwYUfNB1eA?=
 =?us-ascii?Q?1/CsIFgg3gpbZe3JcMup1uyQ4dCEmjkOjNTb2ywNb5EJZ5zoRkmJ3AdBoC4c?=
 =?us-ascii?Q?YXAqq+kkW4vxJHyoULJ++U+iDOvzBtAevefzOEKTR2Mm836Az/ymMEI4wizQ?=
 =?us-ascii?Q?kQRcBDQl8sethP7DbqeqouDrtfSsB05Y0DybvOGPHnOrBa8XPLCEDq21q7QY?=
 =?us-ascii?Q?ln8ssqbj+gluGuptyS2ja1kfN0TtAFC6XIkmMneqNBmyRHYenD39fpBWvTDW?=
 =?us-ascii?Q?n9FKfdgJx6u0h3BO9BgvaZ9A0dina91JHqC5TCXznH8znVTIeOHCKavpU9ch?=
 =?us-ascii?Q?t+bqDmF+z2K7Xu2psVAJF0GeCaFo3bShoOR0NY/JMtcMD/R6S5ZSB90CI9M+?=
 =?us-ascii?Q?SmtnmBkvv8Mz2hTKLqekLpsKVkcYmk6lfKGGqE50asC47V/pHhP9Bn/gCh9O?=
 =?us-ascii?Q?f0645SrStO06QN/y1ZDExOwBFgKtUTdLpLlafASmG/fIB0o+MBR9G6wxFmOh?=
 =?us-ascii?Q?nhOeiKraZy0qPWY7BQXCazUxgii4i1mh1yfVSdjBfKwvWQfVuGDrV34qvfCb?=
 =?us-ascii?Q?kL2DU78vyPw8GhTUddlgzVx2wlOqBp5CTK5BpQ4E+G9gWc52PFPS1VSCRpOh?=
 =?us-ascii?Q?QNqrlFRrm+lo23dLBbq/ibjUSvwVKEEDynVgoT2ZyG93H0B7wl+6F7tp4oTr?=
 =?us-ascii?Q?AZVkkbaWhI00mQwqsXg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e227790-951d-4bd5-3d0a-08dbef3cb707
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 11:33:45.0701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: impv4pRoG6aTHiv4pAJ8j3uoxo7DHHeeNoFjmN0RME/0wIWrzzLlA221HEKupp/IGD+Wyqw0hhBesWiGEmrmVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7515
Subject: [virtio-comment] RE: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, November 27, 2023 4:53 PM
>=20
> On Mon, Nov 27, 2023 at 10:19:47AM +0000, Parav Pandit wrote:
> > > > > It appears that's not what you meant.
> > > > > I can try and guess what you meant but I'd rather have you
> > > > > rewrite this in a way that makes the meaning explicit.
> > > > >
> > > > If you insist, I can duplicate in driver requirements too.
> > > > >
> > > > > > There are many capabilities here each with a different use.
> > > > >
> > > > > And you are under the impression that dumping all kind of stuff
> > > > > in a single place is good somehow?
> > > > It is not dumped.
> > > > It is structured based on the functionality.
> > > > The config space proposal tends to dump everything in unstructured
> > > > way at
> > > single place that cannot extended elegantly.
> > > >
> > > > For example, Xuan's dynamic array cannot be placed next to other
> > > > dynamic
> > > array of flow filter.
> > >
> > > I don't know what "dynamic array" is exactly but generally, Any kind
> > > of a big array is not appropriate in config space - I don't see any o=
f these
> here, though.
> > Ah, now I see the disconnect.
> >
> > There is.
> > struct virtio_net_ctrl_ff_match_types
>=20
> Now I think I don't understand what this array does at all.
> Why are there multiple entries with each entry also including a mask of
> multiple fields?
>=20
Each entry indicates a bitmask of supported fields that can be filtered.
The type indicates how to interpret each fields_map.
Any new type for MPLS can be added easily by defining its type and mask.
And same type enums and field mask also used by the data path too.

>=20
> > >
> > >
> > > > >
> > > > > > For many caps, it is to know what is supported/not to decide
> > > > > > in the
> > > driver.
> > > > >
> > > > > I can't parse this sentence.
> > > > >
> > > > The driver checks things upfront what is supported while serving
> > > > the
> > > command, instead of random trial and error guess work game with he
> device.
> > >
> > > There's no real guesswork with these specific commands: user types
> > > an ethtool command, driver sends it on, it either succeeds or fails.
> > It is a guess work without driver knowing if its supported or not.
>=20
> What we do not need is both driver and device checking these values.
>=20
Driver is mainly to using to know its valid ranges and to fail the commands=
 early.
Device is referring it for any validations that it may need to do.

>=20
> > > However if you feel it important to do checks in driver - OK.
> > Yes, because there are many parsing fields and good to know.
> >
> > > But that makes cap query an init time thing.
> > Yes, caps does not change dynamically.
> > But sure it is different among different member devices and owner too.
> >
> > >
> > >
> > > > > > Certain caps are max to know what is the range of id that
> > > > > > driver can use like
> > > > > flow filter id, group id.
> > > > >
> > > > > Maybe then. But there's apparently no requirement for either
> > > > > device or driver to put it in this range.
> > > > >
> > > >
> > > > I will add this requirement statements in device requirements and
> > > > that will
> > > make things clear.
> > > > Good point.
> > > >
> > > > > > > For what benefit?
> > > > > > >
> > > > > > For functional work.
> > > > >
> > > > > You don't really explain what kind of work in this patchset, or
> > > > > in the commit logs. Maybe it's obvious for you but not for everyo=
ne.
> > > > What text are you expecting?
> > > > We have undergone all the requirements study that you conveniently
> > > choose to not participate for 2 months.
> > >
> > > Yea ... I'm sorry. Things have been going on here, man.
> > > I'm glad I'm back and able to participate though.
> > >
> > Great.
> >
> > > > >
> > > > > > > > In future one may want to provision certain max limits
> > > > > > > > that device can have
> > > > > > > as they eventually will consume certain device hardware resou=
rces.
> > > > > > >
> > > > > > > I don't exactly see how this helps provisioning.
> > > > > > >
> > > > > > Provisioning side will set parameters which will reflect these
> > > > > > limits to be same
> > > > > on src and dst hypervisor when device migration is used.
> > > > >
> > > > > But making provisioning depend on driver being fully loaded and
> > > > > accessing the command is creating a chicken and egg problem.
> > > > I didn't explain well likely.
> > > > Provisioning as you described, will be on owner device.
> > > > This command tells driver what is provisioned.
> > > >
> > > > > Provisioning is much more likely to use some new admin commands
> > > > > over an owner device. So this command is useless for it.
> > > > >
> > > > Provisioning owner device will use exact same structure while
> provisioning.
> > >
> > > So the advantage of using config space is that we can have a single
> > > generic provision command that gets device config space format. Your
> > > approach will need some kind of net device specific thing.
> > >
> >
> > I see the advantage. But it very small and largely hidden beneath the s=
w
> layers how a provisioning command sets things.
> > A provisioning command sets the value, it surfaces at different level.
> >
> > Multiple device vendors want to follow the design pattern to use "
> > most uses it is better to use a virtqueue to update configuration infor=
mation"
> >
> > Instead of RO =3D config space, RW =3D cvq.
> >
> > The more pragmatic design pattern is:
> > driver initialization time =3D> feature bit + virtio config space.
> > Driver runtime =3D> cvq.
>=20
> yes. capability check is initialization time though.
>=20
Right, for runtime config like this cap, it is not in the initialization ti=
me needed.

>=20
> > >
> > > > >
> > > > >
> > > > > > >
> > > > > > > > > Patch 5/5 mandates that device validates all fields alrea=
dy.
> > > > > > > >
> > > > > > > > > Are there guests that will actually look at these caps
> > > > > > > > > as opposed to just sending commands and looking at the
> > > > > > > > > return
> > > status?
> > > > > > > > When the device reaches the limit it would not even send
> > > > > > > > the
> > > command.
> > > > > > >
> > > > > > >
> > > > > > > That's more logic for the driver to implement. Why should it
> > > > > > > bother when it can just send it?
> > > > > > >
> > > > > > It can just send it and fail and flood with error logs.
> > > > >
> > > > > If the spec says device can fail and that is expected then it won=
't flood.
> > > > > If you don't want driver to send some commands you should say
> > > > > that instead of saying device should filter them.
> > > > I will add the normative in the driver requirement section.
> > > >
> > > > >
> > > > > > Also it cannot just send some random id based numbers that
> > > > > > device does
> > > > > not support.
> > > > >
> > > > > Aha. I think I'm beginning to guess. You wrote:
> > > > > 	field{max_groups} indicates total number of flow filter groups
> > > > > supported
> > > > > 	by the device whose group identifiers can be any value in the
> > > > > range from 0 to
> > > > > 	\field{max_groups - 1}.
> > > > > and you think this implies that it can't be out of that range.
> > > > > That's not how logic works though ;)
> > > > >
> > > > Which logic?
> > >
> > > The aristotelian logic we commonly use.  You say "group identifiers
> > > can be any value in the range".  You seem to mean "group identifiers
> > > can not be any value not in the range". These two statements are not
> > > equivalent and neither implies the other.
> > I fail to see the difference between the two English sentence you wrote=
.
> > Can you please have an example, how second is any different?
> >
> > In my example max_groups =3D 5, so group id must be from 0 to 4.
>=20
> No, your sentence does not say it must. It says it can be in range.
> Can it be out of range, e.g. 5? You don't state either way.
I understand. I will that normative in v7.

> The second sentence says it can not be out of range so 5 is illegal.
> Are there illegal values inside the range? E.g. might 3 be illegal?
> According to second sentence, maybe. According to 1st sentence, 3 is lega=
l.
>=20
> > It can be any value.
>=20
> :(
>=20
>=20
> > In device and driver requirements, I will write the explicit line that =
it MUST be
> in this range.
>=20
> Then it will be different.
Will write as two different normative respective for each section.
For driver it is SHOULD, for device it is MUST wherever applicable.

>=20
> > >
> > >
> > > > The driver will honor the limit given to him.
> > > > The device will also naturally honor what it published to driver.
> > > > >
> > > > > > > > For example if the device supports only one group, it wont
> > > > > > > > implement
> > > > > > > ethtool ntuple and will chose only arfs as one example.
> > > > > > >
> > > > > > > Sounds like a contrived example why does device even expose
> > > > > > > flow steering then?
> > > > > > It is not contrived at all.
> > > > > >
> > > > > > A device may be support one or multiple groups. Each group in
> > > > > > the OS has
> > > > > multiple users.
> > > > > > One group is enough for either ARFS or ethool but not both.
> > > > > > Two groups can allow ARFS and ethtool to co-exists.
> > > > > > 3 groups will allow in future to expose some queues to user app=
s.
> > > > >
> > > > > Oh I misunderstood.
> > > > > Then why would driver decide to force a decision to ARFS specific=
ally?
> > > > > It will likely leave this to the user.
> > > > It is the driver implementation choice, For example:
> > > > if there is only one group, driver can choose to give strong
> > > > preference, say for
> > > ARFS only.
> > > >
> > > > Or it can let it be on first come first usage, for example, if
> > > > ethtool wants to
> > > use first, it will allow it, not letting ARFS to work.
> > > >
> > >
> > > Practically, drivers are highly unlikely to make the choice.
> > It will make the choice when there is only one group available.
> >
> > > That is why it is reasonable not to have checks in the driver if
> > > device is doing them anyway.
> > The groups particularly have the priority as well. So the check in devi=
ce does
> not work.
>=20
> I don't know what that means.
>=20
Packet processing order is defined by the group.
You should have participated in Aug or before when all of these were discus=
sed.
Anyways, next time you can participate in other features.

> > > But OTOH if you want driver to do the checks then I don't see why we
> > > should also add them to device unless there's a good reason to.
> > > Less checks in devices -> cheaper simpler devices.
> > >
> > The cheaper devices can always place UINT_32 max values and ignore any
> checking etc.
>=20
> Then won't driver expect inifinite # of groups to be supported?
>=20
A cheaper device can place anything it wants.

> > The check in the device will be done as it uses such an id for its own
> bookkeeping.
> >
> I don't know what that means.
> > > --
> > > MST


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

