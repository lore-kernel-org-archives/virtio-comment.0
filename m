Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4674A21
	for <virtio-comment@lists.linux.dev>; Tue, 15 Jul 2025 07:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752562952; cv=fail; b=tihS2EfEakmnKsae+aUJwNBGw6gQM5WBZmNIE33Td1N7zPMEpf8LfRaLIRsgBC3n3aXFjzBYot8Pg3zTxyJn8cspCPlJCz9MLgOMUXxgodw5RtAPotxILWYS+A+FBHX3RkokYh0KHAZvdI5+Uur6IJQO5mCMmtkrfgnngA+yu5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752562952; c=relaxed/simple;
	bh=1aDD4FDyLAy7u6bAKy9AIpvHqQR7DqTeMHEnPzzjXZk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qc7JKSbdyoNztZ5AtFIt69KNxlhQABJZ9Y8iknHer9nOk6C6e+kftmhOLpdtLDaHwwfmawBYSaWvYoFlA0blz3vYgp9OwTRix48pSOIsaXKsGpi2WdcqfY1/R7pC6XgYX5kJOGejEpwEgeNeYcsmA8MQYajGbqUFWonlMjUDhYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gYjNQybb; arc=fail smtp.client-ip=40.107.223.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gYjNQybb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NV1ft/XSeAgaMvlV3pKfnlPeP412AWed8qcbxcAgAeuAValGDfqvbNgtuLHCL1A+3zxGxFNayHfD5gvxijh02QnCOkcghUuiwuIprRgM4E8bCGp0mMdQdvYFG72BDvHpnSw8u1wquBgNSGleyMOstAry6Hc+9gVY+BVLD3ik6GzUUgw2V0jiPKU6YYL3rdNJxahsAuGC8BHQrnaevNF9dZM3VsN2yQX8WfLpmcOmtkhAfEsF9X9OD5xxsBMsqF/nWae+bShZeHp8BW1fVYmX/NAVKD2vEOfclX1RJglU97rTgtjZeDrNlzVEtU4o+QFUgWctUODpjSn7zX31QTjbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRB1nQ71ran8GE8YVmbOKZ+4MQ9z9dIsYPnOexCIx5g=;
 b=hO6wVXjN/jCX/q5fuuv87biOSQRwcrTLQW9kozNN8Du8oV3sega4IJBnNeg7TDytChQuno+UBoOcOnM5evasvttMloZKKtDeSJb3VqFyY1wWHTdhWCg5HtP1iKtqzOdobVcu45/ZKK0gBOxmrmwemJ2i3cm36ko335Zyoq/kOaAlcuNh5RHnLn5IUNvPZ9xvWRb4S/3o6JadHo0RI905D9QlPtF3FA/KXPRLxD0tuT1sbU+0JWs7qYIxWjQuz6azMmYI8GfeX9QMVuAXwpoMHy7mkbKZTC2nbeaNMMxvz9B7wrwRj0OoVu1C9UwbkPczr3Hv2R3CBvlUVuZsBxN/pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRB1nQ71ran8GE8YVmbOKZ+4MQ9z9dIsYPnOexCIx5g=;
 b=gYjNQybbxdOIjeVYLDsMr5JfZncukZjSEoQyr/MtyfYcCHylJL4QQ21/6bucMS4UNbzshshvQZdw1p6V7Dfs4UW1nTobrjKbln1kJ6jUe+bFFWg6JATDZQ5MioOQD9U1T/j6Q8ODt+n2t7jOFeE4nSIVysqrBxhiunlieIkkFjWY97QOfCdEJ9eQOWx+AOy1KKMBmqGGtIj24ITt+rAJU2SiI5U4vjjdYfqMZ4kdRHzXcYEa0XJLws67Okb8Soc1j4gcEhY3wz4rJPBT0Sof5U6S5GOMihugbVixO44JhvgJO/j4o/axh2X9X8S8zlC1YwYfx+qYQtxjMqn+Qoc2gg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH3PR12MB7522.namprd12.prod.outlook.com (2603:10b6:610:142::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 15 Jul
 2025 07:02:27 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 07:02:27 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] virtio-net: Fix ipsec broken conformance links
Thread-Topic: [PATCH] virtio-net: Fix ipsec broken conformance links
Thread-Index: AQHb8Nn5DugO8i3T30+84r+J8jeNfbQp+mIAgAjQe1A=
Date: Tue, 15 Jul 2025 07:02:27 +0000
Message-ID:
 <CY8PR12MB71955EB6DED814D55174D06BDC57A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250709140049.507870-1-parav@nvidia.com>
 <aG6X6GwEqOP9ONck@fedora>
In-Reply-To: <aG6X6GwEqOP9ONck@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CH3PR12MB7522:EE_
x-ms-office365-filtering-correlation-id: 95c17b6a-6f4a-49f2-b6ea-08ddc36d8f10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4z0KcxMCwkkFwjDQNga0N2wnzKRVLB2PRLSD/cgsfhodfUHJQg+JJOwxFmL5?=
 =?us-ascii?Q?yu2qtrAEryTe/VaOPlbGi3zAqVjQrCXLraesbHeB/AlQqjRXkb046AurU1vn?=
 =?us-ascii?Q?G68s9aBJAFLpCjLJ2EboJQkj02EXnGyyt6VS4WpKVbAL6klBGUiglCUPRaau?=
 =?us-ascii?Q?z6s9+4vIIpN7Ri4Czc/w1XJFlWu1tMW44r7SStyXAvQ8l80Ygkhxft6RNwLr?=
 =?us-ascii?Q?61VZmq9gRlmiaBegwbVBeu71rRj6D4EvePURV41iWmXa7nuRzhK7j5agt2b7?=
 =?us-ascii?Q?NZ2nytX1g2v3rJ+j3Bwqyvttm8lzOAJDfsCJjDIFkRd8Ly0kf79dnAXn8UtH?=
 =?us-ascii?Q?31eCzSIdJ5KQnev1LFSGyOiq0jX4NLHDOemDhvIaFH3izkWSXJlgI4gheYzQ?=
 =?us-ascii?Q?k49EQAUVJI5x4bRAgPAz/zVUmpcfRb+0AML5sLRSIN+LuZ3to5i9ObzeVOaR?=
 =?us-ascii?Q?QiM1limoDEU3rDx95kwEw4ITg83nihQYjlDxx971xf1YQrGM/BciEgKJe6q4?=
 =?us-ascii?Q?TAAx/DrA1qMj+6hUp+uCeWtxOQefOFUF6wm5o7RHiqx2v4cUVW5tzlv7Gqps?=
 =?us-ascii?Q?INBz96es4eRRx2Ocdxec4DcG3EyskriHQqwUQUAIpd6O3kL2SvDawwv8Ivem?=
 =?us-ascii?Q?27ZXsbYvdurmAVXgB+AvLEnMbdXRXdTLKx8SUrwdcO4ybedySDOTtis+ch6d?=
 =?us-ascii?Q?YD1zv7Pzs/QZmva8LMVJlKiq+Tu014ikNrpCUmXfUekH4RvzWlCEKG4uIkNu?=
 =?us-ascii?Q?E8bSmz8x7XqYNimEMQPJJRlhFaceb1KtyO+MNiBjATycJpKb8++2X1/ac0j0?=
 =?us-ascii?Q?UHHmcltf8j+CeaN9wlTaVvhCmyDXS/XVyid4MsJN6cGXkgj2vQyJkdWAp8lb?=
 =?us-ascii?Q?pkvX50kBCb0aA9PkUxhVknVNA9vp/AkQpltNFxXyJ5OVa4o9nlH74q8vfIF6?=
 =?us-ascii?Q?PgHzzPm71UhyTnYR1owKQv3q5Ufq0mFUhC5e25ymzHEQMf2Q8lhumvXQRnHc?=
 =?us-ascii?Q?z6S+XThKYNiqjyKIU3XnP6VqEPvlGX5TmkeZKLxw+zHiR6uK/xaq6dbgvh7p?=
 =?us-ascii?Q?rStuhylasjqdUS2rmrrYzYOTWsvPRPPx7ShwGXdyznhabXIPfjJmaSgimzNq?=
 =?us-ascii?Q?ciH1glWwUn3ZQgv2kv4vlgqbJt/p3I4Kmgt1UTZfZ4oYinHTC7gsyl4/wKOe?=
 =?us-ascii?Q?pFBvh4Scr7Vu3nCmK/JoSsTCRXnCkjXYLnSlDVoAkbIya8OIyOv5XAeOzIax?=
 =?us-ascii?Q?Dr+YdYI71J6OkjUvwmTHDCjkK7IALChWMulAgmzBii2cDIbKZ6YXJK/gpc/P?=
 =?us-ascii?Q?c/nttuF+VvjdPSnVrgLHx2nLzNcAjfeZvLdoU6GQaY5rvF+5rEieVyxCSqdZ?=
 =?us-ascii?Q?OCTMIncBa4SAZAbEocgf+hZEbrXbTyO3PrcB48Zo7lY7BZCBq46z2CSoRjRE?=
 =?us-ascii?Q?r+WRJhan6drQ8x0Tu5BLmPqdAclX0xv8UyqohQAyBQaPIrK+oUg/3g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OiPuH0tPM9xbK9Ymd/c3GHh/jJgM7HpFkKuOJa0u+1nSFNN/CmT8/VBs/ctY?=
 =?us-ascii?Q?lGURI7+3gE3prCRYiVScxoFXvxiKvMSwzjjuPLExMvq5OLqACvhahcrk8gFv?=
 =?us-ascii?Q?e24GNYlboIqklvCcQhrDLTQWbs/vyLHw+bssIa+Eq9ZXAY8qB2Elf+CxLqeb?=
 =?us-ascii?Q?trT/vWYZw36192Vnvd2BJuXX+BGjGb+M6RDgXW1a95QS64dboMavT5sZa6I0?=
 =?us-ascii?Q?AFCkfrMDNbQ0TvvxxHQm3ZV2eBhpUy1ATgsZoQ2fDUP6xzs/98o6HOgT3vLZ?=
 =?us-ascii?Q?AoqFORlER7hmS9GA3FEW9S8SPVWUrntptKvlV2/2Tv/2BNwRt+CJo8k+XQ0J?=
 =?us-ascii?Q?HrEXgYwAt2m+ktwxZj0WwFPAKw49shnN8co4PlpKBm52du3HRUFF9dXUcejk?=
 =?us-ascii?Q?lM+DiAkVLtSz2m0xfPdcyVHPSfDuZP05ji5yMRYIEDN1bQzL3QJ6WXMTcaDX?=
 =?us-ascii?Q?tJWxvnxSZSXYEzuD/3kp5geCNo697uTTsYzkBZhfFuFyFGL6sllpyCfjDEg8?=
 =?us-ascii?Q?qOcJ2q9dmUUkFHgNl8qfeFVMUoMDHvUSLe6jXsm2DQQG64G2WERdY3vZakiG?=
 =?us-ascii?Q?cgVI62hola3vSOMTP/uoaAzv1+virkPQNhHIsmHEs6w+D4O2GoMfVOqkBAYp?=
 =?us-ascii?Q?j9MguMgHRZ6cyYc98mawVGgjKPV8ydhKAY4qh2tIhnFwV6Xf3uDk361kTY6J?=
 =?us-ascii?Q?jhFa9TUZJ4nTFPJh7gZ6cCaY/8/E8A9doPghZ4yfKMRMeFynduPWlbsR40e3?=
 =?us-ascii?Q?ZBBVmc4qXeV6y37Au40oMLvZtGKvfcX8QZ3zFi/w4coFSiN6dBTQaCrVYftH?=
 =?us-ascii?Q?NR7WSbg6k7aF7xjju0H0vnwf7QTDg1Epk922XDwhGKNpp43cjNTHmBgpO8MM?=
 =?us-ascii?Q?74NL4RmicHBDm/gp308Z2M96YB60A7EwdZ4CrsesH4QdALWBQ4S/7jkdUXMG?=
 =?us-ascii?Q?Y3tvS11CODaZrsI5jjn0yXvN17KNOJdRev9ZJkcfZuYE0N55UL5nL9XcGYoM?=
 =?us-ascii?Q?UE0B99LaShFe7goq+2Vb6IVQ1yvZAfHdu+PPvgfXSO9hsCMtnGvy1mZzDQy4?=
 =?us-ascii?Q?7l+KE3ej/CcyOO+thFhG++DukqAgbvtSdzR5CYZ0Hh3erTPvtebZAgqqUvRg?=
 =?us-ascii?Q?C6XPugjJ9VEZsfxJaO6h5pgAvgvgHxn/jnGpIgpy/P24LiOZCxmzw1YyxB6O?=
 =?us-ascii?Q?N6WfbuFEoSUxPhtol/1MsX1Fp5Tt8wpTztEh5ZpVBjCMS1T6w0KQWvIbWORx?=
 =?us-ascii?Q?B1da/XfUd0oP01PzKUCDtVK4BDVAUgrbXPyaJ72iAF89/fqPZmAX5orcIH06?=
 =?us-ascii?Q?zUiUOu7pl0g7K8CeOCfrArKit49xppyfJILLSF6z4r2WLgOnFXomepXovIYH?=
 =?us-ascii?Q?Fxp0JcDtjkqTwOJx1Jr7upJAHN/zzjVfePRcvjb4k6EsJslf9np2pQQHF5m9?=
 =?us-ascii?Q?cgHJtKyjc0tYrJK+tCUR/EEbhxGMVmDZRUjFxvKATL2Z3HC2nSJvg7HkusRf?=
 =?us-ascii?Q?bsmsYWrHHLlT6Dzc+Vi36sl3omR4G64qm2DE+jHUIruoN15dN7K9a79CZtYa?=
 =?us-ascii?Q?F7R6BG6RTuaVGPfBpYw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c17b6a-6f4a-49f2-b6ea-08ddc36d8f10
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 07:02:27.5036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SAVU9Lsot6ZoCHEoYc7peDvfqyQwydNk3qu+qsDkOCn6N4YIK6mdscrf9FbO1l9uxjsT0VE2OTrOnF7xbFlyCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7522


> From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Sent: 09 July 2025 09:55 PM
> To: Parav Pandit <parav@nvidia.com>
> Cc: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;
> Shahaf Shuler <shahafs@nvidia.com>
> Subject: Re: [PATCH] virtio-net: Fix ipsec broken conformance links
>=20
> On Wed, Jul 09, 2025 at 05:00:49PM +0300, Parav Pandit wrote:
> > Fix the broken conformance links for ipsec device and driver
> > requirements.
> >
> > Fixes: a0b809a7ddbd ("virtio-net: Add IPsec operation device and
> > driver requirements")
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  device-types/net/description.tex | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
>=20
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>=20
This editorial change of 'Net' to 'Network' correction is merged.
Thanks.

> > diff --git a/device-types/net/description.tex
> > b/device-types/net/description.tex
> > index 415c7fd..da9ff17 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -3599,7 +3599,7 @@ \subsubsection{IPsec Operation}\label{sec:Device
> > Types / Network Device / Device
> >
> >  See \hyperref[par:Device Types / Crypto Device / Device Operation / IP=
sec
> Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-
> INBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA}.
> >
> > -\devicenormative{\paragraph}{IPsec Operation}{Device Types / Net
> > Device / Device Operation / IPsec Operation}
> > +\devicenormative{\paragraph}{IPsec Operation}{Device Types / Network
> > +Device / Device Operation / IPsec Operation}
> >
> >  When the device supports IPsec operations,  \begin{itemize} @@
> > -3656,7 +3656,7 @@ \subsubsection{IPsec Operation}\label{sec:Device
> > Types / Network Device / Device
> >
> >  On device reset, the device MUST destroy all the resource objects whic=
h
> have been created.
> >
> > -\drivernormative{\paragraph}{IPsec Operation}{Device Types / Net
> > Device / Device Operation / IPsec Operation}
> > +\drivernormative{\paragraph}{IPsec Operation}{Device Types / Network
> > +Device / Device Operation / IPsec Operation}
> >
> >  The driver MUST query the capabilities using
> > VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY
> >  to discover the capability types the device offers.
> > --
> > 2.34.1
> >

