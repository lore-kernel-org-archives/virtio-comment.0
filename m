Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7999A187322
	for <virtio-comment@lists.linux.dev>; Wed, 26 Jun 2024 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719412831; cv=fail; b=bd0Cg1zs9ZrgSHDaEe9n5CR2LLza5LPyZzz2+6vhC5bDNbqXo7ZDxDa58gdNuSXsZ+3x3KAtK6q+VDztZFBqkRcDzyyd2xQCm7X9BCzWXWslTOHFUXUFaBreIotgi4Lx/CKffoCNzUlFapG0+8W6JpppcbM0a6qq/naIhvmIR74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719412831; c=relaxed/simple;
	bh=8WFCD9/iyo3l5E1fQoEpB4C5YRH+06RZW0Gn/Ld1Fqk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mZGQO0UqXFBwtV6WyY8jMSJNzYTo/+vJwr2j8oeCQG1oAdb+IN/rDzE0Tzl24WcJunwbwabN5NkVTh4ZON5nNqvgTgw1uj4Yux/OrqSbxhIUtKfbjntqudTR1Rnh6Yc3g2eWvtd82eLDCYepLxIoKwshpxgCc/VkBpG9ivoXvSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pF3fAQGw; arc=fail smtp.client-ip=40.107.220.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pF3fAQGw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzF+m7zmJ2HwHF0NaxW2tUQdkll2IyDi3ymw7Goh52cp7aWUoG1owoL+2XJY+cWutJ0OM5+Wp6wsjc3/v3siQOEBlrNncb2mWfa+acXrFgkeFw1F+W8wIYeI/EIY+cW2D4b9+0pTFLMEcF+TM1w0dZxqDCyjMkwI713CYjelcJUOTbW+OeS5hVeHV0z5O6zsFr7gCB7UwLSg9HTrvk8e44hwdIDCZcsXF+QwsanUYzUS5PZqe9h+OCffc2XnI5gSE04sKwUZMDKxLAi5cqsFAkwzn4SV13vQlbgYl4g5YVrZj0V/KVMWZQdED+lFzs/ywhPJ9jPuuj+YJgvrRJIuGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WFCD9/iyo3l5E1fQoEpB4C5YRH+06RZW0Gn/Ld1Fqk=;
 b=m/EvOXKWELYGO1jfysRLdHSI8mESE/wkm0OvQf1FNj8dKMhF1BXieyegIaDI/7QNv1IAEIevBktpLTVDbJrz0AxxtV6M1QqrAJ6XtK6mi929r9GO7IIaNvRzi0CQdoUn8h9WOfwSGbhKiC6Ad0hf4NLmvAcOdWqR4R+ho3PM5Sot71LgnEEQL18Pmq/C4+r3EXom3zpDQVGrK/370JK2E6EAaUTGMrJ0WOjCYrnA1Sp3EWFR9v8CvUzJTAZq9/J6eUBJOA8QtT/t1hzxEao7m75N8sL4AXjGakaCE4O6cQjpHC3NuVmJt780HuHJ7/VfAoMS8dDlFMdruMkb5H7U6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WFCD9/iyo3l5E1fQoEpB4C5YRH+06RZW0Gn/Ld1Fqk=;
 b=pF3fAQGwcEF3JG5bLrfMLV9U3Q/ebpVHTaPSZw+9Rne7hkTc58k/7VDmc9v05NVgUvO1kwTKgfI1VIC4MP/eTZn/ZAKhrN8KMBt4oM+MAfrcmDXKAuGgPHx40r97tTPizn6Gq08QqEl9Djmil1skzGh2jRmGprWb6xZT2GiiW/4n6DRBkE0KgKdRTz754bYeqOHnNwKKOf0nYkEmYJM7pSG9EqwNgRaJHJ3EYGjo9YjcqXdgS851P5ChUAUE+ViI4vxt/68Fe2TPLuullRPdOp8ZMnBMwmTZFzir1C3a/PzSvAGWOEFJKU8mfm/s0qEBwv9uVRzTLTcPrztH2oPvrw==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DS7PR12MB6192.namprd12.prod.outlook.com (2603:10b6:8:97::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.30; Wed, 26 Jun 2024 14:40:25 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 14:40:25 +0000
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [request for vote] device parts handling
Thread-Topic: [request for vote] device parts handling
Thread-Index: AdrHyVZkEjB1ZfRxS/2TvCnwroHnPg==
Date: Wed, 26 Jun 2024 14:40:25 +0000
Message-ID:
 <PH0PR12MB54817857762DE886D9684E46DCD62@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS7PR12MB6192:EE_
x-ms-office365-filtering-correlation-id: 04bbd5d0-ffe9-4fc8-150c-08dc95edea82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230038|366014|376012|1800799022|38070700016;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?7xrmSJH6Y71qKIQ62pJgsYY/6yQi+vGTjZjUJCRxLNeFfF0vT5jfs50+fCju?=
 =?us-ascii?Q?5J5ESnbkxyWYGHNcEaOuWg7JDnYeSBPDpnKLspnD/rzjU+/a3IWSBC1Il2S4?=
 =?us-ascii?Q?V1WQg1FWsaND7vPuDVy9aUzzSesgshCXItJSiEUDOdXfd5pIOeTtqTVH6CmG?=
 =?us-ascii?Q?D/OQl0at+fCzSxPGsoPHvr9RdsznKayaacmKjOpb384x/ALmKiiJlT2HnxM9?=
 =?us-ascii?Q?OBgml1WndJiWVWzwV2bX+rn1FjbxL4npB4HgL6mH9wCiaV8GBhuNPg63Ijru?=
 =?us-ascii?Q?vLGCqAkKnQW5meKQm/HWZF0FOksLbS7HyvfMTfdqp6rAPvA81oYTrhr+3sqp?=
 =?us-ascii?Q?pYfwKc+GyQb3zHwtwOAEmjsXfSUYzMsBRGLS7Bqua4x6B49X0R95Gb/YDsJD?=
 =?us-ascii?Q?o2riGw+sPfg/kInEOc4ZSA1F+05pJLGj7vMsUpzKCE8zhuQNEy/E3EjM50xC?=
 =?us-ascii?Q?D9y0UHB1sM53z6HGpi2GCSpF6y3uz1YnaTzq4HCFXYGjxWvLlClXg45s3y6I?=
 =?us-ascii?Q?WpulpsEPD5CWP66oj324X2vMrxg+dX5MeYci0AiZ+l1MwESuGA9aDIgkwk5F?=
 =?us-ascii?Q?PEJsgofCV2vxQZ1yfRcUrDK1L6QtX0uWvq1ky3sCKghFjA9sXltzIJ7oYEiE?=
 =?us-ascii?Q?B4/Vs+XeINaB7Lhy4q5P/92Uyhq5Eo/ATE9XG6llmtmDa8pA4C5S5l2MXHHh?=
 =?us-ascii?Q?nE2fPFavCcplUwI1cKPnrMBWGUzfMM0J8YO6kFWPRaUzhCxqdAcKlC1hbptv?=
 =?us-ascii?Q?piZKNZmBL9eBoXV5WA68MPOeObMvbn5sI+fP0AnO9lc9y6iHh1+t7xgLicfl?=
 =?us-ascii?Q?Ab3bbh9yGvsyDgJ8+jjHJ6wWg4kc4m+CqozOWesLpI2002OaXs3PZ/qDbuJW?=
 =?us-ascii?Q?TtC+aIatW1fJDCoTSlai7tDfzc/i9iD+pLsIbJXsfGfWAJoxNcWsKV/CjNCH?=
 =?us-ascii?Q?dR/3ROvnCdmeyF6BWv9HZDQhh65yl313hTcHyeBJHf2PEtsXyV48F37rWkgt?=
 =?us-ascii?Q?VA1vbbkUhYr7YfYeWJBbcxb9flWIvbmGBz0c9N0YkSS/ouPusofQtjWkiXZ1?=
 =?us-ascii?Q?Fr/eJuZxSq0ZF0UvNpBTBaS8Bt22h/bM4g/a9FhN2oDUrUa/RfmMi9A8wR6w?=
 =?us-ascii?Q?P6APHeOC8w1c1n/woV/sEXDU5zt+kOlFJffToYgtkSHOtEVLVKymUCh3bgeo?=
 =?us-ascii?Q?ZRr4BFupRWlriI6MOqhDZGbNdJalfSRNRDWwmOoCev3fvSLmfsujgWGYHi17?=
 =?us-ascii?Q?c9vNZ8hk3MR5YqIPcm7eNS/JcXUTrBj/iI+AnnvNNA22AmoJ/3rVx5cK2LLY?=
 =?us-ascii?Q?qzuWyOlhviRwh2tZcZRMpS8O?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(376012)(1800799022)(38070700016);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LGJPMp6XcEO2lJGJSug/LLpDWKRJuLFiD5CGaM866GAsEsPy9WxML7uVAWz6?=
 =?us-ascii?Q?xX+jgxmRBtPjHKl6f6n1iFPRjYKYcTgwmyEfVK7CSvIr4cTDZhXZBy+mMfO9?=
 =?us-ascii?Q?RxFNa+2mWD9vOKg8OkbgEbBK/h+e3VtSCb10V6FYcgW0NMlJTAvU2er/r/Rb?=
 =?us-ascii?Q?HQNmARqIP6baABOYkmw011j2Z3o/wMtN5UW7XGcD12b912S7wMu1xlnNVtTG?=
 =?us-ascii?Q?OOh7w7lcgstAsTsAK+VMB4hLp36+F5GVYgd3axsap+7KCvu2hUC/5OezqIO7?=
 =?us-ascii?Q?Kn2vvcjDI24zrwccSxJgOMtyLK+veler6X/XBONVs3ohbg2I3Bw/mub1EmjC?=
 =?us-ascii?Q?oThOdDWs/oAsWnadgESWdUh2dL8L+oXHADVJBMTKfB2E/NusaD1yJfoGa7sG?=
 =?us-ascii?Q?iI/JKZZT0QpQDHZJmMWoNC2OuQGC7yIDBG96N9BjAJSTY+X5++e1HEmrNHEi?=
 =?us-ascii?Q?syuCB1Dc4yF/ClhSFRAnTX1NQ/OHhdt7eioYl+wrxg3+tTfsPrtNqgu3If2f?=
 =?us-ascii?Q?G4avgnF+vFCHPyHTVVQeuu7jXYwvQxwZ7DBUjd5bZLONz8e0C2UlMHv224Fo?=
 =?us-ascii?Q?yT7eXx/ek84zaVd1oxTb5neyzbuo6O4fHbhXJfajrqbL9yqYqPNzZDcwrmcb?=
 =?us-ascii?Q?HD4huShUuFf12yUAni1Bhk2vMhLBLKGJ27GmZrMXc/Be9Fz2jTx83qTUgwQC?=
 =?us-ascii?Q?IsFIB3Q43i2yLZpeScwWVRTUx7w5hHkzhLY4pz82sHNq8x37aEAbdf7Z8HYF?=
 =?us-ascii?Q?FoB97+ZbOBengreQu48z4SZsJc2xgyXO9NOr6VWy7r7t5jbw09gVjLMy5f1H?=
 =?us-ascii?Q?y544SGP/rUcdtrBoa1cjakdQNERc2teooJghAsom++PSJWq7st7Uod1Poltq?=
 =?us-ascii?Q?fqHi6WW0MsJjq86WrzqxdxUgFdYNodP1do1Lq7yqRKaNnVQXi8IcCx6mUkiC?=
 =?us-ascii?Q?tMjZ+BIITfMkECKvqZ/17lmx2pBs84QKwhJmDiQ5LFBVJk4VklCcdgNpOa7U?=
 =?us-ascii?Q?MiIddh5QmLsIG76y7i73IP1lRys2HyLoO6EqK9O9mYb2+T8Ljh5YiRhLCpfS?=
 =?us-ascii?Q?nleLO96fL50b0mcG2EJJeHxV5MNXDeQx4t7G17/REru4mDAQRD9BpyGj+/rm?=
 =?us-ascii?Q?Chy/Fj7S2h8IkYAj6UO3rteArJKhM12B7pBxVksHqJZAW8M/mihZn63Sx4Av?=
 =?us-ascii?Q?jMu5UOs566pvYJ9rqRtJBS4yHjxu9V9OMbW+I0e09FV2R7vCteXOSPzfbDSQ?=
 =?us-ascii?Q?l5VQvDZ0UyYin2kOiuapcrosZfLc1s2GKGNeLRmXSwSlRnoWiPlRDxY6b6mB?=
 =?us-ascii?Q?XlHa4BQCThPa0i7yFBXFn/QXfQ6QI+hTnqkaA4veEMdnVhwuHJcmrjtdThZm?=
 =?us-ascii?Q?wuq1dRT9EzZsNPG5RIDS6C5GXPSFuPFqoH1G/xwJ0O2vBG0Xxze8J2yojWxw?=
 =?us-ascii?Q?HM9SEV5ZLtdV061Z+sdW9VPvatN6cWlvCIypRL+4tlq8XJmmNKFsFKd84uXB?=
 =?us-ascii?Q?IXal1T0B5mEpIJQkksZuhif+6dXWEOJhIuw5lQwPfljqQM0HAaEqBptBwKw9?=
 =?us-ascii?Q?DRnraJCLs/CGImH1HxE=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bbd5d0-ffe9-4fc8-150c-08dc95edea82
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 14:40:25.3818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F8TvOEKv8c1+M70bwYar1zbOhJ3v5R8gRvuDBwBx2kyxDYJ4A/ae2dFv5cW2qQq5WH0VoTXC0fpDXz4k3bD/Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6192

Hi Michael, Cornelia,

Can you please start the ballot for the device parts series [1]?
It is for the github issue: 176.

This series has been for review for 25+ days.

Series [1] is jointly authored, by:

(a) Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

(b) Signed-off-by: Parav Pandit <parav@nvidia.com>

It has been also further reviewed by external SMEs from various areas:

(c) Jason Gunthorpe <jgg@nvidia.com>
(d) Yishai Hadas <yishaih@nvidia.com>
(e) Kailiang Zhou <kailiangz@nvidia.com>
(f) Yajun Wu <yajunw@nvidia.com>
(g) Gal Shalom <galshalom@nvidia.com>

[1] https://lore.kernel.org/virtio-comment/20240601145042.2074739-2-parav@n=
vidia.com/T/#u

Regards,
Parav Pandit
