Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010019.outbound.protection.outlook.com [52.101.85.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5B22556E
	for <virtio-comment@lists.linux.dev>; Thu,  9 Oct 2025 05:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759986252; cv=fail; b=hpcwJ3RH7LPZiL5i9m39jpMzP8WaLpiHMGZkRliIctmd4ybSNazeoIB8LytHDlr4xR5q4qEAtMLccY6PWDC8dCv2oW+svAlmC440Hj+Cr3bjXLstARMOCtFV4DuavXagNVfcLQvYiF9j1/ry40FkHqGp+Etq/+XB7zm55WEHVrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759986252; c=relaxed/simple;
	bh=H9dfFhSb5gPrT1+OUEBNieROdRC4qScNqlBP8pdbUws=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=okaBCgTYpLw5UwccOH/z8cpREShOJkrud3iakD6FQTuNh6IFYrX9tPfSieb+lgyybVY+A5p8hWwmakvbLHAv9pv8lDhcFy6Z3lCsII6XVBiyBUxJ0HQsI019Ms3wHNFgH8S0b0q7QF1HymQrIGVfaAa8aROOqYEDDKAKCvEXqcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i8i7QJ1E; arc=fail smtp.client-ip=52.101.85.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i8i7QJ1E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JS2jMdfUn7kdeAI7l5nMT7FOae4ux1yXaGJw0LeFEDF0mxT8/5yRedrq7u+/o1/Tcf8FUwh8aB392j1IfOiCIiKE+UyvlRVrfRCHrFpKeHTjO9yAI31DRc97dukRZUvlZ3GetMGuacfkzwvIDhXHR+7eyf6rkffMMYrIj8E+xH0sDHxav8IviLH+hosP0hqcBuTHbWxasGj3NKnLtJseks8Rx5Dbj+ywXvz1Iki1fRG0GwFedv+6XPUAIdlMedvUWoqwNLJ4FqY7+bKONQHnVhrVMDDji+AFcmJL2wLOHq3vcE9ahe4IR9Thistv9rhe7FQ1heBhioJtnze4B+xi9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OMLlNEHLAFc1A0oXLisLPOFkgx1/UrBYd3SnAZz7BA=;
 b=NvQiCYzYUD3Rrf6u0qjjYw9n+QXF3D1FIiFkamGhqac4U95Ok25ay0xjfG6rTJaG7M9GlQX+OBGuXE1LR4ePFRghO2ZdiJTzlxEcSM81zMoyruvMNSSNL5hFySuC35+t2gjzE0stlSQgn5XKTSifpA7O9pFhYA6Ua8p6oHxibQCJGdh60791qbCckBkvrGnEdrYWUwXmpwYvcFLbu9T9GP5bEKIr5ytlmIPwWhD1XMLC8SszVcTqT4Ctn2Wdk/3ZhHLwZ7oqJ/nnFdoN+yZg0uhcyRzawiwj0d/zihHjC41zsLlGfpS/H8x4zr1Io+0qc6pWervonJhSuuq8eFLWEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OMLlNEHLAFc1A0oXLisLPOFkgx1/UrBYd3SnAZz7BA=;
 b=i8i7QJ1EDmzU7is8isVLdQgkIDh06IETNVbQzGPqAb4jF8f+gO62BZ8DCNvlRxQmhcueSplpXeZL/8nzgE7XTwU1YbmBmA0/H+DzgWbg3wZr/EgO50YgUhTCZ4G52QFQoiQonkaY8kvCC4j18171cK2qavGW0HK2/IT1dTq1yhtWbXJMpmYt3qAAfDOEcH4mRYInt2lq8ymb2iDzIxRlAS48DDRzJ/TJ9VNM6u62vGnS2q7wi8aUZKCckUxiieU5B1cFmoahTGruG0CcNWCScKCGb9GXsrnv1QpJwrh6FyRQlRRz/hfrNkTTTOAwIY98iRLuzcxgpWZapkj2he7qtg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MW6PR12MB8758.namprd12.prod.outlook.com (2603:10b6:303:23d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Thu, 9 Oct
 2025 05:04:08 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 05:04:08 +0000
From: Parav Pandit <parav@nvidia.com>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: Robin Cover <robin@oasis-open.org>
Subject: RE: [PATCH 1/9] LICENSE.md: convert html to proper MarkDown
Thread-Topic: [PATCH 1/9] LICENSE.md: convert html to proper MarkDown
Thread-Index: AQHcOGQsrImAXR13+kOZWP24v3y9VLS5QvbQ
Date: Thu, 9 Oct 2025 05:04:08 +0000
Message-ID:
 <CY8PR12MB71956B0145F4F457A8AD45E0DCEEA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20251008145916.2626143-1-alex.bennee@linaro.org>
 <20251008145916.2626143-2-alex.bennee@linaro.org>
In-Reply-To: <20251008145916.2626143-2-alex.bennee@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MW6PR12MB8758:EE_
x-ms-office365-filtering-correlation-id: 874f1acb-6e40-4810-6704-08de06f14725
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?eoV7Xk6p+XFk0aAmbI11L2+4KrAJ8cHEOyYg1xkUOnaLdrFp4QVQ1FIwv6?=
 =?iso-8859-1?Q?hwY+aLVIdbP3RC7HQ3GSprpcF0ZbnZ3sc2tPDhthWb+oTkSN8SbJ+uqpog?=
 =?iso-8859-1?Q?l4oX8f8HQhDYW2XOkFFcRkTQXXxYA+amjcK8/bqII+cUFRjkU/kPZM4aUg?=
 =?iso-8859-1?Q?nJis07n9XqHMWee4VGqwJXsmOe4ZjUXHqFm3JtFmgLs1flU1MSGQDeb5Lc?=
 =?iso-8859-1?Q?vNXq1CBGPLE81fwTQkn9Q+qFYssuKU7zYmqiS612Rf4fbAiCy+SSqyFBBB?=
 =?iso-8859-1?Q?wNBwThEBg/hcAh6eU+6iMjEq1jOjgaIztf+SqIf66EFPlGvliGKMXwvPpr?=
 =?iso-8859-1?Q?zl4nbjk4Hdw2Q66LqoI52wKboyB45j3v4UFfPns84vK0mHVzwuXUPaEILc?=
 =?iso-8859-1?Q?h5LiqAFdEmg+5VzZwb8jXRTjFXhUJsjDrGJzHt8nI/cZgDRI164qgj+v7q?=
 =?iso-8859-1?Q?VG/PuCHC8jMV8Xpj0JrDx/sLEQiJbqidb8N+4B4+8KN14vBb8tobhImX0+?=
 =?iso-8859-1?Q?VneJIKbYX2O9stbrvMV18sbRyxx7LienWJelEt/68wKzFS2aSK+tJHJ0DG?=
 =?iso-8859-1?Q?Hy4XH1q8HDqxUu5Y2VPimtW2yWB6zds21POtU36zClwoT73q2wmSK6neqd?=
 =?iso-8859-1?Q?wW/5eakJQdPYHumG3d18zcm5KRb62bSuZLyZJ4ULwTb46j32gfwH18+P2b?=
 =?iso-8859-1?Q?QLyAEGc8Vg+o/e7WioZ5D4L+SR40bxZX7Zxwa5I2tNrLE6DB9ejkGkPf0Z?=
 =?iso-8859-1?Q?M8vxBIya8gTRg+qsH5AA3OtbIAMI8RAVfWXa4PxeiQB3rcuea0zpBV6XJB?=
 =?iso-8859-1?Q?NqbRlWXTeE8y35GbDW955ofkGUwC0ok7x85QtA0+6HMpFOJrzK+Vdcw6Dz?=
 =?iso-8859-1?Q?y0T4/JdgmT8uE+QCV9VOOxcREbyXDhqpfnxVg3GImVV0FcdilPnLRWRAqt?=
 =?iso-8859-1?Q?vkAglBtB3kVeGuuX+aTeyCUOSxnXgUC4f6ftxR2Z6wXse1IUmCRKA9bbto?=
 =?iso-8859-1?Q?Bgtlqr5+ekqL+GZJcQWfJEUAezrDNJ26ZU4oBr6hi3VJUsmbRF5b1uyl4v?=
 =?iso-8859-1?Q?qIkOkP0/+P0gO9xemrvgyYNFmG0VU0Aw1aIDhvgF3aKq9OGGwV8S6pefGm?=
 =?iso-8859-1?Q?f0JaYn8LcgoIRPARlsHFrQbWppMn3wABoh7Fmbk2wPwXK15eSs3wCT375j?=
 =?iso-8859-1?Q?8qvae++6BLT7t72QhYs7eToDc2yvmOT49NcBbNtsE+rTwqA6fHERHSDAKm?=
 =?iso-8859-1?Q?DWr0ZfcdUpIocvHpeUG/0QYwEc5gFmmtzGA+OP9Olz0ngvig+HNs+renco?=
 =?iso-8859-1?Q?Zu8YdnSwDoMGoI9q4TA2fIoNGsVLAccjdoNR4XSPhNTuJ9wR/UCnbohJ7/?=
 =?iso-8859-1?Q?oUfnd4KaitUXQ6ekoWzx1+fP6pkUIkVOKqcyKUTPpkm+oraBkTNL+qRA/i?=
 =?iso-8859-1?Q?fH8hbXsnr7s7LyRF4q7LXklzS7NK9ttzAwS5+sAE2vT149PuE670JEKeu0?=
 =?iso-8859-1?Q?PHTULt2LXDECcMieNSrov29V9jRpfzH8LecbRIvM6D2bztSPrV0AJDZbq1?=
 =?iso-8859-1?Q?YBFe1OcIWHSH3kz+TSr8O7Y4Q3kr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?L0zug36yQRdp6EBmuyUa4hzEMtYxQejWAwY7AbMFh6Gf/w8bqUlslDuTLO?=
 =?iso-8859-1?Q?0jvN44gG8JHOLKwFI+qJ1if0vQ3OAxYAni2frc5dJMlnnDkAjP3wb34Nia?=
 =?iso-8859-1?Q?HlROAUhsnT/aAZJfp1Ujib3s/513/e7flhYUx4OaZwb04By4DC/3qYtNYa?=
 =?iso-8859-1?Q?m8R8JuEQRsjrqrIh9nq5thIqNeX9DgLdhPmvPJ1yUM6kwZCRNJoY/cN4GH?=
 =?iso-8859-1?Q?aeTNDsM/6hqHwLl5jG2WC0dea33NT2eHRW8szdxUCGgP+BRSlTbyE9BxX4?=
 =?iso-8859-1?Q?dHhaVgR5rgVBAHwFStEtpvYTNjwi6NBTQFzm+O8RHaecR3U8mJwASyu6w3?=
 =?iso-8859-1?Q?D4vAQJ8k/qctXmKR1afRpICTMWKvohThLZQ2YQ5SYbEYjqkL1mZ6YZEGZZ?=
 =?iso-8859-1?Q?z5DGYA2NRkaNKPOqKkUjMHIYyvTa35AGGddWS9xdXjk4U6N1R+2rug7NZv?=
 =?iso-8859-1?Q?axZGF3aYK3ZdaX8asL5kf8QTApLwzmQgZOsaA762qCo8rFXMHjLJl1rGML?=
 =?iso-8859-1?Q?BCLVw+1PTR9sUe3So19HCrAu/khaM+ZXGHNOQ2uVYK55ERtbLkronZ2nH2?=
 =?iso-8859-1?Q?hTtq8tUsb5DCbwaYH8N7MpjPTvPP1OzucmnSXv06s3gF2VqgVfQKh9Fcva?=
 =?iso-8859-1?Q?bTA8clFdSnbu8BcMg868+KZgxkVRt3Gj3LmW2+XCcBqNI2JlZfjwO7YY/l?=
 =?iso-8859-1?Q?rdA1nP1sycAZsTD5lZmrlq/cbR8ICjX5RUO0AexMFuQf7zVw8e9zKJyeLT?=
 =?iso-8859-1?Q?nMzKYw7A0Ufk2joAetH1DISSW+C6htWdbwpZe62z7F//bhpNRyykQtK5T7?=
 =?iso-8859-1?Q?0SRNWX8R8YxbHsKrTnpG/79Go308rGSMLoMofY7U6SuEuiqBkQzZreeP0w?=
 =?iso-8859-1?Q?KYKjCHe0/GiWlEJh+GzzQeiSfTFeFiQBpHOq4duafs3fzH3ckoqJNMS2+r?=
 =?iso-8859-1?Q?zYZrJknTctJv7X7xYHmBBDdgjO2Imy8qZGG/HDKq7OaKNR0bniqggNOWMR?=
 =?iso-8859-1?Q?qfZ34t26x2cvk9yU2o61vGO2Arhwjpsi/YA2PkpDLxzjEL2n39+l0nvcec?=
 =?iso-8859-1?Q?ZQvY5OBJzhN9MZ6lhtQ8oSlBy/Tgl9o9c77FaoWSboqefueRzaVy0RdVv2?=
 =?iso-8859-1?Q?WYB9xK1ZqWZRXlh+JaHM8netGQdAwnzuitse9CbCjCfSF0oZgneIdvGzjI?=
 =?iso-8859-1?Q?EqAua6ZXxxJZXuZqYdgq8HceeaZd1BsRRqT62ZzyO9I0IXr3xGMesE6qmr?=
 =?iso-8859-1?Q?OXLRzweXDVZqUr7xBm/5aoM5P2Hv5SiASiI0i5WjVCdcjTUofEjnU+hp57?=
 =?iso-8859-1?Q?n4+nCTXxooVp68GRFXG+qNG4FUvRc8S4AVTumdRHCgw5JNzs/qdxeLe8/4?=
 =?iso-8859-1?Q?rw2k/vajo84wbYO3esDd5pU5/TDos95nj6Dl09QdVQ8ybua0dGVC3iuyI8?=
 =?iso-8859-1?Q?noRqkszbjhlUcgrC+lZaUkV0ynpYPfmwMHU8rWIYxTXyO1pvQMWk+NqRe6?=
 =?iso-8859-1?Q?OYtFUMfbpKp3hOicBoJGpoTEng9ZSZu/ZuOJJOv7BCTD6ziAK1lqelB4cO?=
 =?iso-8859-1?Q?XFOgELGYN/m83Gq2/AQVmtS9g5Wm7hKOHcyK8Lt0HrqaAQacU/c42GuqVF?=
 =?iso-8859-1?Q?xpdx7G0N1L7oI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 874f1acb-6e40-4810-6704-08de06f14725
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 05:04:08.3393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dI5SWVWe4LP29FN1WXTGyOFd7cW1KU644vlgXmrYIf8CPYvhaAj9aeVxS8RqW/8q/PkJI1MyCqPYQEzDy4MyUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8758



> From: Alex Benn=E9e <alex.bennee@linaro.org>
> Sent: 08 October 2025 08:29 PM
>=20
> There is no point embedding HTML inside the markdown document. It just
> makes it messy to edit. The boilerplate text is maintained.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Cc: Robin Cover <robin@oasis-open.org>
> ---
>  LICENSE.md | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/LICENSE.md b/LICENSE.md
> index ef558ec..600b966 100644
> --- a/LICENSE.md
> +++ b/LICENSE.md
> @@ -1,7 +1,6 @@
> -<div>
> -<h2>License Terms</h2>
> +License Terms
> +-------------
>
Don't see a reason to change this.
Heading 3 can be using simple, ## ...=20

 [..]

Rest of the conversion to md is good.
Also can you please insert similar patch for README.md as well which also e=
mbeds html?

