Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2050.outbound.protection.outlook.com [40.107.95.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C09A261393
	for <virtio-comment@lists.linux.dev>; Wed,  2 Jul 2025 11:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455687; cv=fail; b=Zi5u9oUOfQvVQ4xmo3BKj0kncgzIaMdGERGvRcfU7UMb9IotRSP+vFWZ7fSr7LU9xOtLAC9FwH22Sd+AOj0y7BgBaRg7QnnwQMFi5TGo4k19RxsQhlOnkQjNQw79JdVjtM11ta1xp1y63ui916Fescl3guF+F8maTXygYHIfPGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455687; c=relaxed/simple;
	bh=B1+W3PgBzPcwNuWR3zqFocX6UKYyZH/CiLAqatwyOsM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ewFTZ5DQgRoqiWoSxC9jpEEMe9a4lG4TviWmxtqHk+FLk6pgn1Z+F0VAofgki2RUVgRyEZEwFzzYgK24gZGqzVdEQOuV5olGMH6yKCBikraLx5mnlLGqp3t5nfeoc2Nhff7eDY5FQCrU8tzH8FjRJd0Nm26e7k0O8ExnoalfjGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WO/+9YzA; arc=fail smtp.client-ip=40.107.95.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WO/+9YzA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqQAvCyrelna1JSPeM2p3QjLVjB3QW/nbQag4sv+zQ8lv10L+Kf0FrUQXzB95a3jzD1k3PYSHKtgUNPAHqN8tL183DRyXOxBgkryAA5fvBcJ0QifIxL7EerfFxDxVd+oqa/JGyzTvCsljh8l/HLHKAKN9zDmdH9JKJ+x2G5Hvh9b8nNpnwRJGVN5OYzD9FLUAk55DDvaIMESmmAj3A5zD34OxDkXeoN3vnvXCWUMgHMRA0Wc6qjZg+e4No9ahUplSN0VkA44JGEAXYmz5YdhqwKlxP0fLyis4cC7zmahhXGvfJ/4V4pNSOxK7neBRy8haJ3H2glObDQzDy8/3OBe1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYQG5cthZGFeaI6c5LqZiQSw+jntQeJ6cIyHsR83WvE=;
 b=TtQTfthKp+tYwkbzV/nyjmP8Vo5IQIXHxxexhpUmov2K+jhxejFAwNtpYxs40Pewtq/6b4FQCW2b3a3BGneT7XBTUai1bKU3X+t/5/PL8Y0wrOgAvKg9hGYMRfb4uOf1dtvyffOZsVIeHfsKEgGb9evtIMGAWzOssx/B0YAFi5zb0FS8lwa4EOZJunvoeoXMmOGQD7XBV5OlPHS0Zv739uW5Y8+StlnhGHAmy5jCMwk2/RPd2ZYWNLfno7YwJP8b8fDFk6sb5drL2ByiwgqQOhnJjNAmvcDbyurOC2+Wk3acSb6MLnBeexpTctHEJj8wZKFHR7P25fBEcveiGD3Z7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYQG5cthZGFeaI6c5LqZiQSw+jntQeJ6cIyHsR83WvE=;
 b=WO/+9YzA211QCDl76Cu5i65UQQ3Kc0wX0Gcjy8EAzFxeq5TrYJfacwG7OFzcn51lHb/F6TRdDPWXrd8rMvcIX3VoIXywegdXgIQYUcQDxKpcFUd3Fe24Ik/qycxUeZsZ5VRoDf4If7FHqfPT8D1Mn3AKqSPTlftxOGlGjSpwK9JAyGDNlAUd1OBLGRLmlg6lmgqyfzPwlD4faBDVJURDL/0w2zrgYsHQqT9XcSBJ4rNdQZ9cEA53a4HQ4EHN/gTexZRirOHXJZTEApKHYbq08elUO1Ppk9czN3Khq3Ta0rlhIrwE4k/hnejSnwr2Ys/YyhN2h1KrfzoQ3HE6Udnv5A==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM4PR12MB7744.namprd12.prod.outlook.com (2603:10b6:8:100::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Wed, 2 Jul
 2025 11:27:59 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 11:27:59 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: RE: [PATCH v4 2/3] virtio: document feature bit 42
Thread-Topic: [PATCH v4 2/3] virtio: document feature bit 42
Thread-Index: AQHb6y77jBb7xC8v7kuwap6c+ns0A7QesiLg
Date: Wed, 2 Jul 2025 11:27:59 +0000
Message-ID:
 <CY8PR12MB71952C0BE76C70312DAE5AE4DC40A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250702085421.342224-1-lingshan.zhu@amd.com>
 <20250702085421.342224-3-lingshan.zhu@amd.com>
In-Reply-To: <20250702085421.342224-3-lingshan.zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM4PR12MB7744:EE_
x-ms-office365-filtering-correlation-id: 32209a81-8c8f-4871-1757-08ddb95b7fa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tm5bB9ZlKlgLMH0MyzNixXv850HsvHi1xek1c3PXNI9SbNYnjEUP0t7Ck3AZ?=
 =?us-ascii?Q?SA8NmaYraQ90mdnQX6+M1lFtF9wvliSDKiDFGGuKoMzmttkugJdcC3WaXLaA?=
 =?us-ascii?Q?+tTmlw+pM5vLnelCun3i2mJ9dhiG9jr5zngLZMW0aPIKxgbwYJ/KwI+/uQCZ?=
 =?us-ascii?Q?SbmSxeY16HqR8Bo21x6dJ612A2pVYzf+FisKEY+87CWpaBi8sk4YexDzpwBc?=
 =?us-ascii?Q?GZtYzW7fgDApMdiU+D1QiLnRAoyt8uNfFlwVJzxg6MXVoGlm+LFgl//XG8aR?=
 =?us-ascii?Q?QkifuF/Vxe2EfJGSCTORe3AErFvVHFa1D6hUSI7is/0oDvzb1Xwc0y3LvyT9?=
 =?us-ascii?Q?TVLGZgfkri8b5lumy9polmLFoaruShMxrqCLJuABeo/A6RuKyrGzN/+UMWIp?=
 =?us-ascii?Q?JtDEnZ0TizFR7qgIbVpIbqD4y8/bjUYRD7+3MXTHKMtP/3+rn/8Vufunaa16?=
 =?us-ascii?Q?wxSEhG6mmnwb95gJ3P3YYMd2r2o7GGhfFMNThgxLTlAgz9aGKjPG+NUvgcNV?=
 =?us-ascii?Q?D/s5fS6ChqJTDQ6gtDBiui3/29sPoYAXPRj5iTbIGIzFna3I4j85AkfFjrmO?=
 =?us-ascii?Q?1GpcHKeNvMq2oepk6oCX49Iv9GCtvyHwprIooXseTXSST0Qsq1Ro7LLoZUc7?=
 =?us-ascii?Q?N8O+Atg6XXjhwyQ1iEie25TES0sG/sxjHxm2HqGMQo9Q1xwBksof762I5sNZ?=
 =?us-ascii?Q?NbxjbcqUQXNWD/llDNGuY1vzzFheVOgbfwlWC1GHRv9Rlbx9CykkETpdxdnf?=
 =?us-ascii?Q?ze5zgUeozrjiDzVObnLbcV7qKjJwKI8J3WoHoZyKkFgc0KsK9i5oNFxOKvb8?=
 =?us-ascii?Q?Ab3lrRy0dp1Jc2jI3mnh/7dZv3fzjLpovMPnpILGTJQYrpzh2aFPZpXtf9/e?=
 =?us-ascii?Q?7Gpu4L9KEsk5OCElHlqcyA5taA01pGkdgjSHpWt9CrqMTtMhsLAK3jP7UYFd?=
 =?us-ascii?Q?0RsSF0MJrkuGjfBGFwX6YJxwecRu+ZvpYrCCCflV8NLjR4xHyLEqhRFwZuH7?=
 =?us-ascii?Q?CqsqYRbXdHhVQyIvu4y0TqjigB0HQz+PFfEcTWVLavg+kly8VRVqDEKJX5tN?=
 =?us-ascii?Q?5rMYZ7NfUKUthff1qci9I+ArAganOgFsBtb4mzr34dvme3bMah7t3H8ynb8K?=
 =?us-ascii?Q?2O7eMUacDmXAFu1mw6UJaNEuIeH8RpoqnTAyAB9cE6kjll73UG6wlL9YywKO?=
 =?us-ascii?Q?AMcKbZxW0brhPnLHjTTiruMXc0oO1f++sgl1ZnkQ0CoT+FxYs0sBo1XkMjPL?=
 =?us-ascii?Q?opOZwm+WNXs2kEQCU7kZrBVHXSZntshL29e3gca/mFJUM92VTF6Pj9dtny8T?=
 =?us-ascii?Q?i095RK7620j/b8vngHn+VkB3BEWHSoYSGjZhKpT1ccKLdC+EKQefA4vBOgA0?=
 =?us-ascii?Q?xeSzT/eSrUnrMspVO20FwsWCXfgZThMrUDe+kU4Y2nFlM1XUasXeApKvgCvJ?=
 =?us-ascii?Q?j0AGJ9kWtOPOyxCxH8CGu9Sa/mm2B/+kUKhT1gXKluLgCB3SL2wG6p8DUPZ7?=
 =?us-ascii?Q?ayQbJ0po4K1LVlQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mlwNfOs9CJIBov5VkqNVxnVfROgzco99YekCDCG/tHKCi+lmMgxbijr8KpNF?=
 =?us-ascii?Q?YKw9mNEx7NmMwf378EcBxxlnMcs/Ocac5y2lIlDn7hMjBd6UjycR4wTrPSCz?=
 =?us-ascii?Q?gijaRfaa75N4Mqb9ZlVH4tQ8dp0aMaBPrdgOejpU3AIGYyGwQqbvgBVt0Msn?=
 =?us-ascii?Q?W1dUzsXKLPdYK10pGpUCAYgS0lMA/YPWC1CkLOPvrc+bCGZaOJHIZZLa9VTp?=
 =?us-ascii?Q?blZkqaa4Q8gu09+ONvsNIupSjCp+lZoj3No8ZsEyjPXkyzAJguZ61WMAq0RW?=
 =?us-ascii?Q?/acI2uda58fwn7h4XVGTOqfLyPcLSwxIUQz5kZu63CFbq2DZjyr2fQXzqGW0?=
 =?us-ascii?Q?+SPSww8tbenoXhofVpHJH1S7/l+XE/WxWcHqbn6ilp4xhXawIB1NmLQHi4oK?=
 =?us-ascii?Q?Rhe4Xoz3NEBnls+5avFehn1MI355EXSK4jWyTRVK875+0z5p/9M6+1PAiMZy?=
 =?us-ascii?Q?A6mHWb/NKEdlvjE4JUnywHpn9obfaRVPXy7P/ITR7fuVTr5QOiAcQ44xlrT0?=
 =?us-ascii?Q?jaU+FzcZmxNTqvheIY6MAkPnIGPE5kL5ZJ3QqUGOMKJSsVbj22tfPgKo31gQ?=
 =?us-ascii?Q?Be+Ikg9R+7UIPVpjLDM6zN7LdJlHE9omE4ctYaLc1kBJSL4ToAT3FebSZnCN?=
 =?us-ascii?Q?tECa+4xPpfAHoTKMJ89UkTye0BgwBSEfdafSiV7h6wfpDke90suWwKLsRCZ+?=
 =?us-ascii?Q?8ZVum++wxT++PWVelY5lvmgid2uIwSpI+utt6ajuXilDRc8JXLXYI7z8XArm?=
 =?us-ascii?Q?LgbU/zjNgWGQ5FidZa+XzGvdU4paQ2167QKZizQkuZ9Ezw/ODzL90J12PY13?=
 =?us-ascii?Q?Bg5IZoVhU2O+uYREA6wPPANB6v5oRxuv+fDWweT6PqeqfxQFpfCWGC68poop?=
 =?us-ascii?Q?9VQdtrNGAvrjZjMeqH3Z34efAI0b4UZ5Mun1SD8Nm70V35kouafccG5FWSt3?=
 =?us-ascii?Q?xqrCd+kI/OQSDB9J2QryWmi7XvDJThKei4tRVlElJAUUInroYozEvM7kI+jb?=
 =?us-ascii?Q?U7wVXR7dXKzx7dQzvHdqdyckl3zIxPWjxma+KnBvnKWVRQvE9zPosh3f7rfM?=
 =?us-ascii?Q?hhD8FuaacCs4ovL8PUP73TeTlfjfZruG48KdT+oFSReCasV0xPDOUaDiGkE7?=
 =?us-ascii?Q?MnqZISpQpbJjlqFkwB7gE59gTseHLJMVKR2AwDGa2NLJntGMPzXqGF2Sdxau?=
 =?us-ascii?Q?rqr+/s+oizU2Tyb9Bm0pw6qBeLLz6OptHu6OGbeG1EtimNvAFeZrMR/yGqtA?=
 =?us-ascii?Q?WEfvqIh+3S63KFEw5CyrnEkbkKLpSBvwR2PVeXp3LEBj1JF0n2Hc4XyQl+/F?=
 =?us-ascii?Q?r2AzGb7PE6kqfbuWfSG+VfpoMGtGz5gPGIPnAezOHQq2K0tSfhKZ35JSyqGe?=
 =?us-ascii?Q?xPwJfIckHVFVQxfd6yS0MMDyENlcdObh8DD9ytJCiDCZst8KJN+SVDwLTXDG?=
 =?us-ascii?Q?oOXncHj3vY7pc0EDGXC1hnpq4VesNx3BR/nn9LA24/MH3eou2P9wn9nUBpvY?=
 =?us-ascii?Q?m1GOtlEC77HakK7O3oVAWy4zn1Rc9nlCH+dyf5iCIb9vgyuAZxX47PQTphCV?=
 =?us-ascii?Q?qMTQqy7cuHhETsM7BS/RmJUkzU0Utw3RTN/tHLm/OUDLx8Mtc/weT4oELfuS?=
 =?us-ascii?Q?PKvJjS8ro/r92cIY5Dwoiec=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 32209a81-8c8f-4871-1757-08ddb95b7fa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 11:27:59.0740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d3+gbRovQ4MAiSufwugOn+0Hqi1nN94kDxZcNh9c3ob/NVNEA2rQka0VHrCu0FbW5UTcNO63LrJycUuEM31Y6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7744



> From: Zhu Lingshan <lingshan.zhu@amd.com>
> Sent: 02 July 2025 02:24 PM
>=20
> This commit documents feture bit 42
> VIRTIO_NET_F_GUEST_RSC6
>=20
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> Fixes: 94384142 ("content: Declare virtio-net legacy feature bits 41-42")
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/229
> ---
>  content.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 1efc2a5..9213dc0 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -97,12 +97,12 @@ \section{Feature Bits}\label{sec:Basic Facilities of =
a
> Virtio Device / Feature B  Feature bits are allocated as follows:
>=20
>  \begin{description}
> -\item[0 to 23, and 50 to 127] Feature bits for the specific device type
> +\item[0 to 23, 41, 42 and 50 to 127] Feature bits for the specific
> +device type
>=20
> -\item[24 to 41] Feature bits reserved for extensions to the queue and
> +\item[24 to 40] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>=20
> -\item[42 to 49, and 128 and above] Feature bits reserved for future
> extensions.
> +\item[43 to 49, and 128 and above] Feature bits reserved for future
> extensions.
>  \end{description}
>=20
>  \begin{note}
> --
> 2.49.0
>=20
Reviewed-by: Parav Pandit <parav@nvidia.com>
