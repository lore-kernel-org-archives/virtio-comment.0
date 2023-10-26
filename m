Return-Path: <virtio-comment-return-7971-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7741C25B48
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:11:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0F9A92B136
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:11:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F2CA1986A4E
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:11:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DB811986A46; Thu, 26 Oct 2023 06:11:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CCFC9986A47
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 06:11:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrccukjsMJSK7U30LhCYEC+7IEBM1sIb6kxIX+VB1uYb+detL2yoYViVbMk/Ewg9d2Q6AaGuZ+qxj2hPHTypUjdvlLAsLFcLmSDL7kMXFTLruUQ9kWHdZRAbV0+EaUG5v+SWC9Q5SGLAduCnb03B1Thg6WUqy0BX3Ob5UIt1IpkzFVIomD6xZPjGgpXSfPXLGMnUEQrAp45RoY4IJw1i+hhFftuDb4aLavzaWiiw5oBmHy8kQUX9FUKq1Ak0eoUOB3odG6q8De5xEvUrDx9L52THkzi4fzN6zp+RD3rq9TLEYesJh4U0vlaIiXSsFOSIJEQ3o/LEmm7Jzak0lOIt7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hw7cYsVAkjkx3VPmKuxXt0tW9EQbp2aZsB+rsAs5b/E=;
 b=aJBG33gUdKrkvVJPPUxtb760V0r9yHqn4jcbKJjgrbT0ffriHAC7ceV/Ap/XPmHf9PMpYR+/iOgHC5JGD1Fo8T4l4+/CegznOXu7VbIYRKt+3KA8vz+BIJ0FGRY8RNh4vgAaY0b39ab5ZTJgcbzMlmCR1ITw11UtfOaXUULMmJ6UHeg/MxhIYVX1fSmk7EYcn3/08u4XzvVWQiv8r5/G4IH9ei+A7eAs9MM6kZoB652kKvkwtCH5BOHaBl0p7xUKSjh+ldwboH29z/BnDp9mVd+1KIJhf/0n3ipJ/Cj8A6P51XhXS/z2tw7GsSZjYlRCmQXoxsK9Ox+fzjPmTgAUAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
Thread-Topic: [PATCH v2 0/6] virtio-net: Support flow filter for receive
 packets
Thread-Index: AQHaA1Gmy4V0Ff238k+GleLKSeOrdLBbn2OQ
Date: Thu, 26 Oct 2023 06:11:24 +0000
Message-ID:
 <PH0PR12MB548100F6C19423923547CD22DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231020123303.1209289-1-parav@nvidia.com>
In-Reply-To: <20231020123303.1209289-1-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ1PR12MB6027:EE_
x-ms-office365-filtering-correlation-id: 35552631-5001-4872-0495-08dbd5ea61d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5NH9xc4JIIK6zY8+0ToaDYTUTgwK8p1hlLkwPHOelNWUQLM4DugQAc0fpdAvfmIVo0vXx8gntSMrkJ85dhHHFO3Fzb5n5SHPZie37D96gSxYHlwAd/61gzkz0q7Z2jMXnpnfSXQO8nQwJpFyrVly3jc4yMVdzFQaZmEPxFQyxXn9A2/va0vSlXRQl9IqYZz/lHjdy11s8/0ljZZhfzCEDlU9RbXGkJKhkiarI14qzKoGIddJNhSH88sealBapoRihr063wBGpsHvixmQkOwyTudYSXUlFHa77zKAv4weK3e9dCrsJPcVSfyqD6RFviDOdzIKWZ0TEYe0DDPLVnOPDnLwmsjCYKvbhvIak1tSRLIdnm+T+8HwJ5tqyfMWH2G1e/Zepxz1WxrQcvm3qohUHK0Jks/LQ/bs0/cP6P1osx2gKd/jqNAg4NKe7rATS1mtwHgJG+jBvgob8B7R0Op7PnZBkkrQHcXj2cz221QJZGwxbVdtprK2Ef5o2lxQqXZXI6t6QgwV+YmxICOkTFYANgB4ER/u7/jI9GSoIMsDrL6TQmoVpuqjUpgaGl/V6yLh3su1o4oWITT1j4wD2VgMMzx2gK5uCOEGHzVZ270xZGLvZ0sT23SROJaFCZTwpyY/5nQY7r3HOCcj0W5Mm39WKJ5rML0llGTCPm3k6uekEYrtGCWaQk35dATqlzY7D/hhKrOiHaAwY1FJQJAApETnTA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39860400002)(366004)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(33656002)(41300700001)(2906002)(55016003)(5660300002)(4326008)(8936002)(8676002)(52536014)(86362001)(966005)(478600001)(38070700009)(122000001)(9686003)(26005)(76116006)(53546011)(7696005)(83380400001)(71200400001)(6506007)(66476007)(66946007)(64756008)(66446008)(66556008)(316002)(54906003)(38100700002)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DJ9WCymGvU5mZdbyjZGcc3/X63v6yPnSGynay8/7lFvdwO5hPtDyM/EBp3BK?=
 =?us-ascii?Q?OWzhzUM9VHgjjQByQ+rqgIJsYTOJtB568iqDDJOFY10uNiX5i5mM8oSEotLy?=
 =?us-ascii?Q?v55MyJEX+2niAKz4Eot9Gic4g/69CjvUwRVPhYHldQR3G6rC2VsM7im4TG/d?=
 =?us-ascii?Q?go2AP9vR3XbDbZFu6DaSrpcEIbYIU117mxfd0rUU+PlihqXdzeu9MXKDTU50?=
 =?us-ascii?Q?Y2QMEdCFP5/8/Y4XuKrXP47xRl2ICM4Yhu+g7Mx3O47N6xHRXsxmU3TlS5P0?=
 =?us-ascii?Q?xPe/zPlmzN7sQPmnfF0j27GDtQ+FAo6UolOeQt659l0glpIwOW8DrDzadsMB?=
 =?us-ascii?Q?BVqwSdqxVFFnhCytCqEZ6lArqU+Tp9tQbvyxOUoN7OPl7dufJjmYyuVGBT21?=
 =?us-ascii?Q?jajl3ttXApeyKtERYpYiSP3b7shxHDbXWAnL1K1047jbdOZANlSVd1W/wJCT?=
 =?us-ascii?Q?m3MoF3FTuVrYbSN93McyPUpLDp4cXFhObTqvG1kjt7FOiLtXjy1Y+gH7F1vm?=
 =?us-ascii?Q?/toMf18yQJf2yuQ0Xyz4MwBVh5s8MakTXH+t4gCRsCEHMRloZQ9OE9KFTJXB?=
 =?us-ascii?Q?6laBx/lQDgL7ELoJSS0F7a9KEmvNMqRifYc3oX+Vn3ARig31bCkuV6i8yRw8?=
 =?us-ascii?Q?6Eb0qfcwYjOoVnrD4a+xlAczPVkcuBCqYPHo2u47NtQP9jOzJudvZNqlQm8c?=
 =?us-ascii?Q?ApzJSfhfQmeUcJSiHxJqhg2mevSSABpTaHLJxQa7rcn9Ztc2xlVePmzLn6cv?=
 =?us-ascii?Q?Z6MGEK7T3kHcIeNQ/b7qQnun8cr8lltChgVpsEFOiH8520g3QPDRTAvmAkuW?=
 =?us-ascii?Q?Z54g7Gy7421DSjOObg4m+t42LpfCsFLlYTn14nXpTk4uq394SCfJ95bt5T8x?=
 =?us-ascii?Q?DWiRGGcL7FxKmgQVCNGrj+9K7EMxOlms6yaMl+ij/IlSU5Evi3s9WKXC8kja?=
 =?us-ascii?Q?0o1668RPrqnGSevAAulLguxcvw2tdCVgKwA4UL6s2ufcIgXvIWSXmF9ogU+d?=
 =?us-ascii?Q?M97u46NIq2WJagPy5Ht/3ERmvnLN9HTBw6LMTZJiutAvQVsJn2K+mifd4ANG?=
 =?us-ascii?Q?2j9q2RCsPVpR76ty6sILZ2Z/1IW4EjaGG6AS3/Irmthj15K4LZLKaOQXCT+X?=
 =?us-ascii?Q?gCVPZLehV1/WiAinGS4LpvHGjIVB2fQtJ4yD/mJ7Udt4N5Nei8HztvljAkVr?=
 =?us-ascii?Q?I+SxARL7NyfILOlcJ/JAf6Hc3C/NGt2kid0p9AMwX2OKZoIIcqRzHUYXdIV8?=
 =?us-ascii?Q?nIj0pMBhfcOmMfx1qr5KJtW7oko+OtjmCWtpXDKdwykIjNHZCptj0VtNTqcc?=
 =?us-ascii?Q?uKzgQPBq7ONEvySNB+CMq61eOg5GqKoTQE8Gg0XvAeoTL1x66otwaZXKMTvx?=
 =?us-ascii?Q?9R3oaMrvBhwC970fEuJLAG1gM4Y+RLdqnlPcKDMfgvpO2NQZEIgEJiMPWxVM?=
 =?us-ascii?Q?T8c1KzFdoCLVKx8yBOwF9dEZ0OxUZiHMcPC+hbYj+vAFN6at8F4m1qA+Y9u3?=
 =?us-ascii?Q?5Kg5kyH7wEatooZSxvcTdljCxevwMoUAiDqMnHdErBRs7X8fVu0U037P9Grn?=
 =?us-ascii?Q?4pDLWwJvkGyqELcI5I8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35552631-5001-4872-0495-08dbd5ea61d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 06:11:24.3095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jLY48TFKTWzyVSmg8x6bFVM3lyJNAKCCH3InLUgM9WJ9waWd8qHvCMid4GH4hkoJ75W8fzkShqd1LqCI9tvnPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6027
Subject: [virtio-comment] RE: [PATCH v2 0/6] virtio-net: Support flow filter for receive
 packets



> From: Parav Pandit <parav@nvidia.com>
> Sent: Friday, October 20, 2023 6:03 PM
> To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> cohuck@redhat.com
> Cc: sburla@marvell.com; Shahaf Shuler <shahafs@nvidia.com>; si-
> wei.liu@oracle.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> <parav@nvidia.com>
> Subject: [PATCH v2 0/6] virtio-net: Support flow filter for receive packe=
ts
>=20
> Summary:
> =3D=3D=3D=3D=3D=3D=3D=3D
> This series improves virtio net receive packet steering to forward/steer =
packets
> to specific RQ.
>=20
> This basic functionality will enable Linux ethtool steering, Accelerated =
receive
> flow steering (ARFS) as starting point, and more use cases in future.
>=20
> Problem statement:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Currently packet allow/drop interface has few limitations.
>=20
> 1. Driver cannot add or delete an individual entry for mac and vlan.
> 2. Driver cannot select mac+vlan combination for which
>     to allow/drop packet.
> 3. Driver cannot not set other commonly used packet match fields
>     such as IP header fields, TCP, UDP, SCP header fields.
> 4. Driver cannot steer specific packets based on the match
>    fields to specific receiveq.
> 5. Driver do not have multiple or dedicated virtqueues to
>     perform flow filter requests in accelerated manner in
>     the device.
>=20
> Solution:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> Flow filter as a generic framework to overcome above limitations.
>=20
> Overview:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> A flow filter defines the flow based on one or more match fields of the p=
acket,
> defines an action like drop/forward to RQ.
>=20
> The flow filters are organized in flow filter groups so that their proces=
sing can be
> ordered when multiple applications wants to use it.
>=20
> Flow filters requests can be transported via control vq or dedicated flow=
 filter
> virtqueue so that it does not get intermixed with other slow operations o=
f cvq.
>=20
> Flow filter requirements addressed by this series is worked by virtio com=
munity
> at [1].
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
>=20
> This series utilizes enhancements proposed in [2] and [3].
> It uses updated control vq command format from [3].
> It uses new _DYNAMIC feature to create queues when needed and saves guest
> and device resources.
>=20
> [1] https://lists.oasis-open.org/archives/virtio-
> comment/202308/msg00263.html
> [2] https://lists.oasis-open.org/archives/virtio-
> comment/202310/msg00183.html
> [3] https://lists.oasis-open.org/archives/virtio-
> comment/202310/msg00047.html

I will rebase this series without depending on [2] which was abusing the in=
it time register for dynamic things.
Please hold your review in the text around dynamic flow filter vqs until v3=
 of this series.

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

