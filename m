Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ED825C6F4
	for <virtio-comment@lists.linux.dev>; Mon, 10 Feb 2025 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216828; cv=fail; b=exjKEe7Spi6UqpvqD72iHf+V71ndLOetNHrGsAe2tJmC2tkkBHXDbDD8exvjOIDKLT+7JcQr+BlgSCN/4ZyGR0Cn6IOX64k6NM7jMwCk8CPDZXnj2i0lG2362Nk4Y+6cxIcnY1l3ClunbzZtGOhdXQE7QWFYtBEL4GnxStD59BM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216828; c=relaxed/simple;
	bh=MIY7rKl51L2YmbKniEOutyblh3XYWwWQlpLXVKjPB78=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QOndENHvz8tJNlaY7Aap/NtEDgUT6QW2Qs+pHWU0PnL8jNZtzmcU2Su2Cxj1EWueEFjwzoIxDFGP1E3hbCt8AaDKRLFokL1mtiNikpW9q7jdkwZUyd2AYNrVtRuvx1yCrh5NmQyBwtZRvH5drDmYagVcfNzfjxqubaAqVm4sZf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iWYK96Ew; arc=fail smtp.client-ip=40.107.223.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iWYK96Ew"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7Tj/iYCdakcHFqTfS6xagn5ol+DCOzCdhTqo9RRICNsroDCFWaDDHWjOe7F/XkEYg//DforuyoVl/eH95t/8U5AZqHL3sqAnbeH4ABP2EBQwnVyeoVCMJ91P8lYWTGgX+9Q/3WfWebkjNrZYxGJzGYaYLQsVwU6jpy9IaaDQqJyq0X1mlJxepRzLwJ3p5B8byMTn1Mo/gNwg7rywILxD5KAMJjtaVYBQeT3lc2JwKJUrvmzfh8vGyri2TC1UgaKQJukDgVHCVWO8/Xe0aFXrz/ZEEbGZJthrfwZ16v8HvQOdi4FRAsX+NYZJZtcyFI5TqSrNsM6sRb7AoAc/ciQHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwIw0nRkk76pLCvfNpVO1YvZ2HmifwsNufB2/mDM1qs=;
 b=yGmJGnFOEsRzOzvyWepC1gnvL4gRObQ1pxKvtyRwnkVyN05jd9N8WpbwnSurujl0dWTgfyTLRSGJhup7BG9w70k9Kx9bAPb/h016OEk3ps9jdT3Fut2osbSjpatWxcmjBSX2xwpHqY8ysCfm91RDG2dSGILDnF67TRJsFhvcJMPOQ9bA5zGWbKPGcGNmU2NSOdlyDXT4XgRcvliAucw64oxC1wZ/CzYI/GNEQ1cxwQYCBUlFBA/MJYF5phPPBs2ppZ4ZVhVaG/JNzKwtyT+bZT++IDqLCpKltG8PCDB1USKBdaBTbO6LFxkvKbzDfR2U8SmtEGU66iVH2dS63qqJZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwIw0nRkk76pLCvfNpVO1YvZ2HmifwsNufB2/mDM1qs=;
 b=iWYK96Ew/1mcB0UysKapq6YN4Q2LM0g3h984F4kfTV0pdgKuGR0NVaQf6H0mFgAiKj4o7ArnLV+UQf2ErIJTpBHDijs12EDxufBCukzyhmPXGr+YX8GqdgAzJ4dJ7jRV46XhEsWQt6F3UlRRXTNDmODLIZfgFv6GGi7KU/Qj4WYAXT66BqDUr8o9mw+6oxFV41JHaXx2zPJeEOmgSAUbyq0ozv8L3PDal1Ib0Mnqr4Ro/CF9woKe2FU9HwS1ozh/rtZg3ythtYhvdtlfw/Zhkg/cgTmzz2P76cO+uJjR6VAvE167zDLtdtQ28ShNh2FT5IF3amMf2JHyWzs1/3v3HQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA1PR12MB6283.namprd12.prod.outlook.com (2603:10b6:208:3e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 19:47:03 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 19:47:03 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"anoobj@marvell.com" <anoobj@marvell.com>
Subject: RE: [PATCH RFC v3 4/4] virtio-crypto: Add device and driver
 requirements for IPsec operation
Thread-Topic: [PATCH RFC v3 4/4] virtio-crypto: Add device and driver
 requirements for IPsec operation
Thread-Index: AQHbbJVQllZV8OIcZEmBMV6oxBwCO7NBD2SQ
Date: Mon, 10 Feb 2025 19:47:03 +0000
Message-ID:
 <CY8PR12MB7195D90A5D7DB3B97CD135B4DCF22@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250122061644.266560-1-schalla@marvell.com>
 <20250122061644.266560-5-schalla@marvell.com>
In-Reply-To: <20250122061644.266560-5-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA1PR12MB6283:EE_
x-ms-office365-filtering-correlation-id: c8175942-9818-4dce-3a46-08dd4a0bb12a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4hVAUyzpFEG3sJnr3FDtZeGfCyRV31cZ9V6Is0AFk4d9rMYMRtjoRUtymW9/?=
 =?us-ascii?Q?zR9LSnbSKtxp5D1PIujoUeuNedl9osMQ4DD1jlUS1z7MkxUGvNdHc9a0ob6i?=
 =?us-ascii?Q?h4ulyVwnDtxUL2JYnR+MyYKLKpZO0iRvEMjhLk5TSDopOWWA6BDHS3hA9PBr?=
 =?us-ascii?Q?rm1FqvBHaeXryCjfj7hHhRPLtoLkX9ZZvf1cLIssNu/Utg23AmerFsjzMt0m?=
 =?us-ascii?Q?JUtEFyrcygMuP7Z1nSCocffl5LDQsRFGBc0SOB/z/RTmvtk9novr4Sp0sT+e?=
 =?us-ascii?Q?oBata0an3tMmGR+6sFTbMg1E1yq0EbsbyPCXOu8ff+Rg+WxTc+aq7Saj/HM/?=
 =?us-ascii?Q?nQV3FiJ8CPZ80pGlOMvZ/pxjmngBoQRkt1XB9QKV64YyWrzcvmJ/n2Z91oP2?=
 =?us-ascii?Q?B9IMo5upMLgqftW0bnue2gfUIBr734DAZnRsHutMmUk5LbQJSZUwL9/uhG53?=
 =?us-ascii?Q?zytvfWPjY/DW+I2Ag0mcYQ73n3v1chMYK+x7CmKGauxien3vN270BlWKu52P?=
 =?us-ascii?Q?V96/WsnpM3my+3dCja4z4EE/Jb8YjwRwbCdL7WHAJOYBzf3W8FAZalrn2K1b?=
 =?us-ascii?Q?cByzM8niNQb7ZRk626ACBxcSdJLgmgOkk6utFMJ0YSNzMVLmp8JVZtQzM9PS?=
 =?us-ascii?Q?SqygaPulBLW+MJvEie/StvvFnhRsDBJTXTVaB6Q0sY6671cWzLHfkEelRO8Y?=
 =?us-ascii?Q?0i1tPW8QhnPn0e6De7S+OkP988agzguMFIx+DgDaD3bzHurrDOja2BUNaNWt?=
 =?us-ascii?Q?jghpog/C1KjF7SBGJVdxGZlfA8V8INDCol7sxCoVoUExc2VaDY6n3ANA9vpL?=
 =?us-ascii?Q?UGmR2JovdrKEdiYxfzSKdfbwthldcubNkXNGZ+14B+8qCACarv8lZq+TVBL/?=
 =?us-ascii?Q?UGNeqFkk+Gm/NR+cRuIp5kN4bwrs8m3qtXunMXCb9eQGeoFtpmhSZn4jY2De?=
 =?us-ascii?Q?gGv59D0kf1IZeBUQ98j2P4mx90YN6sq8HvJZ568+ekt71d5bbxJjow0JxZv6?=
 =?us-ascii?Q?44lzxKkuEmxAXXwySy50JZvgHgI1cLk5Mo9r+TSBONh/BeTuLIsJmtgaK/NA?=
 =?us-ascii?Q?xSt3yNbvSch1HpJ+l0ad5JUfLtbljhd1lkYRypiGaZHQofF+iGX2EDGNNmzy?=
 =?us-ascii?Q?jqCQWlDoFosGWcyXO4igSBr70gzw3hlcGEeLN40vNGl5k4c291eXUVEo7C/o?=
 =?us-ascii?Q?nfmpzalEXjM0S3hrkLNnAM2OBzO/xkEpWAexUxs5wHItaXg+mpogJGrYZaKg?=
 =?us-ascii?Q?SfHNhWyWqmhfpJoePab9g5Why8cgHELGFFDgw7ripQ4vywGgokJChv5VuVSV?=
 =?us-ascii?Q?MVnIQ9mo9NKEg/WK806VjlIvK+luvK+GXjirAz1SZupFhOEhtrdFhpKn7Euf?=
 =?us-ascii?Q?BbR8d0gwAVCXFY0BzNYePINpmCtdzhCfmB5uaKbetoZKLa2QWVCWlMb/AGbu?=
 =?us-ascii?Q?4mPqykvLuDJQKgK7lwfDHwTZTCjbb8y+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rbT9iPUpspHXEDuati6wz5jYr4r7tGmx3R40g5c/Y1MZwsf3LscL1AGFlbfg?=
 =?us-ascii?Q?JwN8KbijGeGmqo0Xc6QsP5d+gMYEcCoxajHZImagt3OOWcp9WW+qRk+aP2LC?=
 =?us-ascii?Q?CVjZmknDokS0D/6uZaKuDtOyVjtrzuou5mVwYLcCHxG6pJ7qbk7wXfZ2NYD0?=
 =?us-ascii?Q?GmTipd06JiWL8FBldEA+Z3l343ew2Hrnr7OThZM3lLlwFbYu0uK00JbPDP2f?=
 =?us-ascii?Q?UDgzmOwB8/JTYJrLrF6EzeE+J+XZQgojZuDOxQTE7f/lvK7MHgGP3e4/wg8l?=
 =?us-ascii?Q?DG217BPjSfmbg/9Fymkoyw6wq3ubgPP5mENVS+PUMo86ECnYvoQY43phF3r0?=
 =?us-ascii?Q?ryTFtw+Quey6f7OB0bM38k3kIViy5q14GBH7v/B3+fCZRP9/vII452JCPobk?=
 =?us-ascii?Q?+fyJD07Uodsp7lLfoC0iBHEYvAmG0oo+W8Ah0v0YLLUaKf55xfVXegMhrMBU?=
 =?us-ascii?Q?57zNrYboqHoNjULI0COQ2v2XdG2vZJGB5hIoeoDA7CgiF2qGWpd8dkfPCfvt?=
 =?us-ascii?Q?47M9rkgrMsMuaRg58rhEi96g0Mb2sp3dfuXip+kACey23/xfRhJ6yajeLxoU?=
 =?us-ascii?Q?2WYMl/SD17yubhw99plP4SUDbXzeTenKiW0Ka733GRLvlucnNKcDYf78ZCMN?=
 =?us-ascii?Q?eNClozXu8yo8oLpfLhdLc5WwbwB2wWcjxKBoHeGZtcaSuk2cfmZrIsoaMmrU?=
 =?us-ascii?Q?1txRaJoG2WoCuMQdgj0OTai/GDFrF2MaNZkIxYrTNoozJXQ5Qx85O8n64x06?=
 =?us-ascii?Q?k78NLI7rM52GG2LkFvhw84ENJoxCEVE+Is6+gZPODqA/gUgUd5EKKL3meD7e?=
 =?us-ascii?Q?/FaUoztkiEidfuLtaMBgdhKiGKASdKmoDTvr0ze0JWn6NZJOjekrv02Gq07w?=
 =?us-ascii?Q?2m2NZSzOQq0lMUpHoJpfKHiXzK7vw67PiKyEHxztm8kv8BAv+1SCNj8eobZr?=
 =?us-ascii?Q?0myHC7cmckBySFLVPC2aL9shlOWsRZBh1kQid0Jzd3kodXIO2KSYehyLFYGM?=
 =?us-ascii?Q?b88UR+ZdCUR+uHGi3ASjBOPDrm2ikMFsObTU3l6t3ySz+8LB6+4mVDhbr9Wp?=
 =?us-ascii?Q?LfkbMlyNWPLkcl1bMZeu6aPfsc93ysLpRUuAJmA8ySvZvutTvi1pLR5wVFdK?=
 =?us-ascii?Q?Vb58u/06CdRTwgEVsidTwoBJB0ItC6txoS6kpTgVHIwiAdv73vdNwmFtoAro?=
 =?us-ascii?Q?o6FFowKZWrPbXffRoGhPNc+V4kl8ycTqb1xn1TuId9Bcm83Oy8vmhgwRqabf?=
 =?us-ascii?Q?w+GxvovmDbPcL/SK1ovJPoafXlTgd5+furGk5fdvtILwKsrwuG4xfK0xHwSl?=
 =?us-ascii?Q?dgwC1gsP93+J2E2OdHjEu/q7BUJ9zCj59iX2w5xTDHxYsPgerkRFfwRqU7v2?=
 =?us-ascii?Q?ACi0e0k6G6erouxMghcoyxrjjMDUbfVZd28x3X3YhQurY7q5wrXgD3map47s?=
 =?us-ascii?Q?5H51QnUJ0BdmYsxtuiDowPAnKm0WngR5rbDfaeSUCupBtZZ0XV31iWkQd1WC?=
 =?us-ascii?Q?2IgYdnGygtkmlMwRFQHogUL6xqKqLRGLLlkx9CNhvZeyQ8PVo2TICY6QLJ5C?=
 =?us-ascii?Q?/W/CbFrZlXVcskVAsYo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c8175942-9818-4dce-3a46-08dd4a0bb12a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 19:47:03.3497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yx/HgGqBREfVqLTbuIybgO8dDPOm7+p+DSF+Jwx9lW1OriCk/zABNBCGqm43zhJXdaRKf88BOzzFTdkJ7B81ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6283



> From: Srujana Challa <schalla@marvell.com>
> Sent: Wednesday, January 22, 2025 11:47 AM
>=20
> Add device and driver requirements for IPsec Operation.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex        | 95 ++++++++++++++++++++++
>  device-types/crypto/device-conformance.tex |  1 +  device-
> types/crypto/driver-conformance.tex |  1 +
>  3 files changed, 97 insertions(+)
>=20
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index cf5de23..845a3e4 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -2253,3 +2253,98 @@ \subsubsection{IPSEC Service
> Operation}\label{sec:Device Types / Crypto Device /  \field{src_data_len}=
 is
> the length of source data.
>  \field{dst_result} is the result plain IP packet and  \field{dst_data_le=
n} is the
> length of it.
> +
> +\devicenormative{\paragraph}{IPsec Service Operation}{Device Types /
> +Crypto Device / Device Operation / IPsec Service Operation}
> +
> +When the device supports IPsec operations, \begin{itemize} \item the
> +device MUST set VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP,
> +VIRTIO_CRYPTO_IPSEC_SA_CAP capability in the \field{supported_caps} in
> the command VIRTIO_ADMIN_CMD_CAP_SUPPORT_QUERY.
> +\item the device MUST support the administration commands
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY,
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY for the resource types
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA and
> VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA.
> +\end{itemize}
> +
> +When any of the VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP or
> +VIRTIO_CRYPTO_IPSEC_SA_CAP capability is disabled, the device MUST set
> +\field{status} to VIRTIO_ADMIN_STATUS_Q_INVALID_OPCODE for the
> commands
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY,
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
> +and VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY for the resource types
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA and
> VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA.
> +
> +The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_EEXIST for
> +the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE when the
> resource
> +\field{type} is VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA or
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA,
> +if the object already exists with the supplied \field{id}.
> +
> +The device MUST fail the command
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> +with the \field{status} set to VIRTIO_ADMIN_STATUS_EINVAL, for the
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA object if,
> \begin{itemize}
> +\item \field{id} is greater than or equal to \field{outb_sa_limit}.
> +\item the supplied SA parameters, such as mode, options, cipher and
> authentication
> +      algorithms are not supported in the capabitlity
> VIRTIO_CRYPTO_IPSEC_SA_CAP.
> +\end{itemize}
> +
> +The device MUST fail the command
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> +with the \field{status} set to VIRTIO_ADMIN_STATUS_EINVAL, for the
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA object if,
> \begin{itemize}
> +\item \field{id} is greater than or equal to \field{inb_sa_limit}.
> +\item the supplied SA parameters, such as mode, options, cipher and
> authentication
> +      algorithms are not supported in the capabitlity
> VIRTIO_CRYPTO_IPSEC_SA_CAP.
> +\end{itemize}
> +
> +The device SHOULD maintain a table for subsequent lookups for
> +inbound/outbound data processing with the corresponding SA based on the
> supplied \field{id}.
> +
> +The device MUST allow recreating the resource objects using the command
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE which was previously
> destroyed
> +using the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY
> respectively
> +without undergoing a device reset.
> +
> +The device MAY fail the command
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> +with the \field{status} set to VIRTIO_ADMIN_STATUS_EINVAL for the
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA or
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA
> +commands if the resource object with the same \field{spi} already exists=
.
> +
> +On device reset, the device MUST destroy all the resource objects which =
have
> been created.
> +
> +The device MUST copy the result of IPsec operation in the \field{dst_dat=
a[]}.
> +The device MUST set the \field{status} field in struct
> +virtio_crypto_inhdr to one of the following values of enum
> VIRTIO_CRYPTO_STATUS:
> +\begin{itemize*}
> +\item VIRTIO_CRYPTO_OK if the operation success.
> +\item VIRTIO_CRYPTO_NOTSUPP if the requested algorithm or operation is
> unsupported.
> +\item VIRTIO_CRYPTO_BADMSG if the integrity check is failed for IPsec
> decryption.
> +\item VIRTIO_CRYPTO_INVSESS if the session ID invalid.
> +\item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
> +\end{itemize*}
> +
> +\drivernormative{\paragraph}{IPsec Service Operation}{Device Types /
> +Crypto Device / Device Operation / IPsec Service Operation}
> +
> +The driver MUST query the capabilities using
> +VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY
> +to discover the capability types the device offers.
> +
> +The driver MUST get VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP and
> +VIRTIO_CRYPTO_IPSEC_SA_CAP if listed in
> +VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY command result, using
> +VIRTION_ADMIN_CMD_DEVICE_CAP_GET to discover the capabilities the
> device is able to offer.
> +The driver MUST set VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP and
> +VIRTIO_CRYPTO_IPSEC_SA_CAP using
> VIRTIO_ADMIN_CMD_DEVICE_CAP_SET to
> +indicate the device which capability the driver uses.
> +
> +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE, when
> creating a
> +resource VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA, the driver
> MUST
> +set all the parameters in \field{struct virtio_crypto_resource_obj_ipsec=
_sa}
> with relevant values.
> +And when create a resource object
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA,
> +the driver MUST set all the parameters except \field{struct
> virtio_crypto_ipsec_tunnel_param}.
> +
> +The driver MUST set \field{session_id} in struct
> +virtio_crypto_op_header to a valid
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA or
> VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA \field{id}.
> +The driver MUST set the \field{opcode} field in struct
> +virtio_crypto_op_header to one of VIRTIO_CRYPTO_IPSEC_OUTBOUND and
> VIRTIO_CRYPTO_IPSEC_INBOUND.
> diff --git a/device-types/crypto/device-conformance.tex b/device-
> types/crypto/device-conformance.tex
> index 1667120..5d1c59f 100644
> --- a/device-types/crypto/device-conformance.tex
> +++ b/device-types/crypto/device-conformance.tex
> @@ -10,4 +10,5 @@
>  \item \ref{devicenormative:Device Types / Crypto Device / Device Operati=
on
> / MAC Service Operation}  \item \ref{devicenormative:Device Types / Crypt=
o
> Device / Device Operation / Symmetric algorithms Operation}  \item
> \ref{devicenormative:Device Types / Crypto Device / Device Operation / AE=
AD
> Service Operation}
> +\item \ref{devicenormative:Device Types / Crypto Device / Device
> +Operation / IPsec Service Operation}
>  \end{itemize}
> diff --git a/device-types/crypto/driver-conformance.tex b/device-
> types/crypto/driver-conformance.tex
> index 672d0f6..4083ea4 100644
> --- a/device-types/crypto/driver-conformance.tex
> +++ b/device-types/crypto/driver-conformance.tex
> @@ -11,4 +11,5 @@
>  \item \ref{drivernormative:Device Types / Crypto Device / Device Operati=
on /
> MAC Service Operation}  \item \ref{drivernormative:Device Types / Crypto
> Device / Device Operation / Symmetric algorithms Operation}  \item
> \ref{drivernormative:Device Types / Crypto Device / Device Operation / AE=
AD
> Service Operation}
> +\item \ref{drivernormative:Device Types / Crypto Device / Device
> +Operation / IPsec Service Operation}
>  \end{itemize}
> --
> 2.25.1

Reviewed-by: Parav Pandit <parav@nvidia.com>
