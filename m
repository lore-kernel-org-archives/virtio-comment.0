Return-Path: <virtio-comment-return-8435-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23413C072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:10:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 86F0C3E56B
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:10:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A570986E26
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:10:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5C14F986E1A; Fri, 17 Nov 2023 10:10:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4D500986E1B
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 10:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPTUs9ofrxRYuDjAe2eEe07MTHhRsIpjoVFymfWMr+1CJLXaHYmIMd91PvbFPP8JDncIZx9vzsj1duiURncX1nE/NGjWkea0Pe4g+n3/ef/Wd64Vt4qmqwR5zsc0re2l6mzcnJZifOOHycVaObGwOAV4V+/dtiTakdGNpQDnoemIffTZl52xhwxgCK5PeljrKRR+xKZNKDbTxBtKQG1S67ClIp9FsFlSCPSuPUrpAtR2bZaKS4OyojJJjCldImhw4PWjk32VUUD4Gu9Gbnpg8rG0p3zGTSnmGJMa8Xm1MpzLpKhvrBH30bZX+TB20ofboqlsgW9FyPcLxn1oqU5CnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5hzVCy4X4k50LZvAIqBaRWsmTqvRhLSuSfa6nkYl8o=;
 b=mH4aiMJBLMvFOWAQulIk2W9wDeu/+6zHhESvoqSpsn/17O8fDCy3I3jf6Obw0wqHgoPptnNzKfuCwK38xQdrmGObEG0httOXnPQpAkpk7vFvniTeq2VEPlAnvwam5EysOHA5l+tO9TeoBV59EIm/JG3sJ33wqf2eY65QXDtXNTJ6m27DQnVjnDpSEgi5Nwn7VvPPNIRViingkJ5y+dFI5fSKZpNk00Rtu3o7KS2P50y2Z5TZkUNrJAxWiHHl9YJq/6n9x56NtfBgksnJ2sCxwaGkZJL6A3rYZEHjvPZeGe+JnQIJg/S+Ba1dk5B0Lv5bOk9S+jjFSLI71A/deZ9ecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YIAADsiAgACQwGCAAGEbgIAAB4aggAAG2gCAAABcQIAAA3mAgAAA3QCAAAI2gIAAATnQ
Date: Fri, 17 Nov 2023 10:10:12 +0000
Message-ID:
 <PH0PR12MB54812F38986C50BC3252C680DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117044428-mutt-send-email-mst@kernel.org>
 <8e85fb6a-2a45-46fe-b9e2-3c29a1718068@intel.com>
 <20231117045627-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117045627-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB8029:EE_
x-ms-office365-filtering-correlation-id: 89c90341-ca51-42b4-76ac-08dbe7556367
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ET/PuZiuy068lEGg077r8ZR+lOsMCRCy+QK4e+ecwSz+wAN/O6CaZ7/pvmFXoLkqx2Ywjbbx8QPaCA8ZsVAhXphicVrGsN/8iDOfy2ucgXnEyx37dHy8AeafJ736d6+n2L2aL93vcirfj9YALchb5IkXGaOqSkBve8j+LoXMbwiRJuVysIsUg20A96q/SaHL7f9WrCsKMdJAIxRbLxUDqk1kD300DBwpEki2atbV2PIlJr8oQGrtjHg06tDMa8juu1W0ZjFcrAA9v1hjHhrPRcwdvd/xFdId11fbszR8BL0uF1A7gBXDfIH7ytn91Tf+GPLlreoe7wRH+nwvnXhjgekB9UzheyXgGfuZ9BsxShoxQq9i/uccBHYkBvgk3lEvnMwQGOnH0OUo6cCZaCi4oilbNF0rCVn0hKP1WJuerF2CwgRBzgqtiyI1RjQAan8OSVYNH0iBFyGenxz53Lniqw8u/ZpicHUAFeeACmGQ7i3fBUDNntVC2Q/XhlOgF2xDad2djjJoM0sKM64QYiq08fiIftZb/mVLMO0uZCugOJ8lmBHGHiKZ43ZqjMabC6VDH6TXZ9C/fxLxPgGqfgJkiI7/n6dGCZEvEEtmxOfMs5B9uF7/WQfOQCheADb6uB5y
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(136003)(396003)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(66556008)(54906003)(26005)(6506007)(7696005)(55236004)(9686003)(53546011)(71200400001)(83380400001)(8676002)(52536014)(5660300002)(41300700001)(8936002)(107886003)(2906002)(478600001)(110136005)(316002)(66946007)(66446008)(66476007)(38100700002)(76116006)(86362001)(122000001)(33656002)(64756008)(38070700009)(55016003)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jgxogxXbV5oM5FcbjTyFgmlpx60UDn3TTAag/JiFcs4XjO3q3QmKOi+ZiwP3?=
 =?us-ascii?Q?UywrrEjHzKt6xy/nt3+0d8QzbSq18Zmm11+rQSK3ssTnwu+OG0LfD8a7kTwm?=
 =?us-ascii?Q?u2PB4IiLP4WCo9BRuYyWN8CN1uQR5EF9M6dLmHNc5h91hghQhOWUTU6jvgmc?=
 =?us-ascii?Q?vWVnLQU1yVfsepm3Ybpq4DZ5DI0bw4EcOJDcKAC0+f5kxRrF2FjkCbJdvsdo?=
 =?us-ascii?Q?3NyW2Z2e8tDr/jBOJZSpKBiNmnFqGnIrxGCnbD+sWQNNeoFXVcf+ttGR7t0s?=
 =?us-ascii?Q?ZTyjHbpEDjyRNkp1VSP4I41t07luXIuxgxzZlNfls427akCGNzp7J1TxqT0n?=
 =?us-ascii?Q?v9611e2JFtwU6sbRw/yaT2iD9kPa2Sn7pT3wQPvfxoBBqeTpzjrNmtAYNUjC?=
 =?us-ascii?Q?bES1QxIreykNjHp+/MTxF/k8GseVsE1ISSAjYSBm6RbY9TciD31b1UeygZuc?=
 =?us-ascii?Q?yI0UVTPI8B2ZbznemWM80CBsLYvylSMXXihIPb2wTMkxh/eatoSX6TKsKhJx?=
 =?us-ascii?Q?GHwGDMNBpVO7ACrlO5hY1+nXyEfbMP4FdpOtGBK9rfYSVzwaVFRTn/DE0LLo?=
 =?us-ascii?Q?BgACeqJ0jGyvo6ZLfR4k3lrIMy+3azPe/BU2gsoUoE/zTT54ECdd1h6d/FQy?=
 =?us-ascii?Q?dun4w7vVNBHIuOE8YFfNehf/ez5VSAunvFV7A2HMrkg2kNJYE7NksvUWONs1?=
 =?us-ascii?Q?41P9bw/XNLGBfKEYY77d0I+CwXFgqhDA4GZLD5RdkdbRqB2TYP8XBJB/pPRg?=
 =?us-ascii?Q?skG/xc7bk7xhixMKCo0Ka9TvJzKiABzD85BICwTQMdE/og/Xrwr7Z8Uie8n4?=
 =?us-ascii?Q?bUoviSSy/wmcbICTFu9v0/fIuJPNoKM6Y6KKE2xDIs49zDXu8vH/IAYPsBqc?=
 =?us-ascii?Q?HRO58XjI6pqlNYpjWn5J7bCuMRYj6+68q+FvD0uTL1LEHNrWFFPyW4BdeeGs?=
 =?us-ascii?Q?NbUVoO7S+9TQFh2RHZu0SvWP1tFEgnYNvxBV1qEoRN5frgRf0kZSr/mjk8Bo?=
 =?us-ascii?Q?CF39atFw08w8VXwArZRJ8smhXtHnFBQEdnax5AQwqC/rzqnTZtS7G0Npkxqi?=
 =?us-ascii?Q?Vhxmv55obf5ormcFYoX8ajvdurcel6FzlLARvn6xE0z8q0iBcnM8DF43ZEoR?=
 =?us-ascii?Q?AHTxjbH8fdK5XehZ4tDNB1ieou5Y3XWpyBChLZBWy3aQka4I2zugls/oZcmP?=
 =?us-ascii?Q?7PMzKJYx8iJKv/pYgOsuzHcHrSUigUkRTCAC+robOYdAIiRsnQ9wBKAGGv50?=
 =?us-ascii?Q?gx7a1Ls8b5CCWgu6ORLENB8tOIo3IbI7yG6nHtYTKSEyV3ui6PhhKN6U1RuM?=
 =?us-ascii?Q?3s63q2DDf7G7B/PC43kH2qsQnOQNX/kCOApbFi2Y/PBK7J6KRkpS8YfHt3N8?=
 =?us-ascii?Q?KBacy+VIzFtzae6SX2v4SV++jd+ka2dNH0rEtY0Grhptpujbj7baROPtAg2+?=
 =?us-ascii?Q?2tRxY7qq3KP3rJKvnHRr8ant0OLVp6ZSzSPxBoJ2KMnWpzm9fBPSRD8DAqbm?=
 =?us-ascii?Q?tM+dzJgdadBhNoC+INIIgJxrkYoLwUlg7dYAI9svuOZHj/2EWDICaVOLMhQS?=
 =?us-ascii?Q?7i+arUFrzjrilFNP/z4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c90341-ca51-42b4-76ac-08dbe7556367
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 10:10:12.8442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9S3el3J+DmuRWpB80eN1Q9kT6JRYiH0794DVcYJtfWjvD1w7iCYmcs0GndIhbovJzkNjBIuAAgViDdMcDVpeGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8029
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands



> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Michael S. Tsirkin
> Sent: Friday, November 17, 2023 3:32 PM
>=20
> On Fri, Nov 17, 2023 at 05:54:32PM +0800, Zhu, Lingshan wrote:
> >
> >
> > On 11/17/2023 5:51 PM, Michael S. Tsirkin wrote:
> > > On Fri, Nov 17, 2023 at 09:41:40AM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Friday, November 17, 2023 3:08 PM
> > > > >
> > > > > On Fri, Nov 17, 2023 at 09:14:21AM +0000, Parav Pandit wrote:
> > > > > >
> > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > Sent: Friday, November 17, 2023 2:16 PM In any case you can
> > > > > > > safely assume that many users will have migration that takes
> > > > > > > seconds and minutes.
> > > > > > Strange, but ok. I don't see any problem with current method.
> > > > > > 8MB is used for very large VM of 1TB takes minutes. Should be f=
ine.
> > > > > The problem is simple: vendors selling devices have no idea how
> > > > > large the VM will be. So you have to over-provision for the max V=
M size.
> > > > > If there was a way to instead allocate that in host memory, that
> > > > > would improve on this.
> > > > Not sure what to over provision for max VM size.
> > > > Vendor does not know how many vcpus will be needed. It is no differ=
ent
> problem.
> > > >
> > > > When the VM migration is started, the individual tracking range is =
supplied
> by the hypervisor to device.
> > > > Device allocates necessary memory on this instruction.
> > > >
> > > > When the VM with certain size is provisioned, the member device can=
 be
> provisioned for the VM size.
> > > > And if it cannot be provisioned, possibly this may not the right me=
mber
> device to use at that point in time.
> > > For someone who keeps arguing against adding single bit registers
> > > "because it does not scale" you seem very nonchalant about adding
> > > 8Mbytes.
> > >
> > > I thought we have a nicely contained and orthogonal feature, so if
> > > it's optional it's not a problem.
> > >
> > > But with such costs and corner cases what exactly is the motivation
> > > for the feature here?  Do you have a PoC showing how this works
> > > better than e.g. shadow VQ?
> > >
> > > Maybe IOMMU based and shadow VQ based tracking are the way to go
> > > initially, and if there's a problem then we should add this later,
> > > on top.
> > I agree.
>=20
> However, the patchset is ordered sensibly, first the device state recordi=
ng and
> then write tracking. So we can merge patches 1-5 and defer
> 6-8 if we want to.
>=20
> Parav I suggest maybe split write tracking to a separate patchset just be=
cause it
> seems so contentious.
>=20
> I notice there have not been comments on 1-5 yet, I am not sure why I sta=
rted
> with patch 6 - I guess I was curious what it does.
> I'll focus review on 1-5 next week.

Ok. sounds good.=20

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

