Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6441F284B3F
	for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 15:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667528; cv=fail; b=fawOGA1J+CMriHz/VoiRZovgbl/lE1AY1eEWOprwr1Jtlief/66yZ0NkjRqdVanSxvlL0kPhlGGd5BToaPk3LQnpWoGbCZxhhkFhlpbPyq3itzdi1hg0UZn3+zZTd60FfvpmXUwC85X+jL0ji4OqabVuLJpIa5QU+3wEWJ2x1EU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667528; c=relaxed/simple;
	bh=Tu4Ef7nSGzwiVc63yCua78Kbvv+yIiBqi8PKBSMQ4wo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ou6NhbBJWWuoZg1vPjqWFJ0FszLGm7zgDJrwluztPrO0g6n8cHNEToxvuWYqqH3GPnZSyPbE1b84qnvvgng7ChVI+SqV8cIuSkD50U5Rk1msoh60W9jf0qtThFPnZhNDY7JvfPDjhyyLahS9Uxmt60nvkpejgTmAk3BxFPyj3WA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FJYI/nzn; arc=fail smtp.client-ip=40.107.94.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FJYI/nzn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZ5cUvQfNghNilyD3q/BgB7eMBYRN/OXUgNPMDnAg06b8P+SDpkEBEWh8tVhcjmxv4Pa0KqhVt5qNGKKQrf7/uFJHztNQS+eXNwPVK2piGv2hvNXgui41xz6zJHmAMT4sZsN3dmXpyBSm6i2LeZP9YL7zQ+2pLC4XH+59WaF/BH1n+J/eWr/A86flv5g83fzjnojD9GiJhSc8HVcvxtHOx/ZuSZWRyWyOw/cYKSyVpawWgkJbFZXQ4zCppPf4bM1T1xPBIkPt+F8ou28r1ASZMNgskNraRhlV9VKNTu+XFMlw2H+CshRmWWW7U6OHELYWnVuzrWWo0kbo0i6d/TsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJg99M5RIcVMizbkJzK+rQCe0xPgVzsNa74wkklJbMg=;
 b=qK22DU8xs9x4gAw7aBLBXDLzIZ3zbpoF28553lz2DTfuuUfDU2viRVCGht4e9hevVuggb/nEtPuW9+lWiye7x+AqQe1KfFKC1kd0fngbx6m+GbtjmHTDLfK40lH7a6FC/+pR2rkyJkZ3UudQ/wrgVZAxOLT5B5I/VeavcBQChc7FXDQDUb/85Dkdyp+Azz5FnmN5iPFrxfmUknefGix6AfjTBzQmqK3iYM9dwgKdIfM/ngwFrLhpG196vGnxtodLwUW2t15GzxChRIMjU8M3wBkAcYdwHL+KC0JREhg01F8disUij/CzjEdtX5eYmHyZPP23UU04rVAHyUYP93ac/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJg99M5RIcVMizbkJzK+rQCe0xPgVzsNa74wkklJbMg=;
 b=FJYI/nzn8xtAdYebltG632eNbnUF8/SoR7vc7RCojNlSn/SMeacApe9b/YusQmJVfEVUWeywDvfgOf4Aa4SfiDcwEpyvPKKZxpEUT7qFyh0X4qMVM//4h+y2abMghAmIdzesCSfYPalozDgqM1q3No+vx0ABCmoy5Ep+TNgIghGbyFiW4K7UElKEbvS846C63TqQOAZTe4x+bfJNqQqmVxBlwgt2OIRs9RxumiGulLoFJUjbxeHEHcWDlHHgEst+hnYYbYQ19vKiSct3CAapbO6grjriMqjbE7dWU/I5mzv25MDFJzp8Ykl8amFMq6D18V2ii0WpRsWflNG+y+I2ng==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MN2PR12MB4045.namprd12.prod.outlook.com (2603:10b6:208:1d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 15:12:02 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%4]) with mapi id 15.20.8699.026; Mon, 19 May 2025
 15:12:01 +0000
From: Parav Pandit <parav@nvidia.com>
To: Paolo Abeni <pabeni@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: Jason Wang <jasowang@redhat.com>, Willem de Bruijn <willemb@google.com>,
	"mst@redhat.com" <mst@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
Subject: RE: [PATCH] virtio-net: clarify guest offloads <> features mapping
Thread-Topic: [PATCH] virtio-net: clarify guest offloads <> features mapping
Thread-Index: AQHbyKaO+bVcJjxnXk6sUs+adTcgY7PaDEwg
Date: Mon, 19 May 2025 15:12:01 +0000
Message-ID:
 <CY8PR12MB719579675CB3864AB3A7218EDC9CA@CY8PR12MB7195.namprd12.prod.outlook.com>
References:
 <a30de484ff56065f56e37446e08dcdfa4850f101.1747649330.git.pabeni@redhat.com>
In-Reply-To:
 <a30de484ff56065f56e37446e08dcdfa4850f101.1747649330.git.pabeni@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MN2PR12MB4045:EE_
x-ms-office365-filtering-correlation-id: 4702f087-bdff-4626-8452-08dd96e781d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wSUu44pmiwADFklxBy5I4Y0oEBJVIs7hSclX9EyE5SUrQQcuMhMntH5NzlPg?=
 =?us-ascii?Q?BgV5r6VhIQVTj1+CmKgBhlaoeFaGQRgGMqVu4RHR7v2vlbswxroaQaL904HW?=
 =?us-ascii?Q?ue/vISJ+PliT8tMwlaUk0VwU/vsjDy1KAfPZU5RVhuw76GRXoqmiyE6XWl4+?=
 =?us-ascii?Q?6LXWUxAHJylzrPx+UuiAb/aYlyqOq7UXvQn8cjhgPKP1mX9dE08/dKQozeLW?=
 =?us-ascii?Q?4NEJ2RjDzPea7wKkZt9MBqcjWs+LJ1hXUaIkXK90Lbsr7bd5s7yR6HOJPxNz?=
 =?us-ascii?Q?VcOiZ7l6rzDcNEDOYcOXrKyGkYQ+qoNZftxQ7/iZ0bWzmtLcJ96itYZTMWwX?=
 =?us-ascii?Q?EJz0aNfmQUZ7gJMsanJAzoJicsdIDRvbEBxPoTpIww0EZ+BHsWQ+GFkBtrOT?=
 =?us-ascii?Q?rK+U1/FWE19DYIdvPRFj1RA4clps8IoTXB6B4aJEV5FoEuIMwbQ+zFRRxjWB?=
 =?us-ascii?Q?OWLvDdZmulmWgqe2IbxK6bUionvVeBptWx/ghhB/yvl35OpUTSV2XBhs1wqS?=
 =?us-ascii?Q?MXFOiVeWyp31w3oD23TWzhKOXmcJ5Uq3rUt77PzX8byVIFspRz39yXYk+jbs?=
 =?us-ascii?Q?YnJoM9n4EUAaRhzIqzRAiIcX/fpKQAGNO9RBv/tCGCSLwCNouww9XANG22yf?=
 =?us-ascii?Q?QZXVgf7D3UYQ+I5erGcSozP9JywUTc1PiwEB4RbsqJdKZw4/U5ee4FP/vuaM?=
 =?us-ascii?Q?LGKKXxdSO1fpHm9ot3l0FbaNx8c93XzSyBRwyHlfq8iA00pRFCuGVuECCblY?=
 =?us-ascii?Q?EPVyYIdVMMHp8H2o86swP+oj1NoQt7QO71UJY1MDJLMqO1xjzAMPsfqOKDbN?=
 =?us-ascii?Q?sSkvjpVIkEprgdPeuLbpOv/zERuIwTVTJL8Bo0qJqhNajCFf4aEe3NOYzaKP?=
 =?us-ascii?Q?AoY/tra6fpRFKwm3Yhv8YDTz5zZDpyRTgTJ2OjWrpyY5l14svamIV1LjeDnY?=
 =?us-ascii?Q?Tsch04IASwqkQDIgQfOmq+KfM6gpWh5ceEfSwmiK2TPIZBCV7SWYRbL9uw1w?=
 =?us-ascii?Q?4gQpHtGr0Tc1WM2qavLArIE8IQaX6UxESRduxtSPPa5Jpcies1apssvxu+Eo?=
 =?us-ascii?Q?qrwSTW4FGzkeps2FMdeG5ESZQnIbQMx39fJbwgoMATCqElHlgUNw7hAIqAWp?=
 =?us-ascii?Q?WGHzQUWBIebx4BFmOhs6OooLYfY0RjtlIGzTlxRmyPnVxXmU6bWMgMTsqQiv?=
 =?us-ascii?Q?ZnAdCMRmnh9QMgRICD3krFQ0yr0q014gsUBc2pWxx7MpUrCD8GlLEToRHfdS?=
 =?us-ascii?Q?DLrerMUa1GrwMmcKOKKCrLekIwT4uk94JlprTa3LKcyKsuPSya8zd74RfASQ?=
 =?us-ascii?Q?F1T7RujshzvZ2E35M7u3btMPjd4wGGoH/Mu7W3sd2FBeumpStr4kykCnDFBV?=
 =?us-ascii?Q?Uj3hEsf+eKtT9tYZwn4DVYOCk5OBMYWZUxhZ8f5pe0tuyVll8ofpQhc5o3Fl?=
 =?us-ascii?Q?tlMJ/IcNjpiN8uKQeD2Q6Z2jaL9tXoSk3Qha+anJD9sJUWxX3y7RqDQqsZdj?=
 =?us-ascii?Q?o2DYcR0es+/T628=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?47KbJKcv60J+UXCoyyvmEZDGP+5WSiXCbqkX0ZEpcvtZOHOUynM19Ks5J47d?=
 =?us-ascii?Q?UEQQIXyyP9X3MGyUG7HZEa8fOnSMy89yGziP+GRWFDIyNejEIZWIT6cU1efb?=
 =?us-ascii?Q?VOmwXBJ3S1eUbgKOsvPns46KRmC2SsyI2H5rXHR5h3niNUQDwgtktQFeCDxy?=
 =?us-ascii?Q?tOz9diFG7Z5BLbl9ebUJ0yWVF7wROslCGIMH1dXYXYOELQCscD8KOdGj7LS3?=
 =?us-ascii?Q?Uy4UGlyEoeZ9k/mNOo9HPFU7eCuLnBt0d54axXhUtcwCOEmeEFIkKvWrlbfh?=
 =?us-ascii?Q?XT8IShkinKZYAYZ/VCd2gKoDqTnIJqoBOXmVmc386C5bhASLihwkFTjZJECe?=
 =?us-ascii?Q?xI7OQXafFTQZXmwt1xqSN95j2/BT5bExTX3MG8bPM+1/CYrvtxlortYChivY?=
 =?us-ascii?Q?gRcMDDxKIyL8D7IM/F3MrMG/WH/J8X4/XV2M53BshXil+1TI67Gd4IGAXSB1?=
 =?us-ascii?Q?Fx1L814oc5xyYcDQZeP9QXCJkZUupHjGJ2myZEMD52B7qQ3WJy5QiqoRc3Eo?=
 =?us-ascii?Q?VeI8C3KdHPQ8knj8lKbMAzO8J1j5OIlLvI+O6c13qnKnc8rmeLWxZ7IffO8Q?=
 =?us-ascii?Q?ApMRsZw6Pz8Ya+maJbikUteITmxXlRb2YTE21mbmZfPb/HWvfXfS6Wqrk0+c?=
 =?us-ascii?Q?W0IYQy7Zdu/P24Nr0h27VEXerghJsDVlrahN7HS51pvaJPuh3/DDBDUYUXcM?=
 =?us-ascii?Q?jc1kfD3csFKHdUKR2RVobxnA8+7opI5EY82WWNxKDuNSh7NzkCms/CLXbjAO?=
 =?us-ascii?Q?F+UlsEwa31vgcfZCedDIQWU1k4mp+Rkdmmxz2+NnzJbYOK0jS7okR30jKpsn?=
 =?us-ascii?Q?9yaqZ+SYBFR46wsokFlpdTnwqExpS+ASGtK/ckf7I1AzDDNxELn5Ae6zJZPQ?=
 =?us-ascii?Q?1zym+QdVEV5JcoNQYNMgSoF4uRM/x4VSZTVkEQem6fz5bbWbzcTGrfyZxTy3?=
 =?us-ascii?Q?E+GlKLzLtHGz+8Ho2sU8nnXa4TB5Nb7rP4LXpGoarrTy7hrF2cfUu2eZGl1B?=
 =?us-ascii?Q?B19vJwkDFVYNcBPtNzTU0wSQxoavjU2aQR/s8dX2wMxFhg/jqq7AgEEA2z96?=
 =?us-ascii?Q?NjPSHYUILRZQrLJEXTW1IyrZ43nJGB8MlvvKusVeHXxmVqVRpJd4idhKCSDt?=
 =?us-ascii?Q?fH+3Y0ECOowbae9HMpiqn3PfulZd1opEqCGOI4ffUbnQ5pamEr9leWMsVwKu?=
 =?us-ascii?Q?q9B3k4mIf0OxJAuPskYc71+6fSf5WhKaVVgRRA9/gjYIk/gT/6UpYu8tAuuj?=
 =?us-ascii?Q?4PNPCSSK0xMbZacd4T65ymH0dOUb557k/dMEsSYCe9Lw1qhrBoy0RUZVPFaf?=
 =?us-ascii?Q?ZsRpy3lI1KdyNAG4vYAcg2jFIQWn/kFUGXBCpQDa2YPREX5o2kfjzZITF0wy?=
 =?us-ascii?Q?NJk/9+dYKX7p9Czt2CN0PUD8ZRvJcTaPXs87IKki+nEtdoGBuulZ0bcfyxNs?=
 =?us-ascii?Q?gMywI6AK6CsNKIubESfc757T3XI+qBQQhfaR0/uddS4ABxdZd75DqksfvaPO?=
 =?us-ascii?Q?+b8UruhgC+ZQNURLUMoSg/koCeJKPZWiS3Nf1xzWxuFOmC8UoX20/8cC1mXe?=
 =?us-ascii?Q?qt5etulXj7hAe44jvc8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4702f087-bdff-4626-8452-08dd96e781d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 15:12:01.5963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oN14xXIwKdE9d0zJYXgWin/4V/ZhENsewB9xqYQuAlMtOsT68vIhyoFR/Qt8BOAYlvCigQvQRFAF4U1yvAsXyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4045

Hi Paolo,

> From: Paolo Abeni <pabeni@redhat.com>
> Sent: Monday, May 19, 2025 3:42 PM
>=20
> The guest offloads, as specified by 'Setting Offloads State,' use a 64-bi=
t wide
> space, while some of the corresponding virtio net features are in the upp=
er 64
> bits of a 128-bit wide space.
>=20
> Clarify the relevant mapping as somewhat implied by the current text.
> Also rename the offload definitions to avoid referring to different numer=
ic
> values with the same name in the features table and in the offload table.
>=20
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
>  device-types/net/description.tex | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 1b6b54d..8c501bc 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -2186,8 +2186,8 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi
>  #define VIRTIO_NET_F_GUEST_TSO6       8
>  #define VIRTIO_NET_F_GUEST_ECN        9
>  #define VIRTIO_NET_F_GUEST_UFO        10
> -#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46 -#define
> VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_MAPPED  46 #define
> +VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM_MAPPED 47
Since the offload command is defined only for the rx side, in the below 'No=
te' should it be only 65-66 map to 46-47?

>  #define VIRTIO_NET_F_GUEST_USO4       54
>  #define VIRTIO_NET_F_GUEST_USO6       55
>=20
> @@ -2205,6 +2205,9 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi  negotiation
> corresponding offload gets enabled to preserve backward  compatibility.
>=20
> +Note that device features bits in the [65 to 68] range correspond to
> +offload bits in the [46 to 49] range.
> +
>  \drivernormative{\subparagraph}{Setting Offloads State}{Device Types /
> Network Device / Device Operation / Control Virtqueue / Offloads State
> Configuration / Setting Offloads State}
>=20
>  A driver MUST NOT enable an offload for which the appropriate feature
> --
> 2.49.0

