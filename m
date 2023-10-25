Return-Path: <virtio-comment-return-7952-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ABBC0032E
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 09:50:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C06CE2B061
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 09:50:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9F7649869EA
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 09:50:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8BF149869E2; Wed, 25 Oct 2023 09:50:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6712D9869E3
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Oct 2023 09:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJ1SKazABRAi66x5cfEPKAlPO0kR0cSwV8AB0w5YSaAQuYUQ7eGo0IoYHIoq/4vnknXBLkN7t38Yy9hI4jj9VnXvxHBmjE259bWmGvX3W5eeewMTFg78t+rA2kWYk4ELejO4OrdG6+yAqiLvc4SvzMI9eWlYfrS4do+/ttVAVrmaJl0CAMQeRFFS6/XOAjAOT0HBUQfAIYNQc1BKY4mzVVLEKk/cStd3erKipKC9vZBKu0TBIkd8dvuh/LxecAjZ2HUf/1nCtPXTH+4t1fm9OQtidGADVMut5tBzgOaTRcisZ3zfPF0k8GHfhFjgXsv0Y0fK2IDHREpyYHzne1rX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jg58uDMeaCi2h1cDTHZAZ6nFExJ8E0TstlxVmHS8jF8=;
 b=TrJoFaT7jTe1matIPxdD5MVGMLgsQXG0YkPuf2l4D6mLx+vsUmkcqoKKmfb6bUcnvcKApF04obAslInRXMVEBrmzy278nn+hI1GjuVxc86tG/86ZjBtq3ziwH63s8IYXHVnD3SprG7z7Vh64JAkCkEzuySJxRibLQUh5yfqg9sMqPKT5/0d7qF2oOUg2JIxkejrIrQpukd6kG5TidmEDSM9Ohh8YREEeAZXAHpXSSR9w0ZgxSee4gnC5CrV/uPn2Ds/6TK9cMBRBc8EYajTlKDXtqSSX7F78Cz2tvZUmsFX1Y0DdFZFLDJjmYXq557EWue0vnHAI4ETl+9o16Jku1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIAAFBIAgAABIMCAB3K1AIAADNZggAGZtoCAAFHP0IABBk6AgABdlBCAABa1gIAAEtKg
Date: Wed, 25 Oct 2023 09:50:02 +0000
Message-ID:
 <PH0PR12MB5481B91F71A81D1B57401968DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
 <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com>
 <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3nC8G3Xo2EaunQ4k4rnB27UQMUvruXaf81_sZF7w-cQ@mail.gmail.com>
 <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025041653-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231025041653-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB8902:EE_
x-ms-office365-filtering-correlation-id: 444d2f03-1706-49a5-8723-08dbd53fc296
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pgzpB4jet1pRvJWNC5RAGUq32vHkuj7gAj1Blar0coKHlunKgQL/tdGOC4yHEKIYDgBZmb2Tdga0aygAEp62tF+bPHBuMWPsnYvSFK54t5vguBdXG5yq/zNhqtKbUKYFcEjoDOFlBWSrSdxcVauDCShQ2VWVEixgwgkL3LWELJeHt4HZObivg3oy8kTGLRHM3ZWse4OwS4Cg5SJGFBU4a6pBTMx642G/5KGPCs/+i8sQAIxnjY3cYXwt/A6GwkkBVZQILruJGSCtHa38k91v4pchn5hIe9EyS6ZVtGKqQWl9CXRQY6YWm2ZBBhEvAcfK2Hmr2AS4XgtKi5wUr6tcy0smpIc3crdNQ5AYdWIdzQhzRWyouvSJqUNQIVV9TLDdQYuJnrSIqErdUByNjqVd4EgzGBxWZo3HG/e7jk3Ul38YlCV2oJBn11o5RPsAK1iGMvl+axqTiYv2K0LZ7rjUfV7FKbyoy+Itk82mM0RfoKJ2mG1cOC31m4lNiWDoUWAP/MhcbdOGctrJJ3OJQ8NDVlduJ7RvbrgJBA+pFvhOowBjv6kAPl+2Z4mG4K9U55BXnc94MlYjfyvYxkeV3dHJhgt9znvXdUGhV/YrZJXXq4Z4hplqc29cpQg9rKSZ7MVF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(38070700009)(26005)(66899024)(41300700001)(38100700002)(2906002)(6506007)(107886003)(55016003)(52536014)(5660300002)(4326008)(86362001)(8676002)(8936002)(33656002)(478600001)(6916009)(66556008)(71200400001)(122000001)(64756008)(316002)(66446008)(76116006)(54906003)(66946007)(66476007)(83380400001)(9686003)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?r1ABNfAxtrenBVpBAuPk8PiA0RG6ybqaMb9LsdVCmGHwbY0OZEtBosgXgOVy?=
 =?us-ascii?Q?PH5U4gn66EiQdUtYGWqXNCZS7HiI5TxDDG74bpO0+K0S3Th3a6f4OTfUeqy1?=
 =?us-ascii?Q?bDCs13TRvMZsBAeVLpdNBdGMWd1buE9/riJqGznkvfkpJwaX4cMOcfNC3U3H?=
 =?us-ascii?Q?VvM4w7WrdQ7NMXGf/sj90a/uKEV8NhafFLwMqO+7bkoq1ciz4jPz7fzBI8+9?=
 =?us-ascii?Q?1+LkJqEfImFS9Rd0dG30w1Zxr4FQaaE9sFuN/34G6oBv4MTPq5svkUN8b26+?=
 =?us-ascii?Q?MhXzHQlslNRG8EpngCd2Y5/DwBvSEiStRVmCzm3DGgg0msm09rHhf4x70WQj?=
 =?us-ascii?Q?vlLk5H7QrWFwjEpgc79+oFsyQ39V3yIoY79BSU4tDWOHi+fD48sRHtKbAN1y?=
 =?us-ascii?Q?2i41+EFvJImMa2gSgL+s0Fl/i/jRZnd09OhCGhbd4wnOiwUcG60i/gNhw6Ei?=
 =?us-ascii?Q?kW/jWeGkDgCqaBEaa03QPQganLCxrtYgt7J398BMtcwHXIKWNSBLXh6J9qjV?=
 =?us-ascii?Q?9J9O28d68FXuEAUAncs8ySWV8ZS7j+Px/j5Dtt+yxcmnOhx9tu2mgyhz8Jvp?=
 =?us-ascii?Q?YwpawGIRKLZL2QPyhaLlQ6SgtlHQEOcW79TQ001g2usraIJkVGxxlcGgx7ns?=
 =?us-ascii?Q?LfXigwLaJeR0gmWqvlD35UsPxbSmgIWw5FqiN7nxZaQ1SdprNhEcPDHJG74h?=
 =?us-ascii?Q?TTFaNvPCSl2RpMJAjsoyhMPvMGbh3cpwWPdUOyppe2wQX1vhyhoxcv/6VBFa?=
 =?us-ascii?Q?5KNaZS1Cc2SXXPuxHKS223xNPssyAVmb/kNS+Y8+Hz2gEIzH8JhjLPvW+UGY?=
 =?us-ascii?Q?jcB+dX+ElVnxvq5/5vi3QLJjtKYTvNTtOazRztKp5S+mO5XpLsYg0YyGJAXS?=
 =?us-ascii?Q?0UZPbsRIYFmG+v6lKcxdvd0OCoRb5TzTChjjeqoywvWso8HOPwm4ybuAcw3S?=
 =?us-ascii?Q?RKSULFR7JF9KaDondTtTeLw2H91kiECS+HgeJx2I7EI3umRejWjsNAqjstX1?=
 =?us-ascii?Q?GEwXyokUCe3PCT9aBJyYCUYlgcLLcR+26+UzCJB8O0mZhI1n+HElTCz3kOnj?=
 =?us-ascii?Q?FRtuLTUdvTlNeEbD+7FOZhr/mRPKR+LMgJz91/F2zDTgJkvFEK1TEhVacV2D?=
 =?us-ascii?Q?vRxpODiE6jbFH7iXQocmG5gSLMcJfe+lPsJknPQuzdwimtaK8xct1zvNvs5L?=
 =?us-ascii?Q?1hpW0rOy1768OMNTNsXb049uxUnQm0S44sW1sLW3lwhBQFzKoMfwiNTJJSiX?=
 =?us-ascii?Q?J1k7dIsNVTsL8O4GjNDcZEKJcqcIqABOu+JpMKPfCBBrHBW8/QRCekMEF0Ly?=
 =?us-ascii?Q?NbZEWry4/JYVioloGhgM0tYX7EXT960a3ehXPK/dwaPKeY2l5YeEMBfz5Ja1?=
 =?us-ascii?Q?BwRbhs3oVfvIdhQxPg77ZtcM/08rWQTm0fIunGUT6a4UeuAwbvlYyDPnsGD6?=
 =?us-ascii?Q?KcJW2RrbXdhLyN3cLJUNxWHf2cusO7C+SEMBD66g0qeu3xVU6sJJ6AECY0nO?=
 =?us-ascii?Q?DHzmdgmUCKm6ZIj9PQCeBIQlDgK4L1u7yiTfQeOeBu/EGdfDA+UCLpOdFPhp?=
 =?us-ascii?Q?Lp8bUHLSRwB46FWZF1U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 444d2f03-1706-49a5-8723-08dbd53fc296
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 09:50:02.7257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n6DaSCh38h9NZyBPeOg8mIEfuYaMsIuwK2c2Ygddxe5kKlNfBtq8v4wWJjcLKapmvQEcxgT0NUrvqFimymbPwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8902
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, October 25, 2023 1:55 PM
>=20
> On Wed, Oct 25, 2023 at 07:15:24AM +0000, Parav Pandit wrote:
> > Treating all registers equally and synchronizing it in the device is be=
tter model
> to not bifurcate the device.
>=20
> Glad you like it, though I don't think many hypervisors treat all registe=
rs equally.
> Personally I think where does the ideal balance pass depends on specific
> hardware and software. And it is not wise to tie ourselves to specific ne=
eds du
> jour.
>=20
> So can we please stop arguing about which model is better on this list an=
d
> instead focus on building reusable components that different devices can =
use as
> they see fit?

Sure.=20
There is nothing special done in hypervisor for passthrough member device f=
or virtio command and device specific area.
Going forward for passthrough, nothing special to be done for virtio common=
+dev specific registers by design.
So, nothing special to be build for it anyway here on the member device.
Hence, I will not debate it again unless it is questioned again.

Other models can anyway do anything suitable with these registers.
Hence, I believe device context as defined now is still reusable as common =
building block.
For non-passthrough, such hypervisor can simply ignore the fields which it =
is not interested in.

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

