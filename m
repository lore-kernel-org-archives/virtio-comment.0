Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2079.outbound.protection.outlook.com [40.107.21.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5720317A2E0
	for <virtio-comment@lists.linux.dev>; Tue, 15 Apr 2025 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724031; cv=fail; b=qTvkTqHe0AkFNzY7k7MADTzrZ1201FjRNKUDDDFlMEwV8TGbyYvOYnXA2A7zgGtGdCA/512vDC8opTz/hOsslTj4Bh3jAiu6fY5264uIj3OflyPJpqRqbwG3OMW0ABXsEggO6au2mYaoVwPSN10AaqwMmz9AWahTPu/geOCEfGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724031; c=relaxed/simple;
	bh=jitCcDfxbQ98QlX+3OKa4Knn2kiIH4U07fJIJ6PxFxo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iEBai6dXgqn00gyYG090QDMo8qddSV/JwNUA8xRwzG3mDa3MIfB4xi2nlxAgC1XaTq1Kgb0Fd5z0LAP21fDmb22a6OMlfW2SfQqlP+UApwy1vUKmOKNPMXtaSn1u8pgj2iuPXzpaoTwx3S0g4hGG/ywTGXeakIxHPvHLhJD3QkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=JfJztVF2; arc=fail smtp.client-ip=40.107.21.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="JfJztVF2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KC9z7i+k9gG6CW3e3YuOZ2csV+jW2QQk8cCOktKZ7CM3z3v/ZTXAlGQ4CVxq76YJzICYE1G4w37A+PyCFj2++4oESaxq8Jbx2/zk+E2VfRn9Em0pn+SN7i1mICozGRyrW3EhYUyX2aLPEdRh3vM06Cpe2QGiYvJEvS7l/6cDD2c5EW/Wv7S8O3uqYQlnAdq9xB157frZmbfTBEJGedHRUUp5sQtQ37gqpwntyFTLx9Z14lxeIZHWJF4Td39WCAvp+yKG8sAuWY9KFfbMraeve58G+9LJKvyIl0HynzdWXlmIqCho2AIeIegUhsgoFcr6q67A70ebb4qdy0o6PCQ5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSmi1aw1Fbpbx78bfB1L4qQMbdesJ6KQHVXeRtXsEmw=;
 b=kLBgOfYWCKWUh4spjtPx5C5xpI/aeuZNiXmtMSG0VgXESqUl+5LbTqEhCFCtivBNDnTtPLJ/gTDy3zBJtKSKwGQk0x/jkTybM23QsbM72BsqFAfAw7hkg3BmXZHUwW6BRznBA1Unubeo1fSi6b7DNlpEVpVRxwjUdychgH0Ofn9XP5T9jDBXtdmNUQmhD5FLh6Qqa5HViRc8KOgKTKpd4CswFvQ2GOwa5hxi6ZFF2q83U27vadli4fPTKQnX5MzH4eFmWEp9hmHse+8EsAYBMSUQOchLp9MXNQGkJrpAZ00r2l6/xRcHzlJUtMYldvYOk7agYw32Cv90I7yedOyEEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSmi1aw1Fbpbx78bfB1L4qQMbdesJ6KQHVXeRtXsEmw=;
 b=JfJztVF2DrVpEWUuQ6OwvtL+Erqpi2/Mz4DQVc9mDJBBn+lyx8FeTyB76N2B6tzRtYYxT4ECoOflEK3kBXY8MVH4SAjqb8i19VQS7oAbVTRARwfr/T1LSS0J+fctXAgFAzc35i9vXuYHxrA72hEu69G5gZLXWIaK/+L9u6NZEhr2w9PRKA1pIJi6J24OHYH1c8vPdBHhD1/i+DPCWNaCvPByU9BMxq4W+JvIlyF5zIlVFz2PQdYZo5Ei1Yoz5Umyv1qBWisLVct6eKdI8NNP8yvhXp1+6SkMFyB5HODvRim6brcRdhABoA+0qMfXXGSJorAo2sT+xY7m72JUq5g1Ag==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by PR3PR07MB6684.eurprd07.prod.outlook.com (2603:10a6:102:2f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Tue, 15 Apr
 2025 13:33:45 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 13:33:45 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "ij@kernel.org" <ij@kernel.org>,
	"ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, g.white <g.white@cablelabs.com>,
	vidhi_goel <vidhi_goel@apple.com>, "ingemar.s.johansson@ericsson.com"
	<ingemar.s.johansson@ericsson.com>, "mirja.kuehlewind@ericsson.com"
	<mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v6 1/2] virtio-net: Fix ECN feature descritpion
Thread-Topic: [PATCH v6 1/2] virtio-net: Fix ECN feature descritpion
Thread-Index: AQHbrVK6AlCcGr9NRUmY5dhgEWjGErOjg9aAgAE3PqA=
Date: Tue, 15 Apr 2025 13:33:45 +0000
Message-ID:
 <PAXPR07MB79843BA9E3B951584AA3461FA3B22@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250414153425.99726-1-chia-yu.chang@nokia-bell-labs.com>
 <20250414153425.99726-2-chia-yu.chang@nokia-bell-labs.com>
 <20250414145806-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250414145806-mutt-send-email-mst@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|PR3PR07MB6684:EE_
x-ms-office365-filtering-correlation-id: c93024a1-5901-4e12-13b6-08dd7c22258a
x-ld-processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?FXIfok0gjD8Gpo0J1pKlNz9/JhLv9Y2PzlFNzqkO40tH4QpAVssd55tbeFWX?=
 =?us-ascii?Q?+MUmqB7cQ154nC1WyJx+qO+s2SihMbbbNkxTrcWIToc3FcsHk4K1dV/HRc3w?=
 =?us-ascii?Q?eOu2rmHVMYXyXwmF1yQpX2IV6I7TUefIwsRTA6zzKmDRr1zdRLdVOYdeIyBT?=
 =?us-ascii?Q?fNb6zCsuXNbK84s8ewDKGRxYFwAUnAQBSwxWVnrSkbRmDpBsKu0x6oAsZ6py?=
 =?us-ascii?Q?Bf3uMF/tYkI56M0f1XeD6Mm9TnEhiaLBqCTOg+afz6cS06HVG/hurcALGJLD?=
 =?us-ascii?Q?AiJmjEn0haZJGufoy4ht66TKTSyOAz9Tbwrn21bGWzIGZZq3NPuNt/QtMBzN?=
 =?us-ascii?Q?3HJNyd3jZGkOUnJXxe4QGG+W/9+Bqk9k6MoTqwMFHKHwCp2BIT1i5Yh5PCSe?=
 =?us-ascii?Q?vX9ozO4KFq3o8FIZZpe6YUWe6g7utQFCeyrSnXD6pJeXDUyJyZL21eyMMypX?=
 =?us-ascii?Q?1y4pjsbyVa3hdGElSQPTwePck1d7gDKtP7IWahxzUA0FONpkMKfU21MqlzQ8?=
 =?us-ascii?Q?YdIj8VGhk2WeSqUCUfS4D/PPxw//uVh9186A0flY0Xa1DGEw2P5jXVx1vpDx?=
 =?us-ascii?Q?F5E+vEWOERoISYtqk4kWV5rBfqlq2d4ANYrJ2mkgQjmgAm+k+cYKVqZgn79C?=
 =?us-ascii?Q?9rckDWDhx2qLQEV2agktSJbvbNP9/5e5GVHcTBAu2gMZQYRkLinZ1QImQE/5?=
 =?us-ascii?Q?WRY3dN/RK5YmW1w6voMV7ebStHzjzsbIKzBvEsq+ryhZkepP9VFeA/u93BeG?=
 =?us-ascii?Q?uIEhJc2y/0a9hteYgj5nDGqpysCjNEVne2yJvywun6zIv/qfgY92XpWuLmoG?=
 =?us-ascii?Q?OyZ9msAltjh2w42ILoKuw0D9+XiHQPAlppC9GzCSe0nqYzmgtwD4hm2xHQVH?=
 =?us-ascii?Q?m2EDpDPG/KF9Yd9v+XbIT2bMoREhxzNj7mh1hqSQEHz10z4btY/KYj8K3lIi?=
 =?us-ascii?Q?Cjr8+RYWpXXsig/qt5rKqJByfzcgTkDBLXF56RTx34TU0lE1zk5y1eW6RC58?=
 =?us-ascii?Q?RthWlifq+fgRp+tOLJtsxsRjo9rIb78e+eUfhRPjXUf9kCGnE49OTCJBlt4z?=
 =?us-ascii?Q?CuD6bGGiVv4p1j8nPzAO2szPm3toF1vejfKO0lhM7CFPGXJrWjvF0Vt+QIpM?=
 =?us-ascii?Q?TT0pj681MSGlYtghH5I4ic8ggUUn+BjSxQKXQxmTlYwFGmrtCCnlFQHRcb5H?=
 =?us-ascii?Q?9G7t6bH/4kA2CiqLp1ySMA+q+OO497KFB8U7rHm1aM0O3zfFH7ghhFjRHaMq?=
 =?us-ascii?Q?oe8mE9tXf74j06l272fR3fY5RQLl7ceeyaOCRa8mDyIHBLB/SG3xxXgGJghC?=
 =?us-ascii?Q?CiP3lMlQ7nFY9ocnvL9i0YqCPiDNU318EDweRloReVQx9M1hEK32GOs/LNTI?=
 =?us-ascii?Q?ZFmz53LaAup+2FZsGXcsBL/9xIDFzMhCinbFnd2I4cyEYR2A4wCl5PkNdyj4?=
 =?us-ascii?Q?bOFaXlZVmnBY2vnAu0fQAJWPVugdE5EailS678gAl80sMsfRmjP3xoCJw98l?=
 =?us-ascii?Q?8LQvhf9dKbs3WgU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rl9ssWH22lDH1BTlmFTEb6OvHWH3tYkwk6JPvJTkh3X8c6jWQwTGMFWAAc0+?=
 =?us-ascii?Q?xAG4KH0xUwqYIwrFNIZA6bbZgDXwURg714r2wZtcuXvdDfPPAftGLIrfEvwc?=
 =?us-ascii?Q?IEaLJLws+Bu5Z+fKNTbTXq6LwmjPW+9vrGdWvBNpLHe2ThmVef3XUdtiS0UW?=
 =?us-ascii?Q?j4NyT5powJABD3PL75jRb4i2XTffMjNUO3eHp/Cz1WFDgoBdmuwyFke5nkm5?=
 =?us-ascii?Q?I+blwNhFt+ZYu6RrZUWzV5fOTbSX8oy9VO5Gd1LLfgCooGSXaHDgJWkY5nRY?=
 =?us-ascii?Q?yICnu83lZYfFA6dIS2u8jbr/AOgmMJ2Y98HI5rlWqPQA2Q+oVBu4XbGqfmAh?=
 =?us-ascii?Q?P4owHYT1KT1HsV6rDvaHXqMO7/0MPDl+xlQ4N7S63jL5yTW9NdwnyJ6YQxwf?=
 =?us-ascii?Q?1gfGm+u2DmRbdI/21wvHfWlk7laK6R+fCuZo+I/1DP/8QslOwcLs+ItlEeJk?=
 =?us-ascii?Q?+7qAwVB+7WUkhgl4m9XnjDhiK/YJDV7i1fioEGtW5DoPVjvb7oqpkV7AFpdv?=
 =?us-ascii?Q?p2Qui5cxS25zazYEiRZLEqqnJvz9b9vs3wtvFrjtjUYTNkaAFx4wupTUGR2i?=
 =?us-ascii?Q?TGZj3+ewMcFNfEUZWZ/krIKNtVIB5YgLTO8Kks5g8tR7ZsFqLPRAVIFBzFXV?=
 =?us-ascii?Q?z//yaoJqKf6DM4t1He1z6NhMd7aXJHopksMJJOvCBiV3dPz+D0r/Sf79rWET?=
 =?us-ascii?Q?bq4DRilsl2beRDuYTvX2se/Bj8YwG2F3xo5np5NqeecPjctBpFamI8TVx6l2?=
 =?us-ascii?Q?bVxddljO8RrICd4powS9Vdl6dltZJiwSfrAwQmmsIlmiRVrlOpQOC/lyMz8a?=
 =?us-ascii?Q?vlcnNKKOOIdFxgzqYFyecZY6OCmAeky6ZjWVlsivFYEHv+ND8xYhHGD4X//o?=
 =?us-ascii?Q?lo0NU3og/xIhZQshvmDP1xcHDaskHKFQdlhOSx0WEX3BqfR3lwxQcLDup/Rl?=
 =?us-ascii?Q?BESETrla+RrR8srA4E/u5/8YdyYLI4V/huIerYygxH127SINtJ9bLdCU/SSs?=
 =?us-ascii?Q?GXHvCW11ATowJ0jZDDyD91lexzEQW75ECptdoo1jeuB0oDaatCfatTjMF3X3?=
 =?us-ascii?Q?tp7tgUmh+4+MyoMop7TJ1SJZL5Yg4ovXDekewtAtNeu2gGVtrMCk0mu4OI3w?=
 =?us-ascii?Q?KHF1yA7PJ1plLuMrKxlwbtf7WS4ux3oWERnpxqV/4LLSmAd7lXiFm1YYk9u1?=
 =?us-ascii?Q?/zEV2mZ3ZPmVdyEndbZmP2ft3tQtdmAb9u6OxkuUbapjU46DQI8HHF1MGrJs?=
 =?us-ascii?Q?mxV2y9GcHDWSgJQV5uV1gGlfc9CqNU740AI2y2yC1RGqGcTCG5Q0PFXvWAQB?=
 =?us-ascii?Q?fsp5OT8ZcOQMrxzp/T0pGpqpuBr2IM41oK8xVdupbgJxyFylryeptpa9PuOP?=
 =?us-ascii?Q?ykFDX30b9SJvACCpHL91MFism/2K8fPJ61yHf314RP3zH+aNOiQWshzxZwix?=
 =?us-ascii?Q?PIN75PpipOjvBnk+BWlx2RJu0PCL0zerB/vDyBziL/y545iVNMAZc8DDxMU+?=
 =?us-ascii?Q?YMSMIsC5ml/FYOPtna1yLB0WACdslZbkjpVYntNUTAtUf2i/Yfj05QLbuFv3?=
 =?us-ascii?Q?eHWjrfY4QLP7MzMY+YIwhW0lspzSfy+P5JXulBus3sF1SBn0eW8G8MmIC8xp?=
 =?us-ascii?Q?zg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c93024a1-5901-4e12-13b6-08dd7c22258a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 13:33:45.6835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: naqPgL5H42y3PYvejwrqf9LA+b52u8F7YM1cSo6nAY2Kz8xHb1daiGdo5flD16guFXxrdhs46mVuoQM9JmuGyfKDOPKIJiokJs+LHL+MWfFhY9OWherO+rBF7/qqT8BL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6684

> -----Original Message-----
> From: Michael S. Tsirkin <mst@redhat.com>=20
> Sent: Monday, April 14, 2025 8:59 PM
> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; mvaralar@redhat.co=
m; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij=
@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepp=
er@nokia-bell-labs.com>; g.white <g.white@cablelabs.com>; vidhi_goel <vidhi=
_goel@apple.com>; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericss=
on.com
> Subject: Re: [PATCH v6 1/2] virtio-net: Fix ECN feature descritpion
>=20
>=20
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>=20
>=20
>=20
> On Mon, Apr 14, 2025 at 05:34:24PM +0200, chia-yu.chang@nokia-bell-labs.c=
om wrote:
> > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> >
> > Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean=20
> > that TCP has IP-ECN set, instead it identifies TCP CWR flag is set and=
=20
> > will be cleared from the second segment. This is used to offload TCP=20
> > CWR flag in a way that is compatible with RFC3168 ECN but is=20
> > problematic for non-RFC3168 use of CWR flag.
> >
> > Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > ---
>=20
>=20
> if this is accepted, we might want to backport this to 1.3 maybe?

Thanks for feedback.
In my opinion, this fix shall be backported to clarify its relation to RFC3=
168 ECN.
Shall we make further patch, or you will do the merge once this patch is ac=
cepted?

Best regards,
Chia-Yu

>=20
>=20
> >  device-types/net/description.tex | 33 +++++++++++++++++---------------
> >  introduction.tex                 |  3 +++
> >  2 files changed, 21 insertions(+), 15 deletions(-)
> >
> > diff --git a/device-types/net/description.tex=20
> > b/device-types/net/description.tex
> > index 1b6b54d..a2c9de8 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types /=20
> > Network Device / Feature bits
> >
> >  \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
> >
> > -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> > +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with TCP CWR =
flag set
> > +    and follow the ACE bits handling approach mentioned in
> > +    \hyperref[intro:rfc3168]{[RFC3168]}.
> >
> >  \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
> >
> > @@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types /=20
> > Network Device / Feature bits
> >
> >  \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
> >
> > -\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
> > +\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with TCP CWR =
flag set
> > +    and follow the ACE bits handling approach mentioend in
> > +    \hyperref[intro:rfc3168]{[RFC3168]}.
> >
> >  \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
> >
> > @@ -695,8 +699,9 @@ \subsubsection{Packet=20
> > Transmission}\label{sec:Device Types / Network Device / De
> >
> >    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
> >      the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> > -    indicates that the TCP packet has the ECN bit set\footnote{This ca=
se is not handled by some older hardware, so is called out
> > -specifically in the protocol.}.
> > +    indicates that the TCP packet has TCP CWR flag set and the flag wi=
ll be handled differently to all segements of
> > +    an aggregated segment, as mentioned in \hyperref[intro:rfc3168]{[R=
FC3168]}
> > +    \footnote{This case is not handled by some older hardware, so is c=
alled out specifically in the protocol.}.
> >     \end{itemize}
> >
> >  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO=20
> > feature and the @@ -788,10 +793,9 @@ \subsubsection{Packet=20
> > Transmission}\label{sec:Device Types / Network Device / De  \field{gso_=
type} to VIRTIO_NET_HDR_GSO_UDP_L4.
> >
> >  The driver SHOULD NOT send to the device TCP packets requiring=20
> > segmentation offload -which have the Explicit Congestion Notification=20
> > bit set, unless the -VIRTIO_NET_F_HOST_ECN feature is negotiated, in=20
> > which case the -driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in=20
> > -\field{gso_type}.
> > +which have the TCP CWR flag set and require the flag be handled as=20
> > +mentioned in \hyperref[intro:rfc3168]{[RFC3168]}, unless the=20
> > +VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the driver =
MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
> >
> >  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
> >  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the=20
> > VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit @@ -1105,9 +1109,9 @@=20
> > \subsubsection{Processing of Incoming Packets}\label{sec:Device Types=20
> > / Network  \end{enumerate}
> >
> >  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL=20
> > -and ECN features enable receive checksum, large receive offload and=20
> > ECN -support which are the input equivalents of the transmit checksum,=
=20
> > -transmit segmentation offloading and ECN features, as described
> > +and ECN features enable receive checksum, large receive offload and=20
> > +RFC3168 ECN support which are the input equivalents of the transmit=20
> > +checksum, transmit segmentation offloading and RFC3168 ECN features,=20
> > +as described
> >  in \ref{sec:Device Types / Network Device / Device Operation / =20
> > Packet Transmission}:
> >  \begin{enumerate}
> > @@ -1210,10 +1214,9 @@ \subsubsection{Processing of Incoming=20
> > Packets}\label{sec:Device Types / Network  the VIRTIO_NET_HDR_F_UDP_TUN=
NEL_CSUM bit in \field{flags}.
> >
> >  The device SHOULD NOT send to the driver TCP packets requiring=20
> > segmentation offload -which have the Explicit Congestion Notification=20
> > bit set, unless the -VIRTIO_NET_F_GUEST_ECN feature is negotiated, in=20
> > which case the -device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in=20
> > -\field{gso_type}.
> > +which have the TCP CWR flag set and require the flag be handled as=20
> > +mentioned in \hyperref[intro:rfc3168]{[RFC3168]}, unless the=20
> > +VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the device=
 MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
> >
> >  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the =20
> > device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in diff --git=20
> > a/introduction.tex b/introduction.tex index e60298a..d52622e 100644
> > --- a/introduction.tex
> > +++ b/introduction.tex
> > @@ -168,6 +168,9 @@ \section{Normative References}\label{sec:Normative =
References}
> >      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Wo=
rds", BCP
> >      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
> >          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> > +     \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> > +    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN=
) to IP'', September 2001.
> > +     \newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
> >  \end{longtable}
> >
> >  \section{Non-Normative References}
> > --
> > 2.34.1

