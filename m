Received: from egress-ip11a.ess.de.barracuda.com (egress-ip11a.ess.de.barracuda.com [18.184.203.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D1D19D8B7
	for <virtio-comment@lists.linux.dev>; Tue, 22 Apr 2025 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.184.203.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315507; cv=fail; b=MCag0s7b3OOUpOwYSAEWE1KryDbi5AgfuYLhL2IaUVG+WjBDZv/j1q6I3NK7/KAFpBJM8YnHaObFjW5O7NUTu/FCK5X+uZUFmxE7/iS0PazjiibcnDivf0K3cd3PPC+HM2TSBqrhEuwZQNiAtOHKOcZKDhLd/urZ01dBLDh3W6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315507; c=relaxed/simple;
	bh=DsvHWQdZ7QQbmk3wGDt+xijav650uY9hSl7NbmjwO3g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KpflzuV1cLkDQOfe9z6RiUzBI0oITiYbDPNqxQbdJeuojyN8p+C4n7H+jU9+/7rndCiJ2Xgm20jGsd9+EUDyrejNGwktR4stohi0iUs+m0wpf1ApLHrz8kRMYJNFp9/wiCvNflCidLj/d4ZANCVyW/A/ZDfzwdLcbUa05bhPmwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=napatech.com; spf=pass smtp.mailfrom=napatech.com; dkim=pass (1024-bit key) header.d=napatech.com header.i=@napatech.com header.b=QxrKH7Nv; arc=fail smtp.client-ip=18.184.203.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=napatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=napatech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=napatech.com header.i=@napatech.com header.b="QxrKH7Nv"
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by mx-outbound10-225.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 22 Apr 2025 09:51:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+XyKW2qJKf82E5edLmJv4SGN0uSh624+kg1z15IWd03NSQZqPIlPCgfrG3lsWdxMgha6sNbPmqAWxR4xD7uAgCFPCCGtrnKGN0+SoPVDTwZ/tRlta/8/4dQhnjf/PK7evZLaO45E2XAQd1L7lvDWleyfB8IrDLykx4pQQHgXz7fLkhcSOAgogAeAhkgrLzA9b81PsUFh2kcru1uiD8h23zgacexswABz6hIhUF5xOnmSaLEt6TGPvxh+GdEAAKcKVf/VqMmrWMgtuzY8geUds5Eq7LI5QM8m9LktjojJbZg0DYUSaFzDlmufdK5OEDvwWmFvuqirKY8buK9gAZ/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=docxkeEFbqZ+G2XUsT8hO+5dgo0BxD6gQF1hkPdyyeQ=;
 b=VylrRrFcFAxkM2xMHakZgC55My32lp2GH3Ha3WeGXTUvQiPvOamcaL4gan0BUlCRb3/pyQcpRIGx76HVvKp6MP0YEnzitQ3qXNhnO1rHpZGdIuEMe8TjnhxFISpthXlbpbDxc04HxAET4heZ2CRcdho8/5Fh79B6qB3VYmPe2P0n/56Fg1S2YYgAUcLckZeD1+hCZL/A/wnd/l6QWixOL2nHqTEVOkaNZA8TWiO66pT5giVmdyL9wwoeC5nHlLv228XynBLSZ3IRvO4jPMOvoNtQjXid2DGCmblnBmQAiWXKqNZj4OylQjncUqXQl5o3r/PP2Gvfsa1T961e7j0xHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=napatech.com; dmarc=pass action=none header.from=napatech.com;
 dkim=pass header.d=napatech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=napatech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=docxkeEFbqZ+G2XUsT8hO+5dgo0BxD6gQF1hkPdyyeQ=;
 b=QxrKH7NvbvkER2AQ2vjxuUNjPqDXPPv/949gSLZOcdAbPWBGH12/ncU9DP87XzyfoGlhg9MSo0oD5Z7D0iOf1IgrUtjlYIHAES48vT4WYnPFgCdp/DQi6s97NHDCXGTwhUwcTXfkNUVeBSnBnsrs0KZYMHvHYt/AP1/JjBxesh8=
Received: from HE1P190MB0265.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:55::22) by
 DU0P190MB1980.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:3b7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.33; Tue, 22 Apr 2025 09:51:12 +0000
Received: from HE1P190MB0265.EURP190.PROD.OUTLOOK.COM
 ([fe80::b7ef:5ac7:b684:bfee]) by HE1P190MB0265.EURP190.PROD.OUTLOOK.COM
 ([fe80::b7ef:5ac7:b684:bfee%6]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 09:51:11 +0000
From: Sebastian Mauritsson <sma@napatech.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"parav@nvidia.com" <parav@nvidia.com>, "sburla@marvell.com"
	<sburla@marvell.com>, "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	"jerinj@marvell.com" <jerinj@marvell.com>, "anoobj@marvell.com"
	<anoobj@marvell.com>
Subject: RE: [PATCH RFC v5 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Topic: [PATCH RFC v5 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Index: AQHbqFjjsNzTLI/OcUmFlHLWgF6nVrOvdBLQ
Date: Tue, 22 Apr 2025 09:51:11 +0000
Message-ID:
 <HE1P190MB0265C409CD876A9C2DA830D3CEBB2@HE1P190MB0265.EURP190.PROD.OUTLOOK.COM>
References: <20250408073512.1783641-1-schalla@marvell.com>
 <20250408073512.1783641-3-schalla@marvell.com>
In-Reply-To: <20250408073512.1783641-3-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=napatech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1P190MB0265:EE_|DU0P190MB1980:EE_
x-ms-office365-filtering-correlation-id: 63f344ce-34f4-463b-69b9-08dd818336be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?sse1XT8Ne26vpH25MwnzCfq+ltJS4ETWy8saKOXZG859cIwxAv3U4qGYNAi4?=
 =?us-ascii?Q?L5h8mcnIXfDMUsQnAnHLYNWeucKsemObcnq7k3sGDDqeQh5ZF+22w1xZiKeS?=
 =?us-ascii?Q?nCST+4x/hXjZ8a+8RaM64MKS7zHy2W5NXizONvGCQWpS6CKF+InLmZ9uLALP?=
 =?us-ascii?Q?JHWy0jgmiNFXzY0sFWFWyRj7nfuc5Zyu4nFbsxQ9KgTPqvvNe3GjL8abHhso?=
 =?us-ascii?Q?siQqr54VY07ZAP5OEnVI4q+9/sAEEls2svjxm0EFQwJNe2OR0QcDP/vOwNg9?=
 =?us-ascii?Q?TEnz87IdoUHYW1z4KX07LTP+UDVWAinQBIv0gnYzoviJ1QPk/Gz5H9mv830e?=
 =?us-ascii?Q?0boDEXNgxLL7Q7kJuE28OcqnMHtocCyVMorjGXI8H3yfD60ziNd8ZiiOnbgx?=
 =?us-ascii?Q?Ya4kcyxrTJQAPc+ImcfiLbSaEg8dLvGDLymffzIraKyTysu9zxmN+C6v47Mt?=
 =?us-ascii?Q?FZjgCGuuU/fvfqdJTLYqWQRoomh4Q81nPklHebE6ztpzwic9TgnIgICbc1i1?=
 =?us-ascii?Q?hAUbyoHfiXD2hfs/7ScobdIijZPFh0WnX9c/7uaskC2cR8XmYED5ozQKBbTJ?=
 =?us-ascii?Q?WmPkqUI777wN+9FCTOSAWl6s46HJkJeB26SVO8CSwZK0wEX6nuwr19q+j9+c?=
 =?us-ascii?Q?ZZlr1KjTHjUwerXR4QVVwV1Gp5reGwCZ/OpMSfShkH3F/8E3Oi4dRd629yp9?=
 =?us-ascii?Q?Pk0H+AYUrdAcezW0gGmtwGWN8bn6scEiW+fwfklNU/ysSG5nsWmzBSON/f71?=
 =?us-ascii?Q?THHSO4tbp0cVHlmGp0AQd88yO1MszsK54WyYaRTa2+ulYx1WWmsfIIq2Sd7Z?=
 =?us-ascii?Q?ufVRp+9e8xOjbZd/GYvZ9mufZ9N4Xi0e/+LAoe+C8DinB5owc+44XXO88H0W?=
 =?us-ascii?Q?kBZJp3sbsYWP62Iwm/0R+YCOQgEF3oz8sMPh7Xs/NY586Cpg/GOAQf3VSjoj?=
 =?us-ascii?Q?s5BYaKTcLGr0rPSQ2HKBYzY5sES5LpVn2vn7FxXLg2X79uxK341AqQJaT1Jt?=
 =?us-ascii?Q?DQg2F1eD3OJyIChz7VxHfeCSAK9OYZg7WokgAY0YO3IeiXQ1x0tbEvPQxfvG?=
 =?us-ascii?Q?twDEDbHsZHGlhbgFBi/83pma5efM27qA3SMm8eCf66uH9EEZgelSimCOEzPi?=
 =?us-ascii?Q?W5wZllaIo3N/ZLFpHNLQDOF8/U1cMxLOZXN8IOaX25msG+8DzoviwbDlvN9E?=
 =?us-ascii?Q?nvW7ykY0NoEYAtq3h/Ke6ZKDowNQaJyPZPSPOKnp95IO2nTPl08EIEoigQcV?=
 =?us-ascii?Q?iJBSNdgDIJsFk/i/+bDMsttx4zj4BYpV6N4o02GuS3PRGvP20ik4UNy0UHq2?=
 =?us-ascii?Q?0fbkwYHxA0jFU9TcwEVPnZwreZkHPCCUmDNWE8HwAK95KdPhtwfvK+Th67nQ?=
 =?us-ascii?Q?eeJQPUgiii9h2CylSanYEZd4gAF05OJ3qAY+NI9UB9KPeu+a0vnkB0t1HY6W?=
 =?us-ascii?Q?t4chkjtvcL8HrFN40Hlrp5E9It8pibosnxS4nAWMdn6rlWQanYbSLg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1P190MB0265.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NVkzBtSWQ5bQByoWTOJxdimxSC+2a2cUEnd+unOjpqOHJazpKrluqkTgLuMB?=
 =?us-ascii?Q?SYH6YW1Qz6oak7mAXdxw3m+fip+MAs4yn1eQ57gY9l/8zDUs+9tBdKe0W990?=
 =?us-ascii?Q?m1wqeD3RM8HMLr0omMHHASm9wX3PGgKdwsxU1crA54tKfZFVFZkNrHy20du4?=
 =?us-ascii?Q?hTqgLtc8JwB7mDQOjQusJasuSXn91yC84FaOoL9LKF9wNf4rqJYqmiudcqhA?=
 =?us-ascii?Q?haYGr50tXpG+MmvvlPNpsAT7OeLzxDud61t+etnQGXh1PFQ5eCQDzmaO00/p?=
 =?us-ascii?Q?A6cnAvrdDdwluOETQ2M6/qzs6QwuWIrdf6Lh0P/vznZAzF5WHlDKXnUcXAcy?=
 =?us-ascii?Q?oljj/cvX6hhCAr5FDlo+Jv1KXpTKcj5/NExwp7xDwRTjYZH5F7YWzhJdEQWH?=
 =?us-ascii?Q?jFiSdcER7lYVrSQ4mUdDa0mZ4Tu6Vj94+dOuiM0Af1wDmfSqZhQjxetl5oTq?=
 =?us-ascii?Q?1ax2sOB+vsE8Mylf1yPa9R+9J0Bj5HVmhdmZUTC3e/Ns684QNIy0yx5fUz7F?=
 =?us-ascii?Q?IxPzt3kXCMBxIhXVNpnErO626Ft2zD5hmHmeZGgulPagsa37p80DHSezsobE?=
 =?us-ascii?Q?DWKHPFdSHDQYHqupoc5Wiwarf3iTr/xsew5Mcvxfth48FBaysgtDHWTuBcG0?=
 =?us-ascii?Q?F5LnzKbQ/jRXqNkD5vwkOkW3FVLWTyWBuSEAQH5A61rFltvRnBtkDTUO4zWT?=
 =?us-ascii?Q?LYtEZkSRGu/+F/EmLvvIEsHrRZSakmQTwPy21uy+noLZVivyIRXcSrD73gMI?=
 =?us-ascii?Q?xm8mrjcC6hdg8aTLkK2Jh198b9iHFUxqCUQvhXg8mBSpohXzbI3zeZ5r2mrP?=
 =?us-ascii?Q?Knas2HgsBO9pFAb+LNsrcRpz4YaZNa77mYFaZI5UxhW/bhuakssFqYGrldK6?=
 =?us-ascii?Q?3WIzyhiqalfG5Wvbe8xt9siygNDP7hpMHxrFfKPkCjc+aoOrO2l0CNBU7DSF?=
 =?us-ascii?Q?slzRUQNfQ41UO5pSgaDCl7P4E+RgwQWeZm5zq3h4GjkK/iPBompM2AqvNJvo?=
 =?us-ascii?Q?zntcoXVFp3DuXAulZRsXKk6+UEtIIYFYCngrNm4RhOfAQFImhy8HgCbzvjmS?=
 =?us-ascii?Q?zvn0NM/zD4Z4JCe+Eb3eVgXlNJCBgBArihpD1JbKrSyb9N/eF095bxhD3rkE?=
 =?us-ascii?Q?PsYFvttkjkFQeWKlHk/Nawkq6k28fg8r+kLeUPCR3hoH282TXZ0GhJyj53e9?=
 =?us-ascii?Q?p3tCzcRD9jp5VsEKs7X0ZsTLXeHoRCBhQWVryi7Pv4M9XBM5ocWk2TibZ6gp?=
 =?us-ascii?Q?38iHuJ2epB2ot7N6za3Q7S9Ist7Bd3TlVmmSmeyczYELSkuZoYCFm4WLBGlb?=
 =?us-ascii?Q?fXoj9E4VFVb9yvX2nysHqQ6DTn2HC3+fEjWXCodVxb+/TTcIvBY2LGMGQ4l3?=
 =?us-ascii?Q?KQL6Ic+4sC+9P898xUBxR3emwpEHjM6bpVAhZeE0oDL5325Wyp7l5XDRQkUI?=
 =?us-ascii?Q?KkLmcFtlLVKmwszI9wsNFTODhcvtkgIyl70I4MlTJbNkefG658m+YlM9BgnQ?=
 =?us-ascii?Q?qV3RTAragTInnRPKfcxGZvi175M1mbfXsqP1E8OiWwR2RapL0CfPnCI1IXZf?=
 =?us-ascii?Q?9oVhY3eFD9hTFuCP/Uc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PtBKtAA/9s18g3TlIb2cLju8YZDnA/qv7rRJMviGdAfOxC7C/23z5G2fdtNguqgVAmzSZhbUzjFVflm2ZAtMpYcx76SpGq/+G0epveluT0wzC3l2bXBhOxobmssNj20jlNv5bKkbPuTvRhbQBaduFFjF7cQ42v4qQl5TZc2RHakLTRXylLRcSMRp2PFePzqd0A8ud0uGs2aXhFX6IhJi28qdOYONE7a3DH7QNTtZajXUe41Ps2sxH7MZSAvMx3Qqc21gRi0MwShrqAY1HqAvJwk9+gAvBIfPspNXjH/vU3MSFR1bNQzHhbDhFhuFxnVAlceww1bFtw/OxSIGnAFigWZF3yMpNJxTxN9Gf6Pr9ijyv3gaRKSvtd6+FsLrpx2EwNJwSM0d3YkvcD9m97DE2ZUbuQm7XnA999jkoTQ5RAMR5VOSaU1ak6OnwPzvKwP8oDOxTPVQPAjIHyd8udMy9fwjqG3mU07YoA8iwn3SOWlrzS9l5GwMBS1Wmvao3WqIFMgRg5HBd2mOl0P4d7sMhjmX5r/Mp7yund6nsXjFtObaCmDCduC7vRRyE2jZEnH982btJ32c4jr00/D1Ccj3m+uVqEV8XDA0wlIwKhHMk6SgEefT3k129aZO3AQOBYNc4svV/hOYVn2oe3SzmC/jDA==
X-OriginatorOrg: napatech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1P190MB0265.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f344ce-34f4-463b-69b9-08dd818336be
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 09:51:11.4965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c4540d0b-728a-4233-9da5-9ea30c7ec3ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u1fQ1MdgHXCjM9k3+alAs7vcX3+YpMpmi0ubIQTYh7M4Qy8DP93Ay1zvAMEorpG58+IsTSO88d6zSa/RygzDgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1980
X-BESS-ID: 1745315489-302785-7653-1539-1
X-BESS-VER: 2019.1_20250421.2331
X-BESS-Apparent-Source-IP: 104.47.18.104
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVpamZqZAVgZQ0MLAMtXEKDnZwM
	TU1NTIPDXNIinRPNnA1CA51TAp0dJIqTYWAJVVk8lBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.264068 [from 
	cloudscan19-253.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS113687 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

> -----Original Message-----
> From: Srujana Challa <schalla@marvell.com>
> Sent: Tuesday, April 8, 2025 9:35 AM
> To: virtio-comment@lists.linux.dev
> Cc: mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.com;
> parav@nvidia.com; Sebastian Mauritsson <sma@napatech.com>;
> sburla@marvell.com; ndabilpuram@marvell.com; jerinj@marvell.com;
> anoobj@marvell.com; schalla@marvell.com
> Subject: [PATCH RFC v5 2/4] virtio-crypto: Add resource objects for IPsec
> outbound and inbound SAs
>
> This commit introduces resource objects to enable the driver/device to cr=
eate
> IPsec Security Associations (SAs) for both inbound and outbound direction=
s.
>
> The IPsec SA objects include essential parameters required for packet out=
bound
> and inbound processing, such as SPI, tunnel headers, IPsec mode, IPsec op=
tions
> and cipher/authentication specific data.
>
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex | 157 ++++++++++++++++++++++++++++
>  1 file changed, 157 insertions(+)
>
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index 1f2d336..15b1d1d 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -336,6 +336,20 @@ \subsection{Device and driver
> capabilities}\label{sec:Device Types / Crypto Devi  \hline  \end{tabularx=
}
>
> +\subsection{Device resource objects}\label{sec:Device Types / Crypto
> +Device / Device resource objects}
> +
> +The crypto device has the following resource objects.
> +
> +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline type & Name &
> +Description \\ \hline \hline
> +0x0200 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-
> SA]{VIRTIO_CRYPTO_RESOURCE_OB
> +J_IPSEC_OUTBOUND_SA} & IPsec outbound SA resource object \\ \hline
> +0x0201 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-
> SA]{VIRTIO_CRYPTO_RESOURCE_OBJ
> +_IPSEC_INBOUND_SA} & IPsec inbound SA resource object \\ \hline
> +\end{tabularx}
> +
>  \subsection{Device Operation}\label{sec:Device Types / Crypto Device / D=
evice
> Operation}
>
>  The operation of a virtio crypto device is driven by requests placed on =
the
> virtqueues.
> @@ -2036,3 +2050,146 @@ \subsubsection{IPSEC Service
> Operation}\label{sec:Device Types / Crypto Device /  \hline  \end{tabular=
x}
> \end{table}
> +
> +\paragraph{Resource objects}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Resource objects}
> +
> +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA}\labe
> l{par:D
> +evice Types / Crypto Device / Device Operation / IPsec Service
> +Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA}
> +
> +A driver can have outbound SAs between 0 and \field{outb_sa_limit}, as
> +specified by the capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the
> +IPsec outbound SA resource object \field{resource_obj_specific_data} is
> +in the format \field{struct virtio_crypto_resource_obj_ipsec_sa_256b_key=
}.
> +
> +\begin{lstlisting}
> +struct in_addr {
> +        le32 s_addr;
> +};
> +
> +struct in6_addr {
> +        u8 s6_u8[16];
> +};
> +
> +struct virtio_crypto_ipsec_tunnel_param {
> +        /* Tunnel type: IPv4 or IPv6 */
> +        u8 type;
> +        u8 reserved[3];
> +        union {
> +                /* IPv4 tunnel header parameters */
> +                struct {
> +                        /* IPv4 source address */
> +                        struct in_addr src_ip;
> +                        /* IPv4 destination address */
> +                        struct in_addr dst_ip;
> +                        /* IPv4 Differentiated Services Code Point */
> +                        u8 dscp;
> +                        /* IPv4 Don't Fragment bit */
> +                        u8 df;
> +                        /* IPv4 Time To Live */
> +                        u8 ttl;
> +                        u8 reserved1;
> +                } ipv4;
> +                /* IPv6 tunnel header parameters */
> +                struct {
> +                        /* IPv6 source address */
> +                        struct in6_addr src_addr;
> +                        /* IPv6 destination address */
> +                        struct in6_addr dst_addr;
> +                        /* IPv6 flow label */
> +                        le32 flabel;
> +                        /* IPv6 hop limit */
> +                        u8 hlimit;
> +                        /* IPv6 Differentiated Services Code Point */
> +                        u8 dscp;
> +                        u8 reserved2[2];
> +                } ipv6;
> +        };
> +};
> +
> +struct virtio_crypto_ipsec_lifetime {
> +        le64 packets_soft_limit;
> +        le64 bytes_soft_limit;
> +        le64 packets_hard_limit;
> +        le64 bytes_hard_limit;
> +};
> +
> +struct virtio_crypto_resource_obj_ipsec_sa_256b_key {
> +        u8 mode;
> +        u8 direction;
> +        u8 reserved[2];
> +        le32 obj_id;
> +        le32 spi;
> +        le32 salt;
> +        le64 options;
> +        struct virtio_crypto_ipsec_tunnel_param param;
> +        le64 esn;
> +        le16 udp_sport;
> +        le16 udp_dport;
> +        le32 replay_win_sz;
> +        le64 cipher_algo;
> +        struct {
> +            le16 length;
> +            le16 reserved1;
> +            u8 data[32];
> +        } cipher_key;
> +        le64 auth_algo;
> +        struct {
> +            le16 length;
> +            le16 reserved2;
> +            u8 data[32];
> +        } auth_key;
> +        struct virtio_crypto_ipsec_lifetime life; } \end{lstlisting}
> +
> +\field{mode} specifies the mode of the IPsec SA, see \ref{table:Device
> +Types / Crypto Device / Device Operation / IPsec Service Operation / Dev=
ice
> and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes}.
> +
> +\field{direction} specifies IPsec SA direction.
> +\field{spi} is the Security Parameter Index(SPI) used to uniquely identi=
fy the
> IPsec SA.
> +\field{salt} is the 32 bit salt value used in the cryptographic operatio=
ns.
> +
> +\field{options} specifies the Options for configuring the IPsec SA, see
> +\ref{table:Device Types / Crypto Device / Device Operation / IPsec Servi=
ce
> Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP /
> IPsec Options}.
> +
> +\field{param} specifies the parameters for IPsec tunnel mode.
> +\field{esn} is the starting sequence number.

The purpose of the "starting" sequence number is a bit confusing to me sinc=
e according to the RFC the sequence number is always initialized to 0 after=
 SA establishment.
When this field was introduced in DPDK IPsec implementation it was for the =
purpose of debug and SA lifetime enforcement purposes, but is that needed a=
nd desirable here?

The explanations are a bit out of order as well.

> +\field{udp_sport} is the source port for UDP encapsulation.
> +\field{udp_dport} is the destination port for UDP encapsulation.
> +\field{replay_win_sz} is the anti-replay window size to enable sequence
> +replay attack handling, replay checking is disabled if the window size i=
s 0.
> +
> +\field{cipher_algo} is the cipher algorithm identifier see
> +\ref{sec:Device Types / Crypto Device / Supported crypto services  /
> +CIPHER services} \field{cipher_key} specifies the cipher key and its len=
gth.
> +\field{auth_algo} is the Authentication algorithm identifier
> +\field{auth_key} specifies the authentication key data and its length.
> +\field{obj_id} specifies the object id of the SA that can be used to
> +retrieve driver-defined data associated with the IPsec SA.
> +\field{life} configures soft and hard lifetime of an IPsec SA. The
> +Lifetime of an IPsec SA specifies the maximum number of packets or bytes=
 that
> can be processed.
> +IPsec operations starts failing once any hard limit is reached. Soft
> +limits generate a warning status when the SA is approaching its hard lif=
etime
> limits.
> +
> +\begin{table}[H]
> +\caption{IPsec Direction}
> +\label{table:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA / IPsec Direction}
> +\begin{tabularx}{\textwidth}{ |l|X|X| } \hline Type & Name &
> +Description \\ \hline \hline
> +0x0 & - & Reserved \\
> +\hline
> +0x1 & VIRTIO_CRYPTO_IPSEC_DIR_OUTBOUND & IPsec direction outbound \\
> +\hline
> +0x2 & VIRTIO_CRYPTO_IPSEC_DIR_INBOUND & IPsec direction inbound \\
> +\hline \end{tabularx} \end{table}
> +
> +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA}\label{
> par:De
> +vice Types / Crypto Device / Device Operation / IPsec Service Operation
> +/ Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA}
> +
> +A driver can have inbound SAs between 0 and \field{inb_sa_limit}, as
> +specified by the capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the
> +IPsec inbound SA resource object \field{resource_obj_specific_data} is
> +in the format \field{struct virtio_crypto_resource_obj_ipsec_sa}.
> --
> 2.25.1

Disclaimer: This email and any files transmitted with it may contain confid=
ential information intended for the addressee(s) only. The information is n=
ot to be surrendered or copied to unauthorized persons. If you have receive=
d this communication in error, please notify the sender immediately and del=
ete this e-mail from your system.
