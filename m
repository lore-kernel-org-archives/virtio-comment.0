Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794725778;
	b=bzq2SvG0n61HnQG6H7hR/WeqSIjJAWePfToibYh+51EeAq4Fb9FSgLa/qXwBC9egoNnC
	 mF0b6Mkkvv/h+xzmJFiTTUDekYRGgh1EmZVLsxVqEkNf1YitYoOENADVATrtWu+DysPcM
	 96GKRrzMsBq4+BSlSm0MM4/uIDDyMTr2cFmi6FRRrmVpMHbkNPeCxzM17zxRGvNoI1LL5
	 KNdFMXx5k5dtfYN8aijQEL5Yj0aUCqXDxGFN3yV1qobbwJgF3Sx1UovAua48LdADDmhMq
	 OMjSz3J/Q/wUUHYVGnH4yv1pRpkFsvpyGauuK6FIxlJs3/xHXwfOCEBgRYNJbomT2sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725778;
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
	bh=oDrn6LNt16OkUw9+UjZWzE2JJ10ME2JrfdzSynKgSdg=;
	b=WCww9+nxgpbWWkc0nYqSW3y4F/xDPcGip9q6WFN2YUFPUUUm/sMX0iQCZElDDM8VsRhv
	 G16jAeUNv4ZjICqL1SMfo/D8EXbMBmiBSp1lmiHbnE99/+y8px2/+plSzEuFNUKs6CbVx
	 cL+mADUYXImSCX2RYgI1gMLZL7+YBszSbNNOC3UMBtYe17AZyG7gRk9lbRRimfCV0YGER
	 qOWgKS1Yzv7x7mU0uyvvan7ioY7nv2m3/oXD6he3/rIJknvNrqDNyXG0eecapnYntugxu
	 zf2/9ymDS62iv2ALWgX6W/mY/RtHSBzSSZginIWmp04P1xIpVjvmQwkVNK286/iWp0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cmUMmWrg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.41
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB5A606A32F;
	Sun, 15 Nov 2026 06:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB5A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cmUMmWrg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiiBudammG4GuzPubngL5io/DHg+OQFRPCgwlTi4tSslQq+xAO+APbl51bueoxDGQPar5euc8sKx+R+VjSEC85gVkpd056a8O+BxqqyqSSrJbaScNainD2D7mib97UPaYcVVYNYx55ipbCW85B3++3rO2sA/Otp9GNcRbI0T7VKT4ZOBxcxmlATUesEW6BcSOYgE9stdQrBj40xaM21+NjwecDK/f0im1io/0RJZBulDxHZxpAr1gxCrs3MQtEBZUL6LOqKPVc354aNnBgVbR7XYKXeoGSfQZqwhj7/sCi2qRVpGhKbYPXN5ahAKeaZlf6jp2yXtI7wqS6kePIS48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDrn6LNt16OkUw9+UjZWzE2JJ10ME2JrfdzSynKgSdg=;
 b=uczmr1K+Vxb3p2AhGN+AXgaoOpk0YMRRYjiQNQ59KTf4fu8l9NccnId/nxIXJxEAgErX2rHtiOn9VFskUkp13Z0dDHqnhyY06y9zl/HeNAuo0L31lKzoTJHqU7LFpPtYfXlCa7sx1HSQd/rK3EnIdRQr0meE0myMAw2cD+bL0hxIzWfm7rBAdblLfUd0FLy0tSAVYo7Wtfb8VQWC/hRVN/HUPoBMoGP7Q0ajXzjbKiSFgONIMIPkWSQd33cyZSj5PgbcididoOjJVp+M624fx/R8e3ytlhd+DgfEO++VpUKgWK7gNPDNh8E++onPwQCmMUCkcxbnNbJdFMxLnkMbqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDrn6LNt16OkUw9+UjZWzE2JJ10ME2JrfdzSynKgSdg=;
 b=cmUMmWrgfg9bFExOxPbmYZsxgomM7/+eBPKF0rP+EllzomQLCnDmEccpo3UajcMBsjFw9ud1euDHGl0EhM/rlWrMOJDrgI8SrX6j1dEFRDd7OISotis5LyBdJEzcELJKsVGM2ISfTK9vLvmC7Rw/nzK7MkzskqjfZZoMEyrbnbRZ1kidQmxCGQG1D9jI93eUcoCY8Xvft7EgUrTihGB24Dzwjukm2UoEuhI2OZfVKzEcwXqRJBglQuVOcHD46bN/qqKfDwkTLGe8kTDeHh1WD/FErz9VAjeRsLNXZCuEXC8BSAWJOVenznzsQjsiECb78Sqt5M7+3VW8VrFbQ7RUIw==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by PH5PR12MB953872.namprd12.prod.outlook.com (2603:10b6:510:501::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 06:55:21 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%3]) with mapi id 15.21.0615.009; Sun, 15 Nov 2026
 06:55:21 +0000
From: Parav Pandit <parav@nvidia.com>
To: Linlin Zhang <linlin.zhang@oss.qualcomm.com>, "virtio-dev@lists.linux.dev"
	<virtio-dev@lists.linux.dev>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "stefanha@redhat.com"
	<stefanha@redhat.com>, "mst@redhat.com" <mst@redhat.com>, Max Gurtovoy
	<mgurtovoy@nvidia.com>, "ebiggers@kernel.org" <ebiggers@kernel.org>
CC: "neeraj.soni@oss.qualcomm.com" <neeraj.soni@oss.qualcomm.com>
Subject: RE: [PATCH v6 4/4] virtio-blk: Add inline encryption security
 considerations
Thread-Topic: [PATCH v6 4/4] virtio-blk: Add inline encryption security
 considerations
Thread-Index: AQHdZfL4Yv/cXfIZQUuN1m1iVt1EbrcuzzHw
Date: Sun, 15 Nov 2026 06:55:21 +0000
Message-ID:
 <SJ0PR12MB6806D773DD625E27F1646221DC7D2@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20261027090945.185178-1-linlin.zhang@oss.qualcomm.com>
 <20261027090945.185178-5-linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20261027090945.185178-5-linlin.zhang@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|PH5PR12MB953872:EE_
x-ms-office365-filtering-correlation-id: ea0a5f39-b740-4f60-0cb5-08df42e56aae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|10067099003|11063799006|4143699003|56012099006|261021121427099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 afyuoeDl2F+5l8kDqHJ5rQixAn+k3JB9trGtetJ6d5m+VMiHLdqWJZwdVFw/zSJZ2jOsMbBO5lqtGM7/JqNoLRY6KkCRrsqFfg1bQiAwqTqEtWbT42kKHvwugPaYdZfTPRYqKu8ir2ebtbEONrRkJY0tqKwWImAZuz0WKOnfpsQohKTIBj4XgDKid410XFI5EMKvaGJN1IOe/hAhYPY5OlB8XOaPJqfNP0UwhoxR+2jdDPhBmvYizrcGDOsDr7ybBHu98ZObphQnXujHel2zQ3mGddW7c+QPY9ctAMldScnnxWxLxehZ7dfNtM3YTLsEFMV84bb9RFceq1nRmLbOFGyEMMYkcUXMoPBtflnD/3uV6pnNyshq5yg/TBfM3X0aEs41/rG7upSBMBqOUoDVqaWVl/+E2o78Je39peh9tLUGxCy13qZsYv+RRFmcQvN89A0y0Nr178FoK6sOv6yhEqBMJQb+e3DMrrWsxwpnVSeiFGTrh408ygI6iNLGfHtwOmlJxqyLriEdxx4Ovw68tscUH+ZuUHBuAeZjM7oBetFqOf1IsCWzL5xLvJWenUANrmqEVNjTI+EhFZguatqur4i1v2kcO9cIFIZB7303iulyaU7ei6e48ydRe19QJMmF+bppHDfeYcJ78L5KtXiW/Yn2jikCQcZdG/EX5UXVc1U9sJQJ0OubuTxUzhf93pWXKRT9Fb4qmPYUuMdWWFjxgKiROQa4B9YumqD4fjj2EZE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VHepTQW7jelygrrIRvLqX0GOLg4qilPUx5HtoJitd4tZtokb1zw50eBrLjwU?=
 =?us-ascii?Q?4MnXaq7NHFedWAIQN4m8GR8lpSHlL5UHVvVGHcUUDf61xc4vMKUXnJtQ2ImS?=
 =?us-ascii?Q?fu5QALoMwmyJpwT4KvcraRkfSXABMOQgYkhJoScopM3sM7Wbj8p2/FQr+Q+u?=
 =?us-ascii?Q?i3KvYWFvUJMwcSjTF7ssNWoagh6zNMApBktbRpfR08ap2xNb8O8EZZhwmLda?=
 =?us-ascii?Q?rOg0SOzVJgMJ3iEwoQQfUFsx76r6afT2m2LG4xBtel3qydG/ng2uWrFHIz8Q?=
 =?us-ascii?Q?Lz4Y6nuentb46lIyylIN3T3lfnU0awIz3dbNIhgR8g6x//0Qi+mB3esILryN?=
 =?us-ascii?Q?N61Z410ShtfYTCqoO6wekUTK0rVBD8gXdX5jmdba+vK4XrOywW+YOREjTuU0?=
 =?us-ascii?Q?c3naZT3sFNGOHWlC6gDhf+aJml8JAHOLnIU8X8gNFQ9juWy30oWpNzT15NvL?=
 =?us-ascii?Q?61vXMr+mbNcHotAC2+tJts9wdHpC1N8QT+G4c/O6CV/ywfx3WW3Hk2OqBuoW?=
 =?us-ascii?Q?6UBIJY11455lAJykCuWC4JLqW6wJyp04m+Q8T2g0PQQW5OaFQ9LHMDtNTnSl?=
 =?us-ascii?Q?zia4xSnJlB9cQQqBuqVspOUseMo/TugU3L2V7VJQ3Tkbjm7/9aPKIQtph6P8?=
 =?us-ascii?Q?UUqD+vG2k2jJVGY4IqcGpbc0REwzDxtk7GSI9UJaLPFzYAxQAE+0HxG16Wev?=
 =?us-ascii?Q?XXyQjjmNYU6Vnba+dk2Jls/sbHTGptQcYiGDihssgtyvjzjExECO5gNh4C1g?=
 =?us-ascii?Q?to0FSfXXYDzyf5cNoetd+DreJZOtofNO4Mso0sKxGAYKopIxjpILs9GbQAqN?=
 =?us-ascii?Q?hnJNw4uWO8sQ0Pi/yA2zaehfHDwtgLJ5zlEYNWBB6zEcHZevRFRMmXGF2+Kp?=
 =?us-ascii?Q?VpZJKYTAHQAA/Ix6O75AuHDrGAev0nWaYj/rsqYhbJtJ8yzjDhRJ21V4rT54?=
 =?us-ascii?Q?6phX50V3zRjW53YLjoKLfS7yDy2YtdXv4dGZgH1qHHsc7SxhaQ2znJHfJEp0?=
 =?us-ascii?Q?Klhmesov6zj4UtyNqQjZTW++SEhpOOlywZPSC7+N1WY1XbzYDlZqsljilKI1?=
 =?us-ascii?Q?3n7JF96qohXYkwknTvhJC6C6R4R9YlcMZfP1It6wYhFBp0dku9RopEw5pTva?=
 =?us-ascii?Q?Bu1NPuiaEAjwHKYRg2TsR79tstKHgqiJTFQ/GdBNexvMhLiPkAtMaCbdo2R0?=
 =?us-ascii?Q?ushkGEJEFdOeBkAyIOjFafT6wTSp1HVkPQPyekIX/mXH626hBohH0PnlXWI3?=
 =?us-ascii?Q?M7RjH7YV/tDzXJzL1j62hDDizGCjo74TYwJ2S3+dLT6JY+kieJPMmwtC658V?=
 =?us-ascii?Q?bVQuG7ECbsEzNYl4vyzsTVmGlcXpXFDqPgxTXBGxOMaPV+f0RYitHEqYMOpq?=
 =?us-ascii?Q?8A00KRIOu21iDmqSNAp5bxnu5jQ3rzwHpKznx6TUfnC2+bDquTUoDrcgiEQ2?=
 =?us-ascii?Q?n4euA80RFfKZEJbt3DinPo7jZjUwBSkNLi6B1oGYlj2zFUXmYE4Mvj6AMvDd?=
 =?us-ascii?Q?c+4I4FJfnCTS1QNr4lDTELLRXLLIBcfYwlis2Fg/Ugfd1LfLllvGH6zJspds?=
 =?us-ascii?Q?QY0NH010oKRL3hbDN5P7CSo8U8mo3pMUVo7AIhpSz+6OloDrheZWvP8ZyXn/?=
 =?us-ascii?Q?jlwWysgJxldWhK8Lsq94bYXa7gEZjAAMwt0rnkaa1levYR0IepO9vEvtyW8X?=
 =?us-ascii?Q?9xpXJyV5yuc6MS17d2RvynIlUJJmQo5AHdGbOwv+OESlu0pm?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0a5f39-b740-4f60-0cb5-08df42e56aae
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2026 06:55:21.4579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruNqaAXgp9hmEUTZgjdemFczsdlCm+6Wmn2e82usVTfEDHaeZwa6Wr9mnwNvOvLTN82tJ5WhS+SxmqqLAMmn1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB953872



> From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
> Sent: 27 October 2026 02:39 PM
>=20
> Inline encryption protects the data stored on the backend storage, but
> the device, and therefore the host, is able to read the buffers of both
> the request virtqueues and the administration virtqueue.
>=20
> Describe the resulting exposure. The data of the requests is transferred
> in plaintext, so inline encryption is not a means of keeping data
> confidential from the host, whichever key type is used, and confidential
> guests cannot rely on it for that.
>=20
> A raw key programmed into a keyslot is visible to the host. A
> hardware-wrapped key prevents the raw key from being extracted, so that
> the key can only be used through the device which wrapped it, but does
> not prevent the host, which is able to send administration commands
> itself, from using the key through the device.
> The raw key imported by VIRTIO_BLK_ADMIN_CMD_CRYPTO_IMPORT_KEY and the
> software secret returned by VIRTIO_BLK_ADMIN_CMD_CRYPTO_DERIVE_SW_SECRET
> are also visible to the host.
>=20
> This patch adds no normative requirements.
>=20
> ---
>  device-types/blk/description.tex | 40 ++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/device-types/blk/description.tex b/device-types/blk/descript=
ion.tex
> index bbae9af..ca54e50 100644
> --- a/device-types/blk/description.tex
> +++ b/device-types/blk/description.tex
> @@ -1994,6 +1994,46 @@ \subsubsection{Inline Encryption Administration Co=
mmands}\label{sec:Device Types
>  NOT write key material or the derived software secret to the
>  \field{command_specific_result}.
>=20
> +\subsubsection{Inline Encryption Security Considerations}\label{sec:Devi=
ce Types / Block Device / Device Operation / Inline Encryption
> Security Considerations}
> +
> +Inline encryption protects the data stored on the backend storage, for
> +example against an attacker who obtains the storage medium on its own.=20
You really want to say here, "encryption at rest". and not talk about inlin=
e encryption and backend storage etc.


> It
> +is not a means of keeping data confidential from the host: the device, a=
nd
> +therefore the host, is able to read the buffers of both the request
> +virtqueues and the administration virtqueue. A confidential guest, for
> +example a guest whose memory is protected from the host by a confidentia=
l
> +computing technology, cannot rely on inline encryption to keep its data
> +confidential from the host, whichever key type it uses.
> +
The host and device terminology is bit confusing here.
Do not mix guest/host with driver and device here.
or I mis-read it?


> +\begin{note}
> +Inline encryption does not protect the data of VIRTIO_BLK_T_CRYPTO_OUT a=
nd
> +VIRTIO_BLK_T_CRYPTO_IN requests from the host: that data is transferred =
in
> +plaintext in buffers of the request virtqueues.
> +\end{note}
> +
> +When \field{key_type} is VIRTIO_BLK_CRYPTO_KEY_TYPE_RAW, the key materia=
l in
> +the \field{bytes} of struct virtio_blk_crypto_key_desc of a
> +VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_PROGRAM command is the plaintext key=
.
> +Any software able to access the buffers of the administration virtqueue,
> +such as the hypervisor, the device implementation or other software on t=
he
> +host, can therefore obtain the key, and decrypt the data encrypted with =
it
> +at any time, including after the key is no longer in use.
> +
> +When \field{key_type} is VIRTIO_BLK_CRYPTO_KEY_TYPE_HW_WRAPPED, a
> +VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_PROGRAM command only transfers a key
> +wrapped by the device, and the raw key material is not exposed in its
> +buffers.=20
replace material with key content or write the key attributes.

> This prevents the raw key from being extracted, so that the key
> +can only be used through the device which wrapped it. It does not preven=
t
> +the host, which is able to send administration commands itself, from usi=
ng
> +the key through the device, for example by converting a long-term wrappe=
d
> +key it has observed with VIRTIO_BLK_ADMIN_CMD_CRYPTO_PREPARE_KEY and
> +programming the result into a keyslot. Moreover, a
> +VIRTIO_BLK_ADMIN_CMD_CRYPTO_IMPORT_KEY command carries the raw key in it=
s
> +\field{command_specific_data}, and the struct virtio_blk_crypto_sw_secre=
t
> +returned by a VIRTIO_BLK_ADMIN_CMD_CRYPTO_DERIVE_SW_SECRET command is
> +visible in its \field{command_specific_result}, so these commands expose
> +secrets to the host in the same way as raw keys.
> +
I am yet to understand this part yet, but would prefer to avoid 'SW_SECREAT=
" wording.
want to stay away from SW word.

>  \subsubsection{Legacy Interface: Device Operation}\label{sec:Device Type=
s / Block Device / Device Operation / Legacy Interface: Device
> Operation}
>  When using the legacy interface, transitional devices and drivers
>  MUST format the fields in struct virtio_blk_req
> --
> 2.34.1

