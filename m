Return-Path: <virtio-comment-return-8652-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BC1C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 13:05:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 52FD02ACA4
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 13:05:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B8079863B7
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 13:05:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0D02798639C; Mon, 27 Nov 2023 13:05:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CEB239863A1
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 13:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUgLy5uPCMtNxgr2AqgNgiBAcHmCo77rmWX2nsEuCDsnwmOqyxUpnNsAgXDmfJS2GAmiYVp0t09HVZOhSgQdj0WXw0xrRQeNvXtYZL7AtvYrroC6Mm0IL7YQC+yhzB0hi5EjjIlfnFnv0M1rmy+4yOzkTuQ9d2WKYBKnHYFwUbcXFIygCLiMCEM5G45NdpLny4KASECYJobzOPfGOUxGeiCVKgEMHw8LZHrszgGLu8rGaFUndVi9d7QFJJ5KUeCupD8EN3OA6nseLZ1YbBsEvlQ2PpZ9T8umD9QslWSFSR45j+KnjmEE83QGCF3FAbWqVPKa7xBk4Crpmg5JPN+lPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04HSB1d3tZ+voOnOhidIkFewxHKfu4ewbnYHowwv1oI=;
 b=FYuaBZ84bTzajKO7DZQbAGeYxiGmXyw6eiD+V6onp/fkVlO9tbM6yw2oy9SS8sNjVtOHkzy5tKTLNRdyoJBUpWPVBhJui0qLymIoS6GxbWavVKUecFOhLMJSeeCXRwzvZT/V/jrig9F0chafETs/rbgO9oggPmiRFkeSJx1RF50oYv2F4rTvfCoPWMcnmtXc00iSY5pFtHGo9RMp3Bz33o0hDtMuWyP1NA4hiru1H1nVzM63OJVht+W0jz8M2z0fuCPAFzjLQW+98FbP0m57t27ecl+V3PdYWPSuVPevDmXf40/W7cG6IHggGpiBEtCtQIH6ypGfE62V/OkX0XoGLQ==
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
 AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3CAAA00AIACb1eAgAAArBCAABgnAIAAAHbggAAMmwCAAALhQIAAVVgAgASgprCAABTDAIAAAclAgAADm4CAAADuoIAADnoAgAAEmUA=
Date: Mon, 27 Nov 2023 13:05:15 +0000
Message-ID:
 <PH0PR12MB5481C3EAAE002B10EEA20008DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124011125-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481437B4AA6C4CD4F1CED5BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124062907-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548179FEF8CEFA3D509FF471DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127062256-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E0368B0B04D4B43CECD2DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127064138-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481621EA37B28FA7450A113DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127073416-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231127073416-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA3PR12MB7805:EE_
x-ms-office365-filtering-correlation-id: 17cecc8c-2e25-48ff-0ce1-08dbef497fb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NNMeuvVg/fMt6EQRfkg0d8w28EBan30a+Z4l30xTN1va8wnLBqz1czueA7XQi9mGt6tcFDwsYCkV7feJsufeaxeou1WjFEgnjsE/inVbHFrWiz7o9YPOLeu4XmAcZfrf5LRpV62nRO1GU85Q4ZucebzmUu7XLQS04IH4Jj9/7d0mNW4iWGVjogx/QvhnS3HjIOU6xTeum2H64R5tvwSWFAYXgY1fyv0Ea/pJ43Wwi12u7kQUuIWAx1Xfgmhs8JOfpVbw4LjZSYpTvI2efHU9ozIqvhnCc3vyArOoU5rbNIsvrLcJQ0TKwguuiZ8vM3iGFZ8FZKd99qexwFxSMLoY3Kd7EIQdXIJYYuh5vd3YUwjVDCg+U6IvfERhzLoLWh0M/oCH+fql0nTGgnv/Og2I2//hZQ0nDQ4ucD4d8D73t71PW7zMhNWEpNE1JJUYz/n6vkB+5QSLCkeOjdBXoUDzhtukxKzFGTh7zCRTDJIP2aImdy5Aq4hdsNzugEbvLSBH+GRifxjp0ZQJCfSzsWcj7WaKpV4Cxwu0nHIH/zvAowD5w0s87HmPTyc43QUJ+KjBiM2s6pNWbXnUrN/y5UQMS6eUw0+Rr5PHRGGKylkOcM6CN7dvEY0kpCKN+WJLD1o2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(136003)(376002)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(38070700009)(41300700001)(2906002)(122000001)(55016003)(30864003)(33656002)(83380400001)(5660300002)(64756008)(26005)(86362001)(55236004)(6506007)(8936002)(8676002)(4326008)(71200400001)(9686003)(52536014)(7696005)(478600001)(66476007)(66446008)(66946007)(66556008)(54906003)(76116006)(316002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wbJCSzUV/DYdr/ur2YTcT7rkg2DoOWRhZIKkjGpjOUjpB6+SCBiiMONfXTzO?=
 =?us-ascii?Q?+wFb/mOfKtqTr3wyetZ3ABAzsxanEN6NMqyvDHdCPnUqp+DchYGdawqLuvPq?=
 =?us-ascii?Q?R1wugXVkFltbupQxfWDdnMSYPySfyPlwKYSbytOwySYQbmmUdYuUFT0I9Cld?=
 =?us-ascii?Q?La5AZxi1cO9t5ZZBAFJg1BU+gn6fJy+UHwESFeyaObpZB7jQMPBDb/vKitGh?=
 =?us-ascii?Q?5iJcCJ7BDk59bvat04UVTH6gYcB96EbtETQeMcPLAY0NLf3L60URtZDxAgWD?=
 =?us-ascii?Q?p4jlm49ybpIokIZ1pNEWsSOQMCCee+4EDcZLnPeuUGfb7kVi3/ZpVB9HPaCk?=
 =?us-ascii?Q?B+CPgznwvBBI1jnwmJMOLjCnjXnPrXkMXHfPt4K5wBnPkkJ3ogmqo4uBokea?=
 =?us-ascii?Q?wNqxXFzOddpGTT3JRIBjjMaW/eWjgJFb6Agqo92w7t54tIa/MwMyyzoC7Krb?=
 =?us-ascii?Q?JVnxBBMN7vNHERedlGI7t4fiJ2OVO5mcZucL+M4mFB/iZSlu6G6sGX1Yku9D?=
 =?us-ascii?Q?kpUTcpSqeWfV5WeRtz+5HZaucZS+81SO/DtB5UNuYIJaIngsRyyGxeSVF5Cz?=
 =?us-ascii?Q?yVq3QgprtJ/oO1slYZDD0iYsnQ/ng76E6fl1Psh3eVTtYfFxQW1qWi9Nyo6W?=
 =?us-ascii?Q?g7E7i46ypF/+6Ib8SIDQvPJ04069Kblg7HYbYZSO9sk/WnXJ6sjR9kjhgEpo?=
 =?us-ascii?Q?tjRYRfu2CKXv/NKJeT+IsMRkuszAwRCjv+DLGtQlQN/RBkCgEko2g0gSHqge?=
 =?us-ascii?Q?BBSyxgZvdzwBXRZzjtV7a4Jk9VHlwtgLwlKLlPm8+KSC/PGwZRs0LY3xEAqE?=
 =?us-ascii?Q?Zo249SFQjIgF161g+XjOupuPzvHFTmnIpyHryavwEcN7TLS7xaM3PTK4QJ0j?=
 =?us-ascii?Q?eglppbJv+kTjOVXANamrZ76ViUd5eu0LMMkJGrx98igP83MWfqBbiEPJqvAQ?=
 =?us-ascii?Q?HfeiTiQk4+geagpNzmcAsJ6/etpeDyOxckG8nTDwmyvzIbA4TOAhyxmFPe6X?=
 =?us-ascii?Q?x63Nw0DUbDKkH9yGqH6ITv66Uy2Ueke+mo+7zEUiH0EfSFp2wMa9JUvh0fEc?=
 =?us-ascii?Q?0/W6HtILQ5s7FwmTRiY1Q4oQvTjGcMzT3V9EddhoHX6U5yLq4OzQOYYlb2Pu?=
 =?us-ascii?Q?e47pdwhgv76SFpYldZ2wnJ5z7HdJ0X/nppTOIiTQaBKox1M9y15vnRjFTq3b?=
 =?us-ascii?Q?CPFwk16jTVEv/zy57YM81WDrHoESiflO0KsovhFRkjVBiPOyo6jgbCdD/u1+?=
 =?us-ascii?Q?PbrGY9SiXCT8fySH3KIZnPl9JCLzMBmW/aq4Qp6ZVbSvKx0awAUDheo2dPL2?=
 =?us-ascii?Q?8/fdow9f5Js4AfSdBy821rDnKZGMbWcmc/IG1MAlGgUgjN9XyL+OeCUSBQvf?=
 =?us-ascii?Q?mfpUJO08g3DGi2bBbgwv3xNZL5VzWIqlzCKn06R0nr5ibSkPeqSEWZqnI5N7?=
 =?us-ascii?Q?mko5E550t/YMIKngIUQK0ezKnItKFNGAd6toLgmcfIftQSeA+lmq9DDU6lzC?=
 =?us-ascii?Q?fM1Pbkv7V4DmMqyDUfSCA4QqTtb93vnZpfUuqc6mfkUKGMcV4oyeygJwDUBa?=
 =?us-ascii?Q?G9ZfvD8PD2hE9JM4l+g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17cecc8c-2e25-48ff-0ce1-08dbef497fb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 13:05:15.7102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x60b3cpR1VhZfrSDLxMfFyuLh94CI1Qn+h/QXT5JmNDRRXPADyvfod6pI8Dt3vnf8e0wIp9jMQ2blTaFFG+vfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7805
Subject: RE: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, November 27, 2023 6:13 PM
>=20
> On Mon, Nov 27, 2023 at 11:54:52AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Monday, November 27, 2023 5:17 PM
> > >
> > > On Mon, Nov 27, 2023 at 11:40:25AM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Monday, November 27, 2023 4:58 PM
> > > > >
> > > > > On Mon, Nov 27, 2023 at 10:19:49AM +0000, Parav Pandit wrote:
> > > > > >
> > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > Sent: Friday, November 24, 2023 5:04 PM
> > > > > > >
> > > > > > > On Fri, Nov 24, 2023 at 06:31:03AM +0000, Parav Pandit wrote:
> > > > > > > >
> > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > Sent: Friday, November 24, 2023 11:48 AM
> > > > > > > > >
> > > > > > > > > On Fri, Nov 24, 2023 at 05:40:26AM +0000, Parav Pandit wr=
ote:
> > > > > > > > > > > we
> > > > > > > > > > > strongly suggest that *drivers* support both old and
> > > > > > > > > > > new mechanism, and then *devices* will only
> > > > > > > > > > > implement what's
> > > > > required.
> > > > > > > > > > There are other examples in the same document that
> > > > > > > > > > makes things worst
> > > > > > > > > with old and new.
> > > > > > > > > >
> > > > > > > > > > Also there is literally no way to enforce that driver
> > > > > > > > > > supports both and new. It is just sounds like an
> > > > > > > > > > excuse to force infinite config space.
> > > > > > > > >
> > > > > > > > > There is a very simple method though.  We allow devices
> > > > > > > > > to expose a subset of features when DMA is not used. So
> > > > > > > > > drivers that want maximum features will always opt for
> > > > > > > > > DMA. We can also strongly recommend that all drivers supp=
ort
> DMA if available.
> > > > > > > > Yeah, don't see how this is elegant at all with all mixed b=
its.
> > > > > > >
> > > > > > > It's elegant because simple low end devices can cheaply
> > > > > > > implement MMIO and not worry about DMA.
> > > > > > >
> > > > > > It is not of much help in this case because any low end cheap
> > > > > > device which
> > > > > want to support flow filter commands need to have CVQ anyway.
> > > > > > And hence reusing the same CVQ is more elegant that already
> > > > > > does the
> > > DMA.
> > > > > >
> > > > > > So CVQ is fulfilling all the below needs.
> > > > > > 1. Single interface for the get/set config flow filters 2. DMA
> > > > > > the data 3. Not have any partial issues
> > > > >
> > > > > I don't know what these are.
> > > > I mean partial writes for fields.
> > >
> > > We don't allow these and in any case, writeble fields are best avoide=
d.
> > >
> > Right. This is why flow filter objects are created using cvq, and its a=
ssociated
> caps also comes via same cvq channel.
> >
> > >
> > > > >
> > > > > > 4. provides consistent structures that provisioning side will
> > > > > > be able to use
> > > > >
> > > > > Problem for provisioning is extra definitions will be needed, in
> > > > > a device specific way.
> > > > In vdpa tool and other OS tools of iproute2 developed, setting and
> > > > getting
> > > those device specific values are useful.
> > > > It is ok.
> > >
> > > It does not become ok just by saying so. You are taking a single RO
> > > value and instead of it having an address there are now 2 other ways
> > > to address it. And you fail to see the problem and the pain you are
> > > inflicting on software developers. Just stick with an address if you =
can.
> > There is zero problem with sw.
> > Sw just need to issue send_command() and done with it, like rest of the
> commands.
> > A pain would be create yet another DMA interface.
>=20
> No because it will be a generic thing for all types.
>=20
That does not make pain of one device go away.

>=20
> > >
> > > > >
> > > > > > > > Nor do I see any enforcement, single method via cvq still h=
olds
> strong.
> > > > > > >
> > > > > > > You don't need to enforce things, if people want to put a
> > > > > > > lot of RAM on device and put it in a register let them.
> > > > > > >
> > > > > > Not enforced. It uses the CVQ for flow group and flow filter
> > > > > > life cycles and for
> > > > > the sharing this config as well.
> > > > > > Also aligns with stats that rest also agreed on.
> > > > >
> > > > > I am talking about your attempt to generally say "no more config
> > > > > fields everything must be in CVQ".
> > > > Config fields for initialization time is fine as the spec allows it=
 today.
> > > > Things which can differ, it is ok to use cvq interface.
> > >
> > > I don't know what does "Things that can differ" means. Generally
> > > device caps are perfect for config space. Accessed at init time only,=
 RO.
> > >
> > You ignore the comment I answered before that proposal here is not base=
d
> on RO/RW.
> > It is based on initialization time vs run time.
>=20
> initialization time is really probe. That thing which only happens once w=
hen
> driver is setup. Clearly there is no reason to check capabilities many ti=
mes so it
> will be done during setup, once.
>=20
Capabilities will be queried once the valid id ranges are learnt by the dri=
ver during driver initialization time.

>=20
> > > > > I think it's wrong definitiely for non network devices must
> > > > > sometimes for network too and generally we need a solution for
> > > > > config over DMA. This specific thing - whether it fits in CVQ is
> > > > > a separate discussion.
> > > > >
> > > > I explained it before, that 6 out of 19 devices has cvq which are
> > > > complex
> > > enough doing things over cvq.
> > > > These are non-network devices already.
> > > >
> > > > If one of those remaining device becomes complex, it is likely it
> > > > will need a
> > > cvq to suffice for the dma interface and it can just do with depth =
=3D 1.
> > >
> > > Using generic caps and not net specific ones is a good idea.
> > >
> > context here is cvq and net.
>=20
> yes, you can use cvq command for this.  this will only serve net.  I am s=
aying a
> generic interface for config over DMA is better and will serve everyone.
>=20
6 out of 19 device do not need them.
And when those remaining devices needs complexity, they will likely need mo=
re than just this.

> We are doing this commonly, and when we did not push for a generic interf=
ace
> like with e.g. s/g limits for blk we later regret it.
>=20

>=20
> > >
> > >
> > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > The method proposed here is elegant and clearly
> > > > > > > > > > promote one way to do
> > > > > > > > > things for driver and device with predictability.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > I don't see it as elegant at all. What is elegant is *a
> > > > > > > > > single
> > > > > > > > > tag* that describes each property of the device. And
> > > > > > > > > this single tag should be
> > > > > > > good for everything:
> > > > > > > > > driver, provisioning, migration. And config space offset
> > > > > > > > > serves as
> > > such.
> > > > > > > > The single tag is the set of structures.
> > > > > > >
> > > > > > > I have no idea how this will work. If migration format i
> > > > > > > started reviewing is anything to go by then there will be a
> > > > > > > huge elaborate structure nothing single or simple. By
> > > > > > > comparison there's already a proposal how provisioning can
> > > > > > > work by supplying
> > > config space.
> > > > > > > it is just a clean model to grasp.
> > > > > > >
> > > > > > The provisioning model is simple is to supply all the configura=
tion.
> > > > > > To draw parallels to some sw side,
> > > > > >
> > > > > > There is per functionality socket option to set things,
> > > > > > instead of one giant
> > > > > structure.
> > > > > > There is per functionality ethtool option/cmd instead of Set
> > > > > > ALL/get ALL
> > > > > enforcement.
> > > > >
> > > > > I'm not sure how much of a parallel one can draw.
> > > > > Do not see a lot of similarity.
> > > > For lot of configuration they are similar that happens at slow pace=
.
> > > >
> > > > > Devices commonly use register map. Everyone understands this
> paradigm.
> > > > >
> > > > For initialization early device setup time, yes.
> > > >
> > > > >
> > > > > I am not altogether happy with the way you are making migration
> > > > > generate duplicate definitions for lots of things we already
> > > > > have definitions
> > > for.
> > > > > Having a 3rd one for provisioning? Gimme a break.
> > > >
> > > > For migration, we are not duplicating. Some structures are not
> > > > well defined,
> > > it has some duplication.
> > >
> > > And fyi it's already making people unhappy.
> > >
> > Those exceptions are not the interesting one to take as example here.
> >
> > > > But large part seems be able to utilized pre-defined structs.
> > > > And here for flow filter also same structs will be used.
> > >
> > > So if there's a 64 bit bitmap in config space, then provisioning
> > > command which already gets config space can just use its offset.
> > > Simpler, better.
> > >
> > It is not simple to implement per device unique config space as we disc=
ussed
> already.
>=20
> we did it for many years and many device types.
> 99% of devices do config over a register map of some kind.
> It is not as *flexible* true but flexibility here is an enemy, too easy t=
o make a
> mess.
>=20
>=20
Don't see it this mess, otherwise it should apply to rest of the cvq comman=
ds.

> And your array of types where a single field would suffice is a classical=
 case in
> point. config space keeps us disciplined.
>=20
> > And no need another DMA interface either as cvq service that need alrea=
dy.
>=20
> This is too focused on net and short term, for my taste.
> we need it so we
> 1. don't need to have this discussion every time 2. can begin to save on
> registers for config space in X years and
>    for new device types
>=20
>=20
> And, while apparently focusing on short term people also somehow manage
> to make a point out of every bikeshed instead of the "let's just ship it"
> attitude that would be consistent. I find this baffling.

Not really. using CVQ for the dma interface seems to fit all the needs with=
out defining new interface across all device types.


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

