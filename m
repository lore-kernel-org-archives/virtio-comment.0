Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2054.outbound.protection.outlook.com [40.107.101.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538FA1C769F
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725354354; cv=fail; b=hoAwaRtkBre+K3YnNIw6NR9NmiS1NS+ik4+KPUooceiUmtAXPJQJaPcoYYPNN6/OCsj06as8aFa3RdNL2HKDJvjz5BZmT++I4FDoPFcf1EGuaLUbza3PcKsqhRKnNhfhYJvZlcPcrmrOgJtiQ3vYKAWRNkY5hLa9O5FBKS2QT4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725354354; c=relaxed/simple;
	bh=BRz7Rt0XDD2Id4OhWKdJ7PmPkOfSMthsCt7HDtAGHOk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ELO7gHsrUHCXOv98H8fTOrUX7gBhyfv54LMnyGT8FBL62BhQ8cx/RjiPwwb4QEpwYar2Z9VhxCii499TRz27wZewjIezwfFzTOzfSARAf1uHbBpKJGLpAtycnF/Z3Eq5JSzNYyNlJBk4Y8VOFEBEFC7APRUt8ONqm6NDgS7OK7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VJdRsnoD; arc=fail smtp.client-ip=40.107.101.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VJdRsnoD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnOu+yjd+Qg30KTra+5RM8O044qhQKUzwrlc+UQ2MRhuki389AxCYWNgGc/G0DsFAGK1BWRteD8xD6+zeQCVSv+jS2gqq5GEc9vEfaZEJlcCml9y45TMxnt0g7yGCE/8KQ/fov+S4VDicsOm0wIeXO23sem5DRUF3PYoNgvK8KRVwuFuZ2jdXpFsxMd0BZat8d4IdwbKxjWUPXDTwHYuXwpw81AaxrTVzUHT9H5J9NBK0h8hYE5kvWxfTebuJm8AkgKhksdbXxr1Rt2VlyzlURpiHJ6dN/jKuqwOT3GdTH124II1IW0l5h1cpfvpGNGN8Tc6Gbh4KYf5A8ZwY3qawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Hj/5iH+6n9Ev0RU0HFKuPBrKG5gQYUorrJXwqU9Qo0=;
 b=sLss8DZ78umNq4xRm7krUPtaYyrFAgALpoyH7nWIgf1kqflTvbzQ/G7M+kdsn+dlNIrOBhygulplYNvqLwMDKqtV5o5YQFi7UEOv4bKTl+PMx/1g3OaH/WYZvUdN1KALj+39P+eUuwqnFdqzuP0OPdBAEABhr/Z6bwPIbFED8r6/xk3Y77Qf7rmevZXNqRvd16hj3fBmZqE2/9Hz4WG4ZjHmDsGeM7fGkfJbegJxE4cktPNBA/IiVb+Xyw2qgf/aeyn6g1F78ehgRp2K8NpheDDGM90a/mmL1N+rytniJi8oUQYctqtZZ9o1KAeo4rdGg7XNN4RvhVGzYWVFso/iog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Hj/5iH+6n9Ev0RU0HFKuPBrKG5gQYUorrJXwqU9Qo0=;
 b=VJdRsnoDFzReYGXQjHWFjwbHanKA9DJie9g+pRV8sAMUoSK1GhH1IdBevhDKcjJbSxXPXyEmrCFJSwD5wFyhGr6EOqzvFTBzKKHwXr53IO3Q/3qZsM2ZO98MtXQf77vAWaJLwrS+RQ8k+dT7l2jkSmhzHbWEAI457u4wRpehluc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by SN7PR12MB7372.namprd12.prod.outlook.com (2603:10b6:806:29b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Tue, 3 Sep
 2024 09:05:49 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.020; Tue, 3 Sep 2024
 09:05:49 +0000
Message-ID: <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
Date: Tue, 3 Sep 2024 17:05:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: Parav Pandit <parav@nvidia.com>, "mst@redhat.com" <mst@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
 <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::17) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|SN7PR12MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0fbedb-e63f-4032-e643-08dccbf79ab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTdnbjlzTWdBTk9BY3ZyT09wUkQvNGIwcG9vc1Q3b0Fwa3ExcVlxQlRYdWFx?=
 =?utf-8?B?VE5SZ2RrU3BSN2dMUkVtRW15REsybWRXRHh1MzZ5bERkYUMzRy9ZcmJuakxF?=
 =?utf-8?B?Wml2eEVqa2RLUXg0Q0NCeUFZWjFEN2RyRmFrYkNyWHhKdyttbnJFWTI3RkVV?=
 =?utf-8?B?c0RZbkxBT3dJWG1zbXdXUit0NGMyQURXcnpLd2tRMzJ6bkNkczh5SXJzRCto?=
 =?utf-8?B?dDBzMUxETTIvSGt5R0x0UTlxR1orZ2JTRFJrSE9kQzFVZTQ2OVd5TjlwL2NU?=
 =?utf-8?B?ano3eTFNRjhGcWxTdmRsam1kRWRlZVdMbDVWWnF0SVF4enpCV0FLNUZrYlAz?=
 =?utf-8?B?TndLTFptMmYrMlUzVnlQY1ZDTTRMNFpGUEhnYW1wUGZQeFRoeTBZRUtjNTZM?=
 =?utf-8?B?N1JsZVhSVitHamZkMUFsYnBncWNEKzRRL2VtM2FEb2NyMGFmd0NZYm1mQ2Ns?=
 =?utf-8?B?ekVVNVJ6TTZsVUJwZjk3cmt1eE5ZaXZ2MWVad0tnOXRMOU5va1FvU3dLbCs1?=
 =?utf-8?B?KzVhSEt2K0R1K012MGhjb3JTZmY5SkEwL1FiYmlYK0t2dWtFazZ5OVp6QUVa?=
 =?utf-8?B?RElvVVFUMm56L1E4elpuekQ5ckpMM2N5TlhGcTVxb2xPVzM4dnczWjlJNmIw?=
 =?utf-8?B?U3VWZlMzQVlvWWM4OTVMOFdQN3lxNFg1Mjh2WGF3M28rUlFYUk5wbm1IKzdR?=
 =?utf-8?B?T0Jzc2xGbWNSM1FFOFpuSUlYZnNFWnhVdjJicVdGLzBieldkM1NBbjVQS3VX?=
 =?utf-8?B?MEtzWDVySzVDOXVncnZJNUdVMXZYamtEam1HcGVieW5DbUhKTFJsNEpKMnF3?=
 =?utf-8?B?UjBHNGlKOEJEejR3aWZOa1o4VFhKTVJwT1phSDFkTWx3cE5NQVQ3Ty9GV1lE?=
 =?utf-8?B?MjlxMUROUzRsNXlFQTZMcEtrN1ZPLzNHRXpYQlRaVFNQWlpXMFdXRHJ2UG40?=
 =?utf-8?B?MEtISWZ0V2FMREd0RUhTQ1hqWXRwWUkxYWdBWGJsTWZ1OTBCc3hvZFNwUkVk?=
 =?utf-8?B?bTJYbUd5MzB2alMwdkFGUnBqN05rU3ArY01SeEIvZUI1emprS1JnWVZiNzV6?=
 =?utf-8?B?STRIMmRMMXVpT0lqVSs2cTZ0TFpFaWxPb1hnQlcrWm5PYlhVV3FTaXVVVTJN?=
 =?utf-8?B?UnNBUkVNVDJKdkZzSkhVcDVhVTVKOWcyd1JwbEVIWmhocmtnUzJuSCthbFJ6?=
 =?utf-8?B?YUVNYll6K2tEWWNsd1pzRHJyZjZtbFVpQVczelhpZ2FHVmdGUkZKWWwrQXJq?=
 =?utf-8?B?UW5KbU1JNTFJb1hoc3NtZGQ1QkhobVVhVDNPUEZvNjFFdVBoUnFwcjh5cFVa?=
 =?utf-8?B?N2lYOUgrbHUvYXZFM0FmOTFWczVyajFwa0w4RGxuclVXZzBIQU8vY2tYQTh5?=
 =?utf-8?B?K3psRXYrb1R2N1RDMklVQTI1TURNanFBSVRJNzNlb3BWd0R4ZmtXR3dJVi9C?=
 =?utf-8?B?d2hWODlhcWUxRElkMXRsV1hreUtvazRVZmdFS1Y5V05IUWtnNFI0ZlUwVXpj?=
 =?utf-8?B?dEZaVWszVkxLK0hYT2RiaGdXbnpueldxVTNBNnhpUFVwVVNYZzJTMU5ZZHY3?=
 =?utf-8?B?eUZ0MFdwUkZnZSsxenF0NCtHc0lUbTd6eUNOdzZybTRXUVJyK3JhcDkwMjNw?=
 =?utf-8?B?Q29BOFAxTGgyTzhVVGpBQ0pNcFF3SmhOdSt4UUJ3eDlNNi9zWDMydVRlVFUw?=
 =?utf-8?B?OHFwamRaNzhBTXpaYU9uMDRPR0tzZm53TXZEMTcxR1RnK3c5VFZZOHpUcTMr?=
 =?utf-8?B?U3lNNUlSRi9iRkgvTGd4Wmk4VzV0b011VWxCbm5FalRveE9rSW1CL3dEM01N?=
 =?utf-8?Q?tjGHP7Xp+qKDxpJEzcjp/GGzPoi0chLfNrshw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFd5a0NlNnVKQUZ4S3RhVHh3UnkrZkF6SFBLM1ZwKzJmbS83Qlkvem1Zeld1?=
 =?utf-8?B?T2psTDhSSGQyZ1hNM3JYTkRlUS9yNGk1dm1tV240M0U0eW5Hdm9NVkdiUE9m?=
 =?utf-8?B?amNmQTdZcXFUWmN2eVkyTlZuWlRXdS9MbGhlUDF4RURITkZTT1NUM09ldnJp?=
 =?utf-8?B?WlNqYnJQb3dYN0F6UlBvNmV4QUNNajBSVHQ5bTJRSTI3SG8rZTBLZXhDMFFP?=
 =?utf-8?B?THhzREx0aUU0bUhSc1UyZXoydkt5Nzg3blk5TnFVZkhLbVNkck1XbHZJc0ZT?=
 =?utf-8?B?c1AvS3k2dU80MnRUbk5tNWxHL2QwTitFVTlFZ01LVUFqY21FRlZramU4bjFN?=
 =?utf-8?B?aW1ndHFua2hlbVBPVXVHN2FBdy9lTXp4WlJwYVMyWTcyQzJRNHZkbUdSVnB2?=
 =?utf-8?B?dS9SRXhwUnFicVhmSjRJZHdackRPSFpoOHpCMlhjVlBZZHNSUWhjOENMQlcz?=
 =?utf-8?B?c1VRNFRqUVdnMzF0ajVXU1dyNTFyZnZPTEEyNDhBRVNtbzhGVkFwWkdjSHE3?=
 =?utf-8?B?QklnSUxZazJFanRCVFlWRXlKNW1ReVV3dE9QR1Z3UGJMbzYzNmloTk9zVUR2?=
 =?utf-8?B?L1d4R29iZS95aHZOOVJnN0NmbTVnYUNlbFRYbEwrSWRIUkxCOHU5dVlEcGZ6?=
 =?utf-8?B?SUpmTFVuby9XY1ZIWkdjWk5TdHBvdERZd1pvamM3azNZY3RHRlJBNm5uWmlz?=
 =?utf-8?B?RUR2OHd6THF0a1NqT01ySExIVUNkaGJtUktKNnpvbzZ2NW1xV05DWnYrNVY1?=
 =?utf-8?B?eEFXY09FRmdPUnBBWkNhQ0l0dDRNaHE3R3ZhSjI4UGppYTBSeEplMmNqZjRJ?=
 =?utf-8?B?djdBUTNYV09sT0JEWkRzdDdpTWNRdlJ1Nk9MdVRkR2J6TVhSc0hoWWNaaEow?=
 =?utf-8?B?ZUN1Yk9OWHE1WjZVSFBiU05Famp0U1FNTllHUTN2ZTI3TERQejF4ZG9LR2M4?=
 =?utf-8?B?aTJreUJRUG9JUDlkNUJ1Sk42ZGE3cWY4ZHJSR2ZRN2JhajIydjFNbXl6bjJY?=
 =?utf-8?B?U1NDV2htMklZbGxIY0J6cUVXeUFPd1I1WmZRRGxMeGtvaEdlSjhSR1hScVlh?=
 =?utf-8?B?SVpiMUM1am9JZm5HZllxdjVHUnE2T3Q2WVY5cENSVEpjcXppdGY2UjgwRE5z?=
 =?utf-8?B?Umh1aHY4MXhKdjAwMVdmWDlFeGw1dXlFdHM2RjNoRDBVL01tcjlLakx3NVdE?=
 =?utf-8?B?ZkE1aWNLekt6OVFRdHpRMlQ3d1hLMW1Pdys0bjRJY3RwZUh0Y1NTLzJ0QVNw?=
 =?utf-8?B?OUl1RXhCR1V5LytmaGdkaHdtOE16eW5ST3F4Y0I1a0w2MFgrNklTTVJYZENL?=
 =?utf-8?B?WGY5K0hQUG5DbkV6eVZ0QmRwTGdaeE1ZRGZKU3N4ZjRtUlVzQjJWZ2pEK3A5?=
 =?utf-8?B?ODNlNVhxOXp1U3NVYThlQzNUcm1qSTJ2OHJ5UkZMZ3dRbkNNdUE4SWpZdEEx?=
 =?utf-8?B?ekFYTDhxeFRVSW5KbTZmVEp3TzVUSkhpWUx4Vm9YUm5rMTlOdDNxNzRYM3Zw?=
 =?utf-8?B?UGVMRVZ5dEN6Vkxsd1JhYnphSzk0ZkhlWWhqY0QxR3krdXNLbkxUeWZraEFx?=
 =?utf-8?B?RmEyUE5DQ3pjdHpaRlVoVHZycWlxS3BpU281NWg3QjNyOWx6bnhxZExxSGN4?=
 =?utf-8?B?RVZDUXIyN1JCT1o2L1pZNVNTbE9yRE1zc2N5bmloYmtLWjIrdDdTUVk1cmlS?=
 =?utf-8?B?eHpZMjJSUXVrQndNSEZiaS90T2dOTXFGdkkwVUtHTUR2ZXV0dit2RmhzSjVz?=
 =?utf-8?B?MStBSnkzQXFpM1JmNytLUlVudHdYdUJxZEJnQ0QvWjlRb2FKalhseG43d1FQ?=
 =?utf-8?B?dGV6VDNWQnE4dEIyWWJkeE5zeEVFL3VvZjBQOVlySHdyNXVsMXpXN2lBVVR1?=
 =?utf-8?B?M1RFTXBXQUFaaVlSY2JDbS9oM2x4bit4LzlWMFFxRXFGRWhCZEpVdDM1ZHNX?=
 =?utf-8?B?UlVBakk1VUptU2NMSHpvMmxEWmkwdUFKc3VERnJQdFdjelVBeVlpL2ZoeEg4?=
 =?utf-8?B?RnNMOXNNbEhHN09LMlBPa1pDZDR2clNhdjV0Yk1mTzRMbkxnelJZMEdma3lC?=
 =?utf-8?B?L3cxMTI4SnZ5ZUowRTZWWE9PSitPbTE5K3B3dVNOdkF3aUZjRFhMK1N4R0hE?=
 =?utf-8?Q?qoyIPCPlqlPy1/JJmSh0JS0Gc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0fbedb-e63f-4032-e643-08dccbf79ab2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 09:05:49.5017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lkb8HIBd+H/s6fQEral2+nu5ywXVl42VF7WRqc1od5Kg0cxXfFGNkM/Tk2QxFWa0ouSzxS8jyYJaiyzNSwFjuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7372



On 8/30/2024 11:02 AM, Parav Pandit wrote:
>
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Friday, August 30, 2024 8:02 AM
>>
>> On 8/15/2024 5:34 PM, Parav Pandit wrote:
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Thursday, August 15, 2024 1:53 PM
>>>>
>>>> On 8/13/2024 2:55 PM, Parav Pandit wrote:
>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>> Sent: Tuesday, August 13, 2024 11:44 AM
>>>>>>
>>>>> I removed the unreachable intel email id as every single email is
>>>>> bouncing
>>>> from it.
>>>>> Please consider dropping that email from v8 as it will cause all
>>>>> reviewers
>>>> email to bounce.
>>>>>> On 8/13/2024 1:50 PM, Parav Pandit wrote:
>>>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>> Sent: Tuesday, August 13, 2024 11:15 AM
>>>>>>>>
>>>>>>>> On 8/13/2024 12:42 PM, Parav Pandit wrote:
>>>>>>>>> Hi Lingshan, David,
>>>>>>>>>
>>>>>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>>>> Sent: Thursday, August 1, 2024 5:05 PM
>>>>>>>>>>
>>>>>>>>>> This commit allows the driver to suspend the device by
>>>>>>>>>> introducing a new status bit SUSPEND in device_status.
>>>>>>>>>>
>>>>>>>>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
>>>>>>>>>> which indicating whether the device support SUSPEND.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>>>>>>>>> ---
>>>>>>>>>>  content.tex | 75
>>>>>> ++++++++++++++++++++++++++++++++++++++++++++++-
>>>>>>>> ----
>>>>>>>>>> --
>>>>>>>>>>  1 file changed, 65 insertions(+), 10 deletions(-)
>>>>>>>>>>
>>>>>>>>>> Changes from V6:
>>>>>>>>>> - the device should hold its config interrupt while SUSPEND,
>>>>>>>>>> and send config interrupt when the SUSPEND bit is cleared.
>>>>>>>>>> - while SUSPEND, the driver MUST NOT access Device
>>>>>>>>>> Configuration Space
>>>>>>>>>> - minor changes.
>>>>>>>>>>
>>>>>>>>>> Changes from V5:
>>>>>>>>>> - the device should present NEEDS_RESET if failed to suspend
>>>>>>>>>> - allow the driver access device status in the config space when
>>>>>>>>>>   suspended if it is implemented in config space.
>>>>>>>>>> - language improvements
>>>>>>>>>>
>>>>>>>>>> Changes from V4:
>>>>>>>>>> - re-order the device status bits section
>>>>>>>>>> - kick vqs --> notify vqs
>>>>>>>>>>
>>>>>>>>>> Changes from V3:
>>>>>>>>>> - allow the driver clearing the SUSPEND bit to resume the device.
>>>>>>>>>> - disallow access to config space while suspended.
>>>>>>>>>>
>>>>>>>>>> diff --git a/content.tex b/content.tex index 0a62dce..2d1bee8
>>>>>>>>>> 100644
>>>>>>>>>> --- a/content.tex
>>>>>>>>>> +++ b/content.tex
>>>>>>>>>> @@ -36,19 +36,22 @@ \section{\field{Device Status}
>>>>>>>>>> Field}\label{sec:Basic Facilities of a Virtio Dev
>>>>>>>>>>      this bit.  For example, under Linux, drivers can be loadable
>> modules.
>>>>>>>>>>    \end{note}
>>>>>>>>>>
>>>>>>>>>> -\item[FAILED (128)] Indicates that something went wrong in the
>>>>>>>>>> guest,
>>>>>>>>>> -  and it has given up on the device. This could be an internal
>>>>>>>>>> -  error, or the driver didn't like the device for some reason,
>>>>>>>>>> or
>>>>>>>>>> -  even a fatal error during device operation.
>>>>>>>>>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and
>>>>>>>>>> +ready to
>>>>>>>>>> +  drive the device.
>>>>>>>>>>
>>>>>>>>>>  \item[FEATURES_OK (8)] Indicates that the driver has
>>>>>>>>>> acknowledged all
>>>>>>>> the
>>>>>>>>>>    features it understands, and feature negotiation is complete.
>>>>>>>>>>
>>>>>>>>>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and
>>>>>>>>>> ready to
>>>>>>>>>> -  drive the device.
>>>>>>>>>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated,
>>>>>> indicates
>>>>>>>>>> +that the
>>>>>>>>>> +  device has been suspended by the driver.
>>>>>>>>>>
>>>>>>>>>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has
>>>>>>>> experienced
>>>>>>>>>>    an error from which it can't recover.
>>>>>>>>>> +
>>>>>>>>>> +\item[FAILED (128)] Indicates that something went wrong in the
>>>>>>>>>> +guest,
>>>>>>>>>> +  and it has given up on the device. This could be an internal
>>>>>>>>>> +  error, or the driver didn't like the device for some reason,
>>>>>>>>>> +or
>>>>>>>>>> +  even a fatal error during device operation.
>>>>>>>>>>  \end{description}
>>>>>>>>>>
>>>>>>>>>>  The \field{device status} field starts out as 0, and is
>>>>>>>>>> reinitialized to 0 by @@ -
>>>>>>>>>> 60,8 +63,9 @@ \section{\field{Device Status}
>>>>>>>>>> Field}\label{sec:Basic Facilities of a Virtio Dev
>>>>>>>>>> initialization sequence specified in \ref{sec:General
>>>>>>>>>> Initialization And Device Operation / Device
>>>>>>>> Initialization}.
>>>>>>>>>> -The driver MUST NOT clear a
>>>>>>>>>> -\field{device status} bit.  If the driver sets the FAILED bit,
>>>>>>>>>> +The driver MUST NOT clear a \field{device status} bit other
>>>>>>>>>> +than SUSPEND except when setting \field{device status} to 0 as
>>>>>>>>>> +a transport-specific way to initiate a reset. If the driver
>>>>>>>>>> +sets the FAILED bit,
>>>>>>>>>>  the driver MUST later reset the device before attempting to
>>>>>>>>>> re-
>>>>>> initialize.
>>>>>>>>>>  The driver SHOULD NOT rely on completion of operations of a
>> @@
>>>>>>>>>> -99,10
>>>>>>>>>> +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of
>>>>>>>>>> +a Virtio Device
>>>>>>>>>> / Feature B  \begin{description}
>>>>>>>>>>  \item[0 to 23, and 50 to 127] Feature bits for the specific
>>>>>>>>>> device type
>>>>>>>>>>
>>>>>>>>>> -\item[24 to 41] Feature bits reserved for extensions to the
>>>>>>>>>> queue and
>>>>>>>>>> +\item[24 to 42] Feature bits reserved for extensions to the
>>>>>>>>>> +queue and
>>>>>>>>>>    feature negotiation mechanisms
>>>>>>>>>>
>>>>>>>>>> -\item[42 to 49, and 128 and above] Feature bits reserved for
>>>>>>>>>> future extensions.
>>>>>>>>>> +\item[43 to 49, and 128 and above] Feature bits reserved for
>>>>>>>>>> +future
>>>>>>>>>> extensions.
>>>>>>>>>>  \end{description}
>>>>>>>>>>
>>>>>>>>>>  \begin{note}
>>>>>>>>>> @@ -629,6 +633,53 @@ \section{Device
>> Cleanup}\label{sec:General
>>>>>>>>>> Initialization And Device Operation /
>>>>>>>>>>
>>>>>>>>>>  Thus a driver MUST ensure a virtqueue isn't live (by device
>>>>>>>>>> reset) before removing exposed buffers.
>>>>>>>>>>
>>>>>>>>>> +\section{Device Suspend}\label{sec:General Initialization And
>>>>>>>>>> +Device Operation / Device Suspend}
>>>>>>>>>> +
>>>>>>>>>> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
>>>>>>>>>> +SUSPEND bit in \field{device status} to suspend a device, and
>>>>>>>>>> +can clear the SUSPEND bit to resume a suspended device.
>>>>>>>>>> +
>>>>>>>>>> +\drivernormative{\subsection}{Device Suspend}{General
>>>>>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>>>>>> +
>>>>>>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or
>>>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>>>>>> +
>>>>>>>>>> +Once the driver sets SUSPEND to \field{device status} of the
>> device:
>>>>>>>>>> +\begin{itemize}
>>>>>>>>>> +\item The driver MUST re-read \field{device status} to verify
>>>>>>>>>> +whether the
>>>>>>>>>> SUSPEND bit is set.
>>>>>>>>>> +\item The driver MUST NOT make any more buffers available to
>>>>>>>>>> +the
>>>>>>>> device.
>>>>>>>>>> +\item The driver MUST NOT access any virtqueues or send
>>>>>>>>>> +notifications for
>>>>>>>>>> any virtqueues.
>>>>>>>>>> +\item The driver MUST NOT access Device Configuration Space.
>>>>>>>>>> +\end{itemize}
>>>>>>>>>> +
>>>>>>>> Hi Parva
>>>>>>>>> Do we agree that
>>>>>>>>> a. suspending a device is non frequent operation (in order of N
>>>>>>>> operations/sec, where N is roughly in range of 10 or 100) per device?
>>>>>>>> Ideally it should not be often in normal operations, but remember
>>>>>>>> we can not restrict the behaviors of the driver, so we must be
>>>>>>>> able to handle the scenario in which SUSPENDING is often.
>>>>>>> Sure. the intent is slow rate, but one can do at unexpected times.
>>>>>>> Do you agree?
>>>>>> I think we don't have an intention of the frequency in the spec.
>>>>> Sure.
>>>>>
>>>>>> The spec only provides generic mechanisms and interfaces.
>>>>> Sure.
>>>>>
>>>>>> Don't assume it(or driver wants it to be) would be often or not,
>>>>>> that depends on the driver.
>>>>> As you rightly said : it cannot be assumed.
>>>>> The driver will read the device status right after it wrote it. This
>>>>> typically is <
>>>> 50nsec of time.
>>>>> The suspend operation for a net device to store hundreds of queues,
>>>>> RSS
>>>> table, flow filters, takes plenty of time (at least more than 50nsec :) ).
>>>>> Similarly for the GPU to store some MBs of memory takes more than
>>>>> 50nsec
>>>> of time, for example to store in a file for a software-based GPU device.
>>>>> So a device cannot respond back suspend=true in next 50nsec time.
>>>> It's OK for the device to take longer time to respond, the driver
>>>> simply re-reads device status.
>>> Sure, the issue is, when the driver re-reads, the device must present
>> suspend=false within 50nsec.
>>> (because device didn't suspend it yet).
>>>
>>> As I explained in previous email, this requires building special circuitry.
>>> Such circuitry can be avoided if the suspend interface is done slightly
>> differently.
>> why there is a constraint condition of the time? 
> Because this is what driver does as you explained in [1] indicating "we must be able to handle ..."
>
> [1] https://lore.kernel.org/virtio-comment/c4d5eed3-774b-4d35-a007-f9dff28ce884@amd.com/T/#m6f081f96ef9dcea29c64a88b633eb21d50e8c410
The sentence is "we must be able to handle the scenario in which SUSPENDING is often", where do you see any constraint conditions of time?
>
>> Are there any similar
>> constraining for other states like RESET or DRIVER_OK? Don't assume any
>> other states transitions are faster than SUSPEND.
> DRIVER_OK does not suffer from it because it is async notification.
> A device may start slow after DRIVER_OK.
> SUSPEND operation cannot rely on such async behavior.
The driver can set suspend and re-read & wait. This is a common routine in the driver.
>
> RESET also suffers from similar inefficiencies.
> But that is because it is inherited from the past.
>
> Here a new functionality is being proposed and it has a chance for efficient device implementation.
> Therefore the request is to improve it.
sure, as long as we confirm this new register apply for all device status transitions, not only for SUSPEND.
>
>>>>> More below.
>>>>>
>>>>>>>>> b. A software-based device may not always want to force VM_EXIT
>>>>>>>>> on read
>>>>>>>> and write on the device_status register?
>>>>>>>> Trap and Emulation is the basic of virtualization, and how to
>>>>>>>> pass-through a device is out of this spec.
>>>>>>>>
>>>>>>> Sure, I didn't suggest to put such things in the spec.
>>>>>>> My question is, whether to trap and emulate or not is a choice of
>>>>>>> the
>>>>>> software.
>>>>>>> Do you agree?
>>>>>> The device emulator does not know anything about whether trapped
>> or
>>>> not.
>>>>>> Trapping and Emulation is a hypervisor thing.
>>>>>>
>>>>>> If here "software" refers to the device emulator, then Yes, it is
>>>>>> not the emulator's decision. And the device should not be aware of
>>>>>> VM_EXIT & VM_ENTRY.
>>>>>>
>>>>> Right. So a software wants to implement device_status as pure MMIO
>>>> writes. (and not VM_EXIT).
>>>> This is not always true, there can be VM_EXIT of pure emulated
>>>> devices.
>>> I am not denying that VM_EXIT can/cannot be there.
>>> I am saying, the proposal forces VM_EXIT based approach in my
>> understanding of this patch.
> [MARKER_1]
>
>>> If that is not true, may be can you please explain how this can be
>> implemented without VM_EXIT?
>>> We should have an interface that can be done with and without VM_EXIT
>> method at least for any new additions.
>> VM_EXIT is out of spec, it is a hypervisor and the processor thing.
> You keep repeating VM_EXIST is out of spec.
> I already replied at [MARKER_1], sure it is out of spec, the current approach forces one to do VM_EXIT based approach.
> And if not, please explain, how can it be achieved?
It is not the current solution force the hypervisor & guest to perform VM_EXIT.
In basic virtualization, any access to hypervisor emulated HW registers would be Traped and Emulated,
means a VM_EXIT and a VM_ENTRY. 
>
>> In non-pass-through case, any register access are sensitive and will trigger
>> VM_EXIT. Like RESET or DRIVER_OK needs to access device_status, nothing
>> different.
> I don't think you understood the point.
> Let me repeat, The question is, if the device implementation wants to achieve the functionality without VM_EXIT, what is the way?
Map the register to guest address space, out of the spec.
>
>>>> The
>>>> HW registers are sensitive resource and any access to them need to be
>>>> trapped and emulated.
>>> This does not apply to PCI PFs and VFs which are HW devices (mainly PFs).
>>> so this trap + emulation is narrow view that we better avoid.
>> This is how *basic* virtualization work, once access sensitive resource, trap it.
>>> If you think this is the way forward, you should put forward in patch as
>> MUST requirement.
>>> and that does not look right to me.
>>> I hope you also don't mean to force this method to device
>> implementations.
>>> Right?
>> Again, VM_EXIT is a hypervisor thing,  out of spec. Whether there is a
>> VM_EXIT when setting SUSPEND totally depends on the virtualization
>> solution. And SUSPEND is nothing different from DRIVER_OK.
>>
> Please avoid repeating the point that VM_EXIT is hypervosor thing.
> No one asked to put this in spec. Please re-read [MARKER1]. You probably missed that.
>
> SUSPEND is different than DRIVER_OK. I explained the timing constraints and the required circuitry needed to fulfill the proposal.
> And with the additional register, such complicated circuitry can be easily avoided.
Please read QEMU code, that can help you find how the trap - emulate mechanism work for guest when it tries to access sensitive resources.
>
>> Means, if your virtualization needs to trap SUSPEND, it also needs to trap
>> DRIVER_OK, and don't assume DRIVER_OK is faster than SUSPEND.
> DRIVER_OK is by law of physics is faster than SUSPEND because it does not demand the driver of reading back.
> There is no driver side loop to check if the device accepted DRIVER_OK or not.
> Agree?
Why do you assume so? In some vendor implementation, DRIVER_OK can be slow. Can DRIVER_OK implement a deferred initialization even deferred resource allocation? 
Does the spec say that DRIVER_OK must be faster?
>
>>>>> And prefer to returning SUSPEND=true at slow pace.
>>>>> This means, the device implementation cannot immediately return
>>>> suspend=true right after it was written.
>>>>> A MMIO read will read it back, as suspend=true.
>>>>>
>>>>> An alternative would be, to forward CPU loads and CPU stores to
>>>>> different
>>>> address.
>>>>> However, this does not work for the hw based devices.
>>>>>
>>>>> That means, PCI HW needs to return suspend=0, until the device is
>>>>> not
>>>> suspended.
>>>>> In this example, the device cannot build special circuitry to answer
>>>> suspend=true within 50nsec, or in other words building special
>>>> circuitry to return suspend=false is too complex for the slow operation.
>>>> why? The device can just not to change the value of the SUSPEND bit
>>>> before it has fully suspended.
>>> When driver wrote, it wrote suspend=true, And device returns
>>> suspend=false while suspend is ongoing, right?
>>> If yes, this is expensive because the device needs to operate within 50nsec
>> or less to answer suspend=false.
>>> And even worst, it needs to suspend=true when unsuspending within
>> 50nsec when resuming is ongoing.
>> again, there is not a 50nsec constraining and please take a reference of how
>> DRIVER_OK work with virtualization.
> There is. The device is expected to return back the desired value to indicate driver that suspend is ongoing.
> It is different than DRIVER_OK.
where does the spec or any code say 50nsec?
>
>>>>> If this understanding of burden is clear,
>>>>>
>>>>> The proposal is, can you please extend the interface such that,
>>>>>
>>>>> 1. driver writes suspend command.
>>>>> 2. driver reads suspend_status, and receives not_completed=(false).
>>>>> This is
>>>> the default value.
>>>>> 3. When the device completes suspend, it changes the polarity of
>>>> suspend_status=true.
>>>>> This has two main benefits:
>>>>> [A] This will enable software-based devices to write data to slow
>>>>> files and
>>>> does not have to force VM_EXITs.
>>>>> [B] It also enables hw based devices to not build special circuitry
>>>>> to answer
>>>> within 50nsec, which can get very complicated for tens or hundreds of
>>>> PCI PFs.
>>>> I think we have already discussed on this before in V5, and Jason has
>>>> some insightful comments
>>>>
>>> Unfortunately, not. His comment was that it is not specific to suspend.
>>> But here we are introducing a new interface and functionality that does not
>> need to suffer or follow anything that may not be efficient.
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flor
>>>> e.kernel.org%2Fvirtio-comment%2F20240612082055-mutt-send-email-
>> mst%40
>> kernel.org%2FT%2F%23mc817fc6ca12ff0bcbae62b43b6146a177ecf13a9&dat
>> a=05
>> %7C02%7Cparav%40nvidia.com%7C619c82b60b824ca03f8808dcc89beb4a%7
>> C43083
>> d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638605819247985989%7CUn
>> known%7C
>> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
>> CJXV
>> CI6Mn0%3D%7C0%7C%7C%7C&sdata=VqmJmqt3k5tf3x4ihjE5Bd7u59GadOn
>> OaOfJ5lvG
>>>> 1DE%3D&reserved=0
>>>>>> this is out of the spec anyway.
>>>>>>
>>>>>> Thanks
>>>>>> Zhu Lingshan
>>>>>>>> Thanks
>>>>>>>> Zhu Lingshan
>>>>>>>>>> +\devicenormative{\subsection}{Device Suspend}{General
>>>>>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>>>>>> +
>>>>>>>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
>>>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>>>>>> +
>>>>>>>>>> +The device MUST ignore all access to its Configuration Space
>>>>>>>>>> +while suspended, except for \field{device status} if it is
>>>>>>>>>> +part of the Configuration
>>>>>>>>>> Space.
>>>>>>>>>> +
>>>>>>>>>> +A device MUST NOT send any notifications for any virtqeuues,
>>>>>>>>>> +access any virtqueues, or modify any fields in its
>>>>>>>>>> +Configuration Space while suspended.
>>>>>>>>>> +
>>>>>>>>>> +If changes occur in the Configuration Space while the SUSPEND
>>>>>>>>>> +bit is set, the device MUST NOT send any configuration change
>>>>>> notifications.
>>>>>>>>>> +Instead, the device MUST send the notification after the
>>>>>>>>>> +SUSPEND bit has
>>>>>>>>>> been cleared.
>>>>>>>>>> +
>>>>>>>>>> +When the driver sets SUSPEND, the device MUST either suspend
>>>>>>>>>> +itself or set
>>>>>>>>>> DEVICE_NEEDS_RESET if failed to suspend.
>>>>>>>>>> +
>>>>>>>>>> +If SUSPEND is set in \field{device status}, when the driver
>>>>>>>>>> +clears SUSPEND, the device MUST either resume normal
>> operation
>>>>>>>>>> +or set
>>>>>>>>>> DEVICE_NEEDS_RESET.
>>>>>>>>>> +
>>>>>>>>>> +When the driver sets SUSPEND,
>>>>>>>>>> +the device SHOULD perform the following actions before
>>>>>>>>>> +presenting that
>>>>>>>>>> the SUSPEND bit is set to 1 in the \field{device status}:
>>>>>>>>>> +
>>>>>>>>>> +\begin{itemize}
>>>>>>>>>> +\item Stop processing more buffers of any virtqueues \item
>>>>>>>>>> +Wait until all buffers that are being processed have been used.
>>>>>>>>>> +\item Send used buffer notifications to the driver.
>>>>>>>>>> +\end{itemize}
>>>>>>>>>> +
>>>>>>>>>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport
>>>>>>>>>> Options}
>>>>>>>>>>
>>>>>>>>>>  Virtio can use various different buses, thus the standard is
>>>>>>>>>> split @@ -872,6
>>>>>>>>>> +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
>>>>>>>>>> +Feature
>>>>>>>>>> Bits}
>>>>>>>>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device /
>>>>>>>>>> Feature Bits} for
>>>>>>>>>>  	handling features reserved for future use.
>>>>>>>>>>
>>>>>>>>>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the
>>>>>>>>>> + driver
>>>>>> can
>>>>>>>>>> +   trigger suspending the device via the SUSPEND flag
>>>>>>>>>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status
>> Field}.
>>>>>>>>>> +
>>>>>>>>>>  \end{description}
>>>>>>>>>>
>>>>>>>>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved
>>>>>>>>>> Feature Bits}
>>>>>>>>>> --
>>>>>>>>>> 2.45.2
>>>>>>>>>>

