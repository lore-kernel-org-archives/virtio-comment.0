Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47395248F63
	for <virtio-comment@lists.linux.dev>; Wed,  2 Jul 2025 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457239; cv=fail; b=oetmDMuUQjLeJqepoYqRTo132o5B04abuNLIyowFqDbNGo5T/eodLGyjN8E+XAMV5LnXy6dqn9NWmfQXNB+jN3I/KhL8+lKWOcPion73iMZznAdaWsFHRLGXrdRPVf+aEemRdv0xED5UhLCdnSVpWiv2wt12z+cRa5zs7B0nmkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457239; c=relaxed/simple;
	bh=NFsquRllFpNJhhdwwXZGLbSRkAuKomN8JBHm9D42OqQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=er0HUV9IOTXBoAeqykK7MjKHdJf/nhEEJ+hXvc27q2SZlSLBVuWgdd0LfskTyLf9KO8lmK2/cPwFfzDE1QEC8l4Qx05mc8A/yPx7QehyneCnqLgpI79U8eGYiRFJ12NGQWDewWcH/gqTbDjVw1TOVeeo3TL6NeILrd2CEQORXoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R/oZYYZ2; arc=fail smtp.client-ip=40.107.243.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R/oZYYZ2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRVpkGluwNyAku7aqcIJSbn7cBADohP40ntbbEYVaqCqWDtksoKjAFvvMk5hs/zaniTKXus5Eh/mhnOIzVdjtSXCiV39regUyW7mhgoPt+I5kwlkpNGhhUDJ5PgZK3bRRIOyTzOieppbGxwppxlIyVZ+HCv8ESj5CkS5EfdMJ3WbPpq1VFcOiYDDbKFf15tV1drDMK/eBTRrabeiYuS/FaoYwPjPANV9i6lZjhh5AnDt9a609dbAvk4UDSms4L0ztxLS1bzftb1cQMtnMDuXYyG0wfQHJUbhF2dMUa3lsDAKSxtVO9YlT07qE3DGl65MYyw3OTeOiKxvlXr+46wugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VH8Zf9TBqpxwDKI9vkcQqBdQAxomSvwhTiAWVOf6lMw=;
 b=iNjE6ySnsnhd814MEwV6WBzqe1gZQQ6Og4TK+koVU09ST6N50Tk+ekkYChuDLgxM9xBlX/sgSPD+SsWH9YiLLGZeL7kHf7hlvTR0jehY0S7rfugSbLEwvl0tannbe5lchBeAuQ3RtyIey5GgNRDwIVxxwHVP3L9vFZ3DC7gwgZ/byAlFKXh0R9uAtE05zuCxGfrp4YDj/l4zd4xtsglgMVoAgKNShG2os3CzE0VT+UHJDMScJ8DK1tMJBMAQ5u4y68Ry6oXDCgl1wH0bJ2IjZABL9EJ/kEdO/rVzNjz/nOhWF0115mMRC27S3kqMy417oMIj8U3UEDz9aRicR4uHng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VH8Zf9TBqpxwDKI9vkcQqBdQAxomSvwhTiAWVOf6lMw=;
 b=R/oZYYZ2LLsxlXBFXVLUe3UmIgmkH7dznK+CoQnqy+Fv+Yq+kUCflCGXihZ5E4q4Zwlq09qAZfNDtejdAjgAfDCaS6NAkIR1sbAUNUWhxfju+OFpm995FhBYVY615TBT0HRyXMcyfbtkV7EstMQ3IzAuamR/Kk5Ex93ChHsG28TEL7Ku1tM8DyXH0kXarsf/wbJGHBmKz4j4DV4ppUbF7Vin/EHloPBZo3iarMHotrxbeCbMfzXr3z1KnSi1D+WqFHbNyRnNc2xtw2ov340nJsfeUkOZNU9s/rzgrfwkIuXLsJZHMr8JPjm9WlF8z+jLtMeBdZgszPKKnXsXZHukBw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SJ0PR12MB8092.namprd12.prod.outlook.com (2603:10b6:a03:4ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 11:53:53 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 11:53:53 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: RE: [PATCH v4 3/3] virtio: introduce SUSPEND and RESUME feature
Thread-Topic: [PATCH v4 3/3] virtio: introduce SUSPEND and RESUME feature
Thread-Index: AQHb6y79DuFcUWVxaUecUxWoowoDm7QetfQg
Date: Wed, 2 Jul 2025 11:53:53 +0000
Message-ID:
 <CY8PR12MB719508FFEF43584586B6CFDDDC40A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250702085421.342224-1-lingshan.zhu@amd.com>
 <20250702085421.342224-4-lingshan.zhu@amd.com>
In-Reply-To: <20250702085421.342224-4-lingshan.zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SJ0PR12MB8092:EE_
x-ms-office365-filtering-correlation-id: 690e0068-79f7-4a0c-2ee2-08ddb95f1e25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wYp0rFgDtmF91ktlVRG5MxqBGi2IE+MwHMY++mOE7XBnutpYD5pKu+VBDj9a?=
 =?us-ascii?Q?TJ/iJcBHmN/VgjWEVwYJ6JoEDM/fuPaBsLQS0Ex0QyJ1cvkgF6003O/QLX1s?=
 =?us-ascii?Q?rDLkN7RXuS83/d7HFEzn875qi2mwdrZjD+WNPxwX1zFuW5Kbn3eJHnPLhURw?=
 =?us-ascii?Q?6Mg/UCfmXUbnSdMu4kCPLbtYDMju+24Ah0XPTueElgttwdt3+gBZ92rsRYL3?=
 =?us-ascii?Q?2eEj0aZ8quStZbAtg1DguvbefyavWeT6Bcl0SmHDKIW38YUrtGHzqZS20lUB?=
 =?us-ascii?Q?kEa5Lv5EmYKHVPBUqJzOM0R90FTIe8/YyLuAhmgXcaNKB+8tS5L9blEsiGOq?=
 =?us-ascii?Q?c5xfOPX14MGHGbSxbGe4xKG30ZO34PAvfCPpUJySfL6bDavuwYafoL0ImkHn?=
 =?us-ascii?Q?QgomL3kuLl4+yF1PspmIb1HnW5DOupIKJiMj8DrxtazqjTKcE2gStLfS46at?=
 =?us-ascii?Q?Zf5+1hQYCUbNx91ai2nQLwA3AIWjEyPvYbVm1efM49JEJafs+CCPrpTYMypc?=
 =?us-ascii?Q?UjVt6uyki1nGNteh03+6lX2KCm/RTOZW+9mhlWU25Ol++HXLh+vo7GIBtPPZ?=
 =?us-ascii?Q?/81lpO1E6mfL7ecTrf3gk4Lx5YdqzMUdlC/bly0i2nWDQiAjbX2SDjIUo98E?=
 =?us-ascii?Q?4tsUbAB1QBhHhx4Gxs9ygkhGfcbQVFaNaTDLVhbMkGZAS/64zCadKhqYKqe0?=
 =?us-ascii?Q?1+X4h73pJciuUeUd2FeIsrF57ae6iq+jytJjnd7aEvadETk6H1ff0fDg5BMf?=
 =?us-ascii?Q?ifLIyu+r7BdXrsg4ulVYUl+xBe1bKNHapy92SFdAKjez5BsVeIxk4ltlwZLG?=
 =?us-ascii?Q?OJ6ragmiiB4TzE4fh/r5K8hb7oVZUi5SwWSROxKR7dAecavHTTUxDVnXEKBS?=
 =?us-ascii?Q?hd+hPO3UAS+pgrsvgi+7rBrpLWlvxIHsd8ukZdu5Dn8adAU0mNMU/Oa9Jh+o?=
 =?us-ascii?Q?jzlywFyLMZt4ZXfEDOBMmSBQ6vLChstVfPPzN48nv0+llay4iWqXOTx452Rh?=
 =?us-ascii?Q?UszcXbjDIkCFjheYoBITg2Oi9pVld6swfwfV/aPSaDlTFcHKHmq97Byl6GPr?=
 =?us-ascii?Q?nXja9Q1GVFg18kmkncjGVmgzkkCWi4i3EhkNP/cd7V0uWQ50vKiMOamgguta?=
 =?us-ascii?Q?OFf41Va/s1Sc8l9mUYCFIyxhPGJTjD60f0eaUnYEPNlTCmHHx2EconXo6DBq?=
 =?us-ascii?Q?hfHpqwTwvHIxF1t7PXblVoo/G/25nG6eCXYSbhTvb75f0NQSmZVcy+n0bmIq?=
 =?us-ascii?Q?CM9y1qj+XqTct/aoCryks7x79RheZ4nJVN2HtsNW+hsY82009YKyYn0McBZ4?=
 =?us-ascii?Q?dGW9h3GfAwCrLy6rwnQrxg0I2X53G1VGaxJlpnIM7syvcVHl0xcuV+D1QJQt?=
 =?us-ascii?Q?d5fS7lLC41heTshMNPU+YlxE2g+VdGeKunlwH6LRqL7MMN0xNmTJT/maG+QL?=
 =?us-ascii?Q?WCwr9B7RpGNw4ET+btEi+NfAk4xxG/1k5urcRG8odjfmYYiVhDbRaFUTivP7?=
 =?us-ascii?Q?eS4sb7q1pU113T4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?O1sKYeuD/D5bUiMr5wd65KVs6xK6NwT3/DW1P7oRZmrvEnLzUIBtIFur8JU9?=
 =?us-ascii?Q?18GwlMYXBpqkW8b8vREnu3bqJPTyTp67RlA4u7pis/f/6LUr+jNNhbXzOzVi?=
 =?us-ascii?Q?XBY9VaAikPC/sot9aA71Jq4EsWIRJgdAEy0NY4hKD2oYn1xWJe9T31KDWO80?=
 =?us-ascii?Q?kUP/yjs6UBBLeAFt66js2mPmXpP1etHLZ52Fm+tjA6Hl8HX/HVEBMpnDyxC2?=
 =?us-ascii?Q?Y4Gci4GB1WoijQn4GqW1HMBBGxfJlwfAu5Hcoyil4rillA2hNc2Ugp1oFuYx?=
 =?us-ascii?Q?a0ujWmCqg+iN0l6Xn6SQmN2kzEgOFvSL4nTxAxone14QyQUcZV3apVTH6BXN?=
 =?us-ascii?Q?YMr20iK5xzl3ZcgxpsBWFP4pwwqxvENrqzx5FG5xF5JxP6AhWbXhPVu50FCJ?=
 =?us-ascii?Q?Qhu1wb9O3g8ROyYgnUyMidGu2kbprzFG4U3x5vLgAX27vLtbVMe8i6VFUoDX?=
 =?us-ascii?Q?1Y+TQ76pddxP5GdzJY2PtNlA+9N87E5GGbVTODuQ1nyl86HHHsbN/7z8cdcE?=
 =?us-ascii?Q?YdPBNtyNml2QdboNreYOOWIZBFVIGnUDeiwkomTk3Tuvx0CO5Hl5OTCmV7Va?=
 =?us-ascii?Q?9fqKsx1CiTasqomxtpZhrnFv6J3bzHfuYh0enlFfcKurqoTnN/SDmY5xmR0H?=
 =?us-ascii?Q?06BswRKMMzwVhHKK41YzzVtfAWxQja43ZxMMMYvTmAadR83NZEIKEyHXcjev?=
 =?us-ascii?Q?tga1775HnpeGxxG0KRrK6E+1r2SU2/5cO9JW8eStakVffTRpDLmDXDKzS25+?=
 =?us-ascii?Q?G8FiTZMMjS19VmYotv7cOyWP/2vZIkFN7EqUcuuCRW1vbQR+hVmAMxMc8CUo?=
 =?us-ascii?Q?RTu3JiwIuhiexzgzOubKPlR8CGZtIwvqWN8xsMarcE9sxQqYpqeaWp7vVmM8?=
 =?us-ascii?Q?g+w5L7Rq7lLdYvy22V2+gq1INGRjNlWQw8NBVlTrG5lYhK315ZxQdJCJFclN?=
 =?us-ascii?Q?yMRPGYtGrtbQ2hSYasHtriizvZzWRtFzdaUeB42tx4Y8VgGg/pkQXChvfHQn?=
 =?us-ascii?Q?vYg+ek4MLxoqK8m38l7Lfsfm911fZoaF/Qez3gd4230y+TQcAa39zZgGFzON?=
 =?us-ascii?Q?ZUOmSj/TsX5FLSOKVUDuCaaYqRiAkLuT3JM75nond6vYlgvThhJkW3n1lyoQ?=
 =?us-ascii?Q?X2jnHxqcNCU9SUpILeTbPA+at44vrJJ/wXY/r10O9NOiHwD1rEwPkOfcFxDR?=
 =?us-ascii?Q?TpkvpxEGxWQ4VMYWZnr3n8eI2MeHd4Yu5v7NVGOkXun/74DDF8x/RzF5piLT?=
 =?us-ascii?Q?N49xv3vput0+TyEE7+XsH4dhCYzoZ/7SJ1k5e2ThUmmUBiwNDhh1eG36x6x4?=
 =?us-ascii?Q?okvcE0vHOzy3qWZ3O7SuXACYYkmxUz0FZvVLSv6yCOB0FEkLxKIbmRk0xw5o?=
 =?us-ascii?Q?fjTPWQoc++o6x5zuTgJ66BSj5ANUc4El3rdd5u0Ue34mUZseVVBgWlBzbFdW?=
 =?us-ascii?Q?XoTDIiFe+jr9517Rn037zcW46p2vApTzIVOOlJtS+5K6w+PyNVoF2790aFF1?=
 =?us-ascii?Q?a/Y2yYu6tBdMFAD6RO0LHGJbR6tk0WSKzWpjLBG5hzd3MKicgqjtbCRhJtx+?=
 =?us-ascii?Q?KLcQ4p/2pEedW4FTkL99ErNxeynVSQeekpNf5AGTo2QtewDhxzxPZUFXEcBG?=
 =?us-ascii?Q?NL3Nvi/owE/ciPl6qAarYKE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 690e0068-79f7-4a0c-2ee2-08ddb95f1e25
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 11:53:53.4704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lHZlrICQeYP1rr97h2v3KvxDedLFcWFbKwv28QlUiNiiezy3Z2h2sP8X1f8MJUrTK9bKwQoENMS2EUEqIVbElw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8092



> From: Zhu Lingshan <lingshan.zhu@amd.com>
> Sent: 02 July 2025 02:24 PM
>=20
> This commit allows the driver to suspend the device through a new device
> status bit SUSPEND and resume the device running by re-setting DRIVER_OK =
bit
> in device status.
>=20
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/229
> ---
>  content.tex | 59
> +++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 57 insertions(+), 2 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 9213dc0..32cabfa 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -42,6 +42,9 @@ \section{\field{Device Status} Field}\label{sec:Basic
> Facilities of a Virtio Dev  \item[FEATURES_OK (8)] Indicates that the dri=
ver has
> acknowledged all the
>    features it understands, and feature negotiation is complete.
>=20
> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that
> +the
> +  device has been suspended by the driver.
> +
>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>    an error from which it can't recover.
>=20
> @@ -99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of=
 a
> Virtio Device / Feature B  \begin{description}
>  \item[0 to 23, 41, 42 and 50 to 127] Feature bits for the specific devic=
e type
>=20
> -\item[24 to 40] Feature bits reserved for extensions to the queue and
> +\item[24 to 40, and 43] Feature bits reserved for extensions to the
> +queue and
>    feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>=20
> -\item[43 to 49, and 128 and above] Feature bits reserved for future
> extensions.
> +\item[44 to 49, and 128 and above] Feature bits reserved for future
> extensions.
>  \end{description}
>=20
>  \begin{note}
> @@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
> Initialization And Device Operation /
>=20
>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) befor=
e
> removing exposed buffers.
>=20
> +\section{Device Suspend}\label{sec:General Initialization And Device
> +Operation / Device Suspend}
> +
> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the=
 device
> by setting the SUSPEND bit in \field{device status} to 1, and the device =
sets the
> DRIVER_OK bit to 0 once it has been suspended.
> +
> +If the device has been suspended, the driver can resume the device runni=
ng by
> setting the DRIVER_OK bit in \field{device status} to 1, and the device s=
ets the
> SUSPEND bit to 0 once it resumes running.
> +
> +\drivernormative{\subsection}{Device Suspend}{General Initialization
> +And Device Operation / Device Suspend}
> +
> +The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or
> VIRTIO_F_SUSPEND is not negotiated.
> +
> +Once the driver sets SUSPEND bit in \field{device status} to 1:
> +\begin{itemize}
> +\item The driver MUST verify whether the device has been suspended by re=
-
> reading \field{device status}, examining whether the SUSPEND bit is set t=
o 1
> and the DRIVER_OK bit is set to 0.
> +\item The driver MUST NOT make any more buffers available to the device.
> +\item The driver MUST NOT send notifications for any virtqueues.
> +\item The driver MUST NOT make any changes to Device Configuration Space
> except for \field{device status} if it is part of the Configuration Space=
.
> +\end{itemize}
> +
I missed to suggest this before or suggested, don't recall exactly.

You should add the similar normative here to indicate what are the requirem=
ents on:

Once the driver sets DRIVER_OK to 1 when suspended, the driver must wait fo=
r SUSPEND bit to turn 0 and DRIVER_OK to 1.

(you have described this in the description, just the normative is missing)=
.
Though it is not a blocker to me.

> +\devicenormative{\subsection}{Device Suspend}{General Initialization
> +And Device Operation / Device Suspend}
> +
> +The device MUST ignore any operations on the SUSPEND bit from the
> +driver if the device has not been completely initialized by the
> +procedures in \ref{sec:General Initialization And Device Operation /
> +Device Initialization}
> +
> +The device SHOULD ignore any write access to its Configuration Space
> +while suspended, except for \field{device status} if it is part of the
> Configuration Space.
> +
> +A device MUST NOT send any notifications for any virtqueues, access any
> +virtqueues, or modify any fields in its Configuration Space while
> +suspended.
> +
> +If changes occur in the Configuration Space during suspended period,
> +the device MUST NOT send any configuration change notifications.
> +Instead, the device MUST send the notification when it resumes running.
> +
> +If the driver sets the SUSPEND bit in \field{device status} to 1, the
> +device MUST either suspend itself or set the DEVICE_NEEDS_RESET bit in
> \field{device status} to 1 when it fails to suspend.
> +
> +If the device has been suspended and the driver resumes the device
> +running by setting the DRIVER_OK bit in \field{device status} to 1, the =
device
> MUST either resume normal operation or set the DEVICE_NEEDS_RESET bit in
> \field{device status} to 1 when it fails to resume.
> +
> +When the driver sets the SUSPEND bit to 1, the device SHOULD perform
> +the following actions before presenting the SUSPEND bit as 1 and DRIVER_=
OK
> bit as 0 in the \field{device status}:
> +
> +\begin{itemize}
> +\item Stop consuming more buffers of any virtqueues.
> +\item Wait until all buffers that are being processed have been used.
> +\item Send used buffer notifications to the driver.
> +\end{itemize}
> +
>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>=20
>  Virtio can use various different buses, thus the standard is split @@ -8=
72,6
> +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bit=
s}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits=
}
> for
>  	handling features reserved for future use.
>=20
> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
> +   suspend the device by set the SUSPEND bit to 1.
> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Fiel=
d}.
> +
>  \end{description}
>=20
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> --
> 2.49.0
>=20
If you happen to send v5, please add above suggested requirement, if not it=
 can be added later as well right after this as additional patch for same g=
ithub issue 229.

Reviewed-by: Parav Pandit <parav@nvidia.com>
