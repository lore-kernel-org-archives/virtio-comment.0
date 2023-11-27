Return-Path: <virtio-comment-return-8632-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7021C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 10:20:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3DD614456D
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 10:20:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 80A09986927
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 10:20:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 564A3986397; Mon, 27 Nov 2023 10:20:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C97199863A1
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 10:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPWzJzQsbY8hyQPeu9S+GO/rUbZ/ac7KvU18r2v5EMLpjAiQFp3FhjVWSPzjiHHxTSH/3cm1ztzwB3OS9Amugw46g2R5Pwoi19BcbKxlG/7LZW/3Bvl8VeOiNaVzt8uQKyKL7h6ZH2NxgemwxB8143SR54Ocy/QSUvoAZxBs9qXgGZvYOrfKGsJlB3sS+mYSBlYM2ONTERijX3JKUY0lwDsaruTOe7OcmNqAwYEfaBmRA6NZkCdttNZz+vuVa5L8Wl5GfcXui0zAQFGYy/vF1JTTKY1f+cPkx7dKZW7tlvCLgrRawpWLPVC1Ah5iXxaxRMqwlY50k51Jd77hOYlo8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xmCzProWHDjbp+srb0CQpcUuURi3UniXKlOHAwvT1k=;
 b=bSip87Qd0j93GM/VZK1YGQUfOf1gYfjjRSCkvdHzOD2LFAL0ior2uQX3lghxIh0dW6WclkHxYiSPWRS8xg3NnGa/MiA3wOh79XuKbhggg9+zqsvZYtFJNVloFE+yfBn2cR15Yt3fwxNjjAANX5Wn+gfOmN4V+E8BdWEEOi8PtLpnfJmKDcVyuEZm+YSK7dnsveYshswbA1VkbUX2L/L+7baKTsqms1Qnh2NezTl7EqM3i04wyhRWTElOVmcXOnc6RLRhpOMMAiKMpclqgNha4O43+8IV3Lpm3eVA/Vob6o33rgsDn5AWOA9Arn6f9bFTAr3+wVJkBFf3zvVssjrx3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Thread-Topic: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands
Thread-Index:
 AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3CAAA00AIACb1eAgAAZSACAAAMmQIAABmCAgAABCuCAAEfKgIAErlLw
Date: Mon, 27 Nov 2023 10:19:51 +0000
Message-ID:
 <PH0PR12MB5481826794DE29ECFF0B5713DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <20231124003129-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E538B7BBFB907CC6BBE1DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124005921-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54817AC1DD6C5386A138D5BADCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124051534-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124051534-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4044:EE_
x-ms-office365-filtering-correlation-id: e93a1756-cc25-4e13-a62f-08dbef326488
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YjIKPxMgzV877yGPFA2chUBurNXg7swgtHrtOPlaXXhdt1jrKcrY1VwOG5s3ougCBeViGP+/7G9PpzUYUa2QVRSMeATcm2QVYl/6MAmy3iMZfYH/fp5Q/Wgt7wrHKHxhHd+GYfEt2taVSISbehICzdI7yIKxY25X8KwiXvjQc+Uhq6i8kdLQb/BEGUOWjkrmzFh06uZVaPQ9fM6UThCAqkCSjF7a+43Ch3mzrZbt/d/lY7FRZbmgiv7VV4oyRios4YxJJyr/OaRX2FA9cg9PRP0cAtAUug0M/579NH3JlSd1CYg5vDqLbEMKXlXJGkySC826WY8hzDIk0OElGK/zMFkOjhWR5bYg/dVxd5hKEEuXi+vWnpYbdhL5pQzVFdnmIVCvAhro41+c02RzJdzF0beN6JT5Lqe+V0dHshIPWsmvTMY+qrGkoPlUI0atdyJU5Z81Ct46+tf2sAu3oRHtPEMQOvL8n5pozDUiVuQ+nvsIlsaMirldEjsFXy485hPZ9hsVqP3FSNJI9UyvbMCjNVd9Sf59dobpg9SRNdKH/ZotJC60YLUOYproHpm0w59y311cMPB//+Aofff7ccT9+51AFP5CBgAn27pKKQMMq4GV6+aEOMSsPClVizvZmyOcmoORH1vZYrCTEb2NgVu2g7JNJkLBlbgSvVgSofg5gvPhVQEnSTiPu35q/ZJNvbaE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(9686003)(55236004)(6506007)(45080400002)(478600001)(7696005)(966005)(71200400001)(83380400001)(2906002)(41300700001)(5660300002)(66946007)(76116006)(66446008)(54906003)(64756008)(66556008)(66476007)(6916009)(316002)(19627235002)(52536014)(4326008)(8936002)(8676002)(38100700002)(38070700009)(86362001)(122000001)(33656002)(55016003)(66899024)(5930299018)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JjnUjHwEGHLuWtN6dvc7mPh+ueIx0+ptJuz+YNCSte7oZQINy6SsEBv8EQwQ?=
 =?us-ascii?Q?mvwy9LFZVv/ON79PAhlnfzydryVGag2o/r4bqQT4ozlnmUILMmQ1pRNSzIM4?=
 =?us-ascii?Q?JTwmlawgAsB+Wb4MdS6IFyQXsO8LffagNbbS+wHHKvZvIY0P+uuA9dhCWyDn?=
 =?us-ascii?Q?IDPsmCiV314G0koJ1NlPBNJOcARgGeRMah33ZJVRxNy1aNCgYtur1J0yMcRS?=
 =?us-ascii?Q?AgoQ5lTKpZuv3VDcH8WxdJ8w9VdSwvKcn6wpON0f6e63EEAe7RfOMhMk58zZ?=
 =?us-ascii?Q?9Yg3VvP4h8wtyq/0EihUYY39NZItBZrASLl5SIUxXfqGRlzMOnCSX0lGAnWu?=
 =?us-ascii?Q?NTqtTvL4lrOYN73xCZzLkS4AXW69qwNYYfbWaIiXeBbGB7R2hLO29tKnjm9w?=
 =?us-ascii?Q?ItgsFuuKc62ORMgfrfKh8l80GmfP0PXgB1OoTw56xse2+s0JzSyizS1QH29B?=
 =?us-ascii?Q?8mjMLdtk3c2BPnUKXqEKsFb63dy0MK1RH8Pebj2VCLv5jjcmmMj/F36xeKrJ?=
 =?us-ascii?Q?RIjhetP2sci3oebrXXxGWWvxzNKmAZ8x8WC/EanT67V0yyfBr0dFhJpzXTvK?=
 =?us-ascii?Q?3ZWmSWCjzRN+9Qw2yyNjQOjqBcCjHUlt6On/JHZN+yWuUDz+Vla1CeQs+aW7?=
 =?us-ascii?Q?QieLAr3+6dztOLES96d89sdN+iNzFKxM/7ecfQuf6vq9SnXJoWg8xDwW69ag?=
 =?us-ascii?Q?zk5WzigGNzTadBSt4nxQo5LJwN7nSMToejJzAmvYs6EHMqJTjWYDj7gygVTJ?=
 =?us-ascii?Q?j+YBPlDE2fqdlPPqCPKoIPu1gIUbGmpMUll6BYCZO+xL+RepE+F5aURuAucX?=
 =?us-ascii?Q?+o3/QkKqv2d2InxQXIjQbqoel6Bjmuy8x/35D1pipuy10BMh/SJhXLUUa7BG?=
 =?us-ascii?Q?leFWMyl7LPhpDi/fkU3tPEG4cldbExvAqtORwNUi9cHF+rIIBxDe2lMjZezI?=
 =?us-ascii?Q?ivJwwPLzUrPuYZGjXynMTEQFmyB54iIJVjOaSQDSnRaO+f6H1SKmpKj4WlME?=
 =?us-ascii?Q?KzhT+sgaC2BTHiRjLPO3g1SZ02mCsOd0Cl2i/VTYY6qEZ3mdVIzZQvdxVBvl?=
 =?us-ascii?Q?IXDxwYr2wgifdO0PCoY0WkxdneL9oorWFFT78ux1w1DIs5x3FSIxBOFUqm/Z?=
 =?us-ascii?Q?ES5UrmV3n5RHfWXYNuVXuVmP9SiNLg9BKiJOTC6ZlXIko1Fw5T09igUuavV7?=
 =?us-ascii?Q?ZeuKRwfpPKG9/UVGOjdMqW4oqcMdtAKb+OWhhHD5PUBKyhD6UEBxRZvs3KrO?=
 =?us-ascii?Q?saY2xLpr2sHP4ppaqH8ysN/fgvzVDV5ulN38jPF7w+qJu25MceSWcno0VQt6?=
 =?us-ascii?Q?WKUIM807mVWx22A5UKF9kxUVMYpbE2xVQ1wE9sfVnY7rAiY5sol2z9ByeLod?=
 =?us-ascii?Q?S+jlBmipm5jR3DFbEVlFYumboYsMMPwHc6VlgcWYw97IMRk4tqhTnP1juiSQ?=
 =?us-ascii?Q?kg6naKyLGn/BX4s2rPcjnJUPfUdDgTwrr/TCP58sYEB0M4qYF9WRJAdOoQmt?=
 =?us-ascii?Q?APHBENrAvo0bIRufkSRfw5+FxT6ULh+ahZ1bHyfEC1dPQmRWB/7PHwAYS5uj?=
 =?us-ascii?Q?2apgI2YodJ1DGJOPvYM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93a1756-cc25-4e13-a62f-08dbef326488
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 10:19:51.6941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fnHgIBNQsqFhkv1RTayjaMj+80obNDRbVKFzWRomEe70i8vZJR0PNY2s8TGTlfsUrAut66mfMVl+ARTu4gxrtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044
Subject: RE: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 24, 2023 3:58 PM
>=20
> On Fri, Nov 24, 2023 at 06:27:46AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Friday, November 24, 2023 11:37 AM
> > >
> > > On Fri, Nov 24, 2023 at 05:53:02AM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Friday, November 24, 2023 11:03 AM
> > > > >
> > > > > On Fri, Nov 24, 2023 at 12:02:23PM +0800, Jason Wang wrote:
> > > > > > > > I won't be able to absorb this comment of DMA interface.
> > > > > > > > If I discuss further, I will repeat the whole document [1]
> > > > > > > > and I will avoid
> > > > > that now.
> > > > > > > >
> > > > > > > > [1]
> > > > > > > > https://docs.google.com/document/d/1Iyn-
> > > > > l3Nm0yls3pZaul4lZiVj8x1s73
> > > > > > > > Ed6rOsmn6LfXc/edit#heading=3Dh.qexbtyc2jpwr
> > > > > > >
> > > > > > >
> > > > > > > I really worry about how provisioning will work. And I do
> > > > > > > not at all cherish replicating all of these query capability
> > > > > > > commands for
> > > provisioning.
> > > > > >
> > > > > > +1
> > > > > >
> > > > > > There's nothing that prevents the config space from being
> > > > > > implemented in a way other than registers.
> > > > >
> > > > > Care doing it finally? Let's see if what Parav is worrying about
> > > > > is then addressed.
> > > >
> > > > The whole concept that everything must be in one giant config
> > > > space is just
> > > simply bad.
> > > > It does not exist either in virtio spec today.
> > >
> > > But it does, this is what transports are doing.
> > I don't understand what is "it".
>=20
> "it" here is passing device init time configuration to drivers.
>=20
>=20
> > Transport like pci transport bits.
>=20
> in a simple, logical and functional manner.
>=20
> > CVQ is functional object that helps to arrange the bits in logical, fun=
ctional
> manner instead of trying to place them in bit array.
>=20
> In a device specific way.
>=20
Yes, and in multiple of these examples, they are device specific structures=
 based on functionality to extend.

> > >
> > > > once can see that what is presented in the commands cannot be
> > > > placed in
> > > config space at dynamic location.
> > > > Same was the case with statistics too.
> > > > Same was the case with VQ coaleasing knobs.
> > > > Same with hash knobs.
> > > > With flow filters,
> > > > With rss contexts
> > > > With rtc
> > > > With new queues creation apis.
> > > >
> > > > The endless list continues...
> > > >
> > > > And reserving bits for future (for other than pad bytes) for
> > > > future addition in
> > > config space is equally not elegant design.
> > > > Bits will get spread out at random location making things even
> > > > harder to
> > > maintain.
> > > >
> > > > The device is no longer a simple mac_addr + N queues device with
> > > > some
> > > static rss config anymore.
> > > >
> > > > With all modern work, every capability query and run time
> > > > configuration is
> > > done over cvq interface today.
> > > > Single get/set channel from driver to device all using existing res=
ources.
> > > >
> > > > The real hw device also does not need to refer to two places of
> > > > config and
> > > cvq when serving cvq commands.
> > > > Oh, the list of advantages just continues with what 1.3 spec has do=
ne.
> > >
> > > I don't see the problem sorry. We've been doing this for many years
> > > with many ways to access config space.  It scaled well.
> > >
> > I don't see it. sorry.
> > The configuration of the device is done using cvq.
>=20
> runtime configuration, absolutely. We found out writeable config space fi=
eld
> are painful for a variety of ways, the main one being device can't report=
 errors.
> So we generally avoid writeable config space.  But read only - no good re=
ason
> to avoid them for init time things.
>=20
The good reason as explained in the doc is to not place them based on the p=
olicy of read_only vs read-write,=20
Instead based on the access pattern whether it is needed in early driver in=
itialization time or can it be read at later point over.

And the based on the access pattern has given more flexibility to implement=
ations across sw and hw based devices without any lose.

From the device side it has consistent view of get/set via single channel =
=3D cvq when dealing with the guest driver.

The two non nvidia examples of these devices are Microsoft MANA nic and Ama=
zon ENA nic.

>=20
>=20
>=20
> > >
> > > Then hardware offload guys come and say that in PCI spec current
> > > transport is forcing use of on-device memory, and they want to build
> > > cheap offload PCI based devices. Fine, let's build a transport varian=
t that
> does not force this.
> >
> > All new capabilities and control is over the cvq. What is baked until 1=
.2 is sort
> of legacy.
>=20
> Just repeating this will not make everyone agree.
>=20

I see that Satananda also is fine for Marvell to use CVQ.

> > >  And
> > > we want optional compatibility, so let's also find a way to do that.
> > > This makes much more sense than forcing transport specific issues on
> everyone.
> > >
> > Trying to attribute as some transport specific issue is just not aligne=
d to the
> spec written today.
> >
> > > To add to that, what did not historicall scale well is transport-spec=
ific
> registers.
> > Then you should have put the VQ notification coalescing functionality i=
n a
> horrible virtio_net_config register like how a queue reset in the common =
config
> space.
>=20
> No because of the 4 commands: VIRTIO_NET_CTRL_NOTF_COAL_TX_SET
> VIRTIO_NET_CTRL_NOTF_COAL_RX_SET
> VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET
> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET none are initialization time.
> They are not capabilities: they control and inspec device runtime state.
>=20
> If we had VIRTIO_NET_CTRL_NOTF_COAL_CAP_GET that would belong in
> config space.
>=20
I understood you.
As we propose above, those caps reading is not must during initialization t=
ime phase.
Hence, cvq delivers better scale like stats and consistent get/set.

> > Thank God that mistake was not done and many similar mistakes were
> avoided.
>=20
> Let's not get emotional here please.
>=20
> > > That was a bad design, with all transports doing exactly the same
> > > thing is slightly different ways.  And what you are advocating for
> > > with CVQ is exactly replicating the bad design not the good one.
> >
> > CVQ design is what extends the current spec in good way. Followed by ma=
ny
> other non nvidia nics listed in the doc for reference.
>=20
> I don't know what you are referring to here.  Register maps are all over =
the
> place. It's a simple, standard, well understood practice.
>=20
I provided various examples of virtio and non nvidia devices which prefers =
to avoid registers.
Satananda from Marvell also expressed their view.

> We have some niche uses due to need for extreme VF# counts, this forces
> DMA for them, not a good reason to force it for everyone.
PFs are equally benefiting from them. Some of our hw devices has large PF c=
ount.

> The sooner you just stop forcing this down everyone's throat the faster w=
e can
> make progress on things that matter.

CVQ is established good configuration channel. So we all want to utilize in=
stead of being forced to grow config space which is very hard to maintain a=
nd implement.

I will fix your comments in v7 regarding the honoring max limits in driver =
and device.

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

