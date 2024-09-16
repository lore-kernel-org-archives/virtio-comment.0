Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA49E56A
	for <virtio-comment@lists.linux.dev>; Mon, 16 Sep 2024 03:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726456276; cv=fail; b=YMuZzoYJim33nShn4u5cyAEgm4IyGqwA2ak9RcIHzGTW9H9ABam/MkLStpYW4jzYyQsaH21rGahTN/V0fL9qqm6XeMa1sHcwd4D3/cioxnFk83KxejohQYToRDoN/WfI6kVk0UCYt/kfr/k4FJFMYN1ji0tVxQQmVrFOzMXsu8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726456276; c=relaxed/simple;
	bh=DTWjfgoFCJyf7AiQySB9EXGVSr4KrQrajYrMBv76y14=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aJ6TLi/tBmVDuBd5TAhAdLrPJ+2Vq9yKkf1o1o/OpiwFY5/zjhSAauATuponycdI6eFCn63stjRHPVq+AP0u3gVSfq7yKXx37NDP1O2sfgdHM8U0Y2xoTc4ysshKO76EXGZNiSuzii8O/87FH9OR0MY47/8hdR8sJcVPM4zwptY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sbwLIzkW; arc=fail smtp.client-ip=40.107.236.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sbwLIzkW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPnzwiviVvVmZX/2UUSNUNEfxOjlCou6jA+5iWA73Xdiy/vdLn7wfEhVEUzLJl+DF/eH95JAOFfoydhPy9Z2h4Yyqy9e15P8nra+2yaMyHwG3YCGyWXNfnky1jKm0M1Ls8HWIPOOiPaME9CRqLFJKo64nJuenEL0+HVbf37ffJfWQTTZftBxx3/lXM2OVl8FTY0TUN8CDOVfNDybmENsZqtp1IN9RgU2uYjefKDRf5YKQaDG3dvhdHkgotmchZXdp3WEkDlT6kZKcAabwjJ6EGpKDFKBBKz/eP2ImY+N/cYcsLyezUFph5d+XJ4ntweiF+l1j2cB6cnYVaC57ZPxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAGgj5W0aCDtv2KEQaRUpLm27D3e978v4HEwfdLE3QQ=;
 b=ZeaE6w5ghqXmTHdlB0ohWq9lpre5tTgxGbkJ8x2zSelIgzNEFbUzsOwXyutU82hursjdMwT6W7vIyadqjp+IDsZCRZa4QyMdzjwLSWiJyddIjheHtXNNV2Irt66YBiuNeeLHrnIPbsZKIn2haFuOkmv7CP3FOH5e6xf7xwrFtJgTo2jh1VRPvDtWRaENhnNL/jPu54eUO5+bnsGHDj2cvHuF/LzszYZHm5HwRqpBnaRlpZttr2figlzyYu8oR4v02MQ0C2FLiqxjQNweBLq/dZx2cBnndG7N7Q/IOKFkCGnFhvW66tbzTRZOEBF7CDo2N9n0tcGRFb6hdti4reMAvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAGgj5W0aCDtv2KEQaRUpLm27D3e978v4HEwfdLE3QQ=;
 b=sbwLIzkWz3BfL6Pxt4TuFfkFBGIgBdbo29VWdOgmDIp2a+tw9OT5bTtdJ19aMR5LC2oQdPnj1d4ivSeB1VNBzNMUQYgL9VaVXYL8xWo5EMhfvoST+EhYtTmw4JVjFEqw6Ij6uOZrv8sXrvQH2i16H1XdrdhShjwgRAYavyUDzKA6Hf+DsCelUEpkD2XPCiSg0Ewh/iYZ2ekTWertjnAwvAKnTcMoYhcT1PKogXlFjNHguHiAEo1SuNUCHAuTZ8Qfkt1A22v71LVGM95h14sCnaij+ZWcYQJiN84r2uvy6sKEJ1S01QjnxT2YEDJ7zV8ccHNhMp05tLXSdwX1j9pPcw==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by CH3PR12MB8582.namprd12.prod.outlook.com (2603:10b6:610:163::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 03:11:11 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 03:11:10 +0000
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH v1 0/5] Assorted editorial fixes
Thread-Topic: [PATCH v1 0/5] Assorted editorial fixes
Thread-Index: AQHbB+XG22bbSO6HhUGnjAsPwWCkVbJZvB6g
Date: Mon, 16 Sep 2024 03:11:10 +0000
Message-ID:
 <IA0PR12MB87130A72951032F2936544B1DC602@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240916030835.68178-1-parav@nvidia.com>
In-Reply-To: <20240916030835.68178-1-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|CH3PR12MB8582:EE_
x-ms-office365-filtering-correlation-id: 9dacb015-5546-49ef-0d1c-08dcd5fd3733
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EnWrzinvnA1g/ySHB4Ke8lnZmdZprhaMGM8p/Q2TkJYZpM09YXB5hNciEW8t?=
 =?us-ascii?Q?IMRTjKA5NEja8REwMehbFuxK99eSrDQL3PAN1DNjGTRNDSeo+O6EeukAEGDA?=
 =?us-ascii?Q?My4H3Goodr2ViucXeGUmOh0XjMZ1VV5OIWceNt/TZ+Z53S3LN1J17GmjqYIt?=
 =?us-ascii?Q?1cFqAFkQugo+MznSZL5TYweppWgfB+SNiQrGTtZbstYkvNFO7zU5SALAkGzT?=
 =?us-ascii?Q?CZdWC2D2IKV02AkNhyuSU+MiSGocn0Rpbb6h5s76Ajy9SSzwKYv+nDQD9+NL?=
 =?us-ascii?Q?QcPlZvtl8ZpZbotMw/EXpOGOgX6mTYSk0xQ4sYgCSIBcFRo0HMzvuydNUFWJ?=
 =?us-ascii?Q?jBKPmHDaz66C+5VlfnNb4QR9OScWU21+5sVFCkS5grLoBTmOg2574IeU8iMc?=
 =?us-ascii?Q?Lnh2Mzyye+T7bwBK2aPKWYESztqP81RVVisgsuT74bzNftWOmIisji+94FKo?=
 =?us-ascii?Q?f4S0VXDcYoSt3P651l9sSlE4EUhR5E+RbEGqLdhhMkLKO9jwMkZ13O5ePjuS?=
 =?us-ascii?Q?SXurQjtiEev7Jyt9ItoZAAoAjc+QQlwB+C7VdV9TbzBumr9TvCXejRJ63tQx?=
 =?us-ascii?Q?KkuXQXWmtksvhgSr35MTCy7TCVKUJEjX58bNQk8q8Bw0uMELuwRnhbXPmfBU?=
 =?us-ascii?Q?mUhuwLkBd91yeC77rfyiAiIMwD6tcAdag5vIaG1FvfcbWRUt/Dw0zWnDiUro?=
 =?us-ascii?Q?hn2NW0i18KbGej9I6NFmtQUAa3wIhUFnczLlXw2rH4W5r1lJy4ry5LLXlGWi?=
 =?us-ascii?Q?yN7QcrWb6Fwgv+ueoiwmAQ5LSa1LKVF9SsVHD/CqeX7LlFHt3uRzAvzCMaAe?=
 =?us-ascii?Q?y9iXwBUkLkaISB5z59hKHS21tb1w63An/pEfBO2NO75PhL7i7ZssSMevZj1L?=
 =?us-ascii?Q?CGmvgeNUVpbQDA0A5YDHOV3Vswco54EssjGbEykeX5EiqT5bm6c9gSoKnVbv?=
 =?us-ascii?Q?hrHbSTlvT7b/ToUgAy/C7j3TIasTsyOf5+76z6pkAcBsZ94Ayg9MeqVH+3QA?=
 =?us-ascii?Q?KPr5RTa9y+zK0r+VKMW1wiWeYOmEK7aJHpIOb6hNNkzgwKISGtP16iktBkFx?=
 =?us-ascii?Q?JSsbwhRrYNJa8Bk9QGuW43TLZTbH4oP2FQxZuyb/oigTo9OzZI+Mx18axZ5+?=
 =?us-ascii?Q?lN3grX187daVd0Qvj2VM/BpuTiQsUlGuMOQHXm2k6yTopw25czVEC9JRICgx?=
 =?us-ascii?Q?GpneSYz7PkOieIhVAuRYCshlS/xmD1tPZgg3XdnXsZXcS9Xlne90ZetRlbHv?=
 =?us-ascii?Q?jocrTWrxO61LWuO9CCh9iKm0Ndx/o2WbO0hvY+netFgLOGVd4u7t0FgqY9IE?=
 =?us-ascii?Q?zZ6w47qiYA8ynEnGn7x9XnaAtg8FmGvsFqFLJUcyvEk0jN/1w1Q08uTWFiNZ?=
 =?us-ascii?Q?G1afBBs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4SzLSPPiRMBmFJQllxvK5XoCRYlWDj0kZtI5VOEMpLtbVHPmrZavL7AIHfXD?=
 =?us-ascii?Q?NcX0yzGUPY4Y+j2hKpFGnz+Kwk+a+509EMRkXfrFny5grwXe/YNQevxh21Op?=
 =?us-ascii?Q?7JVy6My9nDHO98Yv7WfZtGtHxukk+9uxQLKBo9TX2MBwjtgkAACB4YBbcxLB?=
 =?us-ascii?Q?uDODPXov/c8gOpO0513T0D9wsfEhqScacKL3OnXH+MFGYNHRwwzm82UX8xMx?=
 =?us-ascii?Q?ABQq5V2WOgyyG4K8GwSCILfEjgPD/SG1rLYBGR6/m23tprLHoTX86TVe1ytA?=
 =?us-ascii?Q?WEzmKph1O2dr5EZFb0yMCUVOXrHVv9etC1LGI6SsZHM4uWqaXYKTZloHl/gg?=
 =?us-ascii?Q?XgjegebTRj42AoCWfZwY7zEMnZr2vVtFkIozuH6hZCRhP5EqLAL4Iju5SzoJ?=
 =?us-ascii?Q?MNAsV8Z3f+Foey8k8CzK4dT3G46iurTI+70NFytKQQjfyYdFAc3Jc8Pj0rhx?=
 =?us-ascii?Q?d0sD80i8iTCkOsEddfHZiCWG1PDQ+Pf+PNfb8/m20KCV/VTnCmnpmLElZHeo?=
 =?us-ascii?Q?rVZ35qXOG7T23fbhIZ3tqNRAnLUQK0z3GVbdmdhms0nlRLxXUYQTLZYKWBtR?=
 =?us-ascii?Q?9xT0QK+RfaKVljub8e69B40bPwFcYRrA8lJOhv0i0bngUZWqJBfStqcIqBkp?=
 =?us-ascii?Q?0Cj5dliS46GTPPQkB/fl1ysELKw+hLUoagZBKBYeuNbVnNUhR8yrBo4qoT7u?=
 =?us-ascii?Q?6tVAmb6aAgbu+rE4JOxohhoUhbe96S4gNc+ZKsk4321/WV0yJNdm/dLsataT?=
 =?us-ascii?Q?EetxQV/Nf8sQvzNrGREuKdxCLlXmDzTNLCRQ8eKmHyOcROVEHNaUVWOZknU+?=
 =?us-ascii?Q?4J9zR14Dm1dZ3INvGcI+5p4MHp2xmusnanMfsMZTkIFyfzJeAdvbYCCFLZ6o?=
 =?us-ascii?Q?71Xzcv+VBhspsOTBD/UQ9OgIPK5b9pYRL9rLNrcLBUZgiqzirCQn6zz/w5Gx?=
 =?us-ascii?Q?4jvmlg7lsOFQPID9nd+Gx4nnqVt55Y/Y7pasLsTblRSH+MeHuoEDFQRFRYF4?=
 =?us-ascii?Q?nWIjObIGa00rl2zidUEa5kZH6dX4AnXFUHfG1EEsTsp0yIPDp7FDygjwnPIz?=
 =?us-ascii?Q?xkc5YWs73uRc9/RKrDXw4VxsxII9zL1QpMWTySHrr1R26h3ZjWHEZ4yVDnfM?=
 =?us-ascii?Q?BGyUAf5VUb8tnZ1Oy6Oz6bMWVHWxCb7PnLpBAN0Ym7Ki5A9y56UrukNxlf1Q?=
 =?us-ascii?Q?XFPAewl8VDTvCl9NKPFy2oASyUEv2pCygyZb78ObsCfMFMY0RUCVy5aqvAbc?=
 =?us-ascii?Q?GIKtzb2oK77/b7i76/0iMEnjCGzgS1T/KUua/sAQxfpFRAG9MuiG14wBFivX?=
 =?us-ascii?Q?x4pvu8nLqd79qxeFNNkmQu0EWIyEn0cNMuYYYj38SnVtMGaL+h9sA89LX5+A?=
 =?us-ascii?Q?XUca1wabHFEWyF3NgGjsb2ZdLZ16igW9U1tVynMADZz+kTluK7L/zq8zQxK1?=
 =?us-ascii?Q?tLzkK5b51OUUPi7LXl+43qhqKXVaJ/b/fkXsrq7oxriMGO6euS9Ri+qlbuJU?=
 =?us-ascii?Q?mL7nyaioTaE/Aqxsft7bEUanKjWkB8mTedyWw37/XllE6E71RWUUBs8dcTbE?=
 =?us-ascii?Q?Jln9LPcnvJgAisRnQ4E=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dacb015-5546-49ef-0d1c-08dcd5fd3733
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2024 03:11:10.8683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TIYewk2+JRM7fQwo/p4m0ZCcRJFHv5W3vWXvPXIot44tvI+rRmnSG/Grw+qkgS9JHJVJ127UHWbA6x41vQj34A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8582

Hi Michael, Cornelia,

> From: Parav Pandit <parav@nvidia.com>
> Sent: Monday, September 16, 2024 8:39 AM
> To: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> Cc: Shahaf Shuler <shahafs@nvidia.com>; Parav Pandit <parav@nvidia.com>
> Subject: [PATCH v1 0/5] Assorted editorial fixes
>=20
> This series covers assorted editorial fixes to fix name, adding missing s=
truct
> and fix spelling errors.
>=20
> changelog:
> v0->v1:
> - added Reviewed-by of Matias Ezequiel Vara Larsen
> - added github issue link
>

Please open a voting ballot for these fixes.
The github link is: https://lore.kernel.org/virtio-comment/20240916030835.6=
8178-1-parav@nvidia.com/T/#t


=20
> Parav Pandit (5):
>   device-parts: editorial: Add missing struct keyword
>   device-parts: editorial: Fix metadata type name
>   crypto: editorial: Fix spelling errors
>   gpu: editorial: Fix spelling errors
>   common: editorial: Fix spelling errors
>=20
>  admin-cmds-device-parts.tex         |  6 +++---
>  admin.tex                           |  2 +-
>  content.tex                         |  4 ++--
>  device-types/crypto/description.tex | 10 +++++-----
>  device-types/gpu/description.tex    |  4 ++--
>  5 files changed, 13 insertions(+), 13 deletions(-)
>=20
> --
> 2.34.1

