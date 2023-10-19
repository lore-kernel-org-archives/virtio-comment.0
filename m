Return-Path: <virtio-comment-return-7858-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE816CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:41:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 234E088E0C
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:41:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 095BF9868E0
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:41:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EC0519868D8; Thu, 19 Oct 2023 09:41:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DD3C49868D9
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 09:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tor0BEEys8dn1gjewk4ax1g8HMraf4B8W4dZPVfGAl/DhPorGNeFdWCS6AYCaOoRzimM3A+98A1gCKmHXWC+pib7+Q0Kkx1ipMnWesEDugD0rTclvZOxJhUnsnBeb5OOQpxjjhwsae1XbMZ3LZclXu2YDzP9g/Ji2KwadkQSbL9RB6i82/ZjdLFUdJ5SjLDoEGedELo3Mkc5j3tN8jORVepd+SWeDip9buNN+1F4rUEdrT/zGHIVc+hPo4woQ3aLP+tp3RsguHnTDN0Fm+cqf98H2VNMHkAjBgxGTxXZdtF51LstsE+j87Dx6T4rZ0Lwap7LqtHzbeNDA80gANSD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaAMEnjtQISbckZWtBVlfCzTt5I5fOwp+LF3MuuIJdo=;
 b=m+8MlFYjPQdc1oP6lGwvu+XKnQqw2wdGRbN7M2nagyOmFLMmyxKZBwa/a3iuM5Dr1142pPuqcK8IS/z1ur6D3HZKyTGClLQVXm7CJ9qPv4gaEQA40PzbrGZH/ZU8spU8YIM7S7YUlEpXy3dv186ayPypAEaSD5ta/fJbKBmk2+u5XMlkhEgkmsh+uu7xBAgmkvM607ti2mvmaO8DqNj6wDfQZfaVzGSqoVnSbXAjPedayLaF9lbNXvPWKt2/HKbnHDu43ui9dyhQUi+B7rcJuJJPXHQkqtk7KbEvbDg8cwOBo8AhCOwyUbRR+WaXRm4m7u88J+FMioGfN2Gg5fbxzQ==
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
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCAABMfAIAAAMfQgAAfqwCAAAPbEIAAB1IAgAABSRCAAAMRAIAAAcwAgAACEDA=
Date: Thu, 19 Oct 2023 09:41:46 +0000
Message-ID:
 <PH0PR12MB5481C638743682F55F11BA28DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019020413-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810A5AA248384392FC8169DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019041629-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481373C657AE3EFA123D1C4DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019050553-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819E1EAA41F3CAE420942ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019052328-mutt-send-email-mst@kernel.org>
 <20231019052725-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231019052725-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW4PR12MB6875:EE_
x-ms-office365-filtering-correlation-id: 7d1b4d3e-3c78-445b-12af-08dbd0879c5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sYARdUU62NOuiMzG95HvNPrASpUeqrXK4IynWXjsTHrYzcD60vVz3zEpaZq6wqfOtcTbN+Q6n36v7iZzuRZZF6VE0ECniEkwIkoHONzs7mxGjx8Q1sDIcqACyoblHevbPrCV3Y9ZkiCphQuaha9SW+DPC/qZ2w0aUpkSpUQRStiuK2nZmnRAFW2OoOizroOFeUYhgfwHw0k02n6Sz33G/XK5uWX/AFFhe0u9B0+25Qsfcxle1Cxd5GLM1KqVYby3WlafM6HYsC+/e5cE0tUU8Ej2l58ZKaYnCTqG31DlpdJWa3W6Cfp20C4/5pdzgRH9ooBF6Dx5iPkzxXPfLpx3mZ67xv8JNjBGuRMlLhfGYqEoP1ulfg+Xeaa8+nsnJKI48ZJbjcs72W6JAgP5bt2HU4hW1Nt1FNKvJCQlc+7vquF6c3dPgpUhehTPPCtqOGrH7SYlYugzv9G4uatzycEDe5Mu3+zgTDcOIYdNrb+sd/agZEP6iIuSzZbc0llGTb0oimAigBuYs0Yyl6/OWJYOMP4yAhsYWM4BiKQwzpVH9fVgy6bPuIotc8O6RVkho7J5+GOXj5WmSIWcg31WO0OT7Wq0UuEC5BeI+lTaYrnxKwsxfyDh/w/5DVrpvhWq++yX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(55016003)(38100700002)(52536014)(5660300002)(316002)(76116006)(4326008)(8676002)(66946007)(86362001)(2906002)(71200400001)(41300700001)(8936002)(4744005)(6916009)(55236004)(7696005)(6506007)(54906003)(64756008)(66446008)(66476007)(66556008)(38070700005)(9686003)(122000001)(26005)(107886003)(83380400001)(33656002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RfoTaQmAtOlnOkJsX/Fz2rBi9D5bx+KLW5FfmLrMFJnum4qoi9KElEE1NM3w?=
 =?us-ascii?Q?/oCJO2s3JCzXsfeAdNDXtY2gzgTYzhGHv6gAh9BgGGs00NqUAqYHZcTLeCRQ?=
 =?us-ascii?Q?O9Ysi9TaiJIPivflVj0HCwrwRi84UHlIYDT5X0+bE8NLxq/oWjc+rr/9Z4sS?=
 =?us-ascii?Q?RzZlYvEHGzJiAv0Zk48q4hYx2y8WqN/+LimBrFCXpH/+0J9kiluxPC4eC73O?=
 =?us-ascii?Q?UQcej0VRLJb14Q16kahFFykmXLgDCZXK3hqfgj+8chARIqHZEW/17h4G2gFz?=
 =?us-ascii?Q?d6D8X58g2cuip/C9JAGoPkfWRunn87j2g5gMO+P7D3DzwAVQ9zXGd/eJM3C/?=
 =?us-ascii?Q?Maq84zEG4n9BUIIgjzFbLwO2UZrI10yYU5NrF3hUpkrxgyjNIRYw6XNtHmob?=
 =?us-ascii?Q?1uTqq/8TVq0eSarxscYWc26CKODmZf5BA5CeF464G+wqL/9mbEjDaS1ocEal?=
 =?us-ascii?Q?uiVThJ8z9tudOP90JYjtCVis1h0lLKI8pXbJfu+xmrvSLsJeG0ZI3FtY6sfp?=
 =?us-ascii?Q?jyX9IGnpoOsvaBQxuoMVYw6ZCZC5uqzSL5DhPH6X3xTlyW3i1o7B6QJqJDpU?=
 =?us-ascii?Q?aKApPap1AiG6PEFPyW/1pw1QYPKrmTQARyl116QMAtHyKnq8kSi2TTPEuGJy?=
 =?us-ascii?Q?dq8BRqsDqqxaR2GL8zD9EgDV9MK+Fr0SDI0dLR9JDgmPOhP86dOsN0cpPbz0?=
 =?us-ascii?Q?/LlOFNbDt05/I0r2mcyj1kZ4R58B0/xaQTC4KyOlc9L47Xh+M97/ayi7IGtj?=
 =?us-ascii?Q?lPTSfICmVUxN5uHJIUvmu6YhRJRlOqniiEC51psCesy2mkn9i2YxW75W0Wzm?=
 =?us-ascii?Q?/5x3yE4H2V704PTrd2XBVCZUk4V5Ls7Q2FBqLm5qul7EHFnlfLL1pUZLUj2T?=
 =?us-ascii?Q?3BFbTiFgKfXlB3Opo7kSZ9DfRHJ0+YCdeddKuRkBP1l/vmcQ5SOeR06iJRWm?=
 =?us-ascii?Q?u7SYo9umz5Qxw56G1B1bb3EgKghLHLsb6PshYvhNT/4hazTbppjSUs+1vNlG?=
 =?us-ascii?Q?mn3ftdelo4uFyi8IlKY9UnvSGIuyGtOMna6xc4jGp7Kmz+wVUJga11tFWTeB?=
 =?us-ascii?Q?bKfkJsYqe4VlAk48d9ka5qL1inLoRgwm/Zi1V9dfX/zfOoLinzGMMeGTjBg2?=
 =?us-ascii?Q?zvlBdC67LLwpwm+ycKKzV4agcZDzWdYDNBb+GQaUm8pgKtKG7OUzplG73M8e?=
 =?us-ascii?Q?UiiPYgaL2sU+sAUNNzW5vAnYtGQFzpmWaB/fNHxND7dl3MSRk8iYDh1RuGgX?=
 =?us-ascii?Q?TAJWhNcxHhNbeHWUJS7Qz3fkhpqVXCmBXrPa9LF1F8C6vOusO8M+x6Y3Mkmz?=
 =?us-ascii?Q?0tiBVTMAKm6QYG91UCfegdLGup6P/8a8hh/VHgV6Icru9tDdlMdc4D3VSzil?=
 =?us-ascii?Q?llmgr34qVdml6IZjVsFeGeQxgmBQMeolqqOwnLxZpSuqf94eWt0bFy2X9y/f?=
 =?us-ascii?Q?ZWq/hCb6SQxRQyd/N1uK0MTqOkXd4qUfwSrvoQ7LHBNhZB+IKnHbG8+mtGun?=
 =?us-ascii?Q?2GmNRX/NChZsgJprPmImNWG3Yx/v3YDcTZWhMdBbE+YZwlvx0EKySKaQAO+g?=
 =?us-ascii?Q?ov39Mipx6t36yoiE6a0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1b4d3e-3c78-445b-12af-08dbd0879c5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 09:41:46.5104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a11usEEj9JOHMdJBqHcvu07v5Z91zOJzCILk4fDO6JE+Qy7ADUXw2wFOQ5HPnEjaq+IqLVIM5JxeS/r1OWzu4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6875
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, October 19, 2023 3:03 PM
> > > > With a capability you can discover it without poking at features.
> > > >
> > > It is discouraged by pci spec.
> > > Pci caps for mostly doing very small init time sort of config.
> > > Not to run frequent commands.
> >
> > Interesting. where in the spec exactly?
>=20
> And the reason I ask is because I'd like to understand the exact limitati=
on.
>=20
> In any case, we should still maybe look for ways to separate it from conf=
ig.
> Maybe a capability points at a BAR and that is where we have this stuff?
>=20
Yes, I replied in your previous email, a similar suggestion.
Lets first agree that it is drafted for non-passthrough mode.

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

