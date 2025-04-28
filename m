Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2042.outbound.protection.outlook.com [40.107.102.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A23C1DC997
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 07:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824051; cv=fail; b=p3jOS3vAHtZ42S0QybKJ2uyBv+AN5ywLxwMQQBmS4jUDmjilPvGq1IAjyc/s8hheFP6ob/u9btc6XevEya+yuaqMjH5UyjOCDDhROJtuMI+iAlppUHXuJMRiObHQWPEQOiQCxu99QXmJkc2LYj2KnKvwAtRzhspvQgpMZZTWVsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824051; c=relaxed/simple;
	bh=Y3h3aUbwvDnwalHNlRf3urfDAtBiysSHqttsHaTih/c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nh+v8BblWbK5P5UNX8VNBi0KWoCHOPrnIO7QerTOIUWXAb8IGB0JCmNxGkfm6kgkRjp9L7KMjfTeOipusCc6Zcx4SFcXXAaAAdLZFUvGbJg+41u1gpfPzJJbRN+waRfe+YfmcNM+/sBJjxYd3Nln6jaHdOmFeLE8strm1FzO5ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DW8tqjs3; arc=fail smtp.client-ip=40.107.102.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DW8tqjs3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijPk1voAZye/24wRtXzjOUKuE+QvvlIKBrYAP27BoTFEA83dgyxQxjW9ip8B5nYGhXj9zJiCIUXjDJayMA8Ys/nIv2g2uYiwiycwoERktGTnXBkov+ULU2oTKBwUOj3BSSlRUh+5Eibq6244qL4jLpVOhj4akOWnNmqWdkJoREd92Nhf3RSrb6Y23Il7qwJSoEvjyUW8pFUudo7sMeK6VRbb0tADPOQr2UjezW9MB8mObqZGOP5+G/R1XV6vx+RnFFwgfzrRNYIWnNauRY4jt3Uss4b61rmi79xqWZCRitgZ4FH6HXoK3v2n17UhcOo48VNd1cLS+do+0io/Wo/B9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgFR93hVO5EVFDpnT6tHpQBXKs9xnk4jiwQumWOQkH0=;
 b=kAtDgIgtb0buOtKAocUGBB7elA1bxOi6JYzYrw+/a6JxgzJzy5o5YeXyZ5uamPJ0l+5Cu1Y4yhL6Xb9TFe/yUX4XbXv0imOVq71m/WkYl7UKc2UO/G24GrzuJ/8pjTbfF7ildYHqTBBOmE9hUk9G5XFRDcaNw551drQgH2pQlUExvK94zOjSNDkM9Uu4om+/V9QgK3CD+8r8iWKaoZtHJ0IrwFKSx8gr+Xlkau1ZtQluIbrzahEg874pLiY6uaDMUkgtNyZOvDM27m6a59fqWIi7T79+4+R2EUqdQRgXu9VYndmZL+hekgFvvdDUcOZuqRnI7pcfknhk613ZWaMHQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgFR93hVO5EVFDpnT6tHpQBXKs9xnk4jiwQumWOQkH0=;
 b=DW8tqjs3AIRQrYvIHhLwHF8S1pqUZzz6MPU35VWo2YFhV1qBUWjnmpMsujCaxhJOA0jMtf5ZvKv8LekFUBq9e1+kQgc4BALyAVs/ASC47fdC8xfmVJz326BkJZt1BGsuGyzLghVBTSjoRyKJojmm61l8oXShLGCfylFXkyGmII6dpxND1AF6ebWBc9EwTcNb9hyxxuuycSZ3qhsUmV81M+A3hK+NLccocIYtE/tXepvQr9XLLE8IepNu1ECDDO0ogjg0z+eJBj3kJQb3NYpH8cc64yqnMtTvAofvCAsNLga8JcRti+LNAXo2kVUsLhvMomWFW1sG6VswLPrVCgQe1w==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 07:07:26 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:07:26 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH RFC v5 2/4] virtio-net: Add new flow filter selector and
 action for IPsec
Thread-Topic: [PATCH RFC v5 2/4] virtio-net: Add new flow filter selector and
 action for IPsec
Thread-Index: AQHbtP1kdVwJWESWLEGcZzyf47nTxbO4qOaQ
Date: Mon, 28 Apr 2025 07:07:26 +0000
Message-ID:
 <CY8PR12MB719544DFA4DC177F27EA7DC3DC812@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250424094332.1927688-1-schalla@marvell.com>
 <20250424094332.1927688-3-schalla@marvell.com>
In-Reply-To: <20250424094332.1927688-3-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB8370:EE_
x-ms-office365-filtering-correlation-id: ffe0bc8e-d89a-4c9d-a87e-08dd8623553b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?i+qjHmqlEJWLysonhHtlLAQ8T4r3c3GjbtRzhFtRQqoO0F+33pt48zDqg0As?=
 =?us-ascii?Q?7JOUH8kaFj/8WxLXXqcqESqc1K9bynyqgq+HE07t5QiZlJ8BFqTJTYAIJgLR?=
 =?us-ascii?Q?QsUiYXVseakp4PsnLDylvQxktNNsqC57YqedktkCOsE3+A9vK1wkYg3aFb2z?=
 =?us-ascii?Q?3k+MCyN5kFhfFdwDEzOFo27MqmS2ASREMuAPpGcwP1jbUEEFxNmUDnc7c91a?=
 =?us-ascii?Q?1Mn4bFVxUkfUxoEdgrdzJjqESVw+rWR8FqkxNkwZTLVbcCLO4Olq499Zqahj?=
 =?us-ascii?Q?PNJupzQhzLqTy3Ne7eDm6NfzZzKC7X1BgBHCk15mv/MXbo0UNBXDrQZlczxN?=
 =?us-ascii?Q?39IW+sSn5L93T+RSnw8J1S6rUpZ8V8QFsLhoflM6l2farpyFFzQyfjuD1MqG?=
 =?us-ascii?Q?6oGaxdC2z4wXuylVi1ez857I6EAoequyzXdHS/lm2qWBkRs7//SQHfNAhU9+?=
 =?us-ascii?Q?FBxTbs75AUtqmzjNYpHfdl+sK5gz0DuXfoH4HjSC4xPaOOarWDhjcf9V9XTD?=
 =?us-ascii?Q?Jh1ZxjBgTOPUYelZ9ipQeT9qDtCIlfKi/8Y8lcA8xRPWnfpc4l5TcFYaO49B?=
 =?us-ascii?Q?g0K026W356eD3qB3xfJRs03LgkdIMSOFW+dVfUKNrN3LJjWBHhfLfTBh6QlJ?=
 =?us-ascii?Q?ZyjVM8e52NpExGALSMV+MLJb8xlCBFnFp3cMZJlUULneRIwSZG/jpIQO7n2A?=
 =?us-ascii?Q?cqkLHh73lEtQj+BWVUhtjEUBKALFHuVYpt9mx4K0VcpXdY689fzCUbv/HBJi?=
 =?us-ascii?Q?ej4/TSVhMG85AyIc/QgfFy0MNy6CZ5uPkQi3fCChQseedSgyjMEsh585xLA4?=
 =?us-ascii?Q?SfxOV2kK/bRmWZm4XZkKZdo74elibbKBdwLKFU+SFAZuGYADslaFQMVe31QI?=
 =?us-ascii?Q?fbarjTcOlOf9ro4Qv4a2ywPJVPcX4IzR6qPa5lxylMPYr4EDx5n6iv4Mf6l4?=
 =?us-ascii?Q?tAlbCFA2QhMrsHbl9ucnrL1EEClipg/BAiSR0xlFZHh/fppdvLf8MAAnQwNi?=
 =?us-ascii?Q?3WjShink/0qO5t8lrLeHzpD9y8r3Y2o6orNRd1YD74ucL4e/PykgofFRRyAu?=
 =?us-ascii?Q?IwJmVnQaq9Rr6SdS95OjwL0rpXC0CTDuHfmmNdmFYY0QWgBH3U/yodlNSeOV?=
 =?us-ascii?Q?hqDdp/7sLXAew7qFZ13OO8qMYbuIqE7C9st25eqai7ktsejwz3H3pNY6/L80?=
 =?us-ascii?Q?hyrszEtwBopO7C/ZLNmGBiXAw55PZkAu2qm1NU0VbM247YP7ShPTaQrGLG4H?=
 =?us-ascii?Q?q6cwKJVuZ7Y1zANj1wwtRBY0AYT2kEN1o9ElnkdKXu163ceKjhfuYosUTs3B?=
 =?us-ascii?Q?hLwuvewhJrQt2H0s90VwSQD5t4Effj9EmJEFqCvFTFClqyJK8PL2etYPLAYM?=
 =?us-ascii?Q?hapu8Juo/7fzV47LkXJ1FCQsMNSsq1HhV+UmxG3slvyQZTZTZsgiNw0Iuwm4?=
 =?us-ascii?Q?PO6ya6IddzF0tDKl1O9JhRKpitAMvoY7/Oip3N14E2xszKn3QUJY/A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EUuS3RDFVlnUp3HtGthSjn95kpCTg36W/EI3K9TzaaA13L0dIYdeGHpsKyN5?=
 =?us-ascii?Q?2kQt4o7jBVPqLpjZpANklZ/YB41KZqFCX/8oCcUKchw2beruPPoNjQjXkg81?=
 =?us-ascii?Q?lvgmy1t+ZxBUzSTf6E8jbyFRBRh+0pHKRJNtxLpHSwJ77/C5gVeda/7xG4XA?=
 =?us-ascii?Q?Whapnqxz+BkNn0MqnbBGiXi0s/tNHVooLdM9+ZBZDcCpi0k65NjLjvLv4rFb?=
 =?us-ascii?Q?ta3Z9Es/TxoBs66DkS9mIJjxkFjrjzFAHZZVgg0rMD38iWuJRlUemRTWnT0N?=
 =?us-ascii?Q?S2Dwk/qccEMnGL4CizEtegfQhSsLIWNQljSSett4lVMbnOzfzAsoKXIWEKVC?=
 =?us-ascii?Q?x0CrZ/wGtOisGhe9KrZDvTt9DriGTcyBwPapqa7/xSxHSanaLjGcFPI8YcUU?=
 =?us-ascii?Q?LbdyAAwuOgUTfUxEJe9HWhfVA9qh+lF8CI8qbq0SoCk/pZsKLO0fO8Z2/SpU?=
 =?us-ascii?Q?/YUTFUoZ4FRwaO8Zd/LqCsCVYcbQU6goyMycCJt2wifQXjAxoHRt1qxLzr0r?=
 =?us-ascii?Q?AAYLnVk1DaEtEP6ljTubh1+RXgKUfUt9GFIaSHlwChsMka0Pws/hgEjHLSlO?=
 =?us-ascii?Q?uMVjYJuXPdIlBFGE9XIk6bzgjNXPq5oyTbfDxtafqpZwjn8VxCPL9RByx5Zc?=
 =?us-ascii?Q?T9ypWGNUn2bom1KjLgkjXxYbVn4PvAoKOxq1M1+aywZ3jCwQ2dZOXnBBYZlv?=
 =?us-ascii?Q?sWxvyc8idogMRU0xbqZzzjXh0Qfoh60+zeOed9JDiEU0qPegYINm1etL6G03?=
 =?us-ascii?Q?zu0zMmAb+RkhDDsihjfC7WzEhF/QYb4qEe0Ar9QBgTyrMflTqQH8Hu57Al1H?=
 =?us-ascii?Q?44n2kEUt+lQ1pm74tDhs6VBqzXELcGmFYXQBvyh8EoONUnCoVmf1XhAIlcu4?=
 =?us-ascii?Q?bVQaD+ZZyTh3UBq31kTyZu97KSPxxnxSbJfDsNXpGZBHTN/cR9JXed2enWKL?=
 =?us-ascii?Q?5bfeL66Wa5C88TEfGRF5g0rN5E8KX57q0jzCCKQeRsc49AuXoNzXU3JSalRq?=
 =?us-ascii?Q?NBVbP8QcT3+eYi+1EXV+h49DfQkAowRGedM3gIZRS3QbeI8SVugGmr2SXdWv?=
 =?us-ascii?Q?j+bGRHSGEPpPUAOIRewo4wYulvR3TLw+vELtkLABJjADiKOlJGM33yUv/F/j?=
 =?us-ascii?Q?1oCl4pbEkBYoycLE3iXXEaWyNrdgZkIABqvxxIyWleje8EB8xPt6QhkKnVTR?=
 =?us-ascii?Q?92Fgr7+MOlEBvHLrs99jzPE4Ynh2v32yHeTTE42IFBO35+uVSHU+xHkXIBTG?=
 =?us-ascii?Q?uYEz6CQoIXCY8QvP06R8HxWtWJ5DsjmlXYVkEAmRCl1TNZ/0JBCJG/KIZrtA?=
 =?us-ascii?Q?BuXNqqIYtHi9MsPby/rYxF2kellutO/tYZJ5Mli4s0RRN+Pi4kH9jq7WHydJ?=
 =?us-ascii?Q?pSDkXi7XXP+nUqj8bMrp7M1TXxM4zWw5tGBf4WT4gz4QnbY03q46gxuFBcCT?=
 =?us-ascii?Q?WROn1jYYIhjTZdYFsvP1zNub3yKjr73ztPBBEHf4/Q26TjJpnc5jK7iH1KCK?=
 =?us-ascii?Q?O9ruk7YnWSgWUTgsAXSe/b7764gETpwgD1b+UflDBoYi2iinoia1/pVQjkxq?=
 =?us-ascii?Q?xLEtX+UOYW57basi9sM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe0bc8e-d89a-4c9d-a87e-08dd8623553b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 07:07:26.8132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3lKUfTvE6gb29Gqf/6zRQtouzNukYhzVzIrGP82yqHrO91bW8CrZY7r4Be26NU72TW6Rk4USMLFdrRaMiXr3dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370


> From: Srujana Challa <schalla@marvell.com>
> Sent: Thursday, April 24, 2025 3:14 PM
>=20
> This update introduces a new flow filter selector to match the ESP header=
 and
> adds a new flow filter action for IPsec processing.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/net/description.tex | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index d918c55..ea70c6f 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -3097,7 +3097,9 @@ \subsubsection{Flow filter}\label{sec:Device Types =
/
> Network Device / Device Ope  \hline
>  0x5 & VIRTIO_NET_FF_MASK_TYPE_UDP & 8 bytes of UDP header described
> in \hyperref[intro:UDP]{UDP} \\  \hline
> -0x6 - 0xFF & & Reserved for future \\
> +0x6 & VIRTIO_NET_FF_MASK_TYPE_ESP & 8 bytes of ESP header \\ \hline
> +0x7 - 0xFF & & Reserved for future \\
>  \hline
>  \end{tabularx}
>  \end{table}
> @@ -3157,7 +3159,11 @@ \subsubsection{Flow filter}\label{sec:Device Types
> / Network Device / Device Ope  \hline
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
> @@ -3210,8 +3216,8 @@ \subsubsection{Flow filter}\label{sec:Device Types =
/
> Network Device / Device Ope
>=20
>  The first selector is always VIRTIO_NET_FF_MASK_TYPE_ETH. When there are
> multiple  selectors, a second selector can be either
> VIRTIO_NET_FF_MASK_TYPE_IPV4 -or VIRTIO_NET_FF_MASK_TYPE_IPV6. If
> the third selector exists, the third -selector can be either
> VIRTIO_NET_FF_MASK_TYPE_UDP or VIRTIO_NET_FF_MASK_TYPE_TCP.
> +or VIRTIO_NET_FF_MASK_TYPE_IPV6. If the third selector exists, it can
> +be set to VIRTIO_NET_FF_MASK_TYPE_UDP,
> VIRTIO_NET_FF_MASK_TYPE_TCP and VIRTIO_NET_FF_MASK_TYPE_ESP.
>  For example, to match a Ethernet IPv6 UDP packet,  \field{selectors[0].t=
ype} is
> set to VIRTIO_NET_FF_MASK_TYPE_ETH, \field{selectors[1].type}  is set to
> VIRTIO_NET_FF_MASK_TYPE_IPV6 and \field{selectors[2].type} is @@ -3509,6
> +3515,17 @@ \subsubsection{IPsec Operation}\label{sec:Device Types /
> Network Device / Device  attach ICV, update/add IP header and add ESP/AH
> header/trailer to the packet  and transmit.
>=20
> +\paragraph{Packet processing order}
> +\label{par:Device Types / Network Device / Device Operation / IPsec
> +Operation / Packet processing order}
> +
> +If an IPsec action rule, either VIRTIO_NET_FF_ACTION_IPSEC or
> +VIRTIO_NET_FF_ACTION_IPSEC_RECIRCULATE,
> +is matched during flow filter processing, IPsec processing is applied on=
 the
> packet.
> +In the case of VIRTIO_NET_FF_ACTION_IPSEC_RECIRCULATE, the packet goes
> +through IPsec processing and is then recirculated only once to avoid the
> infinite loops in the device.
> +
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

If you happen to send v6 of this, it would be good to add, a one line descr=
iption about re-circulate.
If not, we can add it right after this series merged.
Something like,

When a packet it recirculated, it undergoes flow filters processing again w=
ith the updated packet content.

Reviewed-by: Parav Pandit <parav@nvidia.com>
