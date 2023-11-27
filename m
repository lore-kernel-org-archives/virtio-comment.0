Return-Path: <virtio-comment-return-8643-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00A3C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:50:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 636FD19090A
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:50:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36C419863B4
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:50:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1EE7E98638E; Mon, 27 Nov 2023 11:50:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ADA2E986394
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 11:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqgz+zlzEe9/NRlLGJeq2NnXgPgEIvh0iOVGf35xDY4MUZVxYwk2xiUpMaLHO7YJCmkAjppj7aHpF11D8IMz0kyAQRbruY47ERXc0lVDooi/6mRJ/vDtaeYeCCtr7fWGXa5a45Rtzx8V8itMzc48j2JQ711kUhHi2xqE6mXS1GeBa0L8zlo3IyrDRhwpYPa3/nHK60G1pKYnFkJ4YR8D5QN9+8pGa2hh7fyTG0BnpMRBokFCTrndekLSRbNTHC1K1T9KSevZhwj7RB+X9xWwI9jexPs7je6PGKXjIsNnur6e9SNnYoWV6juG4jwxNYV3zjy10n5MoHr51yzmnB8v5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGCI3ChOEt701VPovRPR8RHPRuehMznFEP4wkg2SNkg=;
 b=nRxFqM+0ts7xZOAsFO+NHsec54F4+FW+pITGjVc2Oo8hoTelpCjPmdo3TER0fxtVucwDuTagcTDU6x8qVug7PWRgqFIHEd+4kDMfUdAK9g606HLF4a97QnWqbHE7tpx4xV/Wh8Xa9zySsTnbTH0k29oOiiFG0C6bmVdvuD7cOLfgttIccSetSoJzyYEV9AGd9Owa284ZzUwt/n4IwGpj8T/nlq3Y/p4uRa2AulZmILJoXmfPRyX3ZEzKgB/EGE68g4UsfNUPDzNeNTPRgYlDFo6P8Hb7Fmkp2E/1iosNJnsclxNV78RbiR8vFNhuFhBTRiFUW6ZCrpNPqxXoX7mD8Q==
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
 AQHaHe6IXCl5jgtp9E+7xZjgBxzICbCH8raAgABJqFCAAEiugIAAQZKwgAA0KACAAATDEIAAQqGAgASfUpCAACqxgIAAAEkggAAEngCAAAJGkA==
Date: Mon, 27 Nov 2023 11:50:24 +0000
Message-ID:
 <PH0PR12MB5481FD7F68E535A99F51D36ADCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231123091129-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481584836D0FD5025B8874EDCB9A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231123174947-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A6DFAEBD321707E31BDDDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124004105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818AFAE1E2B943C9104B59DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124042824-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548126B6C07BFA6271020982DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127061203-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E1567D7D27A9BF18D9ACDCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127063810-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231127063810-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN0PR12MB6030:EE_
x-ms-office365-filtering-correlation-id: b533380d-bf1a-4deb-bb6f-08dbef3f0afe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qgvcOY8X+LYsmSpXuAQMzkTAf0ede6RZigo9EnhOl9H1NgiL9sl4XzLAwh6dLAYZI30mY0d3poJB/p/vXu6PIgAQqeKMbq1pf9naKEUmQm0w5rrX3L2JvXBSj0F2Of5ry6f9XH/B7hxnIxSmV5foB4TB+fR0o8pSfIOtZiw7sq3JIOzLzFQElfWUndLsRLT5R/AW1Hb3M8SdJjqOeSGM+jvqZeUhbjlABEyd50m6FJBBQOX0ygbdk1+LfXOVwLZe2GVbk7ksTvJv41HLKJCt8mZutP8TqVLgTMSPnWLgNmWtdUVvBwpu1PtJuWntPQIGSRRcVuuRStGH9+wX2nX3iqtg/v7WdYv21CXkH1reoImoFpabAtdnf84wge09yRjoPn+Sv5r7LcPDdnNpPzyqOPBzvpkX8+ioW5ACFeEJkO4ezPgJ5VyGbzdXQGGrD5greOz56/iooOmIyi+8XArMGotrrlcqXJeyaaFuDrUr82diKE6GGieRkKpKtctKWtpHYeMHnZtfw1sE/QYQvP6JIdD760c4xvrxfmjnLectst5J2vOxz3SLi1jjy4SzUj6bmkOf37V8+xnS7HKoFvHUl+jEW3NJWo7WiqyJj41lqxU4USFpxR1PKaHSWZTZcPxc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(52536014)(71200400001)(8936002)(8676002)(4326008)(9686003)(6506007)(7696005)(55236004)(64756008)(76116006)(66946007)(66556008)(316002)(6916009)(54906003)(478600001)(2906002)(122000001)(30864003)(55016003)(33656002)(38100700002)(41300700001)(38070700009)(86362001)(26005)(66476007)(83380400001)(5660300002)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uCJFlQp++l+12oQqIwhAKvcmuc054biCQj9Efs+92GdiwOW2YWtuV8pXNgyw?=
 =?us-ascii?Q?fW8hBmmvGdKkx9DhTYkRcQnH0Wr55zoNgUDRN385jdhgREFTD8MFu3VwGVC1?=
 =?us-ascii?Q?eReURiqqQ6iAXftGBcmq3UaFyRhCAqNkh3V8HmoibsnYL2DyN81S1pTCSqgE?=
 =?us-ascii?Q?Xchwis8xRfsKXFkyO3GZRu/GV5XygMHc+RUCfVJ+K8zlZj1NzwZuqJfcoQr1?=
 =?us-ascii?Q?3x4qnVifNzTqWVjr5K7g+Zl02QZCstCtQtzIVmJ8i9KBvOpl4IqE16VsjmmS?=
 =?us-ascii?Q?J53bNJ5L6s+IxfQOxrSS6Qut0mTZSi4AbvS/CwbNGmktG5yOcYh/kmRU1ik5?=
 =?us-ascii?Q?SLtjgKervPCgwnQp9k0GWMPCKjW7tJhZZv21gN9eN1nXOPLZMDyANEzVr42V?=
 =?us-ascii?Q?l5dgqfA7GpHHaOcV2c8AXsmtM00wo2sxA3B8iJY5GuPHHR1Y0r/cOxsf6V+K?=
 =?us-ascii?Q?wYz3MbwBjuIhRX3D+otZ5D3hacELvsfl9DHl6riKZnDZzOovBqCq2TDdbKH5?=
 =?us-ascii?Q?ts3J6KcH0tv3QjmOyp2mX6TpwERryu8WVIhQk34RtVmb4bZ+hoxS2wcKxiPD?=
 =?us-ascii?Q?E7CGFflvKXCNLXAUJk1Fcj1hbC7SIGpJ1id/d7Ea49ZFkd39X53OpxQNUS5Z?=
 =?us-ascii?Q?oOh+A6Wxlq2x8uON4CCxELlIsKM888A7JrTWvYmGwEf1KeOkTFiE7jkCcENl?=
 =?us-ascii?Q?nNYIj50tI5S1MW5jMTIOiluDBW2UuEuHxjSEaRC4HsIBo1re3IQnuvW0gTic?=
 =?us-ascii?Q?VDdiXpqUzekzl0MAlNe4nKSnk0oXzYPxExG5UR/StwNafIKMhoNn5c8c0IaW?=
 =?us-ascii?Q?Dklj6jUZHFpmcO+i3bgoSXBSDE0RR+EeCkpM4Hb6UvtIxK6I/yoBsrtTGLwM?=
 =?us-ascii?Q?x7T8HMBvinY34zpSgLB1JAuwYNR4IiDCa0gCgNeaF/Fz0sv7RpR7tG2RH8D4?=
 =?us-ascii?Q?8tEyAbtzQKCrC00zhqPqumHveZcKSX4jX32hmq3mtKKRWrC25vKDMG3lPfQX?=
 =?us-ascii?Q?PJY/Eb4RyPn/0rT+j1/wS6Pp/W083MxYXdiUSf3ZYFFatooa1RTPMTyEK1cd?=
 =?us-ascii?Q?C/D6njE4EpbMKd0Jf4sQtnP2fx0hOBxr5g5ZzUhpkgTdXC0x9l3qjI2Mu9uV?=
 =?us-ascii?Q?HvHfCvKNnfA4U8xJBLTzkE4mDTzJ2Cvct2Xwy5ocRnO+NJvkSDuEb+E5ww/O?=
 =?us-ascii?Q?cFZyBXgekyj2W4/xgO1Q8O8RnrQycsMWyvLnhnx3Po/r76J40j2V1r2h5pxM?=
 =?us-ascii?Q?k57EBG65+4MlYRrZ0IUUDVIcITtJt8X3i5to9VCjkO8DVy+3QZpD8oddDIkV?=
 =?us-ascii?Q?94RHgGsJr4sx2mKsaj+TetjCAuw8UT8GJEK299c6juqUu6CuQBJtzIHE5y5R?=
 =?us-ascii?Q?AUFmHmer0poyVGcdHyqCUsbAiQSfDBffuP05O/Y7TQdZCcXhbedJ6DpAChkx?=
 =?us-ascii?Q?7cJiKNkZcpHbBnZsYwyLdptWH7nyM50AWDpj9/mVwkGJ2XXtZgSy4MR6pNle?=
 =?us-ascii?Q?84dY6xUiwTcHlSSpYdFSl6dtKUcGZh478HKkfoZ+dFpv6kiuIg81UlC03Y0y?=
 =?us-ascii?Q?VwSggPzj6w2PH3X0nmY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b533380d-bf1a-4deb-bb6f-08dbef3f0afe
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 11:50:24.9178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tfZYKLUvAsV4MXDOW5PFSa/f62GDwC6AnRY+WLHkQrMLqibcBb+RPoFS9ACE9WculirynWkYjYq1lZZsIPeuCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030
Subject: [virtio-comment] RE: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, November 27, 2023 5:10 PM
>=20
> On Mon, Nov 27, 2023 at 11:33:45AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Monday, November 27, 2023 4:53 PM
> > >
> > > On Mon, Nov 27, 2023 at 10:19:47AM +0000, Parav Pandit wrote:
> > > > > > > It appears that's not what you meant.
> > > > > > > I can try and guess what you meant but I'd rather have you
> > > > > > > rewrite this in a way that makes the meaning explicit.
> > > > > > >
> > > > > > If you insist, I can duplicate in driver requirements too.
> > > > > > >
> > > > > > > > There are many capabilities here each with a different use.
> > > > > > >
> > > > > > > And you are under the impression that dumping all kind of
> > > > > > > stuff in a single place is good somehow?
> > > > > > It is not dumped.
> > > > > > It is structured based on the functionality.
> > > > > > The config space proposal tends to dump everything in
> > > > > > unstructured way at
> > > > > single place that cannot extended elegantly.
> > > > > >
> > > > > > For example, Xuan's dynamic array cannot be placed next to
> > > > > > other dynamic
> > > > > array of flow filter.
> > > > >
> > > > > I don't know what "dynamic array" is exactly but generally, Any
> > > > > kind of a big array is not appropriate in config space - I don't
> > > > > see any of these
> > > here, though.
> > > > Ah, now I see the disconnect.
> > > >
> > > > There is.
> > > > struct virtio_net_ctrl_ff_match_types
> > >
> > > Now I think I don't understand what this array does at all.
> > > Why are there multiple entries with each entry also including a mask
> > > of multiple fields?
> > >
> > Each entry indicates a bitmask of supported fields that can be filtered=
.
> > The type indicates how to interpret each fields_map.
> > Any new type for MPLS can be added easily by defining its type and mask=
.
> > And same type enums and field mask also used by the data path too.
>=20
> Oh wait I think I begin to remember now. There are 12 bits defined so far=
 and
> you made it this huge array. Right? With code to parse and format it all.=
 Just
> add a 64 bit field and it will last us long enough. No parsing and format=
ting just
> #define.
The infrastructure defines 12 bits only because this is first minimal viabl=
e work.
There will be more fields to be added for more types.
It is not good to mix up all the fields and bit definitions.

And there are per device max limits which is way more than 12 bits.

Your attitude to take narrow view and trying to kill this command is not go=
od either.
>=20
>=20
> > >
> > > > >
> > > > >
> > > > > > >
> > > > > > > > For many caps, it is to know what is supported/not to
> > > > > > > > decide in the
> > > > > driver.
> > > > > > >
> > > > > > > I can't parse this sentence.
> > > > > > >
> > > > > > The driver checks things upfront what is supported while
> > > > > > serving the
> > > > > command, instead of random trial and error guess work game with
> > > > > he
> > > device.
> > > > >
> > > > > There's no real guesswork with these specific commands: user
> > > > > types an ethtool command, driver sends it on, it either succeeds =
or fails.
> > > > It is a guess work without driver knowing if its supported or not.
> > >
> > > What we do not need is both driver and device checking these values.
> > >
> > Driver is mainly to using to know its valid ranges and to fail the comm=
ands
> early.
> > Device is referring it for any validations that it may need to do.
> >
> > >
> > > > > However if you feel it important to do checks in driver - OK.
> > > > Yes, because there are many parsing fields and good to know.
> > > >
> > > > > But that makes cap query an init time thing.
> > > > Yes, caps does not change dynamically.
> > > > But sure it is different among different member devices and owner t=
oo.
> > > >
> > > > >
> > > > >
> > > > > > > > Certain caps are max to know what is the range of id that
> > > > > > > > driver can use like
> > > > > > > flow filter id, group id.
> > > > > > >
> > > > > > > Maybe then. But there's apparently no requirement for either
> > > > > > > device or driver to put it in this range.
> > > > > > >
> > > > > >
> > > > > > I will add this requirement statements in device requirements
> > > > > > and that will
> > > > > make things clear.
> > > > > > Good point.
> > > > > >
> > > > > > > > > For what benefit?
> > > > > > > > >
> > > > > > > > For functional work.
> > > > > > >
> > > > > > > You don't really explain what kind of work in this patchset,
> > > > > > > or in the commit logs. Maybe it's obvious for you but not for
> everyone.
> > > > > > What text are you expecting?
> > > > > > We have undergone all the requirements study that you
> > > > > > conveniently
> > > > > choose to not participate for 2 months.
> > > > >
> > > > > Yea ... I'm sorry. Things have been going on here, man.
> > > > > I'm glad I'm back and able to participate though.
> > > > >
> > > > Great.
> > > >
> > > > > > >
> > > > > > > > > > In future one may want to provision certain max limits
> > > > > > > > > > that device can have
> > > > > > > > > as they eventually will consume certain device hardware
> resources.
> > > > > > > > >
> > > > > > > > > I don't exactly see how this helps provisioning.
> > > > > > > > >
> > > > > > > > Provisioning side will set parameters which will reflect
> > > > > > > > these limits to be same
> > > > > > > on src and dst hypervisor when device migration is used.
> > > > > > >
> > > > > > > But making provisioning depend on driver being fully loaded
> > > > > > > and accessing the command is creating a chicken and egg probl=
em.
> > > > > > I didn't explain well likely.
> > > > > > Provisioning as you described, will be on owner device.
> > > > > > This command tells driver what is provisioned.
> > > > > >
> > > > > > > Provisioning is much more likely to use some new admin
> > > > > > > commands over an owner device. So this command is useless for=
 it.
> > > > > > >
> > > > > > Provisioning owner device will use exact same structure while
> > > provisioning.
> > > > >
> > > > > So the advantage of using config space is that we can have a
> > > > > single generic provision command that gets device config space
> > > > > format. Your approach will need some kind of net device specific =
thing.
> > > > >
> > > >
> > > > I see the advantage. But it very small and largely hidden beneath
> > > > the sw
> > > layers how a provisioning command sets things.
> > > > A provisioning command sets the value, it surfaces at different lev=
el.
> > > >
> > > > Multiple device vendors want to follow the design pattern to use "
> > > > most uses it is better to use a virtqueue to update configuration
> information"
> > > >
> > > > Instead of RO =3D config space, RW =3D cvq.
> > > >
> > > > The more pragmatic design pattern is:
> > > > driver initialization time =3D> feature bit + virtio config space.
> > > > Driver runtime =3D> cvq.
> > >
> > > yes. capability check is initialization time though.
> > >
> > Right, for runtime config like this cap, it is not in the initializatio=
n time
> needed.
> >
> > >
> > > > >
> > > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > > Patch 5/5 mandates that device validates all fields a=
lready.
> > > > > > > > > >
> > > > > > > > > > > Are there guests that will actually look at these
> > > > > > > > > > > caps as opposed to just sending commands and looking
> > > > > > > > > > > at the return
> > > > > status?
> > > > > > > > > > When the device reaches the limit it would not even
> > > > > > > > > > send the
> > > > > command.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > That's more logic for the driver to implement. Why
> > > > > > > > > should it bother when it can just send it?
> > > > > > > > >
> > > > > > > > It can just send it and fail and flood with error logs.
> > > > > > >
> > > > > > > If the spec says device can fail and that is expected then it=
 won't
> flood.
> > > > > > > If you don't want driver to send some commands you should
> > > > > > > say that instead of saying device should filter them.
> > > > > > I will add the normative in the driver requirement section.
> > > > > >
> > > > > > >
> > > > > > > > Also it cannot just send some random id based numbers that
> > > > > > > > device does
> > > > > > > not support.
> > > > > > >
> > > > > > > Aha. I think I'm beginning to guess. You wrote:
> > > > > > > 	field{max_groups} indicates total number of flow filter
> > > > > > > groups supported
> > > > > > > 	by the device whose group identifiers can be any value in
> > > > > > > the range from 0 to
> > > > > > > 	\field{max_groups - 1}.
> > > > > > > and you think this implies that it can't be out of that range=
.
> > > > > > > That's not how logic works though ;)
> > > > > > >
> > > > > > Which logic?
> > > > >
> > > > > The aristotelian logic we commonly use.  You say "group
> > > > > identifiers can be any value in the range".  You seem to mean
> > > > > "group identifiers can not be any value not in the range". These
> > > > > two statements are not equivalent and neither implies the other.
> > > > I fail to see the difference between the two English sentence you w=
rote.
> > > > Can you please have an example, how second is any different?
> > > >
> > > > In my example max_groups =3D 5, so group id must be from 0 to 4.
> > >
> > > No, your sentence does not say it must. It says it can be in range.
> > > Can it be out of range, e.g. 5? You don't state either way.
> > I understand. I will that normative in v7.
> >
> > > The second sentence says it can not be out of range so 5 is illegal.
> > > Are there illegal values inside the range? E.g. might 3 be illegal?
> > > According to second sentence, maybe. According to 1st sentence, 3 is =
legal.
> > >
> > > > It can be any value.
> > >
> > > :(
> > >
> > >
> > > > In device and driver requirements, I will write the explicit line
> > > > that it MUST be
> > > in this range.
> > >
> > > Then it will be different.
> > Will write as two different normative respective for each section.
> > For driver it is SHOULD, for device it is MUST wherever applicable.
> >
> > >
> > > > >
> > > > >
> > > > > > The driver will honor the limit given to him.
> > > > > > The device will also naturally honor what it published to drive=
r.
> > > > > > >
> > > > > > > > > > For example if the device supports only one group, it
> > > > > > > > > > wont implement
> > > > > > > > > ethtool ntuple and will chose only arfs as one example.
> > > > > > > > >
> > > > > > > > > Sounds like a contrived example why does device even
> > > > > > > > > expose flow steering then?
> > > > > > > > It is not contrived at all.
> > > > > > > >
> > > > > > > > A device may be support one or multiple groups. Each group
> > > > > > > > in the OS has
> > > > > > > multiple users.
> > > > > > > > One group is enough for either ARFS or ethool but not both.
> > > > > > > > Two groups can allow ARFS and ethtool to co-exists.
> > > > > > > > 3 groups will allow in future to expose some queues to user=
 apps.
> > > > > > >
> > > > > > > Oh I misunderstood.
> > > > > > > Then why would driver decide to force a decision to ARFS
> specifically?
> > > > > > > It will likely leave this to the user.
> > > > > > It is the driver implementation choice, For example:
> > > > > > if there is only one group, driver can choose to give strong
> > > > > > preference, say for
> > > > > ARFS only.
> > > > > >
> > > > > > Or it can let it be on first come first usage, for example, if
> > > > > > ethtool wants to
> > > > > use first, it will allow it, not letting ARFS to work.
> > > > > >
> > > > >
> > > > > Practically, drivers are highly unlikely to make the choice.
> > > > It will make the choice when there is only one group available.
> > > >
> > > > > That is why it is reasonable not to have checks in the driver if
> > > > > device is doing them anyway.
> > > > The groups particularly have the priority as well. So the check in
> > > > device does
> > > not work.
> > >
> > > I don't know what that means.
> > >
> > Packet processing order is defined by the group.
> > You should have participated in Aug or before when all of these were
> discussed.
> > Anyways, next time you can participate in other features.
> >
> > > > > But OTOH if you want driver to do the checks then I don't see
> > > > > why we should also add them to device unless there's a good reaso=
n to.
> > > > > Less checks in devices -> cheaper simpler devices.
> > > > >
> > > > The cheaper devices can always place UINT_32 max values and ignore
> > > > any
> > > checking etc.
> > >
> > > Then won't driver expect inifinite # of groups to be supported?
> > >
> > A cheaper device can place anything it wants.
> >
> > > > The check in the device will be done as it uses such an id for its
> > > > own
> > > bookkeeping.
> > > >
> > > I don't know what that means.
> > > > > --
> > > > > MST


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

