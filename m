Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BFE29CA
	for <virtio-comment@lists.linux.dev>; Fri, 30 Aug 2024 02:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724985182; cv=fail; b=aVtUj/FNWK5BsDpxHNb+gnLd9xc14EU4MbrsJ6vGLwyiK86fDULDJjWcjNHwSzbDNIN6qtqavBI8HC5hj+RIqllqNZVSIeA6uLRG7Gs8ZJIrnoXga3a0SvR+GsCoF47Fp06qz5jTHOXMct71yRP/iWchWVKeVO3+QBRGj7bHIug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724985182; c=relaxed/simple;
	bh=rNzGK/nBfL5EKfWW2+oZGOxSF7Ojw0shn7iqvxwuckc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eXnPkJtVhiOeWDNZBuirR/IYRH9YNzTvBb9BUXZSuZzaKFZ4GC5Lsjfz4hd7ubeFzrll5VJSGsGylXdrtL+YwNKU14GM/inLEQLfI+UnRGNM8tGyt8EWPC250h7VD1u4O9kW42EBvu/v8ZIJq0jigaTZNy7/s5LEkSYY1tVr4Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fqVH5pP8; arc=fail smtp.client-ip=40.107.220.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fqVH5pP8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTHEoCSvPBU+UvjnvSG3K86mdsSc3tjG2tumZasT7cXrnTxOWRo7r12r7szyvUqVnj8yfMLqpSh7K/kqfWkdzBNsqd+sJ1si+cvXxqw4Oo7zzPxFCjDIbqqb6ovN6QgDUvw+ZNxCRFv0cAQNZ62um/oPfvkkK9yoGIMyvwO1N/h0V6Sfker20Ir5/0QSXhXL8iZzihy0UYNQyt1kqxnkFwwb7nN7heNtXHDJK4WBB3sI0+x7tnfy6+N/OFiZOItRK4++Udn+Of6RNehsSMHkhzY0mYjbDaM0mDXHT6/XuY3QDn0H7GPcCE/GR0UcCMRt5biRIHScEqkhhtLwxBqT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNzGK/nBfL5EKfWW2+oZGOxSF7Ojw0shn7iqvxwuckc=;
 b=AftPlYGlaCsnQ+/Kz+GAeW0R/GwHrHJq7++5HSWkjCAmXUvMjCe8yTnJDxQN49SB+uNd5OptjObOthJP35cYvV+6QOymuvMLWTELKQT8BAKvGhe0qDxgBzFjmlqtoXwltoW7kmsElhPTeyPLL9O80B/2VXWMhpVa8xNobnlNdRfHTGxsNqHVDv2MTwJyQADJmXXBcIWbDXdx59HrNUnVMqlic9CeypH29DQAHosnUzOX3NOhV03mgGF2OwjRGfDVBoubTzpWpT4mQboY78c5UPuUl8NIGr7L2N6VQSvZ5nSlDc2YxA34YjWnRapSPbtZCM5KPWz/RnMo5gsraViP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNzGK/nBfL5EKfWW2+oZGOxSF7Ojw0shn7iqvxwuckc=;
 b=fqVH5pP88ou8nxbM6AQMSSGCm00J512CcgjKSUCHOSpx/Hwsy64tySG3iLd8NrIfQVCTpmG4CcRX1wypUOn0bvazeC6xPp0nE3q9MUtJ2G67JBHoYN3uiR0HRldBZrtSY0TwDNb1ukck0Iiv3XYzfZq2R8oryY0JfewJNpsatjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by IA0PR12MB8207.namprd12.prod.outlook.com (2603:10b6:208:401::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 30 Aug
 2024 02:32:59 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7897.021; Fri, 30 Aug 2024
 02:32:58 +0000
Message-ID: <7806c938-1151-4279-9a87-f4db25e27eeb@amd.com>
Date: Fri, 30 Aug 2024 10:32:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <20240815064513-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240815064513-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0203.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::16) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|IA0PR12MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3862b5-4d14-466d-acac-08dcc89c0fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzM3R3NkdDZlVmVrMGcvdngzK2pHSWNNNWRBeGk2ZlZsUEpJY2o3RXF6YS9R?=
 =?utf-8?B?WUx0dyt6a3VseXBCbkJUc0FjczR6WmVMUEhpUjlNRjB3ZXJoSWdLS1UwSmw4?=
 =?utf-8?B?WERhQjAvQnAvL2h3QWVYT1lzSnJISEE2Z3N1cGJ6TmQxRzkzR2RSL1lLL3Yw?=
 =?utf-8?B?RlpESDlKZ1R1Mk9ZZlJSWlNBcDVoT0V0ZlZLN1RNL1BvV2pKcEllVXNJc2R6?=
 =?utf-8?B?bitnc1pRSEExMmdtQTc1ZCs5b0VFRG9GYThvb1ZueE9TdVpHYlpOMWUwVS9D?=
 =?utf-8?B?QVlNSnExQmRRUDFaMEtDLzhwbTRkZmxVeERsTVp2WWdWaVlOS1UvYUlPUllr?=
 =?utf-8?B?aE5vaEFxZkVOMW5jNWVsV0RnQ3dUOGptM3hmT25OWVE4UVU1ZEpkTzRXZ3lp?=
 =?utf-8?B?QW9abGNXNUhqY1hyTktVUnNOM3ZkREYrSXNrOTBoUnlyQUlOYjZ2a2JTWEtI?=
 =?utf-8?B?cGwvOEcycy9aMzF4Z2U5WVJPb2JiNyttdGI2eW5EYVd5bVZIbisvbDZzU20y?=
 =?utf-8?B?bDNuVHNkVXc0alV0OUp2ZHhweis0WDRqTGpvWU9NQmVrbXkvaUFLUXFkaGJt?=
 =?utf-8?B?RXhpdjNpaDBIQXFwU0dsYmRvcmlWK2tPbVNlc1J2YmhyMzIzMWV2VURpaCs4?=
 =?utf-8?B?Y0pEOWw1TGRhVWRMenJCdHNiN2xtM1REWVM3d3JrcjRDSks0aFJPNkRmaTNT?=
 =?utf-8?B?aHVsUWRGUm15Mm9BekxUTjNYbzNlWTkrcWlsaHZvMHMxUUFsZlRDYTlrL0pt?=
 =?utf-8?B?N2dzdGhRV1hqQjVNYmZlTVhPQTE2WFovYm5ZSlVaa2I0bkV4aXYyMFlFVTBK?=
 =?utf-8?B?WUVwVUxIckJYM0dFckMrN29zaVBJWjJzVlhlVlhzT2lkNi9FWTF6Mm9IbHph?=
 =?utf-8?B?K1BGM0lwTkc3VThWYVVlVnVRZTJDcVhjWUFGbU9nMWlmZHRzTEcxWExCMUpm?=
 =?utf-8?B?MXRnbmpIL3F3akllNUprTTJSZjlpNVVnL2c3Z3BnUUJZT1dyaUV2OWVma0Fy?=
 =?utf-8?B?bENvS3ZMSUxiSkQ0TTNBd3B6c2FNU0dPTi9pWFlrakc5OHAzeGlYdmo1MTgz?=
 =?utf-8?B?VVk3OXREVEQ1SXZXTjNSbzVsWVU0V3A5YkdEL2ZpUHRGSGwvc1hSclZiOSsy?=
 =?utf-8?B?cENCK2dvdHE1andlZHdVb1A3RkJsUjFYNThPSWtUU1EyWFZOZXlKR0ZtRGpJ?=
 =?utf-8?B?K2E4Mzd6YTVkeGMxZmExMjFFN0FsZ3ZmN1VGUjZTcWdBM3F4c3MyWGFmVHpY?=
 =?utf-8?B?OTFPbjlTMXZMY1RJdlVOZFVlZkxLODA2dDA3eGNMS2JWeEt5TldmUW03Snpj?=
 =?utf-8?B?bmhCUmJtUjVuQVRGVUdLYmNGSC9Cdk1oa1gwU2FYd3NkRXJWcjNnN0JSeDdO?=
 =?utf-8?B?ZVFIRkN1TkxRZkRpaTU0ZTA0OURkeG9VR2EyVjRINWU2cmk5aFFUSDFib000?=
 =?utf-8?B?dUVWTVpMaWNoL09RWXlqenloK2FYRXNsdEUyejhvcllmclZ6VmVJTmt3ZzZk?=
 =?utf-8?B?RjN6aUZNcTR1R255dWNybXYvb2xHak5KVDJEamRTc2pMcFR4RGxFbzJnK2t2?=
 =?utf-8?B?eTkwM1FCSG5VSVpYSmNoam5YUXczZ2dPVmNBektHUEhRUkxldm1ZN2dGUk83?=
 =?utf-8?B?NzN4UmxRc3ZkalRTekx3Q3VQdWFuOVFEVUtzSnpUZ1hrMktpeFIzeUQzQWxy?=
 =?utf-8?B?UXBWNk0yWkpBM25Yb3Buc2orOEZFMlowOWFJbzFCK3FncUpwQjlWcVpJRWpo?=
 =?utf-8?B?WGZFNHJiZllYUnNueFp5dzNSUS82cHlveHErMWp0WTI0U0tvOVlWK3g4ZjRz?=
 =?utf-8?B?Y3BLaG92RkVjVVFUUy9nQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3BwaEtuSnpjMEYyV2ZtMlpPbFg2empiNEJGdHVkTWhWVW52a2tlczIxVWc4?=
 =?utf-8?B?MEdpYWVHQ2lqaGFHdExLS3I2RGJQZnhobGZmQnRnODdxaDhkVWhnc2hOQStW?=
 =?utf-8?B?RlZwTE8xUHZqcFllWW9oY1RaaVFzSk9Sb1hmdEFuOTliZXRJdzI2emp6V0tE?=
 =?utf-8?B?TUk1dWE1RGZydjRwR3R3eU5zNzZtVUY3Q2VQUkZRUWlnVTBPZFE0REFtZnBW?=
 =?utf-8?B?VTFnZVM1bWpVYjZJZGdqM3ZCQ2FqRG1VVjJTUUV3MXdIWjFsQmtSU0NZcVh0?=
 =?utf-8?B?RjlLOXpHcWsxTlRkYVFpSE9YU0Ira1UvVWNqZmxxSGpxdjU5SDlWVjVKMEls?=
 =?utf-8?B?dGVRb3dEMnhmZitiQlFlRkw5UHBidU9lYXpIdmJMUytVUStxL3VReEhtWkV0?=
 =?utf-8?B?OHk5bXA3UkZSampleEhEcUJYY1lYOVoxZS9FSnlQVG9sUGtnam1qV0R3c1Vm?=
 =?utf-8?B?TDNiUWl1RHZZRE50Z2tLeEwzc2VvYmkyaFBSWmFqRXR0YVZ6bWpKeTdYdTZF?=
 =?utf-8?B?Zy94OTFPc3NmUHBPUXN0cW43T1R5WW9tZ3dBSkVCT2o0djNFL29YOGg1MHNV?=
 =?utf-8?B?TVcveTl4Z2txZHpFN0xra1hCZXFCY2RhbEpxdysvUW9ENEVONGhTbTZtNmtj?=
 =?utf-8?B?TDJLb0JLclh3blUrVkNDTUk2bW9FVjFZb05nVklFcmhQdnNYeGV6ZEZtd1Vl?=
 =?utf-8?B?THMwYkd2ckZxRjJiNUJ0bnVMNnV4cjBNTXRWeS91SWJWVHk3WGY2T2w5ZXNX?=
 =?utf-8?B?b0lndm15SnNHUUIwUDcwbTY0aVBNeTJ2L0huT2trci9Qd0V0dHRpeDlQamt4?=
 =?utf-8?B?d1VXbktMTE4yY3R4U1lDclFJSDBZeXUra0VaMVh5RU14SGZtc1dVdkJUcWw5?=
 =?utf-8?B?RkRZMWxhaXMrUVRzczl5dGszUDB5UW5SRFZaYUREVlNRN3dreXo4OUlBaFpL?=
 =?utf-8?B?azZVd3UvNjZQd3M4aURMMUpMQ3BuZDBzRnoyb2g1MVd0ZTRxQkdhOTR4Vm9i?=
 =?utf-8?B?NDYyaVh3RVB6emdycXp4TmhwaGVVV0VDK3draDhkdmN6Tkx1ZkJYa3hUb1Nn?=
 =?utf-8?B?Z0tJbGs4WGVUd0lFYVdKNDJPVU1FS0piZ2pWTXUrTmNLZ2dqYzY0T1VvZDds?=
 =?utf-8?B?aHRCTzlKVkw5aHJIdmgwbFFhTnNENm1Tc3pXOFMxNml2RGt4Q2MrRE1hSm0r?=
 =?utf-8?B?Umwwc1Q1TGxoWTNKZmo4dFlodDR6Q3BTeVd3Z2J1R2t2ZTE4MjdPM3U3dnBq?=
 =?utf-8?B?bWRyNGZQYzZrVnR6MUd3Zk5hSHk0R1o0Z2hlU1NRS1NudVVHVnd6K2tHVlhz?=
 =?utf-8?B?ZkVBVHN3bWxveFpONDgxdWlCYkJzV2Vjc0tQWGgyaXhhKytGUE96cEs2dnpF?=
 =?utf-8?B?aXA2V0lIdC9WTC9Fbnd6NEN1dHpySTJhTEdOZ1VsTFlFWUs2TXltMW1ZVndK?=
 =?utf-8?B?L2dCY3BEenE4blhaUFZyUDVPcHZKQzJOVWcxbm1HOWFqeTBoa0pDVzBYZVJO?=
 =?utf-8?B?YTczazJURklESlQ2Q1JjUTFHamdudk1XK2xRU1F2L2VaQ0FSNHRZWjdUa1dK?=
 =?utf-8?B?eWhWWWNTa1pZandpWG1TQzBJQmg2TFR2M2NWUXB5M0llOGp4QzJEV2tnTXk1?=
 =?utf-8?B?cDI5a05FbUlITmUvc3I2M3RMY09ZcXNaeGhWR1IwVE56SUpONDhhTXFlZndl?=
 =?utf-8?B?OWJFamJTNWZ3STZ0aWVvOWdrWjJkcE8rVVUxbkprdE03ZXBhZWt2Wk5RSHIw?=
 =?utf-8?B?NHFPQktnV1dSelpwNkUzNThubkRpdDZkbDdxOU9OSngwVDFXYWRJQVVhYmRu?=
 =?utf-8?B?Z0RZZlhQcWdEakVsZ0JKRGM5QnhoUWdlTTFMV05vQjNZWDlmVnJuNjJxc2Q5?=
 =?utf-8?B?M2Z5ZDV4V3NHUEhsVlRIZG9WVTRMeURaV3RGaERqTVY3THRLOUlhaE1EUlVJ?=
 =?utf-8?B?NHRCTU9KUlJjUXorVzlZbVA5RHRRa1lBM2pEbW05b0p2L2xhSUVmNGxONmlX?=
 =?utf-8?B?T0l2eFpKbXNYV2FvSnRsUTY5dTdEN3NoL0dWTVFHbGJOY2tkc3hRUDhFUUlI?=
 =?utf-8?B?N1c3TDFReFo0aURHYnkwSnVjMCtuYlFRR3VFSmxFR0ZyUnpTdjNqU1VqYzNr?=
 =?utf-8?Q?/5ewGKTT0zX1SbFvhYQ4pP8B4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3862b5-4d14-466d-acac-08dcc89c0fee
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 02:32:58.9472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuJos8TpxTXLdM3ermY+Osfj+DWiq8wxgYT+baU8JXA6gXWSKPDT7unj2+qltPeMAJwwCdxQKXCqXAzWwfPIAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8207



On 8/15/2024 6:45 PM, Michael S. Tsirkin wrote:
> On Thu, Aug 15, 2024 at 04:23:26PM +0800, Zhu Lingshan wrote:
>>> So a device cannot respond back suspend=true in next 50nsec time.
>> It's OK for the device to take longer time to respond, the driver simply re-reads device status.
> You didn't bother saying in the spec that it must, though.
I can add this re-read like how we handle FEATURE_OK
>

