Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15541148304
	for <virtio-comment@lists.linux.dev>; Mon, 29 Jul 2024 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722258820; cv=fail; b=Y/HxAQslznyHc+ckdCOLRuYaSrEdxEP5EbKZNixcXHyw7eRXOF/onZzNrJPSbQzSWkm3X0Y90BMXnYPLOEKm8abotL81REg/U9+ifnB66Q0RwResGE1vZU7dmUD0e5S0hqI/JVx4efzsnVCDbkLjpRQFhk5vb9bv6KHCQNfEDRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722258820; c=relaxed/simple;
	bh=hMyXeAsvfDK2t1REaGZzDZnOIzy4UKZ/C+uLBdFcnZ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZdDBQ0N8NdMxBF63++0YsDh86xPF/6krQFbopLEHjcUDF66+glTEKQidvR2cLflWN+arTbkpfk4YuJmez6Dgx0oCMDUB5XVlyo4LGpOq6+3IIwvuUrByGyJwk5av3BQv5ci2pMcTOdEkRFDtrlb9GxNuV+GQjoHBWwm7esdw8VU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=Whv5uVIQ; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="Whv5uVIQ"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46T9C3e8011709;
	Mon, 29 Jul 2024 06:13:17 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 40n0dqncqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 06:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WF1/9m5RZ4cQKD+4doW4KqAx1Nm+ZWwKEeakwsvllmtiLmhBSx2YjIqoNBvK+2QWbFrV7twGUwSCJb+Tpt0VdXWzxXsElMzEkxZ6ZOATRUELj+MYHSgwG0KpCzUmbykC9H+90RiFEqlW5lXd/Vh2WRXAcPKo4RN+fiTIQ5gbn4immbDP/uSVaXUobbLl1Hu54jLbJO6GdlMNvVRVXpKMRHiGr4o5atrhjn+sP6wkDHW0a4NbH/aZxvRLX8TktKkV7ob3WvNXAeEMJj/JSfvO2hrlijXdhMUOxWIOOQGrCq5K1Cg6EeMRcxK3aAafv0LQDDgc3fN4X9Le+YJttuQ4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMyXeAsvfDK2t1REaGZzDZnOIzy4UKZ/C+uLBdFcnZ8=;
 b=PwdmDUaD4JLw3ZHDdDSDb7SQDiOKTdsDcvoozeFCgaYsKsbM/aUDqkh0t8nIVRVanHjJmriE3Ngvnk/qLQTQT/rSalK3RUcFO9GPtZ+DafZ31aWKpzK+07WkyvX1bOpBnGQArZDL8GHBboN9VOBmePcJbxFNTE373PemNVfuhcVRjx5N+9YlEEQpb4o3wjULmebBVRQbdjGSaipABBS/N9gWC/32SFC5ViZNl8KjhQF3pVytMsEiQ3qEzyHLEWwk6PU6rC+n0LLuGJC6YdinFKqF+u2PcxmVzOBd7bxOCNHLpkclCRc2MkP4ADaChENLpGSZHeLlJz8pec82dKlnZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMyXeAsvfDK2t1REaGZzDZnOIzy4UKZ/C+uLBdFcnZ8=;
 b=Whv5uVIQXL8YXsBfYt28qJIll955LAcHAFyXW3ZXtl3gbL/Ufx/P0+qNecbUHmjP+qiLw2dwWU/RoRmKG+gj+lpMtzgN91mDs4juHcHqijlSznK0jMeCGkmGpcYBpxRB5JVb8e+7r5frHm2ykPVKu1kqF2EBsjGgBfSatvzMELE=
Received: from CO1PR18MB4714.namprd18.prod.outlook.com (2603:10b6:303:e9::18)
 by SJ0PR18MB4043.namprd18.prod.outlook.com (2603:10b6:a03:2c8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 13:13:13 +0000
Received: from CO1PR18MB4714.namprd18.prod.outlook.com
 ([fe80::26fb:729e:a947:3e06]) by CO1PR18MB4714.namprd18.prod.outlook.com
 ([fe80::26fb:729e:a947:3e06%6]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 13:13:13 +0000
From: Gowrishankar Muthukrishnan <gmuthukrishn@marvell.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: Anoob Joseph <anoobj@marvell.com>, Satananda Burla <sburla@marvell.com>,
        Jerin Jacob <jerinj@marvell.com>, "mst@redhat.com" <mst@redhat.com>,
        "lhestz@163.com" <lhestz@163.com>,
        "pizhenwei@bytedance.com"
	<pizhenwei@bytedance.com>,
        "helei.sig11@bytedance.com"
	<helei.sig11@bytedance.com>
Subject: RE: [PATCH v1] virtio-crypto: add ECDSA op parameters
Thread-Topic: [PATCH v1] virtio-crypto: add ECDSA op parameters
Thread-Index: AQHazJKjJCn0Hb3A2kixH98LwsKrJrIN2AkA
Date: Mon, 29 Jul 2024 13:13:13 +0000
Message-ID:
 <CO1PR18MB4714E39350107952D4AF1F4ECBB72@CO1PR18MB4714.namprd18.prod.outlook.com>
References: <20240702151500.2280738-1-gmuthukrishn@marvell.com>
In-Reply-To: <20240702151500.2280738-1-gmuthukrishn@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR18MB4714:EE_|SJ0PR18MB4043:EE_
x-ms-office365-filtering-correlation-id: 23b5bb85-b854-4cd9-9537-08dcafd0338d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qw+QFGh+vaJJ7BEdszS+ckaff4aKH9y4ePl6nijnxqX8a/7UlkXCxVEuFDAP?=
 =?us-ascii?Q?1fyOesU580eGaRzmBWp6+7hN36zkJhAbH5LkhobrOYt7pl45Lvx1ZNGEiyim?=
 =?us-ascii?Q?VorvbUWXn0SgS1aZ7cmNtCM9s5BXYSuWMANEK14cA+lV7ukOXRz7TpqdLhLL?=
 =?us-ascii?Q?9IkGLu4uYbn1E9ZLLHl3j9WjmkWVLjN7Ruyed6HA24EKy8A4HqMky9DBh3L9?=
 =?us-ascii?Q?JlVttSlPWtjQO5hK18+EkBbKdoWzbxzEicpAp+1WH+kOxAEJYaP+Ns5Gg+LX?=
 =?us-ascii?Q?PA6RWzSX+OHwENKBEKxj85rrSRVJngyy9gRWLJK+Yrmz8h7lWVsX/q0kIHL2?=
 =?us-ascii?Q?QlGyf+C+UJNDLRJ45xwC8I8u0ioV7IIiQhd+lPpCvm9MPNqfwUBaUJ1f57ly?=
 =?us-ascii?Q?hAGs6MqaPFk5L/JqvTAoHmCJ6JCQ0eaiR/QY7bkQzCfCa+caar/e9O5h+UT9?=
 =?us-ascii?Q?VLD3hKa6yAy5z8fMSS4bc1US57foiKUSxFBX3Mr6zLFQh38iriICxBuRYRuE?=
 =?us-ascii?Q?qX7CGYCavYGXBH3+SYCg9q6+YRaPj9qcU3+19WIj5/8UMZGl4QnGhqIZpoKj?=
 =?us-ascii?Q?O61J4UQRbEc1O/Vj9chKet90cE9HNVAb7KTLzzHAO2zSRKb0IvjsE/5yjktO?=
 =?us-ascii?Q?eZ8/2LdzzTMLAb0PilyUEJ13dSfsocPLWIVWjjOjOKKO+DlFFmFY7+/5J6X0?=
 =?us-ascii?Q?dfpGuMYdBooKDqHYAzoNGfeSKg2PP74jsd3n0UEO02R7ThA91Kfz8Ry2dXFh?=
 =?us-ascii?Q?Vnc91W6I9pZAC2NKKgQEyX/TwfhDgiJw6/E1HgtpnpdxS+0o5MDRZYM5AqyP?=
 =?us-ascii?Q?8klhbSIWzeVWuXU9nI924Gh01aeWAwhRi5BJMiy6FmVBm9myAGNqNgu0CtFO?=
 =?us-ascii?Q?Lp4VtFXMjvyGHrN4OeODz6KDD9hUQXdDYje0Gq7MWw4EzupcOLw36PzkiYOZ?=
 =?us-ascii?Q?RvM+zWm7ZtmCY5MSzCzomRFaKBQxZnRoXfLsudq0fklVwdevklU9GW7JKKtJ?=
 =?us-ascii?Q?/F0zhskXfHgtVtQ8u5H8nsj1L3nxI9NfC25T1SwI1iepDIZZicWXGbPy0N/7?=
 =?us-ascii?Q?YHiOQLrGaPZzjLmSBOxcvbB2unvmibBy6s4dom2XO5KAYUR5B6J8kWsg+9AO?=
 =?us-ascii?Q?QOMqJFNqJ/j6RGgIrI7z+ogsq30EWTttnSsqUD/s4GKkvlNqFnUxc1QOW2Fo?=
 =?us-ascii?Q?dLyYrsE99l+WgzEvU9qBMoXDKQ9z7SyLuYIN3OVikDNk+w3eZ6italid0jZF?=
 =?us-ascii?Q?IB50DBrIVVvEr6ZZAsRp5yrW0Rsg399m+n8TKjzKA1hAae6MkPDj59bExYBJ?=
 =?us-ascii?Q?yIiLte5LJriYiUasOVWCsTA4reQwdSyf3fPUDQBfDxJCtVTUVG3mYCSVugH6?=
 =?us-ascii?Q?zUg1mHw9URGT+IjkJbk8H66xFW/qZBfgvTYMGJmkDIdn7N2dVA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR18MB4714.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bnbM5qjVnt5D0AhshDPP7JOA/QkKpDUsB4Obz8ZZLG+FSnCMqSDDWfmeAfrR?=
 =?us-ascii?Q?bWFx8WAQCy7AsbeuCwln4QAkb2DYYV1w4/s1kJpm6qrK5IAktfyp/eQfwff8?=
 =?us-ascii?Q?j96CjhYcK+QpRAruz4ZtL3+Sz1o3/lsEvnWfhXO8+JWiBCVM2Ognii8QAvQ7?=
 =?us-ascii?Q?tfG+Dl+WXYPWi/+jAhSE/cWK9iC2LPcV71CimIWGw/JhMBAUTBcmrPt7FthB?=
 =?us-ascii?Q?SOBH+Xe5pM5y0Hj8ESUBVxGDLFSVAcJFWlhxLkRMkF9q070G0qA899ztQewz?=
 =?us-ascii?Q?WIxPLE9IX0w+rVIQtJSaqwKtUb3DZW5YYCDaGQwveXCH/5mgK+8gihBPGQ2S?=
 =?us-ascii?Q?N5zoc72XtCkinYSMHfvAeu7gGa+wGosMWSr9QpTXoqlSNHV4G87hOOm1YzY/?=
 =?us-ascii?Q?9PMHxpn7AByyX9j0diISToExKoWifQRHGr0Gj9yPTQ++C4PiurAL6Rk7q9I7?=
 =?us-ascii?Q?TqOH8xjjaXDww7569HaBdTk+qR/8fwvcr6MrGQble3BdZB9Za2vu9UJHs3rD?=
 =?us-ascii?Q?1UDcNU1TnmI1X9fiUBUneaOo1dStARjSg90Wh6zP3MVrjmR1CkhQKN6jXodL?=
 =?us-ascii?Q?RKz0VeCXLCm0GIwUbTL2UazPYfgngYuGrLh1Rr8+5QKXkNPnjQVHXYV6gwbd?=
 =?us-ascii?Q?nLVzu9LSMceV8yJOx+G0AtLARGUgquGbW1TQ1NECiip6h+ZiBqf+0YRoxd9Q?=
 =?us-ascii?Q?OgT2lfeyp+OvixMrv9GXV3CF7K9i+bRwR3qiq7ZsWSzvKDVeBotAVZZnhwlM?=
 =?us-ascii?Q?IqVO5wGO3n3pEh8HvJIhQtzjUHI0EaUzYcop2ieNsCFLGi6jkModnRa/t84v?=
 =?us-ascii?Q?RgA4fWgGZpR1+/P4R3WS2Dmc1XBvSzKspOij4dBYoEG02+aGiRGNDhgXyGFX?=
 =?us-ascii?Q?lVO3yr2W740XsCCphma8r7LiH2pBY2iyhua/s+fQvcXfw+va01Ph7C3fF7Y0?=
 =?us-ascii?Q?+2nqrCQphKcnU5NFhJyGw8K43izQBZeC/pUnwQOQU5nNbtcubzqlXmbFbwl7?=
 =?us-ascii?Q?fOGnIqOfrspAkzO4iDQ80QeMaCsLKrFUSIXHH/ld6VWjprZn6c1VO0dz6LpM?=
 =?us-ascii?Q?YJv9181MFS2+74HYJ2weJcPV/Iycb0z2Q9gjR7I8B63kolKrGLSFHbznH2EG?=
 =?us-ascii?Q?oViBooIsG5SbZUjUYDxQ+suh8UueAb0RxN8SrFHuZp1hwKvXP7eyhA5I1a7P?=
 =?us-ascii?Q?HtI0TrHzupNzBdNhebHdgiHSV1JjtLL2Rw36VdBFT9EyoLGhotdOrnPjSTvs?=
 =?us-ascii?Q?HLL9RWR+fQV3nBccI5IZ0L8L2Us1vQSOe3MlJF8+dv47AyMPnP3/zPLebcbm?=
 =?us-ascii?Q?Y5X/v03Er1gosHDgt/NCJ7qq2BYlNAJGTvikYe3rq96mrCdD9+c7Qgw7pDny?=
 =?us-ascii?Q?M7duCEHTQN0yYyyhlaKxIAqgsLsSB8bGBQWgrx0W93JNyKJOHr2Zc7tK51ZC?=
 =?us-ascii?Q?p+PhIgdtPaCI4NYH+FrPoiK7E9IA5DGd43UuNflVPm2y2ng6a60+PV2/2fN2?=
 =?us-ascii?Q?7c1Qt6cSqul7OKINTDgz3LBA9UE4lcXDtqSsIGcwZFgmFD2mTdbs//SRKi/4?=
 =?us-ascii?Q?VXSNDftSo2LQ5IdMd8pMVcHEIF029HMvN3b5fbgA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR18MB4714.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b5bb85-b854-4cd9-9537-08dcafd0338d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 13:13:13.2335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yTPktZSEtJDBylWFZg9hFqe5jsH3cCiqqVGPiDN4ZmdKrbS9ygGGKcjMbwQyfSgMkdTd4S7Aqu+UY4/DkmckZCzkEi8ozb9weNin4drZuZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB4043
X-Proofpoint-GUID: ygdhY-Nvqqja3bGy0emqrdpVQwgg3dOK
X-Proofpoint-ORIG-GUID: ygdhY-Nvqqja3bGy0emqrdpVQwgg3dOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_11,2024-07-26_01,2024-05-17_01

>=20
> In ECDSA SIGN operation, a random scalar 'k' is used to generate one part=
 of
> signature. As this value SHOULD be randomly secure, the application might
> supply it through secure RNG rather than relying on SIGN implementation.
>=20
> Another parameter is prehash algorithm to hash source data before SIGN
> operation on it.
>=20
> Current data queue struct for AKCIPHER do not hold any option to input
> algorithm specific parameter. Hence, in this patch new fields are introdu=
ced in
> data queue struct for AKCIPHER to support additional parameters.
>=20
> Signed-off-by: Gowrishankar Muthukrishnan <gmuthukrishn@marvell.com>

Ping ?.

Regards,
Gowrishankar
