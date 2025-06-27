Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAAE1D63C2
	for <virtio-comment@lists.linux.dev>; Fri, 27 Jun 2025 04:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750998804; cv=fail; b=CpVI+wxfVJExrsqeA1RNB0K3VILOLgU+iqmn+Ob5d54GRsrUpa/SXq+fgvS7PqYYvh8be5Yf+r9kjuZafgK3OIwdhABvaF3FTRDmZQ+f+JXC218buJ/BX+JH0aRfKCbRJtUUtpncwzAwrqI2QLXAhTBzpsyVVx2VpE+RfEQVQQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750998804; c=relaxed/simple;
	bh=fVmLWbgZjTgKnzEcInZcxEagHomFlAAFLuTUIkI49AA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aC/mLq5XN4BaxHJ1f7eLph9d/HXBSsSu07FkJbZRyn8QL7eUD4b4VmXS1opPQZdK7VH8h3HDmKTo+F71Wv3cDdrFU2oiOk7iKbwZG/5LwH7czIBUEHdFbK4Ux5mhYj+77lePXGpVIKUd5mezEns+YCUVPBbFYV4lxhEhhsPaoOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dcGFsYWq; arc=fail smtp.client-ip=40.107.93.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dcGFsYWq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u70LdbZmfIZkQPoeyCsHHkUpQKi1p1i6hi63OWuuXYtHoBgQHSoUIpnpWJB8uRikCUGyZtyGm04OPZuOmJnPjBrSvkGUVdQLLw61mt48xNbSjc8Z7IfMBJN4DAd+sI5Cz3rumIg/kCR51DeXh6C9FQICeQIPQ/A5UhhVNtj5Q1oXi6p0iEpK/v6tAafva/V52zmwmIvlGf6ZlAmTxPEzOiA/IhclW+uJpB9FNGrvaIcmSVRFEmLoBKkYmv6vpWJMS6KmF97GlAEAVcjwLh3lxLfEgjKVaEuSyNL6Pfcnbd0T6Z66X9kvPMZXSSw2eSHMuSvNcILx3dygPKHtAjpVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVmLWbgZjTgKnzEcInZcxEagHomFlAAFLuTUIkI49AA=;
 b=KxCMJRrcCCqEOOUToanD4elAlsiezRWzZgokkCnZj8CV8iqqk7HKo2Vlpi2bELVZehr/5oLaFjvf7Uxmh2WccJdZzYdC53AdN2FSAMxUOIYaiFVTxJZ40b+ppB3v/pYCIjDR3LmnXV/VNMTO9PJwNBv5UA2zzi0z+6K2JTtYwJ5O3U8RTlVkNh41TNrCZUZD+hlHdjGnbOucjAy2+ZWJ3vsQrfpXNZDNPERj3wjG5nbDDTLqj/75xQsWnsqdy52BH5TYoPjn3szd6g8E1AD827tM3bfYho5ykIkZBBqPTrLhekvEK5Vl3DKCSfEcRji6kTKSrytqFr601fkLyHOh0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVmLWbgZjTgKnzEcInZcxEagHomFlAAFLuTUIkI49AA=;
 b=dcGFsYWqNAjb5l3fCuW3UuMeAGnsgYlRDJaRuexqK/DtyBWoFIGtHSJNFEhDIgme/IniYloxX6jsScnpNN2r+IQTdPtRR7qkLQgx2Zshyr/yBqWSqSLSjrQ7wiWyr25BjWIqfdc5ispsyohZKiM7H4zquCuUuZgWF4Uzmj+JgeBMTkIJXo9LYME7FEGvRzQIsXcffOJdBp8gjuWn1e2tcgNg6Gi4cJLjYWOmyuEQLrK5XAroyl5cKwGelkgfTCOmzNHaEPwoeU7CpjQLJQNrZIxD86bMgIsNWJIjj7kPtI3aT2DqVDl215n9eeZkbTJibtDpBNBTbRuLpRDQEDTuTw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA0PR12MB8648.namprd12.prod.outlook.com (2603:10b6:208:486::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 04:33:16 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8857.022; Fri, 27 Jun 2025
 04:33:16 +0000
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, Zhu Lingshan <lingshan.zhu@amd.com>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: RE: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
Thread-Topic: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
Thread-Index: AQHb5BoUXKPusOin/kiYESw2fMoAA7QVWGyQgAEXi2A=
Date: Fri, 27 Jun 2025 04:33:16 +0000
Message-ID:
 <CY8PR12MB71958D9BBA8AF99B81275952DC45A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
 <20250623083637.296041-4-lingshan.zhu@amd.com>
 <CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA0PR12MB8648:EE_
x-ms-office365-filtering-correlation-id: 4e9f5dab-0652-454d-7896-08ddb533bc5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?XhV7iO2mqH1AqBuvpIxU6dkKxhWTe1fPwa0qMagMlESn/c3oZrFJ1y9cnX0S?=
 =?us-ascii?Q?RPNqc04Xh4O2MQ5qyvg1MF+tx8TFUtafu1xIqphF2hBl1ckwZuoIYvCSNoIm?=
 =?us-ascii?Q?Tb3lF3rYq106sRj4XGiCEqTDDUniUdc25Z67g3/cxUaTjV+3NWT5T786FDER?=
 =?us-ascii?Q?Fv7bSii0WxRrIt6mdhdxqkNyU2P997BUhlqs3kO3blOIrVgHraP3ZhM5Ajkv?=
 =?us-ascii?Q?dC3w97SclTvqLqBLXeWQ7cdqPCbpoRB2WuJ/9stXjtuLe/u5wWAY3/NVbBVA?=
 =?us-ascii?Q?XhtnjWZwSsmL8orlVvkzcyxusw73iKG1g4HDVCxrwqJLgAlDALTEdVXcwDOs?=
 =?us-ascii?Q?c7Uc1sxIJrnzpEQMC1+G+Wd2+OdcLvkuX6ZGpobAEj7fORLQJX2hn5EGrOvv?=
 =?us-ascii?Q?qSLJrouNI/SF+C03rhTiDdeTLStS31h5dX9vaeNgEk27U6YjB2+QtdhA0l5G?=
 =?us-ascii?Q?RtxSUjUGT+zXnLhdocWhWcz1KLskzEclutcsYnLE1hA8cKU93dj4IpUcQEjY?=
 =?us-ascii?Q?BNZk7rkyrG1J5H0z8sTBXk4sE2ykHw/BrPrLAgfEN6aNwJg+LKogo1pCGY4e?=
 =?us-ascii?Q?W5i5fwlHdhBOkDkON8nEM5DpWE1YKTLkDSvDBXn/35pM4FVbsmgEVnhRux9u?=
 =?us-ascii?Q?hanl6IIZjOF/bdHvH+rxZsFRPCXdWuHaxbVacNdKO5Moz8ZN9GsjmyTVfKFM?=
 =?us-ascii?Q?5y3vMBxVO3TpYy8dcsLOSgJ9ihhjpHIsgys/+kpCb+V5bihgh95M4fc0d0KR?=
 =?us-ascii?Q?FI+dnhCMzk8Sv+Ntzow5BNhklj448/P4mhR0rjTGwjbW2Ibv52d/8GyzCkoO?=
 =?us-ascii?Q?tmqenY8PNuNXlyUMsvZIzFF/1rKf4NBEm0j8CwwC56ecjzHmr6996hkrAngZ?=
 =?us-ascii?Q?4YKiZKCom+oyr+df75rx3hkmi1MbUT1Y7me7MNSzzqiGWTkot0SVDRybVjES?=
 =?us-ascii?Q?hDqjWfmNddPxbI6TM4Gq87PA/O9l1cRXYv/5rBxhvdldHH0gQFenyt+rFdYa?=
 =?us-ascii?Q?Ez8FXHJkiKyjnwumSweMgEMAz9LWKwBsnlUVP/WBjlOD+HdtLk+sRc5L/HPy?=
 =?us-ascii?Q?nGr6jAP5cYpkflmpw3ZG7OQH31+uYNVvSTHue/46238McLMOZNndOwRSanbM?=
 =?us-ascii?Q?4oidoWHCG3Hf7V/Uw4wcQm51d/P962HuhgRUA3blSnQNNIzULqsdSypVNr75?=
 =?us-ascii?Q?gontp2c+iHLKJR30Coi666cW3DwsbSP6VOm+D5ZGwXI3nmXVhIZRFXS78t9C?=
 =?us-ascii?Q?PjHYi4r7TACmaLM0z6lWDSb0WJxuZeyt3QNkEebSFsYQnGSA3xfSwWtYfYsA?=
 =?us-ascii?Q?yS3Hvivf/ojrhQi+5grzSNi2GjygWGeMIPQKb63DiEurjT/GmnytLpetH7HC?=
 =?us-ascii?Q?58mxSXG/OpLJSZUsFaoodVPEm4JW0D+YUHCRxWdp+wFOjmLXPFW6a2I0bjNs?=
 =?us-ascii?Q?i4yRiHSAEbOzgdyCYEAKQo+BDLHeuYU8z/cEoIzW/p5RSoOtav3sjd0sxbB9?=
 =?us-ascii?Q?7TNGiB0x2dXWpLM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?R8wlLbCkd+6Wu24gtU+pnE41vuleB+qjKExqLFGLqKhzyd3hU2OcbYOc9/8H?=
 =?us-ascii?Q?ZiAzEM2rvFcg8BbVHYZVd8h2M4EaYFErgzRrhQAbUCW+bsHKUB0AtT1qx6Zs?=
 =?us-ascii?Q?SpwxasswRo5mtSfVesF6/G9TfUrlugheCoVZAdNN9536yqmUCz291oKl5iMl?=
 =?us-ascii?Q?1hWj4A/M4MHje+c3RHaI01Irg5gvmuasK1Y6LC+Humbk649brFL/j5DJGU9p?=
 =?us-ascii?Q?jTQxofYbqQYBJANwBmWC1w11TPOxgFE6r3gD99hWAn4kjzpsops6YL6jj7f6?=
 =?us-ascii?Q?KsyJGXgjjgKzMJK1zLqW/DSaz9Du3nOWVPcml4kJ7gYvbf4NjTIZiIerbtRt?=
 =?us-ascii?Q?w/QsOFGfkAiXxq0JnL0f97PwmdcrK4DwLvpGR8fEUAoS85xAQXS/u3X63LmG?=
 =?us-ascii?Q?1F7jGbwPv5gQIzNohhSVQEZESssnpyqFgXPl+q+qJo6hsNXl3tyHnUVG3iXP?=
 =?us-ascii?Q?oATkyrn0rsE+KkNfrjtTtEB/yXoNN8mZGU7RpLEPWTL2B+5gq1YHAFYcsUSU?=
 =?us-ascii?Q?EtLgrFDOG502CZBK9Kw0COSboZ9+8Fnv7sUDmFg04HmHobDjmH5M/gdOlWtd?=
 =?us-ascii?Q?KdwvYpnSPcjSofNBWZCEYlYH86E599t2uOEmIEmVtGWIQL8Nnw9zMTfWpZtB?=
 =?us-ascii?Q?TzeuByQvQFLEH/FmbhlO+iH2ZSFxG4fNK8eHE+nS942ze777tfFWS0pmhzyV?=
 =?us-ascii?Q?hCOjNPD4IHRQxf1VcEfwHvJLTeCaSlQX4RiFfEper8o1nzcnBTKUPQ11zXIp?=
 =?us-ascii?Q?48SjYde0vzy5eAkzouf0KanwlGaztHqMGVJwMqo/NLQrz+za1EGNFb4NiACg?=
 =?us-ascii?Q?wC0HOvVbuwzHoXu0SOU4Cz6BE9JllraimwF4vbmy4AOt1ukPDZdl/qMXjTru?=
 =?us-ascii?Q?sUSMLn3DKIdt7/fUQdDySwH0W+0W2L6PMO4Fg+rz4Xjy8Kt93Mo5wjT6Pj8J?=
 =?us-ascii?Q?wwLB0T2uKMySNoBHU5CBpkm+Hcai2oeOzcQAhJ1rqg/G2AdBUdq3v/H3dyA7?=
 =?us-ascii?Q?WaKJToDxhYBmwRPF9iIiPdXBR7b+M+gy7oKfAvTqb6InHnTW9uFi7r+SwFoZ?=
 =?us-ascii?Q?qHzCPPnmODfyblSQOFyRaI/qPFw7rc29jc3m5mX/EQPvdedgDVMqRoiOkaYo?=
 =?us-ascii?Q?U5cdyGO56chye+qhX5MZadjUDbCluErclB2uOPSzSvS8odr8ZD5WrndWEAIh?=
 =?us-ascii?Q?M8DH8F9B5uS9vOTu++zqWh8RDbH7rIm/tONftFLuiuXiKniwHgoYLPn9HweK?=
 =?us-ascii?Q?n/xAhJUDJkMlIUlcaM7PXrnJzIPf1JWhblpKluBwG7zCQFhQfRuBlzNLEoFj?=
 =?us-ascii?Q?2zGcVEY1bPDcAF1Ij90kzyNLkwoGWcVFiq6o89VPxw8dDCHzLvCKjfMR4BMR?=
 =?us-ascii?Q?T+5/9jHIGlS19TAqtQR5j1ZHLqwWTz7qOp5tJYEEh0KIPE7pKc8DR/84aCB7?=
 =?us-ascii?Q?Ch1PXnFTgeCs2zvXZsk2Jcf6R2WwD/MTk79IVEHN1heL9ayRDZ5YNQ/5y5n+?=
 =?us-ascii?Q?2NFYVuZP89Z51zfjt5VQLYNtDqZs5kGhJw/uim+qssJE4FpPvPtdB6JTRvh0?=
 =?us-ascii?Q?9KXdYoXqgT94Fu1o9lE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9f5dab-0652-454d-7896-08ddb533bc5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 04:33:16.4146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iHkfKS4hpQIMqIbjgyThKmsSkpEpsJ4T6m+2oy0SrBoihyAjMfC1YEGndtx/PjDc5Z9YVpRID+p3UUznbGCukQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8648

Hi Lingshan,

> From: Parav Pandit <parav@nvidia.com>
> Sent: 26 June 2025 05:30 PM

[..]
=20
> Rest of the requirements and description looks good to me.
>=20
> Can you please fix these 2 small things in the general description and pa=
tch-2?

This series in my view is reaching nearly good state, when you post v4 with=
 these small changes,
Can you please add below line to the commit log?

This helps to connect github issue, patches and subsequently voting ballot.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/229
