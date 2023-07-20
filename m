Return-Path: <virtio-comment-return-6871-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2368AC001B0
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:28:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7ABC52AC9D
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:28:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A44D98680B
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:28:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5B9A79867FC; Thu, 20 Jul 2023 02:28:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 491AC9867FD;
	Thu, 20 Jul 2023 02:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPrq2Op3DiHNTGtdrCD3jIIRE9mC9ogvpK+x3R5+J4/VVVMZf+reVy2KQWTOgO6/AusBg5+IVAkzV7l9LGQzKA8jCNYWaT7nNDNDr/Gs+k7GKgkHIQZvNq56BrWTRNKZTpIltOGAV1d0oCgd+1zLQ3tP9bENnzgdOeOYaC/7/LUpXKdsRG4AZ1yrGkxUJA/4aq1OroFhm6PCiWotCxUa92+eO8/iGIPiaRFAUdxku78d87DxH9m6EqjqW9yOSawWUwL10JuBg0m3XWRbvAmmsa+KrysXZg1xncyevXrjl1/xnBJkVBsEQJiwHmZVps7M/KcnI/TQsVoh+tmErem+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAn2cStDzqt85J9c/QPVJ7brIkZlM2gZfI6lELre0uM=;
 b=dhVZQ7G4EU42dWmNUaf3qlqLvOa1Vev31SmT+ceAZtnS1/49DTXlMrTMplM+xDjCb5OuiggkyiOC7dmbrvvS9IDUVqvILI4GMhk178aNmeH3qthVQwLu82kkpECtBOafCqgS7Ad+TRnJRRg4ONg8068LseYGOa/8UpDe4AMoZbiABLXQ8mbk1ZvX57PCZLFi4EOnPoxXqRLdJ+CZjwwV7fArYF8zrWHggKIW44JR02FSd75hGVmyP8OtZOdl7CV1DeLx6KCd9Hpy49AEh3xIiIrODfhtuiv513HxmnZuDVbJPjQ5DdsuDegI9qYGugXHN1lboG5B2SISN+WhYz15Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH REQUIREMENTS v2 0/7] virtio net new
 features requirements
Thread-Index: AQHZrT8iRH9SZMOg7keAxKrXTEW3uK/CBxqAgAAA45A=
Date: Thu, 20 Jul 2023 02:28:26 +0000
Message-ID:
 <PH0PR12MB54813F5714937C95A208CF13DC3EA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230702234410.47546-1-parav@nvidia.com>
 <1689819649.59188-3-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1689819649.59188-3-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH2PR12MB4120:EE_
x-ms-office365-filtering-correlation-id: fda160b6-3c14-4c6d-0146-08db88c8ff4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 v0hxM17w+d9i8WYzAAP4ndiS8qAlgDBjD52JHw9FtRrDlValCKVSjAZS0DfOX6UkInSQ7miwhd06I6McPazVaOhlz5jYW8j7g7zBc7A5JK4XFkFfhKm2vK6WgoGPb/bpLBxcornJyXEusUI0Ar+bY6VlbxdFWUfRvpTwzOavoPbG4YYf7xypaTshoXugeCFBmGz8fz1Y7aDRdnhyfKebDochN/XTmri9K1F69ob1yJ206Z0E0bldrkjjYtGFrR3EJi32UPbQwwCOLrlqYOcuaQ1DDNrARTQQfbqE39EE2nQKj/QAbOtTddiCMFQXmET5jgMNksLJGwC79P4S30LVYCGdhfo+BoRRBCAz+WICHjq8Z+q2fOJZ+HH7XAAOl1GxKixManqXfhTqIo80S2kxje4XAZA2bSYZWUux6GPZKxkqHdv/S0uJjvmuEcHM4WlOvmLHamtu1Jadp0d3N5RFsSyFrupDNb1At5PlipWGKwNqA7Hifk9+sgXfLS9JD/cHslHyrDixu8JAMMx82ESrOH0F1t7PO7+7cHO85J7I8Kmn2DHLr7uZVfBFZ522x30n2x/j0COrKgrUq6+g1agL84ABk1Z3SgzCBVICutG8YrNVCfrP/p4Vd8drZ/f+6TT+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(41300700001)(6506007)(186003)(26005)(478600001)(4326008)(66446008)(76116006)(66476007)(66556008)(66946007)(64756008)(6916009)(71200400001)(316002)(8676002)(8936002)(5660300002)(9686003)(7696005)(52536014)(54906003)(2906002)(55016003)(38100700002)(38070700005)(122000001)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fjo72OWSQS+mTPAZtVeKfApk+9UyJpSR99QYrKrMPLXdLcFP1m6UOt/wbPZ9?=
 =?us-ascii?Q?d4VKdINdKHHGt5s94oLOXOymbrLOBzlV7oczZV4GJcf3vyTHusUY+fKb2rcs?=
 =?us-ascii?Q?+3PSMH5SWMr9SYMGOHuH/NheIaibNXRQEynH4eLRBYwItgaERjUvOjEbdvJX?=
 =?us-ascii?Q?9MYzddpeBqzvdFZFPDBY4RFbvP8PqQhi7Nju6hd6y7rWct+BUVroxxdWPIUL?=
 =?us-ascii?Q?9AraP4nU6BTF0lfOgyY6yd8qJ0Gpfv1XM0DxJ3zSzzERCssSxAqURMFvlyRP?=
 =?us-ascii?Q?tIBKTYRTNKG37outDMpAkNZEBkzBLs64x7Rx7nuDllb8jZC1u1QC0uP2iBf0?=
 =?us-ascii?Q?dhuTk1ARrrOPSaK1CQhE/OqKb5Tpg7T7Q+ePNxFU1kNkrtj6PFD61gZrzCFC?=
 =?us-ascii?Q?4Xo1eI7HV0VC0ejQvPQ3dNu1ys3Shn7Yvt5nLtzYeGfprca5YSh35o1vLBv2?=
 =?us-ascii?Q?UGXEnoxRjggW7w31yirDKF5dG1Nx/v7GtfMjwPI++HpunCu9P+vVtbAz5+ip?=
 =?us-ascii?Q?jYkQGkhKb2PT31zM9miJJFath0Mnf8EjLP15IFhbTtq10fBMa5a7o5wXYLIe?=
 =?us-ascii?Q?XPUjbVRcObkGrmiaWbNfGPYKSeqYYK4Hz3BvFvSBn5509GYIW38D+PmTbmBr?=
 =?us-ascii?Q?NYBpJgg2SdnBhCsfIeIEVS7lb5kJu9Tgc+2HS/MYW8aWnYnVsIVftyznezRc?=
 =?us-ascii?Q?svuW0Ngb0ANwC9VcisCT3vJx2k/MqM3nnQS/OjHhZaYXSWiO0fPLR1MkJm6Z?=
 =?us-ascii?Q?d4qgzyQ+mHy5s7YrilQWRIx2oFa4jor8BnZXOWjex+UF9kGZyQYDfMgk5m5b?=
 =?us-ascii?Q?QNaIbypwKj1/HP+Ryh89UaACEu/eG7GHv010KjrBoAp/IQkcmRyeNYLW7EjI?=
 =?us-ascii?Q?8ho7628ORm5nkkZCw0gvVLOkgIBpu6gIuzAIXplgHbL56uCBjH0Z8u7ZHcOs?=
 =?us-ascii?Q?uQrgAwnSW8TJTn7N37ZNMuOhaCX0he62ev1cQJUPfykRB1cVqP5fRg2Ha/U/?=
 =?us-ascii?Q?I11fc3bq0LAj8mcUhPdzL4wEY4YXZbfnARVM71z5mOHywK2Ht2POregZaimp?=
 =?us-ascii?Q?RIeA0K+65/70L0xrYvYPOj4llOEu9h1UztHiZvl8kADbZCoV9LHj1bRh7n7y?=
 =?us-ascii?Q?dqYkHX2F2KbDqrzxFnQcukXZHWzTnpUZZOEm6AHWDbrf+AUviJFbjkrlo/dz?=
 =?us-ascii?Q?HU3GIpkWahGVPtJDWRjwQxgPLUqB+sKjbTgAL+9tMlajIk9aLKp0RNNS2nGN?=
 =?us-ascii?Q?w5TGZtHjNEXLryFPtpe0n5gTPK3dOQrZ4C4gQTYLlR7h+y3LrtEDqmE0Tvm2?=
 =?us-ascii?Q?nIRFbuqbLUR0yF5ny4I29t6Q154yhxdsCr+YaE4+QZzaN0dlzZDO2Xt3TlFj?=
 =?us-ascii?Q?5vCUcbhV8ZEanOJnX5Yn76PtTKNaZ5ZN6N65XuFSLIHSS5VfSJVIlicJICKG?=
 =?us-ascii?Q?6Ks6epFlu2kLOqwlw+hNQ5KPQTxNWB12Pcl//Ifc6vw1tyaZptKM8smGx9pE?=
 =?us-ascii?Q?xcq7fkcBpePE2lk+mn47iZIb/FoubUWD0hjlW/5DaEvy0i/IVvdq1GKVAGFH?=
 =?us-ascii?Q?r3sxMQmvbjJkOwNdoW8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda160b6-3c14-4c6d-0146-08db88c8ff4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 02:28:26.0558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uFXb6oACgZV7xOj3qJilmTEkCkXkNeSQhxzBuv/nQG/oylaVZOa9Q0RuCBnJQmVLq9pRcbDrBzrJ8Yx2MFJRuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4120
Subject: RE: [virtio-comment] [PATCH REQUIREMENTS v2 0/7] virtio net new
 features requirements



> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Wednesday, July 19, 2023 10:21 PM

> Under your promotion, I think the advancement of these tasks has been
> relatively fast. But I'm wondering when we expect these things to be done=
.
>
There has been delay in last 10 days due to some unplanned tasks.

Device counters and ntuple is very clear multi-vendor and multi-user requir=
ements.
So lets finish both the requirements by 26th of July.
By mid august we can complete the design and draft for both by 1st week of =
sept.
=20
> I also want to know, do you plan to release specs one by one, or these re=
lated
> specs together. I would like to know about related plans.
>=20
Yes, we don't need to put all in one patchset.
In last few meetings we already identified requirements that can be divisib=
le as individual one to progress.
Counters and ntuple are on top.

> We very much hope that these tasks, especially features such as device co=
unter,
> n-tuple receive flow filters requirements, and packet timestamp can be
> completed within this year. The sooner the better.

Packet timestamp requires new VQ desc format because it has direct impact o=
n how many DMAs are done and how we pack them.
So how about we get to this after, we finish the ntuple and counters, in mi=
d sept?
We can design new VQ format for latency + timestamp in one go from Sept onw=
ards before Dec.


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

