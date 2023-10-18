Return-Path: <virtio-comment-return-7809-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4672CDB482
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:33:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C8A3E1A672F
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:33:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A166E9868A5
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:33:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 948D4986898; Wed, 18 Oct 2023 10:33:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 87410986899
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 10:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLfvTBFQ63gKt7VwXbfoxevlIuQNJscUX9VWoOo4DCrijodR4ziB1gARxowAPOWbQc7EByptOuMSSxQl+nku4AUjO0U0u8wk5s79O2E5v85doLfE9wJeDq6BKyaKoXFpZ3pP4qUWuN4qztzmBpExUu5DaA/VZFYf9H62faAY7k+GTlvaBNTjwmg+I8y/KBiJ5JYaaikKzkFnoepvpyCKM9mCVxo+einv07Oqj3p3G9qlmHU3cH8GfNb2X//xRQDMTM2xnBCSivvD9g7GsD2sok9RM2jPrrPXPO3Vw23/sID+6W1yU2J/6LfW6LyopBrFNsYLkCUF/Q9JxpmYQaOG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cv7/mmlVFsdwKE7ZsjkSBeEYc9FGua8A4Ryc+ciRdXI=;
 b=mxxY77ngbFGZc/Bjj8rFek+43bhv5QIuesr+YdEMX26pxgSDclUzH60NyRtCgrdoBzrZIBEWkTkbzFt0haUF3Tr4JeLreCkrfh7CDdaI2E34ZAoJCEJuAxE9i/cI6iFEIiPybq3o63RmtQcu/4ZOc80fjoy0CaS1OcNe5vTW+jhURbKG+13CNk+9Is3874m4ZQRKqh/kBo3XM4IAi8sqdENt3vOcQpN1PEvPnrMZ3gQMznmFsXWegv82WsOZ33XyaG4lwIleQaPhbl8aNLcx6188RwXV6U6w5YPyoTwp8ZaNp3U1NIlCu/wTMvKCNyqFGfrwcuZEykLEojOXx23p1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAAHNXCAAVl+AIAABSzAgAFhOwCAAAW5UIAC/cWAgAAsnSCABiQaAIAB1DtQgABOuYCAAANrEA==
Date: Wed, 18 Oct 2023 10:33:27 +0000
Message-ID:
 <PH0PR12MB54819A0061621A1A940B01D6DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB548029E1AAB8529339D22D4DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEswD2XLjRNzyqo9M-yT77PsOJqJmDLxSKd2ZOgqLYjjZQ@mail.gmail.com>
 <PH0PR12MB548143D2AB83CA90E7F1C9D6DCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsk7ZgmWuqm9U_Tych8+Ceu7X9RymQASeSS_ayB2PGTgg@mail.gmail.com>
 <PH0PR12MB54817B050D97CC7123DE30ECDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEux-kXQ=d_6CVyfhNit4TMJ=V1p8C6XRDXhCLAJDD5kRA@mail.gmail.com>
 <PH0PR12MB5481CD04EF5122C041D63CCDDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEustM=iejjJhGz0DW1iT9qJpha4zLbMJ-cVO2VU4Kq2Kg@mail.gmail.com>
 <PH0PR12MB5481FD2FAFC2C58AE0E9A58BDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018061343-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231018061343-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BY5PR12MB4227:EE_
x-ms-office365-filtering-correlation-id: 75bcc3ef-4dd1-4f2b-4127-08dbcfc5aa33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +yg505K6dmQWPSHeL3M/+cN2XiJmJkihPzJM+2CU/yy9HKBw/HQ31yo7PB/3NJvKm4vku/6PNxqsl7XbmEbkKm3RVYUHJJqXN+SV2CRE023l8wHMXGrpzAPNwNdh2bG9KzBon7E4D63M7gL5BboqC3+o48/f+a0UP6VlosJozrrUnHjdzZwlLcGMemuf1IQkoEZ6NBbWDsNM7CXMOxw75vncT/rdgLU4o5R4yZa2SLHSQJeA7+M9pD4lc24KwjzolY+dqZs7MhF1fKhNgcuo9W0f2ASsBkrA7iXc/vIsXEzPJW7QssUFtXpbEfbou1ulNltvywV5UvWwD09ft8+i63YKC6uu0g+E+PR9NIGBd9zTxKNjjjKbCxMWW990wJIVzKFcHID/qLhG/eORbACBTtUp0mV1mZWmCjirKgi/A8mx9/09J1BHAKXap3KLvKmCbyI3utwuxT0Vvzr/JpcNZYQk7u6s+Z4k5HWRgohhrZgXIhEyP0cer4m+rnMAu9N3ZgOx6I8zvnKf0NJbpsnfG0qrUV0B5AUDPHOS2Rs+TFdId6wQNRCAjM3uXjvoSv6z/WKevrElTRHyxUZhhfjlsbPU6ddlLXGs9FagvcV58xoHSG3gIhWpXkpX31ZePgbA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(366004)(346002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2906002)(7696005)(83380400001)(26005)(38070700005)(71200400001)(122000001)(33656002)(86362001)(55016003)(38100700002)(478600001)(9686003)(66556008)(8936002)(8676002)(41300700001)(6916009)(54906003)(64756008)(5660300002)(66476007)(52536014)(66446008)(4326008)(76116006)(6506007)(66946007)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eIulgc5jwsA+IY3zmuA8zLMK/EqUh+aqIIUrYwZmhRqXgD63z5qXOBkcQDRa?=
 =?us-ascii?Q?fqPr2iCwYZQgGW5btOq4Smzml0c+RvIV0KcIwXUzeTrf/GyYDijx5f2bTePE?=
 =?us-ascii?Q?r4Ny5SabdUMZpbVLNzwqpJ7ghDEOJfa8vTxSCm7SJstqKKmdJp8HdJF5nlXE?=
 =?us-ascii?Q?jcERwsc3vSE60OmD0QdO9vmqkd6H4bxcKNF+2BR8S5ihDKmqhGTrrFc88QNd?=
 =?us-ascii?Q?HQiAA4J0tm9ajr44xsfJVq6TCoC42ngAgMgdtyvBw8Ohnt0VEEhv5LKDHhJ3?=
 =?us-ascii?Q?+apK7vuXc2QF2cthSqIz2UbDPoOhYG5vPmtUfA1w/PzWNmRo/jiwflGGE594?=
 =?us-ascii?Q?sOxKwp+/yMn2OrtMOKrV8FExI86aFtmTcSw73JeO+ej0+V/L172IiiuuIMFQ?=
 =?us-ascii?Q?wB1/T62s8NrQnOIq2G76glBgGerZv+ilNeNsABoyW4+Vcy03VQlXix6pwotr?=
 =?us-ascii?Q?00e+MQynrEJyxXdKrAeJOqWTUolsBDfQ0SLjx6mtpQlUBfsH9dCzzCZyx+L8?=
 =?us-ascii?Q?ezCRzaL06/tu5hJkwxLo/LtiXbQy2CSwYJogoZTv598hSryDmKExxMMTR15j?=
 =?us-ascii?Q?MD4TlRASIhDXXlBgbckVV8yDfymp3H+is3nMJNQ5yyVcag/CLTlq3ursY5RT?=
 =?us-ascii?Q?F9mEX6KX8A1CKpoFPjXeaDrKb0gn1zO+2Nv3fFimtvLwsZ2mFravnqlkzy4/?=
 =?us-ascii?Q?wQcedURiKf61Do6WBhtU/CgpgxIWxah9cL7BMMmiPfsS1slYz3YzMNzH1tQs?=
 =?us-ascii?Q?zMOYyt28adreJxdZHoFgsKM+Mti1Tpd6QD8ng7Agjr51OXNQEkQ0uT+2wi50?=
 =?us-ascii?Q?2J8UVIzCUuXB7LKpFhWwTLP1nXPqjaakt0lvBeNX1y3eW8/KdzX81wEHqpHu?=
 =?us-ascii?Q?+6d+4CQrY/FIvSqlFDjR89fonJZN3Rm0yap97wwrGrkyaxbFvacZpwv+2U6j?=
 =?us-ascii?Q?2arEZENcNYILHqArWDB2NEpKHEO6PeIVqw6JXyYK2/oA4drPGca4F6lLUGJD?=
 =?us-ascii?Q?F07RwTLXDvDZDnKTDMZ3baGEtQ9Uj3hwZ9F6lEFDRu0tElDe3eeKuWUwVbLo?=
 =?us-ascii?Q?zmQwkwq8IFttea5E/8dPpnv5Ek1y9I2X9XJ1Jk1N7P7zF/flrl1C3CggPIyi?=
 =?us-ascii?Q?X24ixPiR3lOIvsY+LSC9ajNzNFhkqZyTUK0JpqPcViWFD05Vgbkg0kZz95Aa?=
 =?us-ascii?Q?2o/yWRb80x+1HiJCrAcNenFZPslEEPFATy34pIPRftFI5eSp3S+NaZOU3R99?=
 =?us-ascii?Q?jvnHyx/h494qbKcY/weLx6VKtw1UfxBmbwVWM7sdQ6pRn2SQX5WW6MKOdIUO?=
 =?us-ascii?Q?09CkmVu6CMo9o/VSH96TqZKyu+CdSB3/Mxl+jioLEC+E0Mxi8f1aHLBOWnc8?=
 =?us-ascii?Q?QVlJhOMqRQdhBjOh/SqNOg7DZLo3FIPFMU8VGqoGugcWi4R1YchjwtaX8i2i?=
 =?us-ascii?Q?mAfXNyw0svQwnu0szdm2roP3f4FpcI0To5lqj6DCd2u8rF9eEf6WDr3m2C/5?=
 =?us-ascii?Q?53UVfMSfNy82lkZFrOegYe3JSy83vpbK2cIMKv7tDB3JNbwWk8KBzznFYJEF?=
 =?us-ascii?Q?eMdJJS+NmwNrF1eOKEQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75bcc3ef-4dd1-4f2b-4127-08dbcfc5aa33
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 10:33:27.3612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6IQsUHHQB4Lu/qWvtF2UKdYbwfC/9xe3UgPaN9qK7fV08rMGzq1bGDi+KQpJKZ4HP1y6zdawWCIvzObS9sD48Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4227
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, October 18, 2023 3:50 PM
>=20
> On Wed, Oct 18, 2023 at 08:16:01AM +0000, Parav Pandit wrote:
> > > This doesn't happen yet. For example, a VF with adminq that can be
> > > isolated with PASID makes some sense.
> > PASID is for the process of user space.
> > Kernel space do not consume a PASID.
>=20
> It could if we need it to.
>=20
> > Depending on the PASID can work for mediation approach only.
> > Last I heard is the cpu or kernel took the support out of it as some sp=
ecial
> instruction did not work for that cpu.
>=20
> Are you talking about ENQCMD things? That's nice but I don't think it's
> necessary for isolation here.
>
Yes. I believe SVA is disabled.
=20
> ...
>=20
> > > The reason why I see it is different from FLR is that
> > >
> > > 1) D3cold requires the VF to be off the power
> > > 2) State transition might takes more than what FLR did, PCI seems
> > > only cover the minimum delay but not maximum which may have
> > > implications for downtime
> > >
> > D3cold is not controlled by the guest driver.
> > PM register can change D0 to D3hot.
>=20
> It likely makes sense to document how all this interacts with things like=
 PM and
> other pci config. maybe you did in v2 didn't look at it yet.
>=20
Yeah, v2 covered it. Please see.
I didn't repeat what pci already covers for D3hot and D3 cold.

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

