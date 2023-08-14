Return-Path: <virtio-comment-return-7072-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6220C001DB
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 05:15:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1C7372B009
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 05:15:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0572498634B
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 05:15:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E0BE3983F78; Mon, 14 Aug 2023 05:15:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C82C898633D;
	Mon, 14 Aug 2023 05:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnuW4avfskALFWTCSrzV7y4orGsySDZOAm8OKRgySVVIioTRXJaJQXhCP1vmoYisJXWZptrXucuigyidt29PvgFZEMqjEEI+BD01UJ8L03XsA6cQiB8mRqts4cf24EeFoz+bxFn1ctSHlUBNkThQP/AOuZYwfROiMO3pxkE+FdeolTzErFHTVhSb5xpGDQN7IcYCo+LpsHgS2nN8ywWrLGVFiTDb2YmxJhMyRwKTeRMl8o5pDJ0MCAcUDQWML+Zk6lTLNlF6KVvoxxZoNJ71CT1MtCQCra53FbtBK1g36/afNBjz6NMRya3zpQBSOgupR8VsVrVB/rOiOuhRzAAbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIGCSvrCY9THFI58bqEazjWehlGhYkkQ6Mbl5hOTjVM=;
 b=S+87GHw8N7CnuqbxZiWVRSBRgH8aN2ncPqS+3FKaqCx1f5JMB4cTduIwzR9/8nCua1sijJ1GaPl0W9RcIz3rzD9++uSDa6o143xCpzAeWN6hyEbvknLWCSYJyBUtbjIK/N66HeY+x5uDS8Es6VUWOO5I3YQ/yX6VNaD2HJQLFk/5PLDqxDTPnjd0557RCh1Qf2a1KeeeFdtI9lKDC9XDSbGPdrszaztqWfpS2AliLSyodcRcuVyA2jjYAYyXCS0JBq9TNlJXRmW4qljrlVqOMqr2OyotGoH2e9tQovUSEhFFPvN4QQzk+SHxulXSpfKoXw84tUMCOVsIG5bsFb6EQQ==
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
Thread-Index: AQHZvd/S1zVkOCRsJ0eCMof906XE7a/XL16AgAEzr4CAB8PvgIAJOOHA
Date: Mon, 14 Aug 2023 05:15:06 +0000
Message-ID:
 <PH0PR12MB54818794DB300C190CD92728DC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <20230802152525.GA13690@h68b04307.sqa.eu95>
 <PH0PR12MB5481538EEC183EBE3FF16234DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230808082145.GE11361@h68b04307.sqa.eu95>
In-Reply-To: <20230808082145.GE11361@h68b04307.sqa.eu95>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN2PR12MB4096:EE_
x-ms-office365-filtering-correlation-id: 23ed6778-ed1d-4948-26c0-08db9c856c92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oBwwJCj0fr/9BKS4idN4mITtmbrrga4f3pkrNdcnErU19wlSoDNRDXKDw2I0enJCPzHNK4/pLffHjWcng4zj8jS0bSfXN77UL5EkMBolwtWZWakRsW37fJp35QERfaM+L3nFaFXxqBMmFbtrV40WLn/QNS3kB77sLSN4uLby11QuihZ5HaCvVb/lsz64d1/NqTN6G08D04Cyusc7xdXc53Qwl1FR0XlscXyLzFI3oKKjn6SHwslTZVz3R4Zbe0FMIDpwBUmWHnuWQk73g99gyDkqyf4BrctmUdVa/hIV7/Ll8gSsgFBvwEL3Fcs1Bv2az4HjYm8SnqHrsX0knacFW1JY3r2kCHces9+WyiWEHCu6BQPGFVg4UTz7jKmclNn3iRSJmTA3VM3yei5VDFZGG1xf/1VJOsIrxW3ex/EYEMkjPiNhl/YPOAd4yzvSG+Yvynf2ur6Os8uh5TnhN+CDEdzKfWSL0L0tLHHDG+047qR67Coux7sTS2Q1+kq3k2qTj9x5SBfS9aGpt8kZNp4YyByciqm50feEUp1tiwGh/h+oE6Bd3RJJrqBVAHPZGXMzgbCeIsSdeygwGEIKhj5pyxgvglpJAzYFM4wVjIkhj/LFy/57po0t2Z3GQ4pLL4fq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199021)(186006)(1800799006)(9686003)(7696005)(71200400001)(86362001)(54906003)(478600001)(55016003)(26005)(2906002)(4326008)(316002)(76116006)(6916009)(8676002)(66946007)(66446008)(41300700001)(52536014)(64756008)(6506007)(5660300002)(66476007)(8936002)(66556008)(38070700005)(38100700002)(122000001)(33656002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3v2xVD3QMsWHTM+UaMemVb73+h7rxetGRwhMkCgjGvW+n4E2aUR3Ho66s+a3?=
 =?us-ascii?Q?t73bLp5D1n0VzBiJ2b0t7curnldDeeQfcng+Ri8m3jlmwjMocjAjaPfn2e5e?=
 =?us-ascii?Q?sWrlCkqQu5Zm8BXXCih5zvz0O7flpF5H3aafaH4NTXcBIAh8kCO1KGrI5bIj?=
 =?us-ascii?Q?JUO/lNUzKErYESX5NpW6/s+vc5VgobM/FvbDafaINcaNpB9Dr7ok93oNTS5d?=
 =?us-ascii?Q?67+IHDttDFHKLwCG0Hlcdbcm6eb1CztbkzeMCsvgZ3VdjTQLwQQRUr7WE/Do?=
 =?us-ascii?Q?u0H/BTIcn4bFXYRGuTMkaIO98Q9y4kMaqU3xqgdn5r4IRbkLtTMco7HMoQQR?=
 =?us-ascii?Q?RJvLuQ4w8nlQIqrSbOzwkDDl9UMaE+o9vBxrzr9FeZadtsHMim37emdUEnbK?=
 =?us-ascii?Q?caw5XzUPKIL/QOqeJrs3UbhsR0hG91qfcmNgTZB3/TGzm1ZxJLyBR+fX7lfH?=
 =?us-ascii?Q?Bv6PpMZPAvmgvIliwh13PIhwdDMUMhckI13iTQH7/TIp8AYzaUz8PIgs2uLJ?=
 =?us-ascii?Q?0gRPeQTXIQuYQ1WM21P4H31ixG04OvQVw11lbArv3tqby89rEEqZ41MaFThD?=
 =?us-ascii?Q?7YoSh0h5MxEsrPy27bAdK5W0V+W0yR6yUvPXqjDnl5rExIErzyec0iGfWOLl?=
 =?us-ascii?Q?WyCyqLdxE6mX7MTYneqS2LcnEuoUzew0vdFaBQsNVmMN92TQAwirYfBKztKe?=
 =?us-ascii?Q?O22ibZWSwHCafSzf6bktZRpHJHcCjkq1tXquDB9hgnROGutPi0dEAC7UbGaW?=
 =?us-ascii?Q?kVPRWGpUXy2Ln1TSd6cOv4GQMUwcJ6UgmW8Eg94LDGAov2ZygVptxfy++g76?=
 =?us-ascii?Q?oUwgW+4JCAkKD8DTbdZ1hrG8gxy+9VJk/hjhu9ebiYQ4GL1CLP7tV6WT1fl2?=
 =?us-ascii?Q?Rzr+bmzquHY8ARvltrwXs0boDMGxtL0exvcFuNrSeKTWRXe6b4ph1QesaUT2?=
 =?us-ascii?Q?Bli+MggJ3NDUi/2GqigLTAtj2izHLWFFFCvZb1c26tqvwMSeP7iMuXdVr8r+?=
 =?us-ascii?Q?aptCDE/jxOdSErWPHPE1irF1q+J64gWQoSUJox5+bvBIHi1bsYwIwHVkbg2D?=
 =?us-ascii?Q?g+4ICFu9xqwQCXHiAk22UbNBQuNgO4kpYCnu7/Itg9ude+qQX67yPSl2BUAm?=
 =?us-ascii?Q?/MJ09y6y+7UxoG3g4kbcooyEg2jAzAecrHWAVgNSdOXjxcFpIyf5WeSa7VN7?=
 =?us-ascii?Q?fKWOShOBeimgRw8yeO9v+sumdhy8F9MVr3QFrMu+j6/BAzU1B+0XZgRw3dI9?=
 =?us-ascii?Q?GShFFHj1A2huNzLVPuQmC3yqMmwZ8p1ALZafVjuuSbTlctFfo5l6Qry6Xuv1?=
 =?us-ascii?Q?+rUy2gokj/7wenUU4rHa9sxceT66e1/hQlRu/PVb4iR6JcQEallpx/SKvUxV?=
 =?us-ascii?Q?zXy6IWMYXifFKilfDDfaUb8CCFSrC+Wa3sbTrSja6O9POmdmmwP5yGyxfAJ8?=
 =?us-ascii?Q?DRaeyUyzLkWMzQ52rkFYi/e6pDm7eK7ns/qwpQAESlrkcS8F7kjH277wAJ6l?=
 =?us-ascii?Q?vyGTrlrsmnbCxo+Qvfcva0kK/hkolJAt/HVP5ceYB/fsEjQNSslUBfAZMlwY?=
 =?us-ascii?Q?qr4sF21MzIenMrHQVgc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ed6778-ed1d-4948-26c0-08db9c856c92
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 05:15:06.8644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4I47CWjhIcynM4Qz71gmJzK86kvsTDkZbAHsmYFmLwpAKikiryM1/stKWaseFWKTXmX4R9jQ1IdA9N/nhIYJHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
Subject: [virtio-comment] RE: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements

> From: Heng Qi <hengqi@linux.alibaba.com>
> Sent: Tuesday, August 8, 2023 1:52 PM

> > Yes, but having single interface for two use cases enables the device
> implementation to not build driver interface specific infra.
> > Both can be handled by unified interface.
>=20
> I reconsidered the number of groups, we don't necessarily have only two g=
roups
> for the time being (one is RFF, the other is ARFS). For example, the driv=
er may
> maintain groups with different priorities for RFF itself (for example, ac=
cording
> to the number of fields contained in ntuple, etc.), and the driver may al=
so
> maintain different groups with the same priority for different flow types=
 of
> ARFS, etc.

This is fine and covered with the interface.
Number of supported max groups is device capability that is exposed by the =
device.

How many groups to use and which priority assign to each is driver's decisi=
on.
So more than 2 groups is fine and supported by the requirements.

In Linux net device example, 2 groups seem enough, but spec is not limited =
to it.

When/if there is switch, it can also create a group and filter prioritize m=
essage before it reaches further nic processing.
But we can keep this aside for now to not complicate the discussion more.

So in nutshell, single interface is able to service the need of both ARFS a=
nd ethtool programming.

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

