Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B0E26561C
	for <virtio-comment@lists.linux.dev>; Tue, 11 Feb 2025 19:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739303761; cv=fail; b=jfL6i1v70+WdBQ/4y9jogHxo4DQ/7pK+Nl5+bRlz6D4pRnI9Rf/+3yWPUf36H2+xkMmjROlSZsosVTT/7M1qjx2zHhL3dT1Uyi3+xucdiwAqraSPdovlLgzNx+pWOvDE9UVNuNluFWBHJK7gvGYSGN4cmxlLDNZXj87i8sz/1ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739303761; c=relaxed/simple;
	bh=Kh8ZqaWgmsWJjqLXeNbh/cwYeyiMGkPn9a3hRENlFg8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qvKJG6Jdi2NyDz6t9GFnpS++fhLfo5sABoOdgD6nIHTs0ZOITh7w7hJJiDmUug17qHZtJhMMS+kIxjYfwt6MKWcWAqBaTa8vUufNO9n+f/HRpk9+PzMimOQQRKZMJXAm6FT0UPhLHOfyUiMJboqbBS4yB32nw1xsAWoPX1SI97Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ud73QyMm; arc=fail smtp.client-ip=40.107.237.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ud73QyMm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BzcZdaJnEbGt+EQ7GMelLM1YRPvulGO3h/RPSmVxQvrgVywSZHjg+6Obt1Cqro4jg+/+WMlUjv9dEIv3huQb5wxdXBlZnIN/ss5YpydSQaApVrhfnScAlJoGL364cHpjdmmvdErIRov5rI//eyXPD85WPmdo7aLut/3okr+b90fqHq9N3pZ4ondHd060ZMIy82TyF+inJME3Y5RlUD2BAbEKBtb3hr8GxK5UQiC8gg29rH7ciLi2aYcvFjdtHDecU4iwofS++eZQeVxYJW7wR28DVOWgXbXG0yKeXWI8nEUkZvb6xDzVf/JnGgGfxSCkGYiUyxPvM/mAB+0fpjh/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u07lyY8l2fDk4UAyzjbN4iXy3gLsR+WOuPZudHksYwY=;
 b=DoFH0rLs7PxBYybMiUFBWtQlB1Tgh1cplarllvoGAz5LVBrv0+xCSOc6JjOKegaClxg6k7dFWHrjs91bgp9SRZ3F1sIj7ZSFujK4ZZl+IiKOH45RjIWeDq58udqgv928/k7fzoJFNqvun4hWSlRiihwhmzUTmBIALjzAv2ifAHWxx5ghuKGCrAqucO4qEwC9YtgutifYnK9Rf+MGx5kp5H4y5pxqg5SizS0hqZkAULkgHmDCs0qSCffrUr/KTzyEBlbA0lOO2EdE1/9VU/aRbP6Zb+VMrHzwtOe0niV5Vum4pj0IcSh/dAChlvwFrpyR7QwxZ659bm3IeH8BpXqVSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u07lyY8l2fDk4UAyzjbN4iXy3gLsR+WOuPZudHksYwY=;
 b=Ud73QyMmAujVt107uHR0L0k87SHJKSa1/Chwna8rR6vfwdykBDDuHWzOOoP+GIdTRr0sLdraMl+fD8VrocZlRpuX9zKZnqFsFvTqunXBU2AhPdomLXRVyxSwN9EJBUpgm/ZSHr77h87q+XoObxcMzlwG+vpUB+nBtaPC2GPBccmH5/1HjqXeiSe8g8rvS8yRhr3MHLgvwv+x6fmqzxiXSYDSJURao3TVKjgSZKfkeXTNm4GCO0G6Rhv2kMIDT9WnKvYbjlML7qAZ+1uaRZiO3gaIO5scEIfDBE8JWc9ApXQZSlVM6VBda6j/3TO9S0CsT1mr3wUEVzudECS8vlcF8g==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH3PR12MB7716.namprd12.prod.outlook.com (2603:10b6:610:145::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Tue, 11 Feb
 2025 19:55:54 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 19:55:53 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>
Subject: RE: [PATCH RFC v2 2/4] virtio-net: Add new flow filter selector and
 action for IPsec
Thread-Topic: [PATCH RFC v2 2/4] virtio-net: Add new flow filter selector and
 action for IPsec
Thread-Index: AQHbbJX0GSTeR6NQgEGSssKIK9F9y7NCnF2g
Date: Tue, 11 Feb 2025 19:55:53 +0000
Message-ID:
 <CY8PR12MB7195A7DF812EB2E46932BF68DCFD2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250122062144.266725-1-schalla@marvell.com>
 <20250122062144.266725-3-schalla@marvell.com>
In-Reply-To: <20250122062144.266725-3-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CH3PR12MB7716:EE_
x-ms-office365-filtering-correlation-id: 9f4ced42-969c-4bb3-3675-08dd4ad617d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KVcX4al9ItGIBVs6rWNlhyXVn7ztflCH424lyEldmVtqxEg4IajGVDSN6Kfa?=
 =?us-ascii?Q?BiAXb3uxy74McXEHy/CW7ia4PWPiO6ClnJ9LFh3uZLpplkiaVmU+0NnPzFOF?=
 =?us-ascii?Q?IW9viMxZpDpACMscSWVrhY2a783eEzbyPPBG3J1KNYY/95j1H82eIyYU33eZ?=
 =?us-ascii?Q?9I9g7H8n+OUPSWs2nGvFs36gOPs6uHKLjD06njiXdDNuv1eT87BiYUeiQnpF?=
 =?us-ascii?Q?0vStOqnisYfy67mhbTl6E54J7vHeKw1gKHg7F9evpCgfe6X+YDxTV6nKlZzl?=
 =?us-ascii?Q?BU1/itOkFbJc04ubNr+0Uj8ciKk52Nk7peuro/w6EnSjjFx7cgjvsId0lkTj?=
 =?us-ascii?Q?m7tkwq+7ozBqOqe2wkTc0F1xtphLsxSvCFVJ/LdD78jUUJOaOuOpnfjigWTr?=
 =?us-ascii?Q?5oLlRw5M54qjS+6u48l51Lx6Jptx4Pv2JrtgFZcFJWFKIFS5VxDgIxOnhh06?=
 =?us-ascii?Q?noFTztebQlNsQhjQ0Sp9mkx2o3YqpLu4HbLw6lfqtlxpHqaErjfTNT1Y52pv?=
 =?us-ascii?Q?UvTsIGyRx4OntOevsl4Pp2iBq/zZHvnWZ4AMG9BdWzZI+ZifSmKWHTw5wh5U?=
 =?us-ascii?Q?LB2H+Hd0Jex5V9pTSx5dAhhzEv8LxWm99sXDLy191vwiOoH123M5EOEZMlRi?=
 =?us-ascii?Q?qQJX1oMVvl5emG/EZwjpbY5mgmdgLAd54ekHo/MgNZzc9JFMcFyass24kbtw?=
 =?us-ascii?Q?b1lqQSlpiwWWgPRaxlZzRcJ33cMLD+ECIyxD/sU4uFQNiTq6rJFO9yyx0NGV?=
 =?us-ascii?Q?72CSoJzJgOV8h3/5ZKZFro4N0bLhFLeOJY4GsYDiM7eGer9Q+PCy+igMeoZN?=
 =?us-ascii?Q?3PViF6CDCPZRK+S8lMQbZaEE9WZctIGgZXJ3HVBjT+ugvU/T2JsZ0Zgpm1Hf?=
 =?us-ascii?Q?hDq5hx5faWZ/iH+jT94VRpfnE/FJxHkv43Lue85Y/wXHye5eJlwxS4TTufxF?=
 =?us-ascii?Q?hR8QESA7ocCbspGzMIJeVkVNpIdPCa4bths3orSDKjTIkary6meAABXibulH?=
 =?us-ascii?Q?mZeno8PpWYCDo0WGmBJ2B9A4z7ZD1ABXknDJeJKJjEud380tfp1q1jgZw8BE?=
 =?us-ascii?Q?N87aURUuP6wx0HhKW1lrYvaK7gkBht5Uxgxly3P+SDYoDR4oPnJanPgMLTWe?=
 =?us-ascii?Q?kfOi5weRf6midLA9uHFkZJ8Bku4W8r0wSPxLw+8FgepbnBqZuEK8PIx2UjX9?=
 =?us-ascii?Q?8naeobZ13pqBIbGGpgUYOOIvLfOeIUU1Yu5tK71OlChKlhJCqeNVzs1r7e0R?=
 =?us-ascii?Q?qzHRsAG7/4ee0DVe/eAommnDYhmaoVWAux3+UzGGqPOAVgJhmCZNEoujlZPY?=
 =?us-ascii?Q?fvgCyjplcvtSC86etXz7cE59p3EZQhj/fI9FmKkumxfSi9cXZA1jM0xKBQt8?=
 =?us-ascii?Q?IBPKeNRhPzLQGeXP87s53QDUT6s02NMLs3l/gOZE4/j+fxZNOA5Pm7eC4glX?=
 =?us-ascii?Q?gTPxK1DXkxAEGsLXdUpDhyDX+N/paypO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HeyZX93+OPonKgzhbF/u+lhc5JVl6QJQX5VdgZZY+zf+pKkKxKniu2VR/zil?=
 =?us-ascii?Q?G/RqeyJph2OLbK5haVqkAvty1dpaVE9kMTSKZlslcM60WaJK0HPYlFuC48CF?=
 =?us-ascii?Q?+DdmuomU9jzyt+LxftmGSIANF6QjdNxIFY/8XRF6I1wrxsxz5CBorQnWV1Wo?=
 =?us-ascii?Q?Hovx99TMmspTLnwdcDRBPxewGbhmqMt8Df+wgwAfzjVsKDSZfh49F6BvrxZ0?=
 =?us-ascii?Q?5vzeB4rZxQmFbgSZowUF4tdfogIFa7YcqHFiespF1Pf/nul1i4dxUXkgnrKp?=
 =?us-ascii?Q?1UWMQu+nUrA8iArl6rqYzGdjV0asLxlA8iYTbfzgiN4JFh0TpzELw4rbJJno?=
 =?us-ascii?Q?AezfzRcbBJ0p4I9nNCAYGNBlHxPzKFbSjcODru5lWYXkj05BG7DDLsTAziwv?=
 =?us-ascii?Q?Bh3xqE/lG7rrr9ccGtruXHnG0BByfWcps+XgCTRyYDPud2PhwQw6TYFzBU0D?=
 =?us-ascii?Q?H0CuOy/u0GxerJ2/h6jh8pGc41NpjlbZ4z+2ZCDw2FHczM8Dh24qytG1efnY?=
 =?us-ascii?Q?UGoliwJ4qtTrKnjUCV0S4E8oVgdTz34cLl6NevNYTK5vtdBity7j087Cc77t?=
 =?us-ascii?Q?THQIoYRTW68jtzljrn22mljPgrDYpMldfWzGgcux5+ETUUGQ1ybFCOvQcHtU?=
 =?us-ascii?Q?uFlbIZg9MCBVOZpUGHeGu+9hcUjyoLmUzzHaOPMHipf7GBdDyLmsdBHSJoQT?=
 =?us-ascii?Q?Sa+a+7ifgD9tr4rDIUFa+L1nh1dDGRnLJOJ53U9Zi9eQLXWZI+zLliLQgEIE?=
 =?us-ascii?Q?p4LITCA7nRQrvxvC/Y4qbterGGYczcwwpyb/rC3fJVHhiclMuRo31MT76slp?=
 =?us-ascii?Q?rVPC7kJ17B5uI7yoBSOT0DJKKAIZEHuc0G+XCVHZfaUSyO6ngfO2KKkBsn7u?=
 =?us-ascii?Q?j4wmxdFDgSN3V8QQzho7KHVuOXqJN5iSw4hrvuf2YiyQdZG5MUw8S+FY+eQ6?=
 =?us-ascii?Q?MlC7yeNjKF4DSuq0oqj/K/ZmekRhgunjPzL0eq/819UlSTNcmw6bE5Yo42AG?=
 =?us-ascii?Q?eBi8WsVylYN1jlqhtAXNiMrAml/FH+6SfdvFYAOEuuyU9h8dz++eYypul4ye?=
 =?us-ascii?Q?Dez72sMQOjdImmRmg1VfKCHaywRHbZEIDIoujfRuF7T5FauN+LYu/duc9Bus?=
 =?us-ascii?Q?DoF9lV0bdp6gn0qTB0cplcfLVys2bxXabMQP/nQOgadl1gUFI23B9/9egDOO?=
 =?us-ascii?Q?cINltwn+XboVWgykFoCyzZzjOfD9o2LH5DJhIIL15DiHLCe/ZW1ZM+IjsNC1?=
 =?us-ascii?Q?cNRrfRD4+CnrxoiOGvsnIxRfchmBEgJO8xqCW/dZ2dTZ8N67EECGjpE7g5Ua?=
 =?us-ascii?Q?9jYXjYgg8YGbTgyTOLx5WTsq/e3SFUvYptAirIptR7IVeEO0Iv5T4ABN5Bec?=
 =?us-ascii?Q?zEUfanZx1Gt3ozhXVDY0UQy6xgme0Ov1lp0RHGPT+3BeX8NSFzFu3PIVfbtZ?=
 =?us-ascii?Q?H+uZvtjRLdpOuurOz1pexxEqkkMJl/KGo8lh0lZthgg4HecCmactusBIS3xm?=
 =?us-ascii?Q?1Vk/VIbkHEt0X1O+LRgWklssPeIbHvLOiebYy/3kdBL4R7lLtdG3Ss2xCNeQ?=
 =?us-ascii?Q?SpD+6xjaiaCiEw461FeItN9JYvgP5PuIVlOxrjLYle99eGSpFPPWcDHSfbZ1?=
 =?us-ascii?Q?JQUXwhAcKhOab977K5pGtu0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4ced42-969c-4bb3-3675-08dd4ad617d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 19:55:53.9062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: huN+w1ZX3jol7kj4vQ2wDIpAFNZWfgXd2HjCsL+vnDB1j8muyr2vOqQLC3BA8JizVBWMriGbbqkyB97xq/XZ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7716



> From: Srujana Challa <schalla@marvell.com>
> Sent: Wednesday, January 22, 2025 11:52 AM
>=20
> This update introduces a new flow filter selector to match the ESP header=
 and
> adds a new flow filter action for IPsec processing.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/net/description.tex | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 020d090..cef109d 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -2634,7 +2634,9 @@ \subsubsection{Flow filter}\label{sec:Device Types
> / Network Device / Device Ope  \hline
>  0x5 & VIRTIO_NET_FF_MASK_TYPE_UDP & 8 bytes of UDP header described
> in \hyperref[intro:UDP]{UDP} \\  \hline
> -0x6 - 0xFF & & Reserved for future \\
> +0x6 & VIRTIO_NET_FF_MASK_TYPE_ESP & 8 bytes of ESP header \\ \hline
> +0x7 - 0xFF & & Reserved for future \\
>  \hline
>  \end{tabularx}
>  \end{table}
> @@ -2694,7 +2696,11 @@ \subsubsection{Flow filter}\label{sec:Device
> Types / Network Device / Device Ope  \hline
>  0x2 & VIRTIO_NET_FF_ACTION_DIRECT_RX_VQ & Matching packet will be
> directed to a receive queue \\  \hline
> -0x3 - 0xFF & & Reserved for future \\
> +0x3 & VIRTIO_NET_FF_ACTION_IPSEC & Matching packet will undergo IPsec
> +processing \\ \hline
> +0x4 & VIRTIO_NET_FF_ACTION_IPSEC_RECIRCULATE & Matching packet will
> +first undergo IPsec processing, followed by the flow filter rules again
> +\\ \hline
> +0x5 - 0xFF & & Reserved for future \\
>  \hline
>  \end{tabularx}
>  \end{table}
> @@ -2748,7 +2754,8 @@ \subsubsection{Flow filter}\label{sec:Device Types
> / Network Device / Device Ope  The first selector is always
> VIRTIO_NET_FF_MASK_TYPE_ETH. When there are multiple  selectors, a
> second selector can be either VIRTIO_NET_FF_MASK_TYPE_IPV4  or
> VIRTIO_NET_FF_MASK_TYPE_IPV6. If the third selector exists, the third -
> selector can be either VIRTIO_NET_FF_MASK_TYPE_UDP or
> VIRTIO_NET_FF_MASK_TYPE_TCP.
> +selector can be one of VIRTIO_NET_FF_MASK_TYPE_UDP,
> +VIRTIO_NET_FF_MASK_TYPE_TCP and VIRTIO_NET_FF_MASK_TYPE_ESP.
If the third selector exists, it can be set to VIRTIO_NET_FF_MASK_TYPE_UDP,=
 VIRTIO_NET_FF_MASK_TYPE_TCP, or VIRTIO_NET_FF_MASK_TYPE_ESP.

This reads better to indicating it is one of the choices.

>  For example, to match a Ethernet IPv6 UDP packet,  \field{selectors[0].t=
ype}
> is set to VIRTIO_NET_FF_MASK_TYPE_ETH, \field{selectors[1].type}  is set =
to
> VIRTIO_NET_FF_MASK_TYPE_IPV6 and \field{selectors[2].type} is @@ -
> 3046,6 +3053,16 @@ \subsubsection{IPsec Operation}\label{sec:Device Types
> / Network Device / Device  attach ICV, update/add IP header and add ESP/A=
H
> header/trailer to the packet  and transmit.
>=20
> +\paragraph{Packet processing order}
> +\label{par:Device Types / Network Device / Device Operation / IPsec
> +Operation / Packet processing order}
> +
> +If an IPsec action rule, either VIRTIO_NET_FF_ACTION_IPSEC or
> +VIRTIO_NET_FF_ACTION_IPSEC_RECIRCULATE,
> +is matched during flow filter processing, then IPsec processing is appli=
ed on
> the packet.
I believe IPSEC processing should be limited to only type ACTION_IPSEC.
Can we keep the _ACTION_IPSEC_RECIRCULATE to just _ACTION_RECIRCULATE?
May be one will be able to use the generic recirculate action for macsec or=
 some other decap operation too.

> +In the case of VIRTIO_NET_FF_ACTION_IPSEC_RECIRCULATE, the packet is
> also recirculated.
> +
I think, better to say recirculate only once to avoid some infinite loop in=
 the device.
Otherwise, one may match on a field and just recirculate it without any rea=
l operation.

> +See \ref{sec:Device Types / Network Device / Device Operation / Flow
> +filter} for details about flow filter.
> +
>  \paragraph{Device and driver capabilities}  \label{par:Device Types / Ne=
twork
> Device / Device Operation / IPsec Operation / Device and driver capabilit=
ies}
>=20
> --
> 2.25.1

