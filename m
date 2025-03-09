Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FA442A93
	for <virtio-comment@lists.linux.dev>; Sun,  9 Mar 2025 16:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741537954; cv=fail; b=bEDkmTT76f+S9JYrR2YexAc4iEtN1mgD913/jbVdKZ4hxmpPfCUKNf2Ma6CD8JkDXBPhqGDcjZ1SBRLhhU0AEPOeh2YqbcMZ1xFW46Jg+fAc2Av1Kt7ECOXh0LWbbcTZ3yd5bPcILFtj6sJm/KmmFp89a009uJGkZEA8bHQISdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741537954; c=relaxed/simple;
	bh=+e69Gih+5LIMTIYZQ8FHYxtQR0Zh+hTPVL6WghnxSHg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bfbc2CVMp7V8JtCaXORkX9+D2E8KAllKQe5TLYhJhYeSXluckTEHkp7k1KV0jBFFtpdjezJ8AkiKwBqvY6OUmidVvnDz807JXnQiOq31N6BUrD0PTWrz1BXm2E/PQY6Bsv7KE9Vbk0yymXvehuf5J+i+okdx5VLwkJsio8vmkX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aQG0KB4i; arc=fail smtp.client-ip=40.107.94.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aQG0KB4i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DiCBuPwxtAPd9ArqfYAG3j5WcGDkrUFmwLfKJdrmLR+LWv3Hi5gfrlPbULEe6enWU4ybTRUe4U+rZb43tHlzqx9L5saYiDO8Y/4ep/vWebmmFQ9hskxWWZ7M7NHk+idn3x/N0aOb0feIQR0CaoaHXFYUBfo9IQ14jliaNmRg6/6H3ZTwpCmxHu3VfAXUTaH2nJ8SdHdqe8g/4k6dovRuyN86dusOmo69/hew85+k8zqG6kUGe9MqbqPJYw9vEC0gbTBzh/dU+4jUKIJjzfqSJSnDF1YkkCnqLHHPT4aHabYwopgI4J9tU11Q5AB5siGGvSJvqvWwEUUMsD5ucigK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXWzD64Qz9N2yZCLY9I6h1wr64zSP3PX67klamzIRXA=;
 b=oAlZ9fbdE7iqS0Q9y/Yg5f3DYYZH4jhPewtp3PsCSQo3wb7e53Q/MNEC2kd7JSL5hJws9ixyKw/vNWooCfMrx/adqvmK1DeHSeYvdr2VtpjvI3hEbiOrCcGZOcKQQah3LCmwtpIt6DgbICkNSx/749uzUnCjhm3oRJko9wLx7wGm1loTGcmEJyaIX7wPxbm/bqyv59+ty3DpKPI+mPyrXgJY64uvLK0fr8idlmlgapq6jWH6iORi7RxODNfd46RvCWoYgGpA82UxdlfzoI1zl96tJYbHwlA0IPYKlgegxKiTUa5u8dp0fv54Xymwo/6PAbSzUPt1lL0LqOftVZ3GiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXWzD64Qz9N2yZCLY9I6h1wr64zSP3PX67klamzIRXA=;
 b=aQG0KB4ijFDmBx41O4+bUMWRhM5GvvSuwsSSE2KlMd+BPpV+qtcarv/YNnatRdkrEfDc2xzVRlZyLJDhM/x1eC44aB9hJF95HasbIAQZF1+8ycmUtRBs+2X6syb2QOg8QBk2UdRvII+LE2VwSE+c3gpeTG4xxpsW4eC0cMLPSWpfzq4WQfaMYTLhz3jOeBSy+i8OWkq+Rd+rJ2vF7J2WtqpXISlnF0vRsfNbD0C3/s/LaehqPpFAcDFYKR5yCa4IUSBF7M5PP5+9CXFomjB656ImOd5o3zwagI0rCPkkOBt9BjmKs64RuFsvpdqm46oFCeMX93IteyuUdSQEv1LPuw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MN0PR12MB6272.namprd12.prod.outlook.com (2603:10b6:208:3c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Sun, 9 Mar
 2025 16:32:26 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8511.025; Sun, 9 Mar 2025
 16:32:26 +0000
From: Parav Pandit <parav@nvidia.com>
To: Kommula Shiva Shankar <kshankar@marvell.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "willemb@google.com" <willemb@google.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>, "jerinj@marvell.com"
	<jerinj@marvell.com>, "rbhansali@marvell.com" <rbhansali@marvell.com>
Subject: RE: [PATCH v4] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Topic: [PATCH v4] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Index: AQHbjNt1ehQ54dJFck6NvS8sSx+I7LNrBuwA
Date: Sun, 9 Mar 2025 16:32:26 +0000
Message-ID:
 <CY8PR12MB719599491B05CAFF67EAC19DDCD72@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250304075955.208450-1-kshankar@marvell.com>
In-Reply-To: <20250304075955.208450-1-kshankar@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MN0PR12MB6272:EE_
x-ms-office365-filtering-correlation-id: 38407515-e372-436b-8c70-08dd5f27fa59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?umKsICSNqzOYg9EU4co5aofzNtCdCXzitiILmy1Wh4EFuF+cgZe4pKHdhWxL?=
 =?us-ascii?Q?W2eQj1n5J6Dh1Q55SxkzmuytaE5mQJx7+bmPoCONDcSBDpydLZ8RLfjLOAUg?=
 =?us-ascii?Q?o37lYbD54VvuMi4WchOfi3C/I2xpyTAtBFXtT5Tm5GM17Hdxp7gjhiPCZtPb?=
 =?us-ascii?Q?k8i2/CT6qd68mNSQzKgfXVCux7cAEtOTmYXKQJ1jgaxJEb/LxM9YWvymPlH6?=
 =?us-ascii?Q?2AxLZtvnVy1zrKd+fT3UKcCM+Ch+4Gu7k3l7jxcRN23ohcObHz9exw18xZN8?=
 =?us-ascii?Q?AlSnuBx8mMy12HqxAcTp3XuN2R0yRULxQJcE2pqoPWS1Qo5O9pAoebAao4i3?=
 =?us-ascii?Q?H09xJ1T3xxf0at9eBXq2mL9dXwEA8XLgSAWBep4L6X3yisDd1+lE0vCwUe21?=
 =?us-ascii?Q?r/6HaLocLRKS8co6VbNQ6ERzKFVx/ZYnVBErwfln90q+v/ZDudHb/cnZIgZi?=
 =?us-ascii?Q?pgdmm0ChJxWoZH8ijMPGPln5XAMY2mHAC6fZRwLIHIAxvPvc8mNg7KpZwu8k?=
 =?us-ascii?Q?2vKVThLTzV6v6vLtkt/exJayWv5Rl61SP98QhGs0unbip6YT+EfuxkrWul1r?=
 =?us-ascii?Q?WgpckEZ0oCZ+Wf7yf7V2gjcnSMhLFnVsw7kJZaF+FDYiuYd2N+M4MsHD2IUm?=
 =?us-ascii?Q?IjbgrFjawrtuz5xDtUvH4ntS4bAO56Q7NYruZ6hFFsWgJnYAr4np3/zmm2bp?=
 =?us-ascii?Q?BK0RamlcBDBzRVpS1EHbJGP6SOJxSw8x05hEvj2YVgxoyYdjdMXIqkTNlZrF?=
 =?us-ascii?Q?qjaQLbX70rZPxgEbYkuByiZMSNfLN0GoehqBVsta9PR2AoWhfi2fqehajgbT?=
 =?us-ascii?Q?o1Pi6XQkEo+l4Oy2No0aJ7yYLhW3ljRe0BSVFG1sVedA/DnrKb4oakOub9Gw?=
 =?us-ascii?Q?Ttd+1+3j0U2BvIQUxv8czvrTSzTizbt3A4fQzmWVYWn1mYZliuJdR8ZqnkUb?=
 =?us-ascii?Q?HOl3m8O2GCZFFtaY5OWh0VkJsG+NUgurHGvWtz74NI38GcCaA7NKjW9asf8B?=
 =?us-ascii?Q?S+lDLrfiSQZZtu1KWFfadpRQymdLM2QDV8klaLEbxSgVw5OAJ8XZIg/OpFB2?=
 =?us-ascii?Q?GEHpzxYpB5vYp7XKOr5eyMAFcvjRCd1sgY1YbWgNn2TLpivOya9Qzak1dL5W?=
 =?us-ascii?Q?+WnUkLf7q/9/JRLPJx0Bi7vYm9n95vJKA3JX8qyLlyylspvNN2bjI1sCTNue?=
 =?us-ascii?Q?y+UugMXyuRz2KpdELlv+ANWoiqCgwwyn/3kcuXBLCJsXMYnvB3VhF8ZP0lwm?=
 =?us-ascii?Q?tDiLwam3wADpl/+KzPHirtDASZD/1hxb7QoAd1QzJwBgiQQ5DrLqdCdNfsm1?=
 =?us-ascii?Q?gD5Qsiwz0S/O/I+N/Jt+k0Syv0kOunw93G+oreg8BB3EewuKJLYANCWt1z3L?=
 =?us-ascii?Q?MSJnJZs+fSL3UzuP0GwIRVWLbmJltsGN1x540FS/uc8mKjrTyGUAeQU59sif?=
 =?us-ascii?Q?yvuVFdTdL1AshtV1ytOoydh2JoaN+MU7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?553+MMmo5LktMo1EqYkEIlcuQwe3eA+B3cZssufFLL0S5MZhAPKcfsAHjMJ1?=
 =?us-ascii?Q?iScPqy1ZbN2LLWLnl0nUUH8ESAUlw5YRZpijPAqnCzAml0J3+NJq6visDt4A?=
 =?us-ascii?Q?Yu3AcQuu2H+AHD6NZianAgNI1KTF7uxfq573Fu4J693xH5vZxpUpo4y9UWZb?=
 =?us-ascii?Q?xFwVWFRYVrgid7MBfEvuJr88e88MrGJaDUPWDvjo4zAK25Sm6HN4+uX/aGoO?=
 =?us-ascii?Q?Np0JFOjaE0GH44j1WzuznMfSE+ZntbvCCH+BX+Gm0XsPVRy0vG2rVRAhj++I?=
 =?us-ascii?Q?Og5OFZfvI6KNqoZZRxVjf1vLxF+PPdSfcqGZP6yJx7LmhKxAqHqW5U9ocBmW?=
 =?us-ascii?Q?kQuzjsQ0gYnQFlVSFpBVs7hVVU9bG8V4vvHOBT52G6YMRX+VPj4BRdZt0ChA?=
 =?us-ascii?Q?c5+bwIWirDlmk+qYMTFqMTg+8YEl0rFoWo5xegfwyWEUpo9GU2dWqc1mdTWa?=
 =?us-ascii?Q?dvsdIjX0t5jlKtoymXITqun60xk0SOyDczKMUfOTTMZ3YcpOJfRWrJ8RLHFX?=
 =?us-ascii?Q?jicW0Fm+rGeRLpGgiwJiqysu0lCbK0I1LRXYd9N5miqy8ly+B1LyeifErajg?=
 =?us-ascii?Q?RDg7X35EL0NduttM083sjVj2LLB0DHfRAss1ZSyOVZCyBFy8D6/k4P9B0cyd?=
 =?us-ascii?Q?ahYAxjiqNWVDEyWXzw6RXFKsopQp+6QpOjyg0lwKvf01O8JeS8AxFn1LdSTk?=
 =?us-ascii?Q?8tv5BMCmErJLUJBMQy5XxeF8p4tVVDT1HJV/UbOHa8cwOmOETDwKucWpAeG6?=
 =?us-ascii?Q?jREMMwRtoFtPXNW+/kpEIRt/u+qo8E6jED+Kjtm5RbeYt3jDTkg/9BYQF52y?=
 =?us-ascii?Q?BbMMm1zaRXX5qU0szoXTPFiAYsJkoPObplVLmfOupZ9TACbaOC448eC+usMV?=
 =?us-ascii?Q?2T4C322/S5Rw9CKiUFq9iJuS3UGg6iB45/3A/YZ6jpixn60DucFXXQddwZpy?=
 =?us-ascii?Q?KMZ4LcR2iQDwvYJ+UzH53+CQuCDJAY8MGaGRNKKJKLdJkPUPVsNvE6n653sg?=
 =?us-ascii?Q?5940C5DZRoM/Fin00nAeHBU0+QI7ltn8XZph5/1XwjnKWN/fMejmRSxtfJ94?=
 =?us-ascii?Q?BN5sSVvuoS5LUDGiJwlQjCIbQg0+Jfyw5NxmWTvyvHJmrs2ETxNwOMjsxggB?=
 =?us-ascii?Q?JG+dIbLoG4WVjyhuBMDyOjOPun1qzwBNy0+vbtJEK4XYfo7j8C7oRZQRijTg?=
 =?us-ascii?Q?UToHuL9n6RAAfB2H9yJ3h0dRc1K7RNAaWCDZbP3OBYtCjpfzeKA0os4vJI/5?=
 =?us-ascii?Q?49+CPDfiGrl/OJ7rlimE3BekmS/ZidmMyeH79wmdecJn4EcU1gR6nyW3AhLz?=
 =?us-ascii?Q?iOClxmBk1GUjNwhPHKRpP85w3zuJ+hFC5BX0QqRHaPfXR44ExwwMNpu6ajFC?=
 =?us-ascii?Q?YAVztQv+OVudFSAdk+EAN+Xzu2Y6zw61NOHFUEP3gDUy77M5BcgguA9jKYGu?=
 =?us-ascii?Q?5IyXwCAtTrNb2eiJBNnbtxSkgQWvJk/HpJxfpxaWIhCMDVukyraqy3XhIt7X?=
 =?us-ascii?Q?N4HMFVgFlLeCzKzZBH5AMyN6ISCAFVkGyS8yq19Tg09w0xd9/h1MqMfm/BLF?=
 =?us-ascii?Q?ZKwtvCxfnl67G2KQylU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 38407515-e372-436b-8c70-08dd5f27fa59
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2025 16:32:26.4738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r2R+CdfpC1lkUbKanpPM4KZSUGywS5j3WWqy4eUJ0C4k/u5CjLfMexpTuB8rUAZ3kZ6yD8uHaG6KILPWNa3j4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6272


> From: Kommula Shiva Shankar <kshankar@marvell.com>
> Sent: Tuesday, March 4, 2025 1:30 PM
>=20
> This patch introduces a new field in the virtio_net_header called
s/virtio_net_header/virtio_net_hdr

> outer_nh_offset, along with a new net device feature,
> VIRTIO_NET_F_OUT_NET_HEADER.
>=20
> Currently, drivers lack a dedicated field to signal the start of the netw=
ork
> header to the device when performing checksum offload and segmentation
> offload. This requires reading packet, which significantly affects perfor=
mance
> in data path.
s/This requires reading packet/This requires the device to read the packet =
in data  path ..

> Additionally, some hardware implementations require knowledge of the oute=
r
> L3 offset (aka L2 length) for inline IPsec hardware acceleration.
>=20
> To address this limitation, we propose to introduce a new field in the
> virtio_net_header called outer_nh_offset
s/virtio_net_header/virtio_net_hdr

>=20
> The outer_nh_offset represents the start byte offset of the outer network
> header from the beginning of the packet
Add full stop at the end of the sentence.

>=20
[..]
>=20
> Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
> ---
>  device-types/net/description.tex | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 8d30673..ca1242f 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -136,6 +136,10 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits
>=20
>  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles
> packets
>    carried by a UDP tunnel with partial csum for the outer header.
> +
> +\item[VIRTIO_NET_F_OUT_NET_HEADER(69)] Driver can provide the start of
> +\field{outer_nh_offset}  value. Device gains advantage by not reading
> +packet to calculate outer network  header offset
Please add the full stop at the end of above sentence.

>  \end{description}
>=20
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Networ=
k
> Device / Feature bits / Feature bit requirements} @@ -599,6 +603,7 @@
> \subsection{Device Operation}\label{sec:Device Types / Network Device /
> Device O
>          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT
> negotiated)
>          le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O
> or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
>          le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O
> or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> +        le16 outer_nh_offset;   /* Only if VIRTIO_NET_F_OUT_NET_HEADER
> negotiated */
>  };
>  \end{lstlisting}
>=20
> @@ -633,6 +638,11 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  \item The dri=
ver
> can send a completely checksummed packet.  In this case,
>    \field{flags} will be zero, and \field{gso_type} will be
> VIRTIO_NET_HDR_GSO_NONE.
>=20
> +\item When VIRTIO_NET_F_OUT_NET_HEADER is negotiated, the driver MAY
> optionally provide
> +   the \field{outer_nh_offset} value. A nonzero value of
> \field{outer_nh_offset} indicates
> +   a valid outer network header with in the packet, and specifies the of=
fset in
> bytes from
> +   the beginning of the packet. Otherwise \field{outer_nh_offset} MUST n=
ot
> be used.
> +
>  \item If the driver negotiated VIRTIO_NET_F_CSUM, it can skip
>    checksumming the packet:
>    \begin{itemize}
> @@ -767,6 +777,11 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  \field{flags}=
 to
> zero and SHOULD supply a fully checksummed  packet to the device.
>=20
> +If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated, the
> +driver MAY set \field{outer_nh_offset} to indicate the start of the
> +outer network header offset, if the packet contains a valid network head=
er.
> +Otherwise, \field{outer_nh_offset} is not used.
> +
s/MAY be set to/MAY be set to non zero value/

Here and few more places below.

>  If VIRTIO_NET_F_HOST_TSO4 is negotiated, the driver MAY set
> \field{gso_type} to VIRTIO_NET_HDR_GSO_TCPV4 to request TCPv4
> segmentation, otherwise the driver MUST NOT set @@ -948,6 +963,11 @@
> \subsubsection{Packet Transmission}\label{sec:Device Types / Network Devi=
ce
> / De  If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set, the
> device MUST NOT use the \field{csum_start} and \field{csum_offset}.
>=20
> +If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated, and
> +\field{outer_nh_offset} is not zero, the device MAY use
> +\field{outer_nh_offset} as the outer network header offset. Otherwise,
> +device MUST NOT use the \field{outer_nh_offset}.
> +
>  If one of the VIRTIO_NET_F_HOST_TSO4, TSO6, USO or UFO options have
> been negotiated:
>  \begin{itemize}
> @@ -1102,6 +1122,9 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network
>    both the outer UDP checksum and the inner transport checksum
>    have been validated, otherwise only one level of checksums (the outer =
one
>    in case of tunnels) has been validated.
> +\item If the VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, and if
> +the packet
> +  contains a valid network header, \field{outer_nh_offset} MAY be set
> +to indicate the
> +  outer network header offset in packet.
>  \end{enumerate}
>=20
>  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
> @@ -1215,6 +1238,10 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network  device MUST set the
> VIRTIO_NET_HDR_GSO_ECN bit in  \field{gso_type}.
>=20
> +If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY
> set
> +the \field{outer_nh_offset} to indicate outer network header offset, if
> +packet contains a valid network header. Otherwise, the device MUST not u=
se
> \field{outer_nh_offset}.
> +
>  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the  device
> MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in  \field{flags}, if so:
> @@ -1302,6 +1329,10 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network
>=20
>  The driver MUST ignore \field{flag} bits that it does not recognize.
>=20
> +If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, and if
> +\field{outer_nh_offset} is nonzero, the driver MAY use
> +\field{outer_nh_offset} as outer network header offset. Otherwise, the
> driver MUST not use the \field{outer_nh_offset}.
> +
>  If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set or  if
> VIRTIO_NET_HDR_F_RSC_INFO bit \field{flags} is set, the  driver MUST NOT
> use the \field{csum_start} and \field{csum_offset}.
> --
> 2.43.0

Can you please also describe the description and requirements for the virti=
o_net_hdr size to indicate that when this feature is negotiated, the vnet h=
dr size is all the way upto this field.
i.e. when HASH_REPORT is not negotiated and NET_HEADER is negotiated, this =
field does not move up etc.

Please also add 6 bytes of reserved to have the vnet hdr aligned to 64-bit =
address.
