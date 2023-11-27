Return-Path: <virtio-comment-return-8639-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E175C0755A
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:40:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3299260D2F
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:40:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D824E9863B7
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:40:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B5C4898638E; Mon, 27 Nov 2023 11:40:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A6570986394
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 11:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GY08YmteSbkg9gwgi/WpT4GKAtyWH3Z0Qium/AY4JnbZvuyYx2NAB630dAO3r9q7Uo8Y6EzYz5+gCqF1z4cgDrw0uorGYOw+8BD5SEmwYqtUpv3+2xACP1JTPvweacvV25mtsBdmJtysXSVvaA0fOgXCyU5pdcadaFmAMexoBsrtlF1Dzm/yaLA+ARaMYOT0vmjFz11LSbyQZieCKsXtzgnnD4nzv8JvtF7bD55+1A+LM7xEdW2IT0krCCdl1sEEw5fRWYe5EhDo3S6OkRTRb44zp5a878UCLYJwMysBQ6fQ+49Sh1QyDRacujJj6jpf3xUoc8gr/CLSlZG1zuAHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFriETZOFU2GaCoO5mWvzRs2bN8wVi/HXULD6+pB/Ns=;
 b=ilEo2+RhOuqIQ6JsFdGa+ktvcJxeeCWTzPYcetDMkWodFuU8kSPIOb1/AXQEvmy2Yizq8+Hp/fPG8yUPdqPeT+FIo9YWol6ye5iN8rcf4LfQKrdtzYDpGr8ZD1KpIOnu5DeTGKunwPkvqdSO4gy76vZVjaiC5OdNc5DNg6Wy1c4TkhSTpLT+adX4KNbQZW4/QRcIh+wJT4ubq00yUl1Kg+3Lynq4+5FBBBKQA/jBLUciyMqfXtZ89/b0ZxhVHpD2OeteRcNQhukgpBMt37tNC6UGZPbgSqR/MhhHOSY7g2XV3EnxrOIQJn+z11kW1gXVfp2crR64jSJi8Y7oTL5nhQ==
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
 AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3CAAA00AIACb1eAgAAArBCAABgnAIAAAHbggAAMmwCAAALhQIAAVVgAgASgprCAABTDAIAAAclA
Date: Mon, 27 Nov 2023 11:40:25 +0000
Message-ID:
 <PH0PR12MB5481E0368B0B04D4B43CECD2DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124011125-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481437B4AA6C4CD4F1CED5BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124062907-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548179FEF8CEFA3D509FF471DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127062256-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231127062256-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY8PR12MB7515:EE_
x-ms-office365-filtering-correlation-id: 2c368b13-422f-4a80-3cea-08dbef3da574
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2HT2UHmYqeFm0RXabEkdE2m5rHMtCnezSC38BbTtsaoVpcfC7yEj8KOluU1n0a+QWKwfPAvtrVJiIuj1xLtvUL2aQoj8RpmEr0xPOZT99HV6Fv7vfeTeAuGzdGFTZt3vLGB+ubuoSViL7G6MRZqhPLcMxvYnlrlC7mpHVp/EuwcWMG016qdjv2VojHn7CBFmKdAFqsBR73bYMt7RiKenuPCvKhFW/57Q2OlvLhrj5Trii5fsAorJuREt8b4fuCFe5P5+brCat29HZ76FTHF3nM9Jsnup4ld0FoERZ/VUS5fA4DXK//szKQEAEWP72F1yACJSaUsQHQHqMIpId+sMOYOqUZzNkQ/t94QkXh/Mwp024tsyZ23C9Qd1CKtb9irMljJd5YE+fFlp+1roV+Epj6ZldhTB7nEu/6DqlHcYxoP0bAdfW312PaK41/2vUMhP8sxar9cpaP1vuHlnnaeOsPmyOq7Ok0yHhTEfeMxnC0hOmDuBkSEjMS8aG8FkxeDIwtEDzhNUihtVQ2m0CQpgSLDo496ax19Tk6ZZbM23K05dazzo1JN7/ClLENGuVsL7c588lDlLXZT7ALfyQqiYWo16hKtbtVGsPqgMkM+QtTL2RJRD0CLIp++dI9tKeVw5
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(66476007)(54906003)(64756008)(76116006)(66946007)(66446008)(83380400001)(66556008)(8676002)(8936002)(316002)(6916009)(52536014)(38100700002)(4326008)(55016003)(122000001)(5660300002)(2906002)(38070700009)(41300700001)(71200400001)(33656002)(9686003)(26005)(55236004)(478600001)(86362001)(6506007)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?e0M1N3gsnJzwWfeHfA2bsfK6e+AWxXaeAKWK/JxQlGpHSwP6YKJDczAW2wfU?=
 =?us-ascii?Q?YVOucZLJj+tvQDz/pJRB+RyPe/28/xwQF0eUYQel4PGlUROmXBGrXD75WF5Z?=
 =?us-ascii?Q?9IBPoXR0BnVh4Q9/bdxsFbx2gCrVGZzKfwsUmM5lBaWKdFBvJ8jUmQ2wy3kB?=
 =?us-ascii?Q?NOf2EaA/+mhURbP9f+NrJ1p7SjuoMDW1R1sDT9tmyOausnOEXpiiYTJXD1D/?=
 =?us-ascii?Q?7P0ZNcOkCbF/0OSzGfSTZe1ExgA9bocOkafXiTEluwRT1qke/tGnadLOerCw?=
 =?us-ascii?Q?W7+PHXDfCs8ps+fz0XE1CNjBRqxUrQ/RruATlTBe/bdHy1Vme2wd/xTPHvm0?=
 =?us-ascii?Q?eNBL++VSifw7oG12UYc/hITciMm9V5x3z2/UI4isd36Uoa3bIJTZy8gjI2n0?=
 =?us-ascii?Q?QVY7LYlk10Vv2wsyYWpr0NkgXDaU2CAWoWBuP0UG9tPnArq4eAAGqCPT0CCa?=
 =?us-ascii?Q?mYR+42G+mkE1K3IoDUoaj1X5wdlCVAAwhTtV44lCYEo6L15X+xq7kkPImqk1?=
 =?us-ascii?Q?7ezm4LRolaJNpJkE6nLpjKekHAoVAE/AMMTmvi69yOhztH3pEyuF2ARGyIsl?=
 =?us-ascii?Q?WzEw0/3anP6pl6TYjSYNjEghnDfUI4n5ns6MciB3TK2x+L2fg23g/ZPYvquv?=
 =?us-ascii?Q?roMlmNKu1NWxNbqSVaYF7RS1QW/dKf1PgNAUCQm6X5jIW0CriXvVkrTZ8zzB?=
 =?us-ascii?Q?Apnd/Ub3mikHBQ3tS2LAAZTOwqlkpvlpVpBmZ8L4FROjJsWw8nw+5YfAf4m7?=
 =?us-ascii?Q?XcdCQkrscM4gZQpOvX+FpTEI8YkqdOR9SX9B7QfQY09+CN316Ir8X4DsTJg0?=
 =?us-ascii?Q?8fePzSWig8ixwM2CtEh0EhFw4VLSoQ2E+MeVnPL4BsYi6fte8ybkcZf/y82J?=
 =?us-ascii?Q?OWbPeW09cd4YvCPAg0osPqpA0bIi/dqQNoWhbZ+cJKRtXcuy67wY+eSjqJ/h?=
 =?us-ascii?Q?QrCfLyGOAGQkp4LfScdnx5fmR/dt2F/dhsyjZeltTvdQb9Ho2hy5gzah9NgN?=
 =?us-ascii?Q?tXrQLM0xWt9NRyyA5pczxMkJ9aEX2d040k4cBJQfkqr7hcZwYUscpIWVwcW2?=
 =?us-ascii?Q?zROt3UQcDtuITl0uyjmKEqIxu3iNL1dm9ktWdtlTD7XrZxEx5PG/99xCQNpo?=
 =?us-ascii?Q?25mGnqgYkyVnCThMvz3r0eAKQZIysK+TvoX57rKywN+xf9WWPEvXALgZH/aY?=
 =?us-ascii?Q?RUzdwK/Z4o6UsS0Rhb6kW59eXQ3ZzIgLvihn5ZU185DzU2WdTBkafMqfKZ7q?=
 =?us-ascii?Q?E66cfpUedG9pwnZCleDrA+fi17O9wo6d7XDee2Oem1EvZiOs11GVBbmg9lw6?=
 =?us-ascii?Q?I7VBhTyATT53LJsKE4tvZRs4lbH+1uFuAXJm4Yg3DHY++Q3010DHl4iERqOX?=
 =?us-ascii?Q?X5O85J1yaiFHKcShIFUFvo//K/i01nc9SK8vnBZf/1oobPxHGLMM7W38YHDv?=
 =?us-ascii?Q?61HSZQaTzpVRKqowYDcjL2VsmkdMj5JRPB++MwY+96CVptF+taURlSoiScs4?=
 =?us-ascii?Q?0XzERDi3tTx7E2ovrqc6/3v8GkFjev5HeGaJdMhb08ALVwBIEkz3KPBepmlW?=
 =?us-ascii?Q?R9NyWpOC54jN3t1DHQk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c368b13-422f-4a80-3cea-08dbef3da574
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 11:40:25.0532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lkuK6jfi8LgrroLTzqvt3bUBIc3JRTHp537Ztpc1Hm1wjWtns8Lm1nMu4jYfBXbjsCq4OJ046JV0rUj6f8I38g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7515
Subject: RE: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, November 27, 2023 4:58 PM
>=20
> On Mon, Nov 27, 2023 at 10:19:49AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Friday, November 24, 2023 5:04 PM
> > >
> > > On Fri, Nov 24, 2023 at 06:31:03AM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Friday, November 24, 2023 11:48 AM
> > > > >
> > > > > On Fri, Nov 24, 2023 at 05:40:26AM +0000, Parav Pandit wrote:
> > > > > > > we
> > > > > > > strongly suggest that *drivers* support both old and new
> > > > > > > mechanism, and then *devices* will only implement what's
> required.
> > > > > > There are other examples in the same document that makes
> > > > > > things worst
> > > > > with old and new.
> > > > > >
> > > > > > Also there is literally no way to enforce that driver supports
> > > > > > both and new. It is just sounds like an excuse to force
> > > > > > infinite config space.
> > > > >
> > > > > There is a very simple method though.  We allow devices to
> > > > > expose a subset of features when DMA is not used. So drivers
> > > > > that want maximum features will always opt for DMA. We can also
> > > > > strongly recommend that all drivers support DMA if available.
> > > > Yeah, don't see how this is elegant at all with all mixed bits.
> > >
> > > It's elegant because simple low end devices can cheaply implement
> > > MMIO and not worry about DMA.
> > >
> > It is not of much help in this case because any low end cheap device wh=
ich
> want to support flow filter commands need to have CVQ anyway.
> > And hence reusing the same CVQ is more elegant that already does the DM=
A.
> >
> > So CVQ is fulfilling all the below needs.
> > 1. Single interface for the get/set config flow filters 2. DMA the
> > data 3. Not have any partial issues
>=20
> I don't know what these are.
I mean partial writes for fields.

>=20
> > 4. provides consistent structures that provisioning side will be able
> > to use
>=20
> Problem for provisioning is extra definitions will be needed, in a device=
 specific
> way.
In vdpa tool and other OS tools of iproute2 developed, setting and getting =
those device specific values are useful.
It is ok.

>=20
> > > > Nor do I see any enforcement, single method via cvq still holds str=
ong.
> > >
> > > You don't need to enforce things, if people want to put a lot of RAM
> > > on device and put it in a register let them.
> > >
> > Not enforced. It uses the CVQ for flow group and flow filter life cycle=
s and for
> the sharing this config as well.
> > Also aligns with stats that rest also agreed on.
>=20
> I am talking about your attempt to generally say "no more config fields
> everything must be in CVQ".=20
Config fields for initialization time is fine as the spec allows it today.
Things which can differ, it is ok to use cvq interface.

> I think it's wrong definitiely for non network
> devices must sometimes for network too and generally we need a solution f=
or
> config over DMA. This specific thing - whether it fits in CVQ is a separa=
te
> discussion.
>=20
I explained it before, that 6 out of 19 devices has cvq which are complex e=
nough doing things over cvq.
These are non-network devices already.

If one of those remaining device becomes complex, it is likely it will need=
 a cvq to suffice for the dma interface and it can just do with depth =3D 1=
.

>=20
> > > >
> > > > >
> > > > >
> > > > >
> > > > > > The method proposed here is elegant and clearly promote one
> > > > > > way to do
> > > > > things for driver and device with predictability.
> > > > > >
> > > > >
> > > > > I don't see it as elegant at all. What is elegant is *a single
> > > > > tag* that describes each property of the device. And this single
> > > > > tag should be
> > > good for everything:
> > > > > driver, provisioning, migration. And config space offset serves a=
s such.
> > > > The single tag is the set of structures.
> > >
> > > I have no idea how this will work. If migration format i started
> > > reviewing is anything to go by then there will be a huge elaborate
> > > structure nothing single or simple. By comparison there's already a
> > > proposal how provisioning can work by supplying config space.
> > > it is just a clean model to grasp.
> > >
> > The provisioning model is simple is to supply all the configuration.
> > To draw parallels to some sw side,
> >
> > There is per functionality socket option to set things, instead of one =
giant
> structure.
> > There is per functionality ethtool option/cmd instead of Set ALL/get AL=
L
> enforcement.
>=20
> I'm not sure how much of a parallel one can draw.
> Do not see a lot of similarity.
For lot of configuration they are similar that happens at slow pace.

> Devices commonly use register map. Everyone understands this paradigm.
>=20
For initialization early device setup time, yes.

>=20
> I am not altogether happy with the way you are making migration generate
> duplicate definitions for lots of things we already have definitions for.
> Having a 3rd one for provisioning? Gimme a break.

For migration, we are not duplicating. Some structures are not well defined=
, it has some duplication.
But large part seems be able to utilized pre-defined structs.
And here for flow filter also same structs will be used.

>=20
>=20
> > > > Provisioning access them via owner device.
> > > > Member driver access them via CVQ or 1.2 legacy config space.
> > >


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

