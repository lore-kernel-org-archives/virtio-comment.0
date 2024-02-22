Return-Path: <virtio-comment-return-9134-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E49C48BEB
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Feb 2024 01:56:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4A7E62A8E6
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Feb 2024 01:56:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 249DA9865F6
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Feb 2024 01:56:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 039C3986255; Thu, 22 Feb 2024 01:56:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E42F2986534
	for <virtio-comment@lists.oasis-open.org>; Thu, 22 Feb 2024 01:56:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKYV647F8XfHYTGjfvN5Iu3ssJMGJ6jVVxEvRCmesf+FYxFKAZMc1HQOHpPYfIh8KpGb0Q4FGpRj+UP0pRzly5JTokMyXd9k/Pb/uP4gEd3H71vEzJ8dfoCWlULIa+cCq2fK2KkzqpreJEGR0WaDg7U/VT1IgA+gJDKgN44xIs2JRrinGQLOiKI0XZwh4UaNwrRcY8bO0A8MkRzTYwfPhLvR02XukxdUajNw60lrJw+21nPk2W9J0tpZV9dE5tQ3hjQyyuvcOz/h1tuDEBQjY/R3QvmjpcnxYgJm1WWPtAohPS3S7KjFM0Xh1YIvVe9pxB3xTsali6MD0a+0ib5Bfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPfmovCaO/c1nOp/vC1QAdVAVoGjT3fcrbGSidA7rNQ=;
 b=dSfbAK3h29e17TKUn7I43JHyEK6bv6FbTi1Z0HiLU+X2laWfJRd6V0v0yVTsfUWJuUxoFprZd5OzUzmZFNUucMFU/ldUOagveidMtpi0IwE+fQLeaWvs+BcCYq5Qj4fjhXIbfkPLTiB30t1B2EkSf1GnBDM4ZIUcATTiVuSaGmKPgixuHHRfIki/KDP8x0OETCMA5OK6QF89oaVN9pOhCT5ckTrz5uQcVnYEc+680BJqpmrwjZ1yOuyvYvsRhGOhcymNp6INt7QvZGeYTsumVOHeOtV/CuFRXmjt2dFcLbmwaiiuwbArJAtPnAox0J1ICElZ+gt8IG4jlepCHwj01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
From: Lege Wang <lege.wang@jaguarmicro.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Index: AQHaTzZn/4IbS5Ps60eRQZJfNPdC27Dx83kAgAGj2FCAB9d7AIAZEuZQ
Date: Thu, 22 Feb 2024 01:56:28 +0000
Message-ID:
 <SI2PR06MB5385AF3B8EE696B201B95F7CFF562@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
 <PH0PR12MB5481C4AE095D48C6241C6366DC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SI2PR06MB5385F062A33B53FF56F88DCEFF7C2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <PH0PR12MB5481935584B62FD5ACE5FE3CDC472@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB5481935584B62FD5ACE5FE3CDC472@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|PSAPR06MB4408:EE_
x-ms-office365-filtering-correlation-id: 3707e324-9774-42fc-b74d-08dc33497bd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NErzwsIyeWtqqR/mK2t6og+45rEVOe535BVVerHTxMNF6azx3951hWpMiUZ4oh/xUppLLq7uzS6y/0+9R/GG62sTjF5hjxkqLIkp9e8YKx/LkZC+QTJdhTuoVx9RLlY8asM3Jj1j2RQrEh38HKREGGCuWTldeONf9UYgbg3DN0ROts8TqMvZcy3IuygJ/9DamNlujOHgHcmNGvBv39kmnRSJmKySqU6hV/hCb7l+6xLyeneEAZ+fJI0Y3qFjXa1RaGYB6VI8STgbvc8XS+h9167rf8eMV6wIpcgHzU0T9N49oUxp6Wzn9qNt1eEs9F4Og++XCDRTo1fJseFoFbelincVHxHAluU/6UBpiVJyJBgfgEn0D+EnwQuFnYLeabgYa3bSGWirAUEGeC5TDWSYCKkgqB6Sv3J8/BDO+j2U8TTeakK10HxSsE/56CO4aoIbGwDMIAesXLirHeO0tB65e8HTAlV5mAcoCGOuw74wiTPby0X665SNSpFVlX6DsfDBPyaLKDs3g/723BXEjVpYOo5cR+YSvADhFSxFA27alEv6Pakjo0q0Z0yykMc1kXD8jJWVm6nLIMzhbRaAGYt1pvjjhua0MsOnMjrd3BgY5IZee7lokWnIh/+ryeSfAri2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?wDA+8wIQPPecwTTMdUQBRTb9/lnzgBUH/6Y8aaRKvRx+RRWwAZ9RWOFW?=
 =?Windows-1252?Q?tcA3SdxdrDh0F5brp28VR9wBsAzFPVOvZHCFGNlBRfa1YwVr3956zrRl?=
 =?Windows-1252?Q?kRViKgbZw8QBjKuyxhet8k6KiCKyZGloqNlot1xAGBZZiArLzlnuJsxF?=
 =?Windows-1252?Q?uAwnihiGeIkwrP3OWhB+IlX+rs5FVLkHyGEGa7KfPYvJBZixg1if+xNt?=
 =?Windows-1252?Q?jkLlukzhWGKtgmwpKLmNwtWz8rootp4QeLG2vKVLWJsp2ls0ENQ+r3YK?=
 =?Windows-1252?Q?fxD9vkQDSC98HtZZQMMec/i5vgCSwAM2SYEGQmrYu1zWxZrWh9DBuRV/?=
 =?Windows-1252?Q?sEdOzLssqrnXTDZr3VlJG8ITShCIyAqKK21MJNO6sGuY2QcC78Ss+h1J?=
 =?Windows-1252?Q?cMLrYiZYHNeqNdigSiM+MrBZyRY6G8nSdapH6eOnpttugbAAj9x6nSmY?=
 =?Windows-1252?Q?a0VJ1rvJYayVpja0BIYfqWYuhxyRoXpltA3jHJjBbsh8eGez/5gITeNp?=
 =?Windows-1252?Q?sY0jLqBKv+LP6m1bwlN1u+YFaDRTkaefi0q1u8tXMKwJFZvoyyw2y0HJ?=
 =?Windows-1252?Q?SYk5wcBuOuP7NlR/40YbTyGLwzIKyrVmPeuokpN9H2q2O7W51PhXavTw?=
 =?Windows-1252?Q?Fz1ziCe0FjZJRa0fps7WVZcDH2Zb5FAzPWcycVyxhKwN43F3RXIXBCK/?=
 =?Windows-1252?Q?Wzunlx+wtjD1FBf2iqce8FcQZq0UeASwNTPNPpGZOGQhqMgtYb1mnHK8?=
 =?Windows-1252?Q?q/7u6pjgIA764X2c2+T2pffNBqVtQTEiJx+wnqHK4t4SjJ5p8wVuzs9e?=
 =?Windows-1252?Q?pdCrqJbhydT4rDB5UlEF2qqPN9Yc0l/tSPz1l7BnJeqtykt0vM5Vj4lN?=
 =?Windows-1252?Q?dZ3uQZ+CQnkf2N96KLD4etsXeAHYY4ngF7GzUgS75Sdvf22vrsEatqwY?=
 =?Windows-1252?Q?VcINMAJUXNm8j7buUxzPCTjZVg03vTYDMqdtw+LVkPVll0XAQQtXSWQN?=
 =?Windows-1252?Q?HkAh+ZFRwbu0DV9hDLS6E+vfu8ath3+krnf0shQp8nLEjgk6fg2KV6Bj?=
 =?Windows-1252?Q?vo87xfkUiO5qjbjfnH+3LDW8LFqCnmkaKahr/j919XKgN4j17zkywWia?=
 =?Windows-1252?Q?ckRxzVSPt70dlQpp6BPbb0VmcYMbr5PMkTemZcUsLQnU3eEFQHRzQ7D4?=
 =?Windows-1252?Q?FtR/CAg88HWk57O7BiE3zhoWpkgcAV0XBMg4eHrtRmff+5NWj8OqxCs+?=
 =?Windows-1252?Q?nUFbAr1FdZHWC6X0DV5ALUQivAgiaKGieauTK+ZYvZAvrEalaWa7VxMv?=
 =?Windows-1252?Q?wKGKWE4KsRhhdAUD1K/LH29Dl9Kh5FNvsY1k+aUapUWX9F6lD9iLweT3?=
 =?Windows-1252?Q?NEiAS3aPj2HS6+Mf9fmlAVBndqPkMhZOVexTAuNLLMD9C7mLg7lblDce?=
 =?Windows-1252?Q?/xz359M5i4wLI5ReO0XzHUi0BiJeyoySZ3+3EHxvc9mxWbfiuiYovbKq?=
 =?Windows-1252?Q?raLdsYdcsN6/Yn1KhvrRtK26q0bepOGdwuG176dTpW9me7WIFz+WELiw?=
 =?Windows-1252?Q?jimhgAhXBNEAfvKsDS+8bfIa2911/PYjprmnwUVsHrGyRe8e/IXTYNyu?=
 =?Windows-1252?Q?37HAgq+y4/+bhEu1DjbMk1sQ2Ta9/ve6YNybw3po+wlaRgf6t1WEUz66?=
 =?Windows-1252?Q?Uy5iWBdwSJm0DlflLCB4ABI8YMKrM0Sd?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3707e324-9774-42fc-b74d-08dc33497bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 01:56:28.2124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kPxDmaNuqYhUfy5dPQqnYXKkXz19cOObrRjQiw2KOp+hUwby2YpbLfXlHv/ZxDOdWB9jYgQlVmeOQjCCPoyqP2/f8ISRmnzHf8JL6ofdwuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4408
Subject: RE: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism

hi,

I'm back from a long vacation, and have some internal work to do, sorry for
long late response.

> > >
> > > Hence a better driver used buffer notification should be,
> > >
> > > 1. index upto which it has processed
> > I would change it to " index upto which it will process next", the reas=
on is
> that
> > virtio core driver codes have already a well-maintained "struct
> > vring_virtqueue->last_used_idx", we can use it for notification, and us=
ing this
> > value, the device will also be able to learn the driver consumption rat=
e.
> >
> It the index upto which the driver _has_ already processed, right?
Yes, and your previous comment is right, ignore my comment above.

>=20
> > > 2. explicit enable/disable bit to enable the notification
> > I wonder if there's a case that the driver just notifies the used index=
 info, but
> > not enable the device notification,
> Yes. there is a scenario.
> For example, device has received 28 packets.
> When the driver is polling, it was given budget to poll only 20 packets. =
In this
> case NAPI context will come back again to poll rest of the 8 packets.
> In this scenario, it is desired to still update the polled completions (u=
sed
> elements), but not enable the notification.
> Notification can be enabled later when remaining 8 or more packets are
> processed.
OK, I see.

>=20
> > the driver will always need one enable
> > operation finally. And the notification data would be similar to:
> > le32 {
> >   union {
> >     vq_index: 16;           /* Used if VIRTIO_F_NOTIF_CONFIG_DATA
> not
> > negotiated */
> >     vq_notif_config_data: 16; /* Used if VIRTIO_F_NOTIF_CONFIG_DATA
> > negotiated */
> >   };
> >   next_off : 15;
> >   next_wrap : 1;
> > };
> > next_off and next_wrap will denote last_used_idx info, and vq_index or
> > vq_notif_config_data is also necessary, so for one 32-bit register, the=
re's no
> > room for this enable/disable bit.
> >
> Right. There isn't enough room for enable bit.
> I see two options.
>=20
> 1. When device wants to still work with 32-bit doorbells, it can reserve =
top bit
> of vq_index or next_off for enable/disable.
> Here the restriction is the queue depth would be limited to 16K descripto=
rs,
> which is fairly large enough.
> Or having top bix of vq_index is better as, it may be well within limit f=
or a
> device to offer 32K queues.
> For non rdma devices 32K queues is also seems reasonable large value.
I'd like to not add these restrictions, in case some devices need bigger nu=
mber of
descriptors or queue depth.=20

>=20
> 2. Device can offer 64-bit format where enable bit is located in the uppe=
r
> 32-bit.
>=20
> 3. Or may be option for the device with two different feature bits, becau=
se
> 64-bit doorbells are relatively new for virtio to adapt to.
Sounds feasible, I'll try this way.
I'll prepare a V1 patch as soon as possible, thanks for your patience.

Regards,
Lege.wang
>=20
> >
> > Regards,
> > lege.wang
> > >
> > > These two fields clearly communicate to the device, upto how much use=
d
> > > buffer is consumed and understand the driver consumption rate.
> > > This way, there is no ambiguity for device on where to write next use=
d
> > > ring entry.
> > > (where to write next used entry is not driven by the notification
> > enablement).
> > >
> > > And the explicit enable bit indicates notifications are enabled back.
> > >
> > > Technically, only enable bit is needed, but doing #1 is helpful for
> > > the device to understand driver consumption pace.
> > > And for that may be current notification can be made 64-bits or as
> > > suggested in your patch to have new location.
> > >


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

