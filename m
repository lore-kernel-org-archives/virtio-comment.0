Return-Path: <virtio-comment-return-7153-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8773C001DB
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 12:20:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 04EAF2A82F
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 12:20:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DCD1A9863A5
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 12:20:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C2FC898633F; Tue, 15 Aug 2023 12:20:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B19E398634B;
	Tue, 15 Aug 2023 12:20:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjOqxUQVnaw4jypGRWrjfQYKMoPNFflATDbpDpPs38D0Rdd7Kur83+/ELaI+PJe7uNYi4JcOdTDceUuvM9tfEWXh6oolZGpYuNEn+DXQxKK48ABbiDqGDhUu8lAx9BvNoZeaBQPPk8GVj10eMsrfpSdikfpLmGx07hRNeUswk6sJKLZtKuG9rbdEqWX6YvSgr0GAmGE+aQVSqu9KXn05D87EQXxMS+b6jmVnZgNaldyiK07W3NDDvBEMMEYykxPsPBEEDFHnHp5D3ZpDA+UYv+bs+ihNvFAHbu5cU1ukw17PAZZ/pBOjGRHK7LfEnU83K9NKCDNbW2Sil6hYsFzxvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gg3BrXIYNz4IdLGefuLEWXf/Py60iz8hz/vYPIsMs34=;
 b=JeyhgVbstJQlexvo/TVfAkdZc0WuQ1a7ZOAMk02vv3Gr2UnZCpO2cka2WbVH5Aw9a2JrN3D2ZErVgLztFuFXoqh1UuhdB8nR4IKmXm9QAWnfDj8YwuG6q8BK2RyRQw79y2z7P94Txo24b4DgfvJQU3VAQtg5cOXkCoLgQOi6mc9wCEC3DLA7KWRFyHicOakWj9L9jd0AjDO4H0EKBzTIMkxMZhHcjDg5FT4hbt1PPoYMGQgyRduSlizwOQ1lphtxJu+lHyhZJO2z5qAfYCltPgVtXB1UDWlOKd88wc4a8ATyIY0xobm681FlWEACHsvJCy/d7Kczw0StKW87xINP/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: David Edmondson <david.edmondson@oracle.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements v4 1/7] net-features: Add
 requirements document for release 1.4
Thread-Index: AQHZz0yYa9FZQ1mufk6JJ+9Y+UBTl6/rDhuAgAACr1CAAAJigIAAM2Xg
Date: Tue, 15 Aug 2023 12:20:49 +0000
Message-ID:
 <PH0PR12MB5481DE2F8F26947EFD224AF6DC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-2-parav@nvidia.com> <m2pm3o65rb.fsf@oracle.com>
 <PH0PR12MB54817DE0F0C993C548982279DC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <m2leec64zu.fsf@oracle.com>
In-Reply-To: <m2leec64zu.fsf@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN2PR12MB4256:EE_
x-ms-office365-filtering-correlation-id: f7dd3184-5ee7-45f3-e261-08db9d8a0f7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DwuNH5TcDzR+6JduJ3II+XmvaQWoc1wmBkXS2GQV+wRvtCuDNYdsg7hvvnkCGCk4tfVSZaEpd8XY54uaJtvJDISRB93632hNOKc5gdKU1HycpKtdHHv3uI8kuHuABDhrcBPbfhaFGUGxW4i+8f4caSYbDdpxwVVYi0P1EDri4WFlrlsTuvMIcndJSqX0NeYFjI0WRnhLSD0VzVD8BfEfuqmNQ1Y79cXAQD/3D5C05SxfX3UZq+/+XK7lrWdKovJiEaMK9EhOY/cDrxi8uwGe8Wm0xf9gu2bjuDTU4q97yt5ZMGB0SBnN7lEdeTGRtGamfPQ06QtcH/GKKizCIWEVkWWv25UkEUFetUOdaf4/vRyGgrMLJDRu6nhEjqoqXnLZm4O6CHvrV8b8kWp1Lcec078zcaFMfHK5Ow5ReXJAj+JIP3MeAzM9vI55wVL4K9NaDwnBVi65sQ3vrgolo4VyFHKWHzfbdS9AbjFgdRY9egYDgjwJeAMDMLRi6DTWnISou3y0DNM3C9XDOYn7drFX8P2Bp1ID02DKH9LTMn4c/6yG1gMCQgxqwdmca9JrmGeS2n4WFl5ZpjRpkA6tfSE37UO9xs/MDcGaVTCPMRZ7xoYoO1PP8I1tIWShu7U+sGKw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199024)(1800799009)(186009)(9686003)(7696005)(71200400001)(38070700005)(122000001)(38100700002)(54906003)(66446008)(64756008)(55016003)(6506007)(316002)(76116006)(66946007)(5660300002)(86362001)(33656002)(478600001)(52536014)(8676002)(4326008)(8936002)(83380400001)(6916009)(41300700001)(66476007)(66556008)(2906002)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uTNYpTIv8pNmiaWAPVB6QmtGSxIAeB8PCqP0sbuikCpjwFH8THx+lLd7MJ7d?=
 =?us-ascii?Q?kkCC/h8zqtTYAkvtpp5x+HdXx9kVXROYRqLwyhewr+4ubQjhYDoq19JZ8MNF?=
 =?us-ascii?Q?CJKm131375jXhuyCmYE7LGba+wC2VsOlrAe51R7rbrjvyMuDRgQfbtHO5NSj?=
 =?us-ascii?Q?6OMXV1/7k1HGZjrNR0qWH7UN5xHxJd1hG4wDegkq5NU0BEBbazASZDxjJeV6?=
 =?us-ascii?Q?1bA7w2630eRibvpqgV7z6RV39A/VjRzSCdDagm25110ArIUoNiK/aHofM0nr?=
 =?us-ascii?Q?oPFY+0EoVclRYNLWxGhiCvA2jKgi3qO9+5BelI2ZIx9v2Mcri4Y+0gt/v9JM?=
 =?us-ascii?Q?qB+y++gbWRq6mhKuBoUDNd/GxqWfz7Emv07XYuIAAzv5LdyVWjgbLQ3CDkJn?=
 =?us-ascii?Q?vT2JukbkLW7sBrKzM+e4xm8p2xXC3bhrkKC6wDyg1Q9vMgZy2Jk3AkqdxInK?=
 =?us-ascii?Q?nxOK7Y66+w/OabOflOMNdgmXQyQTKwSCDGXmaPtpJ5b8cf5K0HXehDIZ5wD0?=
 =?us-ascii?Q?ckarIJshayGF0lov+wpVdr+YM4wwiUMAZ6VyqwYr7sNXX014hQQoGm7R+7vk?=
 =?us-ascii?Q?VXF35ZMqpB6QewJyWcP5594i6oaWzOpfBOSdnCb3tJ07BkTWYZWXDn3J/pPK?=
 =?us-ascii?Q?wyEStK8U1BxIGRK9XqvTiohsXGzPSymS4+glc04+2bjnZxPxCXTLyKZpOIUS?=
 =?us-ascii?Q?++EQGtDt7DT5RuReo2cgTbskYEw2eKA8ERDKzDg/g4dNClz3zN4eYI1jEqkL?=
 =?us-ascii?Q?GiUS+d1g2kxmi/fVdhYdW86wDcoIHOnO+qZBEClyVDvdCocORA2nzVUmG+w9?=
 =?us-ascii?Q?FXaSIHvXzR1WNs5ZA65QDQch9xJBduaopjKBfd8uaDxItXrkANjT4+S/yHGQ?=
 =?us-ascii?Q?uqgKlZZ9E8EpPE8lAcff4z2VKCxrw/230qecz6Ya8pKW8Iwg4Gs43FK2Qgpx?=
 =?us-ascii?Q?8IfxJjiI9o30CPDt1f7p88K7ZfAuaNh/Tf+T3ZFZ8j6HddC2AZT1/fQpTVCv?=
 =?us-ascii?Q?xiCRwnPdCCntu+k5xLXCm8+q0BbWJgMRZBeEGRy/iDXlBBWxVydw6Wtky7ni?=
 =?us-ascii?Q?6HDyIfiQwnIVZf/CQ92S9wpcFA95zDPbH7DGE4vnzhwg9q5aS1Nz1DFcShWR?=
 =?us-ascii?Q?veBavdPFoemnxm2aSoJVO7uzvWUUceCvCBAc52qbw2cI2XYdJ4z6g5kqXEbu?=
 =?us-ascii?Q?i5nHpGM5BiTZJ286zHJ7U14WMLrjsgkdZhIQLXtZoBeiTNOQhqR3IjBB5fKN?=
 =?us-ascii?Q?h2u1FchLNOL/q1+cloXtTUyVLoAesUj0hc2wSpl/uKyZg/9kM8oo9N+Lw26z?=
 =?us-ascii?Q?+jNrMT6Yb71DZOd9Fo9rndMdNu7tu76/wTtG1YQJ8koO0cPNjP8LavmVxOXq?=
 =?us-ascii?Q?3bU2GCQkSI5fl9tSDqsU7zxNysfsfeNB4SyUjfV6a5x/vt5HuIq/j3kRw0NO?=
 =?us-ascii?Q?IcNuX9RFBigJFxDsNFKQi7VOtKAhvgqxIgHedNtFe9sWav7ISFebySip43Ci?=
 =?us-ascii?Q?A609YN6Bz0IlP/GTBu7A4pL7/2G6+U7ZYix5Tl1OXYvev4sK3x2L6GtsIA87?=
 =?us-ascii?Q?f10k1+NaNBv1a9H+GcUfY71uV2LfJGIF+HRh/yHgRrc+vfIBWLGXVknO/M3n?=
 =?us-ascii?Q?Ur9vqfo4jTvw/abwvK/VD41OtbA5MoX0gP6d005ymJXq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7dd3184-5ee7-45f3-e261-08db9d8a0f7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 12:20:49.3619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qwpNdG6zFOG8F9S87W2xWLXwEvm4EThNWel9xOw+XakMr3TsdP5+58A9XblHx05lZ+0ZNf3pbz/At8DR2iOmBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4256
Subject: RE: [virtio-comment] [PATCH requirements v4 1/7] net-features: Add
 requirements document for release 1.4


> From: David Edmondson <david.edmondson@oracle.com>
> Sent: Tuesday, August 15, 2023 2:44 PM

> >
> > If a virtio device is a group member device, it must be possible to que=
ry
> supported counters bitmap through the group owner device.
> > The group owner driver should be able to query such bitmap using
> administration command.
> >
> > Notice that group owner only cares for the supported bitmap, no need to
> query the counters through this interface.
>=20
> Why do we think this is the case? It would be useful for a group owner to=
 be
> able to see the statistics as they are being reported to the member consu=
mer.
>=20
I agree, it is useful.=20
For LM scenario, ability to query supported bit is minimum needed, actual c=
ounters is nice to have.
Usually the actual counters are located where the switch is located.

> > With this we can reuse single structure across AQ and CVQ to learn abou=
t
> supported bitmap in v14 patch from Xuan.
>=20
> Makes sense.
> --
> I'm not living in the real world, no more, no more.

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

