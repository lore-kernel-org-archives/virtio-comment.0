Return-Path: <virtio-comment-return-8461-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F91FC072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:23:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6D3203E56F
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:23:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 41E79986E28
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:23:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2A213986E1E; Fri, 17 Nov 2023 12:23:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 19DE7986E1F
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 12:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pg+e0nHLmG+nxLqO9GeuP7LzTLEth8uwTDNxHHe6+Nt7h9aHPGhdLQtPVKrZKMX+QC7vHuVjPlQ2kET8XAIq0gqyZUlXgUElvwNSOokasMrDnnWX/wqzAFYdyu7HGt+Qfp89ttJ2sclUZOtbIKccMzHAk33Z6tnafqDB74OhyDadHbja1awECNGFmJVqJtEq4iwGvauZDISWo3X1WLBkM5KA0H5zveQxPo9IKWY8jeDYxE7FdkwXSIsfVWn4LB36q0GHYz+dtSkZLKhxmP2DUKgY69o0PPHilHyz8oPN+535JIOSKmrmIT3cOrOhNnPhE0VaGQaEm2Lz1fas5077DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkhenWTL95leHXv76ti808mtWMlieOFI4/xXBs33dMU=;
 b=ge40iDQ42AlgemrkZrEfYmExnU3C8usdXTOb0Ixxy1cJRMAMgmfSpt1hKB/4GuvwnxHF/do/sDLD9TNAReZuwK4GQtjy/Y7r8sHzCFeB17y7oyaf+2OyAZeMc+WPc31bsT+NPNlg00v+Arp08hy2Eufz/q0T5SPb+bviPmYsFvvAlOG1va9m5gkBWV/VJm1Y87IpXJxzPgG/rcFqjJeYZ6qtyekTtuRCJFGkbqC/C5mxpdYXigwVMozoh5txuOqgjze210Bp/9JbjmV5r+KKnrSApplKkJ4TDXWBtFtcEwpJ5L7tIukhpwunxBk3q75t8O+WmfoLRU1kvSBljQ/qKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YIAADsiAgACQwGCAAGEbgIAAB4aggAAG2gCAAABcQIAAA3mAgAAAL+CAAAy2AIAAAzkwgAAMKgCAAA13IA==
Date: Fri, 17 Nov 2023 12:22:59 +0000
Message-ID:
 <PH0PR12MB548133582D377B3FE4BB9F6CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117044428-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E8342B26739B852B592FDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117053117-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481632B9E440DDCBEEA7B75DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117062003-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117062003-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB5294:EE_
x-ms-office365-filtering-correlation-id: ae18606c-e186-4751-67a1-08dbe767f024
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6ki57osr8u/e8pasdHIc7IixSroXJ1iK4ROlJfuLQHxQTPdDlqtpRbeeKIvdoCx4prCXtktgJgjdkmOihs8gzHMzJqLkhk3IGezLJPb2GtJD6+fOkzDm2WAZbcuoTn8IpFZKH71OIzQoFcgQeluJb/jByG5zkhoGWfh3MqAFmoiy2lk5imf9tKI4odoQpaT4b51Znxcl6FZGd1qhq/5hfvzgimSRv3op32/7oeSbsAGdjEfRyTBIt/p50iL+zUgbk+Ypgbr8dnGGD2KCmXSK/N9WM+VKF9gGyqzKW5Z+cju6hEzwLmVse0a6E4m4CRohbhnZf97XBmsqKvju8mY87FswhUm9EPepbV9vPXsxoca8LP9IuDw50+GYXTii4NgYFAE4YlRWKgeGTgIhmnUAFPCrF4Kyzrstmb8RPovXVZGfXNWV1Xz+QwoSOvmDiwGskDd3MMkK9UCH0a+Ly9pBThgkG9jAj10RXUmI1aCw+3pwzTG9zWB2DK7oqWlLVv5x5kaikMWzOlU7fjR84iW0QHv3x3hqgETfFXxkZ/y+36jAZB4UWzqBjXgGAe5z/BHTA/f7JfMWRu/l45iGYdSWVrjVkz0GIlCKZ78aU1r+RoVdM/VsbOIzQ3UBe+8t0l/4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(71200400001)(4744005)(55236004)(53546011)(6506007)(7696005)(2906002)(478600001)(8676002)(8936002)(4326008)(52536014)(54906003)(64756008)(6916009)(316002)(76116006)(66476007)(66556008)(66446008)(66946007)(86362001)(5660300002)(41300700001)(33656002)(55016003)(122000001)(38100700002)(38070700009)(26005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aBuauaFq0ZqFIB2WsLwFDo3iKPJeELnWXiOVvn0wKmtwpGM2VEUmEzo+ibCt?=
 =?us-ascii?Q?nnmryPS57PsdT+SV4Z099OYip/1/IT7TCc5zlA1Skqi/9lS3mX5oGy6d0FxM?=
 =?us-ascii?Q?uT7XhCis2X+oBecZVkyyKzBeIlGnr4U4zi8wQb7gufJeIqinDovFTll7MJxX?=
 =?us-ascii?Q?WPrLCAeU5FH0Ei6G+vTeiCPyfzKVd27LP3gy6jSUuQK5v6EFheGGO0Jhx9Ty?=
 =?us-ascii?Q?gvvzQkFDr8m3VkUOsjAk3UDIJS8roiLQ/EuB9mpuZ4FBPSnBcaePicSxvl+a?=
 =?us-ascii?Q?XhCdElmDO+nLycx+VNutFDmZ9oSFkryNj7DdgHNuakwQAz2B6tnPtsE5lGwn?=
 =?us-ascii?Q?6jHwDLBFwBvpFS01NjCJ04RO2A1a86sr893ZFkXUI0SwE5QusJ+7gAzvng6U?=
 =?us-ascii?Q?q84fUk2iTw3tQu0BqTGCcQSED1ppPqvswG7Mik5LT1OHsF2ZZ4jWZglklVME?=
 =?us-ascii?Q?esXWZi6HdXUGnPjKvMPkoUDdPA/FldNFnJ7ornWIUF8zklQA7vxGy2QuvEF+?=
 =?us-ascii?Q?NF3p+S0HpkFjnybDjHKQBrYtahjZWK//3nsdS+tn3Po+DwBLQivppytAsivV?=
 =?us-ascii?Q?As7I3NWY12UmTEW2I8lNpHfg5gVxUscfMjzYgI9aMy+7pMHLsRXP+COW9k4J?=
 =?us-ascii?Q?9YlLXL4dnw7yPxXgRTd9CiEn8ZtLghaR2ftF467ceRttpx055k3Z9YOB3/6A?=
 =?us-ascii?Q?NiMmepD3/kZpoq/4JernTLaM66FV2KSuH0+GVDsp6bJi7xLXs14T+a2jK7ID?=
 =?us-ascii?Q?MkRfWbxCeyRhVkqZvMsC0GYDaV8CS6kE9gSow1Nc7hinLROPl1Q/dYKKE/p/?=
 =?us-ascii?Q?W/W7RHDgl8Uf2qs3ZhpBZ5cKetyG7KmmGfxCNDv9+MbmkoF6kPqgAm7hFsEJ?=
 =?us-ascii?Q?Hi6pJmUxribIrGeYiuJGUm0ml6T5wo5hl7MJk3pyLY9uLQRcgwS6uJnxrxax?=
 =?us-ascii?Q?AGcIWDqlPMVjA5HzdI3+Ppd5TZ+X9xYso3WVwNa0W/S4m0fLEa34qNGoIaI1?=
 =?us-ascii?Q?MFjcKIWwrB0hgy7Pu+k7kSkz6jpZ8XsLiDx6f5pLc+bEhfyyP9B/LoSy/7jo?=
 =?us-ascii?Q?SoROw9woHAKAdftx/PP62QquIyX9GCoF2uF1ctysaBbHQfdxKTs6DeiZWLy8?=
 =?us-ascii?Q?EREOWgpu8w1h8scC9xcwx6qzh2oQ+ojygzP7+3glCV1wW545wgCjQRp4TVIl?=
 =?us-ascii?Q?bPE9GMTewuZ1F8lJ+/bCEymhJA7iaRGjF+gcEJdj4U0SyBQQ8Xz7Kqa2J9VP?=
 =?us-ascii?Q?aItFbw62Z8O3eniGrKzGB1vcNeRXvGQE6pyAoZEr2PEfeuAyqgtncT/cjuU2?=
 =?us-ascii?Q?YdClMzTPamtJsT4jo6cVieWf7T//OYbIngHNpsEz1wNoAMilppv2cq2PyKrp?=
 =?us-ascii?Q?lDpuS3xGbDYI+B1URn7KPPp7mdcAnKLHQMRrKv0ScdRR5DNx/WEJKNEyHazf?=
 =?us-ascii?Q?uviEVdoMjadKtQWdTCIPjXex7Mf0Y2v38k0X6voQkxG15sOZ9vlI2toy5C6k?=
 =?us-ascii?Q?Uu8hBjKgeBdo7u1g+57Jy/ezE4GX55hwdKF4JL4wIdTP6yto1qZYS49WX9Ty?=
 =?us-ascii?Q?xBzvF4gnZI/y9cJuhks=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae18606c-e186-4751-67a1-08dbe767f024
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 12:22:59.9220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /NnxkBGbF8b0Tznz+LGf7jO4JwREA0/BJ0tXl/QeKu/RzWK9txOnc0m+ry3HVdY+OpWGovdeGWxxhdK0lcUcPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5294
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 17, 2023 5:03 PM
> To: Parav Pandit <parav@nvidia.com>

> > Somehow the claim of shadow vq is great without sharing any performance
> numbers is what I don't agree with.
>=20
> It's upstream in QEMU. Test it youself.
>=20
We did few minutes back.
It results in a call trace.
Vhost_vdpa_setup_vq_irq crashes on list corruption on net-next.

We are stopping any shadow vq tests on unstable stuff.

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

