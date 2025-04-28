Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D50F126BF7
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745823997; cv=fail; b=IhrxmSzDHeYb2wuxLxJdu4XWsgbjdw3NuYre9zB3Jdp8kzonAS7K2WRcOlSMpJt9mDn47zq8dBJOoqDusj/RjaOyDxYerv89DN29s3U7Vr+QGrd84dtEr7pcyHqiPPPG25rjXdHP9c5b9igUoDO1F1RZUd6w6jn+BEaXDc0VwCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745823997; c=relaxed/simple;
	bh=ZI4KPioSBnxPEz7PHRafoQXVaxHhdjyBwXb+6+17IbE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HaGbM2JaTJth9nWzySkmAKwrlY0ysJMiBnvtnNA4EtPDSStJVizFPQh9ibe7VoPvP8lLbDTMgouhU+A32r+GcxonhG8aM1VXI9IuBw+J0Fit8hkxvyNeZarmosQx/ylEsYsKC6auYY+EnSAtAvcERnbo7Tj4S+gBk8uTobHUFY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HKqqX9Qz; arc=fail smtp.client-ip=40.107.102.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HKqqX9Qz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEb2DWBC3iMhOdnNZfy6U2/MDYpBhctPhQFiJJ49qlXcF3bAG4pM0jU/m+pNJr5SlRCh5W0fhu3iy/8K5P9b4AajVKOo2s07kdhOVnZdn6K42aif7ccBflIfk8CkfMCk+BalwBjzJbPGfc0I0xq9oxdJS0l+N9UR3RfVEnzlWll1YK1U8NnSOv19O9/RPlJVbgZZ3zWb/cxcpHbEzQ+G+HudPFTraqooX4ysyMo9xNjr+8RI5O/DkJTleHEMvnPoFFeyzir398h67kmu/IIJX66he8W2wtn66gZoy3MdfYKiDCFJoZMbHpeecYXQFZnzhHmelargi8HoXfaBgfFR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBGrQFZbflShF2wa1EYL5qkAvsTlp3mTiQS2Sa5pIns=;
 b=qdtNQjoWbTwzMKEBXGSdyk5HmuTlIuSs8fIpmzbS7z5JN5mUirryk38P7dj54TT19VALFiU7ILYXZdzkpIcQ54Xkk/SOH6vgzT0jBk2oUV4diorRd03yH96+Ryr5KJkUUyv+Xs949BK4GLa8Orb/X7EL40+KMMZ3b3amAb0QfeEdnpFIVgEIN5LzM7Ry/D3SlTgFiWoiaIA6u9RF25GQIXriynk7P48FffhW4c+LGIvGOp5gMSkSt1kg9nsJUL03RL6/CoklBjeZcynDuPu/vmlI55rUrXX27OF5P7P4EhlsyO3Oww0E6pSaOrBLDqqKe7AZYQ2lLEBkiBIyNVOOyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBGrQFZbflShF2wa1EYL5qkAvsTlp3mTiQS2Sa5pIns=;
 b=HKqqX9QzLLC4dir4DHHJ7GQ0PutKEwd9XnVnWfdKEdupY0gNIs1L7jC8oOCeRi6O08MfpeVkViyKpyR96OhEUMFAL7vRjDMzrUcS2W3L99useyRfNrkKJg4fsWwR+Itf/VyCAwGBKR2hVA5/FAfLmyjx1qvzxgKQ1/NlR9NCqHCST72gYxMXFL9W5ZjKWGTMRWDE6OUeZW8Pj3kL+luU9lAHnYH8fCCBaxYuGRW5rOFYVZuzT5njv4FLSf7lz6+6kh1UeLyA/lZbLMawcz/ZlVWTZ2foXIU/z04jNIrgVaW1fFoVGmBkiblJZVDjv5+hcrY9hxta+Qe/avkgaVHf4Q==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 07:06:29 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:06:29 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"sma@napatech.com" <sma@napatech.com>, "sburla@marvell.com"
	<sburla@marvell.com>, "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	"jerinj@marvell.com" <jerinj@marvell.com>, "anoobj@marvell.com"
	<anoobj@marvell.com>
Subject: RE: [PATCH RFC v6 1/4] virtio-crypto: Add IPsec service operation and
 Capabilities
Thread-Topic: [PATCH RFC v6 1/4] virtio-crypto: Add IPsec service operation
 and Capabilities
Thread-Index: AQHbtPvCHh4PmFJrvEm2EFfC2CEbQ7O4rhMg
Date: Mon, 28 Apr 2025 07:06:29 +0000
Message-ID:
 <CY8PR12MB719542FC283950B09FEEA945DC812@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250424093046.1927395-1-schalla@marvell.com>
 <20250424093046.1927395-2-schalla@marvell.com>
In-Reply-To: <20250424093046.1927395-2-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB8370:EE_
x-ms-office365-filtering-correlation-id: 5c440a1a-6a92-4fb9-1390-08dd8623331b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?21FEEKpGU5X5s7zZcpnVwqBwm6ltRRdLGLWYPg83guxLTNvP+nleelCfnJLP?=
 =?us-ascii?Q?oT+2IY7gEJT024RI5Gta0ZrQv9Pr2ARMEFJdmbCuBSftF+aefqp5oHkLCV/1?=
 =?us-ascii?Q?ZDXPDop/WmoXPY2pBdK3kT06SoJ1pBOgrgaeGR0ivHfQdKy38ujf/h0tw2Hx?=
 =?us-ascii?Q?Nr2xMIIH/iWu0SCt6Y5n1RkUzzpNkQTKW7sGq2BxmT8hUqi8g5B9F/1MvKIT?=
 =?us-ascii?Q?mPZmSJGqLgwNstLrgevPkuckI//ja6YM/DTrsof5Z9l5wZFJ2gefyEODz3yr?=
 =?us-ascii?Q?ZdD0Su11vhw/QAYl7uEc0UbGI8A1tRFSpDVpSBYV+4Ewcbafbfs0A4hK7FZM?=
 =?us-ascii?Q?aJvnd6jhpkKdd8IS9Ej4uLbGZlKgZSIX+rjFSdIToxD+VXsW29JyxvWmXZO3?=
 =?us-ascii?Q?QVYNwThuWyqrnd8bYuzabi7IEXQFjBgjowSKmnF2qEy853FQfy4vzOm77iRL?=
 =?us-ascii?Q?AFTLQ+fem0s8TaT8JUEUIbeusFWntWlFQOtRAYZp8JY3KX14q8f2JySHYcc4?=
 =?us-ascii?Q?7SFusTd3O1x9EDyltt5M21WZCjkETT5ZhAV2HbEXyPL23KaUAEAcrfFO4F4U?=
 =?us-ascii?Q?hLu1tn7GWYiYpR3XQDpcNlWSVUHCFZYLxFMD+mfqajtQhU6GFzHCCPiJUW8b?=
 =?us-ascii?Q?temWeDBSJwrfh97rHGpQSvbdMLIxTMdOM7NR8a2dNDZi7+t/iabDDdT7+iSY?=
 =?us-ascii?Q?d9VfjlDDsMHMH0JgcvRJOBkgYE6JD5rXabM3HpmVUVCOfLf6AqThIPI5I5w9?=
 =?us-ascii?Q?sP6pZRD8vKpPkDSuuZ3xMzhJrgHsdbKNq8HuJmL4WgrZUlQMB61ATJf1T4a2?=
 =?us-ascii?Q?IJC/8JyE0k299l8dpD9s4sOMx8PR2LDG5TfLMWhphmVcSD+FcR6pyKV7hvMH?=
 =?us-ascii?Q?qx1A4aZtBs9HufnvKSXDgqJejp9pV4tvOpEVKvtrAcgPquVehIy2rDyvPLQf?=
 =?us-ascii?Q?DRSBB4NohUrgsnjPyxXe/QINPkItndYw8EeLLk5cpYKBuJLVanLY6YjfXDHG?=
 =?us-ascii?Q?yCtspx//Ej/liUbjVjhvuFjbH0SqjRghv3XK0By+75Gb2r3AT/sx5KLP8Ijy?=
 =?us-ascii?Q?LBA1IQ3O8/y2fCKNDcx8m7jA6ImJamzcRqqqwxAOlCjSU9/iK1CDF5yTfeeR?=
 =?us-ascii?Q?tojYA4zcL5z37zd1//R1JuU+pT8zu8Zpcm1w3MRtEwQaZnIwn+/IW4tiR0n5?=
 =?us-ascii?Q?Woz0rUo5hzBdq8ie9Q6FV3o6Xjcfyw/L60bmbTSIv7qk15eif3xv3CNDYcBS?=
 =?us-ascii?Q?hCpmykeMNmnDsW71U5U1Ob5Wc9P2phzguIprAGkKvv6+MexKYFnEmyZX19cs?=
 =?us-ascii?Q?fFbnlKW+mTd7zimN6mfQoUpRlCOzg8Yy0JzbLVUfvg00ANYjKVz6y7+mpsTB?=
 =?us-ascii?Q?7ygG0w1u+J0L0CLCt85uTW9+dH5JMexgfPk6VNzlpfMKbdKYUNl2FKjj5GbC?=
 =?us-ascii?Q?mynbFJjTn6s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6qgJM5zvsglbfuPKaOwohNl4HGYy3smNCdTAVfrqeNF6qnMDhWYwT+UtpZX+?=
 =?us-ascii?Q?3yhIyRRl21Ml9ewSwiyAVRiYhW1Rm90ecHnJqO5SnQIIvFZjuJF1vIar0piQ?=
 =?us-ascii?Q?1FV/b9LIZL67574FosVIl4KySlUIi7oR95008+ItzxL7XoZiiPybFzlVTDxM?=
 =?us-ascii?Q?mxlV85onoz99P3kWa/BopT183qCUok8mKFaC+XoqbjgNdcWHIje5o4uiHWUI?=
 =?us-ascii?Q?tBYvNWZKrFFhA1MH8wcHPx14uohQ/eL+ki8B7UQ3UWatbf31xVsdyvdi1tr6?=
 =?us-ascii?Q?cLG3RqhAlVYoKKPNXQTJrsgiywR6VvQUc6kIwxbZtfkRYL1kN3MgAu1uOGZo?=
 =?us-ascii?Q?l1IYz1hSHXK7N2HA9qcryouIgMIkaGEZ8okeH2Eoa6JA7RFrWhCxrUNHW8Jv?=
 =?us-ascii?Q?KC0IhcdbXcZm5zTv1EzDdv4Bh7gtsWONXSsFtp5y5YpRDCOfSUIbrIUttaei?=
 =?us-ascii?Q?bGNnZthHVL3qNZ+or9fh/CmtIEKCmvjq+eul+2JQmjoutRhdFPDuipJAJ+Ca?=
 =?us-ascii?Q?TgqLY5m2RWINXEzQlCt4UrUSHnI2bWrGwmCc9yAS2QDvoDoqgFpG58TFwtWF?=
 =?us-ascii?Q?1QGWpvdoaEtOgDkDpuXY7UowsQ2TdHA4xSj577K5QYoVZwTJ6KJlhEVdLDWT?=
 =?us-ascii?Q?zknv5DiRx9BjOTBVkI1gKaWW0e285Obhn7oftagrubCj0sW32F+YyJHDbbRv?=
 =?us-ascii?Q?uCU7N9cztXFs6QSNzEXvceIAnsxKqvLUuOouFw8L/PpPwgWEnn1tLsuk1JRe?=
 =?us-ascii?Q?DSByGb+Jjn/lejEuRNsmbG7ml+MZBUdv8lMVAu4X1nppUQB4T5EWwy69xtCn?=
 =?us-ascii?Q?n8w7iE6E9YHScFuwcYGEHAkj96Z8OiNMmtPR/7KgXkx6/BaG64jkGbUfb+Ur?=
 =?us-ascii?Q?1406InYdyTcm8GMmV+iuRXrjS0smI8az8XOh3ok4E7fnGSk0DjUfIxKaN5xe?=
 =?us-ascii?Q?VtTHhDOuxMvQwHkX25jOlRFahURlh1UmlcFHfF1+xT9EKm+GuajHBay8yiRX?=
 =?us-ascii?Q?8XjHSQ20fdlND0Ra83G6oj4a9/SvsQh8fxn3MxI7QJcOG8Ma0TeCoK8QiH5W?=
 =?us-ascii?Q?9pclqwxxFUVHF3iLcUBKQKAfuy4/BLu4hf++7ebPh9LazfFyt5BDONmUC4Bq?=
 =?us-ascii?Q?KWH7c3P6YCQsgkcsX6VDRf6OwWzhOXdF8EghQ8wWAfhXCUXwr3orgjziMbyG?=
 =?us-ascii?Q?1cm3i05JbP0iiaRhncX6Yox1GIE1L8qXrXLwTmrwIp98Z0xnIExStnZ2HJ1W?=
 =?us-ascii?Q?FQYIvdvbVW5B/IPa0+GmTgCcvZioRiS8RCVGBj1ZR40Cujd8C5TC7glPL8pv?=
 =?us-ascii?Q?nABNJXpvDY/OnfB5C+rdBZiYWe+bJ6lHA6TYCafFR0Cjr4dAqmsfsVYwbmDH?=
 =?us-ascii?Q?G5o8X6twmkKrvZutFyEF0OouYKfA8gDGAGAdc2JtBv6hzXXLXwCf7dX2pUf/?=
 =?us-ascii?Q?kLS+oFiEF9W9pSjpmwvNmDYHTEWgZav8eyPhjHatKwC5PA+eQyvXGvFKJMpm?=
 =?us-ascii?Q?ZXq6qv7yY8x8F1v3rKP5yOjwPg+/3zb+CG9kg1S1mReMcfzRtjbydOrGlm7D?=
 =?us-ascii?Q?iCnGRr2pX3Ga2LPkNsI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c440a1a-6a92-4fb9-1390-08dd8623331b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 07:06:29.5141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3HZjqj9A2MOtqfdITXyn3Nzs84mFQeYesSsgk2te8TiTHtta62n+MTB4pfYmDQ2+3w0LD4lHnBwuBwUHLh/pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370


> From: Srujana Challa <schalla@marvell.com>
> Sent: Thursday, April 24, 2025 3:01 PM
>=20
> This commit introduces the IPsec service operation to the Crypto device,
> enabling offloading of IPsec processing.
>=20
> Capabilities:
>=20
> 1. IPsec Resource Capability (VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP):
>    Indicates the device's IPsec resource limits, such as the number of
>    outbound and inbound Security Associations (SAs).
> 2. IPsec SA Capability (VIRTIO_CRYPTO_IPSEC_SA_CAP): Specifies the
>    supported IPsec modes, along with the supported cryptographic
>    algorithms, authentication algorithms, IPsec options and
>    anti-replay window size.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex | 174 +++++++++++++++++++++++++++-
>  introduction.tex                    |  12 ++
>  2 files changed, 181 insertions(+), 5 deletions(-)
>=20
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index e053cc7..f4978f0 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -2,13 +2,15 @@ \section{Crypto Device}\label{sec:Device Types / Crypto
> Device}
>=20
>  The virtio crypto device is a virtual cryptography device as well as a  =
virtual
> cryptographic accelerator. The virtio crypto device provides the -followi=
ng
> crypto services: CIPHER, MAC, HASH, AEAD and AKCIPHER. Virtio crypto -
> devices have a single control queue and at least one data queue. Crypto -
> operation requests are placed into a data queue, and serviced by the -dev=
ice.
> Some crypto operation requests are only valid in the context of a -sessio=
n.
> The role of the control queue is facilitating control operation
> +following crypto services: CIPHER, MAC, HASH, AEAD, AKCIPHER and IPSEC.
> +Virtio crypto devices have a single control queue and at least one data
> +queue. Crypto operation requests are placed into a data queue, and
> +serviced by the device. Some crypto operation requests are only valid
> +in the context of a session. The role of the control queue is
> +facilitating control operation
>  requests. Sessions management is realized with control operation  reques=
ts.
> +The crypto device may have administration command interface through
> +which IPsec service capabilities and resources are configured.
>=20
>  \subsection{Device ID}\label{sec:Device Types / Crypto Device / Device I=
D}
>=20
> @@ -72,6 +74,8 @@ \subsection{Supported crypto services}\label{sec:Device
> Types / Crypto Device /
>  #define VIRTIO_CRYPTO_SERVICE_AEAD   3
>  /* AKCIPHER (Asymmetric Key Cipher) service */  #define
> VIRTIO_CRYPTO_SERVICE_AKCIPHER 4
> +/* IPSEC service */
> +#define VIRTIO_CRYPTO_SERVICE_IPSEC  5
>  \end{lstlisting}
>=20
>  The above constants designate bits used to indicate the which of crypto
> services are @@ -318,6 +322,20 @@ \subsection{Device
> Initialization}\label{sec:Device Types / Crypto Device / Devi  \item The =
driver
> MUST read the supported algorithms based on \field{crypto_services} field=
.
>  \end{itemize*}
>=20
> +\subsection{Device and driver capabilities}\label{sec:Device Types /
> +Crypto Device / Device and driver capabilities}
> +
> +The crypto device has the following capabilities.
> +
> +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline Identifier & Name &
> +Description \\ \hline \hline
> +0x0800 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-RESOURCE-
> CAP]{VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP} &
> +IPsec resource capability \\ \hline
> +0x0801 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_CRYPTO_IPSEC_SA_CAP} & IPsec
> +Security Association(SA) capability \\ \hline \end{tabularx}
> +
>  \subsection{Device Operation}\label{sec:Device Types / Crypto Device /
> Device Operation}
>=20
>  The operation of a virtio crypto device is driven by requests placed on =
the
> virtqueues.
> @@ -1872,3 +1890,149 @@ \subsubsection{AKCIPHER Service
> Operation}\label{sec:Device Types / Crypto Devic  \item VIRTIO_CRYPTO_ERR
> if any failure not mentioned above occurs.
>  \end{itemize*}
>  \end{itemize*}
> +
> +\subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto
> +Device / Device Operation / IPSEC Service Operation}
> +
> +A crypto device can support the processing of IPsec protocol operations.
> +In addition to standard crypto processing, the IPsec protocol
> +operations are also handled by the crypto device as a lookaside operatio=
n.
> +
> +IPsec Inbound processing: The device performs decryption,
> +authentication, integrity checking and remove additional headers,
> +including tunnel header if in tunnel mode, as well as the ESP/AH header =
on
> the given packet(See \hyperref[intro:IPSEC]{IPSEC} RFC).
> +The resulting packet contains only the plain data.
> +
> +IPsec Outbound processing: The device performs encryption, attach ICV,
> +update/add IP header and add ESP/AH header/trailer. The resulting
> +packet contains encrypted data along with the IPsec header and trailer.
> +
> +A crypto device can support number of IPsec SAs, allowing it to manage
> +multiple secure connections simultaneously.
> +
> +The device and the driver indicate IPsec SA resource limits using the
> +VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability specifying the limits on
> +the number of IPsec outbound and inbound SA resource objects.
> +The VIRTIO_CRYPTO_IPSEC_SA_CAP capability  specifies the IPsec protocol
> +capabilities supported by the device. The driver indicates the IPsec
> +parameters by setting VIRTIO_CRYPTO_IPSEC_SA_CAP capability prior to
> adding any resource object.
> +
> +The driver controls the IPsec SA resource object using administration
> +commands described in \ref{sec:Basic Facilities of a Virtio Device / Dev=
ice
> groups / Group administration commands / Device resource objects}.
> +
> +\paragraph{Device and driver capabilities} \label{par:Device Types /
> +Crypto Device / Device Operation / IPsec Service Operation / Device and
> +driver capabilities}
> +
> +\subparagraph{VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP}
> +
> +The VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability indicates the IPsec SA
> resource limits.
> +\field{cap_specific_data} is in the format \field{struct
> +virtio_crypto_ipsec_resource_cap}.
> +
> +\begin{lstlisting}
> +struct virtio_crypto_ipsec_resource_cap {
> +        le32 inb_sa_limit;
> +        le32 outb_sa_limit;
> +};
> +\end{lstlisting}
> +
> +\field{inb_sa_limit}, and \field{outb_sa_limit} denote the maximum
> +number of IPsec security Associations (SAs) that can be utilized for
> +IPsec inbound and outbound processing, respectively, which the device is
> capable of creating.
> +
> +\subparagraph{VIRTIO_CRYPTO_IPSEC_SA_CAP}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP}
> +
> +The VIRTIO_CRYPTO_IPSEC_SA_CAP capability lists the supported IPsec
> +modes along with the supported cryptographic, authentication algorithms
> +and anti-replay window size for each IPsec mode.
> +\field{cap_specific_data} is in the format \field{struct
> virtio_crypto_ipsec_sa_cap_data}.
> +
> +\begin{lstlisting}[label=3D{lst:Device Types / Crypto Device / Device
> +Operation / IPsec Service Operation / Device and driver capabilities / V=
IRTIO-
> CRYPTO-IPSEC-SA-CAP / virtio-crypto-ipsec-mode-cap}] struct
> virtio_crypto_ipsec_mode_cap {
> +        u8 mode;
> +        u8 reserved[3];
> +        le32 max_replay_win_sz;
> +        le32 options;
> +        le32 reserved1;
> +        le64 cipher_algo;
> +        le64 hmac_algo;
> +        le32 aead_algo;
> +        le32 max_cipher_key_len;
> +        le32 max_auth_key_len;
> +};
> +
> +struct virtio_crypto_ipsec_sa_cap_data {
> +        u8 count;
> +        u8 reserved[7];
> +        struct virtio_crypto_ipsec_mode_cap cap_mode[]; };
> +\end{lstlisting}
> +
> +\field{count} indicates number of valid entries in the \field{mode} arra=
y.
> +\field{cap_mode[]} is an array of supported IPsec modes. Within each arr=
ay
> entry:
> +
> +\field{mode} specifies the IPsec mode, as defined in table
> +\ref{table:Device Types / Crypto Device / Device Operation / IPsec Servi=
ce
> Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP /
> IPsec Modes}.
> +\field{max_replay_win_sz} specifies the maximum anti-replay window size
> the device supports.
> +This field is applicable only for inbound operation.
> +
> +\field{options} Each bit indicates the IPsec protocol options supported
> +by the device, as defined in table \ref{table:Device Types / Crypto Devi=
ce /
> Device Operation / IPsec Service Operation / Device and driver capabiliti=
es /
> VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}.
> +
> +\field{cipher_algo} CIPHER algorithms mask, see \ref{sec:Device Types /
> Crypto Device / Supported crypto services  / CIPHER services}.
> +
> +\field{hmac_algo} HMAC algorithms mask, see \ref{sec:Device Types /
> Crypto Device / Supported crypto services  / MAC services}.
> +
> +\field{aead_algo} AEAD algorithms mask, see \ref{sec:Device Types / Cryp=
to
> Device / Supported crypto services  / AEAD services}.
> +
> +\field{max_cipher_key_len} is the maximum length of cipher key supported
> by the device.
> +
> +\field{max_auth_key_len} is the maximum length of authentication key
> supported by the device.
> +
> +\begin{table}[H]
> +\caption{IPsec Modes}
> +\label{table:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes} \begin{tabularx}{\textwidth}{
> +|l|X|X| } \hline Type & Name & Description \\ \hline \hline
> +0x0 & - & Reserved \\
> +\hline
> +0x1 & VIRTIO_CRYPTO_IPSEC_MODE_ESP_TUNNEL & IPsec ESP protocol in
> +tunnel mode \\ \hline
> +0x2 & VIRTIO_CRYPTO_IPSEC_MODE_ESP_TRANSPORT & IPsec ESP protocol
> in
> +transport mode \\ \hline
> +0x3 & VIRTIO_CRYPTO_IPSEC_MODE_AH_TUNNEL & IPsec AH protocol in
> tunnel
> +mode \\ \hline
> +0x4 & VIRTIO_CRYPTO_IPSEC_MODE_AH_TRANSPORT & IPsec AH protocol
> in
> +transport mode \\ \hline \end{tabularx} \end{table}
> +
> +See \hyperref[intro:IPSEC]{IPSEC} for more information on tunnel and
> transport modes in ESP/AH IPsec processing.
> +
> +\begin{table}[H]
> +\caption{IPsec Options}
> +\label{table:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}
> +\begin{tabularx}{\textwidth}{ |l|X|X| } \hline Bit Number & Name &
> +Description \\ \hline \hline
> +0 & VIRTIO_CRYPTO_IPSEC_ESN & Specifies whether extended sequence
> +number is supported, as described in \hyperref[intro:ESN]{ESN}\\ \hline
> +1 & VIRTIO_CRYPTO_IPSEC_UDP_ENCAP & Specifies whether udp
> encapsulation is supported, as described in
> +
> +\hyperref[intro:UDP-Encapsulation]{UDP Encapsulation}, applicable only
> +for ESP IPsec processing \\ \hline
> +2 & VIRTIO_CRYPTO_IPSEC_COPY_DSCP & Specifies whether copy dscp is
> +supported, as described in \hyperref[intro:IPSEC]{IPSEC} \\ \hline
> +3 & VIRTIO_CRYPTO_IPSEC_DEC_TTL & Specifies whether decrementing the
> +time to live is supported, as described in
> +\hyperref[intro:IPSEC]{IPSEC} \\ \hline
> +4 & VIRTIO_CRYPTO_IPSEC_COPY_DF & Specifies whether copy Don't
> Fragment
> +bit is supported, as described in \hyperref[intro:IPSEC]{IPSEC} \\
> +\hline
> +5 & VIRTIO_CRYPTO_IPSEC_ECN & Specifies whether copy Explicit
> +Congestion Notification is supported, as described in
> +\hyperref[intro:IPSEC]{IPSEC} \\ \hline
> +6 & VIRTIO_CRYPTO_IPSEC_SA_LIFETIME & Specifies whether SA lifetime
> +feature is supported, as described in \hyperref[intro:IPSEC]{IPSEC} \\
> +\hline \end{tabularx} \end{table}
> diff --git a/introduction.tex b/introduction.tex index e60298a..80aa67a 1=
00644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -162,6 +162,18 @@ \section{Normative References}\label{sec:Normative
> References}
>  	\phantomsection\label{intro:TCP-Header-Format}\textbf{[TCP Header
> Format]} &
>      TCP Header Format
>=20
> 	\newline\url{https://nam11.safelinks.protection.outlook.com/?url=3Dhtt
> ps%3A%2F%2Fwww.rfc-editor.org%2Frfc%2Frfc9293%23name-header-
> format&data=3D05%7C02%7Cparav%40nvidia.com%7C3b8e54c5374348fbea170
> 8dd8312e037%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C63881
> 0839328325483%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydW
> UsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%
> 3D%7C0%7C%7C%7C&sdata=3DknNerVkUCIQXzImA9o0526SQ6auhXYeD4RsOzrq
> asJ0%3D&reserved=3D0}\\
> +	\phantomsection\label{intro:IPSEC}\textbf{[IPSEC]} &
> +    IPsec Protocol
> +
> 	\newline\url{https://nam11.safelinks.protection.outlook.com/?url=3Dhtt
> ps%3A%2F%2Fwww.rfc-
> editor.org%2Frfc%2Frfc4301&data=3D05%7C02%7Cparav%40nvidia.com%7C3b8
> e54c5374348fbea1708dd8312e037%7C43083d15727340c1b7db39efd9ccc17a
> %7C0%7C0%7C638810839328345601%7CUnknown%7CTWFpbGZsb3d8eyJFb
> XB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWF
> pbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dpt1JOEttI%2Bojz%2FdtElW
> Zu9e6%2BA276TM27Ouz%2Berpsq0%3D&reserved=3D0}\\
> +	\phantomsection\label{intro:ESP}\textbf{[ESP]} &
> +    IPsec ESP
> +
> 	\newline\url{https://nam11.safelinks.protection.outlook.com/?url=3Dhtt
> ps%3A%2F%2Fwww.rfc-
> editor.org%2Frfc%2Frfc4303&data=3D05%7C02%7Cparav%40nvidia.com%7C3b8
> e54c5374348fbea1708dd8312e037%7C43083d15727340c1b7db39efd9ccc17a
> %7C0%7C0%7C638810839328358078%7CUnknown%7CTWFpbGZsb3d8eyJFb
> XB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWF
> pbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DpH93zkAjlMdk2m5YVAtu5
> xPmfHE5x%2BlEFupefu1Y5Xk%3D&reserved=3D0}\\
> +	\phantomsection\label{intro:ESN}\textbf{[ESN]} &
> +    IPsec ESN
> +
> 	\newline\url{https://nam11.safelinks.protection.outlook.com/?url=3Dhtt
> ps%3A%2F%2Fwww.rfc-
> editor.org%2Frfc%2Frfc4304&data=3D05%7C02%7Cparav%40nvidia.com%7C3b8
> e54c5374348fbea1708dd8312e037%7C43083d15727340c1b7db39efd9ccc17a
> %7C0%7C0%7C638810839328370013%7CUnknown%7CTWFpbGZsb3d8eyJFb
> XB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWF
> pbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dgo5pd86ZwdMI9hZIqxcYc
> RVDEQo97prGrV%2FLgl%2B49H0%3D&reserved=3D0}\\
> +	\phantomsection\label{intro:UDP-Encapsulation}\textbf{[UDP
> Encapsulation]} &
> +    IPsec UDP Encapsulation
> +
> +\newline\url{https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%
> +3A%2F%2Fwww.rfc-
> editor.org%2Frfc%2Frfc3948&data=3D05%7C02%7Cparav%40nvidi
> +a.com%7C3b8e54c5374348fbea1708dd8312e037%7C43083d15727340c1b7d
> b39efd9cc
> +c17a%7C0%7C0%7C638810839328381738%7CUnknown%7CTWFpbGZsb3d8
> eyJFbXB0eU1hc
> +GkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIld
> UIjoy
> +fQ%3D%3D%7C0%7C%7C%7C&sdata=3DKklJ0Qbwszyi3yRXMW77sz7YkiJN76Gtt
> Y7Xetxncto
> +%3D&reserved=3D0}\\
>  	\phantomsection\label{intro:CAN}\textbf{[CAN]} &
>      ISO 11898-1:2015 Road vehicles -- Controller area network (CAN) -- P=
art 1:
> Data link layer and physical signalling\\
>  	\phantomsection\label{intro:rfc8174}\textbf{[RFC8174]} &
> --
> 2.25.1

Reviewed-by: Parav Pandit <parav@nvidia.com>
