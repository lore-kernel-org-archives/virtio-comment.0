Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2051.outbound.protection.outlook.com [40.107.101.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB2B13D2A9
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725521407; cv=fail; b=kS6BB2aqmb0YfxgQYu0x5C6FldbFLix+LkrB0nj5dokORAwbyKI+2Wa8N36+3v88wJZs9A49xUEkT8GtyKTAQkVQN/XzwnkY0CLjEodfyUxaUKxw+vmcSgC6NwRNHC7PLVE4AnNhpbxqef+KWcvno2MAFUtk/NJWLHZxo1eS+dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725521407; c=relaxed/simple;
	bh=VgXkv54/i+8WWqm/MQ4LtRagW5H3C+j7tKCUujNtWrg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OBA1GdBDe3VFuBQwjLoTEKmeZEdAVcHRcQjWPJj6jVtWC3o2jIN/2pgnJXg3CmNMsL9UaqL6HzWR9DkAtNsNLhXZENEq/xZqc7d6cQkjjD4hDlDoBk8wH9KQ05ES+AIJCiz6U28DPHBHP9MwQQ/b4819+lFJQ8Wb2lkdsQferK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qy2unq8G; arc=fail smtp.client-ip=40.107.101.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qy2unq8G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MocY+vM9NOEPLMEMIDUTQIIVzY/oylYp3a/yRr7RKauVKoONjCfGRealu/qergaV/XtPMiLjUXBpSSxkzPfL5ZTWGT3RK9TRwM3aombffjDUSYmJQ/xwU9+jIce24GHb33Ojx6cHzosV3vhaA57TeafiquBPucKzBSNYZkCu74i0Z3n626+HznvC1lIIkejFPewhKdQaH5/cQ6gcSLZ56RiUWcgUdA/SrQaLKXCvojv530pr/X6iZFazqGxNqpWax0xr1TQFU1/WJ7UYEbjaED4dvr57pBl4ObaNvss2Xob5eciTz0ou8ShtUu9ZLYNATM6kKp027V/ePWb2ciZ0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIDgwsJAbn7BVA07nmMfjzT3PQQdf/mAs3qdkiKBS08=;
 b=RS3rk9LJ4+mwQiXPTfICEUCCaJaxQbVre8xbnQr3G/AxJBrZ+wSUPRmmIQLFyKw8GMUpje31OFT0u85dYZs2cH4UIyA7Sbm7kJPV6aFldKRdtlFNoNDSw2eiPaLBUxCwXl7r0RgPIdEeZBUeQ2czJu1mKqlvG/fJUlbpC5SmR3iscEicWBUXv6qe7zKbVfJEZYXCwcbD9vK1AOPqDEL64G5bhRzYKKQkS8Xsy8TF6Y8qNfrq9i5rXlzm69rOPsQ3bxSsWG1GtxIAh4W6ocwFlAdvY795UK7OynP/ZR6pKYoMwC4vngXYsxgbUMnVLjUq8pbM+vYLOhgPb/ccRzAFqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIDgwsJAbn7BVA07nmMfjzT3PQQdf/mAs3qdkiKBS08=;
 b=qy2unq8G1qUjSSUdZKC7/T3rNZfKYJo6UdtPxKe5NdTs/T2Qn3Ei7Wyi1zlqDuixbjChdpHl/DRgJZXx05RnEll2XmklhUhdhbkZggi/HcbeX5HNtEShleKZWEh/x8ruYdj86dn0uOppic6FTINGsS5UgCdhskI6xLVttIsz/uI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by IA0PR12MB7505.namprd12.prod.outlook.com (2603:10b6:208:443::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 07:30:03 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 07:30:02 +0000
Message-ID: <d42bd62a-5527-4468-9714-2555a52a361d@amd.com>
Date: Thu, 5 Sep 2024 15:29:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: "cohuck@redhat.com" <cohuck@redhat.com>,
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
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <IA0PR12MB8713995E39DD585341C47520DC9C2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <ef72f0af-3a04-4a79-9f9d-c6dd7fb24d53@amd.com>
 <IA0PR12MB8713065A3CE6752084FCC6AFDC9D2@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <IA0PR12MB8713065A3CE6752084FCC6AFDC9D2@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0150.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::30) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|IA0PR12MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a842df9-4924-4b37-fae6-08dccd7c8dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2xzK1haL0FiNFRPVDgrdWdpTFA4dXd6YVV4V2VqTjFPbDZWYUJwZUZnMGFE?=
 =?utf-8?B?dWhlRGRLMG1CTmJCMXB3TnFJbURCNkIyeXZ4RHRoRXFhTWVuTFczZnBFSzVQ?=
 =?utf-8?B?SkNDeE81OWlsQjVEeGN1V0JnbkVKdUkvRE44dFE1alRoajdTQ05sN05WdCs3?=
 =?utf-8?B?dG41OTR4WTBwZURRMjNTTmZZNzVLcmorNG1LaFJDWWo1Mm1IcDFrcDFBOUlY?=
 =?utf-8?B?ZlgvV3RCVDBmZFp1RmRtdmd4UGJDeVFwRm5raWJsWkd2d3R1S09VK01NeWxn?=
 =?utf-8?B?QjdXMnY5UTNYbnpLb1g0ZDhnSzNGWHdMd1ZQdjIvT0lmd045Q1dHVm92NlBM?=
 =?utf-8?B?Y0hqOU85dUlLbEkyTjY2UkZlT2dxR1grNHF5aStGRks4c2F4THZoNHVIN0RW?=
 =?utf-8?B?cExUOEU5QURpZHRYbm9TRnpuYUxqWERoWUp6bmZRam0zMDZIdk9UckRJeWlh?=
 =?utf-8?B?bnM0OHZvSTFwNE1BZnlNZEs2dDR1UFVjaE9NREMzTVlyb1Z5NzJZOUJuc3dI?=
 =?utf-8?B?OUdLaFFLWGZnNEpweXJjejlYRldGRDBxV3BMUko2VnhtRk80dkl4L1VjZlZt?=
 =?utf-8?B?RFdhUEVjV0dubzJDSWQ5VjRmODhhZmxwQ2xIVFBCSzl4THpMTlN6ajNpZm5H?=
 =?utf-8?B?QUk2dHNaRnptRWFMa2IyR2hidzcwVk5HZDdnZzA5VTJBaWV6VmZFL0p0d0Fv?=
 =?utf-8?B?RG1ydllyamlUakxYdzlmOGNXWjFHZSt1MmpYdzFqVmdwTDM0NldDNTh5U204?=
 =?utf-8?B?Q1JZY0ZVWUNKcGVnanlNZlZFMDBnaEE5Z2k4NStPS1YwWStMQlVBSDZNMlFV?=
 =?utf-8?B?WnJva21oVi9PYjBWR0lYS3M0QmtVSngrbXZHOWVxR1VMN2liZTdpZTd2WW9u?=
 =?utf-8?B?Nkc3ZTZ2SlB2NGVKMFRsY01oQ2NoYkxLZzhjck1CY3JKSEtpNkJ6bkJYQTVt?=
 =?utf-8?B?VkxwbjRkb3VEWnJvVG9SZG9NeXMyWUZUK3hxUWJ2engxczZ1RzhzaitiL2hx?=
 =?utf-8?B?WTBpVXd1ZURub1NJWmFqbS9PeDRTTktuemlJMzFCRDRZSUIzQnh6eGdkazZv?=
 =?utf-8?B?azl1dTJiL2d4RDBZMCtEMDZwcmNFVGY5STJGWldYdG80ejJpRkh2REZPSVFh?=
 =?utf-8?B?RkVBcHM2S0RLV2Fubi9nN2I5clBaOVNHUzBYdmNUUFZvZ0xPeGZ2QlVBT3R4?=
 =?utf-8?B?VTVsV3VxM056bHRsd0JkS1hRSmNLN3V1QjJxNUZIenNnM3NrczhEdnFZSTEr?=
 =?utf-8?B?R1R3U1RXdUwyWFZTZ0p3MitVMVAzZmVndk9PYWRheENKbUF4QXZVcW5adlNB?=
 =?utf-8?B?M1ZPMnBUSkZyMDJKczVzOWpnT29sV2tyVzdNSmRFd2JKMnBmSzBoZ2U4c1kx?=
 =?utf-8?B?RURJUnlpc1BYN1QxUjh5WVdZdTZ5U0ZNUktCcjZScFhDV25KS2VTS0swMFpt?=
 =?utf-8?B?dnFVRlVwTlZIUk1RT1NGREtKUkpkcElSWWNSekovbzM0TmZVZWZHNWhQc2RV?=
 =?utf-8?B?clgvSWd4VUdPUTc2OWYyeWxXRlV5eFJvdUhyRlVmRkk1cFBjeENiRTVZVkti?=
 =?utf-8?B?MVJhQUpac1RSMGtHS0xsRFNQcW9MRFZhRk93WW5CV2d5UitTQ2lBaU5wS1N2?=
 =?utf-8?B?UUFJSnIrWW00T2REKzVOK2hPZXl5TitzcDR0K2JQNXJSdjBXcVFndU04SXZ5?=
 =?utf-8?B?c1JwY2lyRkZ6alpzYUNRbVJISGFwN3VsYjZ4cVNnd3FoVWpZbS9XY043b0RG?=
 =?utf-8?B?N3c4SnNPSUFqVnZ2S2dESU12RE1uMFMyaXc2MjlraDdDaEt4T29IRExqWGh4?=
 =?utf-8?B?M0hhQ29NK2x6a0gwalY1Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjBjVWlEcThSYzJRVXNDMDBUc21aeVY3NlAxbmJKSEZaMlFnWkQzTTBHa2FL?=
 =?utf-8?B?cmlMK3B2Ly9DbDA5SW9GTFBGWmZYaTBJS21jamxZR1Q2UlNPaFJHTDFhbnEz?=
 =?utf-8?B?cWtVZHovcXkzYlkvSnBaSmw5ZkNoUlduNTNnc1pZMml4U2UrdnZHanp1aEgv?=
 =?utf-8?B?TXpLNmMrOHdDNjVVenRIVG1NNmJOSGNDcjZRclhMT2dXb1dDQVZvUEJtcDYr?=
 =?utf-8?B?SlJlQWk0RWJMcVFnRXlFOSs1VmxzNnV2SGNFWVVzdGJXZExSaU02dDdMTzBJ?=
 =?utf-8?B?eDJIY1dNV0cwSHJRMEdvV21scFJiMGRseFZsd3FGMFdydVFkLzJTU2YrTFBU?=
 =?utf-8?B?OE5Cc0VxSFZuS2NicnYya3pGQ1JNOUl3MnZmcHl3ODNsek5RVG1YRWpxRldq?=
 =?utf-8?B?UkZoN25EMVVlWFJXSlN4dGtMallCN0RaZzY4UnZFSDNkTnVwSjdDWVNodVpt?=
 =?utf-8?B?RGhjQS9pcDRKYmp4b0lTM0FLV2JNWEV6ZHRBRzBtdnl2cDAxdXpxWXhCTnYr?=
 =?utf-8?B?bllBS3JjWTRQbEhFSHl2M2JHQkpFbHVvb05PL1VRNzZUcnFORlpCZS85ZDNK?=
 =?utf-8?B?bklNUGRRY0tWK3N2dlFkL09PeDFmM2JERGZjMEZEK0Z2WE1uRWowOVI2cGdV?=
 =?utf-8?B?Qmd5eEtCeTl2bjk1RUw0a0lVWTVHaENJSkF1RGhzanAzMlhFUmIyWWQzR1lR?=
 =?utf-8?B?dG5GQ3BwVnZzMUordlBNZWl5Uk50VTlkbGdkY3NKNjcyTGpsYURBOWxmK0Yr?=
 =?utf-8?B?YjljbHZhNW84dW5uc0tQaElFV3FvSi9hN1YrSmFzRzFpZE9sQUVOenJPU1cr?=
 =?utf-8?B?WEN5U2ZmOXNmNjZwT2xjTW4yKzBSRVEwTDQ5VVNJcWRPNEJWL3A2cWxDNEZ1?=
 =?utf-8?B?d3pMNmU1U1Mwb3dycHBCcEs4TWZ1TmtCV3Z5dVRtUUdVVEZKS3N6THhRQkJi?=
 =?utf-8?B?U3dxR1ZnYkJoL0xyaERJaW9XNTRKVy9HZ1duZnd6SVhFYld3VWlQaEhOODhG?=
 =?utf-8?B?Rk5iZzlqeUgxR1RxSXJJQzFETEtHbGZnV3VWb1NJR3JZdWRnVGFKQmRJK2Jj?=
 =?utf-8?B?U1RYTTZxMW9Nek9ndDhhU1Z4bHJocVB0UmpZcFVzQm9Gc3dqSlp2dVRiWG1P?=
 =?utf-8?B?ZVVGMUdqNUhzaW84dnZHMEFxdlljWkZ6NSt1WlJwcG5ybG5UMVZkNm9IYlpI?=
 =?utf-8?B?QmN6MXhzaEZpam5JRStLV1FISUlsUTM3aDVjblQ4OVp6SjZNelllMmlDRHdO?=
 =?utf-8?B?aTEwVFE2S1VLRXR5QUV6aDNUcHY3TTJGTEtWMENSN25nQzhFTXJYN2dtUDZO?=
 =?utf-8?B?NUNEVWRKcmtpZDM1eVd3RW9Vc0ppT1ovMHF2WjRLRHEzeVMxSTIrM1E5SnJp?=
 =?utf-8?B?M3JNMFE0N3huRXVRWkxxM0t6OWR6TFFlY0llaTk0V0hnK291bk51aXpIL1FN?=
 =?utf-8?B?Ync0eEwwT3NycGdLbVJMR2xsa0hFUUthOVB4ZnlEL3NXK2QzOS82Ny9pNXYy?=
 =?utf-8?B?RmFQWXB5VnhtOUM2TGJRd2oraDk0U3dzUURJazB3QmVDOVJIM2wxQ2NzaWhN?=
 =?utf-8?B?S3pMV1d4K1pJMHhGcUtYYkJZR1dDK1ZXMStlODJRNGhzWUQ2eFRiQXhHWEo3?=
 =?utf-8?B?UFVwWVIraEN6ZWo5VWkvL0FzeXA3Tyt6SEZRTzlqMHk0SmVHeGl5K0JYZ0Vj?=
 =?utf-8?B?V1dWRjdVV29ocnZUTy9WUzYyVytzQURnYU1EWkdlSEpiYmtmU1dwdHFIRkJT?=
 =?utf-8?B?SjFPMWxMQ0hyRjVCdUVuakJxNzBqVVc3dHpFY1UzVE5jb3pPaTlVVXZIT3E2?=
 =?utf-8?B?Qy9Rd0dFTHdwNzJzc2NPMDJ1R3V3TU5kQUZiQXZoOXpLT3BQNUV4RE95QU1y?=
 =?utf-8?B?SVFydHZURDZNMGVLU1lsK0JTcW5Ua3FjbVlKVlU1U0R1N2x5RVVhUTVPeFBs?=
 =?utf-8?B?b2QwVEZrN0NRTlJndDlzZmIvZEw4djR3aDd4ZWl2Q3AyTGVlNHU4WVVsWXZr?=
 =?utf-8?B?U09GbUZYaDBMK3k3SHU3ZFpaNEd6V01BdEN5bndxZ1FheS9uYVN0OURIK2w4?=
 =?utf-8?B?Y3MyUnlMalpzeWx3UjM1ZjhqRU9GbDlRbWVoc0Z6UVBnL3B5dGQwcnhOMm42?=
 =?utf-8?Q?M3S0p0ioj5U6CIMHwch/2uKT+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a842df9-4924-4b37-fae6-08dccd7c8dc9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 07:30:02.0837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shedtAqtbP9bno0ZFQlBJVhvvsNLDEoyIl7Sl0/H/0RXZpifOmZwPGVhqvViCorsCzWfp2Cx+t0x7EMzbcHsDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7505



On 9/5/2024 3:16 PM, Parav Pandit wrote:
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Thursday, September 5, 2024 12:45 PM
>>
>>
>> On 9/4/2024 2:46 PM, Parav Pandit wrote:
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Wednesday, September 4, 2024 12:09 PM
>>>>
>>>> On 9/4/2024 2:31 PM, Jason Wang wrote:
>>>>> On Wed, Sep 4, 2024 at 12:03 PM Michael S. Tsirkin <mst@redhat.com>
>>>> wrote:
>>>>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
>>>>>>> On Tue, Sep 3, 2024 at 6:37 PM Michael S. Tsirkin <mst@redhat.com>
>>>> wrote:
>>>>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
>>>>>>>>>>> But I don't like it that looking at the registers, one does
>>>>>>>>>>> not know the device state. Hidden state is bad for debuggability.
>>>>>>>>>>> We have 4 states:
>>>>>>>>>>> suspending->suspended->resuming->resumed
>>>>>>>>>>> so we need a register with at least 2 bits.
>>>>>>>>>>>
>>>>>>>>>>> we could steal 2 bits from status but it seems a bit much.
>>>>>>>>>>>
>>>>>>>>>> This is why letting the status tell the status and control
>>>>>>>>>> register to
>>>> control thing is elegant.
>>>>>>>>> No argument here.
>>>>>>>> Or, to be more precise, our status is driver status.
>>>>>>> It looks like the device actually otherwise there's no need for
>>>>>>> re-read or poll for things like reset and others.
>>>>>> The need is there for complex device state transitions, which can
>>>>>> not reasonably block a read response.
>>>>>> Another standard approach with PCI is to specify the time
>>>>>> transitions can take. I consider that less elegant - is this what
>>>>>> you are advocating? The advantage is that driver does not load the
>>>>>> pci bus with constant re-polling.
>>>>>> The disadvantage is that it is hard to pick a universal number.  A
>>>>>> combination of these approaches might work, e.g. a recommended
>>>>>> timeout then poll.
>>>>> We've already had msleep() for vp_reset(), anyhow we can increase
>>>>> the sleep time, if it can overload the pci:
>>>>>
>>>>>         while (vp_modern_get_status(mdev))
>>>>>                 msleep(1);
>>>>>
>>>>> We can do the same for suspending.
>>>>>
>>>>> The main blocker for timeout is that it may break migration and
>>>>> complicate the hardening. Another proposal in the past is to have a
>>>>> notification.
>>>>>
>>>>> But what I don't understand here is that suspend/resume should be
>>>>> lighter than reset. If we can afford a reset, so did the
>>>>> suspending/resume. If we want to have something new, that's fine but
>>>>> it should be orthogonal to a specific new status bit?
>>>> I agree, if we want new status indicator, then the new indicator
>>>> should not be specific to SUSPEND.
>>>>
>>> Sounds good to me as long as new functionality does not force the device
>> to react in 50nsec.
>>> In the current state it forces the device so please upgrade the proposal as
>> Michael guided.
>> Trap and emulate is very often in virtualization, of course the sooner the
>> better for emulation.
>> But there are no 50nsec assumption and no one can force the hypervisor to
>> finish any emulations within a certain time
>>> Thanks.
> You are completely ignoring the comments.
> Good luck..
VM_EXIT and a VM_ENTRY work in a pair.
>

