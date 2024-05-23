Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2069.outbound.protection.outlook.com [40.107.102.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C8417F6
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 05:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716440842; cv=fail; b=kYCqbdzxNFZUSQPhKciQSM/2HL6JiLe61YG96SzJeaHEC64wyHb9zpGjkw30SKCRzLszo8mExZeOyHtqdJvsSmH5dUq+ZXX/jobs4pBqW+R8VDI69aM1z85G8w1H61veR4nai4Zw720QWrhbRg3F2i+CYwryFqVcYfU9IE7QAUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716440842; c=relaxed/simple;
	bh=5/JU4NQqqdSFp1nLteydvLCHHppusBcgApvk0t6chH8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZCp9Jqhffa/QRFm94xoqwWoxOvWFWaYewiTZxX7LlOjpa9qjPFWtBSNUP/EtL6oqA1RxkuKENzifG56MGy42TajTM+czUGPgmiFC4zR/JslSOUu/sEp4PPSG1Bp37hNj31GKFV37wSFDOkeYeepmBZCRYSPsdR4dX71e5nlj5kE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o3ZBzSL5; arc=fail smtp.client-ip=40.107.102.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o3ZBzSL5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxmE0qfjPp1NvIETfLjD40MBapYLUbf8hrq8HyFmVWKdEm8TerNmGBFeCN3WOudTLQWsoCxOUnW5lWMlVLEg0/eUUBNxmxi8ALCgG+RUssm3ugzA0vNwu2C7w7uNJSycGnoFSM8Bam0yDxFI6+4AAfiBNBWzeHkGeFnSOzjgYtbc/zB7Bti9SPrglno9wVifi7njCIwkYwKV4aI/o+LQNqcgmYhabSHrAC78Y/TziNxPe26YevCsBNNRDGZ2dSe3JKK/1ZtncuexjTRi8INduOO+zX1VNsGtug5IhX+ADgU2wxxCF7/GPifB0GQNnbbAzjGnaFHTXHywNh1QYILHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUVZFggQ089DmrfBu0EMN0BhjBemPeFcweEVWWm5m7Y=;
 b=nu/TK0oe3Sd1UbEwNDlJl+jov0PnXtDCmF/xa1+PXcvkTDrDOUGQY2thS0alv7FpNxB8dkvd1FyMCuF5+/4OwVmP8Y2bNve5r8Kv7IOVg9/Fj5bA/5Ii1rMqbgnYfRsXCEVW8IUCPatwwEIWDwMB0rEg3Eyc/m9BBUDvnO3fIncS/NWUpa/SI15Nq+xCIhnohuqtfMivuuXnuMGt+Oo/2shZng2Uhma4rL0yRMCdK/+X7B9eJeZeI+mfOA4i/ADO96FszTuffmfHFarmThRdni8bZlAlu8jYDkwe437YsYmfQtTIHLfZ8Z8qs3YPShLB5ji0NJr+vlCrtEwVVfvLwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUVZFggQ089DmrfBu0EMN0BhjBemPeFcweEVWWm5m7Y=;
 b=o3ZBzSL5mk/yw+t3of8Tal9J54TvQE+BKFkbvTM2fXdgLOjNi9pcvjQAd5xPkYDFy5R6Z5etY45yd34JqIJ/D4LP409Vi44Cq4LfQ3k37UUArZkNw6nBKpmd29QR5J+2rvas/plpprvp0IhUiE/YtBx/zhKld3r0cmMKhHq/kN28DbsTxPplOyGrqZFNtJMBNgJBU1ddHj0zBSb8lyUiaV3P7CvMiVGddbEzPbwyiYtHnQwiJerEIBMPuRGuij4uTw7ci8lJEIID0rWvq+MI+Afc5mSB5FBL1rRv7rJLkc09APdulIrQdj/gYKBZbC+FKpuyet99uQqE5pT6auU5AQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 05:07:16 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 05:07:16 +0000
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: RE: [PATCH v3] virtio-net: clarify coalescing parameters settings
Thread-Topic: [PATCH v3] virtio-net: clarify coalescing parameters settings
Thread-Index: AQHarMCbnUqLyFy28ke8qx4lXqPGgbGkQSEw
Date: Thu, 23 May 2024 05:07:16 +0000
Message-ID:
 <PH0PR12MB54819F69F8171B823B9D195FDCF42@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240523032332.50995-1-hengqi@linux.alibaba.com>
In-Reply-To: <20240523032332.50995-1-hengqi@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB8421:EE_
x-ms-office365-filtering-correlation-id: ae6bc159-3ed7-466e-eb6b-08dc7ae63719
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?9VUL6ikgsNddUh3z4Et76UIslb5jZbkn068/Tyq0p1rL72vSbxUqtS416QRy?=
 =?us-ascii?Q?w0m5GGTa7XpXjZgoMQUIjRIu/aHYiopHSRj0bHz07EPG2KiVHGFbv4qkxPqm?=
 =?us-ascii?Q?EXsqpQMQYSNiHysvOLh0yVbqjgfPAbuOZOj9Au0tQtVg8L8WnFES3qLD+19N?=
 =?us-ascii?Q?hYvsleJgqMkVaC/8WgvHc7MpVAYXwkHPSMSLm3kjpo7cbfEEg4JVdpRqc3zz?=
 =?us-ascii?Q?ZWJnih6nMFCXj3MaarO/WeVFe67YDo7FATG0EhomBIGvSqduZD6wj+Wx9uNh?=
 =?us-ascii?Q?S9pIywawjdOxg/efmJE+MDItjsQidDFt6mgOoYIaxzwZHbDocW87q2R4tEiU?=
 =?us-ascii?Q?YxtMWppkCyGCf+qlFt6JIO1KaYJkCADmcdz87AnhCJ7+5XKWweJ9kEUaHAz9?=
 =?us-ascii?Q?0n2APuKLEJg4aYZiOnSKLJC3WY+9eaaZqv4tbVS0ntz6/0rjRQRnp7q1u+uM?=
 =?us-ascii?Q?BeEAihVWmF2rAvy3/BpaxbPSdWGC3FWPY31axqys8RiBQEYAROmuf2UnDgsg?=
 =?us-ascii?Q?m50mliwvdXEOMoRODJcYj69zVG0t6uN94A9i7sYcxftVnYR4XPNNeOFU2pdb?=
 =?us-ascii?Q?8E05hzVgObmn/bmgBUj5atL/I5rdSlM6pCaFfPiwtMCepZJLeuMCvQk13QF8?=
 =?us-ascii?Q?BSEgUC4iIm7LcjHiUsGujlgJPndyX2jD1lq8uiqf4FOiRQOlhWLCIhXYj2/P?=
 =?us-ascii?Q?N61Oz80NFLzkp20fSQvba2sOW0BHy/SSFn7/3L6J3hIyw6X3XxObNTD0lizC?=
 =?us-ascii?Q?PJIb1oc2Tkvgj+5jg/TnqkEDS4XX1RIHmmlzyCWUAjzflRjH30v+mRs7+CBN?=
 =?us-ascii?Q?I6ysCkO3BzWKUgb5VbzYyL2YxVAIrBu/Hdh418PPwfOXBy/Sys5IZZq4UJYT?=
 =?us-ascii?Q?QeKzJV535D1bbqwrBLhwo/7CIYiB6PgW7TMbEsHPtVISmu5iOzYSrUiOEw6C?=
 =?us-ascii?Q?K+lGcXfBAUlRC2PR1CTeErbb5K/kTOldGiJOVIJtgJ4rohS6Q95c1FN+zffv?=
 =?us-ascii?Q?kz59WEJUYdRjRWE7GB56lHFOGvVq1O5vAIr/dYXKVt8Y5TbEpJlcfG0W/G+W?=
 =?us-ascii?Q?/l6DYFodoJC5h0zY9Esa6yRg06Lv2xk42mT9WUmH24ewyPGuG77h3ZgjCXUj?=
 =?us-ascii?Q?Dsy9bRpAEpElIQ1AuImHUcMAUeHe0JCmnmrON6Eo39Q5Cd0+1MS2GiP+F/uN?=
 =?us-ascii?Q?zde4BxCbO4/OPhP42sKRVYUM4/Qiz0jd0k84BvqEJsmCtd/dzMHsdNIQfmr+?=
 =?us-ascii?Q?D0iZpYRzrj6fTZNvstS8LsVtEec5xx3/0ReYDxif9BA6ByCDuaGhiCN6U2aq?=
 =?us-ascii?Q?p9xcgUOOIzFv82n/vOkwqcaPS31MJW9S2L69nfe22cZyyg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/oNd9s0/DUkSWhQMZuj6kvOl6pCXMw0oMU060oSjWd50GxiVWoR0UbNGyFbV?=
 =?us-ascii?Q?ck1KPEG/xXd4846SvvBOor1sVrQSqnnep7T99m9kUdVAs3R08/wj5Rm+HKiq?=
 =?us-ascii?Q?8aU4exRhlwqkidzstU0TREbbk2kvZUqy6gxq39JsqTLp/o+73dz44egvdTm6?=
 =?us-ascii?Q?gQj27Qef4MpD4hOKRCUNyF35T1CQPBx8B2YZVousHLNL0nzn0wWUsx8N9+s7?=
 =?us-ascii?Q?mcbKFYsBKpaEEHL1yMOMKrct8gtOjqUM3428XahLmvWyEO/QywVZbW7a1OLX?=
 =?us-ascii?Q?brDwdF5n9uy9+ma/IcqBvzlly8HoUaaGH7tXvfHtb69mf16PvveT/VZnHV0V?=
 =?us-ascii?Q?nOMNG+YTh5TJoM5mMs4cKC+mRE/FtR/0SWKZUTm/uNy3smvjGJR9KZYpbXfu?=
 =?us-ascii?Q?9uvmSrboypU2sag0ziNaGgEnmOQ1SdD+QXmHSYGaa9IkJw7AT0GNG8e36cE3?=
 =?us-ascii?Q?fB/0jHdf6MovWN5VPl4Qg4b6crQoaT0dLlji+Xcdo7z69yUcrWcPglLNMrjS?=
 =?us-ascii?Q?YbAa9R1xUNI+6wcudA35nkd79y1sOr55DEkmmTalYVVu287KcuJJ5FWbbR1e?=
 =?us-ascii?Q?+GGNqheuG3FqMUKvmG2+mEFn12L8fwFR7xIDyvhGrem0fHHHvsFmCwhoZjbi?=
 =?us-ascii?Q?NH+YVaVplc1XBsMUHxeqvHE+pO1Flo8pIf0LpaU0GnDFjtU3ZRuR2RCQ+OTH?=
 =?us-ascii?Q?UOIm5DVN2PFhod8PGBe6li5tzq4r0OOdFnw+cadyTZuXvaF5gM7G5iuMVfce?=
 =?us-ascii?Q?WmOJvE6S7PbcGMK9wmMkVzHiWzHxu8gQmicSEQZawFMnUfcZ/7FrDuRYDUXD?=
 =?us-ascii?Q?+tn5mvfTCVtjYrPN1HIbOydJk5cu2Gu7H8x5pL9QY1jBa69Q+2eFIOXXwn63?=
 =?us-ascii?Q?ncJP2gFZ1xKqlBTV74pd8a1czTMizU+UBL4Vp3ikTPtNxPha8PHl01LIEBl0?=
 =?us-ascii?Q?DwwJ4d2sBkSmhH4VwdMzF5nxcLLRPPD26q9pVsaJvNSkkOPdo52colBJL4XD?=
 =?us-ascii?Q?fdG2GP7lL5/lUZLrSwpEWiq/kYC5tMNVuyBmerfnGQY0c8sO6UqYjstUGV7x?=
 =?us-ascii?Q?GoKAtRTpjC5LrkNusFrVFPXi5uPz+reQa2kXAPe2NHGLN4VB5YdDPRNHRmeM?=
 =?us-ascii?Q?QUUDtlRs42QB437hjWkimapCBNvA3QcMoRZJk0yOU2m9f7+RBobqIj10QmfC?=
 =?us-ascii?Q?qEA/pWUrgczsRhXtcACPkLVSLpeFRbejgBYhXDGl6ukk/RGDxdAfYBLd7PrV?=
 =?us-ascii?Q?Mmoj9Wui1deO/GfZJ5V4sQWfAIgsmWfhgdWJv4fHKxRs8054pSu08UuAreoa?=
 =?us-ascii?Q?bMYEO1JDbMqX+UswEL8i/4XbzNKfEQQY4BAxzyxccVPZ+RNamT4pSN714yar?=
 =?us-ascii?Q?ni4ZCgg5lS6M+lmtGgSrE1Ja203gdofgfrULBWR3ghtJA6UxpcF/t8q0qB3k?=
 =?us-ascii?Q?te+blo7IvmzLjX7/FtHzafdJdRuCTb5+Zrj8kbeL82ZyWiIKJDADnzMB3rwP?=
 =?us-ascii?Q?4Zy60fNMzMbBIoUKGBaXqr0Em8BRublzs77qiVgrGMEL1gC2ZjsH+4HUeeVk?=
 =?us-ascii?Q?Eo/1ZKqZzvOwm6z7ay4=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6bc159-3ed7-466e-eb6b-08dc7ae63719
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 05:07:16.4876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dgNrgeQnyRc5zOnMExSVEpA+KmZVDyXofbyR75xrOnLHxjZwWJFQLXbHhjYyqm4o3Hhx0NiWDiNsWNyWPyQBVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421


> From: Heng Qi <hengqi@linux.alibaba.com>
> Sent: Thursday, May 23, 2024 8:54 AM
>=20
> The device can set any initial coalescing parameters (0 or non-zero) for =
the
> receive/send queue before the setting command is executed, not just 0,
> enhancing device performance even without DIM enabled.
>=20
> So we need to clarify descriptions that don't fit the behavior.
>=20
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> ---
> v2->v3:
>   - Clarify description to be more generic. @Parav
>=20
> v1->v2:
>   - Update description. @Jason
>=20
>  device-types/net/description.tex | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 61cce1f..f51e0d8 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1803,6 +1803,14 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi
>                                          for an enabled transmit/receive =
virtqueue whose index is
> \field{vq_index}.
>  \end{enumerate}
>=20
> +If the VIRTIO_NET_F_NOTF_COAL or VIRTIO_NET_F_VQ_NOTF_COAL feature
> is
> +negotiated, the device may apply any coalescing parameters to each
> +transmit/receive virtqueue before the driver successfully performs one o=
f the
> VIRTIO_NET_CTRL_NOTF_COAL set commands.
> +
> +The driver can query the current coalescing parameters of any enabled
> +transmit/receive virtqueue using the
> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET
> +command, before or after any VIRTIO_NET_CTRL_NOTF_COAL set command
> is done.
> +
>  The device may generate notifications more or less frequently than speci=
fied
> by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
>=20
>  If coalescing parameters are being set, the device applies the last coal=
escing
> parameters set for a @@ -1884,18 +1892,16 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi  The device MUS=
T
> respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and
> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET commands with  VIRTIO_NET_ERR if
> the designated virtqueue is not an enabled transmit or receive virtqueue.
>=20
> -Upon disabling and re-enabling a transmit virtqueue, the device MUST set=
 the
> coalescing parameters of the virtqueue -to those configured through the
> VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set
> any TX coalescing parameters, to 0.
> -
> -Upon disabling and re-enabling a receive virtqueue, the device MUST set =
the
> coalescing parameters of the virtqueue -to those configured through the
> VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set
> any RX coalescing parameters, to 0.
> -

These two normative statements are correct, the change should be only for 0=
 and only for TX and RX commands.
(no need to extend that to per VQ level commands).

There is no need to burden the device to remember the old value for each qu=
eue when the q is disabled.
No point in remember something when the device does not know if it will be =
ever enabled or not.

So it should be, =20

"or, If the driver did not set any coalescing parameters, the device MAY in=
itialize it to any value."

>  The behavior of the device in response to set commands of the
> VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
>  the device MAY generate notifications more or less frequently than speci=
fied.
>=20
>  A device SHOULD NOT send used buffer notifications to the driver if the
> notifications are suppressed, even if the notification conditions are met=
.
>=20
> -Upon reset, a device MUST initialize all coalescing parameters to 0.

> +Upon disabling and then re-enabling a transmit or receive virtqueue,
> +the device MUST apply the same coalescing parameters to the virtqueue
> +as were set before it was disabled.
> +

I think it should be,=20
When VIRTIO_NET_F_VQ_NOTF_COAL feature is negotiated, upon disabling and th=
en re-enabling a transmit or receive virtqueue, the device MAY set any coal=
escing parameters for all transmit or
receive virtqueues.

This clarifies the current behavior and also does not burden the device to =
remember any values related to VQ resource that is disabled (or destroyed).

> +Upon reset, a device MAY set any coalescing parameters for all transmit =
or
> receive virtqueues.
>=20
>  \paragraph{Device Statistics}\label{sec:Device Types / Network Device /
> Device Operation / Control Virtqueue / Device Statistics}
>=20
> --
> 2.32.0.3.g01195cf9f

