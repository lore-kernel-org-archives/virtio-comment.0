Return-Path: <virtio-comment-return-6939-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE497EB64DD
	for <virtio-comment@archiver.kernel.org>; Tue,  1 Aug 2023 08:35:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 116A72CAD7
	for <virtio-comment@archiver.kernel.org>; Tue,  1 Aug 2023 08:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by host09.ws5.connectedcommunity.org (Postfix) with QMQP
	id F36F22AFF8; Tue,  1 Aug 2023 08:35:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 159A0986408;
	Tue,  1 Aug 2023 08:33:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9ktS6gDX+sKoVgt8RZCDsfKL/Zmv4adv0Dyo6vOygpb/qlDEznHYQXlgeb02+AP+Oh9HaUcF6P9dkg1qQG76bZg9dEOneJHTOXoh0mfBP4paVstBYccSVZ4417RobddgzntjFsUIBzi3DEZ9PRnde1GUyDVzf3oOGJcbjkyt7+sc+EjQZknuG67H73JI72qzIZ0dFO6aXILzVE6MS66o1XiWuCcZEAc8FkzhwQA2DetL/YgCdCNTnwQXym7jNIxL5Z2ef/VXuSpeykOVZBvRyDpsWTciFJqZEyGEaJhTLEyjlVmP5nmt4MOlGKXwztb93bfm7n9D4yTC2qTugxNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tThQteVSwT3vfJXgzrYJyMa0tuZiyRvrEfVbbX+OxdA=;
 b=e1z0xekKJ1cKrJQbu+RiGWEt8Gr4glp1pPYwQ5cBPqs0Iwc8RxwIX5jX7HdKO+WLCfKspnig+tPqDdXnHA0SdD1448KRuhYT0ZT4A8RoLX8Mp5FVcMl8+U/mU8QnnCnQfmjTlKPiwRxhpYUKHqkHDqKmrD8Hi7w3ziF5OhgjoU4mF2Z9ReQ7arYcgHTgtL2u6se2ODMGQvKOVJGU9KdeGN+If9BUz0Yjr5AsMSq5Vd4Vy+AGMyfoDIZRJh8m4kV6p/+8VUFcU0zIJwkh3bEijm/ywh+5WRutFr4/699+i0TuJHMzmWasa3gxz5Kemd81gsxBdT/mFGL/nLtJxKFqEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements
Thread-Index: AQHZvd/S1zVkOCRsJ0eCMof906XE7a/VKJZQ
Date: Tue, 1 Aug 2023 08:33:56 +0000
Message-ID:
 <PH0PR12MB5481BFAC574390286C5BA0FBDC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
In-Reply-To: <20230724033421.249893-6-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL0PR12MB4897:EE_
x-ms-office365-filtering-correlation-id: 4796ba83-8daf-4663-16db-08db926a0b8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TkCu93ASQsYZh7gqc61Cdn4uQajzCzT+w5dLN98jKhpQc54Ny4vboJ3uUdWt6vH4p5MuSywq66OwqXrrVsatzNOgFXFgw52CyjjA9i5bttyz+JzPkMnMUK72vWF8aZPa6xvifgnPbyOtIYIWMQ9ra/raq+arNCBDbZ1NpGp7H/GD87quHt3O7CPI5+gLMvsVz8M3BeMxuj/gEXvmYtUaVJwkfjKigsU8OiaSBZijPzKe++wOsJc9rEjfGmXVhYGnDDPr53tUDsoPT0SXtmZuOZwK8anY1p56WY3lesuNg2/RAObA8QzP+wQAzbaLl6s6PZY4jicytcrXt6Oyh5gaiJAFzyeT2s7KPRVfAbTsFue7qfCmaHDu1F6ndLc1cIiMecbHkeMm19PSwKB9up+e47Ahztm9hRvYeHQkYJ1Ktdn0JtCjr9MVHgfIXqC7j/3KcWQ7J+wjB0BPgQ1VtYYo3YA/gS0yYOwWFQHFHnO3C9dcYny9EYsI+MEXKKAREAatFwxedmwGGEP66S6Gtw68OKR+vDz9QqawNjKn06tpOWgFtRVsigrbcsOL6baCQ2x24thqM1U11iSH3faq+wrcM7NfUqHaP32C21yt4n9AeGls5w5brtmjeptvA9HS7U4p
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199021)(52536014)(110136005)(54906003)(122000001)(9686003)(26005)(33656002)(6506007)(7696005)(8936002)(8676002)(5660300002)(55016003)(76116006)(66946007)(66556008)(66446008)(71200400001)(64756008)(66476007)(4326008)(2906002)(4744005)(83380400001)(38070700005)(478600001)(41300700001)(86362001)(186003)(38100700002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?htO7KOLpIX3SJRKvAMwmTLNKXVXGjSL/xhwYDkNAdO25Zsx6lGXY1DEEFYxe?=
 =?us-ascii?Q?rHmqgYmMr4SHo6QWzZoQqcofM0V+QLWhPydRz+6tvb6NmoFHAkmDTBISFEIV?=
 =?us-ascii?Q?PX7NeSKGrF4OpdzOA6cEOufRVoDjB7LWwpbgA28jXufH0LBawvp0hokAfMnl?=
 =?us-ascii?Q?kU6pb+kDEs8s1TbZ7HaNXQfMQlzhhL3D8CG32Xc1+AOsct+j+pCje18K4+X7?=
 =?us-ascii?Q?5RRLVX9rlIRztKQ6a0EIpwBhlMZYR48FAVEcbsb/oZ41g1S42NM2MpkDeNXj?=
 =?us-ascii?Q?7NWmKDTQPv3WQ2Eo7PuyG3tOtJbDK4cmoVWHa9WJIXrJ7kZX274OhJYnNcdi?=
 =?us-ascii?Q?V0+nsnwoA3SWmD4ImQw5KRqR34ShlU4PNQWtzy9MK9m+ttEjypIf3X+CdNqe?=
 =?us-ascii?Q?WusdV5Hzww3spH4EvhQgMyhRVGutAliYLbBDx8boxkAbwESEagjGla7Kqc4V?=
 =?us-ascii?Q?dyNa0p5SUtx9mi9UdLLBAGHkWcPtp8jGDsoP/HrJGqW3yNIhsWJ/YN9BDFDO?=
 =?us-ascii?Q?Zfdlj/TbQa4cM43n2ATyih6GDHfeuW6vom+c//b7P//sPo5cqTMNF3asAuOm?=
 =?us-ascii?Q?A9URWmGaKewFPwQrJQ75amibnQ0BP4LgRI7tHePKnrdRbk4eNwgRVvTQfhUF?=
 =?us-ascii?Q?FXlgS/ezgI2+HOKL62ZnjPMLMuGhk6DbuZErqIeV2zHnTnGdnxFYEix7BqoT?=
 =?us-ascii?Q?Cpn4X3+slA+QWWYFqYLp9GrzU6ncV1QJs3rpr7XiNIk+mL4J51HMXbj/WV3I?=
 =?us-ascii?Q?c1GeX9qoZNl9e2xHR/T0KdUbdZihhE79PWmA66mfqN1xURWlNJ0i/aDOYoea?=
 =?us-ascii?Q?9oAkZHERy2t+MspwEH6yPRIvKzsrz+PcVifN11aDgkrn+cM8hKBnLj1ZpE2b?=
 =?us-ascii?Q?Mr5iWh6u1CIrHreLU6pTHwFTLay94o4mPWh96O5Y0ibOaUGZsAjnPGBnU+N/?=
 =?us-ascii?Q?g5kbISret0+wWKqRSCYIjK/cMngl/bJhZuit4XehEz05RxeuvBoT5flJ3m3g?=
 =?us-ascii?Q?8VVkqVBYpCSnSxQS8QQF5ObvQ4i6S+7MvLV4oOOx25otslyqQ/bGr+G0J06I?=
 =?us-ascii?Q?Kz/KUnG3nACmXymh8doa+3DZzXdr8+odv+zw7dZZ9LR2QMBNpwrkD8/bhTKX?=
 =?us-ascii?Q?Hesyy7WelMkVMCIrDErvLTV7inyCo138Dhiy676wFlk8mGH9tYQTORN/KDYj?=
 =?us-ascii?Q?3/wGTSaZO5kEFyXLy94O4PUQDiz3T0fLZ0fAMZ3NZ5egqkX4zbWVjFKcXspi?=
 =?us-ascii?Q?EqhpvxFRX0UzDP/9iag7lpPj0fij6Of7nQZ42A6t3wbh6NknvCiNPw0tYD72?=
 =?us-ascii?Q?UzCRwjw/Aql6/MXXqwnico3ELpK6NPieuB+wQrYEvMS6wydVcCSo9v+EGJsC?=
 =?us-ascii?Q?b2DI8Z8QOnIGlPzgwSGAQg//EO2D7uqLoW85F+BsXp3qhrouPeAUgHKAWj3R?=
 =?us-ascii?Q?ICKa5zKO8Z6bOWf5v8UCnoCsEacI8nhGaX136Oq6oUkFq2K28xRey3UHkl3S?=
 =?us-ascii?Q?v/ABXKk4Bjs+RHUl6VVuz3sTIPBQL0KA5l6/mV/4K3iwBo5wOYRmXA3dh9UG?=
 =?us-ascii?Q?4BcgaazXD7iGpx8lad8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4796ba83-8daf-4663-16db-08db926a0b8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 08:33:56.0664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3QE2mE62ICZTU9lPaJrDn6dk8VdMgNKLcQi5HKxwz+DpynvkqPqKLV54PivtIYEPuXfOy8DMvVpiL/fyBhwtMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4897
Subject: [virtio-comment] RE: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements

Hi Michael and all,

> From: Parav Pandit <parav@nvidia.com>
> Sent: Monday, July 24, 2023 9:04 AM
>=20
> Add virtio net device requirements for receive flow filters.
>=20
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Do you have any further comments on it?

Heng and I want to progress now to start the design/spec draft of it starti=
ng 3rd Aug.
Flow filter command requires packed VQ descriptor extension.
So, we need to wrap up now for this infrastructure extension pre-work which=
 has significant effort.

For now, we are taking design to next stage for these steering requirements=
.
The packed vq extension is going to benefit low latency tx part as well as =
reviewed by Stephan.

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

