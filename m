Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5918C48034C
	for <virtio-comment@lists.linux.dev>; Tue, 18 Aug 2026 17:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787073363; cv=fail; b=eYJ1n7EwOnojvLwhS0nG4gaLOy4MDHQYITDSsOrpGbkTPEBlqmzt8TfBD0LYSz3nL0Sl8BTlyCGHA0MmQSzpH1Ji3XUhNnbzeJLcKksjuTo9R1zQI9ARh2iXHJ0UoruJ3KiuQCk+sJ8OoKGnyQTlNh9vbvriZVXPVXUbq1xcgMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787073363; c=relaxed/simple;
	bh=X/N5w99P61ho2yL/F+83ej1xzJt2OblHYuNCKZxHExI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cXK6890B47ttl9kYBfVougYzNduXAgDJTHldeuTLsDdWg3x5/JpWd9Ahzbtu6VlhnGG1vyL6TGziFQiRkXKwd8NGg72fOp1GnJGZWnMzLlfib8A4U1UKbs09GhG5biSXqioBiKvFEN4Z19Ld461pqApJHEmf3kz+NXxgRXTvwK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J0lGboKi; arc=fail smtp.client-ip=40.107.208.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J0lGboKi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbgwPLZ/BcFgBSTon4xuD9hE9xIFzwZZU6vvHNwwqhkbu8qFWKmozOZIMu5hPi//OIUJqEF+YtZuJIhFqHJvflxQue/V8G4ruf03y+tToPNKGvFkPLufUVzU1SEUoe6YjF8k4iv8gtfm3vt6UUu8kzpEdjErk1RsZl57Et7FH5Uo4IUbCCt+KLjOtijDNAr4xvouw5csQ+0euStCbz8MYCpwau7UFFBrjfOjgZdGHhDKRo3VxCaRwsiWkiwXt+t463kg+VT42BzlAvCti/GMlGbZs1cHg1a0T5fAW0XOTpRwsmTbeihU3gSIx50VlACaZkY3OABSxGMTL/rmCtBGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VpgNRmqb3EXUpBl3pGYOdfpD9Z/VM3clf9dOsbyN30s=;
 b=eteJx4nRTZQkAu+y5HAtYBln5vS737a5Vo7VuUi6Q0XzrdsOR26uoVI6q0T/+qscCYVYHnkEoQo5iayeOT3ZdjEiZ+/w3dSMQXqr9Rnw4N0kF2m9dvXIfwqzBRAeYr9p9nRXRQ/Ji5lohPDj9qfqeZbApUDZM2Ig51kDAowzAnWLkCS63LUJ6p6MMaW/opF3DIBHeoKlAJ64a3c2g96ZjtAT1+cU+Pzffw4kXxXSAeaq90AkNEFEEXymedZUofDftfUwfgVcXhStJAN/TSdB9v2OFGx9CNSpP5Ms74bYfkcBUq1Y3Dzz+tBPXVxopfJG3k1NJDW0cGGyrlZuRoaISw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpgNRmqb3EXUpBl3pGYOdfpD9Z/VM3clf9dOsbyN30s=;
 b=J0lGboKiI4QzhjiKdm1rwsQ6EkWUS3XfSzHfzUuAM4rIAD/idR91SmqP7H8de7yPtQoXNX2S9p3LQwL5tAXRdGdNRS0WvBcwBDaPTLy17BlvYSGuGdp1923vP/PBBixnNP77ZExSChoQRPNc9kmvjOdt8I/FOfTyR3+8ny1pFEAy61J7Q0NtHqHX+s69GOS1SsxONsy4gddDiFNZU05lAVRg/6smdMnwyfVVJED3Pae5QjGLcvYiNtYp9sEI8JMQyMLc5Ly4XAhD1KOnGCfTNBUcdlYHqYBumMVq9cas7RWvhYwZl00nGV/q0+wArtYfby9XXYrWLemHn2E8d8i9GA==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by SA3PR12MB8021.namprd12.prod.outlook.com (2603:10b6:806:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 17:15:54 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%2]) with mapi id 15.21.0292.024; Tue, 18 Aug 2026
 17:15:54 +0000
From: Parav Pandit <parav@nvidia.com>
To: Amanda Liem <Amanda.Liem@amd.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: Nathaniel McCallum <nathaniel.mccallum@amd.com>
Subject: RE: [PATCH] virtio-net: Add VIRTIO_NET_F_LABEL for a per-instance
 label
Thread-Topic: [PATCH] virtio-net: Add VIRTIO_NET_F_LABEL for a per-instance
 label
Thread-Index: AQHdLzS9rGiDe6pUFEmU1tApYAo9fbakC3hw
Date: Tue, 18 Aug 2026 17:15:54 +0000
Message-ID:
 <SJ0PR12MB68063B6C5A125573CE53A717DCA62@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20260818170552.2127-1-Amanda.Liem@amd.com>
In-Reply-To: <20260818170552.2127-1-Amanda.Liem@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|SA3PR12MB8021:EE_
x-ms-office365-filtering-correlation-id: 96d67863-a727-4591-459b-08defd4c5cbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|6133799003|3023799007|56012099006|10067099003|5023799004|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 /aCp8OBUxkDDSrPz0SvkU6qOKqxP9fBbz0j9Pm8ePMXu0St8BKW5f2ThZBIweEzivd1m/0S4J8WHQxua0IubYsvDxB06JqUR0FsCHLAsE6T0iRSMpMYB+ChKGjP23oXDEYku9/LxcMCH8rpbCG4xIL9Eqh6MN3SqPoAYePNYKiNA6A9x9QzezvbJbvmpzXYesogJHwAbPQiF7hPOUJ3gTkIvHf0iYdiFb3aqBO9gBSnwRydHUqeaJ+ucmLd+L795WW/q17xhK9SHZ8YvQfczfeLiYpIffo2/npvK1QfD+I2o7h0eflYnIRMek179VDX8Z88mt8jIImCkapSKoyUCD70FWgMPxCjIEroQ7S2k8yvOTripAarcqhVyw0lVTCwPz1yo69AxmCl8+x6m7WzZ8/DX5fKSz5+iOmiJXx+yaz9+ZZZzzizXu6AyQ8UxPJaOg/qkXOzIHsIItnjhWfwCSU8f/y4C02YBODiWivR86Y/hmePx4YmInNVsObWTC2FbDsY/iZdbKFsBO5t7ZSvOjfq95ZOHJygJQXCwZI3pVw28EjChtWHr1TUAlc6ST5Zq/6qd8wn3va3nt51Ws0PxkmvYSd2QGgGWF8D6r38Ke2WQX/+1Eki0OuKwkpGQSQFA3PRP6ZISLB6yNq7kryslUasRr9apaeKhJgF67P6kn8NvvMCwGNY/AC5HsqzYhBf2MvXuC1suTQNAK5sTce/QsG5VvogYCLYKgXRvdhXRfcA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(6133799003)(3023799007)(56012099006)(10067099003)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PJzheRyRVMVsnhLHQGYxonoiN+2stTYl81LYaZ55Hz0x6tmm/C5CeQnRNr?=
 =?iso-8859-1?Q?4gwGKKQXbpYquvzLReP00MvwKvYAlhfOPKqACDsJ3TfK8/dzNKk6WmY76N?=
 =?iso-8859-1?Q?bsRWQdWn5cYvE9qMl3NiYVweRwZeL0XMtftul8SjNPPtkSHSIBbkwJuNTZ?=
 =?iso-8859-1?Q?s/9Sc8WsVXKF5c0jSEt3p6bE4RBM0roIU2yewYG+Cc72znJu939NUdA9zw?=
 =?iso-8859-1?Q?O0l7mAByguOIC1bJimVP+icXr1eFVxybNnHB7vfW1/odRIwRVlxBWXGu6O?=
 =?iso-8859-1?Q?3GEbY/oSOFe9SjJGc+7s5juHCcdFtTS+48D6qzSmpKykLYb6TcFJhUMJ2V?=
 =?iso-8859-1?Q?F2NA8B4Br6u40l3dIH9cSPHfWempXEGVfhwNLNpm7LkVkxizsqBXgcPPGL?=
 =?iso-8859-1?Q?kHdwJMcGUodFZPsJU2C+/xdaKoxaapFdZNN9qgn5RPY0Gc7IvbmTLb2AHQ?=
 =?iso-8859-1?Q?IqBIzgAvUiZmPhcwniEtOzqFvsvr204KqO4OKOaJxSaUJ1sxzpOdzmQsLB?=
 =?iso-8859-1?Q?mnZnWWH6ehBSB/aNa6wXVF9/3GqTMarj0ATHTmJ74c53E/BlN+6fRjxgCI?=
 =?iso-8859-1?Q?LwckNR2gd2h8mnA+lOnc94tJC50A/gimUgbgRE66cK2LLJXiSvCeg0a7mz?=
 =?iso-8859-1?Q?hq7TPNvEsd+BrMSPSk+X6740zezR2igXPEsL2Z0jJSDZDrgWwDhlhJ67Dd?=
 =?iso-8859-1?Q?d9bvNUTLWHXprR99jsInKfciPXXgfvZMaHwZVOQHm5sgfaKgeGS58ebbdx?=
 =?iso-8859-1?Q?QOEa7M98zK6tyeWOU90vDKekqmtiDjw+dBrzhsZTydID4gWif0yUb1/XUs?=
 =?iso-8859-1?Q?iTp67FluK4CBXQwC/L2PM0Q1DbJbo+O6uMzyqjpVtGcHSPCS07lP6ADJ/E?=
 =?iso-8859-1?Q?YMkcJ+pyqmF7uxXkJf3XHQ3cAI4TgXOJO37A/9e1q/h2ETcrDkNW/8B7EB?=
 =?iso-8859-1?Q?mzu1SCfm7+XwG+/Va1o8TvSO2EuG2rC7XX+FQ7XTib0sXMvoOF375squvu?=
 =?iso-8859-1?Q?jfTD/pxWS02oZaB9i1HPjgw+9t19B0+N7kmRUDpNT3sLQSfp827rA4uhV7?=
 =?iso-8859-1?Q?nM7Pz1HDZFJ/aZaygUmUa6bUGkr0vlYneYsVxwLf5A+GBld2JatoYTrjw/?=
 =?iso-8859-1?Q?mwG8p+6Q1GkFuuSvNjehbVSE0UXN4SL7JAaiLYl2VDdWt/UhJ8BwrQ6tR9?=
 =?iso-8859-1?Q?SjW6Hv3jjjHVYIF9V9CZT63+aeR9XiON06SSfJ+Vcv2qhIm0Y0AAjJyAwG?=
 =?iso-8859-1?Q?9HMplxZ/s52xASUKibxWCQJuiPfQ7RdoYxW8KNo+RGeK2Te1phMPDxtiV2?=
 =?iso-8859-1?Q?jG2qBuYGGKZiThSokNaMzvmgNIsQ9J2Lhhokm9ZgUtGhQxkSHauPgfZSAF?=
 =?iso-8859-1?Q?H2jGCNbl1jDNWSyy1QJ++gONhpDv8Xp9NgA/CGiNzf43kbXL9f1cB5syZx?=
 =?iso-8859-1?Q?Eete+wJw4MDpYWKi75g638vvyGlUvVtsEXConyg+YWToDSFzH3MuM8GT2O?=
 =?iso-8859-1?Q?caqXg4Tk5y/EKYtuxT1bf4kxkRGuPhYTyCRschByDrwJ4+HlzDfaTQ57To?=
 =?iso-8859-1?Q?+rU4wmXSxJlRCxF1410vGkV44ASBPeFQ+4kiNjmUkGUud7RxuXw5ftqE67?=
 =?iso-8859-1?Q?1Yvp95IYk6f8DcT2AR6LeFCZ0T+voYCdHtxF6ul/LfmU+mTrI4S5wy+epE?=
 =?iso-8859-1?Q?FPzvFUCqZxIpiCEpyUWJxCwFOydr1egmNQnO5oU+s3gAKdaX44AiPjAOqR?=
 =?iso-8859-1?Q?lX6Vsl7S+4bknXuLhsn+OA6jtG+1h6DpP9Qmo28m1+mJuu?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d67863-a727-4591-459b-08defd4c5cbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 17:15:54.8303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9tKYdTUbj+cfyQoZBLu2kh9S0yFTESSuhjTsy9EINpI4PSELy5SE8nxZdrGov20vilYKSkm8CBxPflnj/nG4Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8021


> From: Amanda Liem <Amanda.Liem@amd.com>
> Sent: 18 August 2026 10:36 PM
>=20
> [You don't often get email from amanda.liem@amd.com. Learn why this is im=
portant at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> From: Nathaniel McCallum <nathaniel.mccallum@amd.com>
>=20
> Add an optional, feature-gated string to the network device
> configuration space: a host-provided, guest-readable label
> describing a single device instance. The field is modeled on
> VIRTIO_NET_F_MTU and lives in config space so that it is plumbed
> identically across the PCI, MMIO and CCW transports from one
> definition.

Please add the motivation for this addition describing what problem exists =
and how does this addition solve it.
And also have you considered querying this field via CVQ.
If yes, than please explain the motivation to place this in config space.

>=20
> Two read-only fields are appended to struct virtio_net_config,
> present only when VIRTIO_NET_F_LABEL is negotiated: label_len
> (0..VIRTIO_NET_LABEL_MAX) and a fixed VIRTIO_NET_LABEL_MAX (64)
> octet label buffer holding length-delimited, well-formed UTF-8
> that is not NUL-terminated. A fixed buffer (not a flexible array)
> keeps future fields appendable; existing offsets are unchanged.
>=20
> Device requirements: offer the bit only when the fields are
> populated; keep label_len <=3D MAX; emit well-formed UTF-8; keep the
> value stable for the device lifetime with no config-change
> interrupt; and never emit NUL, C0, DEL/C1, U+2028 or U+2029.
>=20
> Driver requirements: do not touch the fields unless negotiated;
> read label_len first and treat a value above MAX as a device error
> with no out-of-bounds read; read exactly label_len octets; and make
> no routing, identity or trust decision from the value, derive no
> interface name from it, and assume no uniqueness or persistence.
>=20
> Comparison is byte-wise and never normalized or case-folded; the
> spec guarantees no uniqueness. Bidirectional and zero-width
> characters remain permitted because their hazard is contextual; an
> informative section places sanitization at the rendering layer and
> notes that on an untrusted host the label is attacker-controlled.
>=20
> The feature uses net device-specific bit 71, the next free bit
> (0-70 are in use).
>=20
> Signed-off-by: Nathaniel McCallum <nathaniel.mccallum@amd.com>
> Signed-off-by: Amanda Liem <Amanda.Liem@amd.com>
> ---
>  acknowledgements.tex             |   1 +
>  device-types/net/description.tex | 113 +++++++++++++++++++++++++++++++
>  2 files changed, 114 insertions(+)
>=20
> diff --git a/acknowledgements.tex b/acknowledgements.tex
> index 9a9f8b4..3394bbc 100644
> --- a/acknowledgements.tex
> +++ b/acknowledgements.tex
> @@ -22,6 +22,7 @@ \subsection*{Participants}
>  Martin Kr=F6ning, Eonerc \newline
>  Matias Ezequiel Vara Larsen, Red Hat \newline
>  Michael S. Tsirkin, Red Hat \newline
> +Nathaniel McCallum, AMD \newline
>  Laura Loghin, Amazon \newline
>  Lei He, Bytedance \newline
>  Paolo Abeni, Red Hat \newline
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index 9f85bf4..f1d1474 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -146,6 +146,12 @@ \subsection{Feature bits}\label{sec:Device Types / N=
etwork Device / Feature bits
>   when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec featu=
re, it SHOULD
>   also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
>=20
> +\item[VIRTIO_NET_F_LABEL(71)] The device provides a label string
> +    describing this instance. If offered by the device, the device
> +    advises the driver of a host-provided, human-readable label for
> +    this network device instance through the \field{label_len} and
> +    \field{label} configuration fields.
> +
>  \end{description}
>=20
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Networ=
k Device / Feature bits / Feature bit requirements}
> @@ -220,9 +226,15 @@ \subsection{Device configuration layout}\label{sec:D=
evice Types / Network Device
>          le16 rss_max_indirection_table_length;
>          le32 supported_hash_types;
>          le32 supported_tunnel_types;
> +        le16 label_len;
> +        u8 label[VIRTIO_NET_LABEL_MAX];
>  };
>  \end{lstlisting}
>=20
> +\begin{lstlisting}
> +#define VIRTIO_NET_LABEL_MAX     64
> +\end{lstlisting}
> +
>  The \field{mac} address field always exists (although it is only
>  valid if VIRTIO_NET_F_MAC is set).
>=20
> @@ -276,6 +288,42 @@ \subsection{Device configuration layout}\label{sec:D=
evice Types / Network Device
>  Encapsulation types are defined in \ref{sec:Device Types / Network Devic=
e / Device Operation / Processing of Incoming Packets /
>  Hash calculation for incoming packets / Encapsulation types supported/en=
abled for inner header hash}.
>=20
> +The following two fields, \field{label_len} and \field{label}, only
> +exist if VIRTIO_NET_F_LABEL is set. Together they convey a
> +host-provided, human-readable label describing this network device
> +instance.
> +
> +\field{label_len} specifies the length, in octets, of the label
> +value, between 0 and VIRTIO_NET_LABEL_MAX inclusive.
> +
> +\field{label} contains the label value as exactly \field{label_len}
> +octets of well-formed UTF-8 text. The value is length-delimited and
> +is not NUL-terminated; octets of \field{label} beyond \field{label_len}
> +are unused and have no meaning. The remaining octets of the
> +VIRTIO_NET_LABEL_MAX-octet buffer are reserved.
> +
> +The label is descriptive only. It carries no semantics defined by
> +this specification: it does not name a network, identify a tenant,
> +or establish trust, and the device does not guarantee that it is
> +unique or that it persists across reboot or migration. Two device
> +instances MAY present identical labels.
> +
> +Labels are compared octet-by-octet: two labels are equal if and only
> +if their \field{label_len} values are equal and their first
> +\field{label_len} octets are equal. Labels are never normalized or
> +case-folded before comparison. The UTF-8 encoding of the value and
> +the octet-wise rule for comparing values are independent: a consumer
> +that requires Unicode normalization or case-insensitive matching
> +performs it itself, and a consumer that requires labels to be unique
> +enforces uniqueness itself.
> +
> +The value MAY contain bidirectional or zero-width characters, which
> +are legitimate in many scripts. The hazard such characters pose is
> +contextual to how the value is later rendered and is addressed at the
> +rendering layer (see \ref{sec:Device Types / Network Device / Device con=
figuration layout / Label security considerations}),
> +not by restricting the value itself; the value-level restrictions
> +below cover only context-free hazards.
> +
>  \devicenormative{\subsubsection}{Device configuration layout}{Device Typ=
es / Network Device / Device configuration layout}
>=20
>  The device MUST set \field{max_virtqueue_pairs} to between 1 and 0x8000 =
inclusive,
> @@ -326,6 +374,27 @@ \subsection{Device configuration layout}\label{sec:D=
evice Types / Network Device
>  The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
>  does not offer VIRTIO_NET_F_CTRL_VQ.
>=20
> +The device MUST NOT offer VIRTIO_NET_F_LABEL unless it populates
> +\field{label_len} and \field{label}.
> +
> +If it offers VIRTIO_NET_F_LABEL, the device MUST set \field{label_len}
> +to between 0 and VIRTIO_NET_LABEL_MAX inclusive.
> +
> +If it offers VIRTIO_NET_F_LABEL, the device MUST set the first
> +\field{label_len} octets of \field{label} to well-formed UTF-8.
> +
> +If it offers VIRTIO_NET_F_LABEL, the device MUST NOT include in the
> +first \field{label_len} octets of \field{label} any of the following:
> +the NUL character (U+0000); any C0 control character (U+0000 to
> +U+001F); the DEL character (U+007F) or any C1 control character
> +(U+0080 to U+009F); the line separator (U+2028); or the paragraph
> +separator (U+2029).
> +
> +The device MUST NOT modify \field{label_len} or \field{label} once
> +VIRTIO_NET_F_LABEL has been negotiated; the value is stable for the
> +lifetime of the device, and the device MUST NOT signal a configuration
> +change for these fields.
> +
>  \drivernormative{\subsubsection}{Device configuration layout}{Device Typ=
es / Network Device / Device configuration layout}
>=20
>  The driver MUST NOT write to any of the device configuration fields.
> @@ -367,6 +436,50 @@ \subsection{Device configuration layout}\label{sec:D=
evice Types / Network Device
>  A driver SHOULD NOT negotiate VIRTIO_NET_F_CTRL_RX_EXTRA if it
>  does not negotiate VIRTIO_NET_F_CTRL_VQ.
>=20
> +The driver MUST NOT read \field{label_len} or \field{label} unless
> +VIRTIO_NET_F_LABEL has been negotiated.
> +
> +If the driver negotiates VIRTIO_NET_F_LABEL, it MUST read
> +\field{label_len} before reading \field{label}, and it MUST treat a
> +\field{label_len} greater than VIRTIO_NET_LABEL_MAX as a device error
> +and MUST NOT read \field{label} beyond VIRTIO_NET_LABEL_MAX octets.
> +
> +If the driver reads \field{label}, it MUST read exactly
> +\field{label_len} octets.
> +
> +The driver MUST NOT make any routing, identity, or trust decision
> +based on \field{label}, MUST NOT derive the network interface name
> +from it, and MUST NOT assume that the value is unique or that it
> +persists across reboot or migration.
> +
> +\subsubsection{Label security considerations}\label{sec:Device Types / N=
etwork Device / Device configuration layout / Label security
> considerations}
> +
> +\begin{note}
> +This section is informative.
> +
> +The label is supplied by the host and is not measured. Whether it can
> +be trusted is a property of the deployment, not of the field. Where the
> +host is part of the guest's trusted computing base (a conventional
> +virtual machine), the value may be used as provided. Where the host is
> +outside that boundary (for example, a confidential virtual machine
> +whose memory and execution are protected from the host), the label is
> +attacker-controlled: on its own it is evidence of nothing. It carries
> +weight only insofar as the guest corroborates it against state the host
> +cannot influence; how to corroborate it, and how far to trust the
> +result, are concerns of the guest's design and are out of scope here.
> +This specification only defines how the value is conveyed; trust
> +decisions are made by software layered above the driver.
> +
> +Any layer that renders the label to a text sink sanitizes it first: it
> +drops control and separator characters and renders the value in
> +isolation so that bidirectional formatting characters within it cannot
> +reorder surrounding text. The value-level restrictions on the device
> +(above) remove only context-free hazards; bidirectional and zero-width
> +characters remain permitted because their hazard depends on the
> +rendering context and is therefore addressed where the value is
> +rendered.
> +\end{note}
> +
>  \subsubsection{Legacy Interface: Device configuration layout}\label{sec:=
Device Types / Network Device / Device configuration layout /
> Legacy Interface: Device configuration layout}
>  \label{sec:Device Types / Block Device / Feature bits / Device configura=
tion layout / Legacy Interface: Device configuration layout}
>  When using the legacy interface, transitional devices and drivers
> --
> 2.43.0
>=20

