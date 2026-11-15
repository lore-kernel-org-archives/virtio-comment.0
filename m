Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794725778;
	b=zNcR3mTiL+/aJDsGamMbptC8CXMdcgSMkaHE21bkQ/IUj/H6k+247nyRZIvKb5Lyvx37
	 HP0g630wYA4vUGg3z9QNOFETXV/Y7KVR8f2mH+mknz8nVv+k1iNKVLKAguZPKL/uPtvJm
	 Q0cjc4u5LcAN2RzOHluCiXfc7HKlBzuEeFoKcWacz1HGffTnvKAJUXUJmN+CurRxLoIQ8
	 NW0hneADxzo5i0WN9eHMHfGquyf4pJHnNcPGu6RLyXDSiGj8WSOgRyLBYEcy6UHDPlY8T
	 B8VpC7OEdKZLqZHfF0yTcRDpGXQAMb86nu+5mWNwgOTsxb+wjRKuZOJMIKN0Yw4IQLg==
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
	bh=InteGlDdAwwBx+RGXr7q8C09FHYO8N152UVSXGg0edc=;
	b=09Y9eXG+Tms6Px3g7+Rc0vh1F4BJyxgBr1auX0/BXFkSIQ0+NhAADSerFueDh8WnVD4k
	 gnvjAaM51IJsogaY4IRh45xN4AfnGiSROx6FS5T0PRgUQNKk3MeVoK9oKzuedFxtkMsc/
	 sqYl1C95QZYLdvwP9oDGpE2uWuHK07dpV6JTZ3CogJ//o4qTdRW4wAQDLNNZRRjYp1KLE
	 s3hnczlguLQ97LBCl09K9JUFAV0CFGHW4XQ6KjuttSa4vTUpdMiU+tWsOUhMXko5q5NhH
	 +nhxXIiO2jQ+0dZC487sAQ29x2HeOcboQ36Pj6RIJ9gCt/V5Bk8/qMea18KeAyqFUUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TYWTQPWq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.41
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CD9606A32C;
	Sun, 15 Nov 2026 06:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97CD9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TYWTQPWq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYHb7ndt6ghXaqRDyUwOiP0Nr9Fr39uFmKMJoHjMdo3nn8mtqz9tgOksNbYlJ/r82f9HUgcYg8x00UEDSnLWp7ofPqQfpdl9uoRQCP7J797DNSQ2+06HIqW0vm2s0zauKXqyo7BtRHzO6y6n3zLcddoUOV3H2q/fBMvf2cJSpbfeawscPW3l2wt2QxRYIOovYq4uiBJJT1bbQCjyLOefm7tGffGj7qLxNqneZZ72jjW+5w6TxtUjVx2Bnnf29L42o+Jw8ItZQHjMr6Tymt/ZF35qqPOe3SQqeSycR+vmh2QPZZWUKijpPxjzLplxj1KqEKDeUSLRT8Q8dkZhU9zsrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InteGlDdAwwBx+RGXr7q8C09FHYO8N152UVSXGg0edc=;
 b=CaTQomf3kWAivza2EcXOJFbNWoof7fURIC/OalH6mvB2RR1e6PojMfnWZGhKDPyHh9CLrybS/gXsNVoY4k8EUsFJ0nPmHPdb6MxB7T9hzEPuX/Dbo4vXvUaiFJDGkLAF+uRrlPE6qUQqJh30/FGLzGIXy8e8eK4EaTbhVAR0ZKnub6H2CmgmTkZD1bAeBhZYA18/azr5daDCuRMcpttyYEaa0A/WBKjjaS/CJm3wk1NNn5R0bxIW+OV0ff5DUiLB69Cm95A1puK2NwYS4sm8wtpK9NcBqzEMrkyyWDEytpywZCerMSPMkwZwMVaNabuRhR6XWOW80fTsYBXIZrk5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InteGlDdAwwBx+RGXr7q8C09FHYO8N152UVSXGg0edc=;
 b=TYWTQPWqf+VqghwNy1G6Csa9kmqoC+mB6hBXsqDifXizCmDglS9CWLBmFjGhxdSIb84dJ4me3N+BU5nRk92oxJP6KbrBmME+UsNmey0F0lI1bkHZQof//qcx+VEEw7W0LXCANYeJluTe77R9yXzpvOGIyrNprW8eVL0tGOfuOWgKHKxRA8JfYx2tClbaqqoeMlpILZmgdUsJhX9hMGYMD4UJGopsfjTLIQIoPppzFVjoreFEoJB2QxudSi3j+B+eNg/3XBSNPKcFq/fu234wqGRcKe9tSuKoNHvX7/CPSBXgHPWQbXjehzXud2V7oLwL0TfBM6dy26HQdy2we+63qA==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by PH5PR12MB953872.namprd12.prod.outlook.com (2603:10b6:510:501::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 06:55:18 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%3]) with mapi id 15.21.0615.009; Sun, 15 Nov 2026
 06:55:18 +0000
From: Parav Pandit <parav@nvidia.com>
To: Linlin Zhang <linlin.zhang@oss.qualcomm.com>, "virtio-dev@lists.linux.dev"
	<virtio-dev@lists.linux.dev>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "stefanha@redhat.com"
	<stefanha@redhat.com>, "mst@redhat.com" <mst@redhat.com>, Max Gurtovoy
	<mgurtovoy@nvidia.com>, "ebiggers@kernel.org" <ebiggers@kernel.org>
CC: "neeraj.soni@oss.qualcomm.com" <neeraj.soni@oss.qualcomm.com>
Subject: RE: [PATCH v6 3/4] virtio-blk: Add inline encryption request types
Thread-Topic: [PATCH v6 3/4] virtio-blk: Add inline encryption request types
Thread-Index: AQHdZfL3acVS7qXiaEC272t2WJ3gnbcuzA7g
Date: Sun, 15 Nov 2026 06:55:18 +0000
Message-ID:
 <SJ0PR12MB6806D8F8C992281EDC5F9FECDC7D2@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20261027090945.185178-1-linlin.zhang@oss.qualcomm.com>
 <20261027090945.185178-4-linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20261027090945.185178-4-linlin.zhang@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|PH5PR12MB953872:EE_
x-ms-office365-filtering-correlation-id: 4707c070-4639-447b-32b6-08df42e568b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261009221227099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 w7OQy9UAmUkPC4XnkQr0mjbX9BhweLW9+tF8jtT6ZsvtfQSwu5e5F30XaZqX5B0Vtv7GVyy+KmL3S/bvfqiQT7ns051k/8WRtZcmXik/fjSHtQS1rNUHoiuXU4478BgghZSoFELo6pe63bH1Idlh0yvddj7qbw+IjzQxyWYTcs67FV212mZYIDotTNFQxm8cXJb3d39EniXhOV9xeo6rJUgIuqL4Qkj7okeZ0Mq9II2FxlZLRSc76OoctRzMH985JR5rq50VRxipOtg/P5wWZkuIyreVSzUBVrZPmTaZ7VTZOASrUSHu8YwgRzw4frR6Igj9yUMxGaM4ufviNR1mmKgLoTzdk8QDCn+MqgaHOf2XUjjhHhzYvetL9JVgC5tLPS9qN3yy7+VJZwBFCS/ZFNQ/yQLj6GPFkS1rPIGdcU7XR1+lhJ1y7psMn+oxOkvcbUq1Bu01t3zlt+ZchO/XbcfKo4f8HFWHuhPFfBLOKNn+oD52Wv3RZB6nab7cy83WssiaksLfGg/GQse/DTDskIRu+GsKQtMSRFbFdjNRcqJSfmCcVgZJh7KK/QmX7DBhGnbJ0remISEu79azwYV/cYDXcvm9M/dTRovLcZaUK8sA3qO+Z0GoYMkSCxnkVkUAxSncvT80LIUzsUMi+KZqC2RcvPB81DzFSI4178HyUpU5nwVAibkvrjkBEjIBX7XK2eWkb7r9l6uJZjISHKcAOty9G4U7Pb1idw0LbBqVAv8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261009221227099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5wMy48R8oMLfxJtslaavdNtmorNAepLAyXIWwWVwuwM/rFUQpknyH/ddR/Te?=
 =?us-ascii?Q?yJMkHPGl649R63OEXcvIZxbR/wl6AvmU1OZMKXIhaRB1DhVciOz1grhY790Z?=
 =?us-ascii?Q?P7s1yrm7d8EvRLLuIKyCU66NrOLeFS+Z4AraBKlcRexqpySfnPq5V9PZfTC6?=
 =?us-ascii?Q?UE81uYs2UumVpOPNxoqc+BKzbcXISljVOx1fHhfAtS+WvKWIAX7iVSGoDY39?=
 =?us-ascii?Q?wMCRCNa4wQVsQpXFuJU+gTgnBmm6QmE6i9DLHtzM9T+xyAvBC/J7Kf61ipiB?=
 =?us-ascii?Q?u4o9guYlBSyjRIM5+oikQq2M5APV53YwT34iOlIJ/JmowtSS5M0A0ljYIsXu?=
 =?us-ascii?Q?s2ax2y4rP4YXTUblRTlhCNeICUZ2DMwOuaM8aDWhUhqR3aTzUzyFqKTh6Z7g?=
 =?us-ascii?Q?XZoKUeRcusZamNCPJUmymdY0gEdqGau6krD1kxZJo1J5t8gB/4rP+dUgsO2v?=
 =?us-ascii?Q?I/d2lvTiEyyc02HmX7knecmai+8bF1xwl9DJ95bNo64BaG1fXN/1mbkRDHUf?=
 =?us-ascii?Q?XQR/vAFtKcq9fFOAsVA+d/fL/6SZymlnfPekBVbXyCOieQpjTIRtumCcAFHV?=
 =?us-ascii?Q?RTfdFp0VdbhtYGpTPY39LEX+v3oIM9+181sYfQETWawGGSIof7t+DtxgZlCN?=
 =?us-ascii?Q?CHvyoun7OCERFnnip/GHere/1arrwT4esM2L8eZDe61ZIyrtvrqjMvn0eYoS?=
 =?us-ascii?Q?2OjDrnzElMDhXq3rPpXST3HKeak/WGTaVWkaYOoD3upyxvYsFu04IhzRMs+E?=
 =?us-ascii?Q?dKbHelTlTej94VBluYgXDOOJ4Ce4Irzccwim7UeT7LUdgvGs4JSUvXLanPMc?=
 =?us-ascii?Q?koLIZvxaM5ymrLvDnR7OhkxHdSt8/XBtnQsHtAwh/g24gY0XztkwaHXcCrjr?=
 =?us-ascii?Q?L7MB8IC7YQtFySITGo//z0J4MdQcaRMWTCeDVx5U4vfLTIyUdgHaoVp3YBYy?=
 =?us-ascii?Q?mOT2lonMoSkFKDKQ8ztyxNDtcgcxgREXTDX8GbDieGL7mrfMkzDVY9DVxhW9?=
 =?us-ascii?Q?MO/lA7pfn6YucLt+LYSJHvwE6QEoP4sthIsE3hU0LvzSzMRQiyddY77btyeH?=
 =?us-ascii?Q?mKnr0A8kUmNcdkRoxounHls5a3bLiG2jUyyDsUtwUuvOGnt54tdmsyl+1LJj?=
 =?us-ascii?Q?QpXws67z9ybslUeAfZnLvbVWly5PxSXF8LOF9Hq66XEssqr/XhkAepAG6A4H?=
 =?us-ascii?Q?ExdqEQWu4jI53FJ2xvmRpWmZD50nK93N9xZQkuu9VN2NIfJWeQJ3o7M8YOoE?=
 =?us-ascii?Q?efo5MKGuAZ7J90rxEt7sf1gU4nNNTfXe3uJ/66JLz0qzoRIb3sOUcl6/UpJ1?=
 =?us-ascii?Q?k92P4T/t7T6yDFEDce2uU2mndiwCh+eoLTwnBAXbIiWjuCVxsE1P8BuSN2CO?=
 =?us-ascii?Q?sLqYPGgBL3K4m/175Mn2fFU5vDaghKY+oq99yl0Kh3GJPAKaSQlg1mV7ZuSE?=
 =?us-ascii?Q?f9BF+uv7Rlvi2UrJXSGDD86AJpI7/+GMvSBF9+rvvJWrd8xMSz7jkGQr+7zK?=
 =?us-ascii?Q?G5o4VjBs7INy9HHSMDFS6jUIsUAZNTPiEDiZVUHnSUrzDNJk3qh0kw8I96Yj?=
 =?us-ascii?Q?m8+aYR97tleES0UHDqifr/QMchUHw6UvtIFeOFrvLctRzy1SPgVp1s3ioO7d?=
 =?us-ascii?Q?e+hcOEremkpzUDddVs9L+8ECPa7+P4NnzITJjOS1EYBGAa42BVzJluzf3n8M?=
 =?us-ascii?Q?cK6vrAZkB1Hayi3klq5rT9r+Zq8/oXCAgRPzN+BPRNUrMkZ3?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4707c070-4639-447b-32b6-08df42e568b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2026 06:55:18.1295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z8L5eDh0NPadRb7hDL15mBR64Mqak3iSpqJbtwlpgz50wCQhqLG2ZxcrLmo0M4ryXEWDRvlnAIofsrrZncvi+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB953872



> From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
> Sent: 27 October 2026 02:39 PM
>=20
> ---
>  device-types/blk/description.tex | 184 +++++++++++++++++++++++++++++--
>  1 file changed, 174 insertions(+), 10 deletions(-)
>=20
> diff --git a/device-types/blk/description.tex b/device-types/blk/descript=
ion.tex
> index b85db2e..bbae9af 100644
> --- a/device-types/blk/description.tex
> +++ b/device-types/blk/description.tex
> @@ -71,7 +71,8 @@ \subsection{Feature bits}\label{sec:Device Types / Bloc=
k Device / Feature bits}
>=20
>  \item[VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA (19)] Device supports the
>      VIRTIO_BLK_REQ_FLAG_OUT_FUA flag in the \field{flags} bitfield of th=
e
> -    \field{virtio_blk_req} structure for VIRTIO_BLK_T_OUT requests.
> +    \field{virtio_blk_req} structure for VIRTIO_BLK_T_OUT and
> +    VIRTIO_BLK_T_CRYPTO_OUT requests.
>=20
>  \item[VIRTIO_BLK_F_INLINE_ENCRYPTION (20)] Device supports inline
>      encryption: data written to or read from the device can be encrypted
> @@ -393,7 +394,7 @@ \subsection{Device Initialization}\label{sec:Device T=
ypes / Block Device / Devic
>  \item programming and evicting keys in the block device's keyslots
>      through the administration virtqueue.
>  \item submitting the keyslot index and Data Unit Number (DUN) per crypto
> -    request to the device.
> +    request to the device using struct virtio_blk_crypto_msg.
>  \end{itemize}
>=20
>  The driver MUST NOT negotiate VIRTIO_BLK_F_INLINE_ENCRYPTION without
> @@ -583,8 +584,8 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
>  value is the bit index in the \field{flags} bitfield):
>=20
>  \begin{description}
> -\item[VIRTIO_BLK_REQ_FLAG_OUT_FUA (0) for VIRTIO_BLK_T_OUT requests] For=
ce Unit
> -    Access (FUA) flag.
> +\item[VIRTIO_BLK_REQ_FLAG_OUT_FUA (0) for VIRTIO_BLK_T_OUT and
> +    VIRTIO_BLK_T_CRYPTO_OUT requests] Force Unit Access (FUA) flag.
>  \end{description}
>=20
>  The \field{sector} number indicates the offset (multiplied by 512) where
> @@ -991,6 +992,71 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Block Device / Device Ope
>  operation by setting the VIRTIO_BLK_S_ZONE_INVALID_CMD value in
>  \field{status} of \field{virtio_blk_req} structure.
>=20
> +The following requirements only apply if the VIRTIO_BLK_F_INLINE_ENCRYPT=
ION
> +feature is negotiated.
> +
> +In addition to the request types defined for devices without inline
> +encryption support, the type of a request on a request virtqueue can be =
an
> +inline-encrypted read (VIRTIO_BLK_T_CRYPTO_IN) or an inline-encrypted wr=
ite
> +(VIRTIO_BLK_T_CRYPTO_OUT):
> +
> +\begin{lstlisting}
> +#define VIRTIO_BLK_T_CRYPTO_OUT   27
> +#define VIRTIO_BLK_T_CRYPTO_IN    28
> +\end{lstlisting}
> +
> +VIRTIO_BLK_T_CRYPTO_IN and VIRTIO_BLK_T_CRYPTO_OUT requests behave the s=
ame
> +as VIRTIO_BLK_T_IN and VIRTIO_BLK_T_OUT requests respectively, except th=
at
> +the data in \field{data} is decrypted (for VIRTIO_BLK_T_CRYPTO_IN) or is=
 to
> +be encrypted (for VIRTIO_BLK_T_CRYPTO_OUT) by the inline crypto engine i=
n
> +the device backend storage using the key already programmed in the keysl=
ot
> +identified by the request, combined with the request's Data Unit
> +Number (DUN). For this reason, VIRTIO_BLK_T_CRYPTO_IN and
> +VIRTIO_BLK_T_CRYPTO_OUT requests use the following layout, which adds
> +\field{crypto_msg} to carry this information:
> +
> +\begin{lstlisting}
> +struct virtio_blk_req_crypto {
> +        le32 type;
> +        le32 flags;
> +        le64 sector;
> +        struct virtio_blk_crypto_msg crypto_msg;
> +        u8 data[];
> +        u8 status;
> +};
> +\end{lstlisting}
> +
> +\field{crypto_msg} has the following structure:
> +
> +\begin{lstlisting}
> +struct virtio_blk_crypto_msg {
> +        le32 slot;
this becomes the key resource object id.

> +        u8 unused4[4];
> +        le64 dun[4];
> +};
> +\end{lstlisting}
> +
Please define this struct before defining struct virtio_blk_req_crypto, bec=
ause msg struct is used by it.

also, it is less of 'message', and more of key info part of this request.
So please rename the struct to say blk_crypto_key_id or key_info {}.


> +\field{slot} is the keyslot index, in the range from 0 to
> +\field{max_slots} - 1 of \field{enc_characteristics}. The device backend
> +uses the key programmed into this slot together with \field{dun[4]}.
> +\field{dun[4]} is a 256-bit unsigned Data Unit Number represented as fou=
r
> +little-endian 64-bit elements, with \field{dun[0]} as the least-signific=
ant
> +element. The device increments this 256-bit value by one for each succes=
sive
> +data unit of the size specified by \field{data_unit_size_bits} in the
> +struct virtio_blk_crypto_key_desc, propagating carries from each element=
 to
> +the next, while encrypting or decrypting the data of the request. Since
> +\field{dun[4]} holds 256 bits, \field{max_dun_bytes} is at most 32.
> +\field{unused4} is reserved.
> +
> +The size of \field{crypto_msg} is 40 bytes, so \field{data} of a
> +VIRTIO_BLK_T_CRYPTO_IN or VIRTIO_BLK_T_CRYPTO_OUT request starts at offs=
et
> +56 of struct virtio_blk_req_crypto, instead of offset 16 for other reque=
st
> +types.
> +
> +The remaining inline-encryption-related operations are group administrat=
ion
> +commands, sent on the administration virtqueue; see
> +\ref{sec:Device Types / Block Device / Device Operation / Inline Encrypt=
ion Administration Commands}.
> +
>  \drivernormative{\subsubsection}{Device Operation}{Device Types / Block =
Device / Device Operation}
>=20
>  The driver SHOULD check if the content of the \field{capacity} field has
> @@ -1009,8 +1075,8 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Block Device / Device Ope
>  A driver MUST set \field{sector} to 0 for a VIRTIO_BLK_T_FLUSH request.
>  A driver SHOULD NOT include any data in a VIRTIO_BLK_T_FLUSH request.
>=20
> -The length of \field{data} MUST be a multiple of 512 bytes for VIRTIO_BL=
K_T_IN
> -and VIRTIO_BLK_T_OUT requests.
> +The length of \field{data} MUST be a multiple of 512 bytes for VIRTIO_BL=
K_T_IN,
> +VIRTIO_BLK_T_OUT, VIRTIO_BLK_T_CRYPTO_IN and VIRTIO_BLK_T_CRYPTO_OUT req=
uests.
>=20
>  The length of \field{data} MUST be a multiple of the size of struct
>  virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD,
> @@ -1089,6 +1155,51 @@ \subsection{Device Operation}\label{sec:Device Typ=
es / Block Device / Device Ope
>=20
>  \end{enumerate}
>=20
> +The following requirements only apply if the VIRTIO_BLK_F_INLINE_ENCRYPT=
ION
> +feature is negotiated.
> +
> +A driver MUST NOT submit a VIRTIO_BLK_T_CRYPTO_IN or VIRTIO_BLK_T_CRYPTO=
_OUT
> +request unless all of the following conditions are satisfied:
> +
> +\begin{itemize}
> +\item \field{slot} identifies a valid keyslot in the range
> +    [0, \field{max_slots} - 1].
> +
> +\item the keyslot identified by \field{slot} has been programmed with th=
e
> +    key to use by a VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_PROGRAM command
> +    which the device completed with VIRTIO_ADMIN_STATUS_OK, and since
> +    that command completed, the device has not been reset and no other
> +    VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_PROGRAM or
> +    VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_EVICT command for that keyslot h=
as
> +    been made available.
> +
> +\item \field{data} is non-empty.
> +
> +\item (\field{sector} * 512) is aligned to the data unit size of the key
> +    programmed in the keyslot identified by \field{slot}.
> +
> +\item the length of \field{data} is a multiple of the data unit size of
> +    the key programmed in the keyslot identified by \field{slot}.
> +
> +\item the Data Unit Number (DUN) of every data unit covered by the
> +    request is representable with the \field{dun_bytes} bytes in
> +    struct virtio_blk_crypto_key_desc specified when the key in the
> +    keyslot identified by \field{slot} was programmed.
> +\end{itemize}
> +
> +The driver MUST NOT make a VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_PROGRAM o=
r
> +VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_EVICT command available for a keyslo=
t
> +while any VIRTIO_BLK_T_CRYPTO_IN or VIRTIO_BLK_T_CRYPTO_OUT request whos=
e
> +\field{slot} identifies that keyslot has been made available and not yet
> +used by the device.
> +
> +For a VIRTIO_BLK_T_CRYPTO_IN or VIRTIO_BLK_T_CRYPTO_OUT request,
> +\field{dun[4]} MUST specify the 256-bit DUN of the first data unit cover=
ed
> +by the request.
> +
> +The driver MUST initialize \field{unused4} in struct virtio_blk_crypto_m=
sg
> +to zero.
> +
Since the encryption is done at per virtio request level,
it is unclear to me, that if previously data was written at sector using en=
cryption key
and if next request is plain-text read request, what should be content of t=
he data?
encrypted ciphered text?

Did I miss reading this normative and theory of operation in your patches?
if not, please add such description and normative for the device.

>  \devicenormative{\subsubsection}{Device Operation}{Device Types / Block =
Device / Device Operation}
>=20
>  The device MAY change the content of the \field{capacity} field during
> @@ -1135,10 +1246,10 @@ \subsection{Device Operation}\label{sec:Device Ty=
pes / Block Device / Device Ope
>=20
>  \item\label{item:flush3} the VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA feature was
>    negotiated and the VIRTIO_BLK_REQ_FLAG_OUT_FUA bit in \field{flags} wa=
s set in
> -  the write request (regardless of whether the VIRTIO_BLK_F_FLUSH or
> -  VIRTIO_BLK_F_CONFIG_WCE features were negotiated, and regardless of th=
e
> -  current cache mode as expressed by the value of the \field{writeback} =
field in
> -  configuration space).
> +  the write request (VIRTIO_BLK_T_OUT or VIRTIO_BLK_T_CRYPTO_OUT, regard=
less of
> +  whether the VIRTIO_BLK_F_FLUSH or VIRTIO_BLK_F_CONFIG_WCE features wer=
e
> +  negotiated, and regardless of the current cache mode as expressed by t=
he value
> +  of the \field{writeback} field in configuration space).
>=20
>  \item\label{item:flush4} a VIRTIO_BLK_T_FLUSH request is sent \textbf{af=
ter the write is
>    completed} and is completed itself.
> @@ -1330,6 +1441,59 @@ \subsection{Device Operation}\label{sec:Device Typ=
es / Block Device / Device Ope
>  handles VIRTIO_BLK_T_ZONE_RESET request for the zone range specified in =
the
>  VIRTIO_BLK_T_SECURE_ERASE request.
>=20
> +If the VIRTIO_BLK_F_INLINE_ENCRYPTION feature is not negotiated, the dev=
ice
> +MUST reject VIRTIO_BLK_T_CRYPTO_IN and VIRTIO_BLK_T_CRYPTO_OUT requests
> +with VIRTIO_BLK_S_UNSUPP status.
> +
> +The following requirements only apply if the VIRTIO_BLK_F_INLINE_ENCRYPT=
ION
> +feature is negotiated.
> +
> +If a VIRTIO_BLK_T_CRYPTO_IN or VIRTIO_BLK_T_CRYPTO_OUT request satisfies=
 any
> +of the following conditions, the device MUST set \field{status} to
> +VIRTIO_BLK_S_IOERR, MUST NOT read from or write to the storage, and MUST=
 NOT
> +write to \field{data}:
> +
> +\begin{itemize}
> +\item \field{slot} does not identify a valid keyslot.
> +
> +\item no key is programmed into the keyslot identified by \field{slot}.
> +
> +\item \field{data} is empty.
> +
> +\item (\field{sector} * 512) is not aligned to the data unit size of the
> +    key programmed in the keyslot identified by \field{slot}.
> +
> +\item the length of \field{data} is not a multiple of the data unit size
> +    of the key programmed in the keyslot identified by \field{slot}.
> +
> +\item the Data Unit Number (DUN) of any data unit covered by the request
> +    is not representable with the \field{dun_bytes} bytes specified when
> +    the key in the keyslot identified by \field{slot} was programmed.
> +
> +\end{itemize}
> +
> +For encrypted reads and writes, the device MUST use the key programmed i=
n
> +the keyslot identified by \field{slot} and the request's \field{dun[4]} =
as
> +the DUN of the first data unit covered by the request, and MUST obtain t=
he
> +DUN of each subsequent data unit by incrementing the 256-bit value by on=
e,
> +propagating carries from \field{dun[0]} through \field{dun[3]}. If the
> +device splits the request, each sub-request MUST preserve data-unit-size
> +alignment and use the 256-bit DUN obtained by incrementing the request D=
UN
> +by the number of preceding data units.
> +
> +On a device reset, the device MUST empty all keyslots, so that no key
> +programmed before the reset can be used after it, and MUST NOT invalidat=
e
> +the long-term wrapped and ephemerally-wrapped keys it has produced befor=
e
> +the reset.
> +\begin{note}
> +The driver therefore has to program the keys again after a device reset
> +before submitting VIRTIO_BLK_T_CRYPTO_IN or VIRTIO_BLK_T_CRYPTO_OUT
> +requests that use them, but it can reuse the hardware-wrapped keys
> +obtained before the reset to do so.
> +\end{note}
> +
> +The device MUST ignore \field{unused4} in struct virtio_blk_crypto_msg.
> +
>  \subsubsection{Inline Encryption Administration Commands}\label{sec:Devi=
ce Types / Block Device / Device Operation / Inline
> Encryption Administration Commands}
>  If the VIRTIO_BLK_F_INLINE_ENCRYPTION and VIRTIO_F_ADMIN_VQ features are
>  negotiated, the driver uses the administration virtqueue (see
> --
> 2.34.1

