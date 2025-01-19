Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2075.outbound.protection.outlook.com [40.107.212.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC581401C
	for <virtio-comment@lists.linux.dev>; Sun, 19 Jan 2025 08:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737273969; cv=fail; b=b4i3L6RsoEXwGIKVCXtqHx8A6Lw/EHOLP+9pvIXQADGMqUW+mHy1bJKsYeDhgK/5QP23Y3l8C1Z06zv3cXVZ9murJOaUTrFFIN24oQL3snqfIWEmce71d0++e1aePFHY7TitKGCdb8dS1yCZpFV2zLRKwftqd9WkelOOMKLJ1Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737273969; c=relaxed/simple;
	bh=+Lk8ir4JF+eq6HH2LRI5U1PFN8vsoXGQl7mf4pzIzTg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OT3R5DqJEC3irw+AjdnOR0r0c8CoKbTVME1E4hxTLYLIjE371mK403W05yZxPCVNc24nD/PhhcGfod7NGBsDR8UNysQoH1DfQxkOsu5k35K8/NKwmJJQIziqRFYIQxoSxw6Up0wtac7OcW+fRDugJrWqheUn1L4/5hHEZOJKimQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=StzlKoZo; arc=fail smtp.client-ip=40.107.212.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="StzlKoZo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GojprUoNAsawdz5iOqV3wF0lJIER8qUt22Toaml++//sabniFIrOD9sxKbzXqSFVbrFTXpbMSMFIxmGlthfn7f5TBAQBHjEyHMCAUbTP2qCVFMJl5EU3VNrBppQU19HbNNGkqbQ6C7a4BVerrj53d0dDOuMiGU6DoXCkG+Cmqubazb2TR1gHCCGY5LZkd8Xt1rD5wkz0yk9V307TOxLZNRTXfunK2NnHtElXIJNb53a+UoiGu+/URN9tww6tmYHbn/9ojfzkVnMCw/ArYo9hbI4gbrJ1xXyNqCdAJ2pXxc8AzRPoaZMjEvhTbJauNYVaURKLOK6O4zyLWY1GJL5/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiVHmX/HAL4Z52SNdEmqnS4siEITyH3J+bdg05j3Sl8=;
 b=QMjcx2acGlJmN/uFC0di6S5jG4bXa9dags7MDLeFDbfmSQCjceElaQD/ej1+4tONIRyBAkYBmbRFZVd2G7N1xhlil8XaIrX0mbKyoL9GzSI/3gGN2lnH9oyyTz8sVeFSBv41PJkYaJEpx6I/YmdmN0oJkP5jHGyWmdc79K/S29OU9Gs2TEpIN2cCq8NEdamEyJ52MTqfXe+Rgt44H955gX7o3QVG1v6I4hh2hEtQUzvyhYIkrwYx8lIKhfvQqWNAdfhxD8CPiiXraCQetzT6D+OfOQGiJY7wGd2j4bMXACstJO7Dzy+NMieSQWeK2xYrohlDNMUAMnIA2D3FSgN/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiVHmX/HAL4Z52SNdEmqnS4siEITyH3J+bdg05j3Sl8=;
 b=StzlKoZokzCRnz0ezkHZrxgOvrYu2+nlNcr8gmsThWZNlSOnerSeftG/rw8BvQve5gt/vKFGTeUYqUGQSQYKkFDOh99+c6wLuavHhtoWG8G5I3R/UL1PMNzMdj9+eEzHiBQUYdBDDPVSev/dcsOM+2xy0gwj6UZBnp7RT3R9HmCOb5i4fvBszYEnY7Gc4V98YtYbIJZEQgqT8osahfCoFimrUCyHEz87qpSbkAWo4yT9seU73yDgCU/Zg0fUbz0s5aWR6knbS0YJcMNLMEmO0Q5oywKURnAidMA+tl/awD9lH7uzgvx0bnwMHryUgaRS1dfMKRMNbHktNPd+Mew4kQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MW3PR12MB4491.namprd12.prod.outlook.com (2603:10b6:303:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Sun, 19 Jan
 2025 08:06:03 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8356.017; Sun, 19 Jan 2025
 08:06:03 +0000
From: Parav Pandit <parav@nvidia.com>
To: Paolo Abeni <pabeni@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, Eelco Chaudron
	<echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, Stefano Garzarella
	<sgarzare@redhat.com>, Willem de Bruijn <willemb@google.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
Thread-Topic: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
Thread-Index: AQHbQK/3KR1RJyc06Uq86qDUg7CIZbMeDhsA
Date: Sun, 19 Jan 2025 08:06:03 +0000
Message-ID:
 <CY8PR12MB7195D914B9EF00FF62C5E1DFDCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <cover.1732699986.git.pabeni@redhat.com>
 <3e1c45071c8cf4efc7ca0ecc7b52a73c6bf983fe.1732699986.git.pabeni@redhat.com>
In-Reply-To:
 <3e1c45071c8cf4efc7ca0ecc7b52a73c6bf983fe.1732699986.git.pabeni@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MW3PR12MB4491:EE_
x-ms-office365-filtering-correlation-id: 051cf821-2fc5-4219-dd67-08dd38601e3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?h766821WbFVe20N8VsqLl8oyeebFYxh6dDSyEizK71wawsmfSKiv1VwOgBED?=
 =?us-ascii?Q?x43lTWtMvOKd5svZ0eAyZZpdXhvCPP+IGr6lewoTLfl+Mg6Lwx7NdCGjkOX0?=
 =?us-ascii?Q?YkctDYJCY0a6REVjPKtHg8j6+fCjP4wk7ce7EVVGAdQN64jqFvS7UkOhUeZ4?=
 =?us-ascii?Q?Ajm0qj/4sN9476TI0YnKJt0hXnTj6Ra1F+hdRO+Rpga9L6kvVg1G/zwNzUeh?=
 =?us-ascii?Q?/BArGldDYCqx7v/aAvR8XW7YA3eufKc1eUeHXUEcOMOnp4hnYv83kNdbubvw?=
 =?us-ascii?Q?NGuWlTr440EoRbkAg1GaIYSu4jZjJczAjPbm1t/DA7YZevoFJdSZm39DLs5H?=
 =?us-ascii?Q?53prJ2cuWnvtb+C06uCrvM2q2RUM2+k90ebd9zu7YQPPeZEv7kQh0jpExVlG?=
 =?us-ascii?Q?JpT3W+q8AXI70L0YyMWt0bKcc63SemnCq/d74EEIZ8GMkMoq0csD/SEVLkmc?=
 =?us-ascii?Q?MYvyJIVXMEoiKCdTNE9I9tPr0evrbCyBQ6OXrl+Uk5VYAbMUagmGMYB/jfly?=
 =?us-ascii?Q?DTBD9/zLuE30IMxYN7NQMldR2Y4BmRxv3vfcSL5SwCLMs7zzXHQ6rb36LSdR?=
 =?us-ascii?Q?zBjf66u3pZHxZMub08DWZEsKU9YCjBvYelrrJPKwzFSxQv47hTu8vFIOi9tc?=
 =?us-ascii?Q?P1NUF10d2zauWJKqQky9gxer8EcXZJyET7sR8vamqLC25B6voGC3LatSMwrU?=
 =?us-ascii?Q?s3Tw8aeRmXrzP0bTEjjbfOPXfSG1ko+/0s/6cN8krPnunB7hBhANsAqWsisv?=
 =?us-ascii?Q?T0niU4IVBGD+LTyFVbJHna5kfy/pIyie/6qbGaDFgPI+ZDGgqREbSKsGD009?=
 =?us-ascii?Q?/z0jTetom8E4yOgiR7MnRqjf4f4f4kV0YCHOrAhA1sNIXLm9agwOMzdZyTP1?=
 =?us-ascii?Q?GDZDipbsyfzuv9hKflA/X8AC7zyB6tQuRfl/WtUhUOSro/CC1mWrpfZQ2FQ9?=
 =?us-ascii?Q?SGqsIXIqZyQK85OEL4gU7TUWoILDJ+N3fqy8jfR8qdH5Np1/vFFBxykr46Rx?=
 =?us-ascii?Q?fjyO7LnJvcMDv5ARD2ogJNEstL5xXjq8Ra63+iiBCgWZOU6TS+D5nQPo5WRR?=
 =?us-ascii?Q?IBSuNzIM//u6mbB234F1PKIbhv5SMpix1xP5YGZmM6qatLuWCP/7bg086iZZ?=
 =?us-ascii?Q?k8FUrQ3eWrWP37G+M5NFltjHUKw52X+ZNWNoP+3K9srlSt9y5hRj9sIafqu2?=
 =?us-ascii?Q?3rUUlcDTspjD0uRzljmhcEK0anD6+D5d33dSKfbAM4rW1ds0ggE8b4jV+xxe?=
 =?us-ascii?Q?diQRHrmi9FBlHvO2FaCzCzQXgAxz/af3mML13K51LFEo96rRVeSg8HO1BBjB?=
 =?us-ascii?Q?Twq3mFr6PjIJ8VBf0jScJN4Z7c+EYxlx6J56IZRXk2OVBTNuGLGRpCfq63j1?=
 =?us-ascii?Q?lVaN11b7j3IXml8/1mK04aWJ3bxlB4y/086WR6TsH+ziXdxDr9xEguFgDl7C?=
 =?us-ascii?Q?D4Xu0vFFlRCZHBjvnFR7IVzO2Suc1umO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DIgszz/5XuRa8pgxCaLQ8szZOkFfdVy6ZBQf+LIG173iNuVaaczVAnh2eAxP?=
 =?us-ascii?Q?D3YkRRwS+EGCRL6Qk/s7p9bVmFdG3ZAQ93BizHY/Bbo3lI8PqSe1E3Qjb7Lx?=
 =?us-ascii?Q?te2mbaQI+Zy0e3Dz8RsXJeqBUERgVKlpdxAh24okVc752DGTY5UA6CCwMSlq?=
 =?us-ascii?Q?pp+7O9uSTBtojdCz0d85tbU7SqNX3rRuPFVLsySecZCPV/6OmANakOrdgljy?=
 =?us-ascii?Q?y6Xf5/bC3wB57IHBblNfzG8CNxIuiD6PWFYmKf/WhBREGApOTnBGuppx+O5z?=
 =?us-ascii?Q?Mq4O9T1+VNyYIo32K9AfYBgtqYuRdquUwxyex7PnzBpG9lQptxaIJAAXkJoi?=
 =?us-ascii?Q?pc9Arwn/fMqz60Iw3FEzVG085CLkAPU0AYDqhh16vfM9aCMK2VpJ4SPY9ZhL?=
 =?us-ascii?Q?1kXRRDjsFs1Knrml/jRYvqGnE2ipz+3djdzjdhnA0y64WL+AbNEnA4xsfPke?=
 =?us-ascii?Q?cE7mzpx3px9iBPmiMsE+UGGx5+Yw9HG5htt7c4+QcD0A9XyyPY6+L+fBBpxC?=
 =?us-ascii?Q?NLnyqnp8i1pJ5Dp1WipaC9ySF6poM2+Rz/dthj2jtUsziPzjXN1FfFEqoyt3?=
 =?us-ascii?Q?zcKpfrUV3K+T4lPqoQkB4jGn/HwSu0O5zf1ynYqkaJ66COw/qYKdILROgnx7?=
 =?us-ascii?Q?AF2jWLLTtdQAovoskdH3JAOD2efKlh7XUECMasy+VbAutT9ay5JNd1X2RrSg?=
 =?us-ascii?Q?IWrQmpfAiC1TSvKpEdVYZZUceYdwnMcrqnalpNMO/xE+WeAhlec/lQUkdrFb?=
 =?us-ascii?Q?ngzxRb8GmviHEWMGjNEUGBMn8l51ZUHtV1lobGJWlbaEt9n8+xl3TnQxw7ad?=
 =?us-ascii?Q?ppqOYUWRV2WjTqwuDFiRp7yXmWMF0HMTg1CLI2BYV8WoouVNcuvgvtssDvzP?=
 =?us-ascii?Q?BM+M6/butEdBkWp+cPcCVQmN2kcCBP9zxGuTGp/GqcQIDQ6nzkug9R0UzDXY?=
 =?us-ascii?Q?nJDLmDJ4POQ1Yljr6SAo1Qg3XSpqdgMn90qg52RCObODfGriflNjPpwDD1zu?=
 =?us-ascii?Q?TZNvr/jTfHpeVnph/PcPtRMQJL7dfEKPAqn1XpC4snpEzoZ/ewrYMrkbykxk?=
 =?us-ascii?Q?m3kAyJ3cOEPbQPtShiA8thi46d6EyYjzWHtuqc28XgB9nQ09u8vjn0iwwxcL?=
 =?us-ascii?Q?sUOWias2iyX9638fpIIO50M+Alt2YPe6jTJscVeFlPRJDxMW2eZbqRVJZVOL?=
 =?us-ascii?Q?Ep0rvnsoq8nkrrzDWS/FoBILOuTVVpk1hSM6PTLor9gMqyjNmDsvKQWrQMZ3?=
 =?us-ascii?Q?AsFNd9m4R6f8GUlzi8eGuZyEe0Yx0LxK7MMSlXit7L3e7oRmt5f/6rk2FTTG?=
 =?us-ascii?Q?Mt1WzTTD85evL4lQJkXrlVjghihxePz8pz2Ovm3jHAsZDYPjC0/zfYu06Awq?=
 =?us-ascii?Q?nmYwQV5aMb1kKZOuci6FpZhFYIfYpixow5DSleEIllqBZu4fnBb5wZE3OS3q?=
 =?us-ascii?Q?z60VETEKx8g11ZUPyIKjZ6S4vAw56B7r/MMYGmXIpiIEXr3b8z7Yzj9Pm0OO?=
 =?us-ascii?Q?jtV/Unrsd4c/0oCIrJr2sXgeTvXY1y1hCUts/Z/BrZYImlMB1dO4tudBgEDD?=
 =?us-ascii?Q?bq6TevowhvhZs6K0QZ8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 051cf821-2fc5-4219-dd67-08dd38601e3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2025 08:06:03.1168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pTFH6EZrUI07BWm4FMT+hxdum6QuTwdzZ5gbz3dJMtZbYNqSMu/Vb8tqhdWhrkbtUvLH+YaM7IaB9nhg3i3PRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4491

Hi Paolo, Michael,

> From: Paolo Abeni <pabeni@redhat.com>
> Sent: Wednesday, November 27, 2024 3:07 PM
>=20
>=20
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can receive
> GSO
> +packets
> +  carried by a UDP tunnel.
> +
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can receive
> GSO
> +packets
> +  carried by a UDP tunnel.

Feature bits 42 to 49 are not applicable to device specific type. They are =
reserved.
Please see the note.=20

Current spec description is:

0 to 23, and 50 to 127 Feature bits for the specific device type
24 to 41 Feature bits reserved for extensions to the queue and feature nego=
tiation mechanisms, see 6
42 to 49, and 128 and above Feature bits reserved for future extensions.

So 2 bits of these patch and of patch 4, 46 to 49 to be shifted to bits 65 =
to 68.

Or an alternative would be to amend,

Bits 46 to 127 for specific device type,
And 42 to 45 and 128 reserved for future extensions.

Michael,
Please let me know so that I can have the follow up patch to this one as vo=
ting is started.
And the fix is required for it.

Is there any historic reason for 42-49 as reserved, or it can be used as pr=
oposed in this patch?
If it was only kept as elastic buffer for device generic, and device type t=
o grow it is probably ok.
Using 46 to 49 has small advantage to reuse in the offloads bit as below.
Please confirm.


> @@ -1862,6 +2068,7 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi
>  #define VIRTIO_NET_F_GUEST_TSO6       8
>  #define VIRTIO_NET_F_GUEST_ECN        9
>  #define VIRTIO_NET_F_GUEST_UFO        10
> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
>  #define VIRTIO_NET_F_GUEST_USO4       54
>  #define VIRTIO_NET_F_GUEST_USO6       55
