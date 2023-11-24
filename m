Return-Path: <virtio-comment-return-8601-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B14C61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:27:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D488B2AEE4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:27:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A21C39868B1
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:27:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8204B9862D9; Fri, 24 Nov 2023 06:27:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 723059868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 06:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5EfWakZ53OZnCAwlP9wWn2FCahJ/05xbfj+GKEO65LHfAgvGdvXUr+dBWwUna5p/aQuhoDAhVSfn4Cs4rT+yt/Zs4S6TUJb2e/sNP1gHLM5W1b4qZCnJ32VVVqWeMi0TKwMcb79Y0opHyKLwiSzU8KWEjc8dh2ShNTrnyvTWT1Xjt586ve1/bPFdt+SJkDV4evwL5RJX7HVeKqBq98IwILe7UEhWqA3DLG9nJlGeijgZb0M9auUBpb6+oRz9msxRg7xHTuWvql9lho38TRx1i/RUl495nEJ7FYukr53GEcBnEa+9ciP8SySy3CKqSzpRGtD8ByF3qzkGwE+UNp1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmr+QnDZc8F9FNMhpR2Jexw0z41iWu17Pv+dYUhqwg8=;
 b=RzCA5DXZBmRj0UPqmmUiWHTKEciK/O+ZobfSLTnZ4KXA9pmuK+s/MPL/0ss+nkSSMtFCDr4R2lPvxClqXjo3GJ+1lFssZ1O83Q7cscn7AW2P3ordg5SEgtFmsbdxcL/kWFkugenXBUeyb3wJMYUOPw14ntNMGqU18vEbsEwpUc1ONYkaVWQUyI13EGk34HuXHb7+AjBgJhl2gAKyuFnEdR41mqvJDDdoQ3hpoWHWcywaJGIZv+AgOpSDAi2FIyMe9t14uOnNOA11M+uqUqV23zN5UCO1sofCZREWORVRTuWWnaQINoxwosI8H3Cv/swC06hV4C40JHkO1sFLYl27KA==
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
 AQHaHe6IXCl5jgtp9E+7xZjgBxzICbCH8raAgABJqFCAAEiugIAAQZKwgAA0KACAAATDEA==
Date: Fri, 24 Nov 2023 06:27:34 +0000
Message-ID:
 <PH0PR12MB54818AFAE1E2B943C9104B59DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231123092119.2718448-1-parav@nvidia.com>
 <20231123092119.2718448-3-parav@nvidia.com>
 <20231123091129-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481584836D0FD5025B8874EDCB9A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231123174947-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A6DFAEBD321707E31BDDDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124004105-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124004105-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB9255:EE_
x-ms-office365-filtering-correlation-id: 3042c2c8-7bee-4772-6913-08dbecb67231
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Lxc4G5Du5dSCo3k0yHnZv4lA9r90kEhAlhIp2LYVOpqaFOBFfgb1Tv+Cwp5KejKFxjNeMa7Lq9BQxbVt6CWAmAcWnL0w5pyS3wCs4reJ96vV49bz9naGke0d7lLJ24LqkXXb/lJI3/M+4Rr6qny9Wa1KqhMq1Nrgln6tGJdquYiqYvEPs81wsSmpapmLLENW1+R/7WNP/yFytbNY5BG7WuF8axPup6sb6ayzIV3akLsHIhxNNTDUHHEsnvDK9AZUtLmQd819b5yEsyw5J2Pw0rNIBN+nRdmg8VwXAarU+BBy4uRVj2jXozhXaEjyGoe5V4uRB5nKIGNDq1Rp2ZFxDFnks7K8BpTFxTrsl/PjhH2OIRZ1o2CQrAcOEoxZzRoiSW1qx2SfpVxLJyJBeWkrc6wTKTcH7w/GU5V/pXsc1FyL5UTUGwjdFdZ3nhdoM4/QINZ2tQGrc8/TKhnRl2PxgUPU3QRZGgdUBJ8a/r4f2jL2vnu5B1DRg6UMeXoUUehTikISXf+eTMTTjuh8gnkRQRbG0fKarLwA2wBifS81+TnextinRo+piAuEDVmpI6++iPn0tuLbq9sJy+VPnFKlauYfHvYWj5tgs7k2i8qDeCvPf1SZxgsyXK7G1dwzN8L8qpZEloakrUEdC4YxaHabDM77SV5ZXgfWXJvtIFdhxWM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(38070700009)(55016003)(66946007)(66476007)(66446008)(66556008)(54906003)(76116006)(64756008)(38100700002)(122000001)(33656002)(86362001)(6506007)(26005)(7696005)(83380400001)(71200400001)(9686003)(2906002)(316002)(6916009)(478600001)(966005)(8936002)(52536014)(5660300002)(4326008)(41300700001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/vgoVTwRgi5RZQoq2H3j6VYUX2VOaWY11VU5aCx49aQgKqDVquQMa9C9AauF?=
 =?us-ascii?Q?vgQK84BBAdmHfySRAxXy2Rcd/zf5mW4MKrsZKJ9kbQM3v5XSdAVVGFcUEfh8?=
 =?us-ascii?Q?qSHlU696g9Mh5pK/AITE5O7NHH0FgVk0JDhvRgM/EPXjLvPfubxW5QgyoVwH?=
 =?us-ascii?Q?W4RPhULQJJ5ovp92tUkXRamH1J4Vpo8jaOro+sIrIO/rzzi/RgqlvO1JbI6y?=
 =?us-ascii?Q?UsCOs8arzPlaBF74gZu3iMyUCiP8Lsz693gPG7urrsVOFOLrKaI4nFY2f8Ht?=
 =?us-ascii?Q?lzeDXGBmhdPCz6YUUFTlKWKQMHUDB6TyoOOgI3bAw621TBHgvzlUW4N2yBLB?=
 =?us-ascii?Q?dWt2UhYTv57IbPUH7lc8AdfatZnaLHnc5TP8YPuzWWaAEnGYUkS1nJwYZGFS?=
 =?us-ascii?Q?PvsQVVMnQgp3/C6RjCRFONIoUFlPPzSquhPXGVxb65vvoFshtMUN1WJE0M+W?=
 =?us-ascii?Q?HEDnJClp/YIZ6Tf2eub2FDWPkIJZmFIgGtPh4Xp+CVSmJhYVW0Kdgzkwh/Xs?=
 =?us-ascii?Q?RCZdlNyIrlo1XU9wXt7h//fxthwVg5IpGeWGu63HHGHfjhekihwp7/oXKe4Y?=
 =?us-ascii?Q?LZSfq+A+Mo3RtuYIF+UJvotnwrMMNaHVWTpFovz7qstivXUTnJbP9GEHtHbS?=
 =?us-ascii?Q?DUNjAt3Qnvs4DkrG6LSzeinaak5YSPHjCd/dcZ60JuUi+fHPi4lFA0ypHspl?=
 =?us-ascii?Q?ir0xFrCh0G+Sp8YbpRwSwNDLOmFG7suREmkDfiAbgkNWWzj/o/R2zL3T/7ZR?=
 =?us-ascii?Q?dwGF9TH4eNLsh38TWMJCsebC8RTAsV8j8bBay7mK16bCKfwzctQpaJUWe6aI?=
 =?us-ascii?Q?i08x/vDYxdGIfrzMNcpRo+W+mFdzpmXH+JczVzy57x8YBmgwywm4aF3j4NXv?=
 =?us-ascii?Q?PdjDoQWNSsHQEfYEDpvd5frzrG8ycrBS7BpV0UnGG37YBR0OjHkBENDc4b4d?=
 =?us-ascii?Q?3n2uHi3dZwzrFCRtLp90pFJNqEmw5DUln+Ms85g8ZVhPHC7ioLL6THMiBVaC?=
 =?us-ascii?Q?KQIqdMxgbyB2PoBQ3Luix+oUcwlTy/XdfMDPmdv6L4fEYvdBTr3sOXkAiuBK?=
 =?us-ascii?Q?C23J1PHQOYRUg/nxnXiZr1XmEnRz1LfnhKLkjs8RFoNB5v2nzZLfFkUSKZPZ?=
 =?us-ascii?Q?L7FDu2mSC8Z1X7+3YvU2Pb0eOVfLLCEeOAqPcZIMzpNBsOnds5ljOfjX4f3n?=
 =?us-ascii?Q?6cS73FOQGl0P/cvdOD0rYrG9hqRx8cbzJ/JR1RWTy4qjQ5B4ka8F9V40vpCZ?=
 =?us-ascii?Q?fY7dHZWOTlFCJixupoRC2oytX5sct5JyrbDSZVwE5AG1m8pBs+/6vDgx6y0e?=
 =?us-ascii?Q?n1FRLwyWwOv0Oa+lYv2XFdqW/mK8vAphf9fDf/HT3pEP53WbDuH9SVGBo/K/?=
 =?us-ascii?Q?tNfluE/UaukFOKNEAQ4+khuR3Ab3JCGJZm9IrdafyK74+BYI82dMNU8g1pMU?=
 =?us-ascii?Q?OQ2bKs/GI8+4qS4B4ac7ZtxgZPVzE3YZcqFsUxJPBLK3HK65FTtE7y/2sE6L?=
 =?us-ascii?Q?X6Wo4Co/dI15C1q3OTeVGyevpepBODCr6qp0vDZ5pW3AEcGcdBFgPXJib5S3?=
 =?us-ascii?Q?Fa1IZN+RfypCChbmuH8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3042c2c8-7bee-4772-6913-08dbecb67231
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 06:27:34.6550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r1ShrGRVu8f785tao/L3ZdxE+H8Du0oEFBEuyATnqJkkfmHRW4A+rIZiqxNGPd/Di0Qb+W+rtrfVtXooaMF9NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9255
Subject: [virtio-comment] RE: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 24, 2023 11:29 AM
>=20
> On Fri, Nov 24, 2023 at 02:57:49AM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Friday, November 24, 2023 4:28 AM
> > >
> > > On Thu, Nov 23, 2023 at 06:40:59PM +0000, Parav Pandit wrote:
> > > >
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Thursday, November 23, 2023 7:44 PM
> > > > >
> > > > > On Thu, Nov 23, 2023 at 11:21:16AM +0200, Parav Pandit wrote:
> > > > > > The device responds flow filter capabilities using two commands=
.
> > > > > > One command indicates generic flow filter device limits such
> > > > > > as number of flow filters, number of flow filter groups,
> > > > > > support or multiple transports etc.
> > > > > >
> > > > > > The second command indicates supported match types, and fields
> > > > > > of the packet.
> > > > > >
> > > > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
> > > > > > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > >
> > > > > So I am still unsure about these commands.  What exactly is the p=
oint?
> > > > >
> > > > Two reasons.
> > > > The device reports maximum capabilities that the driver knows
> > > > upfront. So
> > > that it does not need to come to device to know when to fail.
> > >
> > > But that requires driver to keep extra state which can easily get out=
 of sync.
> > Not sure what you mean by get out of sync from whom?
> > Not from the device.
>=20
> yes from the device. I can't say for sure how because I now see this patc=
h is
> implying driver requirements that you didn't document. I thought the IDs =
can
> be any number.=20
It cannot be any number. The device requirement has captured it.
Couldn't see a lot of point of duplicating it.
The device requirement implies what driver has to do.
But if you insist, I can duplicate in the driver requirement too.

> It appears that's not what you meant.
> I can try and guess what you meant but I'd rather have you rewrite this i=
n a
> way that makes the meaning explicit.
>=20
If you insist, I can duplicate in driver requirements too.
>=20
> > There are many capabilities here each with a different use.
>=20
> And you are under the impression that dumping all kind of stuff in a sing=
le
> place is good somehow?
It is not dumped.
It is structured based on the functionality.
The config space proposal tends to dump everything in unstructured way at s=
ingle place that cannot extended elegantly.

For example, Xuan's dynamic array cannot be placed next to other dynamic ar=
ray of flow filter.

>=20
> > For many caps, it is to know what is supported/not to decide in the dri=
ver.
>=20
> I can't parse this sentence.
>=20
The driver checks things upfront what is supported while serving the comman=
d, instead of random trial and error guess work game with he device.

> > Certain caps are max to know what is the range of id that driver can us=
e like
> flow filter id, group id.
>=20
> Maybe then. But there's apparently no requirement for either device or dr=
iver
> to put it in this range.
>=20

I will add this requirement statements in device requirements and that will=
 make things clear.
Good point.

> > > For what benefit?
> > >
> > For functional work.
>=20
> You don't really explain what kind of work in this patchset, or in the co=
mmit
> logs. Maybe it's obvious for you but not for everyone.
What text are you expecting?
We have undergone all the requirements study that you conveniently choose t=
o not participate for 2 months.

>=20
> > > > In future one may want to provision certain max limits that device
> > > > can have
> > > as they eventually will consume certain device hardware resources.
> > >
> > > I don't exactly see how this helps provisioning.
> > >
> > Provisioning side will set parameters which will reflect these limits t=
o be same
> on src and dst hypervisor when device migration is used.
>=20
> But making provisioning depend on driver being fully loaded and accessing=
 the
> command is creating a chicken and egg problem.
I didn't explain well likely.
Provisioning as you described, will be on owner device.
This command tells driver what is provisioned.

> Provisioning is much more likely to use some new admin commands over an
> owner device. So this command is useless for it.
>=20
Provisioning owner device will use exact same structure while provisioning.

>=20
>=20
> > >
> > > > > Patch 5/5 mandates that device validates all fields already.
> > > >
> > > > > Are there guests that will actually look at these caps as
> > > > > opposed to just sending commands and looking at the return status=
?
> > > > When the device reaches the limit it would not even send the comman=
d.
> > >
> > >
> > > That's more logic for the driver to implement. Why should it bother
> > > when it can just send it?
> > >
> > It can just send it and fail and flood with error logs.
>=20
> If the spec says device can fail and that is expected then it won't flood=
.
> If you don't want driver to send some commands you should say that instea=
d
> of saying device should filter them.
I will add the normative in the driver requirement section.

>=20
> > Also it cannot just send some random id based numbers that device does
> not support.
>=20
> Aha. I think I'm beginning to guess. You wrote:
> 	field{max_groups} indicates total number of flow filter groups
> supported
> 	by the device whose group identifiers can be any value in the range
> from 0 to
> 	\field{max_groups - 1}.
> and you think this implies that it can't be out of that range.
> That's not how logic works though ;)
>=20
Which logic?
The driver will honor the limit given to him.
The device will also naturally honor what it published to driver.

>=20
> > > > For example if the device supports only one group, it wont
> > > > implement
> > > ethtool ntuple and will chose only arfs as one example.
> > >
> > > Sounds like a contrived example why does device even expose flow
> > > steering then?
> > It is not contrived at all.
> >
> > A device may be support one or multiple groups. Each group in the OS ha=
s
> multiple users.
> > One group is enough for either ARFS or ethool but not both.
> > Two groups can allow ARFS and ethtool to co-exists.
> > 3 groups will allow in future to expose some queues to user apps.
>=20
> Oh I misunderstood.
> Then why would driver decide to force a decision to ARFS specifically?
> It will likely leave this to the user.
It is the driver implementation choice,
For example:=20
if there is only one group, driver can choose to give strong preference, sa=
y for ARFS only.

Or it can let it be on first come first usage, for example, if ethtool want=
s to use first, it will allow it, not letting ARFS to work.




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

