Return-Path: <virtio-comment-return-7092-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3600C001B0
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 13:06:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 37DFF120D57
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 13:06:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 310699863AC
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 13:06:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 26FDF983F78; Mon, 14 Aug 2023 13:06:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 15E4298633D;
	Mon, 14 Aug 2023 13:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1AinX9io/sL2wNJzUNdDKYmc17XOLDEpSVoek0WQqd71vInD9pZI1FNd+RI3rT7EHzfRZkMGEB0vzrkE4s1iqXPeiRo/lzO0UZkTQvE7lZEvLJ+ZWqh9Z5LaBRSqKVDt7CTToJQOuulOUZpjq/AMpdrOgVOklvUJ4gW9THkCZhWEboOi1KZMxQZ5CD2mWuWYOUZ9kXKDLYCzpsvzucsdtOZD4HonVu8EZncq2NfvOjZC+hVpoTCkFIZcP8G29wyf+Q8Q+VOZ219GlmL9rs4ZVCZKN1NMOFMFSmNruqCgbO6jTA3/+TT4EKEymDFWJ4+YDAF+56o1gR6yqX3tCm0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlmc4Oq1ZvEn/Ke+cQtaiECIyrtTiz//FQFzJpnrGw0=;
 b=Wbpotq1C1wklOOjVyVoSpvz6qbVTrJmvo7INzVKAdoZDZ1pPjcD2dEukT7fQPuTtgCMxA5k712vSij40qhmADnjUn80giPnS7guXMclcH8vrCepFwREe7zQGYnWDqcmcl+2WV7bLOQv/05HXbV7NknlNp95Z3y2Q2V5ffqeWRJrjhWSsGoAUxXPi/fDCu0W5Wd4G9kN8WQjIt03znKIQs3XDqfNu06naxZEKz+13Gu7PmiHHreg21fvJ2G0JuH4iubGKM2NwpgNLZ7mlyyuXkmb60NVopZHc2slrXFMhfz2i3urhWrtmlsW3mnnDlIMfwkp6ui6skwvOj5+qBjF5sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio] [PATCH requirements 6/7] net-features: Add packet
 timestamp requirements
Thread-Index: AQHZvd/P0UZ+85qNOEywdrF+BteiUK/hvTGAgAgmroA=
Date: Mon, 14 Aug 2023 13:06:03 +0000
Message-ID:
 <PH0PR12MB548163BBE78CF4E43EF6806FDC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-7-parav@nvidia.com>
 <1691570137.0487022-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1691570137.0487022-1-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB8150:EE_
x-ms-office365-filtering-correlation-id: 9bce30b6-e9e1-4995-a5a1-08db9cc73704
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6EAMNms7fh9KKZHj+w/AoZVEeoVItTdc7TRi5NkAHVsouG4If87Ko8ihsZ521OWkcCTFgzeNBmlK6zh0IF32RpzP3D8VejpnZA9WNK7vhRTQyFwRYZkpPTWeonabBfNYmm6rWyPZ2xLvQEK7SE1dhUYQdh5HyqjB0Gf5lq4PhcS/aiTtNtcOLiiARWM7oB13vgNuFGs6M9+5OA3rR4ZEfgDiyOVsdaYMOtIEd6aJu+0xZ5LR+55T+HxlMHfCEoNRpbQvqnvey0LYnv5wv3nxMtylAmZPzFzOlgqjOb/Pw2KMxp/RQC3PxL5j5KtwdXW8gDwIreRntukVag9EMqWFHbwoK4cA0BBgDQxuIfpjIZURj6v8yRyV52sCSKPoQ+6ACIDnCUSry7mR1kROX6fS6wyUX5hMFE54jfq2avN097/EqYE6Wd1afnQqVFy3m5rwmOpgJAFJXx8mzYmB98WZTOQayuSjOSKoNFMDnQznUp9qldxCZOEOEEmONmizWb+hQckYe3Qtqaj9FWmOnpPYB/rOXMITri9hnNICOCss1ghC7kPnzSpMGOO8jkMF0oefdKXySWeT38JvepK1y04IvusIpOJ6vyFmGS/lJ8kMtOIRwc0xYTf5S9uasgacXf6s
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(39860400002)(366004)(396003)(186006)(451199021)(1800799006)(66946007)(66556008)(64756008)(66476007)(6916009)(66446008)(76116006)(54906003)(316002)(41300700001)(8936002)(8676002)(52536014)(5660300002)(478600001)(71200400001)(2906002)(4744005)(9686003)(6506007)(83380400001)(26005)(7696005)(4326008)(55016003)(38070700005)(122000001)(38100700002)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4b56Q9IJjaNdj1KjaDFbbwndyXKIHsOjrctVtnTmZW2LJP8x4BB8lgk2D6Jo?=
 =?us-ascii?Q?iAldf1cPtlsXUzt6ILQasiBphu02bM9x4bGd9RWq3xMcXcaBd1wDD98/iqWk?=
 =?us-ascii?Q?vFZOpfiiYX1cgvsneKMwMU1S0b3F1QG7Broh+4KvLu2gmG4gGKbqJmG1MF7r?=
 =?us-ascii?Q?U4x6tEoMtjqSsi+gut+OO04JnHDpVVeyahLagDQTjQedKuNBKZnY2fD16Ciy?=
 =?us-ascii?Q?sCm/X9KgLZJxE165f8ZpHnDyw30aoNY8nOvtUs4p0XaRFhty/Y3EMjPEtpbY?=
 =?us-ascii?Q?DWWVS1KWec8jPSWudWbZLFvWPFF2CuecAxabtBdjfDbfdEY1mqGx0fG8TB1/?=
 =?us-ascii?Q?mm0nAE5W3bviK+woDLon8XF+6sgyxo44F0X/Vv80HwY16S71MGZ52WYjO9Kw?=
 =?us-ascii?Q?okhIgBZ9jjAe2FxX+RS/f1CBmNDbonouq4Ghnok9WER5iW/t/zp6zI5u3ANr?=
 =?us-ascii?Q?SoY5ie20vaa1Oqw/2lKo0N0Rn1kH24rZfS+y1+M8epM9BkyC8Fj9x3G71yan?=
 =?us-ascii?Q?nf8tdk5AfRC+GYu/GI/eJtnlhNhGXuXPdnm4IPjbnOmSAy4QPm8SILlznK+S?=
 =?us-ascii?Q?90T4D334ErkQxf5WWSk30elusYRN3deK58jYXLHiQezaGi1hevmqCA9AmUE0?=
 =?us-ascii?Q?sRPjq/H9NxHwz3xwnvkseuKwLzIJATpr1X93NmbJdYtVOv4xYFwTKSNo8RRB?=
 =?us-ascii?Q?nJHpC3SHjbvbIHLuo6KDFOthNmNR0Oq5M5haQHStb10t0IAPzFulWETvBqEn?=
 =?us-ascii?Q?c8IY9ledqIaXdTIwb07jAXhbFk15xa0nyIcxfJvqvuMucbgqZUj+4Kp4+/wR?=
 =?us-ascii?Q?8XStb7ssvmcf8Vu8BO4+3N+XYtfZqhEGJD/vbL9ZHNb6effMEzvdERxC93v2?=
 =?us-ascii?Q?C/xJePxPu1fFIX0eobjcEnde6trXcxtcq3lTeUfm/plFOamvsAmiSzlt5joZ?=
 =?us-ascii?Q?F+wagC7xYWs3EXgIpSEqdl9bsDXNLngae1wiEbm/Houk12XDErF8rJ8nz/Ao?=
 =?us-ascii?Q?W5rMuYCmhO5BoUbCpRgqLHJl71sbMZOvd71RseOWeJQ/9tQr79Ri21e9uhpf?=
 =?us-ascii?Q?/yMgJwrTC+NzWkCPfJq4ZXwEAi51K/fjhOzC9W3Tn1+9X20HdNeJIGdPcFtT?=
 =?us-ascii?Q?irARnUIJQk/NV/FUNp4MwqiP6lzBxvQ1pofPtdVMBSulF3qLfTarO8uikmHc?=
 =?us-ascii?Q?clZZDvs3wf0hSwMI0VvKmcnkUwK7QTh1PuYqhaQXJVY/hU3kIT58XhCiCLXO?=
 =?us-ascii?Q?D9jHA/NGhi9nc1xZBkgcJEWGohm63XO3TcJZAu4UsrCaD3XpvvJobxvXURbW?=
 =?us-ascii?Q?1jMUcCkYdZniCI0kSZ0YXbOc/pAxIU1YwOZXLWG/V3CbGuBTCRookdEmCDkA?=
 =?us-ascii?Q?YFvXhJSI180tUSkyPEdH/V8IMXYvyBOBv/iLUZEOmvmgbJ1HKQzvAW13KhBP?=
 =?us-ascii?Q?OqjaZmrMGyfApWR3ak7LryiyllGQE8u5RZ8uuIXpLNmVh/mYVePt+/Kq6fBz?=
 =?us-ascii?Q?d9VRQCrS22IS0hxq+USfw70P3KvlqZVXUq5Qhe3bV5u1ETpbOms8UXfiHwSl?=
 =?us-ascii?Q?mdKGGYe+y3o4vjbY1q4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bce30b6-e9e1-4995-a5a1-08db9cc73704
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 13:06:03.8046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ndE/oX4qjoXJOVyfeRnBmxFtgekS9hNVYVH3rxitU2pzBDPw9YjJpghdEQJOjIqPyh5hLquO16bmXv/9MOWBYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8150
Subject: [virtio-comment] RE: [virtio] [PATCH requirements 6/7] net-features: Add packet
 timestamp requirements



> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Wednesday, August 9, 2023 2:06 PM
>  struct vring_used_elem {
>  	/* Index of start of used descriptor chain. */
>  	__virtio32 id;
>  	/* Total length of the descriptor chain which was used (written to) */
>  	__virtio32 len;
>=20
> +	__virtio64 timestamp;
>  };
>=20
>=20
> Then, the existing devices can support this easily. If we introduce this =
by the
> new desc structure, we can foresee that this function will not be impleme=
nted
> by many existing machines. But this function is useful. So we want suppor=
t this
> by a simple way.

This only works for split q.
Packed q needs yet another format.
And even after that we still have to live with other limitations listed in =
other requirements.

Therefore its better to do the new desc definition one time which enables t=
o optionally support timestamp, using single descriptor format.

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

