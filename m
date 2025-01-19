Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDFD1885A1
	for <virtio-comment@lists.linux.dev>; Sun, 19 Jan 2025 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737279489; cv=fail; b=XTsEWt5B2MoloizsNLHvsDtWnEExvh+JglfS9QSi+W7a2tLobzy5UFrNzMY5a0S9ee6fA44dhftWWLPswriOA6A7HB0qH485QWBmjnoVqNP9p46hrpmWEHbGbXqLMgE2H6qI60+szBxaq71kQmMMISf9lVC/lKCxZnLirht3mK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737279489; c=relaxed/simple;
	bh=jU51YaEtViUMcQEycK/yEZ4GBEvI2K9PiSZ1va8Y6hM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FCB0Ps7cp0uif6GPU846ZPjuHzT92XSEqnrBXxIUTIvZlW/dmI2cldCOiClxsr4gzqxr8uv2PrOinZVXOqv3uLXrIwJElDOFax5hJLqebwHcNlplmCDcuZ+W9ciMIkaeuXA7h9dVorVM0G94x3Omf3h6PW1w2Sf1ptzWKESi+bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kGqyL2g6; arc=fail smtp.client-ip=40.107.244.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kGqyL2g6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAQ6pXqoO/FIqnoZ5fOiwDwQVVFlTXZiCZAME2ln/ga+yO6kFSSLZ+7EwU5kgg6XPDE6QnAfDLnxJKd9LtpydifJl00yYREyaxad9XAW/HjaqVAvES/qdpWe4l1jTAc+dd1nRY7fMCA7tYVmUAsM9xInFwwzB0VFHzA2/kHnKvGUukorFkTB28jjDKgMlkRstKvqlyzXfwxXrtK5/V5uSS8PyHC8QyW4BtENuKu2iK8QsGj1IGfKnxSNtmmu320xuX81zn7azLpwipMZyRiAJwThOuOiz/3nEFGxf+7QzAvGa1dQRaZSH5hx3y6/AsdEFFikTcBy+8lVTUw3pdQ4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5L8DeUuP4Bie6m1FPAslOyv5tInheQKDh3JcxJ3F5v8=;
 b=yToETYUJRpOO2h3fSdtV02Voh/DlNsz7JR/OH0HbBMVE+BQG0E9FSUMjeiOO5E6XzH8DysxQ9duKBLYPSISs6089REnidfr7VpWttrovdhqis7O4sqgOSEfBbN6k4udw7Ugyrl6Y1ky4UVrkdl2KKeozE1ysK5GnKpHuH/b0HDNamgXVo+nWc/+6oBX6xdI63N3/HDP2aKhV0MLqO9uUF4glSTpXygaP54/3XUggpH26dIA7EYiGCHcakB+VTHxsxIiPq7ifF3a0rmZxE3HOiG/JPTWRGnkbwUd/lzLOKv3C9XfI5CKwq794XyzJvmJjlQ1KAXpLCBjdzCMOfTYLrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5L8DeUuP4Bie6m1FPAslOyv5tInheQKDh3JcxJ3F5v8=;
 b=kGqyL2g6HfZr6jyR36JN3JsKfJVQffe8HXmJLlSSTj1AJ+THNiklwAQ4/UigEGgUJUW2VyuMv6+R08wO4j9Vmnsb4xxcdbUCoUPdAM1cJ77SNJwfkQ9gbIsU33jlMVnu3/H+gifKt3euXfCxL5pSMXQbgwSJAAIKrQm3W8z670r1b0nCrjRNKsWzeufL4l4/psUEwzaMKm0xkGfqF281mLSHaznoAj5GQ7cCB8Ti1khn7rKiMDBQDTqNsorWagRS+jT9srtCueh21FSBaP9316iswbcViNng9wljQbi2gndSukCEezfDsvt2zuBxRvUmwKI6clEsVHqE2t6k3LgqfQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SA1PR12MB8722.namprd12.prod.outlook.com (2603:10b6:806:373::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Sun, 19 Jan
 2025 09:38:03 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8356.017; Sun, 19 Jan 2025
 09:38:02 +0000
From: Parav Pandit <parav@nvidia.com>
To: Kommula Shiva Shankar <kshankar@marvell.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "willemb@google.com" <willemb@google.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>, "jerinj@marvell.com"
	<jerinj@marvell.com>, "rbhansali@marvell.com" <rbhansali@marvell.com>
Subject: RE: [PATCH] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Topic: [PATCH] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Index: AQHbZqgaFNqj/sEh/0yXSY3fnG9XbLMd3VcA
Date: Sun, 19 Jan 2025 09:38:02 +0000
Message-ID:
 <CY8PR12MB7195D27F3BB0A02F11B48106DCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250114171636.3175670-1-kshankar@marvell.com>
In-Reply-To: <20250114171636.3175670-1-kshankar@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SA1PR12MB8722:EE_
x-ms-office365-filtering-correlation-id: 34601fad-2fd6-445f-a876-08dd386cf81a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5G8Lb3MEyAjyh/9L/Mdh2rO8G+wl8zro+RdNbz4x1Txq/U0jS1fxekEN/kzC?=
 =?us-ascii?Q?veXZt1Syucc4l9QecLewcfO8HaN6ogyjDHhjGaIuWP9oE+pqAvHVgRQFBfgv?=
 =?us-ascii?Q?vJ1NxvWUgZzHer+h5hFxvkomaPuWxRPpL7W/SxTEKjoSxydkkf/3tP/uYQn0?=
 =?us-ascii?Q?XF9M7mP5zSwdONTQ0ybePcQbZGYTvWGayru8BXlk4cMz9GFaaz1INWdzOlGq?=
 =?us-ascii?Q?MdzoSMuMbNOIjKeTeIe8Ba9rc7qSJUBWNLNnLdq7gRrFgeK+BXCyvWJKmyya?=
 =?us-ascii?Q?RXvh5lb2hgw9G/VjdY0SKCk/9A3yQgUZ9ATAW0KFBbwdOB4w/9wqUgWMMUrE?=
 =?us-ascii?Q?x8BR8eQ4vfoXTN6hrr0UaluE4yOOx6r2f89JNWgzRn4OltjcBlNOw/swf7CO?=
 =?us-ascii?Q?Y8NV4QH346bRikprOe3i/apGSXjO6qVSdI9thTQPh4Lnr542qp+0qdW3cIgN?=
 =?us-ascii?Q?ZOsmjeHIHsJsQNPTZ+4f+kb3lv/Qg85xoC1CPzZz9RPwxjaNYXyoUlrSIXvW?=
 =?us-ascii?Q?TfPNouo2pxC3o97W4fdrHxj+cpQxxPg+/p3Up8IXSnjwK84msdPT57aDPJ0f?=
 =?us-ascii?Q?4+x9Ycz4W3UJJcHaJWXGoTvmTTsSPorcMBbIMfAGnrJM20ovuFXQ9lap48Lh?=
 =?us-ascii?Q?TnDgMOkF01npsGWjSGTe33or/o+XCrlFaRlOiDyNAjxb1pGtDS4aqyrUW7QH?=
 =?us-ascii?Q?EJvlY8CUwSx/6z2TvI9qgkc2ZcbAc3J13XTv1pNNgo2RNlxsl7ZCmA7JIUou?=
 =?us-ascii?Q?f6G/bFQ+0LNypc7lIMqgpFoHcPYz2NmRJD9WfnoqnHfqQX3qMtRTUawbi88J?=
 =?us-ascii?Q?n1QENsA5T98F/7txtygfTUTMKSQGavvoakumavQOXjphhtLpE0Bw75h2G2mg?=
 =?us-ascii?Q?RrvbgtDeyn2YNt7XOsepE1XiLfI5mbZupUn3eOLd9UHY0nuGR8iFCh+uAxev?=
 =?us-ascii?Q?zgq0IyyuNqodSInZD3MmmMLKq2nrvFGZDbwSezvWZ2u53oSDDAOa+OTpd9yl?=
 =?us-ascii?Q?60MMOS5yk0e4/B1SPdguTAyuwBOhzTLW6SCQRCQAJac0Fnf1o2yIglqoPZJg?=
 =?us-ascii?Q?RB4OQ672B2zkqlb2endeU4lZQrbzjiPqaI1ea7ErXPO7bP4QCivMC3V3iBEC?=
 =?us-ascii?Q?xeIXpwy+yO7SIwPQhYdAuY/EGl0ukYWTpkwCxIhxKe2NfLTygUDjkQ/BbZ9b?=
 =?us-ascii?Q?jCyWuXR9xuMA1+Wg3WN+J3rnMKhDYp3ZV/8cxLVquHkX6KmRH0oRVJzANMBh?=
 =?us-ascii?Q?VFTDP61Ig2YNVCL4ENlR4OjWcpuHpXNzV8q2/a9tQO2I6BlYnqdR01tYqlLS?=
 =?us-ascii?Q?C1nbGszUhmENuUqz8x9c85r5LMvgsN5URt15YNxY7opvLZDcXZ08Mx8RFewg?=
 =?us-ascii?Q?Ra2G01mfSQoJX5MG3eMa4mD+tIpUJlCNpBtr9BTn3L7qg/+q4s25LoBX1glq?=
 =?us-ascii?Q?tHiSwaBEWJAg2quUrZE7ZYongiPmQVvO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oPpGfrWQ7WRx5ElnKcv4IZK5hsYFEkn7ITeIB4GFEFDx7ETH9qzFBD1q5/5H?=
 =?us-ascii?Q?vWrLOExq5UXpK7B+G94sZ4GTSSFPzBTO5DSdW4DrBWkWZFm+JdVjWHjfJ17s?=
 =?us-ascii?Q?iC/NWz1AxSfVRXjOrVXKHailzFpbCN+SVkH5g4U0/pY2DETSZ2Zztu/0uWN8?=
 =?us-ascii?Q?DN4CFLozQW8zROhPab5N+fsw9nxkD2qK/squytDCaGiPNdY3JEvrYKQSkOGF?=
 =?us-ascii?Q?PIRvW41JWbGJ9gV/C/jrM0Wo14sosHRZyRP6Y8bWjZsz0izkLDuX78INwN+c?=
 =?us-ascii?Q?+eurpSU5/uMUVHHA+gNPSHiCaBnnq9cP4OEwVAEKYp3mLOZlzp4aqYZRlGYr?=
 =?us-ascii?Q?Cj2aAsGVLrZ/r7MHYP9wI1LiKLmagKJmTVNleALRY571EN2cJNIsiDT7x5er?=
 =?us-ascii?Q?2Ak+3JIfFO6jYqHQjRpxG6YBJM3J/HIJoyam/XkG3bsI+aRZoTstnspCJa9f?=
 =?us-ascii?Q?irFk5VbVdLsgPY/ZqhcUnvmB9XuHdQn5fobifwCh8MFLU39GuMINogtkXO/v?=
 =?us-ascii?Q?nmRq/pC/7yz3q343c5quslbZMnXOX4q8sbOl+6DZV4G/mT7jKlcQw7o3PiDZ?=
 =?us-ascii?Q?BTrtbdoA97Ta7JqJ5EgAhUTtyEsTSLAePA6PO2jw1Qj/qG7TB+2nxydi+KAl?=
 =?us-ascii?Q?HyZrHUdAIPrdDpBbmK9bV3lPo89fu7S7GJ2S1MwNydKXiNC2YDWnbNYWm0PB?=
 =?us-ascii?Q?z/H0yIZ9/qo/m4/pTDt1im3w3eyXKGjd+kAhgkPpDfAOPDse7B1RWt2nhPhS?=
 =?us-ascii?Q?yFAQGt6+qwN3KDe3ik/hH0IjLWL6MYXdXF1jEjtQ8Al2u3KimVukeoS8Fk7h?=
 =?us-ascii?Q?CZvLjTpoRxoGT1PZLplx1gsdLyy99zlDPDeebgA/Zn5s+nVouHKEZi2GlrcB?=
 =?us-ascii?Q?7bgRiZfxJbAao0/tlJdpjWbeOUHkOkXxWzGEH5PvoRUfcaRVyiaNbcTVJvb7?=
 =?us-ascii?Q?ul/r0R9KTKdLV0WhcUN0Ibr0CIB96YUExQHE8STW5QrdnYNf+Uyf0ADx84UJ?=
 =?us-ascii?Q?KtnenbVf2g4OOUOYX67yfuM6nmerw3wscQf6mnj/68NwEeWi+C2Qk6ahWUGJ?=
 =?us-ascii?Q?a+RZoyiLXkkPeQVs7AyJqEWMciOYJfEBzwF8MXahljW4I9p27yvZjeDn3Sm1?=
 =?us-ascii?Q?c26+Ofcky9+jO1Q4eXLNqamWSLpf+DR9+SUR28LXeSYnMyD9T3a3hHiOWyvz?=
 =?us-ascii?Q?RiuObfvCuYQ/V1fbw+j0Yy/NQlzaiLyAf19VRa9eAzFnvGV3ye3fpEdHVuBS?=
 =?us-ascii?Q?FBl9HI6nn3/ydY2ruhlqBcmruJnQLkoC6JtD37c6qx2VuhqYdVZQ3/v4TtKH?=
 =?us-ascii?Q?ULiJKvcbDPB5PKKB6cbxphGwC9VpNXwMX2D4cwZX2/3wOO3Q64IkYZso8GPI?=
 =?us-ascii?Q?++VyF9oExsqy1CU3PvWT7LiKNe/1aC3fJbU1TyoIdK5ERyYJfu22qNT0ZHpo?=
 =?us-ascii?Q?UBixV/vcTU2EQ2r1Mshbv2OcPZe9Em1DoZjyzzVe+Bg9iZMO4Lsfb8vsAHOY?=
 =?us-ascii?Q?IC9P3xZTND8IByGY4C3sbmcKVJOXO4O35vfuMUXuXyQ6Yr2asQqZRah/OyIQ?=
 =?us-ascii?Q?kKF9VGBOoQO4BHuz0OE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 34601fad-2fd6-445f-a876-08dd386cf81a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2025 09:38:02.6447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hyn6G1RQ4RXs5650wtdZzWY1WbhHFu5isxYKGcjS2KDLMKMt/y0jwm9Ibp5iYuxx7O2CLDDaHm76WBQCjf/b1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8722


> From: Kommula Shiva Shankar <kshankar@marvell.com>
> Sent: Tuesday, January 14, 2025 10:47 PM
>=20
> Hi Everyone,
> It has been some time since this patch was sent. I am resending it for yo=
ur
> review and look forward to your feedback.
>=20
> This patch introduces a new field in the virtio_net_header called
> out_nh_offset, along with a new net device feature,
> VIRTIO_NET_F_OUT_NET_HEADER.
>=20

> Currently, there is no field available to directly read the outer network=
 header
> offset in case of segmentation offload.
> This requires reading packet data, which significantly affects performanc=
e in
> datapath.
> Additionally, some hardware implementations requrie knowledege of the
> outer L3 offset (aka L2 length) for inline IPSec hardware acceleration.
>=20
> To address this limitation, we propose splitting the csum_offset field in=
to two
> 8-bit fields named csum_offset and out_nh_offset.
> The csum_offset indicates the offset value from the csum_start and  may n=
ot
> exceed 256B bits(2^8) for protocols that use a 16-bit one's complement
> checksum
>=20
> Following table lists such protocols and their checksum offset fields wit=
hin
> their headers
>=20
> +-----+--------+
> |Proto|csum_off|
> +-----+--------+
> | IPV4| 10B    |
> | ICMP| 2B     |
> | IGMP| 2B     |
> |  TCP| 16B    |
> |  UDP| 6B     |
> +-----+--------+
>=20
> The out_nh_offset represents the start offset of the outer network header
> from the beginning of the packet data
>=20
> This issue was briefly discussed on the mailing list in a different threa=
d, which
> can be found here
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.
> kernel.org%2Fall%2FDM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2%40
> DM4PR18MB4269.namprd18.prod.outlook.com%2F&data=3D05%7C02%7Cpa
> rav%40nvidia.com%7Ce81096db39a14378627708dd34bf3909%7C43083d
> 15727340c1b7db39efd9ccc17a%7C0%7C0%7C638724718122375976%7C
> Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMD
> AwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7
> C%7C&sdata=3DTHSOD9fclucwxtnizGLo8pIpjsTs1YoRww4VA%2FvDwgI%3D&re
> served=3D0
>=20
> Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
> ---
>  device-types/net/description.tex | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 76585b0..48c081b 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,6 +88,10 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> Set MAC address through control
>      channel.
>=20
> +\item[VIRTIO_NET_F_OUT_NET_HEADER(50)] Driver can provide the start of
> \field{out_nh_offset}
> +    value. Device gains advantage by not reading packet data to calculat=
e outer
> network
> +    header offset.
> +
>  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash
> for encapsulated packets.
>=20
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue
> notification coalescing.
> @@ -418,7 +422,13 @@ \subsection{Device Operation}\label{sec:Device
> Types / Network Device / Device O
>          le16 hdr_len;
>          le16 gso_size;
>          le16 csum_start;
> -        le16 csum_offset;
> +        union {
> +                le16 csum_offset;
> +                struct { (Only if VIRTIO_NET_F_OUT_NET_HEADER negotiated=
)
> +                        le8 csum_offset;
> +                        le8 out_nh_offset;
> +                };
> +        };
>          le16 num_buffers;
>          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
> @@ -457,6 +467,10 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  \item The dri=
ver
> can send a completely checksummed packet.  In this case,
>    \field{flags} will be zero, and \field{gso_type} will be
> VIRTIO_NET_HDR_GSO_NONE.
>=20
> +\item If the driver negotiated VIRTIO_NET_F_OUT_NET_HEADER,
> +   \field{out_nh_offset} indicates the outer network header offset in by=
tes
> +    from the beginning of the packet.
> +

This field is mostly useful to device when there is GSO or checksum offload=
.
So this should be set optionally by the driver.
When feature is negotiated, it means that csum_offset is 8 bits in width.
A nw header offset may/may not be present.
When offset =3D 0, its not present (because 0 is impossible value for nw he=
ader).
When its non zero, it is valid value that device should use.

Can you please update the proposal to cover these aspects?

Also, this may find its use even on the rx side too, so that sw does not ne=
ed to parse it packet.
So describe the text for it similarly.
