Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C645EF4FB
	for <virtio-comment@lists.linux.dev>; Sun, 11 Aug 2024 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723378661; cv=fail; b=Uay3OxL0vbh5yQS2XNkE/viW/QnqdszTScuFUdcOwJiupe92q7DGCXoqayr/xuS5EQLt5r7Fq9Xx4d4X54+NnUHi0ARUKxbJXIfQU8e2q/yD3HKTToltChLab5tUdMuWJQlQEjqXcWwMxQJRrEQnIjzG2mMpdxI4esZ5dZp6HCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723378661; c=relaxed/simple;
	bh=1lrC10T8FZGHdQfwwhU/z1TH9T2Ac3MwtrGJrLo4xWc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bb6p8+kRhQWszCme+MVlhPMallkpmjoL2veUy98pHX94pWCwS6uG9lWm4dWupBetwgP5Yaf/JLscpZKgxEif7PXh4t3ws+khMZBDgH0jeJUFB8AbaCS9EBcxDwfpd1Bl3orAUCH9Z2SOrzswMiLQ6dhufZYeuhNBmDyBmt2NmpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sswfJZbr; arc=fail smtp.client-ip=40.107.94.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sswfJZbr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jg7je3dTMS7Y3qAmvtr78Roh++DUximz25h3QLAfzXSZCZMQQ6CqLdJezsZRm1HqqP6hVm6FU/XosesBep7w8W0QaS+mbVdoMzxRCUFUS4AL0awA5TZzFok1jeTX3E3n0HBDEFzREctWe2Jxi0aodGNMB25GIZHXlIlHHz/X1xp0rtRgqJxklsuq+w+pBJuvxiLehsGm3XsYm/o1YVzZmDYj8FbsSt7SP0LkOYAVQP9ssk/Yfy9JOgr/unxxfwM9VzIVW8kCcKqPxu5ur+7gJGjhThZCvFJhksPaG0sRrqlJOnnPriy0gMQruDLrU2WAZUm5dMZoR4JV4pr6oySzYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqfBURsDNVTwtqVyhFJQaOeOU2VYl9wMpgfpO9lY+Jo=;
 b=aETF0FvPCIZfH03g8DYzY4hJRat3V1tC2qwk9SVx3astBK78tDFVI1jp1ZFPEdCEDR+Ent4ZHTVFBWB/qT2BgYoOhEhr6xhl0yUYqSu/QuYt8VGLf3tg/+Ei6vPyvqzgAFQIZR41LKzAG/KqWykbDgNhrKqkNZY4aoPebhfGvTvnOtQvkHALAm8CxXrea3V0JSyQ2M+zktuwzseHTXGy2HKtVAAKV1xee+L5AXBPlBdCJ6RSqTYg/MOLIHt7e0vrA0Z/3t3H08Ko8TFM+ZYg7wnAUEky0nbtlq6KrKayvMqqgmMU34uwCmwj603cDmngWGzLF1/D5pr2Tm2jbipd/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqfBURsDNVTwtqVyhFJQaOeOU2VYl9wMpgfpO9lY+Jo=;
 b=sswfJZbra18HrzfTqfhBvylkTfb3viZIpVrRQPAROTtE08+Ed+vCHM7w6EwdsCyE9jg0EPIjIgOik25x/3rb20t+hvYfvotGyonptACV8VbHTUMNsEaYk2TrIYWs0OzpmM3Br3e8+YMncooDI9f4bpMt9HcrfMZPCk0/O2Zpu1n6LEy9lChuSwaXfDQBSERSfo18YVqBnnWzK8DNLWyou8WpSPHJNYrxa59WDSnJQaS9+K3iBpPo5LDj+72qN+VHDLSSTPlA9Q8fIQpi1yR3kHDQzmuz4B/iXHOR9p6JG0YZZoz//TkxaTuaB+wvkqUIfu2P8faMO7ZIewenzSnUCg==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by PH0PR12MB7960.namprd12.prod.outlook.com (2603:10b6:510:287::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.17; Sun, 11 Aug
 2024 12:17:34 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7828.030; Sun, 11 Aug 2024
 12:17:34 +0000
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] device-parts: editorial: Add missing struct keyword
Thread-Topic: [PATCH] device-parts: editorial: Add missing struct keyword
Thread-Index: AQHa4ZiS6LYVkEntMEu355oh/ZaHrbIiDX+w
Date: Sun, 11 Aug 2024 12:17:34 +0000
Message-ID:
 <IA0PR12MB87139A44E0C8184D583EE15CDC842@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240729092005.425107-1-parav@nvidia.com>
In-Reply-To: <20240729092005.425107-1-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|PH0PR12MB7960:EE_
x-ms-office365-filtering-correlation-id: 05ba5246-cf3c-4958-d166-08dcb9ff94cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bxp2cr2T6pSAXif0HnMWZZipA5Rvzx4h7agMAmVNerdmFQzFaJlHI95vMzRY?=
 =?us-ascii?Q?bMcpUiQ8TGfxT9O7yA0ZhDF74sG4alSrtz+giD4tFuP3ZxPBYvTu7TA5Q4RY?=
 =?us-ascii?Q?i/lH+0vl9HZZ6Qq28aGSRV4qDXj/HjOC1wLkfUvLdFKpDt+iiCQYqvA/3dw9?=
 =?us-ascii?Q?o1fgFY7B5oDYgHp++1YGO4GV85MwKf+toyhfvcUEUToTCvjnfDv5rZwN14KQ?=
 =?us-ascii?Q?9PqvsoeMrh04EPfXF1sI6u/LnKraMD7ZuJA+b2exqO+YHeBNOTtpUFivkvNJ?=
 =?us-ascii?Q?eAHdhfcFXyiGaEtWWQQ2HPG2InWvIJq4aGHxjnqIDbmDz7T392rzkESthNKA?=
 =?us-ascii?Q?i/bHuFCMpuJJqWbhELDN/sneCFVMgq/OW/nTCamLc5XZG7W1MRgk6y0sRIkm?=
 =?us-ascii?Q?8MSBq7j9J8uQl5GwNLrrWOvRSw2ERmsb9IQgNWeYwnD6GSOO3cRFYcpBGq23?=
 =?us-ascii?Q?4GZtJS9/aRJ7tmZZtohe2PKDbM1FDq3g/wueFaIsPrY3ow5NzyT0cYzmEuVg?=
 =?us-ascii?Q?Fx9sE9N0pj8Hon+pS5t3uAh/BEXuDhKgDiNKZNKLaRyGwzTUqIPr77QEl+lq?=
 =?us-ascii?Q?zwCgS0berS2peuD64dwkCgAtWkpObY5Ct+FJK0WR/JZ2qMhJaOw2VPiaAcSS?=
 =?us-ascii?Q?DKeEYR64tywNwmKCYE2lkt2IjCp8bXvVRGnK1rjC6t7+j9Cn2u0iN26ccPju?=
 =?us-ascii?Q?uWtt1kahH4mVaR7Qz0Ey1zOzPFrb6zZf9P3rUdbAuMXxKu11gHLMA8pj3cbJ?=
 =?us-ascii?Q?BlCDKwva5b1Y+0iZHAwvPhEdzyE+dVwjIRtuEUim+oV+sHBfJvQ9tZiwkQln?=
 =?us-ascii?Q?y7XUqhWmxNEyK5B345ZdQQVYGxSvOV5vefOwSf1ZcBYcos7f+sdJ4KxscneO?=
 =?us-ascii?Q?rwb/UdtxOLHn6d64hi0mSLpM3A4MpaVbdy63FP277Qe2nCLxp5A3zrNkgLZE?=
 =?us-ascii?Q?F6wVQA97P5ClIWBcL3aDbV2jcbmsQUyS9grwlO/R5QfVXeeO1Nr/uyuyHhsc?=
 =?us-ascii?Q?ovc0WHpX1LzsuX0XQMD/esRLpReefp+yb6dZBrMISjoncsUtEcM2B/M4uRLj?=
 =?us-ascii?Q?TYyfjFWYpJ16r4XI6MYJOUme9pEXc9PmmVbuKbv+6zH7DAYLS6YHnz5YTbUX?=
 =?us-ascii?Q?l04w4GPk48KlTlI/9ERBtReVGAGBuwujhX3ffmhEBH47wX1d3deBB0yrRB2Y?=
 =?us-ascii?Q?7m43QXdktjSRnJbmnZkfhHqXMB9HLP8/2CKWd6y4WqeSyh563AkJUOfcIa/g?=
 =?us-ascii?Q?ujwceKIuJ4OzDmfJzaUJZDRmzPkmlikzZy8T7r12571gtoV6WVIB/mhrjYVs?=
 =?us-ascii?Q?0ZObUV4IZclV2B1S5JUOEuBtc4X7LS521mudc4B2y4FMKtfsPr56rplB0WNY?=
 =?us-ascii?Q?2NBh/dk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AlHcB9JlKFvKpLjsJBtq1DaQxub7bqtojrYvOHvAK9egQau7I0AmltAB7hFD?=
 =?us-ascii?Q?FC3n1QF7czGuH1pkKjrpxzH6WPSRHMuUQvJaAtPSuixySXOwMJ3duiSuCf34?=
 =?us-ascii?Q?dN+zJZ15UdC09VpBJdwAIf4r7M2gXiHWv/w4sZb/BeGa/M3+QFv/PqH1iTsu?=
 =?us-ascii?Q?0oKPZzfb/rn2SmkJQWWgDmYbT+NHrZjICaA1orw/+NsWEdr0ycxSYRtzT2Xe?=
 =?us-ascii?Q?Ntl1OPBF+0DmdA7UhttwfavuP2i6EMtmkHIid9B5rJsH1dLxDKwtlHPdg0DA?=
 =?us-ascii?Q?DXentcLBf3tVC7UTCBCXNrPYsMyUw+vK4mJP/aDwcneHPcNVX0XQ79iP36Hc?=
 =?us-ascii?Q?2Nh6ElQN8gPkYShmtfkMyu+UDLQmjw0UufGd5Glsk0CigxddLhxic7wTtm9I?=
 =?us-ascii?Q?ksj1y7F5viiiGNCoQMLSiWqTX/OhQN/cdNs07/QAxw6pFJ/po5pd50mn/j9/?=
 =?us-ascii?Q?ymYcF+f00LSqXBOOmW6LkD/pMEXcSBgX7n769E75qK6kxfZyVFqHIwKjpcrT?=
 =?us-ascii?Q?AJzLLQ5IUrfkjhVoRT3Fz2rX8DoOKoO/qLUBdAm9ZEKA6zQADilMyYZD4KX6?=
 =?us-ascii?Q?m11SaJ/dw43oan4xWbYv2Eo7h5b/DbLThZ49IJ0rfXeGYLLH2xVqmRaY7ha9?=
 =?us-ascii?Q?hINRheevcarquErwdmmJx6T+2w9kEx4QiX9ofeHEPMOVeLeinS+sxvT1kMt2?=
 =?us-ascii?Q?PxAyHvZq0XtT9CSXVDRn7XKO3YZOJlsPNrKkfBonjT74hVkVXff5qSIsLS4d?=
 =?us-ascii?Q?ZegBZXlS4b2fnvleWDxZLVmvJwJ/OT/94K9otev5P1TdaSSeKGd1zdLBKqbY?=
 =?us-ascii?Q?el+JcqgjTgLNH22CRnLnG7s7PieULCb5OXrwA3Y9H4vvtiKkxSv88KTNzO6J?=
 =?us-ascii?Q?yXpGRLYfjv1Huh9gtZ8duNbqvMlFztxPmj2m9e8t077OzOGMVCP8rjQltqXa?=
 =?us-ascii?Q?4eFceHVG1yfghhtip2dm93irU54KNK4C2kNtvbPXOKSPj2SrVGcuJGuAXDmr?=
 =?us-ascii?Q?kQd7yZWfBsAmBb8jYw/HDt+imBgAvIZid3eiIDcIkXGCfjF8/+0xJqX303ir?=
 =?us-ascii?Q?QCy2ZeTZIifgkuJq+jlZrAJvEilDsddWZOjuZb1f6znogdi3DIssdtrmLw6W?=
 =?us-ascii?Q?SCMBX+zqoeDjf+iPOFBJBfXJdafqpOju03K5DhwVLSM/DvZNYBbcQ9mnCRVX?=
 =?us-ascii?Q?0Yqn0n3xWN3GQBU/PPFPk0Bf7Hpidm3eEqDvJszKY/bwKVjJgoIPwx2TWYZM?=
 =?us-ascii?Q?WVDjg9HkYm/SVhTJVp0vcKN6rvfTHgfKx/EY0+slKwzMbLFG4anjQltuLQZ1?=
 =?us-ascii?Q?Z/Nkqj1oqpQBBAnUsscjjsk/A02njfcVU17gC+4AONhgZXGQTzhGxjbAMrK4?=
 =?us-ascii?Q?06MukO140AXcueo97I3MAnsNpNfReSiqS/vofpCbeDqwiAjmZvcP680BuKoy?=
 =?us-ascii?Q?N4Fl48nePXB7dERK97JI1Gwkpn9BJG93USPF6oky2GSsixK6e1aYiM5q85QB?=
 =?us-ascii?Q?wzPEfA2V4VWEC5P90TzBU7FWtVB3V8raRHUmUfaMtzu5+t9S+4XMjuJXbJu7?=
 =?us-ascii?Q?1xXf4PKKBgx8UPC67pw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ba5246-cf3c-4958-d166-08dcb9ff94cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2024 12:17:34.3567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rx8SAzCZt+RdUyyLA0+TIt/QAb3wXx1bKQY770znToxvpmV9fGO+5qlH+z2cVpcPq7yP73rv+8jGnNKBAj9Zww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7960

Hi Michael, Cornelia,

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Monday, July 29, 2024 2:50 PM
> To: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> Cc: Shahaf Shuler <shahafs@nvidia.com>; Parav Pandit <parav@nvidia.com>
> Subject: [PATCH] device-parts: editorial: Add missing struct keyword
>=20
> 'struct' keyword was missing in the definition.
> Add it.
>=20
> Branch: virtio-1.4
> Fixes: aa4f6f06 ("admin: Add admin commands for device parts")
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Can you please take this fix for the 1.4 branch?

> ---
>  admin-cmds-device-parts.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex in=
dex
> 4c88045..27d8251 100644
> --- a/admin-cmds-device-parts.tex
> +++ b/admin-cmds-device-parts.tex
> @@ -131,7 +131,7 @@ \subsubsection{Device parts}\label{sec:Basic Faciliti=
es
> of a Virtio Device / Dev
>                          le32 count;
>                          le32 reserved;
>                  } hdr_list_count;
> -                {
> +                struct {
>                          le32 count;
>                          le32 reserved;
>                          struct virtio_dev_part_hdr hdrs[];
> --
> 2.34.1

