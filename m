Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B811F585C
	for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 22:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744927473; cv=fail; b=tPs0qYZDGSK5KHA56MpboDpsbuEyUsWP25NHUT/2uD1EZr7srwLLRkibzmxu4Oeaa91URdEFPtKWCZjlnOSdLn3V6hvHEEy9fQ6WDOvAvMGSIbbbqeNNhQmoid27chKzLSwWdI3yMFlDZ5lbP8i+sumIRKMT9HkawFZn6TVX9Xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744927473; c=relaxed/simple;
	bh=EYQAHhC2YX+7Opi+DBf8RCBJ6aWp1G9IIASaLpzo72A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fd/P7n6PKmgJAMdA85RPYcQ1Meh4xteyNNCNZWjnzed2AY+YKv6ZfjL7Upszzu0HE2P/eLvsbfa51BD0RHGbNKQRpLItfikoUrAPOc5qI60xZTli+cZg1R7AEYPkuOMl3MGDiD6JWSp9CNu3uZeOEUjK6f0r4vr+o+qwcuqh6CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=W05lpOHR; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="W05lpOHR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RB0RGj/hvEqcIysE3/ySJ4C8HURUXczIz8HPTb6XhsBpk7kATUQOrDUGROweuED5UnGj/SczmGfUDTnsdkjSeFMhyGs6naTxN1Mdjl2f5NRit/ZZS/ceG5aFKZe41kFNvhA0mbkYk2lycjpNUlPlX0MhMi3WI7InXyKE6JTvz5J/zWK1ZMw4FzB4gMb704jkhyCtjs5ZVzxn2uU12r1aylavZrvHK+Ynl4XUM/w0QHLKmtX/R4ACjMg1gtVkTktPa8b9D0+7Z/ifNZUYKKL3YNY7BkzCLgNU3B3URklahw3x9HoevQwJMsBBhgaWl9hm/hkzJMJj4IXXsHHf3zJTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yF/z7GAONK62KmaTqDGN8OMv9PsLP/S0Vmb2bb5h9Vg=;
 b=UKZpYBA4kRtpKU4fA9TBCB2EGIMZKkdXNmEZtY7EdFzJKewhL4TUIZFNtAUMRfpxBxSMnlNbN/sY4O2VZXPimmQ09Z/DUXx5p5/cy2KBXY1S3hvotfGt7xKbvvXeaid21pMHyjD19TGvfBXfjrGcjiFdw1lQG0iLEBZv6N1kA9DNYnJQ5AOy5hlfkjhxJYq2pdnSxCAAmo+dmvhzKwHwpmeJYzRbyjYB2IWviKqCqFvUh0PXiuJOCz4lcbwof09w4AMBtCNR6VN/R30tsc3eeYiAAyNb7owZ2L6aWCsv/EVaLMrWXfems/E28gDoFDfsFvPzLUEWXokKQ5hQlovxtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF/z7GAONK62KmaTqDGN8OMv9PsLP/S0Vmb2bb5h9Vg=;
 b=W05lpOHRvswidleW0f7jhGajqlMDUyv2o8vhZHT40rinA7GfXMK0bq/bghZ3XyZfrMuxPas0XcydEQZkuY4vU+A2PcbvVvHKU9kQjynr2Go95exo5YYywrpCDiKRhQVK5aXpUun+gxX6CI330za161kOtUTPae3Cv//DUM4htWR+Ge15B0Pns0szMFw/dKBxaSEXwmuFq7ZkaRlspMV0wXONTKHVr/boaFPKNDoFfz4t5gekizcI9MC2DCPzra3o/3CvttLRpK+URW2VFcma7EDs0sqyvs7T8l5J8T60+6INvn6/gJVLs52ZpBRuotcf31ZnFfmzJJROTmE9otFfMw==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by VI1PR07MB6512.eurprd07.prod.outlook.com (2603:10a6:800:179::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 22:04:27 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 22:04:26 +0000
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
Subject: RE: [PATCH v1 1/1] virtio-net: Fix ECN feature descritpion
Thread-Topic: [PATCH v1 1/1] virtio-net: Fix ECN feature descritpion
Thread-Index: AQHbrueSD67uea9kzU2jlHKNZQ6WtLOmoZeAgAHJukA=
Date: Thu, 17 Apr 2025 22:04:26 +0000
Message-ID:
 <PAXPR07MB79841E4D0A7571EC2B950B2EA3BC2@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250416155223.16422-1-chia-yu.chang@nokia-bell-labs.com>
 <20250416155223.16422-2-chia-yu.chang@nokia-bell-labs.com>
 <20250416144453-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250416144453-mutt-send-email-mst@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|VI1PR07MB6512:EE_
x-ms-office365-filtering-correlation-id: dab030db-89b9-45fb-3eb0-08dd7dfbd1c6
x-ld-processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vMWH7t1T+5UnlLt0Ydgsj+QP2CJB/mmKO9r0V1ZkC7fLkuYWrKN/MUIGKV37?=
 =?us-ascii?Q?iuzXJoGLTdevDJJIROqVvXZXvP9BaE3kWCWR1lMFTqV2V5a+oeqtSfXZe1Bf?=
 =?us-ascii?Q?MFB7ZmNKSvTfJn3+TRFj7SLfsBymIcwNnvbNzSQwe2utfVei/z0LhGm3G5o6?=
 =?us-ascii?Q?YTCaIHPomZep6rOGkn59kYLTs//xfCXPyTeeQfMzqUnM/kYKH7yARbeAb5Qi?=
 =?us-ascii?Q?qWAkJKuTccc7REsiF2GToXv1B3Z8JQWinOhDWfDm/XFUArtg0Qhw20rsQIzu?=
 =?us-ascii?Q?rIuDDuds/kwNkxh8G00rhEbwgjrHcF8QSNgPtIWUT4DmgcG/Ww/D7MJduPKB?=
 =?us-ascii?Q?DMV4nOYbCg9MC3+hPrBdksQbZ+87x9hgoFGOXbxpdtkjTe9T4d9x4Ov8HIjk?=
 =?us-ascii?Q?FR1jBwjPFCg/dxaISHXiLAjhc3m5o7ux9o8CGiOhar+z/FPxfpLQdLfmUYhu?=
 =?us-ascii?Q?BLzGPrmb+SYVpzMONsE3edyO8sn/mfG3K0wWw8IYVfynIhCq48UtUKTKzQQ3?=
 =?us-ascii?Q?n+QNaSarzx30b+xXDXFDDXQMH3fE2TEye7czhAZ45ppLEIa0PaGNnX2f8Og+?=
 =?us-ascii?Q?Cx1hSDVjoIZSjJOkd6bJK0tMzMf5PPZsLUF9+WTqMWhI16zCvaJwLcKQwF+Z?=
 =?us-ascii?Q?O0RQF8vLM6OMR9jf3KkTn2ejNR1WnLnUngsPQS6PX1n8n4nkWT5z1W6Z/Gv4?=
 =?us-ascii?Q?xplXVSl9x1vn7shNq4HzLtS+tnrZpH71Q5jehx+edz8AGsc1TiII5NRW6UC/?=
 =?us-ascii?Q?fsEWyRKHk8VakKCr7N4clBy4sUzXFLqR0MtxIOOzzknfIsJagnev62zbVe1Z?=
 =?us-ascii?Q?X+yW7aCpxFex9E+M2ioUMX6ApATY8aD7iUqX6VYcHPNCuy++FfNBanRvdg4h?=
 =?us-ascii?Q?alBgGIovOJ/c8/PL5+fQwta0mN6ykWld1LWNITYrPSSelXZ4Nw4zY3yP3nJb?=
 =?us-ascii?Q?ULaXAt5F4hC439BZJ1aC8VRs0MjbO/lVrSDxQ8ByDuav3vP9BlqnIua1VHmP?=
 =?us-ascii?Q?d4bwXWUoj1GAQTFJ+cnrzKqweEOEawXX5cSQUkSQGbzXeD5qIEgtxPlF+yEE?=
 =?us-ascii?Q?QG+74Kdn5l8tIbbG3RVdgYgYjWVI1OzxOk6Xy5+kzO9pmeTZ4L9Xi72Tdw1m?=
 =?us-ascii?Q?NgBu8EuNob+T1qPgAkUj3p22fg0PXbgGf7BRqpHQwhKoFXWP88wTyvt0tOxl?=
 =?us-ascii?Q?GpVfdgkU4CxMFpi+D7AKy9zn9wPNlOWnw+L1lMx9+7hOrNmzbu9et8RkwKVu?=
 =?us-ascii?Q?he/9PU4PtJ99q5eAAQL0xX12+MQ72nTuXn3qY/xL9OoHoTB1WyWDHkkp4jaC?=
 =?us-ascii?Q?NZQNk6EWgN3UiKO7/fLUh+4ky+QP30P6L+VVxTXQGCYUiaQMHMzKmFDwrPOq?=
 =?us-ascii?Q?3fQ9fmiu4ZI3xthaRKXq4B8Xh+87qPNubLfYBMPgx6MT7OdsYNgl5OREO10t?=
 =?us-ascii?Q?odHA8NMAd/ySGKX/SAh3T9SkaTPiyWrATmyZfnDndWEeiqOOgDMMtH/ylBlJ?=
 =?us-ascii?Q?7eN3Ycuw4nNn0Hw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?w4bCHg3DGhFhE0EriKDUKpSeShYSJ49XlGAWoqubMko7xPn9UeEjP6b1pmsl?=
 =?us-ascii?Q?9q9YNZr+MnIEin3vOeER2Z5sbFXdWEY+V8yUD3PtmeRAht40ykISN0z/oWYp?=
 =?us-ascii?Q?AZIh8Sl+fYjRBxJyuMA28BimJK4E/k6vkEfj/s4H1Vi3nRZoXCm6Az3q6HeM?=
 =?us-ascii?Q?zAFRMz6ymxzagn1ySQ/plVJ80G7PAzNNV4KIUSRj1qxI+DPovpFGbb/poKM1?=
 =?us-ascii?Q?hFkmo8MPxOGUoF1Zsu0inKEhuj7xmFB0QoJld0qhzHEEBjpG4xq8Dx6Yr9Pj?=
 =?us-ascii?Q?F4Fi+L5RkLNUgNGV6IUaeLnZaK7+WdRWmRaxfmMebL5ZAan0ZAQkTQWPHNAM?=
 =?us-ascii?Q?GfgB4CmQk28tkS/AzFAFC0cevXOZvchdomv/yGhsgpyDG3fxFtrtnDW9G2Gm?=
 =?us-ascii?Q?Rezj3QjZ9cYU+gA9OGNOD1Mlzx8spkhX2/a3hbhEkDc8tXOBJLpQ+WDwgdcM?=
 =?us-ascii?Q?S76t7QX902W2tI8J9UwO+F3cDukQcWq8QHzQ6i9CZ0eXgIKjE4knU7944K1X?=
 =?us-ascii?Q?0qjjw26IcomDvfB72wdSmyMvfzP85TmiTauNCZ0FJ7Gan7E8oOEQNATwXwa0?=
 =?us-ascii?Q?7bRWprbKv5cBtMTD4byNA5M4OmyqatLaUJuTEIk/KbI9bf5DsJMpHmAmsDnG?=
 =?us-ascii?Q?FheUUTNvdvyj2Qc9Zqcb/eHIEcYfGMw5C8JuWMcN5ZlA2VhItKb4U8i932MY?=
 =?us-ascii?Q?NJLMf3fyYB0eadHxVpU4Z45C60v9tAQ/8aYKUNAcuXBwdKgTp9iIdo4HCENP?=
 =?us-ascii?Q?6/HsQM/JsvXnhnGRiPvtJeN7BbsNOdcluRJto09dN67xnAE/9GXwyt4lVuIc?=
 =?us-ascii?Q?x/+bAiNZesZYq2KhfWOl4lyjfuIK7uQalaMHMXEyUsqUragkCxxy0l9uCKJO?=
 =?us-ascii?Q?rwXDECFmHRj1P+SHEetcLW/BliWX0SUjVCrcBw4kxDvBjVZeWJRQd2X90XJo?=
 =?us-ascii?Q?x1qSYQCl7OqWVKPQPcWXvu9h5dyrzTNfE21pevSYIkrtniUei7izaIofVuuF?=
 =?us-ascii?Q?JTOLwSKSanXyAE3/k/ALtIjW68oFu9M3gHZA/s+g8fNIIuGN+fzM+jt8ktUK?=
 =?us-ascii?Q?XGDY2E+RyUqLpJ/JvtE0Hk2w6vjajtbyvwD/nL4l1jjjrec4+xYnS71M+j8I?=
 =?us-ascii?Q?7rvFjLAknDcKLT8rflcl5o5qXsxyNwCi+01sxjfln/mAX6sibT7/vG/Wgnah?=
 =?us-ascii?Q?JYfhPKjrj5DxtGYG3XSnDaE29za4/Bq1WnejUz9R9lLkvz177ZXzD0FG7emp?=
 =?us-ascii?Q?iZ7Z3HlXq35PKU+fAr4ZLm20cCDqHWIFDKfPNuIG9bJZWIHY2JHf1OCKCwvn?=
 =?us-ascii?Q?3l9DUtn9tvEia3sidSPGYDpnS7QVUcpiHMHmswG+O59RTAQV29ZBEHjKRc9s?=
 =?us-ascii?Q?fVEPAJ5juNokawF/7vm70n9qnad2xi3dt9hG42TE89p6EWEYScJ+lQ8xj/lG?=
 =?us-ascii?Q?i8lQsBluAU9XjybuaWZvUxS5mgc223CA9dwGTm+Iqu3FQFyiU5LC52QieBSQ?=
 =?us-ascii?Q?pzj85kVIrGMz0Tpa+3pQQFxbRuAi6LZc+sMtgdVwLoL9oFJa0s8nIGPZ8mAD?=
 =?us-ascii?Q?qecXkzChmclcL6oszeOBCJFVti8bOCxHI+54a75xtoqJHhi3a09Zg1xAHdzC?=
 =?us-ascii?Q?Ew=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dab030db-89b9-45fb-3eb0-08dd7dfbd1c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 22:04:26.5959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KCT2V0L14RN613C3MrvormvxslzvdHNXDP0nvRP3aSLjqhcgdZujtuTCWBMl2Dl1SjItqiwuCkNmaU/jSSqBHGJLdWqwTOns6v6sIPqtkIn1ueqkqpflnkpGB8HTdVXb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6512

> -----Original Message-----
> From: Michael S. Tsirkin <mst@redhat.com>=20
> Sent: Wednesday, April 16, 2025 8:45 PM
> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; mvaralar@redhat.co=
m; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij=
@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepp=
er@nokia-bell-labs.com>; g.white <g.white@cablelabs.com>; vidhi_goel <vidhi=
_goel@apple.com>; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericss=
on.com
> Subject: Re: [PATCH v1 1/1] virtio-net: Fix ECN feature descritpion
>=20
>=20
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>=20
>=20
>=20
> On Wed, Apr 16, 2025 at 05:52:23PM +0200, chia-yu.chang@nokia-bell-labs.c=
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
>=20
> Can you pls send a patch sans typos? Thanks!

Hello,

I've just sent v7 of RFC3168 ECN and AccECN patch to v1.4 branch
And this single patch is to backport the RFC3168 ECN to the master branch (=
v1.3).
Is this being the right way to do the backporting for v1.3 standard? Thanks=
.

Chia-Yu

>=20
> > ---
> >  device-types/net/description.tex | 33 +++++++++++++++++---------------
> >  introduction.tex                 |  3 +++
> >  2 files changed, 21 insertions(+), 15 deletions(-)
> >
> > diff --git a/device-types/net/description.tex=20
> > b/device-types/net/description.tex
> > index 4494633..f15b74a 100644
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
> > @@ -512,8 +516,9 @@ \subsubsection{Packet=20
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
> >  \item \field{num_buffers} is set to zero.  This field is unused on tra=
nsmitted packets.
> > @@ -555,10 +560,9 @@ \subsubsection{Packet=20
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
> >  If the VIRTIO_NET_F_CSUM feature has been negotiated, the  driver MAY=
=20
> > set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in @@ -748,9 +752,9 @@=20
> > \subsubsection{Processing of Incoming Packets}\label{sec:Device Types=20
> > / Network  \end{enumerate}
> >
> >  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN=20
> > -features enable receive checksum, large receive offload and ECN=20
> > -support which are the input equivalents of the transmit checksum,=20
> > -transmit segmentation offloading and ECN features, as described
> > +features enable receive checksum, large receive offload and RFC3168=20
> > +ECN support which are the input equivalents of the transmit checksum,=
=20
> > +transmit segmentation offloading and RFC3168 ECN features, as=20
> > +described
> >  in \ref{sec:Device Types / Network Device / Device Operation / =20
> > Packet Transmission}:
> >  \begin{enumerate}
> > @@ -821,10 +825,9 @@ \subsubsection{Processing of Incoming=20
> > Packets}\label{sec:Device Types / Network  the device MUST NOT set \fie=
ld{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
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
> > a/introduction.tex b/introduction.tex index 44c4ca4..8b79cba 100644
> > --- a/introduction.tex
> > +++ b/introduction.tex
> > @@ -145,6 +145,9 @@ \section{Normative References}\label{sec:Normative =
References}
> >      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Wo=
rds", BCP
> >      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
> >          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> > +        \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> > +    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN=
) to IP'', September 2001.
> > +        \newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
> >  \end{longtable}
> >
> >  \section{Non-Normative References}
> > --
> > 2.34.1

