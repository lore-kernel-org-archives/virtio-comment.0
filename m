Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792683359;
	b=dPqL9IMPG9d0fBWz++7CxBeJT8sKhn/kw8ZKu76ZZfEwwuWe7026c0aE9Fx7QFfSjXFL
	 H65yj8reqK/uGD5s+uuGHpTJGp24H7e7B0BEzidL+SWWPt6XVGgvnFrUR365yqem4a6r5
	 yJQ1zgRI9bTEwySYBdfLOClIzLVRn9xki8dxyQJ1YcTHbdKtelWMJZ+6lYwyiCpesaNLe
	 BxdZRVaRa4vTTBCoqPZbTcrr+jL7CkcctRi7k4tPbW8dMwQH/hnnTag/LFNDcx6EBAXz5
	 /mDjSsW0UuLJ0B9RF4NveZOkcLLLgLJdhTIwvT2UAMz5okOfnftxwk2ESVaFlZqw1uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683359;
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
	bh=euxeniqi7wL1X+hobvBV3tOEprM4zV2JXRIAac6jkZo=;
	b=fu9dC7MlWcXwdv1Po79fjVM12qfNAF3Q88gU66IiIWa+X9J9qTT5hg2j6frqFQ5OyISO
	 1YlfMlJEkuvyO4MPMSZBkWXDXjvLCmfpPXlQ5qL/Y9Z0mzrnqUstEsJmJ/aJni41WeArV
	 W0YKXp8in4hbCX+GbxFdvFv73p5nqzIqDn1q2oleuzszrW0VPYr7cZ69US3aMH256zupJ
	 SnCfZu4zLW1/Esu3tq+4zRTtyU/5gdidmU5V2X3wUdLmB6rfKPGbGAHBLnEzlWr7iHpYJ
	 vO8DIrHunuUkQFnWvwbjl4rpbfv60s2SUjCf1oWw0EUNh21pwi2cajEJEOKGq0VGxQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SqqpsKKD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.1
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004B7606A31A
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 15:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 004B7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SqqpsKKD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRcUWpcevlJltEGBf1/7Pm71nPSsYQNcx83IR4+zzeE+V3DNVB6qiQxK5Marh8VnoRVTun+N3s7enLN6LEkBX1hf07gl+VINUZoyRwgaJzDe5unryA7SirJjmEl6bKHAlWn+00oE0q1ygCuXWjn9O70FxAt8y2/QTmA0F3bDRRoi6E/JFli29lSfl6JZX7PydAqq7EqCi6svmWWQnUI/Zo9DyM2VIIZGrqo9Bu/SfmhlYK8bEHtUwJ3KPJO7EC6Hr4oIfadZLfIPN0nNd2uYVA/MRnIfdhSDlHRHnLqX737b+CBp9uP3Ji5U+1Nf9z1y2dO5hoDCmH0BTirWo0kH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euxeniqi7wL1X+hobvBV3tOEprM4zV2JXRIAac6jkZo=;
 b=itPUD6BZrS1FpUDZG5ex0HSptLFbsXXim/xSilIa8GEwI3FqvauqEsQXTYsvX1MupJbE412mfzBzhs0IpYwZWtiVOHssZQXyy2cyULuUMxi9Losbhbnz2SzTfkGwxDnc8MyY7BRVt/hthcwEriUdVZjdoFX2o4wqNKaNYv6jmHn2K9Fx1TjuwQ5fvJpOVP5EC6PH/pUVB1RQsMxp28HEqdQTzZ+R8hacPGo5o9fhBJuQQ8VJEKQAZqhgM/l0K9/OXzx2Z+/ssKpC5ISqtoPtJxOHu2YQhnNzniwiFKuDa49vRmKajgSQWV+o7OnB62nWInBk6rXpEp0TXoyY0JArIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euxeniqi7wL1X+hobvBV3tOEprM4zV2JXRIAac6jkZo=;
 b=SqqpsKKDfYTrBfMXaq79rXRUDSPJPiB3ZLHyw1OhQxQ/GERG0lz/JEw4tGMmWX4btgqb0h06v/E9yTYGUSFVX9xc/kV4KDklE+5Ei8pX7A/vf84qBhzhbBt5NxdB1JywyX/R4eaQpxhxFJR81SwoinRtn5S6dNNBS62zDDhraejHMxt00wx0eBK2i2zAYL2VB4u7YO4dMnDMLQp6YdQRriUUwPkjCkFPGgnpiHJaw/5oSLmcik1zJPVRCKJLNtuI8FNj4/jXNRn8zDOcZYPRmqJo7tJYvpmYC9IR1H47rOrxJh8E0f+WMslROGqgpd53RvnmsHhej82h9wZvBx+U4w==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by DS0PR12MB6534.namprd12.prod.outlook.com (2603:10b6:8:c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 15:35:52 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%3]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 15:35:51 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Demi Marie Obenour
	<demiobenour@gmail.com>, Peter Hilber <peter.hilber@oss.qualcomm.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Jan Kiszka
	<jan.kiszka@siemens.com>, Stefan Hajnoczi <stefanha@redhat.com>, Trilok Soni
	<trilok.soni@oss.qualcomm.com>
Subject: RE: [PATCH v2] content: Reserve ID 52 for QPSFI device
Thread-Topic: [PATCH v2] content: Reserve ID 52 for QPSFI device
Thread-Index:
 AQHdYYZ8aLR7Neu2k0aXypdMBau4wrcIYNKAgAAHHACAAJKLAIAAKoiAgAAEoYCAABWGgIAATaoAgAANYYCAABBHAIAAB92w
Date: Thu, 22 Oct 2026 15:35:51 +0000
Message-ID:
 <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
 <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
 <20261021154801-mutt-send-email-mst@kernel.org> <87mrs62vzj.fsf@redhat.com>
 <26e6efbe-abc0-452d-a682-611cf91e41b8@gmail.com>
 <20261022032118-mutt-send-email-mst@kernel.org>
 <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
 <20261022091645-mutt-send-email-mst@kernel.org>
 <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
 <87h5id3he3.fsf@redhat.com>
In-Reply-To: <87h5id3he3.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|DS0PR12MB6534:EE_
x-ms-office365-filtering-correlation-id: 07176d9b-af14-42a1-97c0-08df30522785
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|261021121427099003|10067099003|56012099006|3023799007|6133799003|22082099003|18002099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info:
 fEy3dsNr3O94gKQ/ooZfqoL1d5nFPb4n0Wgjh/353cn13YzBQGHdMX0qjQcaf4S+auSoC/yh65C2MnNFiW7DcfSEuvHoaIbmUrmvepPm0yIqFHG3IDZYrNY7tHeHxeYUYF8g2uMlGhFR9pkogvFEHw5jWWedLz87KEXv55Zvf8DNcoDX/1wB1XcZVo1JLaXlSatM2Wh6IVTYhFuIaC/5VBHRIQakFpdup8Bs25PO7HyuYJnOfJD48GZq666bu9lZL+VHz/HOazFGZbvzGya+hYCeFoTSJedmuIFZfuaFU1pt/jST7gY2F7l82WPSKq/2+dy5Kw+9q8mpB4GvS5XZhP7y1NF2dOT/+RxRK7Wmy5cmKVYMSyXJImWh/6G1W7X5SiWiPXL/zHIPZe0wnGbVtjHv/awatwzShyXfq2NhCcIcMD+Vw0XrOxeNDSQNbCutMvysFggbIoaDb0Ap430gtnaSTQ8t3ljSfDfOjrYNj2Ls1YmE8GMdyl797cWUEIZgngrCnndGKlJCSMW1OepEXDpJF3gEkv9eZLClCGVqr+rdJkFhn+kQ3cSd4F0kvQ4vDQB98E2EKTNcXhGHPtsnwvc/j9ui1YLX9dwQAYrlnBtMxdP56TZrVTOJ6Q0mkquPLXeG3QvMecnSkC50uIjHoKhHXONCusZv/GbsroyJ2iJZ9CkJQFWnO44N+XQ9J6Kg0P01VVU1YHPZ63QS7o7dg2KnPKWTntyYXuGP8tabfI4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(261021121427099003)(10067099003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?k37YPi8sgf+e/Kv3RNBtmkIvOCQQlc8ewYMg7B92Cj8XwgY6fxs7WqwiR6M9?=
 =?us-ascii?Q?kHsldaFcP2koUaL4zhnomEXgAMdXMZ28qzxC3cGSriKxDBWk4cbefNTkH23z?=
 =?us-ascii?Q?wK0FRmG+7w25mODUR9mtI0lLvZE0GOcRKHGMtYaTTLC8mMR54374SCpj5tLD?=
 =?us-ascii?Q?TkXwDqPsC5PBiCt04qKHKCzN1yghyC9Tw+fpA2J+RnjfOwEgYXCwUe4zLsa2?=
 =?us-ascii?Q?zkw9KIpfJiam+fuT601FINTtB0lkpZjX/u/OYoCdvKJZgrW/pMUg+7/iiVtR?=
 =?us-ascii?Q?lVs/ke7gpmue2tegC+kMqk7PzZdZ3RzKkoon/crQwDBSOACwgRJ8EGDgY3BC?=
 =?us-ascii?Q?OCk9d957DE28PW427vxsSiszpTfnBFdH6gVN/JxVaHIo65RSbhH+g0M6V0tR?=
 =?us-ascii?Q?LLoIyauhs51FlJp9wkqELwGmyLkrRrpcRBpgOY0zyalqE9aHTDTYBk6sZgvs?=
 =?us-ascii?Q?DkGbuuI83pHCsSM7MWpScpbZt0xSyKCToXWrg1m/mOXJCJEgu2aTIJ7bCnNQ?=
 =?us-ascii?Q?7BBGDrEugjL0IXGre/gF54xCAyAqHIN2hSCcERQExkyVHU79MJR6o8dJ1I/S?=
 =?us-ascii?Q?9UbOzfPCatxkdmagEuZigXl/EVMRrdaockkgJbQH+nV+Sq0quMYYkd9JwAFK?=
 =?us-ascii?Q?LM2KLGOH7TZo/vBPtCyjhl2wXA0qtmVVcWJeNLoHl8L098SdOKLy4hWH7MYU?=
 =?us-ascii?Q?nUbfmjY69XHtTwIbzLOjZ6q3wg6SNUBJLvuan8nb6btx+n71XUiDuz9g5Qur?=
 =?us-ascii?Q?fvbH1N9Rx3duqXyL/pribKoTOlU0p57h/r9KghOBZpa/zIZ0eOLuymkk+vYb?=
 =?us-ascii?Q?R60IGUugrvMjfHmf1bbRzvffIk0SOHcgtJ5z3VhnGSy5dvF1ZG9IiCNETFfi?=
 =?us-ascii?Q?KlcLotokQ76jgT/WJ/d+XSn6d8YRKSPLZbPge/xqpehZ0s/5fOV3fYMh+ai5?=
 =?us-ascii?Q?NzXGdxWj3xdfm7pKEuAyFRsDVHNw2sAldTR6pwQMKJy6z5Mwq1HxVlWZGcZ+?=
 =?us-ascii?Q?eeQA5QlDE8yp4q7t+H2o5ko1LdulJ5EnBaLzpukLzvy/NP5ekmpLkNDf9V3P?=
 =?us-ascii?Q?eQGW0y3SLKJdNvQWqn0M9+TkWpoL7SpQRsGn5p93CYC1nn36VQvSmphSjgMi?=
 =?us-ascii?Q?H2FPdk0a7DV5o72gW78MltSpEaXyB1p7SKnCc0GE/DZg7RbZBV9I9oceIaMA?=
 =?us-ascii?Q?8eMUqv2j53R1gsO+3uAoo0Ur+z52Ty+jKqe+RZcY2JCyQxtLTNy6gLsPd1Oe?=
 =?us-ascii?Q?cMbMdY+sEing8SdhzUAVRLZpyQJP+uTuyPrMqVMLECnflkZj9DBKKvq0k/OI?=
 =?us-ascii?Q?ueZ4J9v208KAV6b7pVCzEX3Uim6WlYE8us1rnwp5vZVv6hXBsseHnNf6dlcu?=
 =?us-ascii?Q?zdPGBnFoJQ3Ur1QXRV+DdpI1GAItC03mzvNP5IXD5Fi8OdS2iya2B9U6yK67?=
 =?us-ascii?Q?TzL8kg9X2Z8u5YZ6Zwfi7QrjEwJl0IhBy2+YBbBMTQogYnhHpnyxumPx22me?=
 =?us-ascii?Q?zPi+ARKqak75Ykxl8bJ1SjHdgx14pcCXPgreBaibLWz2jQwiewVWPzpPXm8r?=
 =?us-ascii?Q?lr3h6jT11+hs15NCV4vg8i4vcX+bEkdJTG9tiJzNagjeCF8wP0Yk/Z6UOZAc?=
 =?us-ascii?Q?PpAiR+EmmEBPs36Zp3tUdcu+Ocu2UDyIGFKq3UIwad5ZjXBXF6jYpxdO/gpA?=
 =?us-ascii?Q?yZwoZdy6MFAcdCLHiWc0JnR0TZSydMz20qJ24rCgH3+w63ih?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 07176d9b-af14-42a1-97c0-08df30522785
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 15:35:51.7816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qjg+uuIbWbVazvV0z6nbY8hQ/bCbYo1nqJeBeEwNXgbsC7w2g5FqoBvMdEVnG5ZlkV1Q3Ed1+S7wJCbZuM27zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6534


> From: Cornelia Huck <cohuck@redhat.com>
> Sent: 22 October 2026 08:35 PM
>=20
> On Thu, Oct 22 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>=
 wrote:
>=20
> > Let's define some standard way for the vendors to declare that this
> > device is "Qualcomm", "NXP" or "hobbyist which doesn't own PCI or USB i=
d
> > block".
>=20
> Are we able to use the first <n> bytes of config space for that? I guess
> that is the only way that can possibly work for any transport.
>=20
> Then, maybe something like one or two bytes for a vendor id (including
> one for "testing purposes" or so), and the rest to be used in a
> vendor-specific way.
>=20
device ids are independent of the transport.

but Peter already announced that:
" Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
Firmware Interface). QPSFI devices expose functionality across SoC
subsystems through a common Virtio-based protocol. There are no plans to
standardize the devices."

So, I am unable to understand why should it be part of vendor agnostic virt=
io spec?
Why a vendor specific implementation of device and driver is not sufficient=
?
