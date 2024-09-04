Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB04126C0A
	for <virtio-comment@lists.linux.dev>; Wed,  4 Sep 2024 06:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725431931; cv=fail; b=grSvEjN9vonrMKGyL4G2RoECX3m1UQ8bSiPM5qfd59MQQLx0AkJRhRdhAuc9YtMkrN+fX6Vww9XtqfJaU1Y5tlSY1DdzLNKI+tLK339tDbqn49AkNK9QH0Rf+zj8sibkf2uVDibJyiAX0vm+lb2M4O9B9QIbIgDzulu2KnMlfSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725431931; c=relaxed/simple;
	bh=J0YkEgOBkQiXPV6k7YZXJP5Xp8Cu4EAnTvuWrdTDn6A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ql33duQsFdKl1A7Vfaf0MPvsjLVi7MogT+awOdZ5yNd1c8gRzU2gpubZKt6qnu1YM4pUnkXduI2c8ND3+t8hfMdRj6N4y6NdJp1xY0tIg+FcxL2ODczWWAUYGNnAnbdU/Uq7w1wg1ASRS8LrkuEk8bF7Fe+kzgP7ag0+Ow2PfaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=H+mRgbRx; arc=fail smtp.client-ip=40.107.244.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="H+mRgbRx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=di5c59fYLj06KDOdCxgxvsNb1lFp1Zj2F0bP0gXVjluQLpb5OuXcPMdw/79gl2A9RU6qAXefgGS0O+5i2yvXp3TpbJOzDauJgEU1qKjwxVopdcv5iAJNKKHj5wiUEpoiEGE+f8AEZVimFL7bHHLDyC7LBbHRDH9AFAoDuIsmtfitQp2+GeZWey0opjU9YjYKgCs9fUccXeiWGMSg/BlW1pk2ffSf5kNlBeZPGfBc+7jbFIG26vXwt7XSxunTIUBzBzMtD1dUyXI8+CfMDtdj715KfXmjsJAqRk9TALnwlyRfAN/zRQqP4P3AcHku/QLQ4yEEQNTUbA7jJUhKGbkq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn6AmZnEY7Oipw+1c6qAuQYR3U3rEjWNDG+RQBuRm2A=;
 b=XRoO1z9Qww5BX/7AjaW2YZY6V7a9x1gGfDwnCHCG6vyTvxdiMLsoSrmJItpLnmwFCIpZ9cbCOVPvCzxo0iSm2wqFlDBG5s60Q/CWzpmauFPx8slJAgKRDKaO2yPMUw0ux6BSb86eMkDMIdOGzlwtQrAmgKQ2dxiiM/ItvD4kDHewu27ccymJe11mnbwKXP83HkkWdqmTZk4J9NNwqjFacVsHL0yH1d7qiOcJMyo6VaDUSl4TCDoaphq6bMTAijnfmUHeUaSST5FilRYuT38LuMKLLdZgzn28EAw/8BDMUJz0nLGWQPyrgcg7cocKMcskcSqQ+nUsRbdNVVdp1yvV0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn6AmZnEY7Oipw+1c6qAuQYR3U3rEjWNDG+RQBuRm2A=;
 b=H+mRgbRxSxIUeqkLpHsWsDD9DCIQu5Xp7uVF209YRZSF0lksyG70P/+g7MSsj3D/5PICuWAb9qtY0RJa1s9B+9p1j9H8M6nO9NZx5zOmz1lIqpypXCKIXWipV4h3e0gqDn/BriN59oQnrgnXNV02zsrY2M1mWv2DHCZC4qLYj5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by SN7PR12MB7106.namprd12.prod.outlook.com (2603:10b6:806:2a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 4 Sep
 2024 06:38:46 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.020; Wed, 4 Sep 2024
 06:38:45 +0000
Message-ID: <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
Date: Wed, 4 Sep 2024 14:38:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
 <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
 <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|SN7PR12MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e15b772-624d-4072-cbb3-08dcccac39cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjdUbmxIeGNVZG5SZXRvSm1ZZTZWYmZERUkwR1ZXL05vZkU3QWQwOEdna1Jq?=
 =?utf-8?B?MVExYWFFNmprZ1NxK3lSYWNhY1JhYk1WZ3poMkFGV1hOdEM4d3hVc1g3YU5l?=
 =?utf-8?B?WCt4YUI3bTc1MzJFajBXYWk5Q09GNVhaSTA5aHVpbFhBZlBncjMzR0l2Tkg1?=
 =?utf-8?B?OFFWSHMrTkFsZm1TaHhHdkZNMmROSXcvL3BWMlZlN0c5aVBlREFUNXkvL2s5?=
 =?utf-8?B?N0tRQmVidUIrekdoVk5oZE43NzdMeWhVTTBUUy9uVm9wUy9qdlRxMHIyclZh?=
 =?utf-8?B?a3ZxU1drZzh5bnIvcHYwZDJ6NXowMURSZmtjTDdBNGZhRXVtWGpGb01UUlJh?=
 =?utf-8?B?MDZmZGs3dXd0anR4bmEvMjd4M1YyZExJMDNLNkZFbXVjODJ3MEs3SnU3VERJ?=
 =?utf-8?B?TXhZVFU4N0xmSWFVUTZQL0dHUll1eHUraUR4UDd4SEpReEhEMFVLajNpQTJD?=
 =?utf-8?B?QTFpT0Z2VWtkNnQyMnNvVnlLWXRON2dJZkpJNXpUMHE1Mys1eWVuL2dJMmlv?=
 =?utf-8?B?NnpkWXhQY1NVMENycHlBMHpVOHJhL0dzeWhSUGdyNDVvWS90Q2hhQ2lMN3ha?=
 =?utf-8?B?cGNGMGdORExBbWptSU9vR2VEcWc2djRiWm5JdDJHQi9xbU5qVGxYY2dBclpn?=
 =?utf-8?B?dU5RYVg4c252NVJhRE95RVovbHpEeHVPZmdSRXVhSVNXTGFURGRFUmlIRHhJ?=
 =?utf-8?B?cnFYN2FZM3RON0hWYWlYVGxJQ2I0VUZLYVo5RTRodHh4NUsrTFlJRDRyMGk0?=
 =?utf-8?B?YlBJTkFlcGpEMDZ5dzQ1eVlDVjYwbytqdTVXQ3paa0xYWkloRlRrOTh1azhv?=
 =?utf-8?B?cUh1Q3ZTNkJpdlJ1aWYzRHROd0Jqdm1IYk52VG1WRWNPL3VGdS9FbnZqMjRP?=
 =?utf-8?B?QnZhYktONGpFM0NSeTNvTDRSRTlydEZLVnRCM25qdlpoNHFTeEwwZERaZVV5?=
 =?utf-8?B?Vk9Cd2UzYnNjWlVCdjl4dlIvTndhWU1xVy84VVVFZndTQVAyWng1TGtYREtS?=
 =?utf-8?B?ZUZyUzVXZWZrazliTGlQNnNrN1p0b0htZ0xGZGtxeXptdlgrQmV6bGFhQU1Q?=
 =?utf-8?B?aXFqbitUWU8rMDdjVEtpajlyZ1NPMkcvaUYyT1V5WGNZYnFBbzEreHlKb1RE?=
 =?utf-8?B?OUFjOU1Xai9JZTI2eE5IYUlCZTk2NmNpQUZmMnhnWm4wSkdURlNkUDVDWWVp?=
 =?utf-8?B?SkFEQ090TUVQTXp5MGhySDBxUHBiWXRGazZkRFJVUlljb1pZaGN1N25JcVZT?=
 =?utf-8?B?eTB4b1d6amxTZ2FuL2czdk5iK0VnampPdDV0d3hEWkJwd2xsRUgvSGlwajVS?=
 =?utf-8?B?ZC8wWUxrSERwT0tSUzIwZmpkK0IvVXBxMllmTkoyT1FZdUViK1ZtdFF5TmR2?=
 =?utf-8?B?NE9SdDZuQUp6RU5oWU5aanA2NHRQSmZ1T3pNTEpkQjYwaStBRkZaTFVKZTdL?=
 =?utf-8?B?SW9vL3VDRW9QK1NFM21NbW9iOTFlR0V3UEhySEhVMjZVRlZma0JkNUFvNXpE?=
 =?utf-8?B?ZWt3RXQrVm8wUnBWWTcrUEQrbHBBQ3pzdmJPNzJoNmNhVWJ5N0xoTWFSNTM3?=
 =?utf-8?B?K1F0RDMvOGtkQlVFd29CTGt6T056OHJ4MkNEdU1ZRWp1SnE4Z1BzN3ZqSEVQ?=
 =?utf-8?B?WXpqN0IwRzlSN1dGMlZtRkxVazlkUGJVZ3kvZTR0RFAybGRFZ1JlTE5hcTZw?=
 =?utf-8?B?ZE15VGFhRi9IaHBxWUU2YUVpOUFoVXNSeEdacFloV1J1Z1Nmc3FGWDhvVlF0?=
 =?utf-8?B?MTZjY3AzeVFIdmNqMysrbzJ0d240clVmSUZpUTNpemxlSHJUa1FBSWJxZjhF?=
 =?utf-8?B?Unk5M1RyNmI4OU9IdTJtUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekxna3dXSkFvWDIvQnIwaWlYTUU5eFlPWHZtUklrNklkVWRUaXhHN3h3QzRR?=
 =?utf-8?B?VFZDczlPczFvdGY3cTBtR3pkNVU1Y1poUHJKeC8ybGlERHBDdWJpWDZaaTMx?=
 =?utf-8?B?WnhFeG91VkRqdzlpaDNwN0FnamM2RWFwV1diU1lZTU5OVGdEdDlWNFE2SGty?=
 =?utf-8?B?NE5YVy9TRmEzVXJkV0svenpPbUhQU3dJSnF2Q0Rwc0hzelgyMm03bDJxMjlY?=
 =?utf-8?B?SWN3OWhyUVB0SThDY3lXZDV6MnNPV2lrT28rQXRlWEt1Njd0OUE3R0ZHVWw2?=
 =?utf-8?B?M2pjRTAzRGdSVW5VV25VMWVVNmRtbFZQbW5KSUZZM0pPVklUeVlYYUVBcUl6?=
 =?utf-8?B?b0w1bW03MC9EaWJ2S09ta2laN0tqSFBWb0dkRFZlYnhEdzBYN2g5czFlN0Qw?=
 =?utf-8?B?c2xKb3dNRE1OZFB0cFlBcWdrSThDcDJyeFNEZnB2ejZ4VUtQMUZqc1ptYzJ2?=
 =?utf-8?B?ZUhxTlVsR3pZeFNQNjdaOWlPWjc4QmRKR3orUWk3Lzg5bHBtMHgxdjVNTTZj?=
 =?utf-8?B?ZnB1dWRlK0Vvd2QvcENxcDZiQk9sMVM2dGpwaHNMMU5QeGJibk5BTUVuQTBE?=
 =?utf-8?B?L3ltN01wTHd4YkF0ZnR4UFVZamZCYWhVb3MzemR0N2xEd0MvcHBzWHFxVm56?=
 =?utf-8?B?WkVTYkx6MlNjYTA5VGUzVXc0cVB1aEZkSXRjUEFOTzYvajhVanRxcUJ0MG9G?=
 =?utf-8?B?Yk5qWVpyV3RTL1UzQXpINnJQdTdWclhDMmpiM0NQOFh2RTh4WnNOUXRHSmJJ?=
 =?utf-8?B?eFdHT2g5TldkRjBFNjZFUjFRZTIrejIvaVJNSzZaVStWNExqcDZJT1lEYWxD?=
 =?utf-8?B?azl1b28xTC9RYmxJcms5ZnBRMFpsNmkvaFI0ejRwTWs4RkZNbnJocTZlRW84?=
 =?utf-8?B?UVdrdkxpRVdCei94Y1pmRFliZVErTTZSQzJMLzNsSDBIaGRaTjVLMzlwVHFP?=
 =?utf-8?B?OExCV0NqcU1lREJBOERDRHVQVlFvWUtDS0pwM0hBeVZQdzdxRDVsYmRNZzVJ?=
 =?utf-8?B?b3g0MmVPdG5QSzlxdlpoUE0rVDNWL3NtT3lXOEVxQlBQN3FueFZsclNaNEEw?=
 =?utf-8?B?RGhsM0lTNUVjQVR3cHp5MzZkYk5IV0RkeFJYQmNPMGtabXNXN054QVNqL0ll?=
 =?utf-8?B?UzBQWmdzUlhzUGxzTDZSQ0xhZUxBbWRkWWRHNDdOZzI2L2JrNkQ3MkcxbCtH?=
 =?utf-8?B?dktibW1INGVpQ1FUNE5lYnE4ZS9iQlAxN3pRNEJBYlFRNnkySlhYaFN0RTk3?=
 =?utf-8?B?TnZUQTljbk90c1Q4RVZTOGY1d0VkYyttT040VVpFa3BIV25QM3BrRkpBMTJs?=
 =?utf-8?B?MmhvSUhjRlJJL01HUmdxbk8xSGpZT1pXcVd5d01vUXYzRHYvOU53RzQ1UHlu?=
 =?utf-8?B?UUFWSjRTSG8wZDdiVFpaUmJGaDFaVXVxZG8rZUQ0c3I1NkNZNmptNERPZnJE?=
 =?utf-8?B?ZkhiL2NzTnp3Ky8wUkJPTDExUWtocUJGeTJ4Q0txcWJ5TTJuYk9zS3BZSFdI?=
 =?utf-8?B?Qk54MElqK0RxVUNVWXlSMTdEVVlFZm5zZVY3MkdBVFJhK2pxSzRIWDRXY2Y0?=
 =?utf-8?B?T1dEZEh2eXpWd0U5WktnU2NhQktJN09UR0VtWmErcW83YXluM0RWL1VRdDZF?=
 =?utf-8?B?aW1meEMzbWtGMHJRbi8rSVFNZGFDcTlmSDNwd0g3dGt6R3RScmUwM0R5d1hu?=
 =?utf-8?B?VkhXRHRJa01oajd0aDhrQklHb3FqWHFoN0Y0VGVHRjlRa0kzUmdpbFFkZHpH?=
 =?utf-8?B?NUdWY3FSa3hRTk1GZ3k4Wk1mNGNIT1MvaFRqdFdzUGROUGYycldCSldqTTFy?=
 =?utf-8?B?QTlleGd2Zzhhd2k1ZW9UbFZLNEZRMHMzb0Z3Yk9rY0xKM0hHd09KVlhVYnY1?=
 =?utf-8?B?ZXdLdkQzRFRMTmc4TzVlLy9BYmhkbWNEREdNYUpVNXB6UklGM3pWbnhaN1JD?=
 =?utf-8?B?bFcrMzhuQmtKM1ZXbkZmLzRacHp3dmp6MENCZ3J6UnRDV0p6dEU2MmZRWDFE?=
 =?utf-8?B?VjlPS0svMlQvbmV0QjJUMU1OTVFSY0VXc0dabWhHL295UDM0eDFscEtTQlZ4?=
 =?utf-8?B?RHRITXMzbG56WGRQY1ZydGVYa011eW5ocFpxUXluRU05dGNaSDRzcVQvb2kx?=
 =?utf-8?Q?igZH/IPAdpJpBYpBooqYZHU4t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e15b772-624d-4072-cbb3-08dcccac39cd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 06:38:45.8836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdkckQXGKqBJeIIRdcW3DaLRFzjMuKsfI6KJbrwxGkAE0S/vXXGZ0JgxpXdYISiKgxnTp++c2VBTwhgc3gMueQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7106



On 9/4/2024 2:31 PM, Jason Wang wrote:
> On Wed, Sep 4, 2024 at 12:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
>>> On Tue, Sep 3, 2024 at 6:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
>>>>>>> But I don't like it that looking at the registers, one does not know the device
>>>>>>> state. Hidden state is bad for debuggability.
>>>>>>> We have 4 states:
>>>>>>> suspending->suspended->resuming->resumed
>>>>>>> so we need a register with at least 2 bits.
>>>>>>>
>>>>>>> we could steal 2 bits from status but it seems a bit much.
>>>>>>>
>>>>>> This is why letting the status tell the status and control register to control thing is elegant.
>>>>>
>>>>> No argument here.
>>>> Or, to be more precise, our status is driver status.
>>> It looks like the device actually otherwise there's no need for
>>> re-read or poll for things like reset and others.
>> The need is there for complex device state transitions, which
>> can not reasonably block a read response.
>> Another standard approach with PCI is to specify the time
>> transitions can take. I consider that less elegant -
>> is this what you are advocating? The advantage is that
>> driver does not load the pci bus with constant re-polling.
>> The disadvantage is that it is hard to pick a universal
>> number.  A combination of these approaches might work,
>> e.g. a recommended timeout then poll.
> We've already had msleep() for vp_reset(), anyhow we can increase the
> sleep time, if it can overload the pci:
>
>         while (vp_modern_get_status(mdev))
>                 msleep(1);
>
> We can do the same for suspending.
>
> The main blocker for timeout is that it may break migration and
> complicate the hardening. Another proposal in the past is to have a
> notification.
>
> But what I don't understand here is that suspend/resume should be
> lighter than reset. If we can afford a reset, so did the
> suspending/resume. If we want to have something new, that's fine but
> it should be orthogonal to a specific new status bit?
I agree, if we want new status indicator, then the new indicator should not be
specific to SUSPEND.

Thanks
Zhu Lingshan
>
>>> Anyhow driver know
>>> its own status.
>>>
>>> Thanks
>> indeed, the status register is there to inform the device about
>> the driver status.
>>
>>
>>
>>>> If we need
>>>> to reflect and control device status, we need something else.
>>>>
> Thanks
>

