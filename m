Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792684195;
	b=rPauLc2xmvCOHS7mfKJXJMvxWwyofy1OEd+UXH+85GT6egBLyegGzGWtUFHR3YNZyrZG
	 wD/580SDovUozao3AXtZU405lHAdxeVEbSm9Njxj12CMyXYeJaYx0trnpdKhf+/9yjDgm
	 KE11UL7OEDbKu/dGWw8rtuZcBwDRdYYYR+V/IHiYbn+Mko7H+VTsHzAJTgxk1PsEVCrKz
	 ZFm9W28iYBykLwQWGGmUD5/9Z2TZwUThedLZcgs8cMkhsA/apVFZUhsD5pmChY/12zCsg
	 X2gKp35ZNYtutFZZP1ze7n6Zdt5bfDIQ0kqFSyYdjx+rS2PpZempwKzTvZjUfwDiVvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684195;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=FJzTkBnw8zCJQhgVbl6ieYlratd0/SfZG3j1z+/Gr2o=;
	b=jKJ0CwcaHIHuso/0xiDzt7+IlOjcGkaN2WYX26IFAobxLE/Yh/OsHm3lazxaeN5Kf0sz
	 24DO+btk0jDVpJCPyOqGxSgq34ywJqWV/yH3KxhqFG7smMiNg7NzKaOA8rM9q5qRww33H
	 OYDndoB/ceWKRfCa5St++AVyIvWKQkk73PTvWJ9hLbp6ey+mr9H7U8Rr+UbAyzGsMeKyk
	 LC1tooNNVGThjrW671bYNTX933KiaQ35QaAnFMXL7RElVZQDvpYe0BSrULKF1z3KLzH5w
	 P3kWpKDDZ2GFQiJtIzKqv6BpvlYWz6i2NVPq3RCttliWrNsvpmJR357wFfh8jng8Fzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fgtAHlKu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.23
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011023.outbound.protection.outlook.com [40.107.208.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11573606A319
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 15:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11573606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fgtAHlKu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOCP92QNUW/ttnWh0YBGR2P/q7d5kSTW8PAleHahLtdmkw5yNYNFyqF6F6H7SNPaETK2IVQ+U8oCTXVMzyAIOR1cv2CVt0F0ete9hkQ9leAY/tNjkGXfBoF+rVmpyzk5oxQy5fzbqk66WmHDAILdbPiLUWttdeMsXepxVMlPDpeZg/UE/PMJOhCmml+kRN5xgLzny3bJV+9l/3dyayR9r5+ItnV4SK3mNRFMNB4BRs2c3C5eDz5CbTbgZYywoT3J98mG/3dtdNPl6zd6kOLjScPYOwMoRBtCJeDyR4grF5AxBI0q6t00TFxEThvFAVo9dpc2PRM31zRcVPDDb3C79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJzTkBnw8zCJQhgVbl6ieYlratd0/SfZG3j1z+/Gr2o=;
 b=zQNQCiH5nCorQeo0DZcc6hXn3/rNbi3r4hWJAMbNOJ2HFpS/F9ctVfs+a0XaZXuydJYvHNe3+ChJi0bfP4CGjZVdKhc9Lk16CENiq73ylz/p4MNQgvmJdHWcOYjkk0fvFb1MeOrJimM0NzFuejqTrO+rMRZx8qkg7mIjpTVbg5izpGBpxKqHuxvgnaSp4a6uvI8RI0ZDt4bDxGACALJSr384iBMKW6wcfHThoy9WaP7k2q7aiR/doZPZxld3Y6J5cHkISzmn9IjkAiLof5CjFaV7VP0iID0BUMSz4B6OkLcJl3VpAj0echhlyrf65Yc0aBxQrZwgw6bQGzqVkdNEHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJzTkBnw8zCJQhgVbl6ieYlratd0/SfZG3j1z+/Gr2o=;
 b=fgtAHlKupHD2HzknbHm0vaz4fb0kcpKREKv2KQnO7NETpx1pWYV7BEeqKWDsY1j59OMt2dpWRmzhTLoQdS2ocEVONGr9yXqozqF0SBHF0cgXEKPuZq+oqbGm6PjA/xrOqfvUbA/pj+ExTpzV2ZxNaaJch8zn2EjIgGSXaWtbOs4kLheHW6pvzc+X2OwsQ0nXAIbIHvq9T0FHH2itCmle7m8qDlUviAYC0dfl7QC+X9ey/2Cvx+t2oyF7o7pfG71iHYZ5q1Pl1n1GlCD4/7sj7JecKPCNVVY8zAIpZuckl+vGZ53yhnnFWlsLSdY3JPON/HKedfdEHpkw3SNUnr+9Mg==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by SA1PR12MB999228.namprd12.prod.outlook.com (2603:10b6:806:4db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 15:49:51 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%3]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 15:49:51 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Cornelia Huck <cohuck@redhat.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Manos Pitsidianakis
	<manos.pitsidianakis@linaro.org>, Demi Marie Obenour <demiobenour@gmail.com>,
	Peter Hilber <peter.hilber@oss.qualcomm.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Jan Kiszka
	<jan.kiszka@siemens.com>, Stefan Hajnoczi <stefanha@redhat.com>, Trilok Soni
	<trilok.soni@oss.qualcomm.com>
Subject: RE: [PATCH v2] content: Reserve ID 52 for QPSFI device
Thread-Topic: [PATCH v2] content: Reserve ID 52 for QPSFI device
Thread-Index:
 AQHdYYZ8aLR7Neu2k0aXypdMBau4wrcIYNKAgAAHHACAAJKLAIAAKoiAgAAEoYCAABWGgIAATaoAgAANYYCAABBHAIAAB92wgAACUwCAAABL4A==
Date: Thu, 22 Oct 2026 15:49:51 +0000
Message-ID:
 <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
 <20261021154801-mutt-send-email-mst@kernel.org> <87mrs62vzj.fsf@redhat.com>
 <26e6efbe-abc0-452d-a682-611cf91e41b8@gmail.com>
 <20261022032118-mutt-send-email-mst@kernel.org>
 <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
 <20261022091645-mutt-send-email-mst@kernel.org>
 <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
 <87h5id3he3.fsf@redhat.com>
 <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022114028-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261022114028-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|SA1PR12MB999228:EE_
x-ms-office365-filtering-correlation-id: 22aad419-d242-4aec-898e-08df30541bfd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|6133799003|22082099003|18002099003|261021121427099003|3023799007|4143699003|11063799006|10067099003|38070700021|56012099006;
x-microsoft-antispam-message-info:
 CSOYGWXb4jQaA7r4n8/sf6QWt9Q7qDZ4z+tVmdEKbJ3yzgJKEWjDpKnNCFX0atqm+vuUtI31MRqhPZGbJDcKpzHYy/Um9sK/hxcgBx9p5FW4irx/LBXqok5eqMQGn1HWfuPhemPaD26nWu+tDAra9bYeGloulmrFlaKVfX1W5gMlPMGL7mVRyY9fvPk07+pJA4MRtlaNkiWTTJQUJgyCIuRTT+RfKqSCKFBKx9lGLyDu9AWtnaIVtJLG1MDQ1uqKg1PM88X/w+5dfJp24k5PzIUpUopJNTnJA/YuA8XB7dc3R7QYB2BNql4IkSMzzUfWAMfkki8A9uChHCCtP6+YAtX49rnqsC+IRjMqySO89Y6tTtUgXFNOa2ydVX1EuI/JBsfPgNwQhMJBhKY7RhQc/uZNWKpqY6UMXAeazmK99wM0Jjr0ZwWE+7t8Qp2ZgtAk8Ave9LsOc0P5sF7nKDNcspMq8E0gFT0wTz9JZzvQatxI64uULB4i1SdQjjQln17xXAkAtShcLOvdmysjxqdNjDkVOStHEnb5inVKn7ITmvkE2LKWJWHvncmvnxdjnauju95js19PbW2cFQbL1Dcz+vsYqy2QSmvNqoNqKgvKvVr0UYEmh66XCHkiqU4oved8SrLvgUgUbZtwNZ5usuzTR2oZWzXeteOwkdlnmxrhNRziT/T/AFHPaZCIxcpF8Gt6PmKHe4HxezCe9QRYcE6sGZNhONKj8hDyWtEZ5iX/Whw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(6133799003)(22082099003)(18002099003)(261021121427099003)(3023799007)(4143699003)(11063799006)(10067099003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KHx9/YY3cWwhos6WCoaQ8AC0FoZBJ7e9yj157B+iSVlLfwGkt6Wypp+CKR0r?=
 =?us-ascii?Q?aWC9YBmgVQmYTICuHI7yAnJMAP+JS4Arz1Yi7uz/zjbVMXPgz5Cp5cub1SM6?=
 =?us-ascii?Q?/ski5LGnkz2HbHPnh4hEJ5vFiY170Hf2oUYc9UQ+f7TeQugKraYUdIV7XRLI?=
 =?us-ascii?Q?GIN3pQpLB5N7myoKp3gcve/zM8wwC5xaXWB4+X2oEzJ9R8QWH3jN0OyVrBLc?=
 =?us-ascii?Q?QHqYw+dv4qEpawOZw76UVzAohMa3UFZGEU+R2bU63K79QFM6TUjD683bQqmj?=
 =?us-ascii?Q?q1NVLYrYoAZBY3PzZ5szcjTyn07Hz8wyYAJNMhwEthdJRBW+E9xkBzTH7AiW?=
 =?us-ascii?Q?ShKuLb64brOlRK7za36v/reHV/CkykyCVubyOnYlvLLwqAYtA4CKSL474tMM?=
 =?us-ascii?Q?dugpFEikI/YOt4K18eiLnz4XZXjhHGgqx3S/9fIbsLIRNQNsLxlNeVv0yHA2?=
 =?us-ascii?Q?31nHEl/OCiF4t+t2flza/musbIWVz18OoWFAJ63UK44LiyGK0tFbF422Rmox?=
 =?us-ascii?Q?q/y9HmQZtsmFVaUVS9lBlqyCrQcrHqMbDsf5n/4oDO6FJ11jRDQcI9BPCfoM?=
 =?us-ascii?Q?tzlReijm9GHLsMSO25RB9N9Fp7o57Z8XhytHR2mu4p0NJIbGaSPy2bJpAEXH?=
 =?us-ascii?Q?938DZT4tTHVKLQ9c5z1YjslGanBON3HfVfA9UzAm/5RTxndVg21NjYPIXhq7?=
 =?us-ascii?Q?6HA11hEaT+Sn8OAV/0ft3ZVo5qdTOGxRMwFMnX7qG2z0mNFU7W/0LvHabHP/?=
 =?us-ascii?Q?WvqAHn7wHOK93A6J34EAS9S5CfgwDNtAjnpOXsm4W6TASc1TIe8b2YaSSylf?=
 =?us-ascii?Q?zzw4vhUnxgUjIzeXgQVMCC22pgMzo0ulUdOxsU0Sxps8MuW+OEHzZ/Zz6QYY?=
 =?us-ascii?Q?mlysG3Kty4OBaO8ulVmr5u97Eqs0z6p6RxzQnTOYNNHuTA9Bnj+LXtHK+VrQ?=
 =?us-ascii?Q?zDjsqkjEPboupvOX7IhUNvKSF+HvbvUAAuqQ9xQQlVsbBgCoGKX+Rp+oBPDh?=
 =?us-ascii?Q?TM/VLRI5VR9e3BGLlwh4qPvMtEmssDWgbvGA5fLXcpXAh4r1PDhJ32lr8ySp?=
 =?us-ascii?Q?2EsgyPzRDHKj/SD/ngerCSzq5/SbOeIeL7ldgfnsufn6GUZut4EMgWv/5/55?=
 =?us-ascii?Q?AFRNTxxnbgDYgx9B0bmAbM8s/FhB4yAfrM6xB9s8N2PtuOZ9z6x9yFHaX2c1?=
 =?us-ascii?Q?rsySzYUFkaMxuOxZHLvXUPptZAffaHzBbu60I17AAg01W9LE59hlRgP+qtPO?=
 =?us-ascii?Q?HZ4Q8vAoPL+2RLVx3OxOYhWrQOdBz/GX7ZTJvfl37yLDv8ubvPF6Ah9Su/TJ?=
 =?us-ascii?Q?ZL9aRImPHZKW6GDhgDBWnonu6vExmVFvFQkWIFctLShYbYZi+nqnjHByW7Ue?=
 =?us-ascii?Q?kYTWzOnxxs4LI8gZWHgZ8M+gBX1aEQD17rFeSKyrN6jgsoxjKD3A8fWjtNE9?=
 =?us-ascii?Q?qgr96BhEjk23XSA8hZS2FUkI2rbUqwrnPQQWn3snvEDfWuogg6g0eyCSMpK4?=
 =?us-ascii?Q?KMwjH71MZIIYJ4fjzmqNQcao4Z4PnUxbRMRNSRs7UrBkHgNywdOTHasT8CGf?=
 =?us-ascii?Q?tP+GjTsu9TVPJkQYDD6B6eaBpU1PAK+rC24br0RLwuouJm363HNPuyf9mEh/?=
 =?us-ascii?Q?egfhiAik/UxQ1WZGPSyi0WLa9SK011VXdBfV7rA4tBpEcmlY9jl5H61gBg+t?=
 =?us-ascii?Q?F1+s7tonViTE7LpZhFAR78qdMRsW/NKEnQhBZeXJiYAwmLDa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22aad419-d242-4aec-898e-08df30541bfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 15:49:51.4739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PipodPV/xlDbLyVB8T3taTEQVbCx2+ioWRNE8Qi8myqKdC+1jLdZtM6+QEmDP/wkQZVr84L3ENWoNXvOk2Rvrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999228


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 22 October 2026 09:12 PM
>=20
> On Thu, Oct 22, 2026 at 03:35:51PM +0000, Parav Pandit wrote:
> >
> > > From: Cornelia Huck <cohuck@redhat.com>
> > > Sent: 22 October 2026 08:35 PM
> > >
> > > On Thu, Oct 22 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.=
com> wrote:
> > >
> > > > Let's define some standard way for the vendors to declare that this
> > > > device is "Qualcomm", "NXP" or "hobbyist which doesn't own PCI or U=
SB id
> > > > block".
> > >
> > > Are we able to use the first <n> bytes of config space for that? I gu=
ess
> > > that is the only way that can possibly work for any transport.
> > >
> > > Then, maybe something like one or two bytes for a vendor id (includin=
g
> > > one for "testing purposes" or so), and the rest to be used in a
> > > vendor-specific way.
> > >
> > device ids are independent of the transport.
> >
> > but Peter already announced that:
> > " Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> > Firmware Interface). QPSFI devices expose functionality across SoC
> > subsystems through a common Virtio-based protocol. There are no plans t=
o
> > standardize the devices."
> >
> > So, I am unable to understand why should it be part of vendor agnostic =
virtio spec?
> > Why a vendor specific implementation of device and driver is not suffic=
ient?
>=20
> I don't really think we should vendors burn up device IDs every
> times they want something non standard. Reserving ID 52 as
> "vendor specific" so vendors can go wild sounds good,
> but a bit more needs to be done than just reserving:
> document what is expected, e.g. no auto load based on ID
> alone.

First, you indicate to open virtio to vendor specific extension. This is hu=
ge in itself.
that should be first discussed.
If you suggest this, may be every device type should be able to extend, and=
 not just demux at device id level.

Second, one reserved id is not enough, because a given system may have mult=
iple such different vendors devices installed.

So why to bend things so much and re-invent the wheel?
Why for say PCI transport's any vendor and device id are not sufficient to =
indicate a vendor and device?

and if so, why to even document it in the virtio spec?

I guess, I am missing the basic motivation part.
