Return-Path: <virtio-comment-return-9060-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C7BC4828F
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 09:44:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F048112F78D
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 09:44:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D65639868B0
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 09:44:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id ABFB69868A4; Thu,  1 Feb 2024 09:44:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9D13C9868A5
	for <virtio-comment@lists.oasis-open.org>; Thu,  1 Feb 2024 09:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7FJtBTy3zh27NBTi+Tad3u5sbPib940vrgTtzxdXKBCtwOo8d/DrC99nmipFQGJeWF+pvrFYaoLPWWxnrj+mfReYnZobifAFbARxrrcBd3vJnUAp6fNSifillnFxXXzDbBcVe02QwNrO9HaNmLuaALUr0HZaRZ3FufApe+L1zOeH8eBtTtXLmMJ23tR/+n21UAh1/CvtIot8axCIkb4gjVhYQFOFoTmr0ap/HkW/kk2K7XwDC3b6NG/aVmO86B0NVhZ4DAP0sldu6ADgH7uBEejshv5NQwFWlo4N00jD6+nGhWQth60FozACZwE3kXUOab7/VUIFPKNmJSJiJlB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsfFEfdxL2+Yztd0gQ2u1VEbV+73sK57EQBCHXbtYrg=;
 b=UGC/IYXW0UcDcN5vJb/mwvnQURV1IPoA1ZAK5O/+9Kg5i9UeF0THP0Wv5ge7x34964PdD1YqVhRvmzcxQjiklT7WQQRTNtx/H09i4mRPmM5Hei9nf7o+81pvNRDz/5uxwl21RvYpc591CCCjF+6sN6tsnLpsSMaARKnd8Z4dL+Ekmu54M9eVci6C2tWl9ur9Wimhnt4FbButFgtqhtFGLd6SkuCbAgnZphV8sevCeDY5W8sbQc8Ew+pzjQra5c7bL5SxtuJqnLmeIZSWIOdEWkZW/AcOi0BJ8ZhhQe4FEgttpNJYFkgA0DdSNpYC9ncTxXgR17++l73dR9RcLgkRng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
From: Lege Wang <lege.wang@jaguarmicro.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Index: AQHaTzZn/4IbS5Ps60eRQZJfNPdC27Dx83kAgAGj2FCAAa/mYA==
Date: Thu, 1 Feb 2024 09:44:09 +0000
Message-ID:
 <SI2PR06MB5385408EAB9886D3F3C9A5CFFF432@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
 <PH0PR12MB5481C4AE095D48C6241C6366DC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SI2PR06MB5385F062A33B53FF56F88DCEFF7C2@SI2PR06MB5385.apcprd06.prod.outlook.com>
In-Reply-To:
 <SI2PR06MB5385F062A33B53FF56F88DCEFF7C2@SI2PR06MB5385.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|KL1PR0601MB4451:EE_
x-ms-office365-filtering-correlation-id: c4cd3195-a3ed-4908-ddf2-08dc230a56aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 AK3Ni9fNy01KLam7PQBUA4/DAfXH4wCBDM1isK0Q8tYIk9YWiJilmJfns+nqitH+20r3cvh+MUTjC7ySt2b4YIvH9bXZNCF1zyVgXyYzV7ti2TzlEVX1h3a1Esi58BOw6E/UNHnZapt2LPslCIQ6BiTCrt/DeoR3o4iqm3gU9ObvFm9U7y6gNN4UfpaHjPppoNtaIueGit25srNCPveoNVGE/X8cJ7FpffIs2136hSdz1lWei6Clzxj7BI7ncMn9EpAuUBS0DwknEQHMuLPBOsgWoFihcttBYYri46fLYHJ8DoaRWfTFX+v18yOWgUplq/NqqU6MWnzp/Om7EuFD/DElraSuYv0ykVeb7DmYPglW6GCK2FXsRothVAi1YxygjAzP/+o5fDwqmt8qJgF4fr+z1LbK8Lch1y6f7QS2PmwhZ5imN35QdHxvv+lnK/vRj2hdP6HkAlQQnepwbfIe70hFYFG+0wTSzB+u0LWPdpEyKEQLUpjNFCYwM14bx5LghyYeih6SE0MGfFWyXKAwi7hO69bVF4SDMk92MlyrzzM9HtJ8Wxh/r86HmYxIOiYZeiLOzrJtTcEE49Xlk7O4O7WsICXXbdX7JpkHnTeKpMpUXI2sMWo7Kc86drjnqMXg
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(376002)(39840400004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(478600001)(41300700001)(55016003)(38100700002)(83380400001)(122000001)(71200400001)(9686003)(7696005)(6506007)(52536014)(316002)(64756008)(44832011)(33656002)(38070700009)(2906002)(5660300002)(15650500001)(8936002)(26005)(8676002)(66946007)(76116006)(110136005)(66446008)(66476007)(66556008)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?Sbyq/nwvED849e0zan815IGQ6+pLVVHWWgh81j+LQRtBO+mFRmfOO4AS?=
 =?Windows-1252?Q?pkih+7qlNY3Of2uF0lbImHoXMCr2g/kbHK1Q11hzYC0ZHUn4LIYB2iQy?=
 =?Windows-1252?Q?dazGWWEHMsD/Ykxya7PCRWjn7pWvm+CZU8tJ4ntYpUl7uXMxVmHM0K7F?=
 =?Windows-1252?Q?5nUCtEP+8byGr82DWevQx/5NLnfsb8s/cHFOPKPG2+WnljS0BuMdOHTW?=
 =?Windows-1252?Q?hWODTKgflhXWsv6WUe2OzGnC3BNCnZnfNfCLoLu/A441TSPRuhQyf5ci?=
 =?Windows-1252?Q?rYdbavxEakwTgcLgUln2mpPicjIyfxiDmX0FREn4RKLFbUrb/kWY9Pdu?=
 =?Windows-1252?Q?TsKCZ5nPj4TBNiSgZFiYZsjRW85EesdKd19miC83NeJzAC9N1EzF8uDx?=
 =?Windows-1252?Q?PxUrnu3aFhR7iZgr4SiYa93L1mDHZQdK6TZyu4ppQeLlbCG/fSzJmYIs?=
 =?Windows-1252?Q?R7cG+XSl6cgGErFHtKFdqiMnFY3r71/+LVOhGefL/Yc1XAn+0aIlp4PU?=
 =?Windows-1252?Q?GAg82VBm5XhjoVGP62MlZM/uYx+j1vQ8/nswKOCI009wLlEsNmdLzyrs?=
 =?Windows-1252?Q?22edmB7LhHZZYLGvHIFKDfSt2JnyH/p6iTLza+eo0PEYdlbV3QETLntG?=
 =?Windows-1252?Q?xPdUeCIFPCe771Pwd5uLJ7kYu3pVFvW/JzDh9VbEXWIZNouGOzCvUZs+?=
 =?Windows-1252?Q?9wm4s9w+GSH3ofwPs/46vhVwaPcIj5FLUljKWYkeSAH82Lu9QxUzZjpQ?=
 =?Windows-1252?Q?ctLn/1Gd8M+st6qoPtXa4BxBMkcxiZSymeJp+qIdswApUUOBhYQUJbAq?=
 =?Windows-1252?Q?hRNbS+6Efa3x9drXNrr9iyI/nrmxX8BDtNvVhiCmB7q6wsmS11Eq2d4x?=
 =?Windows-1252?Q?Hgwxd/YHezW3JN1NpHXG1DS4KC1CWZmCfzVVnzd5g4R20aU2uQF1zQE1?=
 =?Windows-1252?Q?eHOLmUv8Q9lhl3MRDOP/rGuWBT76QBatXC2AMzo1fZ7PZI/DkoIcNShQ?=
 =?Windows-1252?Q?G42Coim1jiCvyGDpxGVdiKXc3q1D7Knp3RuYzlRz+ei/k1fIJfk65OuL?=
 =?Windows-1252?Q?QxZ3/21pzKYEZ15zErMiv5dQmMaT4/osla5NYjTgnfYSZXCmm90f0cLu?=
 =?Windows-1252?Q?EqYnWjj+gf8U64oKZywkQLt2z7HHGkdOcQjPIJ5LO0+8UdoX/fZcmEjf?=
 =?Windows-1252?Q?in6x02zxybTDNcO0aphqyGXLapq/FrzEZQ0CevKCMMBqYGDdvkl+ceAr?=
 =?Windows-1252?Q?EXsXD6cd841jRdJprWLhNM+52/MnXpFdMcdyUkpZm+0IpoRBxV0ftX2h?=
 =?Windows-1252?Q?kkj8FrDKfhMWUhLCku1sdLQTWGRKc2WO3yav4NN2wlhUnoGFrWvHAEvS?=
 =?Windows-1252?Q?NRn+3nmPSvCChJNxEuvVKZqCmUSXRggT2td/b88EGAzjTXWbMsBqMUqS?=
 =?Windows-1252?Q?H3qN3fUHIg35vgd72dX4pvhrIVWo3m7oBfcqCxGiONHI4W55ptLYMnHG?=
 =?Windows-1252?Q?V1XGL7axhlFP0Df8jATeiqzJmmoNFC1P5gvmt+ptEROciH5nAZfPL8Uz?=
 =?Windows-1252?Q?7mBIXw3JgZj+ehpkcwAj9W0+h2Uoih7noPepeAQWbxBEbGUxadPvc0qW?=
 =?Windows-1252?Q?gHg7Xefz3mdh2QXm8/QA+XMB9lMroGMFQB9QnMpofB0Ommz/SdFskv6h?=
 =?Windows-1252?Q?W1ZfvJj4mgd71kImGAAjT1jDsS5C1I/v?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4cd3195-a3ed-4908-ddf2-08dc230a56aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 09:44:09.0246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X6L6bwZUhdo/RatzHi+raX1meIhsIJrrevL0BPQ/ES4Nzem/yYxk5dKhwcl44JSFa1dnNxTnn3mfLzZ1ONc2hBmJJG0hu8b+FMK2vid4GvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4451
Subject: RE: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism

hi,

A friendly reminder in case you missed this email

Regards,
lege.wang

> >
> > Hence a better driver used buffer notification should be,
> >
> > 1. index upto which it has processed
> I would change it to " index upto which it will process next", the reason=
 is that
> virtio core driver codes have already a well-maintained "struct
> vring_virtqueue->last_used_idx",
> we can use it for notification, and using this value, the device will als=
o be able
> to learn
> the driver consumption rate.
>=20
> > 2. explicit enable/disable bit to enable the notification
> I wonder if there's a case that the driver just notifies the used index i=
nfo, but
> not enable
> the device notification, the driver will always need one enable operation=
 finally.
> And the notification
> data would be similar to:
> le32 {
>   union {
>     vq_index: 16;           /* Used if VIRTIO_F_NOTIF_CONFIG_DATA not
> negotiated */
>     vq_notif_config_data: 16; /* Used if VIRTIO_F_NOTIF_CONFIG_DATA
> negotiated */
>   };
>   next_off : 15;
>   next_wrap : 1;
> };
> next_off and next_wrap will denote last_used_idx info, and vq_index or
> vq_notif_config_data is
> also necessary, so for one 32-bit register, there's no room for this
> enable/disable bit.
>=20
>=20
> Regards,
> lege.wang
> >
> > These two fields clearly communicate to the device, upto how much used
> buffer
> > is consumed and understand the driver consumption rate.
> > This way, there is no ambiguity for device on where to write next used =
ring
> > entry.
> > (where to write next used entry is not driven by the notification enabl=
ement).
> >
> > And the explicit enable bit indicates notifications are enabled back.
> >
> > Technically, only enable bit is needed, but doing #1 is helpful for the=
 device to
> > understand driver consumption pace.
> > And for that may be current notification can be made 64-bits or as sugg=
ested
> in
> > your patch to have new location.
> >


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

