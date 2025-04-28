Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2042.outbound.protection.outlook.com [40.107.100.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4949B1D86C6
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 07:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824031; cv=fail; b=cpTal/OWYMUhfwe9RWQSichwojoXgG3/8OVvHk9pg4M8PqgmH/iI2IWFT55WS1tF8pOj79JVkRdoKUf/h1dpguyHuhEflXMwkv4bPv9vN3pqV5L+1qy9YhKGUPcgz7rFjEUivF8hu/hXg/dTTM+ysoC1uhIVNIhGbM4r5bhj9kU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824031; c=relaxed/simple;
	bh=U0dhjywyDmZaLQj81anoKutOQVXCO0H3H4o7fd+k7tw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WW5DXLOKFbi+i3WzmFUDCQZzvhKXP0k64lfGx4uMrwlfVf2prs4aAlHRzyX6qpLXwNkzpC5WSAaeVXDXRkCLOICKPcCAikh9j8QSxg2TfXm4oitR+yn20/NOfuPoDOe1mZGs8Ku/K5WmhjT7JmnlASw/WZjmgGgfDMeZDzWZ04g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Xab4gdi5; arc=fail smtp.client-ip=40.107.100.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xab4gdi5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLoG/D19WUWNbIMqK0lUXIWnIy3sVpCFo7uJ035WQEcheUhxkTQQFQj6+CIwHx+mfB8LwUmfOyZqBh+o/vQDbANNkhE/TIG9u3/+5zl9RygRyYtGUVG+XiGOznO0gypzrPitkfsdw9TZyASDYCL9jGV/zHDetR/7faRMe+S4dg7jKnZtmKOoQvwZE7yuSB+SMAYdFUOhZVIvdGrLh1MMX3T+aHowaoybsIVGu+7cQ+Bls2WQ8kAot1jwc1LNmeCi7Y4aD4NLs7vJQ+cWsXh5CZbjBn9T7awKzBegl9QUG1gmDgr31+J+L158h96QO4sbuqrRBoUJ7m9ZMGNDN1GLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ei5FB7vCl9Y7uZtvI1/kywxfis2evg/mMI6kAfr9j6c=;
 b=CF1UdG4+Jm46EUeMchrA4w+CQaC8fW2enXbdJ9Me0A3Lp6KOB1aXyXYD5Nb36Zhmoqh/Ibx/cbIeTCT1ShZQCXOAD5q3LTTqgxVuVRkKfkVRItXhwz64VYOnMq2g4W+qEHhERnth/qlj4cRJ8qdzYutGkMiHwVL5zNV43XFN20nKjSwvuNclYMrPb6lTLeSotM0KUNy8JqLwhNr5gINVtonyagpXgLwqXqM7gTCPCRVGylFC3mSEFjYjA7ozCkwsee7fGUNlGoxrWmyt68sKofQ0CC2z9Z65yuR1LMloz9qRaURZQa+0sD66NGGY5GbKZwbus/5B4hp08gjSfHj8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ei5FB7vCl9Y7uZtvI1/kywxfis2evg/mMI6kAfr9j6c=;
 b=Xab4gdi5QnjFo2UfYPRpzYEmg3YiJTLS0xFaac8f29AlaAg8TjDIJWoQN0QwSQwPCnTSSOYMQJkowX+53ItJss9O97t09X/p4Hupequ/fdPt7ex3chpWHFOC6xyL1YMYEeSrP+xOAdY4aHQcXiQReyXL6uFKAoIWXvGr5HsIZrfLKNxgE21bb9fdjlwZI892GY2SgghH+nMfQ3Vfr82ABiqF4w1er4+yD2LH4vQr2ToPpdcdoDtR1uT1vIkkKcPXeDoaqKUjthGiXTPyM4F5Gh+vrl6VfcuoZtJ4aawuOj4mAC7dNnXm6Q+HZdQHSHAUWRf2t1W+iTCGv4y8XrVnGg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 07:07:06 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:07:06 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"sma@napatech.com" <sma@napatech.com>, "sburla@marvell.com"
	<sburla@marvell.com>, "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	"jerinj@marvell.com" <jerinj@marvell.com>, "anoobj@marvell.com"
	<anoobj@marvell.com>
Subject: RE: [PATCH RFC v6 3/4] virtio-crypto: Add new IPsec opcodes to data
 request
Thread-Topic: [PATCH RFC v6 3/4] virtio-crypto: Add new IPsec opcodes to data
 request
Thread-Index: AQHbtPvHsAfY0Ub4vk2d9EuCfKgCIbO4pGZQ
Date: Mon, 28 Apr 2025 07:07:05 +0000
Message-ID:
 <CY8PR12MB719547B9812CA99D22282FD4DC812@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250424093046.1927395-1-schalla@marvell.com>
 <20250424093046.1927395-4-schalla@marvell.com>
In-Reply-To: <20250424093046.1927395-4-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB8370:EE_
x-ms-office365-filtering-correlation-id: bda6b573-a1b7-4a00-3ef5-08dd862348cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?R3uplfJ5y01ecaVlS2zmGQxalCLUhLyYRp0PwC33URiHByz+CTWl4SHjiU/e?=
 =?us-ascii?Q?IDxd+py67kx40FbmECTAIWM1sdcP5yof2l1UgDWDIqrW56BXFzQQG06Cs704?=
 =?us-ascii?Q?9lJ0TTKsDSRlikM3H6ylgduhh38pKmTho7avqCmTPWQ7nK9GxfwoX50INmSL?=
 =?us-ascii?Q?+4YH+nOvPWr7spwCil9iM/d90lSwAjdB27XGvGoj/1Wsi7nF4TRznmxA2lyh?=
 =?us-ascii?Q?m9EW9hvpIKIbg92rWHT6rK3z039KtI/pzCEAh6lk3o4bpW8eQtfn6FrXTOsd?=
 =?us-ascii?Q?EVUn06FsY1beOEbqVDETrDHNVIFfPiC4XePm0FDEe/Oe0wDuqbPpIG9CUrXT?=
 =?us-ascii?Q?CPsSIwgJpq0ScU2vVq4oh2maWbjxW82BxNHBolEc1sqbq64b8kq8/4XPzYeq?=
 =?us-ascii?Q?rG0ypy6FswJCHzt9mKwETpi7To5tXlqTzYgFu9AgGni1exn7YvDaGH7dnsPf?=
 =?us-ascii?Q?vKsPnhEL6EOaCuruJJdot9Cw1VUfSfL/Yjnqtx3PV3PTDQ2CSxbsBJozr8mx?=
 =?us-ascii?Q?0XBS6NDKPw7S6ergiX4hRESNMGHziUUrsGgX574p/gv6avErANByvRr7sFNt?=
 =?us-ascii?Q?dVQWD9tfZTaFFBEwB5G5A/kf3mzOzgFCGSRHail4bLdsUVMDeGxgYClOrh7e?=
 =?us-ascii?Q?1ljYzbDkgccdIdUV67xk4xit3Y0lVmS0kSXNV24KAZJ+Ui8pVUKJV/YgK3/Z?=
 =?us-ascii?Q?6orGnZge9cqK87jJKr7TFJo5PvKhz+HEmM0ty/hFldx2iwdwSTxhpuMNLwQu?=
 =?us-ascii?Q?XmjvkI/QWOR/Q3M1nedCynZs14IORVGYVtYqYtL3DWbWyzMAls6b99KGdoQw?=
 =?us-ascii?Q?sQxq9/Y9MeQtRGwwa+77FtQ51UlJwkezzv9WFx6jEqt0q3nS0gst/oUMGgtL?=
 =?us-ascii?Q?iaezRnfbhaE4GKLs02pE8aT1LxHMMLxh+YbZqCU2Nve18Uh70oh0832dZa5n?=
 =?us-ascii?Q?5OD8uBUEq5giG2sRew3u/mZBR1P7xmM+1X+46YZ7ARFSpRpbW+GBrNNLI1HC?=
 =?us-ascii?Q?2ioN/2YCvlcMFnArzoVbjthSc8G1vxqn4/j1aHjknKnecZ5x+DUeqVyJ6od+?=
 =?us-ascii?Q?dXSW4KgUIF0bh4Qq3fBGtDPKz0h5Phc0cDvYRjVpIkiF1ehj+LnlPTtW/p4V?=
 =?us-ascii?Q?R6Vslfpx5KmLXlPtGj06IqXagQHQLa5rdrrfdgtm+bhYrNE02ZdogUyPHe3N?=
 =?us-ascii?Q?U2CHMzNOUtzkxyE6uPQFiXPvyClcCHR15aWjpL0G6rdX9rpFs0pfvTGPxOqu?=
 =?us-ascii?Q?KQ/yNmmtLQrB2gGruvDLAx0rmc2tz/r5/zHal0OGC4l+jl499i6Kgu1O3XhC?=
 =?us-ascii?Q?o7kRGK+y2Tyi1SsueoXCc4FmiVLpFDAh/fvYAZlsxKRiv6zTNCSboTepmi/6?=
 =?us-ascii?Q?VX4T2ejkLpGZRWNcrxG6PJGkRNZ2V4H7Yy0CF6yV71j6UaiqzFzW0T26Tel4?=
 =?us-ascii?Q?6ert68SDdLbtVNsII7YdEjtIaa/NC8xDTLwHEQQuQ+qvAwZOyfJSov3He/02?=
 =?us-ascii?Q?he5+lmHrTClGlj4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xR09NRuSk9q5jBhkrTLlM4xwbv2coW4YsFXZaC0Wa2TZyvmePTHiK/2Uv5/O?=
 =?us-ascii?Q?JIfE6AdcDCMKQ7cCtUAOEDE+i74Ir1wAjfMImJyu0fosYzoMe+IURzjBZLGc?=
 =?us-ascii?Q?qtYR9T8BunBxKLFfV1x+l4eWlG8cs1xKCDctAquIjNzkefPBZ1zWWnqMDq08?=
 =?us-ascii?Q?jKIpMUtBqhbQ6iSUVTaXFyD7mPPxu9kIycxbdhHmHG4TM0o0+8XSv7Rjp7zq?=
 =?us-ascii?Q?bhad+Pah3+UhajEdLg/SCwLCZUJQIF3EHX5N6lluJ7nj4GWqOyJX1LCqH/jw?=
 =?us-ascii?Q?s8uWAFLZzYxmqltm0EKgeTcL+CXfW5JG0/XprQiZm+rF8S1h436lBhFfclav?=
 =?us-ascii?Q?NN4KhBEVaUj2gnNAt5Y5R6xNib5Mwg6yTGPkOEPKkIMiuPVJahmOwz3ZUBS0?=
 =?us-ascii?Q?5S3jnLMkD/8Lt3cvqgNqeqqDFCTuA2XPYMP411bnpj+wNAn1xbyRP+u7jkk9?=
 =?us-ascii?Q?xqFFH5AdkWqlWuILlWkh0MbiRPMqXoTr8wu09aq1Zn4xsX4iAj/mWmRL4B5G?=
 =?us-ascii?Q?COBGF9ZoNnOIrv1Pua1uOGBTlGgRp5umE/jANXLU9Mkf5ZGvc2UyAosNh0B3?=
 =?us-ascii?Q?CHPpWvzULDxU+74MgLl+zvKSQW3W2Hit/40xH0l8KNleTcftmIZdZWtoK0Do?=
 =?us-ascii?Q?ZuBhwtzO+jJipKTLtg+fvWFoY58xbS3SXs7/uxIL1Lr6BajBE6Ss295uvbaW?=
 =?us-ascii?Q?OaSTAzRtVgPiUfD67tMsyjKpO1w58mgcvVBNc2dfUNcCG4S7e6XOrGg/Phkj?=
 =?us-ascii?Q?P6kIXp2DsSOWx/BiYodichrgiXX7jdDoe4d3RI9iEcRgrpNgaEEZxWWaClbz?=
 =?us-ascii?Q?AmCJx/HDYFBgJ3RofhDjXsfxSkVjGYlqxiJUaLX757Nxu68o9W17mkiGmyZY?=
 =?us-ascii?Q?KumWn+qG0RnFps5MIDi8XrAz/RDe+7BUZ7yTK+BhLrHXyAvttgCjmUSQT0Nd?=
 =?us-ascii?Q?6q2dlWT0k+M8pNOIe/yPgcI/uj2Q8ES9KbegiEhG3k7SmDns0tb06nFslaUL?=
 =?us-ascii?Q?P3C8yiZcrNtnajMJbhIGADaZJ/oZpcVBVRWY20JeEo1RbeijWb43WHy2vAw6?=
 =?us-ascii?Q?yjICvKIwPRkyQYuPhut3SsbU7F/ZHX2MzLTjb++hkk5q4lbRD2ER+pFFSc5z?=
 =?us-ascii?Q?bkUPY/o4tTPkmdw0gfCLmyF/B+prOF8Gyf2dLUTckzCIqGP56BP1oeStxeVn?=
 =?us-ascii?Q?n2qfYlWW2l9Hogr1yKeRx0c01kz2MrMQox86srUnCQl7CDlQQTN1s3tJOF26?=
 =?us-ascii?Q?nXRZUVkeLDHqSlIKvQdhO7V3mBtBbXO3wzlghrP8DjB/5lMHxSpWVxlhSv57?=
 =?us-ascii?Q?T/TdCeW8/4Wbw+UpDr2pcj9+FBJM2yG+i2DzqPkPgenxlC9gSK9nkO+8AJ+o?=
 =?us-ascii?Q?UbaWutEv6/UVeXLxDqTmnAFblIP8cB7I/2T3Axk2uqKn3nYHSc5W1xRNV4nC?=
 =?us-ascii?Q?oXinU5YqCLxQ8Rkq/3XMRBEyL2hT9MffWLBCYPCaQmH/cyohPL5yMsu7WFfa?=
 =?us-ascii?Q?w8GcDkay6Kl5gzzBrJ1rtIeO0OaSU5XnAMn9aPHip4NZQEvkqQMBu8OauL25?=
 =?us-ascii?Q?x/3/5KX7IzbCdFmPRrw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bda6b573-a1b7-4a00-3ef5-08dd862348cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 07:07:05.9382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xuFWit4bethe2NGZMd935bftcsRXo0dyC7JlDx3JeSOmyIhfJ3JaWMRnbsol1dowt9YRTbQsr1hBvkYEm1fS1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370


> From: Srujana Challa <schalla@marvell.com>
> Sent: Thursday, April 24, 2025 3:01 PM
>=20
> Adds new IPsec opcodes, VIRTIO_CRYPTO_IPSEC_OUTBOUND and
> VIRTIO_CRYPTO_IPSEC_INBOUND and defines opcode specific data structures
> for IPsec data processing.
>=20
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex | 84 +++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>=20
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index 544ac18..794b9b4 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -379,6 +379,7 @@ \subsubsection{Operation Status}\label{sec:Device
> Types / Crypto Device / Device
>      VIRTIO_CRYPTO_INVSESS =3D 4,
>      VIRTIO_CRYPTO_NOSPC =3D 5,
>      VIRTIO_CRYPTO_KEY_REJECTED =3D 6,
> +    VIRTIO_CRYPTO_IPSEC_SA_SOFT_EXPIRY =3D 7,
>      VIRTIO_CRYPTO_MAX
>  };
>  \end{lstlisting}
> @@ -391,6 +392,9 @@ \subsubsection{Operation Status}\label{sec:Device
> Types / Crypto Device / Device  \item VIRTIO_CRYPTO_NOSPC: no free sessio=
n
> ID (only when the VIRTIO_CRYPTO_F_REVISION_1
>      feature bit is negotiated).
>  \item VIRTIO_CRYPTO_KEY_REJECTED: signature verification failed (only
> when AKCIPHER verification).
> +\item VIRTIO_CRYPTO_IPSEC_SA_SOFT_EXPIRY: IPsec SA lifetime soft limits
> are reached.
> +    When VIRTIO_CRYPTO_IPSEC_SA_SOFT_EXPIRY occurs, the request is
> completed successfully,
> +    but one or all of the soft limits are reached. This is applicable on=
ly for
> IPsec service operations.
>  \item VIRTIO_CRYPTO_ERR: any failure not mentioned above occurs.
>  \end{itemize*}
>=20
It would be good to have the error code for SA_HARD_EXPIRY case.
VIRTIO_CRYPTO_ERR can be used , however since there is concept if SOFT_EXPI=
RY status code, for completeness we should have HARD_EXPIRY code.

This will be hard to do in vnet case. Yet to check.

> @@ -992,6 +996,10 @@ \subsubsection{Data Virtqueue}\label{sec:Device
> Types / Crypto Device / Device O
>      VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x02)
> #define VIRTIO_CRYPTO_AKCIPHER_VERIFY \
>      VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x03)
> +#define VIRTIO_CRYPTO_IPSEC_OUTBOUND \
> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_IPSEC, 0x00) #define
> +VIRTIO_CRYPTO_IPSEC_INBOUND \
> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_IPSEC, 0x01)
>      le32 opcode;
>      /* algo should be service-specific algorithms */
>      le32 algo;
> @@ -1009,6 +1017,17 @@ \subsubsection{Data Virtqueue}\label{sec:Device
> Types / Crypto Device / Device O  If VIRTIO_CRYPTO_F_REVISION_1 is
> negotiated but VIRTIO_CRYPTO_F_<SERVICE>_STATELESS_MODE
>  is not negotiated, then the device SHOULD reject <SERVICE> requests if
> VIRTIO_CRYPTO_FLAG_SESSION_MODE is not set (in \field{flag}).
> +
> +For VIRTIO_CRYPTO_IPSEC_OUTBOUND and
> VIRTIO_CRYPTO_IPSEC_INBOUND
> +opcodes, \field{algo} is ignored.
> +
> +For VIRTIO_CRYPTO_IPSEC_OUTBOUND opcode, \field{session_id} MUST be
> set
> +to one of the resource objects \field{id} created using
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA resource type.
> +
> +For VIRTIO_CRYPTO_IPSEC_INBOUND opcode, \field{session_id} MUST be
> set
> +to one of the resource objects \field{id} created using
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA resource type.
>  \end{note}
>=20
>  The dataq request is composed of four parts:
> @@ -1096,6 +1115,13 @@ \subsubsection{Data Virtqueue}\label{sec:Device
> Types / Crypto Device / Device O
>          and struct virtio_crypto_akcipher_data_flf is padded to 48 bytes=
 if NOT
> negotiated,
>          and \field{op_vlf} is struct virtio_crypto_akcipher_data_vlf.
>      \end{itemize*}
> +\item If the the opcode (in \field{header}) is
> VIRTIO_CRYPTO_IPSEC_OUTBOUND
> +    or VIRTIO_CRYPTO_IPSEC_INBOUND then:
> +    \begin{itemize*}
> +    \item \field{op_flf} is struct virtio_crypto_ipsec_data_flf and
> +        \field{op_vlf} is struct virtio_crypto_ipsec_data_vlf.
> +	Works only for session mode.
> +    \end{itemize*}
>  \end{itemize*}
>=20
>  \field{inhdr} is a unified input header that used to return the status o=
f @@ -
> 1916,12 +1942,28 @@ \subsubsection{IPSEC Service
> Operation}\label{sec:Device Types / Crypto Device /  in tunnel mode, as w=
ell
> as the ESP/AH header on the given packet(See \hyperref[intro:IPSEC]{IPSEC=
}
> RFC).
>  The resulting packet contains only the plain data.
>=20
> +The driver can request IPsec Inbound processing by \begin{itemize*}
> +\item Creating inbound SAs using the
> VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA command.
> +\item Setting the \field{opcode} in struct virtio_crypto_op_data_req to
> +VIRTIO_CRYPTO_IPSEC_INBOUND.
> +\end{itemize*}
> +
>  IPsec Outbound processing: The device performs encryption, attach ICV,
> update/add IP header and add ESP/AH header/trailer. The resulting packet
> contains encrypted data along with the IPsec header and trailer.
>=20
> +The driver can request IPsec outbound processing by \begin{itemize*}
> +\item Creating outbound SAs using the
> VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA command.
> +\item Setting the \field{opcode} in struct virtio_crypto_op_data_req to
> +VIRTIO_CRYPTO_IPSEC_OUTBOUND.
> +\end{itemize*}
> +
>  A crypto device can support number of IPsec SAs, allowing it to manage
> multiple secure  connections simultaneously.
> +See \ref{sec:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Resource objects} for IPsec SA information.
>=20
>  The device and the driver indicate IPsec SA resource limits using the
> VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability specifying the limits on the
> number of @@ -2191,3 +2233,45 @@ \subsubsection{IPSEC Service
> Operation}\label{sec:Device Types / Crypto Device /  capability
> VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the IPsec inbound SA resource
> object  \field{resource_obj_specific_data} is in the format  \field{struc=
t
> virtio_crypto_resource_obj_ipsec_sa}.
> +
> +\paragraph{Data processing}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Data processing}
> +
> +Data requests for IPsec processing are as follows:
> +
> +\begin{lstlisting}
> +struct virtio_crypto_ipsec_data_flf {
> +        /* length of source data, full IP/IPsec packet */
> +        le32 src_data_len;
> +        /* length of dst data */
> +        le32 dst_data_len;
> +};
> +
> +struct virtio_crypto_ipsec_data_vlf {
> +        /* Device read only portion */
> +        /* Source data */
> +        u8 src_data[src_data_len];
> +
> +        /* Device write only portion */
> +        /* Pointer to output data */
> +        u8 dst_data[dst_data_len];
> +};
> +\end{lstlisting}
> +
> +Each data request uses the virtio_crypto_ipsec_data_flf structure and
> +the virtio_crypto_ipsec_data_vlf structure to store information used to
> +run the IPSEC operations.
> +
> +For IPsec encryption:
> +\field{src_data} is the full IP packet that will be processed.
> +\field{src_data_len} is the length of source data.
> +\field{dst_result} is the result ESP encrypted packet and
> +\field{dst_data_len} is the length of it. Please note, dst_data_len
> +MUST include additional header and trailer lengths.
> +
> +For IPsec decryption:
> +\field{src_data} is the IPsec packet that will be processed.
> +\field{src_data_len} is the length of source data.
> +\field{dst_result} is the result plain IP packet and
> +\field{dst_data_len} is the length of it.
> --
> 2.25.1

Apart from above comment,
Reviewed-by: Parav Pandit <parav@nvidia.com>
