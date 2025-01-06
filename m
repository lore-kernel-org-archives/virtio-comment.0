Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8575F171D2
	for <virtio-comment@lists.linux.dev>; Mon,  6 Jan 2025 05:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736141836; cv=fail; b=b+nUxu2FfiZSUVnKPK8deJj3NImaTUr0l83NrgFepBV+Oe2aF3ewlooCtqPQSoVfSVZQgYpo6vKxg/R+eEl5I/o9jXcCiP72IhzDGbvoA7uBLk++QEJQ4pjLlx7Z1fVMu+ynul9/WwCEUi8Zp119XrjacZAzKrlslQrJuVGtmK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736141836; c=relaxed/simple;
	bh=I3+M4GxB1QA4oN1lw6k8n+O6Hl74RecRuwuoDcpaQ8k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F1WDDQbG+lLZ/it1z9pAiKW9HCIxObyaOEvesrRrzgpRlIKd6RE73NsUQeXzPJqCaRcCJzWElp2Nf2T+JowTUaX3ucpEeSjUpesAsd/7eZS3BDk7ZjNcqhku1hTRFWvB5EqnMYfGdoChB0raXj2DF2Ks8LtX3o/NGmDHr8Tzabo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qp4GfsNa; arc=fail smtp.client-ip=40.107.237.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qp4GfsNa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybmmyu1nCxWykdhScQN+srs0DrY6d2jlQbObNJdRGJ6uglxKHEPUbPQVnyheXmnXLtW96Ju3lXA5FNZ6FjVj2drrSJzP4BT7sSA+g83TOq2IxR+kcSiqijL00OuuS4zdU1xWIPZPVHlj+ROQvtmajSfO9bhTj5NWrhAoHEQaAVZNKzLWXyXfeD06QU4iEg+wtiBbdya34SfC+gFC6FHmhnhzjK353tIr2me+sdcMZX7wwMiIjkj3co5k4WehSiGxjlTu7sGxHRZ1ea8avRVarhU+5j9RH/mJsV2lrOlg1h1WNWl9B9alSDj8bpyLjjncVapqwsoozZGeJ8HD/S2ERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mas22yRkZ+/IjIQnUFAHv3oeekBBzrZPz5+Nr8xsXPA=;
 b=m2al3YoswaIE41iE3MhuNUFHuude0w57EH6hrnR1TR059Td1gMs9MyneV/2QfnpVyB0uitnJi0scPgyL5862mLYJJjwylLrLCsIaB0g+gLI6vJriKtCRtB7bL6e78G2RlUc+ssrwZQJZIg/SUdXbd1R0k3ZfbtM/JG2cwCJUDG8I0zWSoE6Jgl5LI5Vs0d7PZQLYwSNGA3gj5B7RGp/DXFgEXMCOWer70vF0Ilzk6TSWru/wPjecaadVxCGmhWPZwihS8FPjFJpbVV/eK29FIJY2Wb0LAqypPsjyNgcRMf5aTn+K1T371fdRUMbmqnrmqfdbuYgBb8xQUPOkBz42Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mas22yRkZ+/IjIQnUFAHv3oeekBBzrZPz5+Nr8xsXPA=;
 b=qp4GfsNa7GAFP+DO/YJQWldHvN4TxuBf5p7MRvY7NTAQsykMBpoUEwk1AjfvU4pZpNlK/8QU6fLyE+ZsJ3ks/RzODkExBTcWuFj0rNA9kSaSyHaAxXJXa+33zEnAX8dJT6+R+CO1aXwM7EEVm+qW7xp1XL4+Nxq9DyQDeb40PIiK8Qo2Vdqa+nC7HdqbgiLHl/bAIF10lsN2tEV6ZKC2yb/An93hp4VP8EdX0Sc7Rf13a2uabjzmPq41ZWqDnB/B62OTy2fFNDqwDXu7m6UYCsu2z1xuBr7ryjIKL21TLtCWCwesIykY+UhkgUptoAVaWM5Of5RtLlis4gBino0nZw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.16; Mon, 6 Jan 2025 05:37:05 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 05:37:05 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>
Subject: RE: [PATCH RFC 3/4] virtio-net: updates to virtio_net_hdr for IPsec
 support
Thread-Topic: [PATCH RFC 3/4] virtio-net: updates to virtio_net_hdr for IPsec
 support
Thread-Index: AQHbT6gqKgmrlFjot0CJa6KW+2V/8LMJTlBg
Date: Mon, 6 Jan 2025 05:37:05 +0000
Message-ID:
 <CY8PR12MB7195646BD0235C75D150D3D9DC102@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241216104859.2720719-1-schalla@marvell.com>
 <20241216104859.2720719-4-schalla@marvell.com>
In-Reply-To: <20241216104859.2720719-4-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB6262:EE_
x-ms-office365-filtering-correlation-id: 6c419f6b-9522-4300-4777-08dd2e14276a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Vu9q26MSmD9ILkLuP47O+zGMoINgCFagc5WZHtuoJG4excud+w9nyvq2hwvn?=
 =?us-ascii?Q?vzTSPOcJ++fQinLObdFfiU/2/bKx04iC54dU8bELe+Bn4oE4mQlBKg16l6bq?=
 =?us-ascii?Q?a4Z8qWtxM/Ma4BTFFjZBlEibMJwSBHMHzg0OCzIPj+hzb2NWYp1vIW8Fv5Js?=
 =?us-ascii?Q?QgJbdDUCrukbdSRu/65xXPCLxW+0b0xs7CBR6DH3BkAtOwi2BQeRjm6NS3eO?=
 =?us-ascii?Q?9TQ8SBdwFSqnbzCKEniBEUqNhL4Xn7GqDp1zEzu+q2aw1L07kSOK7b0Ff1OY?=
 =?us-ascii?Q?BGU9nwqfCjE8g2br4lwNpnTWHkR5nF46FOPKZ2WzNk+rv93CCyr0kdV0+mv4?=
 =?us-ascii?Q?ITfv7NYIsBfbXgtwgy//vg6sQawmB+LUsTRTIc5HWVvVhGN85+KB/RpjgKRm?=
 =?us-ascii?Q?E+RmCtbCPU6jaDb8ZOyiyBqcYdM4+22aSzbTsaumB3nvywvDSOd/xlxVRGW2?=
 =?us-ascii?Q?Vjg1zOkLBgK7uBH22B9WVyfzA7fxaWWckaFKgpDFCREBu/tIDQz+O7RMp83H?=
 =?us-ascii?Q?J22HjqpPQQfFZBl8EHa9VYgxEniDP/8GFNgspvjdZUFENESyOttAH4LigKPd?=
 =?us-ascii?Q?/ktV9YaeWRCVTqI11+CASqXNHwp2TU7Ky6UQxy6onM/BR1LPb/Pw8ewJhKkL?=
 =?us-ascii?Q?e4oMYbDxtYv1TrCfRkSsYWkaJVXB1idM8m4RIs6rqqen25O/qhDxX9Zz9c9S?=
 =?us-ascii?Q?8svb0r7R6Li4QDSsm1Yp78FgsB1K+9enHkc5tu9Z9YMmEyZT2HWOc0puXlQ1?=
 =?us-ascii?Q?MGBVopHIlWttyf6esMEYn18+JSNtFo0o6gntmoWzLr0NN82P6g9m+4v+Grve?=
 =?us-ascii?Q?umq2HfZQaBldyXjKvqTfdNbfJir9sPmqCQY/g3HlJzF1C0B+0EsGex59B+fQ?=
 =?us-ascii?Q?aSP0Z37ja0v9QT9liFAJGzS//I8sGX6stY4pSuT2X2jBvWAed1SO2U7dCU14?=
 =?us-ascii?Q?7cY+hUOPuBnyMhrll0crENz3xUUdoi3uwDLxYi7MzJV79nJdJxjsAImFGJrc?=
 =?us-ascii?Q?AU2yifDeBYbb8jv0yv9TXOi9xCkNfbq8g8cBncuK7u8XBoh8BL4cMvelBJxr?=
 =?us-ascii?Q?VWVUTsuza8x3vq6BkdzjCpFsqkalHeCP/OUtO/gHTefpGHF0eUJOB1OmUXoC?=
 =?us-ascii?Q?XuqETphno1ARDCKTiTY+Uf5udUSJeNqYceWjotE2F9/3BB+LDR647TFRuRBK?=
 =?us-ascii?Q?o2FDMPZkfR7dP+TCFLQ1jvXBaEGdyq0OGjJNwDWP332VyyXtkberLGPDC10h?=
 =?us-ascii?Q?AXsMrN7zioKVAvWEwYFDj0fqJZFLGsh/sgXDjRp2XORYSqeLr0pxFHYTEIcJ?=
 =?us-ascii?Q?sAFhzAETliSrsDNTWJLU4dCAZYPjFHKeI7wJGsNhPLomhDajekb1dz0FxDst?=
 =?us-ascii?Q?+c02ir4umB2COqy/W+P02abQFSXcXWliKyVqKkG8HqlyN2h1v0e3OmnVq7XZ?=
 =?us-ascii?Q?yMWz5ypWi17CLeNMUSXkCZ4idbj0X5BH?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4xsrKZMIC1WpeLvaOnYcXquUmOgsAcP+uastlzStC5EKn90c09Ne2DAcHSWj?=
 =?us-ascii?Q?5gPtOPt7NNTsYUiPzS8BJTvEjY1VX1Tkz5pg0teoSHjW9d973pd97SXdJAdp?=
 =?us-ascii?Q?kR++ncu0N/J0UHk7P0dIOAkXzxsSbsBA6uFCtTZBGfUqVbtmxdCT6sYHXvRD?=
 =?us-ascii?Q?f+8tMk8LFM0VAECA7Y4RPPA9UUmk4x191QuoYy6aLc6VrjJHeERE2ovKMekJ?=
 =?us-ascii?Q?slOVMSz88NNN7PydhqFEQF601RdWLRWIIaHQ/Hj+9kpTkhcQtks+c4kosmAp?=
 =?us-ascii?Q?8amLYbsxFqOr6zeWm+9Zdg568avMqliUJlhrGnhOQ1/Fata9h/diswnJ0tBA?=
 =?us-ascii?Q?UVbCiFMGRmUKreKHPwJpy3SEHvQBx4Rk8EXCGZ4+xdp4HckLPdoxy/d/6Tq3?=
 =?us-ascii?Q?N/CmaHj9f4iQzm0GU6KxeJl+Z4yNG/A3s6kLjIgJQSOQ8xoHvu4Eyhv/Q6FH?=
 =?us-ascii?Q?jIb5EMUa1K2ctddNm5fo5g0j/rgQyNrzYT1da92t4dJz2eu2qnv+D+BmzoeD?=
 =?us-ascii?Q?X++4wScG3E3UbX2HgX6X46zZgQ0iaipfkxu8axQEZjtNTcX8AzDouTvP4hhC?=
 =?us-ascii?Q?XKJy45c41NmvCoPWc62AWeNN0O8HxqbCx3dGWzwy/cwWZFnb/2SuRkciwMku?=
 =?us-ascii?Q?fVNqAJE+7Y1VLw5HcZFXsd2kY81QIgS7bbW+yAwP1zM7xtXxqtXftQgsUiEi?=
 =?us-ascii?Q?WT3yHSrSplYptxKMRTaoZV6Qrc0uAqFGu0yOq1D+xZbXqcDnr0/H0RZf7GTj?=
 =?us-ascii?Q?1O34udo6dpelVTRxIhuaeO7f2YDLMJ2AWLq38q5yFNkgWA5f1NRwvo92luh5?=
 =?us-ascii?Q?ORSgIpIHbtnZ27xO1OPcrZR8f8UoxphDkrjnwTTYpbC6pSPvf0P89BytE4o/?=
 =?us-ascii?Q?0of/9NCaVH5dmPLWilh/EAMxr7MpDrjrLmaoGzFshovRMN0KNagjn2A2g4Kx?=
 =?us-ascii?Q?p0pA6kos7iOxx5D0fIRzYWa7uUzAvAFY1BsIiXe/WCoddrsIin7Zv0u8vodq?=
 =?us-ascii?Q?jCjYHStSpQ+5af8qlcTvT+V6FFsGJU4h8axvUPKx3R1ASfhlB+0OCWGZoNdu?=
 =?us-ascii?Q?duWJGGUWUXAObW404iTDMjBgDXzzXtAxqEwBpAtIEYTJT75g7coLLFawSYjQ?=
 =?us-ascii?Q?ND12jVUd2tlqYsRB4bJrvBepYfDYCHPqBIggszWx97ZlT1jZCcFLvvrg2ddM?=
 =?us-ascii?Q?UJnDasW3NfX1r5ywneXPHA9Y3fcK144T4G8WWTjhm1fuYD10Bzzs042iNZb6?=
 =?us-ascii?Q?riCZ3ZjJSzUA+XuxfOtedcooW93euESa9y0dPnRZyjjd4rU4rZuIxBQrqOLu?=
 =?us-ascii?Q?u5458q3aa0AuYHgofi3yHvDrRGoX+QoR+EhElj9v35ex7YGz3f+DYa0ZD4Ts?=
 =?us-ascii?Q?kXgARQoT8CX8A1vVz/rO/GnCX/r7IBsPjQMmCsAYOYcaFlJtP+h3FKxc+Ysj?=
 =?us-ascii?Q?x7lFzJeP8a2ueQg0lVRlLJ8MIKHluA6028faWLYGScjPphZsUWsAzu/FvBLl?=
 =?us-ascii?Q?wYl4oSyEuI3/e7MemoaSCqSEf8qAiPgKOM7h9OPFu/OfpPeXWi9ImBBV6f2y?=
 =?us-ascii?Q?61ea1z5u6DXSUrOZpKPGTFtjKer7KaWV9xMvM3Q2LmbePMAi81kEGw/ilbzv?=
 =?us-ascii?Q?J0qnE2ReA4MK7DRItmFb1Uc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c419f6b-9522-4300-4777-08dd2e14276a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 05:37:05.1631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /g8EhF2sq4x7oo2gKC6GI6NgGjtMup6Ow0yBiHKdu9U/ukO0ndsqSKgOIQIAc47hIDfNTLWHEeNIteVqljmKDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262


> From: Srujana Challa <schalla@marvell.com>
> Sent: Monday, December 16, 2024 4:19 PM
> Subject: [PATCH RFC 3/4] virtio-net: updates to virtio_net_hdr for IPsec
> support
>
"updates to virtio_net_hdr" .. does not read correct.
Please fix subject to "extend virtio_net_hdr for IPsec support".
=20
> Introduces new fields(8 bytes) to the the virtio_net_hdr structure, enabl=
ing
> IPsec processing.
Remove the extra 'the'.

May be just write it as,=20
Add IPsec resource object identifiers to the virtio_net_hdr for identifying=
 encryption/decryption operations on tx and rx side respectively, along wit=
h flags.

>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/net/description.tex | 38 +++++++++++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 3 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index ace2538..5ebb28a 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -453,6 +453,7 @@ \subsection{Device Operation}\label{sec:Device
> Types / Network Device / Device O
>  #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
>  #define VIRTIO_NET_HDR_F_DATA_VALID    2
>  #define VIRTIO_NET_HDR_F_RSC_INFO      4
> +#define VIRTIO_NET_HDR_F_SECURITY      8
>          u8 flags;
>  #define VIRTIO_NET_HDR_GSO_NONE        0
>  #define VIRTIO_NET_HDR_GSO_TCPV4       1
> @@ -469,6 +470,10 @@ \subsection{Device Operation}\label{sec:Device
> Types / Network Device / Device O
>          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT
> negotiated)
> +        struct security_hdr {
Lets name it as ipsec_resource_hdr.=20
Please add comment slightly better than hash report, for example as,

/* Present only if VIRTIO_NET_F_IPSEC_XX negotiated */

> +                le32 resource_id;
> +                le16 resource_type;
> +        };
>  };
>  \end{lstlisting}
>=20
The sad part of this feature is, driver will negotiate this feature very ea=
rly, and increase the vnet hdr size by 8B, and may never use ipsec at all.
I feel its worth to negotiate AQ early before DRIVER_OK.
Need to revise that patch, though functionally it is not must. It just non =
elegant limitation we tend to live with, and we can improve.

> @@ -492,6 +497,8 @@ \subsubsection{Legacy Interface: Device
> Operation}\label{sec:Device Types / Netw  Historically, some devices put =
 the
> total descriptor length there, even though no data was  actually written.
> +
> +\field{resource_id} and \field{resource_type} are valid only when IPsec =
is
> enabled.
>  \end{note}
>=20
>  \subsubsection{Packet Transmission}\label{sec:Device Types / Network
> Device / Device Operation / Packet Transmission} @@ -653,6 +660,15 @@
> \subsubsection{Packet Transmission}\label{sec:Device Types / Network
> Device / De  The driver MUST NOT set the VIRTIO_NET_HDR_F_DATA_VALID
> and  VIRTIO_NET_HDR_F_RSC_INFO bits in \field{flags}.
>=20
> +If the device supports \hyperref[par:Device Types / Network Device /
> +Device Operation / IPsec Operation]{IPsec Operation}, the driver may set
> VIRTIO_NET_HDR_F_SECURITY bit in \field{flags}, if so:
> +\begin{enumerate}
> +\item the driver MUST create IPsec Outbound resource object
> +\hyperref[par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-ENC-
> SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_
> +OUTB_SA} \item the driver MUST set \field{resource_id} to a valid IPsec
> +outbound
> +      resource object ID.
> +\end{enumerate}
> +
We also need to add some text, around a small race condition that a SA obje=
ct may be destroyed, while a receive packet may still have the resource inf=
light.
And driver should handle it. This text description to go in the introductio=
n/theory of operation section somewhere.

>  \devicenormative{\paragraph}{Packet Transmission}{Device Types / Network
> Device / Device Operation / Packet Transmission}  The device MUST ignore
> \field{flag} bits that it does not recognize.
>=20
> @@ -684,6 +700,10 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De
>=20
>  If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT  rely
> on the packet checksum being correct.
> +
> +If VIRTIO_NET_HDR_F_SECURITY bit in \field{flags} is not set, the
> +device MUST NOT use the \field{resource_id} and \field{resource_type}.
> +
>  \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Netwo=
rk
> Device / Device Operation / Packet Transmission / Packet Transmission
> Interrupt}
>=20
>  Often a driver will suppress transmission virtqueue interrupts @@ -728,7
> +748,7 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device
> Types / Network Devi
>    \end{itemize}
>  \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at
> least size of \field{struct virtio_net_hdr}, -i.e. 20 bytes if
> VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
> +i.e. 28 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 20 bytes if
> not.
>  \end{itemize}
>=20
I requested in other rx timestamp patch to have this fix independent of thi=
s patch.
Lets have the fix there as pre-patch.

>  \begin{note}
> @@ -736,8 +756,8 @@ \subsubsection{Setting Up Receive
> Buffers}\label{sec:Device Types / Network Devi  \end{note}
>=20
>  When calculating the size of \field{struct virtio_net_hdr}, the driver -=
MUST
> consider all the fields inclusive up to \field{padding_reserved}, -i.e. 2=
0 bytes if
> VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
> +MUST consider all the fields inclusive up to \field{security_hdr}, i.e.
> +28 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 20 bytes if not.
>=20
>  If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN  tha=
t
> will be used SHOULD be populated with receive buffers.
> @@ -906,6 +926,14 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network  checksum (in case of multiple
> encapsulated protocols, one level  of checksums is validated).
>=20
> +The device SHOULD set the VIRTIO_NET_HDR_F_SECURITY bit in the
> +\field{flags} if the packet is gone through the IPsec processing.
> +Otherwise, it should be cleared.
> +
I think, it should be MUST. Otherwise, the device may do the decryption, an=
d yet not tell to driver if its "SHOULD", and driver may have to detect it =
by parsing.

> +The device SHOULD set the VIRTIO_NET_HDR_F_DATA_VALID bit in the
> +\field{flags} for IPsec packets only upon successful completion of IPsec
> processing.
> +Otherwise, it should be cleared.
> +
I am not comfortable to overload the DATA_VALID bit to indicate ipsec decry=
ption error.
It already had some past fixes in area of checksum validation.
Overloading may lead to more confusion/error.
Can we keep the ipsec_error as some other flag bit?

>  \drivernormative{\paragraph}{Processing of Incoming  Packets}{Device Typ=
es
> / Network Device / Device Operation /  Processing of Incoming Packets} @@=
 -
> 928,6 +956,10 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network  VIRTIO_NET_HDR_F_DATA_VALID
> is set, the driver MUST NOT  rely on the packet checksum being correct.
>=20
> +If VIRTIO_NET_HDR_F_SECURITY bit is set in the \field{flags}, the
> +driver SHOULD treat the packet as an error packet if the
> +VIRTIO_NET_HDR_F_DATA_VALID bit is not set in the \field{flags}.
> +
>  \paragraph{Hash calculation for incoming packets}  \label{sec:Device Typ=
es /
> Network Device / Device Operation / Processing of Incoming Packets / Hash
> calculation for incoming packets}
>=20
> --
> 2.25.1

