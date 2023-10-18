Return-Path: <virtio-comment-return-7812-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0123ACDB482
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:58:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 367B72CAD4
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:58:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 148CB98689E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:58:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 00E7B986898; Wed, 18 Oct 2023 10:58:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E5C96986899
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 10:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8PBrnpGlfKnRyqitYQeQXrIcUSd5hXq29BLelP5Rsj8NVrEQ54TiozvZEuLix8/BdHNp0zB+VkW7l9cyj+IgdlbTyKBWrIwyt/sh/WTf8n1NcOSOZALWUuoABUyr7rGBy8GYWeITylzLddVOjIG0ELEcTVALECuabD101of2NDHeNliSeuznuR+4+SAtSG4bLraTjkrTX3XirWqUpthx/PErz4O/MmrfU9wnZzfSRe+VfIuiRkHw/iwWun/dFH5eOlPMKMfcapYE7vOtg2kK/t55UUEVhbnHPENNZlYZ/+31YQ8rgzfl+Ns5OkoJ3H25GLN2VR+v+0/ggMVqYrZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MVy1IoioNIpbGFEPm2VOaRfnp/9/YdoBmNlR/ZuR4k=;
 b=ilJfC8+OkRrYCncgeHROKR4MX8pzOyfHLwIp7vVA2mbpsxQvK5ay+SAPznxUl1aPJ+AN7sk7oBX1evywwM9Y0Unat6ma0vkUZIJUYj9NJY5lebg10Z0ie1u2fldJT1DNSvu27FMJHzR38NAYW5qL9j/XGL/tDBz8WGXrCRHbP5b8xqr31JE9X8Xm9D5TUUlUCttUA+W1pbuHr4tHDfZrL9y5bSCDSxDQijcbC+yPo9iyM9NUFNq/DKXz4dnxyQZUx+RgLHvDOBNl7unCfD2MMQJh1oom8aFtt4dvLyRPZ6bzW0R2Aozsjqq+Oi7Tihiw1eXEd6azpPBJjE/RjgGqVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Jason Wang
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIAAFBIAgAABIMCAAA0ogIAAATAg
Date: Wed, 18 Oct 2023 10:57:59 +0000
Message-ID:
 <PH0PR12MB54812EA31932B585DF010304DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com>
 <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018062951-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231018062951-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|LV3PR12MB9265:EE_
x-ms-office365-filtering-correlation-id: 73826c2d-ff34-41b9-9447-08dbcfc917a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 yKLg0n257q/Dn0mVMD9cxp1Z7YbUdsQ2vezhJ+3pXU4eYEDBuk2dWm3V7TcjizBcuUFhtzvrB1M0GczBmUIP5YRsKw81IrELLOpEj7Fehjzrf0+xCi1IJn4B15YrFL7BUBdeYQZph2smM/1cAPauNthnxfjge6/TLf+N+z4NdNk1mdKxgBjkZk49O0esURixvaJSiJJ4r2bvEOCgHcuMibWuZzWsad6b75DniMkNFd9s2xU/vklY/2umSm1lupyvGV8IUwRo2UUE0PcjyCFCCJnC1ijndIS8W4FHmBmuIWlfiXyt5hMVITHy3B6dL6efYALrhM5F01XWmx4LAzuw9Es07HfhDq46b6B4234ymQmXQoBv8gpyYX2Eoh1SQGvIhOl7jnZB4sgZJ3pzdXZCbslJeenZ0L8//Gj7/ckc8B1TAEvlA+77yHE9lGgLzWnOaO7eA7H/G4KpASB1kDrgXvqG7zWQginB847Pne0dWjYDP/qPLClXcaT9KPZQuChW66ISkky7i4sWvmwxLVF3hF5wZy2gZB1bbjSIW27eTpCBjlCTA3HRxzDnkSkgXR/1FRDyI4APENnrZ6NbH7sYct19zOF5o21qeFxj3hf+Fhs5vwE0FY1bYA+lwGI0D04q
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(38100700002)(86362001)(2906002)(55016003)(5660300002)(26005)(33656002)(52536014)(4326008)(41300700001)(107886003)(8676002)(8936002)(9686003)(83380400001)(478600001)(316002)(6916009)(71200400001)(122000001)(6506007)(7696005)(54906003)(66446008)(66476007)(66946007)(66556008)(64756008)(76116006)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eud6zMzM+dfrROvRce04+057PJ7cnmTaivPkWm2OSptS/ZWAhtdaKCnTl79O?=
 =?us-ascii?Q?7ttioCYifckh5sRBSMvVpbstfr2jMzqPLyYfgQcMDDWO3cVEWFHmqcrhYNYg?=
 =?us-ascii?Q?xi1xDDxoErrd3M5gBKaLM8XlD/7yWaQ2/BJA7PYxEBu9XruRsfhQjtSRsi0m?=
 =?us-ascii?Q?EyXR8gG08/K/dKhPND2UfTmWCDF3ay+0WPo8RwzhZFgU3gC6hvZznKifR8w3?=
 =?us-ascii?Q?aCG04OBiUyoWih8srvWOIO3zQAFA16aUmwY1acJDyuB7youbBoXUaTJyu9tf?=
 =?us-ascii?Q?2L3lBQomBOTaBb4qoZaTQxMuiYvX6bpaMvh/WopqZE+77jiFdk3hskiGvX9m?=
 =?us-ascii?Q?XE2NqDl6eYxZ+yLC5MRpXP3cDZKai22ao4JcpnCqZ9A3TpBOSMAJaecb/mJc?=
 =?us-ascii?Q?SVqqyTyCachcAvoOziG6AL+qfvg4Z28UZbwkn7PrwkauqZBdu0TeFgCIbwyI?=
 =?us-ascii?Q?8OVf5FPfOdPcASXfMcPRu8faPewJWzW+92tp+++krkmY8sxAKjjEuawQj6ZQ?=
 =?us-ascii?Q?WQ76HX0i7ph2/H9B08H8NrKLPPMf+MZEjy8S8TybYIwpUX9piQTS4QRZq4NL?=
 =?us-ascii?Q?op/bCEYIv6IEIxVVeGjTfqBv+iJozeQ0bBwArmF/YlnnhV/mTQijjdUWalOE?=
 =?us-ascii?Q?nWX9UlOUzLMTGRNN9wlKtU2aFY4Yk9JHesgt6/ebY5/zcyIP+YtWt1hHwTUk?=
 =?us-ascii?Q?O7eqUIaz2sv0t83IBALhSTSshzmabsLn7Lj+m5RyZ780TkHk9WKPBA93hmin?=
 =?us-ascii?Q?g/IlLUASc9aMpe7tLBZfWDKinn+hY1b47jsDSxlCK701M/RWg8aA/+MXSG/t?=
 =?us-ascii?Q?1PBofbHLt+HHHBfS8qiNFRf8dB64dffA77zDLAvrukKp6KBMI1d6x5Dm3Fb0?=
 =?us-ascii?Q?6/0kt1nneFQCqoYWxbdjnTicfkuSrD9PT2HZ78ehgYQIf7xDPdxsDNYt5BN4?=
 =?us-ascii?Q?B7p+bO5CDJqDQ25Bw3hpPMC0WUoqiba8VvtVcc287JkJKyWnzpZoVIg/Z/bg?=
 =?us-ascii?Q?V/eQ2GSU5Eyq5nfMJW+hCK6fq6hIA+/a2KM+ytp7eHQYDltQZxvvLsISnYDa?=
 =?us-ascii?Q?DG5rdfxNKloJKfbuvJCiSR0zoFexutuLuKVQdK592R+1ebayFJiuBpZYD2Ls?=
 =?us-ascii?Q?1J4gTcx3YJ5lt8uKQabAjUI7WqFlnFImTL4gtuDFyAA91VOoS7bsKMlXN7mw?=
 =?us-ascii?Q?SAkf1asX+NtBk1PnHlGj50G+kSW/xHWA5vsXukbar1I3j8ifIQJmAqmwbtav?=
 =?us-ascii?Q?LKkzVCrU1sYj+ds9yxKcMDMPS46m/7PeWHQPESDcqUHtbphQMCJ3U2OsmkE+?=
 =?us-ascii?Q?P3dpN/0mKXUSd26EhVyJZHI2Ksm41w39x2wJXPwsS1Y4TJJx7gDqqhPYyzfH?=
 =?us-ascii?Q?N6Sn0RbbtIthCZqgm4rv2GdtxfrVDM0k31ylOHlAscGbTR5wdD8YKmeKfMq3?=
 =?us-ascii?Q?cfnXfLxwhE7Hol4r3pF2KU7gVRCdtJfWws4l7ZmEJJDBm6tEcpI2LX/Mt/OE?=
 =?us-ascii?Q?V34HRN8muccoH3AmLtYqXsBT+SiwUlDcX5tEAcfS3j8D/PAbvBx9bMPqK8Kh?=
 =?us-ascii?Q?aO/sMVX5pRruAbk0/zg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73826c2d-ff34-41b9-9447-08dbcfc917a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 10:57:59.4530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uYU0X4X63COD8rTMqVO5ypfAAC886tyCietnrhGmoupaS/Wc3KuZHzKxKD0m9n9xE0pPJCOoNTlnM7bC2PmyPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration


> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Michael S. Tsirkin
> Sent: Wednesday, October 18, 2023 4:17 PM
>=20
> On Wed, Oct 18, 2023 at 10:22:57AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, October 18, 2023 3:26 PM
> >
> > > For completeness, and to shorten the thread, can you please list
> > > known issues/use cases that are addressed by the status bit
> > > interface and how you plan for them to be addressed?
> >
> > I will avoid listing known issues for a moment for status bit in this e=
mail.
> >
> > Status bit interface helps in following good ways.
> > 1. suspend/resume the device fully by the guest by negotiating the new
> feature.
> > This can be useful in the guest-controlled PM flows of suspend/resume.
> > I still think for this, only feature bit is necessary, and device_statu=
s
> modification is not needed.
> > D0->D3 and D3->D0 transition of the pci can suspend and resume the devi=
ce
> which can preserve the last device_status value before entering D3.
> > (Like preserving all rest of the fields of common and other device conf=
ig).
> > This is orthogonal and needed regardless of device migration.
> >
> > 2. If one does not want to passthrough a member device, but build a
> > mediation-based device on top of existing virtio device, It can be usef=
ul with
> mediating software.
> > Here the mediating software has ample duplicated knowledge of what the
> member device already has.
> > This can fulfil the nested requirement differently provided a platform =
support
> it.
> > (PASID limitation will be practical blocker here).
> >
> > How to I plan to address above two?
> > a. #1 to be addressed by having the _F_PM bit, when the bit is negotiat=
ed PCI
> PM drives the state.
> > This will work orthogonal to VMM side migration and will co-exist with =
VMM
> based device migration.
>=20
> OK that sounds kind of reasonable. Lingshan, Jason are you interested in
> suspend/resume? Want to start a thread on best way to support that?
>
There is already a thread from AMD on it who was insisting on changing the =
behavior of reset under suspend.
Just a feature bit would be sufficient without any weird breakage of reset.
But I would let Jason/Lingshan to comment if I missed something.
=20
> > b. nested use case:
> > L0 VMM maps a VF to L1 guest as PF with emulated SR-IOV capability.
> > L1 guest to enable SR-IOV and mapping the VF to L2 guest.
> > Consulting industry ecosystem to support nested outside of virtio.

> As an alternative, I suggest a new admin command pci capability with basi=
cally a
> PA and a valid bit. Easy to emulate and add to a VF. And maybe some way t=
o
> suggest a safe place for it that won't conflict with anything? Still tryi=
ng to figure
> out if we should add PASID in there, or what. Maybe optionally?
> If actual hardware does it we'd be burning up 20 bits, but for a software
> implementation it's free.
Above scheme is as second solution for non-passthrough that utilizes the ad=
min commands of this series.
Did I understand you right?

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

