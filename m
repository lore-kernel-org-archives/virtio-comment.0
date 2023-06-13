Return-Path: <virtio-comment-return-6336-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329D9EB64D7
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 21:20:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 688C41922E5
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 21:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by host09.ws5.connectedcommunity.org (Postfix) with QMQP
	id 57D862AFF8; Tue, 13 Jun 2023 21:20:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6F5999865C3
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Jun 2023 21:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNYOUaXSNh7fhKhKTwWCnxZuneuMcQ497ZIEFK+8DusEITkxmpl1xK7GUfO5+ldae6v++slLm5lDUFOByj/11c6RxTnE1AQKmX6javdWmp/an7IIB0ZC/V1dqVKz0b8p74jHdQhlcaXvkm3ANePNd2tOvz75hKXc33lwUZiAJS9kI9ZPcTsRvEYJkUPrsjsYYBV/FN5yWDjVpEB3s7vCLBnrzNiBcMgRfvw3/IunwU/LkW2O/dHRjAwd7EWvFJ4NCwF6LIAjmn+8CNekn82yBbHDsjx68mGY7tygQL8V8npslU2wjD3qYlruG7+ZieCxazk1HrjhYgpucn4QEKiJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+qItHdgY75HGd1xlLOKUGiOt1i/luqxsdRWa39GoOE=;
 b=IdORkHBm033QXvhaZiyhmW5mZ574uY5+d0R9H8G7x6Y+jtK++4w7beOat5+vZ4HKUXIY5YddHZcsfilZd8NeAqp/eyizozCrHkYunLUeOcvnQXEcHDbHe2rlDt7lx0aL9T2GoOAl88SDxw112H0q/+bQ9QvAbYPJsu9fTsgYi2Jlu63MlqBaV6IpkLRo1uG6LRzjfM45MWZYNGIqK8y7sr6tK6WJA1AphcnPJewiXn6yflHuqIs0KsIwIth/mwT2/jyURppo8sX3Tlv0E4E9NZg9qK4xJ60TxFAv6EaAMkZ2zcnKXGG/6zEO/gU6QktALeX017EHyEVgNGZiaWEmcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: Eugenio Perez Martin <eperezma@redhat.com>, Jason Wang
	<jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "alvaro.karsz@solid-run.com"
	<alvaro.karsz@solid-run.com>, Liuxiangdong <liuxiangdong5@huawei.com>, Gautam
 Dawar <gdawar@xilinx.com>, "longpeng2@huawei.com" <longpeng2@huawei.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, Stefano
 Garzarella <sgarzare@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>, Zhu
 Lingshan <lingshan.zhu@intel.com>, Shannon Nelson <snelson@pensando.io>, Max
 Gurtovoy <mgurtovoy@nvidia.com>, "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>
Thread-Topic: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling
Thread-Index:
 AQHZmQIKC76R9PwpeEiJOopOzuw0Y69/AFOAgAAG9gCAAANtAIAAC8qAgAC0TYCAAEgAgIAAWXEAgAAKwgCAAAn2gIAAFZ2AgADi94CAAM6QAIAAWzcAgAQxloCAAY9dAIAAAd0AgAAnCoCAAJHBEIAAEOUAgAATmKCAAAOs0A==
Date: Tue, 13 Jun 2023 21:19:12 +0000
Message-ID:
 <PH0PR12MB5481B7AE8CCEC99C71216948DC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230608031325-mutt-send-email-mst@kernel.org>
 <CAJaqyWf+vn06NHcQY208dwyB=WH3PQ3A7z53o0BTy102XrT+3Q@mail.gmail.com>
 <20230608180617-mutt-send-email-mst@kernel.org>
 <CAJaqyWf-=R+KHfBjzrGzkunTdeV8sAgFUv_kYoxNo3uqH2OOSw@mail.gmail.com>
 <20230609115250-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
 <20230613034216-mutt-send-email-mst@kernel.org>
 <20230613035132-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
 <PH0PR12MB5481746BE0C1B7CE4D098A7BDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230613154823-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F91C70744E7A83BD10ADC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB54811F91C70744E7A83BD10ADC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB7661:EE_
x-ms-office365-filtering-correlation-id: 7af83a8f-a7ef-4373-b180-08db6c53d596
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Sk1EcHpZrUCiT3DHCSAq0EBDyJG5gS91jJPwa1hiBYrbX/MYaclPcfKE3rwFxyzitjIj2fuv3FHML3YqOfyXAjbWZ8mbEcNFQ1RRz3hjjgPO1KiLz5iI2qiDv4E07YKjQMkjOADGvT99tDUa9LlVCtGfjv8hA63IUvjkIjDz9eMvJaqygEVJHpK/XwfChUa+NvDuGd8gFVbooAZsQVHv/86mgOf5xsfwIzNCsq0kbqtEVIyH99xmnXEpnE0ow8D7fRaylUTAXsYfys/H8olVJ+qqICvGrILOvnzkFnSh73o/HPr2Q9Q7lLzAO1x+feUwSXD8HXhbV0g3DgLP0DZDtJwEWoanhl53wnxIozysCAEmvDGVKe3weNhMQIyUInjoa/FAZaV6JUS6mRMezbYq8jT+uP2IvyyssHw7HtAb/xOpiYfp+wZmuJEcnguuW9ViGKeDIN6VZnJj3Hd7DJC2PS/SMHxF8pqRXVcn0JQ2P21PRyamou10GUNFPefyN1qhPuYpsboXJWrdTntfvTXb0v/A61RJb6S4u2k3q0eb649f+Af4+8snQhtk43wzoDIxAqUPp5lsc0PYYN6XZcjjNCGDbkol+5BYv3h/yT42hyuJj+03bk9PyvNd66ys2+WF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199021)(316002)(7696005)(41300700001)(186003)(38070700005)(86362001)(26005)(7416002)(2906002)(33656002)(2940100002)(55016003)(9686003)(4744005)(122000001)(38100700002)(6506007)(52536014)(5660300002)(8936002)(54906003)(8676002)(64756008)(76116006)(66946007)(66476007)(478600001)(110136005)(66556008)(66446008)(71200400001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LLruVa+fsHuY7nhNJZ3pvgj+KJb0jWyLvFU671QIXDN++OR4bSiMW+s/8jvS?=
 =?us-ascii?Q?Ugx5pdM5ZisNFxBhTIHW0gU+c3zGIBB7UlYYKUOH4qxS4/hIucKcwYNBs5ck?=
 =?us-ascii?Q?U+xE2hq07B4XEFs/stsQELylAYn28prquG/FcxCV0pxv1tU8U+38b6AQH+/z?=
 =?us-ascii?Q?hRNyyx0mzwWctgtXawZSMHOoGihljCGGekc8vQm9HnOf3OtIstTcjOEVzxu9?=
 =?us-ascii?Q?lEGYMVimgOd3gBr6ADtCPR6K5SDVhzpru9lCh+r7Ub0HjtYokmqr2Sr28zF7?=
 =?us-ascii?Q?PqQpHwU8BepNQtaubE8sGw4UEws+jpzZ679JNYBRrRoWsXqxdP98stXY1ncf?=
 =?us-ascii?Q?L1vzLLWRzUiWVe+dHjDSt5nz5senmuofDkfmRXLIuFzsUAbUpMN9q8KDql7j?=
 =?us-ascii?Q?rVtpr71mcJRzeeTe3y8QG/AkmdHOU2urA4NQWiUxt4JgdztaHks8LigeTAVT?=
 =?us-ascii?Q?w0za9jvzjTLTiDmnXdEE808/zvXJJc58s/MkAY67xORSXNQwHkZx+phJBtAo?=
 =?us-ascii?Q?5XTuNbTpKxFH4pK/d7jXgA4BdDjj4SipFrg6jbrjqDYhZLkQ4O5NMvKYZELV?=
 =?us-ascii?Q?FuX8pvrvb7q9c3h6cK8Voxyw1f+2PP+rV/CpCnxNwGBkQzjS9nbFns+YTkS3?=
 =?us-ascii?Q?Ny2SCLst08Xeu/qN4HJQm8r5Aar2G14FyektFr3bJcfDgLrQBxQWntPT/RYV?=
 =?us-ascii?Q?OvfGSPBspSAQ5aBvBVjxxZglpwP66W6yULT1un0HHzcHtDbt4cee98NsdV9c?=
 =?us-ascii?Q?KAyDpCy5qygmWB+AG5nuarSTRZzGIbzjGyFkDxXNCsR7jCrzxomAMajR/d6c?=
 =?us-ascii?Q?7JYbc8yaV3oCd9EYoqZq4Lsl9mFye83uXfEIoQRc3RhfqUz/RMGZPgmxbJbt?=
 =?us-ascii?Q?7LcJ2cSjo+gHF3ml+b3kD17BLJkBMrySS2h/zh3jKBFb9NFpBSrRZkLVz6Ea?=
 =?us-ascii?Q?QOm/vZsGAqPLuspCOY+yOMWl7SGefE4QDBKi7MeXIuaGXV7ceLyPSk0hhOKu?=
 =?us-ascii?Q?exc6GPiuD8yYmPimft0oooO1NYuGe37w/8QOQ/OFPLSupmyJBOfgVjFUo/HG?=
 =?us-ascii?Q?D08oJcCsrTejdI2KT+r7kuD7WfAsQ6pPrXw9U1uQGWe16MwcxaWhFTlEJP5e?=
 =?us-ascii?Q?idd7C5e1jOKv4ZMe67bk8R0U1TKVg7aJkal7IDgBy4KERRlLmm2Y/GlPj/8E?=
 =?us-ascii?Q?pLHE4j1xfsOzkPjOKiJ4hj3AphpJIPVZCmWg5MY7ORCPMEqnC16lWmT2O61p?=
 =?us-ascii?Q?4dx6boLYRhINddLPZ27RXc5H1Xwky07DzU/FdFesKasGHfgN6MKW33mbjFE+?=
 =?us-ascii?Q?g6MptXpSBG7uSAyzgpFyEpNgsFG6+X6AFZ1Gf/8EjxqT/piscl79VltiX3Gf?=
 =?us-ascii?Q?mQo+VQ7ZFH4z4pNMQLGwHfxQ177sz+FIws+hbh+Nc2JW+M/kwA8T1+C4saTO?=
 =?us-ascii?Q?i2I5pRva2l/seV50KlVClOcnN0uJiZOcV5jfFzGe9ST5JJqRjL+nWakGFPnC?=
 =?us-ascii?Q?pI5D9CJ9Ibmb9rGSOO9DLSXqlalY51F5668kRFsbJfinhyAkIThDjP9v/gKi?=
 =?us-ascii?Q?zOb6x3qga1CSKgC8P5o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af83a8f-a7ef-4373-b180-08db6c53d596
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 21:19:12.4484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JiPBLX/l9+FFd4tzprjhCxDIoK0KK/AyxHUZdwczFYt/cuiCEugQQa87E75rwNtypggLvhCtXGALreSj0ou4DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7661
Subject: RE: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling



> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Parav Pandit
> Sent: Tuesday, June 13, 2023 5:09 PM

> Why queue_reset is needed here?
> I don't see spec saying that queue_enable must be done only once for a gi=
ven Q
> before DRIVER_OK.

I remember now and I found the wording which was the source of adding queue=
_reset register.

Spec: "The driver MUST NOT write a 0 to queue_enable."

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

