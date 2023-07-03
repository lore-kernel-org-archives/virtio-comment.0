Return-Path: <virtio-comment-return-6690-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891B5EB64DC
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 13:06:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EB95F1CA246
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 13:06:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D9424986559
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 13:06:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CD6E9986460; Mon,  3 Jul 2023 13:06:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BC470986471
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Jul 2023 13:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXSmrLxxC/SbrNcBSYxqNLsu/J1JgejV+Vgg/o3weFOs76dJSo2AjV7tBCNQxLUlhizjsGdEdq00AspFzIqnQEYj5PKL2PNwbmYfocshvOKSEoHLLaBTC1tKz7il1P8KuP7J8Sk1Ry62cjTZxa/crQbLL4lR7t4a1F0kCho07/lIQfyOenit+U0UDe/YKmhlhCnhEYRt6HqxQWeKjBedrpWFL3uefRT2kL/UwZT9WYJq3nxEpIlU3Rvi97MfDN2MyRzH+vPb0VJZJTheNvcexvQwV2+dHO6EgsgV+bHhlWhvyQ9ZxYo9T7ua8Rb4L0bkva2oPjIqRa8ql1mVFwxzWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dl+YTAb8PJ+mRsgMy4YjOYDB2WI/jU8f9oVd/GHtZvI=;
 b=W0Lue1kPJhBtoPenfi3IrSbHtR12+jG9f3Fe6bL4K23J75OvgpNZ4uz6PW8qPYVJuKfktK3+0kMsgEWWnR2VTqiHdFJL4+J+AZVQAYDrdWaOkHfIzPlvdZiANPEtCBUmRf3Df6oQIlu7phTdznFvpAaSTdGnI5sf8lsA6jP8oZu2IZKlXM5an/uSYRn++g6j92UiBPNOd0Mzq7bMyGxPw+Wov8IhsTC8S07KtWpR82g8GlrMPCfzP9HucqtG3sz2Z01P+2vpzR+U0unCuhCChvzVKGrXc4zPzLb6wpV0f/7k1tCa/M5ixhTWjWwolzUthB4EdcL2qE2B+qDSIzua7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>
CC: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] About the plan of Admin Queue
Thread-Index:
 AQHZo0OgMaVHGskGLUio/ZFR6jh2f6+TVwYAgA+RFwCABNz3AIAAAtoAgABPh4CAAABE4A==
Date: Mon, 3 Jul 2023 13:06:45 +0000
Message-ID:
 <PH0PR12MB548196D0AC5BE4EE4DB60A65DC29A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
 <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEtNPGneB0E1sVqmpe9fGwMp=_2vmepy3Bm9r=5=5r=ZXQ@mail.gmail.com>
 <1688372430.0519888-1-xuanzhuo@linux.alibaba.com>
 <20230703071106-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230703071106-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ2PR12MB9210:EE_
x-ms-office365-filtering-correlation-id: c05d77dc-a224-49a1-0466-08db7bc65a83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nTKYsEV4S1DOpOlpCCTEvUipkFIg23hlK7gXknnI/7lhoxSK4oq+oTnJT7tv5KRBPxH6+xVL0nj4B+cU+VjcJ3HarNxQwLeR51+FQDNhuTOeXHKaTZJutn0TSligEjJOHYloBYKpiroOaCPoZxJmtEqOApndYY2FtILC93PpZDAQVV3IdeZb3z8LmjJj/msukfYxoKjlHqrYNdEyQZ6o2DhwXS2uGaCaqovxpzF71p/qTb4PqHlnS1FywdVB5s+JSc4yZ/nB46yfuDTnS627RO3Gy/5RljBGAS/1jYsrPVCPuSzvrNJYlfZPj6EoLB07zLj1S6BfKSlZy1TcOzFLX0jLnWku+98YDPtN5PNB+wEa/4nAOhIjUmP2XmwEpJfvNFQBZB53uvJB7W1WiMEm03mafCYWSMMcR02pRN/CVYlEnH2q689m+nH5MABzhH1zxLqJnEnBZ3reSvr6zq9pYSzSVNGnQj2pOEOTvyduU7AQi48VXbP6oZ3jS2+1wKi31rMyh6NM/KgsWr1zolhPriKwiTQPe3QOwf+tfYITeTG7kACIxBnLoLnCYS20kzTDLWN/y6C194f+l8mzcg9supWlfqelVKObt1MA5cobe5O0/H6NEEeJ7dFccbkeJ4i2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(26005)(478600001)(9686003)(71200400001)(6506007)(86362001)(186003)(38100700002)(54906003)(64756008)(4326008)(66556008)(66946007)(66446008)(66476007)(110136005)(7696005)(76116006)(316002)(122000001)(5660300002)(8676002)(8936002)(52536014)(38070700005)(4744005)(41300700001)(2906002)(55016003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MOKvxwuKGqAIkc3g6IfSksA0J38KkFE07Uirc6154Bo90ZW1puPWw221I1v3?=
 =?us-ascii?Q?VK7l7CxuLztKpS4ENk04M+ZJ/1t9qsD7UScjduqP4ib4e6v9NBx6+O7j47TV?=
 =?us-ascii?Q?Foro9QFgvxEAvmYrXzQjb2rVJdI25Hfsyo6PZ/a+zdBucOz/QXAz75MDnur5?=
 =?us-ascii?Q?93cP9+Rl7hJhe2g0aeXtd1dsoqPxHSp7rwdvFg7e2wOlmkhUIoqIBuuUhRqE?=
 =?us-ascii?Q?Ht2H5UoHdOwHYAUCzk+fDTuhaPIRgOnJ8nM6ZeolHwYExeC6fTydnRDZcrEh?=
 =?us-ascii?Q?dbH/vA/lzunWRj1CLNw/rxYdhsqRRrP8jamB7BIODdPh+H+4fN0zMmnlqkjZ?=
 =?us-ascii?Q?uwYM+owYDVT7z5M5c/3pOgDZA42yI2ztHp7Uu2VR6pMmL8zjqiXIG6QP7ePX?=
 =?us-ascii?Q?QRLlw/YfJ/bjbgq/svN4nGeka9yKsm6Nd/rtzLXGVFpalJaBxrBDSPtjQWae?=
 =?us-ascii?Q?LHdO1GmlHmlWwAJGIT3Izq+PPXU6coMIGqOcndq39XaaJPCBMeXZaMPOV9i+?=
 =?us-ascii?Q?kvDqOYe8abLpxefyPEt4DHmUK0TMBQTpVy/6HPcOdBPKxXcDwOA7Z2+9QWsv?=
 =?us-ascii?Q?12A3GOQJR7mYVuNai4vxzflrzMKgZZ3FKLBaRcq1IK1cwig+RMbHU6IabnrM?=
 =?us-ascii?Q?qGiKpgwYBJsJLLQ1h7C+RcPXu622kII/7LOAHmvsVc2o6bIHhUFBfdcyDChG?=
 =?us-ascii?Q?Lur7vaC16XiU8LgrsIniFdgO7eZAJSCaEfpYKaUwmPsQrSul71UbbxSxw2B3?=
 =?us-ascii?Q?XOfPl78a43suD9V6LhXR7iK7rLvXMrsXpXlKieDn/Sj9FR1hlZVAZMXO3HpA?=
 =?us-ascii?Q?SZFFOPNwvbZSUiskd2wNf3qyq3r03y3TUs7qF2TqmLtqCa/RtJ4eo+YekZVx?=
 =?us-ascii?Q?01BQ24y3wj21kHufZoJw8hlFL11D21Hz0uwpTotptqRE8VlBQqwwJMUj8Uuk?=
 =?us-ascii?Q?s4rOzdcaqUZmUJgSZA+LIk/RZ7gjTlP3no9LM5n/nOXqnGZsJS+8T4MR6JAY?=
 =?us-ascii?Q?mgEDEItRTSnTgmUflsvxfDPVUzBIKb5oe2ZuvaqYuIR64QeSnzhxC4+jbdan?=
 =?us-ascii?Q?WiKlCAlsvRNSeN6+EoyvlrbI79ysRlgWRwrYrZvOmY7sqvgwAaEBAfm2q34C?=
 =?us-ascii?Q?lP5zDKmuDfGeUZBaWyeaRPhFydUwrMARaF80ia4k57G42ZzwlrDn2ysXYvEb?=
 =?us-ascii?Q?UHzQHwyH3PSuK/D2dRmJg7QFCrxl2sSxzc3Wat4s4r/ridOaktw2PtUHQnxA?=
 =?us-ascii?Q?ZbZaln2L3LFIT9PcRXIZmWCYJnI6ahmFiyXANdUhfthqxB/Fxw1zTaWttikG?=
 =?us-ascii?Q?TwcC/PrDHgeeomzsGWCbG1k1JIYizKYHpKcbQG4klWeeEpx0/zPT87QZUHZV?=
 =?us-ascii?Q?ktapR4Gqna3hqjOdLYKphm0CNdWjmL9ideJ/kMOtz5WMxaY1RbNXFOFq3O7n?=
 =?us-ascii?Q?fagpy7gckEvk3xqRC7MUqml+8d081d6RHNhX3jcgDn1Ws1fq3fwocPMTzfmI?=
 =?us-ascii?Q?kKWtmounZIvMVUclZFbK2BiGk07CkfjdFeBb+9x3oHxLUP8Ly6gZWa7rv203?=
 =?us-ascii?Q?y8DtxCTdchEfhc0j6KI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c05d77dc-a224-49a1-0466-08db7bc65a83
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2023 13:06:45.5193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XK56dl+NXqQX9/Vauwke96WVZ1ICPCqraY9x3NGv0R5oD9kBN7ay797ifGTO7LH4mECesgaByD3/S12ny4898w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9210
Subject: RE: [virtio-comment] About the plan of Admin Queue



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, July 3, 2023 9:05 AM
>=20
> OK it looks like at least Parav and Jason understand what's going on, may=
be one
> of you can explain:
>
Yet to catch up on the thread today, will be able to respond in few hours.
=20
> 1- there's a management stack that can bind an ID
>   to a group of properties
> 2- the proposed command then binds an ID to a VF
> 3- after this, VF can be assigned to a VM
>=20
> Is this a fair summary?
>=20
> In that case what is gained compared to
> configuring properties on the VF directly?
> Why is not the ID an internal property of the management?
>=20
> --
> MST


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

