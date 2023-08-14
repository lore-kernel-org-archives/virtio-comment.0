Return-Path: <virtio-comment-return-7075-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB372C001B0
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 06:35:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 15CFA613C9
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 06:35:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F0972986371
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 06:35:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DE703983F78; Mon, 14 Aug 2023 06:35:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 06B4398633D;
	Mon, 14 Aug 2023 06:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDlf5pxswvmqb2ysgvdGJTWQZ9s8jp+byVnr89NJioQ82BMOYqGF9JGU0atdYMcRcsG8vpLZh4SzVP6sRpMkeMKIGVQSHR9JaOWdv2JLQayYFQOl0zgz8PVGSjaa/v6sUCIvV2w9uNtt5NQLi0hVFpC0PPgmPX2WSKmoucpmUOCGsIvb/NYxk8+P1RnQkjYksBZopITwnCURZ10uWqail+eU7FOegp7VIh2Cx0Fn7/8RW8Zp87p2CcnPasCGUynMOIyg+OrNDvRBkRqQatrGj3eiPSs7UHXm/JuzeH8sDbh8Whw6QIP+//TGSvBypesr5uVUQZd4NaG/5Qi+SPYo3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkPrgMdMpIf7l9coHNJ2y4WNMvENc3hFytzkO4oCULQ=;
 b=LMCbVjINmKN4hvvVQZDBndCAh2h8nLR6nUNjsryNNLUam+To8JBfjz62QIBIrpl9wAozZL5vuuAX5IsRqp6yudyxRMN9uMJ2dY4PTTS3j35gcGUszL4uIlOX9W62uChHbtYXJzCIsXM6mHvLljbADISilEXEf42dtxlePSxYriezTD7dq4DJdtnDY+Ck4B7fRxEhzGwOdj3cisfGGcNoNurcaCgR1wP3AryqdEUs4o1zAsWRQDiAtRKL3feWgqzkmXCliW8+3hcHCEkD3kakYeS2IVhkdpEf3ApqqN4WvhcSZUMdPnjkYKijXeyPKAdTtYJCwpemh+QR6UO4fg2Jyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>
CC: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements
Thread-Index:
 AQHZvd/S1zVkOCRsJ0eCMof906XE7a/XL16AgAEzr4CAB8PvgIAJOOHAgAASuQCAAAR5sA==
Date: Mon, 14 Aug 2023 06:35:20 +0000
Message-ID:
 <PH0PR12MB5481493140FA8EC444FC0768DC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <20230802152525.GA13690@h68b04307.sqa.eu95>
 <PH0PR12MB5481538EEC183EBE3FF16234DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230808082145.GE11361@h68b04307.sqa.eu95>
 <PH0PR12MB54818794DB300C190CD92728DC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230814061840.GA30754@h68b04307.sqa.eu95>
In-Reply-To: <20230814061840.GA30754@h68b04307.sqa.eu95>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB6412:EE_
x-ms-office365-filtering-correlation-id: 27980863-bb44-4fd5-1170-08db9c90a192
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CyQO3Vv31LsjK4yndoycILzYaQaGX6/p7EmgMqRIaug3dHZUp9vWKSkbh8FPbEWJCBxhXgf+PlJUX0PfhpU52Z85MGxZziMQqk1QCtueBtREWELjx8bYTRWD8cdRqOgppP/8CCMMgtQuvBWL3yt0wyjPxrayjjxYOg422Ss1SVzxKWdR4kx+z8aEy4eOfCWJRZ26ZO6C6HdqB2LeIlAEWS4YHogJV3+Oyrn6xHKU24TfvO/A4Rb/MQ/MT4rfYr6MSwcPOCqJxH7+pujNH6DKg5SLnWiATJJvmDVSXj1ubwiXy2pRZqFLd11N6XwM6ggxlwSU2nrNOfLII+oMfV58fAEidJWZZYcAKxJxf6rz6wqf1sG2wTQ6gRCQ3vlxsx2p9Jg9i5FL1SK2zgx8XBLZqNuzAu3jqUj+lfkyN6qiuaXzdGrF/KIRioEF00UBRhocnk53P2toeafjTX6LQg7V8NlUwi77pM5/06lvakAPu1Nw0eIRD83IXTmf6JZ2cpNlgPJ0/UrXF7bU/gkvMvKPZfHqrxA+OzU8fmoqVNGyOxAhqyYtj6f6k4EVTf1bGpbyHA3Goy7oBZqa+SUXai09LAHxZj+uZyLG7Tf+7xk0skNavJm+i19x8mPwpdgVlZNL
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(186006)(1800799006)(4326008)(8676002)(8936002)(9686003)(33656002)(86362001)(478600001)(7696005)(6506007)(316002)(76116006)(66946007)(54906003)(64756008)(66476007)(66556008)(41300700001)(6916009)(71200400001)(66446008)(52536014)(5660300002)(26005)(4744005)(2906002)(38070700005)(122000001)(38100700002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DyCcGrZrOfH/RrMSa3tZ9pI6vL+HNuIBKx9oVOrmi7N4VXJ32/zZw/jSWPqF?=
 =?us-ascii?Q?A+99Fg76/2wbrG117bQGlUSG3MMJErC2jxy3HXALhogB6nVrygK3c3UqGe4l?=
 =?us-ascii?Q?UE93hwiG65RXjQ1YUS0KtUfr6jNi9X4ELRaTMetV7tcwO9VkP1RUqqG1UiHr?=
 =?us-ascii?Q?3zb51ZWidKzV5meicQOmcr9gNUUGuEfnS6TTYnAa+yzsZvIAWjvxq9Wv8zw/?=
 =?us-ascii?Q?tOOartZWWI0OYHlZVln3pehghgLDtwUqgSFDU+1+1wKIFO4HEI6prdKLexRp?=
 =?us-ascii?Q?C2/YbHCsoRPf1J+/jTTJowfi6TZhItbzk5bdaAfhpovijP9xTW3xxn3zuIbL?=
 =?us-ascii?Q?uiJy+dRpcFGRaLMq8RcOz+D0eKQWFFowFbPOfPDZlF2EChH/HGLjGBBnOYMg?=
 =?us-ascii?Q?tFTfsS093WWSxrGq+tso7rHxOJjcVvl36jllObHpFSlbZEEGvEo0q1fzsBGV?=
 =?us-ascii?Q?HPu6ErVerNf79PhsvU480ywL35jUsCt4jHGQptWtoDnRQF93q/i5+3PauRtb?=
 =?us-ascii?Q?/v3H4SilfXKz24neUmbeYd7NvgSHPeL016GNuB3SrLEwUkL6a9/1PTXn76AI?=
 =?us-ascii?Q?26kxCJ1pUUtAydTCogaLlc4qEJ4EEOMJtIyxSIQnf9zQa9LXv9o4iX5xOg7R?=
 =?us-ascii?Q?E+Bt7tx8Gp3ZwFAls7M6FsNoXCl9V6qWUzUwy0fbV25LOCl/J0E7tth9XfBf?=
 =?us-ascii?Q?uvF6xCaE1Pqth0zal/j9UkL1Zsu16wC/CqhkDbst1k8XySV/cuRmqUKAaSry?=
 =?us-ascii?Q?kjEtTZMwspeDQlsP21eSSWlfW8qekirZxxqUHKXEml6i6bXxLZIn98G7+AOt?=
 =?us-ascii?Q?UZFu5Kj/Esq/up/mwbk39DvLDg3h5MVjxxYiWOvjPepbkm50YVtRquv0U28o?=
 =?us-ascii?Q?Rak/B0zRlDua6ywfHl4F11d4232O0Pfdfun7A1dYcKk0JMisr8ASTZt+C+jx?=
 =?us-ascii?Q?Kx7OgppZOlU6NLgMRoZxsuJByJqRTLqYf88VKFWAb+Ks5zx8F9UpQ+XllfQe?=
 =?us-ascii?Q?jw+Fgli9EXTXVD7/r5I985T7hyN8GL1VCSj53qYCjWIq/znjxxheR565OMXc?=
 =?us-ascii?Q?6jDurkEDj21qCRngLEW4zkSS1llst9jBICQzaCoEp6dL4LVfbHPn2mIU5LwD?=
 =?us-ascii?Q?4ufsCZjFXLvxTxSNpA5COF1N21eyUe9eDScN+W72fJreoDkry/nGZ2fWFZxs?=
 =?us-ascii?Q?VgRocB0rfmUuq2u3N5zlLaPfZTtNFKKBeIaBgx5SU9dXYTBSyAJ6oW5lkZpw?=
 =?us-ascii?Q?telv/dtL+CoN9lePpZaTrMp4kKcxAVY8w0vPa1bsRpAWoxm7x7nlcJSeU/8c?=
 =?us-ascii?Q?A3D3SdYzm5vM3AyQ1X66qSMXYFIx/F7AwG8SMJvrODrjmSMNhCfHuNjvelEn?=
 =?us-ascii?Q?opi+u5KhAnluW/XRR1VWYUp/sfMDmt56ulR6wzwBKyOueJhaQQYuVaXEzjAi?=
 =?us-ascii?Q?8oe+wTz+bMGv3Iyz03CU2Bb5Kxtv7rNK/rRBqbugxYydw37a3FA+Ya6Z3htQ?=
 =?us-ascii?Q?211PzIgoAV9Mo4OHkRGVimEAMlDPnwOR342cfAqXaNn0sWEBfg5k+zspHqD4?=
 =?us-ascii?Q?ppSv5l/i9ghPXTeFh54=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27980863-bb44-4fd5-1170-08db9c90a192
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 06:35:20.2745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aBIq1zDqy8dJIT9LX7IXuKWbjaKDx3DX8CFS/VmqXyg2XQ+Dc2dgJCL8/RRAlEwd12l0u35Rke7CWK25HqlohA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6412
Subject: [virtio-comment] RE: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements


> From: Heng Qi <hengqi@linux.alibaba.com>
> Sent: Monday, August 14, 2023 11:49 AM
> > How many groups to use and which priority assign to each is driver's de=
cision.
> > So more than 2 groups is fine and supported by the requirements.
>=20
> Yes, that's what I want to stress too.
>=20
Ok.
> >
> > In Linux net device example, 2 groups seem enough,
>=20
> Sorry I didn't understand this, are you referring to a net device documen=
tation
> or a driver implementation?
>=20
Driver implementation.

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

