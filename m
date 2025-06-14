Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668DA4437C
	for <virtio-comment@lists.linux.dev>; Sat, 14 Jun 2025 17:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749921115; cv=fail; b=Rrp27pz0nFe5hYpquv4uLd9CPstrE2KVBPzUWF6x4ahyDP/LMMJ9nHvEjo+pF3XY9QMuQy/p7m/4+Hl2vu9Dj2Pkx67otC3P2bc+mpjUYrceW+udtY28LWk+6xjGopv644MSV7JnhfZVEZQuTCzrzwj3bGK2QlSb1z+AUKfG4Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749921115; c=relaxed/simple;
	bh=yfEmH70H+XeIjYqlUD5pbmcOQo54yswkgueup4AWCKo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fj+UbwFidzP1+6cSQ7ZFBl1Bvi8VtG7Q1JLNHj63qbWOuxeZoTPvGY6toJalPBBdGLCkgQqLPxHh73lAGOAo1MV7iok+GIT8XsrR+oOyHLTLG6j0WXEthNA9zpxpoOAXTBsozskRNfIYZVQTtnvBuem+C1J1rZUTCfQYuA1JPLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j8hgKndc; arc=fail smtp.client-ip=40.107.243.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j8hgKndc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ud7zy4oapEx1L8vyQ5GWZtBJTD59Rr+irnYf3lZXVg4sAI9YPaShE4/aj7GA9HlV48bIJV5kfZzP0Utnq3rkkdZGtx3oo+7sPoXD7muTkiYc9WI/X+FSNoKkqvjJIiamMHp1qGaNu+M9ggFF/XVW0JNRGCDo6JL0rGz27Hggqvmej10gyFreYgD8ICn3xFterLu+r8QOR8bDMZm0BevxLDcglH9ftp+pU8jSYSjcRe8r/Kk6zKLmmvqemUAnhKxywmqJ+WGlKO5Yc0E90giaaFzXSFsP1P5qRqiV3Hf+OL3i5SBYPLlvpC42rxEsKuO7eyffYuMSwMk62a1IZMactA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEEpe+dsWdcDSEiqyl4YokJk1RFp03XY7tNS8FlYaFk=;
 b=qvj/LZ10g3z5Kg4nYlgP0Tw7TjLpSE9aVfXInDd3auY9v1/W04MSh6g8Bso+qnbq0+dW/4IhOWGU0rj51kuNGV5xM30Xd38bjlguoOyIUb9TjUugsG9E2ZzFODQYlPyObXZ/IdllOhEbQI3wXpZ7G0J9Tob73d9ApLcYmnbUq1EUXEChnKa86MmG5E5/UxvhLucmj+ESTOVNyTV0Gn5+UuJc/w9wWMyxBrTe9dZKiQ1oJ5c5XSnkj+Y5LxhDz2l74AdoMt4PYCBRjHayzpUbhZV9uPrVQKmbC25QajVMsf446X38lCMYL/Oln/m1e/8nsAFcit21LtE7ML7Rq9zWDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEEpe+dsWdcDSEiqyl4YokJk1RFp03XY7tNS8FlYaFk=;
 b=j8hgKndcvayERCAN/cwUceyF1M2k6Yx8hQsR5pYc0ekan7ZVbO5xp4YxqDNaKF6ovCjxoFgTht3ri+OGnuyNEZIK1ATD2+hLnkrhRCPv/y/rwyekNOH8SBMoZ3HsPyzNDF3mOzs4PFYvHg3wlzcyUNBZIaH73abFH4pXcwNkrom4ySbEYEbax5HoYwdkkFc6QtBUrz7YyDEfb8yoHvO8WMv7f/U1ES4YrQsczWob809C8w+DAvzRl2AviHA9IAsqwZ7Db8KKaao49kdWYrJYOdmNmdi4p1W8ZHNUBuHl6QyDziMeljqdwvjsthlRH7GbAcyokTFEPLIVX7pH097cxg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA0PR12MB8206.namprd12.prod.outlook.com (2603:10b6:208:403::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Sat, 14 Jun
 2025 17:11:49 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%5]) with mapi id 15.20.8792.033; Sat, 14 Jun 2025
 17:11:48 +0000
From: Parav Pandit <parav@nvidia.com>
To: Xuewei Niu <niuxuewei97@gmail.com>, "mst@redhat.com" <mst@redhat.com>
CC: "fupan.lfp@antgroup.com" <fupan.lfp@antgroup.com>,
	"niuxuewei.nxw@antgroup.com" <niuxuewei.nxw@antgroup.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v7] virtio-vsock: Add support for multi devices
Thread-Topic: [PATCH v7] virtio-vsock: Add support for multi devices
Thread-Index: AQHbq7cy7Mcj3ywZwU+rYtE4WxELUrPZJsIAgADFHgCAKVi30A==
Date: Sat, 14 Jun 2025 17:11:48 +0000
Message-ID:
 <CY8PR12MB7195DEF6014AD36A46C04971DC76A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250518174619-mutt-send-email-mst@kernel.org>
 <20250519093736.3076953-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250519093736.3076953-1-niuxuewei.nxw@antgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA0PR12MB8206:EE_
x-ms-office365-filtering-correlation-id: 7fb19bf9-83ee-48b3-83d7-08ddab668c77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?eQN3xqX+ZHanZGHoPi3MtkwSFy/O3XaWZFZd8Y84ll32dFTcEb0qS3u3t3lP?=
 =?us-ascii?Q?Cp92+GfH9lWRejZkEjlfjFNRfcE9EQAfFe1njieSk3pU61ApNTN4rbZ6Ctlr?=
 =?us-ascii?Q?oKqsIbe+E9hncvGUHIgbEqExSEY/ljZV9/jVyeasJpQpmjczoTtvcA8PumPk?=
 =?us-ascii?Q?rNZ9hJXZFQvU/p2QGArZhaaFp7fALZ06PoySKEg9Dr74Dz1FrbmRlVL8CR4c?=
 =?us-ascii?Q?eWFC3ysSCliJ/Vlo3KZMccpMmu/27cKsCXh5WGkZsr52tHjgm58OgSjTlz6Y?=
 =?us-ascii?Q?kAdv/9n17hISOowUr3zrtiRhZ7Q3j7qDXUFhjJ+3DcGm86ip3upli52ZSFmq?=
 =?us-ascii?Q?R6CCVqseSmObT98chV8mG1Fd00R4e6H3DDKeNax17+ao7sKWpWhDd9mbAfRT?=
 =?us-ascii?Q?71nIs/bgExmCjSGAugaxWcw6xEHR4XGJAxEHvOPWxKMyYt4ioQyyHh7AbI/6?=
 =?us-ascii?Q?k/tTy2zRVtNUdRDDgiNu/3+s6OW+wi+hRO9FeYs707Tt790ZwQGT2FUFlPL1?=
 =?us-ascii?Q?WpsRoG3x+fF5pu/aD+1v4urOdlT+mjcRQfKaOKAvVu/1oVv81hA3JYP4PUNi?=
 =?us-ascii?Q?+CK1T6T2T3BBe28rTP/9jd/BElMSgwMvvKd1VWHds2CfgUqPrziDFaq99VlQ?=
 =?us-ascii?Q?5HfFauEILnDcSC8QTJNRKtcXBrtFhhvzn/pwKoIzN1NqmoeWPyFeca+8k1ny?=
 =?us-ascii?Q?iqBx3dEMCW8J75ZFQuOSSm5NFGfm3x3Zhg8/QZU/lfGKwkNxll8VEd1IRS0D?=
 =?us-ascii?Q?BtImwJES+hAChx0wocKJbWlujP61YndhUDv3SN1P0P8XdQNT+ImwiPwGbuKf?=
 =?us-ascii?Q?dfOqhCVy6l2JEr+FS4W7qJ2p8WXzbNs+J/QX3djkUVqUcsGOgngDcYx3TiQz?=
 =?us-ascii?Q?ghAjm60rHM96eMIqDDiGyw+G13JYatC4ru3uVn+9/1LoB9whFJT0MpUJr3BN?=
 =?us-ascii?Q?k/hA+U2ymHIVhdmpbuTEegXXiZjF/PVYPWuKJ8j/TEQg1NvuWBaF0sA6UEli?=
 =?us-ascii?Q?dkn2MM4Zwj8G2Q6Vd80L5vqxFBYczNZLTn5Hlip7qwVLh4QxS5ZZdq/EvtDC?=
 =?us-ascii?Q?eXatJVoLoiltQjgsr3TRhgsMAbIip7ACndGuGpc4FZj3HCT+JuB+RDtv+LWG?=
 =?us-ascii?Q?wKiGmxytL87CkBf17BUFjU/eiyBOtH4LhplmZs9wrl2xLzU0COjQ9z2SA+1E?=
 =?us-ascii?Q?2Vir6+VtbYrmVswFX2Pej5pmHm22Rywn8IyLuhJ9Nb+EiI0ZA9VtbDbYTL1b?=
 =?us-ascii?Q?Pc1xD5KSgTJMv0vhsYqcLJ+dF/YDY8Uv0431JR2NGkf/NdKEM6mSj9uAeYvZ?=
 =?us-ascii?Q?9kaxVK3uGuampIFGDvCcvy71OaG+tdtmMREXpqpsy0E7BdLEoMsbmCsRVye5?=
 =?us-ascii?Q?EN810sWOWkRDvTJPQE4gSTHPG7H7r4B89k8+5RAcSgNZSuDMNjWxmI/S///L?=
 =?us-ascii?Q?ln18/fNAzNb2dGL6QZuM62MIUBkvUKDvHa8t9mfhUH5vLTJjo4G0zDjanLu5?=
 =?us-ascii?Q?cHH4Hl9+k9Cs7zg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?leGoKrAc+ILeDEqBiIMzOumlQu0Dpq90tMT7Iqn5bmvuUpmbGct6dKeuSlS9?=
 =?us-ascii?Q?jnZi7yBfCcNsm3nWSBSpU8/7JbCR10ZThiuJl0expNkhLLoDS1Ido5Ox3kVP?=
 =?us-ascii?Q?9at3SX9/xuxVGpegtSqhN1qfglAESiiapJJ+Wdjjr/YQHARnHkwkKNMem9Bj?=
 =?us-ascii?Q?VMOrxmuhFPbBWnNX3hMLETjdBHljbmh96n89PM2fN5J5QS2lL65OOjwdMDwa?=
 =?us-ascii?Q?Qq1kmj3tLwrdDz1aT41Ey39JkY3K0sPXL0YZLVfBHltWMwuQmb6It6xyQ6A3?=
 =?us-ascii?Q?3S0fMdO2SHlJjdsF+O8ELE/6CIx8XJ/styuSFwvrRZ2xIzt8IRQqQYjYb/TO?=
 =?us-ascii?Q?wicfLnuO70OUeblkFlNV+JZIDTA1GKGNA910tlmBvWgbw3/VYvjEEwNgBe1s?=
 =?us-ascii?Q?ODgg1QYyUb/HKrtDlYIv3WqXXUw4krFuJV3BAD+6HHeG06sTSktmlaj1bKx9?=
 =?us-ascii?Q?lV3VixEgZxObSyxLPzck6Jht0UEJ2Q+aotoWJiYnBGy/3pdYykZHo7XFPo0t?=
 =?us-ascii?Q?xlZ7mS3Fmxqe77Y2mc7RUU0BccSJldkGwL6YfubEYAuguIbgYRzGygrSGgbS?=
 =?us-ascii?Q?U+9Kw8QggdtdvjOjgcihnOHt3vnkVpMpWuEyOHOU7PuTFJZeOaHhpGleLX7X?=
 =?us-ascii?Q?xrgU4R2ZI17oz4nB4LotBMVjb6o84FyZJW4erC0GFyRj63w9oX+uxyJxm5Y4?=
 =?us-ascii?Q?g0k54dkO5fWqi36hSIV7iJB/c20q6UF86qKayMQbQq9hbbaz3fkrJrG6JvTC?=
 =?us-ascii?Q?Ri6bfadusN3LL6tSd8xek0yxhGKcNkioz9dYz7qPR2ghRIyeCLTC9cdNhvP+?=
 =?us-ascii?Q?AhyMLMVYv701+4a6UYmKvarD4b1vnuhwZKUYdiGnb/BkPRXTxg9Xu6PfhJWb?=
 =?us-ascii?Q?Gn1zUC1FuuipJeKfiUcJKn52g+0PegpHkiL7Urliny1nraMKf7nvHNRr8K9m?=
 =?us-ascii?Q?MIy64S5eKOBqRfIXWaGOWNrTut8i4kh9RxLV+i/B1ikrkWwicQ14w1IYdShr?=
 =?us-ascii?Q?X+HtJQYORzvbRuS7WtbLt+uYOHp3KZGXbaIre9MGHOvSDd0rHXVlZVO8oVKH?=
 =?us-ascii?Q?Sd6DZOZQ5gLYR4YmD0CdN1+8U0hdoiMT8SWqWZ2PKEBE6MPSJzQ3Mx2vT8Zw?=
 =?us-ascii?Q?5aSbqPmJ7Oap9Bc3ID+3ZhUJ331suqYNrH0qga2dSO6C1LRwv0+7IYRt0EcP?=
 =?us-ascii?Q?lSlRwNZ0d00f3whbh3Bnh212+uUD8g//lZJo8p/Ey2MIZRdUwRqWfjxXCCT6?=
 =?us-ascii?Q?7wjn1g4NEDnnoyDu6PBEuFzy2BjIDUME/WnFSnfbSLZnNZ7phG2UqRntQmOT?=
 =?us-ascii?Q?bqwrhJzQF/uU3rG7PVcJV4QCGsyAjFdOGm5ybt+UbO+QJJKGloEyR9No3NjF?=
 =?us-ascii?Q?KIoiwUo46XJCpEHbzD+3yaOWajybO2MH2+2nfzyzSTRaY8P255S+HsRhZB8n?=
 =?us-ascii?Q?b+I+nTVJvr3YWUeCprHJSgfXSVLwv549I486WtgrzJ+C3PAWhNAiT/K/jMvJ?=
 =?us-ascii?Q?4ZnZCbl7V/JLtRK47w+AOtIb4s2qNjAx7aIGroKuD6cKammxU9M/m85yTtYl?=
 =?us-ascii?Q?3mDkkPNPcH7sf7c42nAjPBumzKBbnLzOdDCsF+yeVcArpjw8+i/clciwEAsG?=
 =?us-ascii?Q?SRuqUxLs8pl2ra2qRAfYwqw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb19bf9-83ee-48b3-83d7-08ddab668c77
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2025 17:11:48.8058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZWsl6vtsRUpQC/bQGdBCtOavyXZNe3A/XRAQUuQSO/XhyTj2RWQTGhSezSQDNU/rcITIJnQ/6wWXzhtJLG387w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8206

Hi Xuewei,

> From: Xuewei Niu <niuxuewei97@gmail.com>
> Sent: Monday, May 19, 2025 3:08 PM
>=20
> > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wrote:
> > > This patch brings a new feature, called "multi devices", to the
> > > virtio vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature
> > > bit, and a "device_order" field to the config for the virtio vsock.
> > >
> > > =3D=3D Motivition =3D=3D
> > >
> > > Vsock is a lightweight and widely used data exchange mechanism
> > > between host and guest.=20

Even though it is the current use, the specification does not prevent its u=
sage between two guests via a host.
So we should not assume such guest <-> host communication as the only case =
to add new feature.

For example, in the spec only must requirement is that src_cid =3D=3D confi=
g.guest_cid.
Dst_cid can be anything, it need not be well known 0x2 (for the host).

With this flexibility in the spec, one can connect vsock devices with multi=
ple different backends.

For example,
QEMU can insert one vsock device for VM to HV communication.
A real PCI device can insert one voscket device for VM-to-VM communication =
bypassing a full TCP/IP stack.

This means there are two different backends.
And these two devices should not be grouped in the use case you described.

So as we discussed sometime ago in thread [1], for the use case that you de=
scribed, one needs the concept of a virtio device group.
I urge you to include such basic construct to the spec, without which the g=
roup of multiple devices seems broken beginning.

I also highlighted additional use cases at [2] that will also benefit from =
same feature.
And introducing generic feature is more valuable when useful to multiple de=
vice types.

[1] https://lore.kernel.org/virtio-comment/20250217071804.296893-1-niuxuewe=
i.nxw@antgroup.com/
[2] https://lore.kernel.org/virtio-comment/CY8PR12MB7195FD1684735ECB8D950F6=
FDCFB2@CY8PR12MB7195.namprd12.prod.outlook.com/

Can you please consider revising the proposal to be more complete?

And I also fully agree to Stefano suggestion to drop discussing multi-queue=
 performance aspect here as its not related at all.
You are addressing device selection functionality and grouping multiple dev=
ices, which cannot be solved by multi-queue.
(unless you bring the concept of CID to queue binding).

> Currently, the virtio-vsock only supports
> > > one device, resulting in the inability to enable more than one
> > > backend. For instance, two devices are required: one to transfer
> > > data to the VMM via virtio-vsock, and another to a user process via v=
host-
> user-vsock.
> > >
> > > Apart from that, a side gain is that theoretically the performance
> > > might be improved since each device has its own queue. But it varies
> > > depending on the implementation.
> > >
> > > =3D=3D Typical Usages =3D=3D
> > >
> > > Assuming there are two virtio-vsock devices on the guest, with CIDs
> > > 3 and 4 respectively. And the device with CID 3 is default.
> > >
> > > Connect to the host using the device with CID 3.
> > >
> > > ```c
> > > // use default one (no bind)
> > > fd =3D socket(AF_VSOCK);
> > > connect(fd, 2, 1234);
> > > n =3D write(fd, buffer);
> > >
> > > // or bind explicitly
> > > fd =3D socket(AF_VSOCK);
> > > bind(fd, 3, -1);
> > > connect(fd, 2, 1234);
> > > n =3D write(fd, buffer);
> > > ```
> > >
> > > Connect to the host using the device with CID 4.
> > >
> > > ```c
> > > // must bind explicitly as the device with CID 4 is not default.
> > > fd =3D socket(AF_VSOCK);
> > > bind(fd, 4, -1);
> > > connect(fd, 2, 1234);
> > > n =3D write(fd, buffer);
> > > ```
> > >
> > > The first version of multi-devices implementation is available at [1]=
.
> > >
> > > v6 -> v7:
> > > - Addresses minor review comments from Stefano.
> > >
> > > [1]
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
o
> > > re.kernel.org%2Fvirtualization%2F20240517144607.2595798-1-
> niuxuewei.
> > >
> nxw%40antgroup.com&data=3D05%7C02%7Cparav%40nvidia.com%7Cb912ba8
> a049a4
> > >
> 6ed8d7808dd96b8d125%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0
> %7C638
> > >
> 832442724462145%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRy
> dWUsIlYi
> > >
> OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%
> 7C0
> > >
> %7C%7C%7C&sdata=3DAarOvDq9a3Djl7bCH2vsHGlKfEmHtvcXQGOGvXetNGo%3
> D&reser
> > > ved=3D0
> > >
> > > Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> > > ---
> > >  device-types/vsock/description.tex | 30
> > > ++++++++++++++++++++++++++++--
> > >  1 file changed, 28 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/device-types/vsock/description.tex
> > > b/device-types/vsock/description.tex
> > > index 7d91d15..392dc76 100644
> > > --- a/device-types/vsock/description.tex
> > > +++ b/device-types/vsock/description.tex
> > > @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types /
> > > Socket Device / Feature bits}  \item[VIRTIO_VSOCK_F_STREAM (0)]
> stream socket type is supported.
> > >  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is
> supported.
> > >  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is
> not implied.
> > > +\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple devices feature is
> supported.
> > >  \end{description}
> > >
> > >  \drivernormative{\subsubsection}{Feature bits}{Device Types /
> > > Socket Device / Feature bits} @@ -34,6 +35,12 @@ \subsection{Feature
> > > bits}\label{sec:Device Types / Socket Device / Feature bits}
> > > VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
> VIRTIO_VSOCK_F_STREAM has also been negotiated.
> > >
> > > +The driver SHOULD ignore devices that do not have
> > > +VIRTIO_VSOCK_F_MULTI_DEVICES if the feature has been negotiated.
> > > +
> > > +The driver SHOULD ignore all subsequent devices if a device without
> > > +VIRTIO_VSOCK_F_MULTI_DEVICES is present.
> > > +
> >
> > all this is really vague. any better way to put it?
> >
> > what are subsequent devices? if the feature has been negotiated where?
> > what does ignore mean? you can not know features without interacting
> > with the device.
>=20
> The original idea is: Some devices have enabled the multi-devices feature=
,
> while others have not, and this situation is unacceptable.
>=20
> The driver determines the states based on the first device present in the
> guest.
>=20
> There are two possible cases:
>=20
> - If the first device has negotiated the multi-devices feature, then the =
driver
> considers the multi-devices feature as enabled. Then, the driver will ign=
ore
> all devices that do not negotiate the feature.
> - If the first device has not negotiated, it indicates that the multi-dev=
ices
> feature is disabled. Consequently, the driver will ignore any subsequent
> devices.
>=20
> =3D=3D=3D=3D
>=20
> Here is the revised version:
>=20
> To ensure consistency, all devices MUST have the same multi-devices featu=
re
> status; a mix of enabled and disabled devices is not acceptable. The driv=
er
> determines whether the multi-devices feature is enabled based on the firs=
t
> device present in the guest: if the first device has negotiated the featu=
re, the
> driver enables it and ignores any devices that have not; if the first dev=
ice has
> not negotiated the feature, the driver treats the feature as disabled and
> ignores any subsequent devices.
>=20
> Does this look better to you?
>=20
> > >  \devicenormative{\subsubsection}{Feature bits}{Device Types /
> > > Socket Device / Feature bits}
> > >
> > >  The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM
> feature.
> > > @@ -52,6 +59,7 @@ \subsection{Device configuration
> > > layout}\label{sec:Device Types / Socket Device  \begin{lstlisting}
> > > struct virtio_vsock_config {
> > >  	le64 guest_cid;
> > > +	le16 device_order;
> > >  };
> > >  \end{lstlisting}
> > >
> > > @@ -77,11 +85,27 @@ \subsection{Device configuration
> > > layout}\label{sec:Device Types / Socket Device  \hline
> > > \end{tabular}
> > >
> > > +The \field{device_order} is used to identify the default device.
> >
> > no explanation what is the default device.
> > is it just for the cid?
>=20
> Yes.
>=20
> It is allowed to not specify the local CID for a socket. In this case, th=
e driver
> will use the default device's CID as the local CID for the socket.
>=20
> The details are listed in the "Receive and Transmit" section, where you l=
eft a
> comment.
>=20
> > > Up to
> > > +65,535 devices can be supported due to the size.
> >
> > can be -> are
> > drop "due to the size".
>=20
> Will do in the next version.
>=20
> > > +\devicenormative{\subsubsection}{Device configuration
> > > +layout}{Device Types / Socket Device / Device configuration layout}
> > > +
> > > +The device MUST provide a distinct \field{device_order} if
> > > +VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated.
> >
> > distinct to what?
>=20
> In the scope of the guest VM, the device_order should be unique. This
> means that the device_order should be distinct for each device.
>=20
> > > +\drivernormative{\subsubsection}{Device configuration
> > > +layout}{Device Types / Socket Device / Device configuration layout}
> > > +
> > > +The driver MUST treat the device with the lowest
> > > +\field{device_order} as the default device.
> > > +
> > >  \subsection{Device Initialization}\label{sec:Device Types / Socket
> > > Device / Device Initialization}
> > >
> > >  \begin{enumerate}
> > >  \item The guest's cid is read from \field{guest_cid}.
> > >
> > > +\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the
> > > +device's order will be read from \field{device_order}.
> > > +
> > >  \item Buffers are added to the event virtqueue to receive events fro=
m
> the device.
> > >
> > >  \item Buffers are added to the rx virtqueue to start receiving packe=
ts.
> > > @@ -233,8 +257,10 @@ \subsubsection{Receive and
> > > Transmit}\label{sec:Device Types / Socket Device / De
> > >
> > >  \drivernormative{\paragraph}{Device Operation: Receive and
> > > Transmit}{Device Types / Socket Device / Device Operation / Receive
> > > and Transmit}
> > >
> > > -The \field{guest_cid} configuration field MUST be used as the
> > > source CID when -sending outgoing packets.
> > > +If the source socket is not bound to any source CID, the driver
> > > +MUST assign one. If more than one device is present, the driver
> > > +SHOULD use the default device's \field{guest_cid} configuration.
> > > +Otherwise, the driver SHOULD use the \field{guest_cid} of the only
> available device.
> >
> > why did you drop requirement about outgoing packets?
>=20
> The driver prefers to use the CID provided by the user. That is, if the u=
ser
> binds to a source CID, the driver will use it and does not need to do any=
thing.
> If not, the driver will use one from the configuration.
>=20
> Thanks,
> Xuewei
>=20
> > >  A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received
> > > with an  unknown \field{type} value.
> > > --
> > > 2.34.1
