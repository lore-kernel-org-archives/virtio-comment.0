Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010055.outbound.protection.outlook.com [52.101.84.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BD61E991B
	for <virtio-comment@lists.linux.dev>; Wed,  2 Jul 2025 04:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751431213; cv=fail; b=L9JziXv8IKegUrBclYvCHaPTNlPzvm21dRozcGLNDOvJWsfsjHSkqXKAFdVoXds9EQbhiXctq9CVP2/UWTrmBkrNcxvwaqZ5zoxZlUxdA/BYsxFGn3tt3K0whmX8jDLvgDzoaOCt073BqslkjKRP7ro9qT/m4K+jLeA49l1skus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751431213; c=relaxed/simple;
	bh=35d6SqQ6uVJ58Xvd9ljXXJIL0symvMK7AdBovJHF4Kc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dZkY8LZTHCZx20EbWcAkuWytHiYrN7OfRe3L59uH2sJaVtwGH6P+3zleTvfmncFn1UTAWfZ2Fs/GfZlx6CwxDcZOi3TJOVKDXjsLx54Z6rneLUo9xhcrNeZoUdI0ylnWfkZiYvJ3ZnzDwgm8mpzjMJEx3JMm16Qjertd5v+Yg3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=aYs7ycaY; arc=fail smtp.client-ip=52.101.84.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="aYs7ycaY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jeSXkXhIv1wa9+KerpLJ94nV+DqSbmnBkMG89DsYyC4SAVDG8CwbJ0AiLVFyaXosqhY8uGWwU4ZbkIRxn39g0KmIr3cICOX75saXAf3GYduw+OuDhw9exy1F+hkBK3BUX/+WErc/Q7WQJv2ztjPKvEkn7nKflfh1NeonF96RXR1cG4Y4VNKVudBAFpVu8qJlYudPgIwoKHI+WMHYGbd1NnX3sw0uGEo+Tm02l4wZxwmJJeDuTLP8aZ5tuzVNNaoGviGimVZ5sesUiFVJJQg5YlIAfiT798HmDJCWtK02IZ6yM9ZHml7jyL18xGnMFF1EqT8ZPBdKESFNFXilPBRy4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMmci3AwHkNaTifQo6ZKRFIlY4hkPKDk1pXxX48KEK0=;
 b=aB1j/F9iaeYIaLacEcj/KNzaeDq0CAtFf9FY3lA83JJ82FVcH/Ig1+KFZNUFn0TKemAOAs0R4e5J50VzaOTVE423WgWLKY0UQZzfvtUg4PDINeT0dSfvYdyIJ++6dmYUABOO/Yu4P/INUzDglzwwwgxMY2xB51dySCYxeJh7ZgOkKBtV69hr6zKtBiNKuiQqbYUEEirO+g5za3ftUkYVNjM8gw+Q/YWUY1N5NmsoWgQR9fsDKorH705Yzy9SfObOdT/5N1zsKse00v+kwnfsMPWYfgCswCN+1hxsEHbIGT3FVnZp7pMs88gqhYEq9Ous1Gyv4njiTXVFlpBSuKkI4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMmci3AwHkNaTifQo6ZKRFIlY4hkPKDk1pXxX48KEK0=;
 b=aYs7ycaYM6ONMkP7yPAGwQmfOgZrAg2vDkJ8O13+sQm2xox4PBvNgQs9N3H2MMHPey8Fps2C8jmMiFt4hk+UUpyKOuBPiP6/zQkd7sb0qA9ey793ECfW6X725RPM/FcHUbQbFzYH9uN1WMLo3g0K/n5+4X+Dg6HhWFVjLbPCLyAhQdd9uCCOmOS+1vUUlP8RJyMeOpfr9wkWVCeJmt9cn18se+198sJmR7Bo5SFLaDfDhwyOYZ9N1ADNCq6toS2JytdxfK7NfdA23hRvzklZhpbk+YOK76fTPKllKofL0tnDBBJFpjY5OwT3u62/xKjokCHWvAm+2rl1bu4Kd+uvoA==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by DU4PR07MB10562.eurprd07.prod.outlook.com (2603:10a6:10:5ed::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 04:40:09 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%6]) with mapi id 15.20.8880.026; Wed, 2 Jul 2025
 04:40:09 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v9 RESEND 0/2] Update ECN and Add Accurate ECN feature
Thread-Topic: [PATCH v9 RESEND 0/2] Update ECN and Add Accurate ECN feature
Thread-Index: AQHb5Bd3vE0exnK6GEORn3NYFZmterQeTjVQ
Date: Wed, 2 Jul 2025 04:40:09 +0000
Message-ID:
 <PAXPR07MB7984F5C4CFBB42A74690F103A340A@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250623081847.21264-1-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250623081847.21264-1-chia-yu.chang@nokia-bell-labs.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|DU4PR07MB10562:EE_
x-ms-office365-filtering-correlation-id: aa9e6d83-3d67-46ea-bc28-08ddb92286c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018|7053199007|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3iazBr630gqzBo0yFd41tdNsjXSDvUnegEVxFPapt2G/0GiLUY3X8RatDQd+?=
 =?us-ascii?Q?kHrbVExHScfTricoto4IlWrqlCWA1PGQgFo3+KuTCvTHvaI/poRyqsFVCuDD?=
 =?us-ascii?Q?xOLKPcTyTDg9A38MVc65+aNlx2u2T1oyT/eHBhHsqTf1yvD+uZ5vEyQDXRNr?=
 =?us-ascii?Q?bNSkhEZH1tyfjJfLiZSMbqcF4KRvnj37O0LiD7AajYcJI4YLb+CrAecDLJuT?=
 =?us-ascii?Q?zfZSjpK8HatgCLp9h/9TNf/0/kNG5VeQfYUgpN9LmjVMAFpk14n+DgoKU+Li?=
 =?us-ascii?Q?RRBd60uWnBWdVXi5vlUZYP82pmBYlrijf32mdTngdiaQ3HR9o6NcN7KwLoai?=
 =?us-ascii?Q?auEqL7WYkKtr1Bax+bm5CjydpQO4LrKq4KsWz0Qwro3BMabW/p3PepcvTy6B?=
 =?us-ascii?Q?xq6XPtwSFaX7vFeKNitLuxZDnTjWQtiOlkF+p40NmanoibE7mJkVBQP/L7BY?=
 =?us-ascii?Q?T/8zi3WRHGUi5SyyXVJeU8WyXPcrWzZR4p/1qFGxYlIOlVokxAA5ljhf0OkZ?=
 =?us-ascii?Q?MRZuwAr5P9imtiTwESvLtmtRHufnTsZ1ukCFFNwxNaaPgmkUF/cMte386aDb?=
 =?us-ascii?Q?TWRAfIrjgaVqTs+Lg/rR2rNRiu1FuCmm0tOg8mmsk3qUVUFeXxAE4LSQdp2h?=
 =?us-ascii?Q?ZnZwgC6qRGby7sx4VtnqXcayQ/z/K/GB3FIizHpTf9fMSDjSwF9EXtd+Vqdl?=
 =?us-ascii?Q?cFa7jQciD5CgLBwEZG8YJbWdyFD3QllApXPUEN9XkxhkLjpbkPhaTEcB70NN?=
 =?us-ascii?Q?y7iI3Zu9DSQQwgbGKqw9MYGOxnCKluMne9gZ6juHWv9Ykzros4RsMMbzBwbd?=
 =?us-ascii?Q?Tbz9bgUgOvgLnJUU1q9Yn2GYBNcgZuk7tF0AxYc4QwDqUE4XFl6RL/HGRUWF?=
 =?us-ascii?Q?jiu63Dj2GzfwN1LWiPIz2Amm14tFOTnvAy+NE2+mIQKgWkHO6gJDs4LeNgPP?=
 =?us-ascii?Q?wcU5EQOwq4OgbFCUoHZyj3SO8v4sr89jXTstlq0S4AbGKu6KxjcpZEV+/ZRt?=
 =?us-ascii?Q?JkSc0kAmx258efpfQ+5EP4FB6JIMLBV5M/oIVKa6HTe59MGVcoChUJv1lFKj?=
 =?us-ascii?Q?hZeMsUA7YwePCcGQW+OZll2twm8syoPYGKlr5ZzoKMMJW0MQhohlM1QNqhjX?=
 =?us-ascii?Q?f7Oh6YhbET/C/1AB0x/+sjBky6QyNu7e6KvabUYYxOEn1UD21m7nqkjY9v1a?=
 =?us-ascii?Q?In5O3mndkPlNtTrUdHj3pmYzjcIywgr+JVHJsDUlquVgj+lKR4BrYfGmdHNo?=
 =?us-ascii?Q?OzyhhvWE5YfG/Wl6X4bh5mgYplM/ZB4KXr/QDi4YCjiQOUgRMVAERHR5hoB1?=
 =?us-ascii?Q?UP4cUM/WmRo83nXKOdIUs2ZSuzzBm/OIpjuH4ioZCdJ/gyRScisLQykRmggG?=
 =?us-ascii?Q?immKeM15Msxnpt8F0IY8rin+ehkmd4/7YN8Bs3/GjynJeZjBpskFP4viYq0a?=
 =?us-ascii?Q?qYLyt1lNm5QY3+tj84tD5XtFtlmDgBs4V/eZ5EgKCJHkZ2Len5cXVD7nwtdh?=
 =?us-ascii?Q?hv04xxUI0BhS1BkGyXXeQ9bW9ASrlMxR02jR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018)(7053199007)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tYvguh+mAtaSE+g1CYyI1G1BzqN/I5XZXhVjwct07m0Wrn+aHt/VtCx67VPx?=
 =?us-ascii?Q?1x2mXNZazvwRpt2MJOiBOPHyNM5dhMbuoTgS+pCIkdieWr8zaS/iQ4R1aCey?=
 =?us-ascii?Q?hAfQkIU2fHy9z9badjINXshm41+MT016ysd2rhobaWCKDZXUKiBn3/CCSdeR?=
 =?us-ascii?Q?7nRhdvo190c82Eh6+wtZJ2xnI00+wixv/8nM+98Lo2mj1ZkKjqNHH5rBr6fY?=
 =?us-ascii?Q?NIwS9sQ/etrue3O2IyzA25rl0Eb9ZsvZ45dAWIVTwfeuvGAAWN/LFlbUgGUL?=
 =?us-ascii?Q?86G0RRo8l6wPDo7YdKwSLENae7EOdkp88ZAkBDV5kCQZOR6JQ6PczspIIAwd?=
 =?us-ascii?Q?h+ES00P1NqTnFGpfXP1erqzvfK90N1FYjTMLtKVoOSaG/LDURyIZuAY7Ek8J?=
 =?us-ascii?Q?3BTG6L89AnzHKjsNcrNwZa6/78n9iKTBFIgmfPEi7Z2tZS/Z4IeQaZa4BUTS?=
 =?us-ascii?Q?PLlW6QkV+yBMBon1i661THa0V9rbV8CRkVpIq7v7xu87rmE18T0gO9KEz21t?=
 =?us-ascii?Q?tkza12chQVVKtFWvUL5uwXHxg9wSPFtaIXjpkfjB/aQYvVRq/HP21DJkqq7o?=
 =?us-ascii?Q?I95SfwZXBx2qK79ALWcGuexPX3gnZ+NRvdFIk4yoRP21U8jpTAnIayj2Jn/k?=
 =?us-ascii?Q?6+8yEnqxD+fuPFA4FFYMiOWpNlU9tgbhHFkI9TvsW8Ov+ylg3V4umvu9BPQc?=
 =?us-ascii?Q?QsokYCfApbfSeKu6lUbH0TDYUEZsrS6SgMsX4ur18MMHiFP754DSJ64v6wM9?=
 =?us-ascii?Q?rWr8O4aovnfoXmlKCFum/ZeNqg53ExqAK1NyR1XR5JI68yaGZZMEC83g14zJ?=
 =?us-ascii?Q?APumXYxBf4EdfoWA76lUCajKqhDNj76vIMoNAfWH9apMA7I/WJF7MLNe9lEp?=
 =?us-ascii?Q?AF7CU4JBhlWA3iP6ZlKI5bfWqFZJMzX+/HUXIpiliCAkLntNFba6xjWR23WY?=
 =?us-ascii?Q?saCSMQ3crYnnjJhQIMCv3aRkqwr7Ndb1+5ak2ddNMN7b4fqE9A5XBds5WrXK?=
 =?us-ascii?Q?fmjYXHsDr7JIfZC094Z8vCCldAO5IDiy6bnwdlOPFlM8IK9Xz8NVjn3xTnka?=
 =?us-ascii?Q?vkd7CRksS5m03Kf93LeYD/WWMadMDLCwYUXEK2VDRU2KeQ+fFgSfRUQd40v6?=
 =?us-ascii?Q?qHhJ9+ugBqQYPkN2yp64ZP27Owok/rf+uB2VEYuwc+EaBJX7JaxE0/UEJ4H1?=
 =?us-ascii?Q?+FwDQ69NesNt9jHE8YmHgMPlKWaz863gRm9i2BM4auSUWjr4tktqLfjTpywR?=
 =?us-ascii?Q?r3iIHG+OOgKTBMxX5WeNA66BGjacG6HgsSbJ7Sl1gxgMASDeWopLpadm895x?=
 =?us-ascii?Q?wCy/S8LB83li73nacC8wnkUlLQtvwGtikPHQUxK0zeeTIA/BY7gK37+qWfe4?=
 =?us-ascii?Q?RhAqZJgP3ayXNEripEVif1dP6vo+y5sMBVdRO9kfcuoIMcVrZnNudwxxHI/D?=
 =?us-ascii?Q?0o+Ygw0mWQGcWNeUH53sKHrvcrc/oRTTWeRAt7xfDR2ge0irZHY5tHzzPIeA?=
 =?us-ascii?Q?pkrfDN767ROTsasP85eRkws3jg3EOkBdjpSCllRjkhKAWpT+Dru9NNZZ+Z2x?=
 =?us-ascii?Q?M3r+DpdotV6YklyFFD/mS9acjT81v+Qo05s4Y95SMUqoLhdA8jdYU55VMM6i?=
 =?us-ascii?Q?GQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB7984.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9e6d83-3d67-46ea-bc28-08ddb92286c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 04:40:09.7403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDvQ7FfONmgD3UbcG17koFjT45e4OZGiUhkj9AveINoPf16ARJugDGXxkU6N4+QVMRq+tswVsdGNI+/qN4s27f561jo9JaDu9VwzNgowd0YjfAywnTPJmFjPSPMojrOJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR07MB10562

Hello,

	Just want to reach out and check is there any comment on our submitted ECN=
 and AccECN patches?
	Thanks.

Best regards,
Chia-Yu

-----Original Message-----
From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-labs.com>=
=20
Sent: Monday, June 23, 2025 10:19 AM
To: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mvar=
alar@redhat.com; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@=
redhat.com; ij@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <=
koen.de_schepper@nokia-bell-labs.com>; g.white@cablelabs.com; vidhi_goel@ap=
ple.com; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v9 RESEND 0/2] Update ECN and Add Accurate ECN feature

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Hello,

Please find ECN and AccECN patch v9, which aligns ECN functionality with
RFC3168 ECN, and adds Accurate ECN feature. The Accurate ECN draft can be f=
ound in https://datatracker.ietf.org/doc/html/draft-ietf-tcpm-accurate-ecn-=
28

Best Regards,
Chia-Yu

---
v9 (19-May-2025)
- Update descriptions for VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_HOST_ECN, VI=
RTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_HOST_ACCECN (Michael S. Tsirkin <mst@=
redhat.com>)
- Add reference sections of RFC3168 ECN and AccECN (Michael S. Tsirkin <mst=
@redhat.com>)

v8 (17-Apr-2025)
- Further typo fixing

v7 (15-Apr-2025)
- Fix typos in AccECN patch (Michael S. Tsirkin <mst@redhat.com>)

v6 (14-Apr-2025)
- Shrink descriptions and make more reference to RFC3168 ECN and AccECN

v5 (06-Mar-2025)
- Update feature bits of VIRTIO_NET_F_HOST_ACCECN(69) and VIRTIO_NET_F_GUES=
T_ACCECN(70)

v4 (05-Mar-2025)
- Update commit message of AccECN patch
- Add reference to RFC3168 ECN and Accurate ECN
- Simplify feature bit descriptinos to avoid duplication of text

v3 (21-Feb-2025)
- Separate the original patch into 2 different patches
- Fix several reabase issues in v2

v2 (17-Feb-2025)
- Rebase the patch on top of v1.4 virtio-spec

---
Chia-Yu Chang (2):
  virtio-net: Fix ECN feature descriptions
  virtio-net: Define Accurate ECN feature in virtio-spec

 device-types/net/description.tex | 83 +++++++++++++++++++++++---------
 introduction.tex                 |  6 +++
 2 files changed, 65 insertions(+), 24 deletions(-)

--
2.34.1

