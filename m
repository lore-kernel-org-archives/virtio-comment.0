Return-Path: <virtio-comment-return-9056-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08B1C47258
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 08:39:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 254A62AFF1
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 08:39:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 03ED9986883
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 08:39:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DA80F98687B; Wed, 31 Jan 2024 08:39:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA03298687C
	for <virtio-comment@lists.oasis-open.org>; Wed, 31 Jan 2024 08:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2yMkdT2KrCBttSmHkdYE5fwm2E4NuuhIuVksTj+tiLTpCTWItvlOP7j+XApGMbCBWaC+6skHHTazZZ+4LRHtchAkYGI5h4yPmzMgRmOIaXQ6j1hpyiptWyMeg5CuMhDHQ4YN7eLfCeC73v6ahJtyxOAyS/pYTtXvsiqv2BtjWhzGVui6Cpyyinqv/6RvRxJ3CSD5vN9jk1cBA6pLZMDFdInpTal/UHvTLztBC9Wca4KSIKmnh3RtbzzkX//Iflv0y1wYDuxboYdzuCNga1bWISACSH06uiK8NruWS148825Ne19QGcyh7oSpwRyQ1h8zN3tF817L2BLTG9XnmyneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggBZ8HbbnuqqdGgVBFBWDDwoEJZyqXNPMqH6evcOa+M=;
 b=WTc4fJpqNjcopiZ8Q2fphDtTVNIY/hr5QxIrM4wbpIDu/7liZcnLiVCQrQJ/BUVjwTnlmmrj8J84ARoOiW95vnnxwadbB78hlyHUOI8nc0b217MZFJ8W7IJOojleK2+86Qk95Ib1MGC71oQTYrVkAaz8niZ849qSWSlBBMGmlfGKtU6XgPefLejWdtqxZbJjd3FNnICzuMvk11OEgNpbqU+ZuTzColZcpG9T71Ea0eqCi4W4u4aRiC3Fx1C6nL63ZKq1QfAAr/8gqTqSXWPjrQTizq/lHUVCwrRbBHMwME8kBl/TKUf3rlgIuOLqBB6yyVFIQf8f1XnErKOqt/5H4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
From: Lege Wang <lege.wang@jaguarmicro.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Index: AQHaTzZn/4IbS5Ps60eRQZJfNPdC27Dx83kAgAGj2FA=
Date: Wed, 31 Jan 2024 08:39:50 +0000
Message-ID:
 <SI2PR06MB5385F062A33B53FF56F88DCEFF7C2@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
 <PH0PR12MB5481C4AE095D48C6241C6366DC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB5481C4AE095D48C6241C6366DC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|SEYPR06MB6012:EE_
x-ms-office365-filtering-correlation-id: a88ab684-7787-4b69-51bb-08dc22383069
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 RS9CpMB0+G9LBUknJj2OHixlMM/FsPlrC21l5DcaEOYvUKXumY0m4ELeGt8BOnSTJp4EQmVj3hvIwG4AnTb5lL/Ks6/ezKj0WmnRLyWGGYjpIvsd+tfvUzY8n3GiVsWrX9eIzXQCKk2s4uMflXIUuSwSmQcKA9iqsgj9DXudNiXs3y4QZM6F7Hs2IqyPrAy81+ZzyBFs2UexrATHYEM1PQK4arrDVSR27E/B4jI0F632Dc1+yuKBRVR3AxnyyXzbVuCwNyPFIelj3Rzqoz4Z32i4OH5TOs3clBDx98TFdN4bJPjuL7O9PSBFAMfP5rlZcoooEIpZ+h+HfBHqQg+EibOenlBdxKDvVpnw5Fo258IGWNxMKrhhyL8P+/pcjkzDytIHdFK8I9ox8BqiTTMCstj3QkfxT979bk1Kp+DUud3/mlzUOp1p8UWNRItZih9g92Wgmj9ieJqofsAkgcpMZKCgqjZHUOAsla1aGHvoNGUzkY3nJboLTOLdlS+2McPPcajd0Q7A6lXLT2aMIP+aexvMtF5f6AqLfQxVMTmsPUocCsACmHsMv3rVyNjGVSp7aX9Du9wcBctklGidabealPFjaY0bceA3TLTjlGfyfys5vZw5pvD7i4AHjeOQZMy8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39840400004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(316002)(66556008)(64756008)(66446008)(66476007)(66946007)(76116006)(110136005)(8676002)(8936002)(38070700009)(478600001)(86362001)(33656002)(5660300002)(2906002)(41300700001)(15650500001)(52536014)(44832011)(83380400001)(55016003)(26005)(38100700002)(122000001)(71200400001)(7696005)(6506007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?b9oInkUfszAqUZVHXiGcE9w/FHiGHgPp3r0SX/ijo3b1xCaceoVyfJ4R?=
 =?Windows-1252?Q?8TscDhYueoBrzuc98krWhkQP7HGQHN5QNIr9MfGVf5J1lvK+JCP9FOoV?=
 =?Windows-1252?Q?GdY5+sk3iKaF036ldZtPMX/Cx9/j2LAcMxBWFUyxn8XRHkEutt2AkNsA?=
 =?Windows-1252?Q?TGQWrJIEMTj11p9MIv+tChHxovCACZ+lmd1PMRUsKfANA1E/twRY7Oad?=
 =?Windows-1252?Q?pPYG8WC0HEDD77u/mcMJ/u10Up/GuE9GVQ3bEy68TcUC25OVrJeBO2Kc?=
 =?Windows-1252?Q?SAP5e6WEdgFmMr8qeNIT880OIVHnqbVY13rDmIDrNozMgUMbVYcN1spj?=
 =?Windows-1252?Q?4QodJsOVVkKJhlN4DvppBw0hfBaaJcqBx/Y3KyevseFHXtWmBxmgnMyC?=
 =?Windows-1252?Q?FZCcIEjp5Hqi/jvq81HVR0h9JsahSxhuNutXvi96NJgdOHaLHnZE2Fcw?=
 =?Windows-1252?Q?ZJaKUryrE7zxcsNXJtHjkvQkCs492PkfkWwdPZwZytdCeUIuQp3QeH+B?=
 =?Windows-1252?Q?AmT9SZo0rTzc/4SCptXYnx8WegZsAA+uUoinIGhNyaNtFYDbTSp0UKFy?=
 =?Windows-1252?Q?IAdfw+1IrRU8Ax5WfTKD0C65S1TWR5LQVzLPveviYd+MSYsV4QU529Ta?=
 =?Windows-1252?Q?g9T5VLRzpSpD8BxO9eg14R3Du8qeDzvJwHFia6fePg+J4Alynsl2TWyz?=
 =?Windows-1252?Q?zNjRY+ZrELdJ5GGRI8K/IxVcndxd8M08O/rPBrRZS3XCJfZIXiaUP/Gm?=
 =?Windows-1252?Q?46yw6j2cE+EtfKh1jVS7//0sj5Yhovd+nziEZY7XLpzQKZ75Mv540Nnm?=
 =?Windows-1252?Q?qr6f+gvWPovUcXyGq8FcwuFoSJtejcRrVCGv8MpS/O0qapi2mytnfIiD?=
 =?Windows-1252?Q?CH/V6wf8nT/BbikS07r8k3RJ4/Gd7P6Ej1qNWwOAyTeqS+LnIEzp7VVy?=
 =?Windows-1252?Q?ZfOK+Ege67p9HxExI8BohaUuVArVGIE9h8jCSwQ/et4p5J/egw8LxtS+?=
 =?Windows-1252?Q?GpU31HAj3kJkIXZp30K3FsTmZqljnTQ3gH+8N/d2OoVRegKwvkEuL6LK?=
 =?Windows-1252?Q?O2fCalKdTaYyJC4ekpVg9bUmQgI/llAhWPXOjFVuzPEzdJHQHsBZ09LR?=
 =?Windows-1252?Q?M2z2Y9lZZdUvG12AxQy/v3alBhZeIaYwNePqJd8XweU+uiaH+jByv7sC?=
 =?Windows-1252?Q?ibcXFC3Ty7mnaT4tsTWYlcxBZeJyfXEwBPGHD6BSZGEGn8ItFcnpfrbq?=
 =?Windows-1252?Q?OlQuaDeD2lWayjdVP+hBTANOm6lhHFygVBef3R4kVNxIOtXzg/4s8Vc2?=
 =?Windows-1252?Q?omYPFvORrDYTuuhlLK0WO/ZO5qvPdaREgentkB5nkRlZ+WZUCNVYxG4W?=
 =?Windows-1252?Q?N2bk407RGz2J3MSZ2IdF38mt0ysnrrvUuNwgKU4x8utUqRNgO/Yg3EaY?=
 =?Windows-1252?Q?jNPKDUU+zf7ZNoNdUsGyFafvBIjNx91FyHWkip0g/C+ZQ8u6FDMxZpB+?=
 =?Windows-1252?Q?wmbxqIuPNTxTQmYXQkKg44RZmWMBfdCAmtHtFZkOEFEAeG++Sc2gCAe2?=
 =?Windows-1252?Q?HlBEBe68KGVbNzayBpvmOBW8tfhHgQvYMGNOToV8imEg5NNI/YhPrXj2?=
 =?Windows-1252?Q?cJICN3ClF+EiLKleQAH1KeWCHo2iXUb4/Fk2A5qqH/OeoOzL9ZJ9Crac?=
 =?Windows-1252?Q?F8a+xSlxa/HpjfaV1qNgZ4V64AaYCvVd?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88ab684-7787-4b69-51bb-08dc22383069
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 08:39:50.5162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 66indigIn2+4pZTFk61MclgN6BJnUlvjG9YbklhEd2lYTd+8MT0dqfe+VwWvBe/Al1w3Fw0qThYmcktu5nwgjsLx1oh1yLmOYgvsWivYqkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6012
Subject: RE: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism

hi,

I'd like to have some more discussions about used buffer notification mecha=
nism, thanks.
> > +\item [next_wrap] Wrap Counter.
> > +      With VIRTIO_F_RING_PACKED this is the wrap counter
> > +      referring to the next used descriptor.
> > +      Without VIRTIO_F_RING_PACKED this is the most significant bit
> > +      (bit 15) of the used index.
> > +\end{description}
> > +
> This forces the driver to process _all_ used buffer notifications before =
enabling
> them again.
> There is a race condition that used ring updates are occurring from the d=
evice
> (without notification) and driver updates the value.
> For example,
> 1. driver posted descriptors from index 0 to 9.
> 2. Used buffer notification arrived for 0 to 3.
> 3. Driver processes used buffer ring from 0 to 3 and enables used buffer
> notification for index 4.
> 4. While #3 is happening, the device already updated the used buffer entr=
ies.
> 5. So device view of used ring entry is messed up as it already passed th=
at point.
>=20
> Hence a better driver used buffer notification should be,
>=20
> 1. index upto which it has processed
I would change it to " index upto which it will process next", the reason i=
s that
virtio core driver codes have already a well-maintained "struct vring_virtq=
ueue->last_used_idx",
we can use it for notification, and using this value, the device will also =
be able to learn
the driver consumption rate.

> 2. explicit enable/disable bit to enable the notification
I wonder if there's a case that the driver just notifies the used index inf=
o, but not enable
the device notification, the driver will always need one enable operation f=
inally. And the notification
data would be similar to:
le32 {=20
  union {=20
    vq_index: 16;           /* Used if VIRTIO_F_NOTIF_CONFIG_DATA not negot=
iated */=20
    vq_notif_config_data: 16; /* Used if VIRTIO_F_NOTIF_CONFIG_DATA negotia=
ted */=20
  };=20
  next_off : 15;=20
  next_wrap : 1;=20
};
next_off and next_wrap will denote last_used_idx info, and vq_index or vq_n=
otif_config_data is
also necessary, so for one 32-bit register, there's no room for this enable=
/disable bit.


Regards,
lege.wang
>=20
> These two fields clearly communicate to the device, upto how much used bu=
ffer
> is consumed and understand the driver consumption rate.
> This way, there is no ambiguity for device on where to write next used ri=
ng
> entry.
> (where to write next used entry is not driven by the notification enablem=
ent).
>=20
> And the explicit enable bit indicates notifications are enabled back.
>=20
> Technically, only enable bit is needed, but doing #1 is helpful for the d=
evice to
> understand driver consumption pace.
> And for that may be current notification can be made 64-bits or as sugges=
ted in
> your patch to have new location.
>=20


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

