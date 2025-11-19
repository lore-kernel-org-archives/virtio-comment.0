Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010051.outbound.protection.outlook.com [52.101.61.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA2C28C2DD
	for <virtio-comment@lists.linux.dev>; Wed, 19 Nov 2025 03:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763523081; cv=fail; b=lqbDVIZ8TmgQ1ow16Mm/e5LI3jUPe3GT+Ao8Pg5V9vD1lMYzmCEGQAtuDTYhzUDwEPwMspQB647Z6bd6P7FFiZybm47iw0zkXKwWvJi+E2ikakTL77CjGkSZPB6FeuQww4F4XaDs9AD5i50jPW4C+U2PmVfyYffNRcEY9F2Dg64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763523081; c=relaxed/simple;
	bh=mMlFoQGx1xwY+otFNLHXaEx/vc0Y2iDUvoadLANjev0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZKU01Pm/dTcc0GMqGj1beOVHuT6djrPq7iqqhTJj4IY1Im4Z7exrtmZYsg6a1DOkzWKImE6PXnbjwm+AQ5vUA9K2wucjkvqNfQjC28IIFfs+3IzE/TYl8VkS8a7K5kvam7yXDXFfU5pqiHOpOvcJ3dmj9YyfAMF1sdERRx8AOlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nQf614oS; arc=fail smtp.client-ip=52.101.61.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nQf614oS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbUiwHaRkP8hdCJOTWfaH4lI6NMb7W0yw86orQzhec2uV6BQt3EMK1KBJoCVMq3YCzR2CeZQsglNjBfSYhBGBgapVpeeNwlBECcprEyPiGXWkGFFz98nWbTK1Rp/wm2eNflug+hUQ4btgb2R+o+g7RmRyq2bD3YgxcuW3NCugpJcrwfRKxH6WGh6jwkWPoJTR3aN6bTGKBaIp9j4Muy82daewFW3+Mxm0PsDpFRz/Poi6pnei/xiEliqoxKk0NQRixkLHCkLzJI5tosqWEkbSdo6D5ffAHjR+AdQMmM+3x4iyVegwntfDyROvDkm3k7sq+SdPJclJvDH6s2s52XJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quNGeV+qGRZMyaPwc8pustjS+m026yIKJQEjw15hD40=;
 b=xWfnMqAfsBvd3ln9jXUpZK9KxoFUzd9x0JyJKpC2bgGnMPPwD90XFepVTAQjaXljuvMdRG4nsvr21vKdOaMT5E/DCWmB/2O8QMwDeJ1nVkFj5LbNVHSA+sr7aGwC21gvRnBJAqKsse1DcnceSbRSS1kYCUADM+lkJKHnlrsjuLwYw1ULymWyN7I8iFym8V2pz7oXltnk3XHIVW/LfUGEvHt3/QGdAu4WUwTxoGart3JyxZ6c8tgrv57S/zIBYwDS1JTlcT+l37Os0BIG1JFfr0Qn6ctVaj7B4jc/nOjC0+wXNzht6EyTOfZcprYvsE5b4Tp26A+ss/tPLAwcFMD1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quNGeV+qGRZMyaPwc8pustjS+m026yIKJQEjw15hD40=;
 b=nQf614oSNiEIeARJw8tM6SVWtJn6ETvYHdsGZfPN3larN4kh4NOK1bBNAkCF+mlEiktM5+gwrsXA1f6gvzedwKJvnwA/g/VBIDou71PE8VidvPDB745dpwQLYQCGqanqiYmlxm82NQibIV7Z7n6nBqGuK74RVbquSDj4Gy1KaOgDvYrpl8dmXiuSfTJO3T94qWfhQXVrVtvq7EpHc5FK+ARv3GN9ytLG4e6lqxkkdDNAWC9QYL9kB4n4pS+Tokc/FNdcIkQ/e9BA/zVmwt5MExhllz8Evcpit1r8fNG0YoSd6zeFiNCyM5XL/ie/E/D+FfqLBdtT8E5gU46XBususg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM4PR12MB6304.namprd12.prod.outlook.com (2603:10b6:8:a2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.18; Wed, 19 Nov 2025 03:31:14 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 03:31:14 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf
 Shuler <shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>
Subject: RE: [PATCH v11 09/13] virtio-net: Add flow filter capability
Thread-Topic: [PATCH v11 09/13] virtio-net: Add flow filter capability
Thread-Index: AQHatoNRnBX4Fb+n60GlhbDJoF0zAbT8QwgAgABYXAA=
Date: Wed, 19 Nov 2025 03:31:14 +0000
Message-ID:
 <CY8PR12MB719573A4D5D931AD362DA449DCD7A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20240604132903.2093195-1-parav@nvidia.com>
 <20240604132903.2093195-10-parav@nvidia.com>
 <20251118170742-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251118170742-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM4PR12MB6304:EE_
x-ms-office365-filtering-correlation-id: 3f9d464d-1a6d-455f-57d9-08de271c17c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?RvjW2SnZmiCvvrk3iS4EcBLYPXBU0iiZBGPDsgBs0IrgH56fXPqbQDxB13Dn?=
 =?us-ascii?Q?MOwj7LrLQ4HHrP+XLqyI8dWEvKpWZHJiQiRIRKw4LuowlKdnJOXUvIPNOhkv?=
 =?us-ascii?Q?sqKsorQrsAwlCx/XrsWy7U/dE4FyNDi9BVPalxSdcP3fkKCiGbIFIrAK408Q?=
 =?us-ascii?Q?3BMnds8NAWWhXplvwk9Y342XLyH1Zn6Cs8B4MltIpz3Hsrq2F5muFWOnuGAW?=
 =?us-ascii?Q?GuyZga/kVLcaudRmSrpkT3f9Aw6m311gQ1ahyW0Agh7A6oqO0GPEr1HG3XEt?=
 =?us-ascii?Q?XkDC2nJNQIyyT2ZY34XGE+nmlQyIWLYk9QdNsYrdtwpd7jso6YpgxVbGWQ8W?=
 =?us-ascii?Q?OywxkJ0/jEzjvLFG3KU6Qi35w+1lDpHcJxj1RdAqaN1RvmoZztCqLiKc6zOY?=
 =?us-ascii?Q?juRXTHJ5YfM9zJYwxLVzFaVFCan5hT0T7VfrXTEHMBQuxvwukwpXjhwGMzkE?=
 =?us-ascii?Q?rN8uf9bXlT0kjc6mJfSrYRxCN3+HF2FrRzfcqh69Ino2sH4Z7va68LYVbmA/?=
 =?us-ascii?Q?CZV3aIS3MjGNgFb3WEJgS2eWt44GQDDAWrigVR+tqWPuhEsK+EKMzNYzjLJZ?=
 =?us-ascii?Q?x7bEcmIg4w7BEWmF84DaNdFOTTbl+NoVVSqqPpJkFCxwZazfrKeFxAljI0yj?=
 =?us-ascii?Q?2eiANIvpsOqYU3rlthaX1tnkE2gZ7vSPpY4w2w7RA+8Lj+se54NQo8VRA2HZ?=
 =?us-ascii?Q?TigfdxT5ruafAHFYvS5DB3Vm6dWE4+DQPSOxuyU11FbiWmhW1ij639Rq7tU8?=
 =?us-ascii?Q?dX+m1g0yBkRKJLYG4UKcJXBEhTpy5E9gbY/wq8lHccd5OT4wUjnbX2FHoMF4?=
 =?us-ascii?Q?5OXkjVi9cm5oOHV/KbAV3sPfWy9UylmifqFoPgGg/Hi+mqJI+EabPGJkIou0?=
 =?us-ascii?Q?DQRGignq+s4//JEuySfNJvbZMNL/U64NFwQ0S/BBiTbE3XIPkjtdxM5WnKe7?=
 =?us-ascii?Q?jpWCEzOM0fXsxzSEpejRRlncgsj1oSfgIbFDAi8C3GqQZvdrZfl544WUX534?=
 =?us-ascii?Q?UB/TsPcL9m3UaZbtCsCCVaYtHAXrzTburgDzbIt0c8sVNFbuB2fmgSRoeW32?=
 =?us-ascii?Q?icZwXaLZtVYdM9taAFoLsLpKJXNIk6/nfbtW2N+VDdJNJUjrXnZuxlrzn62l?=
 =?us-ascii?Q?ptClK7wfEL+tNuq/vmbQoqMY6ph+k3DlrzLouXiam0idOlgvkrEwwqcM2HK8?=
 =?us-ascii?Q?iPfFlL/neqvSo/EMWuhW43jlMfwP4VE8HtVBDMVc/Of/H5KvLmOqirCNcwLZ?=
 =?us-ascii?Q?1RFnarbbXFPZNspj/0vJ1ntdg/jS0xZJKSOXo6naqhd7mJR8QjZv/+kWA2HF?=
 =?us-ascii?Q?i+NKjpdA6Vjrf2Umti5pl+O7zFmPOkaJogRFrbRRj1VBXZ2XHtn9lcJAlxwd?=
 =?us-ascii?Q?9AhP6C9SUXgxKVY1bNCmdEfBzkqjUu9mTBT6l94Fj0knqX0ZD6/UwBppg59p?=
 =?us-ascii?Q?2CozltgL6Hyq71+S6SpRFciblHPj1yuh70iJq2Lgoewel4sI1HiBWq8T//PX?=
 =?us-ascii?Q?MFbL9BLn5Tfhdoca8dXsUhzCbnYN9mEKBmA7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Q+oRz8+og65I4djuHNA9HYhF0/MiXQnswZ8qzn1FEwhWMBVTqDvUc8rSuFSV?=
 =?us-ascii?Q?1xH9YAmd8nkf/DiidClSOLz1+CWgsbWNmSiA80bPWJcySbpThKyDTTm5H5va?=
 =?us-ascii?Q?yPix+IE93rxWWTW7Ot0AbLyihD4g1dwU2R9R6WM3e+ko1gmKTI6Zrk4ZLsC9?=
 =?us-ascii?Q?cnHcvQptZkdZjNCwzv6q/svYHm8Rv9ApLH5i8310PmrGiihRpSilhzQ76h1M?=
 =?us-ascii?Q?AlK8Fej//aRGzRBi/dKUF3RNYPCKsh3zilTpntH3fmLYavJSYFHjCtV9b6Oa?=
 =?us-ascii?Q?kSpjXeUQ9bRd84Q6o24pSfrY4XGZeMy+FsaGLnnT3ryYADzxlAFatsQOz+G4?=
 =?us-ascii?Q?xQn0KiKlbJa+K9caoL/BygJiSTnMyDq3VfjrLsuhuys8a1KRpShLo5tit2im?=
 =?us-ascii?Q?cX7QDwZ6MogDVO+Qso4ChfZ9ER+mmCLIbb+4h3L1NQg3XTdwYbAyQMEzJnKs?=
 =?us-ascii?Q?Vp9mx52r/AtXNdXvvIU2WgngCX9jMCI2ADiu5mV44hy8ua3XsORwcMP6PCLy?=
 =?us-ascii?Q?OhOBdGAJYtOrDJGKVpzMyS0GFVQSqFlRSsMIRsTkXx3QHxpi/sXPufJuDu2O?=
 =?us-ascii?Q?llAIdgekMBZz+3bdpnIRe9MRwl+MVcpIrKOIpOa5Khxu27zfwrdxoHBtUD2Y?=
 =?us-ascii?Q?topRMC5tJlmX1k3ARh1WeqKCVk4EkolIHbqdCbzN5bUOpBxrvZIrElkIjSlu?=
 =?us-ascii?Q?PuC//pvAKICafn8/v8N00EjhsoiiD7+zJKZ4HeA/YM8qWxtLrRz9jGqDI4WQ?=
 =?us-ascii?Q?vUs2WXX7caLIKm/V5CKsWHG9rJA24zXan37j4wGBSLs7gSFxkuUngjYMetbM?=
 =?us-ascii?Q?EV9P50FH0x4ahA2jUwOzITuBGN+ZKF45tmgxzJHIDAZs3NPQFItSwoAsfj4K?=
 =?us-ascii?Q?BxGpWul9q3UeyoKd+Mvzd6UF9EFQ4L9ao2C791TQmlqbXdEsrWVyjhs9Eegy?=
 =?us-ascii?Q?s1fg86Zm4GHWlSzmFSv79sIONhUQnD88MhWNTND+dM2onc0w8m8gCnqVpXW1?=
 =?us-ascii?Q?sS2WPZrJ/qmnfriyg3GwdKV4JtsM8IRYcOhcG3PGk2DaLFggxNwX6bD0awoJ?=
 =?us-ascii?Q?o9Mc7/nX12zXT0+/c3II76m6KaT/5WHcUHSxwxSI1Z9jbJEpIVuKQjaYpczD?=
 =?us-ascii?Q?69V96YJtr6fMPBUCiU9yt0BQ+ePIrdZ0LcuEJ1hyO4XLIUvyCRGYDQ4Ydwmj?=
 =?us-ascii?Q?fOnniKVTYorA7cCL9Rq+zv6DSO6/2xLdAsyvopUqsFEzbQeRUSMd7uzVEWIm?=
 =?us-ascii?Q?A1Mz1OuEuPNwygWW4sM4RS9ia4UD9fRP1lsHHL0YYW7Jz5w58N2EvXG8cNAq?=
 =?us-ascii?Q?DYUJddXXlLsIsjyJu1GlRuB5GPONVYHyDbfUFwMW0hEghr4jnk/Mp8fxUrLN?=
 =?us-ascii?Q?ng6/Fl6B6Qi+aj4uMfeNZuu1Y+f0X4XWwkhYeOXjXbvRuCwJlb+3MjLW3Lsx?=
 =?us-ascii?Q?MKovulD6th1nKh2rqKZmpbSL78y5lfADVe3Q9nI5X0n2VCWPP5DsNWNf4YOh?=
 =?us-ascii?Q?meO9e/HflZb4ka/Nx94ZmXUz9X+1h6ZxMUZZLdUIX/jISm1VwTWKTlM2WVvK?=
 =?us-ascii?Q?zS7/pR6DQbi9enq8MfM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9d464d-1a6d-455f-57d9-08de271c17c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 03:31:14.4552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ynhs2YUV5VQugQAJ1HxnoXjPWafNlHV0WOUkuiA11Noh4F+l7s5FogckbXdbd05KbQfe7gXZg1NGSsl6ExCzhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6304



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 19 November 2025 03:40 AM
>=20
> On Tue, Jun 04, 2024 at 04:28:59PM +0300, Parav Pandit wrote:
> > +\begin{lstlisting}
> > +struct virtio_net_ff_cap_data {
> > +        le32 groups_limit;
> > +        le32 selectors_limit;
> > +        le32 rules_limit;
> > +        le32 rules_per_group_limit;
> > +        u8 last_rule_priority;
> > +        u8 selectors_per_classifier_limit; }; \end{lstlisting}
>=20
>=20
> I don't know how I missed this, but this structure is not aligned properl=
y. In a
> typical compiler there's going to be a 2 byte padding here :(
>=20
>=20
> It's been a year ... do you think it's too late to fix?
> Parav?
> If it's been out too long then maybe we need a flag to fix it.

Structure not aligned to 8B size is not so good, but it is allowed.

The spec already has text as below.

Many device and driver in-memory structure layouts are documented using the=
 C struct syntax. All structures
are assumed to be without additional padding. To stress this, cases where c=
ommon C compilers are known
to insert extra padding within structures are tagged using the GNU C __attr=
ibute__((packed)) syntax.

Above structure is similar to=20
struct virtio_net_config is 28 bytes.
struct virtio_gpu_config is 20 bytes.

Patch-5 should define this struct using packed attribute.
