Return-Path: <virtio-comment-return-8630-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D32CC4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 10:20:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 70F9C3E584
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 10:20:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C94B49868EC
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 10:20:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3F6E09863A5; Mon, 27 Nov 2023 10:20:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 71A71986394
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 10:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNn8aCAtmTa5ivQpmDvRG/UVLCP4HZW+MalafrzjtDFGX3YDrYO+OE9xwZver9fWw20lPmWQJ4xauN9LpWXUUCQRzqkdAdIQJW7BTN1igajXfkKXUBhN28v4k+Sc9YioxJ8cjI84+FFakH868d61ubFRQE985QBLafn8qGvhN0h9Swo7K1zV/GrAIzu7Ecqy5X6WP28ChZsA4I+nosDinfA4tvnffzMogScqNTHGcm549yPOjRL1x0jCewQ2d8LMNqypVydn/IRSNcKzsy+EfMH3w8qUInH2WRpr+W2ED01SwTYNGkzEYh2Loo1R1sOW4nWb3A1jKF3axHlVP1ZjmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tQtGvHbZTgwbS6DShSuTTRgV5rQJ9/ErpvFIsjkc7k=;
 b=EgwvP0NnA9fs7W51m8z2Iaw7QB013+ocyzXJC7RZ81emigVRH/zQZjmem3wm3N+gw7mUkABIqpd9m6HvLfqQjt5///rDCn17Ch1P7NKCZ9QtzhqPwrnCFXT5DLO/d01U/6UBiyLSAvs3aIm1/J875r2ebqHgIepOM+0n+e/qBYS00HPOIyY087I20emCqFXM3vBurKmLN3EVl3zOb1TAcqI7HJv6RV7efob+S6jj9FRKxJ7IQJgiqoFsEcs827mzTLrN5kLtRCwMB7udOw1OfYiS4ACcxDR+ounHFQtsfg7XVW7jINpX6f0Yf5cR2lL7uw9X5vqpA9sD17LvZuu8pg==
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
 AQHaHe6IXCl5jgtp9E+7xZjgBxzICbCH8raAgABJqFCAAEiugIAAQZKwgAA0KACAAATDEIAAQqGAgASfUpA=
Date: Mon, 27 Nov 2023 10:19:47 +0000
Message-ID:
 <PH0PR12MB548126B6C07BFA6271020982DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231123092119.2718448-1-parav@nvidia.com>
 <20231123092119.2718448-3-parav@nvidia.com>
 <20231123091129-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481584836D0FD5025B8874EDCB9A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231123174947-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A6DFAEBD321707E31BDDDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124004105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818AFAE1E2B943C9104B59DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124042824-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124042824-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4044:EE_
x-ms-office365-filtering-correlation-id: 768c9f4f-05dd-4842-07f1-08dbef3261ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 o03kMd6RnlVeap50jsi97TfHEsVUEgAYk2U04rw0bpNfOcvozJ8CB7aViDeqCv+AqddXgDjV3wzkbu7qpOu6JTDp3pVxmzZU+ECtC63l6ptVTacNp/DM6bzutA2u1wdHBLqHFJFszcJmPpPEoQw+ZYiCyFUc5iivuuXinqYW5tkKZQ6EHDgSAH4RRpvPx+whkt3qYAu5nxG36BM/JtKIUQbeO9Yy+vU5YkvGol9JhJeWQwaCTUw00ZtS0wzpozXt7jPKIPc+wT5kpJxXTlvsFqcDcERIDtD//Pws4zuhAthN5NON2whvztSSCWGcKhKtVW4HeiKifOVvLdYpRc0Zvk39oG0t78Vcbyrxw8sxBQwgW41lL+dRaVpPH+aoXnM27hAc/u6U0+y/Js0GcDrxVh5EiIvMrK3Hhs7S9D0/kJLUWeP2Au60BncJFS3kPE+FfFaeRCXeNkTSujeKMZeE+XBx0Xrfwxka70QAQTGK9XWa2O54Sr5kHXhSMeBF4vYgdfBz0soCO7h/pGjjapeLDf4e3mh5k3C6RzXTNhPBj73yn2fPTAF2qLDVQM+/m1b7ApZc3qTz3A/uVVxU5bbAl8TseZiyn22AzGS1kX3V1xWdzRm4xiw5goA/D4IpQ8I8ZAVeQws3GG1ixIS4zz9oeyAamC3a3vjeuCPMzQmNgak=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(9686003)(55236004)(6506007)(478600001)(7696005)(966005)(71200400001)(83380400001)(30864003)(2906002)(41300700001)(5660300002)(66946007)(76116006)(66446008)(54906003)(64756008)(66556008)(66476007)(6916009)(316002)(52536014)(4326008)(8936002)(8676002)(38100700002)(38070700009)(86362001)(122000001)(33656002)(55016003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3ieepmmzs0elrTKfdl+9icZYzVyzVk7YLqz/v7tpBm3Vp2sDHj2ccfRhuBuC?=
 =?us-ascii?Q?Gi5c/Cq8tu9dZ7YH9x9b4qnXlQ981OdyKZPpmXY3ft6vYANpldK7YKG7bSZ+?=
 =?us-ascii?Q?1+iXASB8pFvnZLZmkl6fAUa3jXgQtxXaNFqcalHtl6FDLybxb5iAAHrxBZ5X?=
 =?us-ascii?Q?CauU7xLZoWh49viPRQA6VFnee7Ixp2O2NKvIbeeaDXJkQTrY6Pru4t0Ti3XO?=
 =?us-ascii?Q?3YN2A+n0Al8Gmq2JeLymVAZ3cuwa8MClAEyhCqLqF0FbxVG+Jv/m7wPwWOi/?=
 =?us-ascii?Q?9uIF+066Tu6UJqPRtY1mOwFzGtZTPmf4rmSuxUom0YfKu1SSxUkudZinfiVo?=
 =?us-ascii?Q?oz7PCq5oX1Z/3ECIXULuEepUvqbr1EEQzoQ+nbRzDEM985wCFO39gwUexVNf?=
 =?us-ascii?Q?LVbcByYYU+Wpx/m+Skgatv8fIj8axs1txj6jXNEcP6fnA3Gufer+7AX0nLHg?=
 =?us-ascii?Q?mocFGRmgwzelODmjBtTbRcSVTY3Jbzo6FoDvqlTVtXu4EYp4oF4gKgCe3HXt?=
 =?us-ascii?Q?+GPUbNdAHBT+PiAyGsJzxkMFqt+K6X4E0F4Li9PjoyvfJ6SNrULx/aSnbu0o?=
 =?us-ascii?Q?GNxVxDxrtvMZXAn1eTTyX2db5tRHOJCVRIYBB+vwAsURfP12312OXCFHMSFe?=
 =?us-ascii?Q?2W35/qnSxKFBrrjKiNlfQ3Ukq1YjYR6nmfyNFRx6JTwQgKa8uAzk0lVfz4mS?=
 =?us-ascii?Q?SM5kIy3tRvTUXMBugVR2meC4izxH6iWjKQqxcgWx4GtquGj+PgUnd0dAUJ70?=
 =?us-ascii?Q?qkK0hkTx4HhebInVz7EHeHNo1dwaiPSyXTe1EReEr/fNaa3a/pWxflgRgALl?=
 =?us-ascii?Q?mtshmfV/ZI5CZA63u8RyFlO2tXbXcZaF5oOCMjAUvOCCxmwPZgDVCO1+VOdP?=
 =?us-ascii?Q?KSIJSKkuVR71GOVcuUiXO3Dp/py8UCEU6uksUucsl++Z1mexYh8ADmwT4nIA?=
 =?us-ascii?Q?A6z997SdK0GpoY++/T014N6XfX09rGus9bS6M57krt9uxA3fLL2nFFagnBOJ?=
 =?us-ascii?Q?nXbe6ZBvEcLSgE2mPWRKY9utjmVPsMmTgOVuDKkx9m6uUjrp86x9HRvRaFvz?=
 =?us-ascii?Q?G2+FzWDYzM+3QR6Ejl6JinBKghrtszocw2/vTe5pKTI1Yi3m3HK551nwcIwV?=
 =?us-ascii?Q?Cx8o2xAO7CYXgAFx1zKAouU02EszqVRorvD/Ui4Syl9rJIIPGd0sbbi23NoN?=
 =?us-ascii?Q?pK7FtxAH0rW42rSUPg0M6v6FX2jk1ZDDdgK4hTAoLppc2fqNzFXTP987iCNa?=
 =?us-ascii?Q?IVTgvoRhdWSPJRqjCxdgnkTg33Q5CN6S3PCRNKttpGc+eWNTM2uT0WgovVvA?=
 =?us-ascii?Q?oAJV7btFdmVC9HnamIgMFxinOf0AXrDln74fTRkazPrYZlT5VVJI2rmt2qWM?=
 =?us-ascii?Q?/sN/55OA3MA+pqsrszURhvEU9GUBRjLAVOXf6creO6QyjJ8bymjOidK0W0Kk?=
 =?us-ascii?Q?wgEaYSk5UaW/HtTdVr2GwlaG/HrEbTexyYyCsQaDBoGS1HsPQzqVkyrrlDoB?=
 =?us-ascii?Q?5nvap3kEFaTdYpjocmJm40RaEvcSs6iyUPG1rE+we8OEroDYosPToxX9PvxH?=
 =?us-ascii?Q?3W7G3afJpe9zSfJSMmk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768c9f4f-05dd-4842-07f1-08dbef3261ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 10:19:47.3168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rxuBc4J0s3967sTisczVrMsO+Vl50pK1QkyR53QePi6qWE+4gz2B/GAkjcmOdMnJSHUGEpNYNYUoamd2FF0x0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044
Subject: [virtio-comment] RE: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 24, 2023 3:45 PM
>=20
> On Fri, Nov 24, 2023 at 06:27:34AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Friday, November 24, 2023 11:29 AM
> > >
> > > On Fri, Nov 24, 2023 at 02:57:49AM +0000, Parav Pandit wrote:
> > > >
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Friday, November 24, 2023 4:28 AM
> > > > >
> > > > > On Thu, Nov 23, 2023 at 06:40:59PM +0000, Parav Pandit wrote:
> > > > > >
> > > > > >
> > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > Sent: Thursday, November 23, 2023 7:44 PM
> > > > > > >
> > > > > > > On Thu, Nov 23, 2023 at 11:21:16AM +0200, Parav Pandit wrote:
> > > > > > > > The device responds flow filter capabilities using two comm=
ands.
> > > > > > > > One command indicates generic flow filter device limits
> > > > > > > > such as number of flow filters, number of flow filter
> > > > > > > > groups, support or multiple transports etc.
> > > > > > > >
> > > > > > > > The second command indicates supported match types, and
> > > > > > > > fields of the packet.
> > > > > > > >
> > > > > > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
> > > > > > > > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > > > > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > > >
> > > > > > > So I am still unsure about these commands.  What exactly is t=
he
> point?
> > > > > > >
> > > > > > Two reasons.
> > > > > > The device reports maximum capabilities that the driver knows
> > > > > > upfront. So
> > > > > that it does not need to come to device to know when to fail.
> > > > >
> > > > > But that requires driver to keep extra state which can easily get=
 out of
> sync.
> > > > Not sure what you mean by get out of sync from whom?
> > > > Not from the device.
> > >
> > > yes from the device. I can't say for sure how because I now see this
> > > patch is implying driver requirements that you didn't document. I
> > > thought the IDs can be any number.
> > It cannot be any number. The device requirement has captured it.
>=20
> Which requirement?
>=20
This is the one I replied before that I will add as explicitly in device an=
d driver requirements section.
I can see a disconnect for you.

> > Couldn't see a lot of point of duplicating it.
> > The device requirement implies what driver has to do.
>=20
> Nothing of the sort.
>=20
> > But if you insist, I can duplicate in the driver requirement too.
>=20
> I think spec should list the requirements we have not imply them.
> In particular driver authors should be able to go over driver conformance
> sections, use non-normative sections to interpret them and then verify th=
eir
> conformance.
> Device normative sections is not something that should interest them.
> We don't always do a good job of this - not a reason to keep adding to th=
at
> problem.
>=20
Ok. Sounds fine. I will add the driver requirements for max limits.

> > > It appears that's not what you meant.
> > > I can try and guess what you meant but I'd rather have you rewrite
> > > this in a way that makes the meaning explicit.
> > >
> > If you insist, I can duplicate in driver requirements too.
> > >
> > > > There are many capabilities here each with a different use.
> > >
> > > And you are under the impression that dumping all kind of stuff in a
> > > single place is good somehow?
> > It is not dumped.
> > It is structured based on the functionality.
> > The config space proposal tends to dump everything in unstructured way =
at
> single place that cannot extended elegantly.
> >
> > For example, Xuan's dynamic array cannot be placed next to other dynami=
c
> array of flow filter.
>=20
> I don't know what "dynamic array" is exactly but generally, Any kind of a=
 big
> array is not appropriate in config space - I don't see any of these here,=
 though.
Ah, now I see the disconnect.

There is.
struct virtio_net_ctrl_ff_match_types

>=20
>=20
> > >
> > > > For many caps, it is to know what is supported/not to decide in the
> driver.
> > >
> > > I can't parse this sentence.
> > >
> > The driver checks things upfront what is supported while serving the
> command, instead of random trial and error guess work game with he device=
.
>=20
> There's no real guesswork with these specific commands: user types an
> ethtool command, driver sends it on, it either succeeds or fails.
It is a guess work without driver knowing if its supported or not.

> However if you feel it important to do checks in driver - OK.
Yes, because there are many parsing fields and good to know.

> But that makes cap query an init time thing.
Yes, caps does not change dynamically.
But sure it is different among different member devices and owner too.

>=20
>=20
> > > > Certain caps are max to know what is the range of id that driver
> > > > can use like
> > > flow filter id, group id.
> > >
> > > Maybe then. But there's apparently no requirement for either device
> > > or driver to put it in this range.
> > >
> >
> > I will add this requirement statements in device requirements and that =
will
> make things clear.
> > Good point.
> >
> > > > > For what benefit?
> > > > >
> > > > For functional work.
> > >
> > > You don't really explain what kind of work in this patchset, or in
> > > the commit logs. Maybe it's obvious for you but not for everyone.
> > What text are you expecting?
> > We have undergone all the requirements study that you conveniently
> choose to not participate for 2 months.
>=20
> Yea ... I'm sorry. Things have been going on here, man.
> I'm glad I'm back and able to participate though.
>=20
Great.

> > >
> > > > > > In future one may want to provision certain max limits that
> > > > > > device can have
> > > > > as they eventually will consume certain device hardware resources=
.
> > > > >
> > > > > I don't exactly see how this helps provisioning.
> > > > >
> > > > Provisioning side will set parameters which will reflect these
> > > > limits to be same
> > > on src and dst hypervisor when device migration is used.
> > >
> > > But making provisioning depend on driver being fully loaded and
> > > accessing the command is creating a chicken and egg problem.
> > I didn't explain well likely.
> > Provisioning as you described, will be on owner device.
> > This command tells driver what is provisioned.
> >
> > > Provisioning is much more likely to use some new admin commands over
> > > an owner device. So this command is useless for it.
> > >
> > Provisioning owner device will use exact same structure while provision=
ing.
>=20
> So the advantage of using config space is that we can have a single gener=
ic
> provision command that gets device config space format. Your approach wil=
l
> need some kind of net device specific thing.
>=20

I see the advantage. But it very small and largely hidden beneath the sw la=
yers how a provisioning command sets things.
A provisioning command sets the value, it surfaces at different level.

Multiple device vendors want to follow the design pattern to use " most use=
s it is better to use a virtqueue to
update configuration information"

Instead of RO =3D config space, RW =3D cvq.

The more pragmatic design pattern is:
driver initialization time =3D> feature bit + virtio config space.
Driver runtime =3D> cvq.

>=20
> > >
> > >
> > > > >
> > > > > > > Patch 5/5 mandates that device validates all fields already.
> > > > > >
> > > > > > > Are there guests that will actually look at these caps as
> > > > > > > opposed to just sending commands and looking at the return
> status?
> > > > > > When the device reaches the limit it would not even send the
> command.
> > > > >
> > > > >
> > > > > That's more logic for the driver to implement. Why should it
> > > > > bother when it can just send it?
> > > > >
> > > > It can just send it and fail and flood with error logs.
> > >
> > > If the spec says device can fail and that is expected then it won't f=
lood.
> > > If you don't want driver to send some commands you should say that
> > > instead of saying device should filter them.
> > I will add the normative in the driver requirement section.
> >
> > >
> > > > Also it cannot just send some random id based numbers that device
> > > > does
> > > not support.
> > >
> > > Aha. I think I'm beginning to guess. You wrote:
> > > 	field{max_groups} indicates total number of flow filter groups
> > > supported
> > > 	by the device whose group identifiers can be any value in the range
> > > from 0 to
> > > 	\field{max_groups - 1}.
> > > and you think this implies that it can't be out of that range.
> > > That's not how logic works though ;)
> > >
> > Which logic?
>=20
> The aristotelian logic we commonly use.  You say "group identifiers can b=
e any
> value in the range".  You seem to mean "group identifiers can not be any =
value
> not in the range". These two statements are not equivalent and neither im=
plies
> the other.
I fail to see the difference between the two English sentence you wrote.
Can you please have an example, how second is any different?

In my example max_groups =3D 5, so group id must be from 0 to 4.
It can be any value.

In device and driver requirements, I will write the explicit line that it M=
UST be in this range.

>=20
>=20
> > The driver will honor the limit given to him.
> > The device will also naturally honor what it published to driver.
> > >
> > > > > > For example if the device supports only one group, it wont
> > > > > > implement
> > > > > ethtool ntuple and will chose only arfs as one example.
> > > > >
> > > > > Sounds like a contrived example why does device even expose flow
> > > > > steering then?
> > > > It is not contrived at all.
> > > >
> > > > A device may be support one or multiple groups. Each group in the
> > > > OS has
> > > multiple users.
> > > > One group is enough for either ARFS or ethool but not both.
> > > > Two groups can allow ARFS and ethtool to co-exists.
> > > > 3 groups will allow in future to expose some queues to user apps.
> > >
> > > Oh I misunderstood.
> > > Then why would driver decide to force a decision to ARFS specifically=
?
> > > It will likely leave this to the user.
> > It is the driver implementation choice, For example:
> > if there is only one group, driver can choose to give strong preference=
, say for
> ARFS only.
> >
> > Or it can let it be on first come first usage, for example, if ethtool =
wants to
> use first, it will allow it, not letting ARFS to work.
> >
>=20
> Practically, drivers are highly unlikely to make the choice.
It will make the choice when there is only one group available.

> That is why it is reasonable not to have checks in the driver if device i=
s doing
> them anyway.
The groups particularly have the priority as well. So the check in device d=
oes not work.

> But OTOH if you want driver to do the checks then I don't see why we shou=
ld
> also add them to device unless there's a good reason to.
> Less checks in devices -> cheaper simpler devices.
>=20
The cheaper devices can always place UINT_32 max values and ignore any chec=
king etc.

The check in the device will be done as it uses such an id for its own book=
keeping.

> --
> MST


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

