Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091F71D54D6
	for <virtio-comment@lists.linux.dev>; Fri, 28 Mar 2025 17:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743184160; cv=fail; b=FG83W6JjijjZADDCZhLQi+xwsigTCw6yrgiZcLNWRyjJJv/CKjnD4fXLb51C+cWiUuqyqsdjryTPOmaB8gXP3qkWwusdnfiw0sAAahRUoBiHpKWnVpQNnR7v2V0D9R18N1fhS/uIg3yywlYFHuBIv/vqeaT/pNkWSovE7cA/iRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743184160; c=relaxed/simple;
	bh=rdwupMvkyhOE7ztjeSd8sSrq5Yx1bdk7tlWSYOyO27Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CUZQzGAR/vujhoo+90LDeIzbDKWuTUInQAyBaeXVDQ+7z8n3SeCKH7qehrb0z2APBvHO0A0vI3ZZqorl1HNlY2GrYdSdS1k6IfKUoAXRNms7hVrcCA9U7M+fRH9uz03eHAHGUKFxdgwCa9N0yn0yEX5fSq1ZwOaFcxcAbpH/sNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VUvhzOBd; arc=fail smtp.client-ip=40.107.244.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VUvhzOBd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+ICyV2rcqOE0JbxH3O6VtOqXnVkIGTCb6XaWG2RbOE1OQFAQxrBbKN4P11PEw8VWzUjmeraAVKxEixgjeE8JgLws0nt02RfkRkS7AzSNQWenUc/hm7WtsMFCENr/q15W2UrEFtSeJ5WB2U5eXKr/DcGWhg/Nt7mtTAWRC6KPjz+xyp4GfdlsRsR3N1uPUKXY5i0n/3CW12t/CXp10Em2svwwkGLcSDEyhkc44ax8D5l+So/AjxR3jEy46+yWl232L4jzqlVeGNPXK36Q+jXlCGsoB56LcsAQvDq2wtWfYaouIu8a4Pu/3ci6eToWnaAhN2X8pWeZ7b+PDF11RNsNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkK3iNywbtKYouQ9KQclDGdV0sMoeKGZXU43+L7n9Xo=;
 b=YN1wzIoDRyKdsMV4N6yLMRbYaG1/bBta7nHaRjIS+VfNy7nYgxsnZNu70DwrKn6xvk9mT4TUCTyzA0+rmV3UuF/bh/xNu/WFUsPhlfr7BwWOhD2VuFX2BW7ZKtbrgEehdJRvFvQjqBYHVmD84NrQpHNZ3LiDerVTq0Km7rtjhwPRg8pUeW7l8zC9erO0fi3qUV7QZaIJtiy5IWrYluqiEdNccZmwxtup1zulrCx6NDuqEYYfC/75Bu7DnXwh3CODkHQduauhhC9AQaeFh7Sq+Zio0PbGJXj1LaxRtMIIm+WBt8yviAdOTnm9PMW+LRBPesPyAeoOJzXAqtHv8yg29g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkK3iNywbtKYouQ9KQclDGdV0sMoeKGZXU43+L7n9Xo=;
 b=VUvhzOBdKLG8TCz8X7G9Gne3kNYA7y5y8jp3H5mE/rwcDA3KvHFb3gHyHSBhTPHQn8O7DbyQ//1Z2OD3qPRxP5bqLspJ9ya22prVGojlM7s2QYXDHm7c3+z3fItAcOj98bwOEltiD2VTvsYr29U2IGpljoav7LhW20Tw5huGJ03dVB3j4Wv7N19DZyu+OgRoYn1kQ2tQdkefKZC1pG8nuW045ywIeGpWh98uxsjp5rfjLvBe71d6nxLYGtUHVDALTk+B3EqO8+CRDBSItIQbt/vFYBtY9AIw9o0Dby+wtLZd+6+o8lj84gtVK1F5S32rcfToVRUC+b3410TFRH2RuA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MW4PR12MB6802.namprd12.prod.outlook.com (2603:10b6:303:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 17:49:10 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:49:10 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"sma@napatech.com" <sma@napatech.com>, "sburla@marvell.com"
	<sburla@marvell.com>, "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	"jerinj@marvell.com" <jerinj@marvell.com>, "anoobj@marvell.com"
	<anoobj@marvell.com>
Subject: RE: [PATCH RFC v4 1/4] virtio-crypto: Add IPsec service operation and
 Capabilities
Thread-Topic: [PATCH RFC v4 1/4] virtio-crypto: Add IPsec service operation
 and Capabilities
Thread-Index: AQHbnIdzch0SaXnATUyiADq/hmdPC7OItqCw
Date: Fri, 28 Mar 2025 17:49:10 +0000
Message-ID:
 <CY8PR12MB7195F5CE039FD97626C36C80DCA02@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250324063843.1599512-1-schalla@marvell.com>
 <20250324063843.1599512-2-schalla@marvell.com>
In-Reply-To: <20250324063843.1599512-2-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MW4PR12MB6802:EE_
x-ms-office365-filtering-correlation-id: b88d9f38-2b68-461b-b663-08dd6e20d83a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MZGTAm6xuDJvkBaIl8W7+fEAq/sMRcxA8xMavQSgLfqC8Wf6bU1TPdfcg4mk?=
 =?us-ascii?Q?Ur81PU7T2jr8j/4L0aUwmQucmT0NGfdT6ZC1n6Z84FQgU4yOTML9Klq80m9+?=
 =?us-ascii?Q?FY5J2IhevGV+Q242K2CHp/CZKEOdrGmlcdyImTcp4BY5FV9o17cVZeCSybsN?=
 =?us-ascii?Q?xU5knvGyoEhEAM8f5R62PV2e5F55my9nicz+03YtLCsxnjFOVMcEqzjG5PGG?=
 =?us-ascii?Q?Tt1DyEczpGcSuwmWdC13CUxIJLZqf+gxhmEzO8QLM6R/9KnnWhylKBbJCXx0?=
 =?us-ascii?Q?sQRSvs/j9UqWo3UPC9P79iIs7utnnZXo/BESXzWlf7ygFwIO/7q8nEADef5J?=
 =?us-ascii?Q?h3JvcgTw8oXfzmwV9GEoj9sJ12AoMGJqMfyko99zXu1R4h2/Vj7Eq8rAsnNr?=
 =?us-ascii?Q?96DYxPDsykq2822NW6FGz4qoCV5IigQKKg24OBXEWYG5+rSunxfUQxDzHxwf?=
 =?us-ascii?Q?hBHYJM7TMNQ7YKNAQuXPVuXqHK6x/L6b4LpiyDkZfLKp7knat683VZ11MSmI?=
 =?us-ascii?Q?/e/lmU8TXpVl6Kx6w6oNccQLrp3FZcQo+AkM9TtzcAhCpsRsw/QFtO8hEqEE?=
 =?us-ascii?Q?fztP2EYkMB6TQlMai57EbSt1y0RKSyxjF9ydrXl6hJNk2JdSRXATQlMz33m4?=
 =?us-ascii?Q?9gNtvIWYR+SovKE/PY2MfpT2ttZRRw9610U+Anp0oxZRchowIRYYXFR7sdw2?=
 =?us-ascii?Q?Sl1udvgWjVOuw18TzrzP49Vmmhw6cE7GyFMqPwAcHvlg2X7dpMnHKdP2UXWS?=
 =?us-ascii?Q?yerH5yJFKJFnZBAC+eu4Gd5VXA5Nvj8h8h/jLADl+vLy5aJ2O4mA08m00gwW?=
 =?us-ascii?Q?xtqMRm/cQ0OlBkG3XRNesrkEp8PcZZOqIvIDn22IV2im9Q5jaLu1EZ5fd7qv?=
 =?us-ascii?Q?w0rC/YfbxTZ328iMWzMjQSebSjvzULHSNHZbOlHkNIYrmzSzeRrbjzZ0kdK4?=
 =?us-ascii?Q?BEdrU4nVM883xw9osWcT8Nc8vXoWDzLUiBk3NJwHWWbzFbxa9aH9qdh0wKes?=
 =?us-ascii?Q?MNrpkJ43dIIgLTs+2OgIXF9vg+RwstkZpTxU1JfRbbahcfHfrBr8wb/Mvfik?=
 =?us-ascii?Q?TzwldT10MU1/ereJBf3I3UR3rpfNkyMZxMZfCFaWzaipvo7XdFs5GxhPxpHq?=
 =?us-ascii?Q?SxXAiI7jnQI555J5Gov/3FbRVvuxf602jDE9rm4E68BA5MVXEb4B0SNPPvQa?=
 =?us-ascii?Q?XbP+nLCIDG55j5X+ojesguhQfmTk8fjMRoieX0POHNmqO/De3X2eWrxJRCmf?=
 =?us-ascii?Q?sqdGUCJ+KzPoFaeoQ85U/Af1jLb4XxL98s4dyEoy0Y+ewJ0iXYucUTpYaGhS?=
 =?us-ascii?Q?Oy6PJ2DhvxEH1kRsLNKgTl9TLHqSFcLeN0WIt2B0DQsFIqn8+tINfpwzPAvF?=
 =?us-ascii?Q?vZe8r6Pz31Imj+SEJ5MwT27WVH0GnzDyWvF/cphA+VE+2h3g2hMuFDs1Zbah?=
 =?us-ascii?Q?3Jy7LwQqyoa1tpCkIsbXt/ElYMuMlO+xmMWq7+dy50/ayxnLD0tZj/X+c/MK?=
 =?us-ascii?Q?JSM8bHebYVFRAA0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8xyT7PCSVzqL5lqqZY0/812t4ArJgtBgHO1Mg2BbcHXzqfqYqX9c6SDuYqa6?=
 =?us-ascii?Q?vh9D+WXuyQuM+wDrRWvMpGbK/QPdjHMZerxGUgych7ag0mVIAP8+ZxIOhJNs?=
 =?us-ascii?Q?lESC6fA6/Wb/Ovl5KNe5mc9Dmaa5jAzPJoLG+qLVsGhgyneMMCr3ti+fm0Eo?=
 =?us-ascii?Q?QAY8Lm7VLjWOWIrB+QC74x3CrhLEI04r1tTw6QeCwxLatBILvdtHFPxIQ7VD?=
 =?us-ascii?Q?EHnS8skPI4GhLLDvqe0MFPzH2naopcIwNNK81gaGGeQku4EEWxXkQJrNUgw4?=
 =?us-ascii?Q?Zw2bIqv1uVKV73kI/i3tYhLMuH5r0bshLn+kHTW/BmuIACmGtbgXxiCU3AHL?=
 =?us-ascii?Q?DPiAitP51oI1hfTo6JzMcMTfLT+72+iU7R5ePMRj5TV46il2KwN7OuTqbOTI?=
 =?us-ascii?Q?2DF9R2pucoaZogPCjGy1lpfSbVPMB9mQQ6FGmmM+PMvb04gTKFM1tJwPhC6o?=
 =?us-ascii?Q?Fb1Dw8+c4qaIDG7R/CJAj8me/+EBbiDnvLQF6Vrs9oC+Di4liC33Izc367Sm?=
 =?us-ascii?Q?87lAu28xaPo2m8hU8L45sKkyGCM2ue7owjneZpQMTki+eYNQDnYMwU3qd1C0?=
 =?us-ascii?Q?mzc03CTEfaM4VCMjJqPqdFM1mr3MT/4dByWS0gy08c6VNwtlZ1Eb3PxW5J3F?=
 =?us-ascii?Q?MG753dvgRXyJAIkmpHVzAVZtUCxaEhMXQOM7ZIpVSIndhmGi9oRVTtzPOZGy?=
 =?us-ascii?Q?pbXyHx0pVQvnvmrKFAtQrL9UiUV3R0SkWkOOwx8zTwyHGZpv+BJv3NW0fkSW?=
 =?us-ascii?Q?YV9JmKpjmjAJothR6p/FqWly3Ky8T4aZ1yPCUmS4tqGGDxzLwrKIHQ5DSGwK?=
 =?us-ascii?Q?NQvHJRqlP+mU/KZ3B8+Ho0lB0x7nzFovyyXGN5LPaRuamugGpS2LwOlmIpOQ?=
 =?us-ascii?Q?HwOsrKvv8PRHaRGyoPP+eO2Eaok29/XUDxfYJbLKHXF70O1dMkS0ugOGt4Sa?=
 =?us-ascii?Q?15YglmWDvzY4JTM3b8fWbSWV4Ic86dU6wUz/0Mhil0FJ1Xrra8e32kBeAb1a?=
 =?us-ascii?Q?dMf66zuoD5vsyjOKV9POKk0VvfFaN5qihr+4mtw8KHNd7Ivu1LBL6EE7BYqV?=
 =?us-ascii?Q?h1pHtPlAIlY7UUQY9ZN1NvAlB966rizmDQBeh+PKl7yylPINxDP26j4Hv45A?=
 =?us-ascii?Q?wc3xHgC3rOK5OTZnJjRV8+ubyeLq3cRcAnZNUXJzTa9xdhSP/3BSTDi0jofR?=
 =?us-ascii?Q?0WmfLPjZhVj0pWZ0xh7eqCALWqIZMLCLkoCuENmxEmW+amqv4Z/FC+snuvQQ?=
 =?us-ascii?Q?b5lFeqHzMEbkebCNfghR9gAEdRA3mjwEwsA92b0CwHYWVsHVJJsididnDozS?=
 =?us-ascii?Q?FvvaVXRe18VlTeBgXfdtDql8M7UCH1c0gKkR4eLDuKxy/fgHWmK1AOsQi13+?=
 =?us-ascii?Q?20iO503a3g05B1UfVP3bF+l5wFld4Ip23ilqEncioyQXYOkHVOCup1Fe6J+q?=
 =?us-ascii?Q?btJbTgk7uqrIY746V9iZZZuXZPskO/9LqDW+HgNuSESEL+yySnV4yZ5cx+1f?=
 =?us-ascii?Q?uMUn1jMZ5tpI/iFAgpldiUyqYn5KIliyK3Wq+2J+Jge3W0kRcTefaohF+hO1?=
 =?us-ascii?Q?eoe/lY38s+khyUS38so=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b88d9f38-2b68-461b-b663-08dd6e20d83a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 17:49:10.1811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r4jNtIJvKJ3ZrTrs84sv9Qws/vEKQNRyAFwLfayRxnaSm/kZ7Nj+VTpEAhl2bKSHN2QQzIeKdpIOeetcb+UoIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6802

> From: Srujana Challa <schalla@marvell.com>
> Sent: Monday, March 24, 2025 12:09 PM
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
>  device-types/crypto/description.tex | 173 +++++++++++++++++++++++++++-
>  introduction.tex                    |  12 ++
>  2 files changed, 180 insertions(+), 5 deletions(-)
>=20
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index e053cc7..958c231 100644
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
> @@ -1872,3 +1890,148 @@ \subsubsection{AKCIPHER Service
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
from
> the packet(See \hyperref[intro:IPSEC]{IPSEC} RFC).
Please add it as,

... on the incoming packet.
Or on the incoming byte stream.

> +The resulting packet contains only the plain data.
> +
> +IPsec Outbound processing: The device performs encryption, attach ICV,
> +update/add IP header, add ESP/AH header/trailer.
> +
Please add the text similar to above 'resulting packet', such as

The resulting packet contains encrypted data...

> +A crypto device can support number of IPsec SAs, allowing it to manage
> +multiple secure connections simultaneously.
> +
> +The device and the driver indicate IPsec SA resource limits using the
> +VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability specifying the limits on
> +the number of IPsec outbound and inbound SA resource objects.

> +The VIRTIO_CRYPTO_IPSEC_SA_CAP capability  specifies which IPsec
> +protocol capabilities the device supports.=20

I think below nit rewording reads slightly better.

The VIRTIO_CRYPTO_IPSEC_SA_CAP capability specifies the IPsec protocol capa=
bilities supported by the device.

> The driver indicates the
> +IPsec parameters by setting the IPsec SA capability prior to adding any
> resource object.
/setting IPsec SA capability/setting VIRTIO_CRYPTO_IPSEC_SA_CAP capability.=
.
