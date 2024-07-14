Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90308770EC
	for <virtio-comment@lists.linux.dev>; Sun, 14 Jul 2024 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720967952; cv=fail; b=uFk8joBG2YYPaNtEPXrg09sFeLRPVf3OZ+hp8jplIoIO9+twbFV1MJRiCPB4rH7Tb9N/Bp4aQn2wz3xk4ZmgOk1gSeq2pt2IwT7uCUx05rti9YoxnixdMP4XdCcM58TAfJOcTD5E75eCj11LZPKJsZqEXPONYEfLp3PdFYaw23M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720967952; c=relaxed/simple;
	bh=5g0xEuPC0pi3o3zIdnOLBTraTEnRvpZ3tmsUEXTTIiE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IzcQ1uOGGSuJGrGQXzV3uGGfXzWZvJuMjd3Ki7AHhncCaWW9HVcZLqexBicwKWCu03xGe1WsGnr6mw8S00+noiwTTgmGSm7JdSHN31521Q4GvbKwpEytHX5IOvhp1drBOWWV0RF5lqvUYmFupLFWEEei6GtLoKwdjHIdzq91KMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z6CmgBi8; arc=fail smtp.client-ip=40.107.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z6CmgBi8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KO9SKaSv3VU5S3n4C+zHkeDPEyBA0Ns3g2+nXrMIREIlnWgfQ9snKdzQ7G+sCpfkxQ80xeIuLDtSxp+4VwXnREQVWBNkKkzsSnMDLPA7YzGvdreKWrB4HWSd7jja7Cd/3X+RdAHArtZ3tAZwaJNq4WDF71rYzdTPPY1oxsoIuNnbmSs29DadY8rVeP9G0YEtycsLFM2lSzfomM//T1jxSL9U5vYL8zdMQDYNKc19uiW8L3MgtcFp4jWJobCJ3kLB06PpyxxfVfGwQkRVrRLBkNfD5U/51ljULUHQ9XoFIx7pvvmfJybCf/tcg08tOYcu0y6rP7SF8rz3n032HBuj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5g0xEuPC0pi3o3zIdnOLBTraTEnRvpZ3tmsUEXTTIiE=;
 b=O8+ZqzeFMn/WJc0gnSmdJ6BQFxV7grEtw+VDbqOn4IK0PUJfOS+CGTHjzzN+PtMCqxC1ZddF0LD9B6tV4JBmgq90prIAfcnMYYRMZtIczRlG3kzv/SIG1fKBrT93jjcXcyZHCe2CcuPFKId7AhX5UqZXqoZ/5TMdbI7vSxqieu/u4/oOEp56GDqV7RJiz4hyJbRLgurVo3ofiJljFe24tFSMZHS1LlYssi6TsmNQD8rGQLhn6jwlOwFzJR2crc8FnL7kb4PXVBnC15dWhSAH9rxnbkC3yb1hDaUDhfjWhmZJPW4w0XY29k/6DXgXrlsB1fIET3O+bDjr3J4LIGh09A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5g0xEuPC0pi3o3zIdnOLBTraTEnRvpZ3tmsUEXTTIiE=;
 b=Z6CmgBi8m74b1u5mdBoTduC+0Tp/kWP07cpiIo7sTcPkMJRvfsVuHXDexfL8KhUhx4bFajzxn7f/i8HBjU8nHLLJtv3K0kQgAHy+50syNU+FPTFnm1Y0OZhepgbo+KkaKZZfXeoLCnTDbvuXUcDLsgurmpoI35kj5rolCDDjocWFIViyGYe9WXN0vDZ9DXRAgPzOlpVYGi1dYEmZUF+ZW9+8AK+WCxrx4cfDhwZeDkfroDjybb54haKyKo8yUEzB4+1rT5habu7ZchthhY4I/LFM5i0wzXf5R5cMhzn4fMV2YG0brVPkVNyWwrllh1QCi+Oct9l3I5NiXFj0j1qhug==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DS0PR12MB7873.namprd12.prod.outlook.com (2603:10b6:8:142::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.25; Sun, 14 Jul
 2024 14:39:06 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%4]) with mapi id 15.20.7762.025; Sun, 14 Jul 2024
 14:39:06 +0000
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Subject: RE: [PATCH v3] editorial: replace hyperref with ref
Thread-Topic: [PATCH v3] editorial: replace hyperref with ref
Thread-Index: AQHa1fs9M+g/qpGMWEuOTjR61rCIV7H2SuCw
Date: Sun, 14 Jul 2024 14:39:06 +0000
Message-ID:
 <PH0PR12MB5481B7000236059EA3E243A7DCA02@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240714143632.3291695-1-parav@vr-arch-host06.mtvr.labs.mlnx>
In-Reply-To: <20240714143632.3291695-1-parav@vr-arch-host06.mtvr.labs.mlnx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB7873:EE_
x-ms-office365-filtering-correlation-id: 39f6a8c2-ae62-43b1-60c9-08dca412b6cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WjlwWFRDR3lPaVY5WVgzUHZrbDhSNUlqcXVvUndyZlR1MFpaM3owRlN2RVow?=
 =?utf-8?B?dUxKQU1tVC85WTU4SHgzZDc2WnJXQ25iemU0WXAwcERhNWRiOFZjRzg0dUt0?=
 =?utf-8?B?TnRYQUVoc0QxSzhuam5od21xYkgxZWhMZXY5S09CTDdxV1RlRlllM0Yvd0kz?=
 =?utf-8?B?V1h6QlRnbzJqdnAwUTcrTmFZVW10MEVjQnc1MCthWjlGbXNrd09UYkRqMnRv?=
 =?utf-8?B?eDhrbTJDcUFGVXRneFR5Ymh0bkt4ZGdwbjdUaUU1UndaaiswZFEwNUU2MmtI?=
 =?utf-8?B?Q3UzQlhLdEN3cGF0OEpOODVlRTFHSXpaMGdDdDRGdnYxZ0RnTmZDeGtrZDRx?=
 =?utf-8?B?KzlpUnJhS2ZXZGhDN1lpVTBEbDRpTXExV0lBQW1XS1FnMkZsTDJxd084SVpT?=
 =?utf-8?B?Qk5tcG1iTVI0aThnenN2Q29qSEV0OEl6QkZKV2Z6RnQ1dnFzdE41S05Oc1Bx?=
 =?utf-8?B?d2Z4Mkp5eDhUa2k4dHd6RHFpbXBYWm1qYytzcWFPYUxKNEQvR256bC9wNUZS?=
 =?utf-8?B?OXNRKzJOdFFkNUtNYXhGR3RMMDVoVmt4MjB0dzk5b1hMMHZqRE9XNU0wS3Qz?=
 =?utf-8?B?TkFodzVPRUFnejBhQ2owa2J6eEpaa3MrcjFCN05EcGJwRlZOUmx2SW85dzhQ?=
 =?utf-8?B?dVAyQzhPSEtxeEtEYkdYK2trTUdkUVB1SWFxRWFwNkRuRXVIcFYvQ1piYTkz?=
 =?utf-8?B?SmdKRnYzWEY5UVFxOWhHbUhobTdPVHJXNU5HK0VtVWtLdEdLYVNsbzJJa1lx?=
 =?utf-8?B?UEh6QTkycWxWcW9YZ2E1cHBjWVBVcDFjTzhnZXBDR05HN2EzMzFqbWRRR040?=
 =?utf-8?B?ZEdxSTRwRHZDUWdMKzRSYy9iNjlYbEVOYlplSGFyMS9tamJQVm1keWRqVW5T?=
 =?utf-8?B?bUNMVm5NNTF3anBzd3luMVlaQ0k1WDVJbkpSNG9DVVpQZjJsOVVUZHAvZkRw?=
 =?utf-8?B?dTdmK0FmSUZIZ1VZZC9kdlZzYkp6cUxDS2FqcmgzWTZIaUVpUHhYS2tJTmhm?=
 =?utf-8?B?ZS9ZVk11Tm1yZS9yNDVpbXVQcW0wYlBlSG1Qd1dpb0p5VVJvSkdPSGZBelpw?=
 =?utf-8?B?SzEyRElzdkhPODVpY3dTUStpcUFmSWFtVHIrZE5WclRpdTVaZW1OY2hHdlAz?=
 =?utf-8?B?MHkxOHUxazZUdG5Rd1RnVDdNYjh6ZVFNSVhYYVZONHZVUVIxWVM4bzVxbmMz?=
 =?utf-8?B?YldzZlZGSWczWVBHdU1HOE9wMGxQZThGd3BuQm9pRk90L0dVWHkyWDJaaHlS?=
 =?utf-8?B?bXhtK09FUGR6RDFaUGV0ck9UdHNyeDY4Rm54Yy8wYU5VdGcyZ1dpcjUwWE9U?=
 =?utf-8?B?elduZ1N4RGQ5QVp4NlVaSmVFTmVURnE0UXRoa1Z1MHRWR3ZkM1VsYTNEL2gw?=
 =?utf-8?B?RUE1dTZjWjY5N01ESE5WVCtjdXpuejNaT2dkRDRZdFJpRjlINW5xYUpqWHFS?=
 =?utf-8?B?TWo2b3JpZENkWWtEdHNUbzl6c0padnBhK1owaVd3Nml0aXJsdDFrUUxYSDFM?=
 =?utf-8?B?MnYzZS9CdTkwYW9uU1VKS25WL1NaUW5SeHRjOHJrRUhRQWJTQmJva1hmS3Za?=
 =?utf-8?B?Tk9hU2I1Um1QUCswckEyODNBL05pY1gzQVlQMSt1ZGlNY1dKUHdUOFQ1SU8x?=
 =?utf-8?B?ZVF3ODRFN3VFQTA5OTBhQlpoaWpaL2NRSGRlK0oyc0V6a1F1UUJnUVArL3Q1?=
 =?utf-8?B?QVdMcTlnRkhXdUVXL3BJUS9KNk5acW56NlRETDIxdXdZaWw0eFJHaGJMRFhx?=
 =?utf-8?B?dGxTWkRHYzRKYWhoTmY5Tnl2SzJYc0NGeXArT3JZUHRQeEFGMXpNd2R1OEZv?=
 =?utf-8?B?NUp5RkNyeVIrZHhuRFBONzN1VjlReHFmSmNycXNXdVZjdUNqOWFZNlFlV2hl?=
 =?utf-8?B?S2JiUXBMNnJBWVJONEdOWFdoMldxUjl4VFNTeS9YT2hjSVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VjlXQ2FnZm9YRFN4MFZDODBvZFd2SEVkdHhhSXJSR3NPYlRVZ0huM0kwcTBV?=
 =?utf-8?B?L1kzU1g1WTRrVjgxa2FINE5PS1FpcGpYUEpJTTJNL1VFTDAvVzNLVmk5MDlR?=
 =?utf-8?B?azl1L2NnRVpnRy9vazAxNzVvQTAyZjVaL2ZwSDRVYkJMeWtOSUdKbnJVN1A2?=
 =?utf-8?B?THJueXN5Q0ErWkZaN05WaThuQmVKa1lKcDFGaGhBNDRpblpJbmlyZWozUjJZ?=
 =?utf-8?B?eTNJK21rRzlIa0tMbkw1Y3kzNkRuU3JGWVNMRVF6TFVVd2FkS002YXBUK0FB?=
 =?utf-8?B?M2dnZUN0WUVjaTE4YmNkNVdTZVU5K1JOcjdtK2dHNkowa2lXcy9CWjJzMEZI?=
 =?utf-8?B?T09IMmJJVE9UTkl3Ty9neG9QM3IveTRVRE9abHpWYVFFaUpwYWZab0FqTVVB?=
 =?utf-8?B?TkR1eVUybG5JWnZjdHlKNTVUclJJWHJsV0xpdVFPL2VTaHlxZVF4bk9jQTkv?=
 =?utf-8?B?am0rcmEzMm4zL1NVMy9HdFd4c21nemxNbjlEZzErY2NFSFcwb1lKV0d2Y0Vl?=
 =?utf-8?B?dFpMYU1JT0xpK0Q5Y0RSUUp4NlhsMGk2aGp6Z2JnQ0FUTVoxRjNva0RZZGVv?=
 =?utf-8?B?YlhCUWYzanJYeWQ0MFQyMzlaWlovSjVrajJDUkVrWXo4akhMcnVyem9BT2gy?=
 =?utf-8?B?NUVaay91clNrZlhiT2dsYjhOTG5XekxOMkcyb2dsZjFLMGF5YlZIUnlVNFRD?=
 =?utf-8?B?QlFuSWFUV3pLT2l6TkNUUHVYcEREdGE1NmFwcXFET0xiMWJzaEJaUEIvZnQv?=
 =?utf-8?B?MHE3cmZWaklKZjdrMlZ6dkVqdnJxMmwvT0J0dkkrS2J1TW9pb3R2VnVJdStB?=
 =?utf-8?B?d3ErcmM1eTFJRHd3L1pZbnRuSjZ5eE85RFNLYXV5RW5uUm5ocSsrZmc3dXA5?=
 =?utf-8?B?L3BrYk8ra0hWUitlZXk2ZzZGRlZZUnBKMlM1Q3VqVEZJT01wdEZlaUN4NFVY?=
 =?utf-8?B?WG1ROW5DRUF4L0RQeW1kd05aeFdWYlo1Zi83ajZtZXVpZ1hod2l2L2p5TFlt?=
 =?utf-8?B?MTN2S3RaVmVJV3NuMHFpbStwbkJUZWtqbHRYYUlTWlZYZXIxcDBkVS9NZUNM?=
 =?utf-8?B?QUhxem1BbmltZ3h4MTJjUFE1SVBKMFAvMFdSQk4zTVkvUWNPblR4d3J0TWtk?=
 =?utf-8?B?eUtFOEhFejZ5b3EyaEF5QlhuT3E5WU51MmR3SGt3M2FqVzJPWjgyS1djOUkr?=
 =?utf-8?B?MENKMnVpdDZyZzVaNEZVZkdxblRRaVQyOUdZVFlWZWFEWnZMb0FIYUtGNzF2?=
 =?utf-8?B?WnRzYjJ6TThvVkl3dTNQZ1U1c3ZXNTZrQjRMb1A5R2xTZFkxcStmZkM2bHJ1?=
 =?utf-8?B?N0Fobm9qdUVHTmp3WGV1ZUVlZXo2anF1WEZOa21TdmJZaG1JdW5OOUg3WTkz?=
 =?utf-8?B?eG9mWWlrOWQvUzJtbUFOWDNBRU9oM3kvY3pLelUxOXhVbXpzamNyUllaaW90?=
 =?utf-8?B?eE16ZUFDa0htOXl4MlNDc3dHQk02KzZuZC9aU3NYbnp6YWFoV1dWdFQzTEVu?=
 =?utf-8?B?bkl5VTJrYTJsSXZCZE9oUy96RGZqV1RUaG9xTkovUTcvYTZRaGVTTDA4NzVv?=
 =?utf-8?B?TXhNUDFOT0VjeVNac0RlVlpwSjBZRjVyQlZaak9pajRoNjNZQmpVa3JBOTZV?=
 =?utf-8?B?S0ZBV2hSeC80N1pucVBQWUVGbTVsU0t6ZlpUMk1sSTloU0NCNjJmSEFuUWRI?=
 =?utf-8?B?L01VVlkwSGZJdjBKNEpkRXFtU00wNGsyajZ2aDY1Q252VEdZZ3g5SEZEbzAw?=
 =?utf-8?B?TzU4N1QvbWhlS2xlMFhyVTh2TG1TR1E0MWRIZnVMcVo5QzEzdlphaU01Rndx?=
 =?utf-8?B?SVhOLytjTzRTdEkyRklFQkVFT0lNcEZPUUJqSC9iQzRNbnlnWG9Ec1hQa25C?=
 =?utf-8?B?T0liVWYxZWt5eC9LRlhBaUVhcjhETDJ6Y3NLUHg4Wm1ZVTBHVmhoWEN0L1hx?=
 =?utf-8?B?bW5MMUJyUStENUl1RDk4V1RBNGFmVW9wMDNUZVNEUXhUeFVxUWQ1TkRFZTQv?=
 =?utf-8?B?YUZzbXRHZXF0c3p0N1gwMWtLODdyVWxuNi9STVdGc3Yrc2tER1kvbm1uMEVG?=
 =?utf-8?B?dzJldDhUaGtsWWdycDhLUEJOanFTb0oycGUwNVBLYVU0Y01LZ241OUlxdHd1?=
 =?utf-8?Q?KFOg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f6a8c2-ae62-43b1-60c9-08dca412b6cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2024 14:39:06.2633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WlCr/4MvYCAY7d0Z2fJ3ilFCetRA9A+kaR/0/NAsHKcG/5hvrhUG8Koe2sBow4VGzilbdTdb0b8ZA3Vxp6LTpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7873

DQoNCj4gRnJvbTogUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KPiBTZW50OiBTdW5k
YXksIEp1bHkgMTQsIDIwMjQgODowNyBQTQ0KPiBUbzogdmlydGlvLWNvbW1lbnRAbGlzdHMubGlu
dXguZGV2OyBtc3RAcmVkaGF0LmNvbTsgY29odWNrQHJlZGhhdC5jb20NCj4gQ2M6IFBhcmF2IFBh
bmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYzXSBlZGl0b3JpYWw6
IHJlcGxhY2UgaHlwZXJyZWYgd2l0aCByZWYNCj4gDQo+IEZyb206IFBhcmF2IFBhbmRpdCA8cGFy
YXZAbnZpZGlhLmNvbT4NCj4gDQo+IFJlcGxhY2UgaHlwZXJyZWZlcmVuY2Ugd2l0aCB0aGUgbmFt
ZSByZWZlcmVuY2UuDQo+IEZpeCB0aGUgYnJva2VuIHJlZmVyZW5jZSBsaW5rIGZvciB0aGUgREVW
SUNFX1NUQVRVUyBwYXJ0Lg0KPiANCj4gRml4ZXM6IGFhNGY2ZjA2OWFiMyAoImFkbWluOiBBZGQg
YWRtaW4gY29tbWFuZHMgZm9yIGRldmljZSBwYXJ0cyIpDQo+IEZpeGVzOiA2MTdhYTJkNjJhODgg
KCJhZG1pbjogRGVmaW5lIGNvbW1vbiBkZXZpY2UgcGFydHMiKQ0KPiBTdWdnZXN0ZWQtYnk6IE1p
Y2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFBhcmF2
IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4NCj4gTWVzc2FnZS1JRDogPDIwMjQwNzEzMTgxNTQw
LjMyODQxNDctMS1wYXJhdkBudmlkaWEuY29tPg0KPg0KTWlzc2VkIHRvIHJlbW92ZSB0aGUgbWVz
c2FnZSBpZCBpbiB0aGlzIGVycm9yIHByb25lIG1hbnVhbCBwcm9jZXNzLiDimLkNClNlbmRpbmcg
djQgbm93IHdpdGhvdXQgdGhlIG1lc3NhZ2UgaWQuIA0KDQo=
