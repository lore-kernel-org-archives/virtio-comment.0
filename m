Return-Path: <virtio-comment-return-8644-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724C9C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:54:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D40452B020
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:54:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ACBCF9863A1
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:54:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9460998638E; Mon, 27 Nov 2023 11:54:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 87A1B986394
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 11:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3UgMXPhsq2bIlJvvqfJ3sbh581OkqtA+L+hvVSrA4hMMPN53a/14zJr0iw7HRkL4TJrd+gkq9XdwCZUc3O60+U4n6eCqBXc2XDLBdGq3kPz2EWrcll8PxWvw1k0ddEl15QG2ZvfqD3pFP/ZvrW9dhartwdcOolU90mLQloo4KaUY8Mxtw0CuOmq6K1+3zzVDRMuLqtKcakSzmCOBFhbDAW9nNItQ0f1Ma+waccxNHvsL8bP96+9ZaGjJAzCDVh4V5xQ15Vp4M06JnMi0IeM/Rzbu0oqE+h9WpqzE962lz+dmiUSadX8xv4z1s1arWiZa642OBfTTyTHnpDJmRAZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfV7a29KrX06UYfbAEMNpHDGZ9B3aZyZWQOKzCj6V+s=;
 b=hme5p//oDOUETILkGdYtfjQylGmh0G96h99XcMViXrzPfuWOxbeIZ5RUML0J+RRBJIkrHTJpoHJh8tpgxpVRs9/yckTS+unEx9SJTjIUzEq2cGjXfqbeOdqBckjdOFl+ta97GP0gCRYSiKdUpn8z47Xq8EiyAt+yquWN+DZBUtWf+J3dkPVni1dfFVN5z78mebU7TJpe+sumKYy1d5ronmziTECLdky5mlZnxwoxCNc0JU4F4rUya8Isyt8IQhrsk3JwCYakgQrDFwTg+dNe2tGOLyaI69OdawZZFJTjfhdOp73NvXCkr2IAmUdRQWU5kK+n8IzsJNk1uicRqcl0nA==
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
 AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3CAAA00AIACb1eAgAAArBCAABgnAIAAAHbggAAMmwCAAALhQIAAVVgAgASgprCAABTDAIAAAclAgAADm4CAAADuoA==
Date: Mon, 27 Nov 2023 11:54:52 +0000
Message-ID:
 <PH0PR12MB5481621EA37B28FA7450A113DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124011125-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481437B4AA6C4CD4F1CED5BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124062907-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548179FEF8CEFA3D509FF471DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127062256-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E0368B0B04D4B43CECD2DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127064138-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231127064138-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN0PR12MB6030:EE_
x-ms-office365-filtering-correlation-id: b2fecacc-f1f9-454f-f457-08dbef3faa79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 yI1JxzN+/qYEmcVJLB0N1DaBH6o3VwYLmUzYPOn/xeRBp6rEfJdP92Mkd43HlZmjLh89bzSl3vYSeHcOdIEwsnsOzPHJRccu4Z47BNu0AFhgHONCjR/nnXTBAPbempBv6n9zvMvuQLhIrKgXsNEycHipLWswkX2GibPpyVzJJRS5JZUFKAhcBEUxL99mR29asOKWz72cb4gGGuFc2eXaIYBp5UCItlqBOMxqSPhY+MEpn8qD2oOveRwrDVQqtBPwX8BUCswWnjhpTnKq4+7Rb17rxV2c/a6fSwep2V9WzfAGxdjV+7oHpzX7PsjCeD22aNG0P3ivrt0TjfZmNTL+hCT6Od+iG/F3Fg0Qq/6ndeWIljCFNNO0VmhnKlZhzJ/usBlcitcACmKPF+KmoK9uuX3NabkG/aHBICZiD26XU0r7wR8Uw6aJzT7WIUyKch9JCK+lTn3pwl+phoXeRottfddL2J8bD9RUCc2s414VOs73ejcv0rSCUpLyEFhMcorQN3gVOFaLiualK65s4I1/CY/hAWll/H8VcH1wGFT/k5yRCT4usJKrWtX/LPfkALKzmdk9tSyeV+BiR/U5ppgPES9xm0AoeoP3tIU3Odw/wkq132ZWMrkwG9mtg/oP8FHp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(52536014)(71200400001)(8936002)(8676002)(4326008)(9686003)(6506007)(7696005)(55236004)(64756008)(76116006)(66946007)(66556008)(316002)(6916009)(54906003)(478600001)(2906002)(122000001)(55016003)(33656002)(38100700002)(41300700001)(38070700009)(86362001)(26005)(66476007)(83380400001)(5660300002)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZEv71ZOrOh0/pcklj9htsxh7egHxyJSJI3p+VMbBrHjllHWX+LwmDKkQLVJ/?=
 =?us-ascii?Q?TI6OnVoX9JOTCC61DfbR0ffSLzXTCgqdS/wELMlL0jHsqPdaRW8jjxxjLC26?=
 =?us-ascii?Q?kjdrXIbTUGdGRDMSlKD3ajhvYRibekluKusSs+4gQXXFfpTc0vUDpWD/6+nX?=
 =?us-ascii?Q?EFNJH6uDZzn+qHSnDAVLDUqYd+Zxpiuk9QjAPJXm8/hMtAzk/3IK9A9cWA0+?=
 =?us-ascii?Q?Uic7m7+ic+UKi8DDxn2IL33Oe3ZLLrQMUxTHDFyRZEeB8agzVphJpGsQKjrQ?=
 =?us-ascii?Q?fBO+uVXFL5BOveF4IMwwuJhvKViGTPRPuKj44fMtXeKM4y6Dif34316WNERK?=
 =?us-ascii?Q?5eX9fizPH1RfBPZFaBgrwc7ks9vtw8Y01+jl681xeMHzmbbcOn6vlyowxzc5?=
 =?us-ascii?Q?Xp+fv8+5gKW76O/HBm9NYrG+cBunPY8LLJoHQQnNHwydDO3fdfUIn+UFcWau?=
 =?us-ascii?Q?+n9b6Fdlky/wfa/gMzDLWknJ2GDrsE5u9F7V8PxJtA//33VDAPbwbgan0fGZ?=
 =?us-ascii?Q?6Or0YNVihn4GPAYFInf24JzZ9vJu9sqFFbei+SX2bzubsL3aYZoruAMvHB/m?=
 =?us-ascii?Q?RhdVuDL4wynEmIum2AjGPjv1wPlSe32zPEpM3z/Ujd0KzrYKMtBQt0JmbtC6?=
 =?us-ascii?Q?f/cUHNVIfRk18t4LxPnt1DDV61CNjifFw6adezDxtCrJv5lKBJMyGM/JN0hI?=
 =?us-ascii?Q?8I1M6pbY0cUDryNcm0CqggMoEyA0KBx/GIWqNbyzBoNfdiJM8p2FHgTTjxrz?=
 =?us-ascii?Q?bFNkHB4mKQX7tHeWj83yYGX4MXhMdLW00fVLf/vGY/DZV/HDnWbLkuiJkkcm?=
 =?us-ascii?Q?rGGrAN3Yjihfm3OZPs0orFJqLyLnCN8xYYSrDTf2fY7Vs9ayo2CHa85yDUaa?=
 =?us-ascii?Q?S2glb6OXrnRrU/e8BD0SLkRTXzUk66RMIpMiT093uQvqcMbrI0TUdioLbbs+?=
 =?us-ascii?Q?tGVe+yD3gW2VaMHNHy6RgU2H83Y6QUdY6RSY9OZIdi/V02WzSoYQWhpoUmlC?=
 =?us-ascii?Q?nc3bfKHrFKclzvkNOrDQ+vqbKB/etxMXcu4T2ClgRIbL9CGJj7i2Eymdry0N?=
 =?us-ascii?Q?1a+PxghDHcXGbeoZtjW47t0xzvI/1wBiay4A1vWQWEZfEWqNHPra/pj4cShi?=
 =?us-ascii?Q?hEsBABWqlpkj3Ocj8MlROAYd5s8tlVpOxv6a19c8OOi7MWqlTCq7QGEp7Bxr?=
 =?us-ascii?Q?YU5Ez3ZZNc/U0XGvq+FHpHTEZoqVrfVjh04H0MhXQsjpon4yGgsjm5DGMqWF?=
 =?us-ascii?Q?VfjcShTk5xKER4qGD/oEwPixuL4AL7x78ZpL/HVMo37oeztm9k5BRb4EA77b?=
 =?us-ascii?Q?Yd0NYbp/d1+c9tVyyLFqHe0MQXY7hNDmVGqTemA2NVBjkYAIoZbytS2eGLxc?=
 =?us-ascii?Q?Ph78pqpdCI43YecdiMO5irQw4HrkTx4Ydv0jQptKuf3Nd2q2+3uUvPkl0gRP?=
 =?us-ascii?Q?+HdIIem5NWHZ9iBPvwpa8E65fCCOimnXOEB0sBk5/PvNpAgoG2IjWm7eUJVA?=
 =?us-ascii?Q?UGv4FGw5uBiXj/9nDQJGzKa6jy48y2Whv1Z2Bo9PO0UTsu57TzLitDm+d3qJ?=
 =?us-ascii?Q?MrPkNrR6lnuTXeXo1ik=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fecacc-f1f9-454f-f457-08dbef3faa79
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 11:54:52.4586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RywIbbVPBvS1/G+wNK+cfV6s9xY6F8eJcms+3V608spS4qEXF2I5dnsAWp2PrJtR10MwPPuG/4AxpnUzLxq/VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030
Subject: RE: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, November 27, 2023 5:17 PM
>=20
> On Mon, Nov 27, 2023 at 11:40:25AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Monday, November 27, 2023 4:58 PM
> > >
> > > On Mon, Nov 27, 2023 at 10:19:49AM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Friday, November 24, 2023 5:04 PM
> > > > >
> > > > > On Fri, Nov 24, 2023 at 06:31:03AM +0000, Parav Pandit wrote:
> > > > > >
> > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > Sent: Friday, November 24, 2023 11:48 AM
> > > > > > >
> > > > > > > On Fri, Nov 24, 2023 at 05:40:26AM +0000, Parav Pandit wrote:
> > > > > > > > > we
> > > > > > > > > strongly suggest that *drivers* support both old and new
> > > > > > > > > mechanism, and then *devices* will only implement what's
> > > required.
> > > > > > > > There are other examples in the same document that makes
> > > > > > > > things worst
> > > > > > > with old and new.
> > > > > > > >
> > > > > > > > Also there is literally no way to enforce that driver
> > > > > > > > supports both and new. It is just sounds like an excuse to
> > > > > > > > force infinite config space.
> > > > > > >
> > > > > > > There is a very simple method though.  We allow devices to
> > > > > > > expose a subset of features when DMA is not used. So drivers
> > > > > > > that want maximum features will always opt for DMA. We can
> > > > > > > also strongly recommend that all drivers support DMA if avail=
able.
> > > > > > Yeah, don't see how this is elegant at all with all mixed bits.
> > > > >
> > > > > It's elegant because simple low end devices can cheaply
> > > > > implement MMIO and not worry about DMA.
> > > > >
> > > > It is not of much help in this case because any low end cheap
> > > > device which
> > > want to support flow filter commands need to have CVQ anyway.
> > > > And hence reusing the same CVQ is more elegant that already does th=
e
> DMA.
> > > >
> > > > So CVQ is fulfilling all the below needs.
> > > > 1. Single interface for the get/set config flow filters 2. DMA the
> > > > data 3. Not have any partial issues
> > >
> > > I don't know what these are.
> > I mean partial writes for fields.
>=20
> We don't allow these and in any case, writeble fields are best avoided.
>=20
Right. This is why flow filter objects are created using cvq, and its assoc=
iated caps also comes via same cvq channel.

>=20
> > >
> > > > 4. provides consistent structures that provisioning side will be
> > > > able to use
> > >
> > > Problem for provisioning is extra definitions will be needed, in a
> > > device specific way.
> > In vdpa tool and other OS tools of iproute2 developed, setting and gett=
ing
> those device specific values are useful.
> > It is ok.
>=20
> It does not become ok just by saying so. You are taking a single RO value=
 and
> instead of it having an address there are now 2 other ways to address it.=
 And
> you fail to see the problem and the pain you are inflicting on software
> developers. Just stick with an address if you can.
There is zero problem with sw.
Sw just need to issue send_command() and done with it, like rest of the com=
mands.
A pain would be create yet another DMA interface.

>=20
> > >
> > > > > > Nor do I see any enforcement, single method via cvq still holds=
 strong.
> > > > >
> > > > > You don't need to enforce things, if people want to put a lot of
> > > > > RAM on device and put it in a register let them.
> > > > >
> > > > Not enforced. It uses the CVQ for flow group and flow filter life
> > > > cycles and for
> > > the sharing this config as well.
> > > > Also aligns with stats that rest also agreed on.
> > >
> > > I am talking about your attempt to generally say "no more config
> > > fields everything must be in CVQ".
> > Config fields for initialization time is fine as the spec allows it tod=
ay.
> > Things which can differ, it is ok to use cvq interface.
>=20
> I don't know what does "Things that can differ" means. Generally device c=
aps
> are perfect for config space. Accessed at init time only, RO.
>=20
You ignore the comment I answered before that proposal here is not based on=
 RO/RW.
It is based on initialization time vs run time.

> > > I think it's wrong definitiely for non network devices must
> > > sometimes for network too and generally we need a solution for
> > > config over DMA. This specific thing - whether it fits in CVQ is a
> > > separate discussion.
> > >
> > I explained it before, that 6 out of 19 devices has cvq which are compl=
ex
> enough doing things over cvq.
> > These are non-network devices already.
> >
> > If one of those remaining device becomes complex, it is likely it will =
need a
> cvq to suffice for the dma interface and it can just do with depth =3D 1.
>=20
> Using generic caps and not net specific ones is a good idea.
>=20
context here is cvq and net.

>=20
>=20
> > >
> > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > The method proposed here is elegant and clearly promote
> > > > > > > > one way to do
> > > > > > > things for driver and device with predictability.
> > > > > > > >
> > > > > > >
> > > > > > > I don't see it as elegant at all. What is elegant is *a
> > > > > > > single
> > > > > > > tag* that describes each property of the device. And this
> > > > > > > single tag should be
> > > > > good for everything:
> > > > > > > driver, provisioning, migration. And config space offset serv=
es as
> such.
> > > > > > The single tag is the set of structures.
> > > > >
> > > > > I have no idea how this will work. If migration format i started
> > > > > reviewing is anything to go by then there will be a huge
> > > > > elaborate structure nothing single or simple. By comparison
> > > > > there's already a proposal how provisioning can work by supplying
> config space.
> > > > > it is just a clean model to grasp.
> > > > >
> > > > The provisioning model is simple is to supply all the configuration=
.
> > > > To draw parallels to some sw side,
> > > >
> > > > There is per functionality socket option to set things, instead of
> > > > one giant
> > > structure.
> > > > There is per functionality ethtool option/cmd instead of Set
> > > > ALL/get ALL
> > > enforcement.
> > >
> > > I'm not sure how much of a parallel one can draw.
> > > Do not see a lot of similarity.
> > For lot of configuration they are similar that happens at slow pace.
> >
> > > Devices commonly use register map. Everyone understands this paradigm=
.
> > >
> > For initialization early device setup time, yes.
> >
> > >
> > > I am not altogether happy with the way you are making migration
> > > generate duplicate definitions for lots of things we already have def=
initions
> for.
> > > Having a 3rd one for provisioning? Gimme a break.
> >
> > For migration, we are not duplicating. Some structures are not well def=
ined,
> it has some duplication.
>=20
> And fyi it's already making people unhappy.
>=20
Those exceptions are not the interesting one to take as example here.

> > But large part seems be able to utilized pre-defined structs.
> > And here for flow filter also same structs will be used.
>=20
> So if there's a 64 bit bitmap in config space, then provisioning command =
which
> already gets config space can just use its offset.
> Simpler, better.
>=20
It is not simple to implement per device unique config space as we discusse=
d already.
And no need another DMA interface either as cvq service that need already.

>=20
> > >
> > >
> > > > > > Provisioning access them via owner device.
> > > > > > Member driver access them via CVQ or 1.2 legacy config space.
> > > > >


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

