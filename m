Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC6328B1E
	for <virtio-comment@lists.linux.dev>; Fri,  4 Jul 2025 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622909; cv=fail; b=cbv0A7nxSRMBmGkuSnRYF2QecB3LAKA+gITTCVqrY+ZM6eVH2odBpa2KsVeqregBOcOGKqHuyGxILU6/3Ok5N0eBP0WysuuBan7ZiQeWgThQUQxDeqZuLN9VQzwqPsTTijTVheGJOsHhG9nuPAR0kBztOg3zdBAYqL/7VG53yNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622909; c=relaxed/simple;
	bh=6oCfK62COqtbMYB6nOCsDUDeZO68uhjS7JjmmlMpkQs=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=ktRq26nLpd5kq4fMgXyUHOV6WFHwP9gtszfo56gRIlVG0lIwis8JFu5y1A1Nh2/tUWJ3yDo8qKAywf7BzEhjky3Dek8SCv1aaPMxckFnPZi5s6T6WCPN4IXm6+HANBxwqUjxEx+RuP37sWxNup6RFyX5orYxPSIodG6isBoHb2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cyrZMAam; arc=fail smtp.client-ip=40.107.93.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cyrZMAam"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzpGe/oWcVne3uyhjScyVTj50s1focv9VGnfwIhpihtw1C4YUQEI076u4pU8BzJ2/+iOIpwBvOkxAC/J0lMcS58u/OpZzrNJD3471J1KvyfunK9ioP45QFYDrZchSfEjR1IzYpnJqeC7/EG7GqKP0X/qLpSzuLHBo7B4DzTQVTOd84OACztx4lIg/fSfrCIMcHc/jizLixiW5KJofGytU6B8wpHk3ZsxDOZ6P/PZG9yfT8MyispJbumFl4sFifQF/lp+5fgmsQKe+qE9KrcGavlZuVEhhAlbr4r02doigabi7ES1SlMpoandWkXmhXp8TUxRtCWnAzVDvithtWqWKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VM+CIqaB/RWPx+E3iivusdX04Bi6dXrf+PsPedvant4=;
 b=s5N7q22lv/6a2ZAv6zy5VfVBBjs9ii77UWn2krQuurjt1HlfAMvjV3phWo4P0Ii370ddC4MG7JG9X8alYFDKIytRsvLLuXU7FR2KUN6IgyjDAHfoE7lTmHw6kgvPzXdg2vYOzNEzRtGNMOBPN9DHodVfPM+Rb+6n3DrrnXRDt8v5iqNnE9n9mp98rLucZU/Eo3hb/yZ7wEPUEJsJBMXy/bEkgPOKfbskdI/ZS2eTF5NFxyyB2ycAxavjXrBz6xl2kxA2NX/H1MO/NkdJUX/ZUVQUcNhvdZYznJ7XZbBkoUsuFM/EEz9oyS9rySMjmAmWFDxekB8Dsjn9m52n3cdemw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM+CIqaB/RWPx+E3iivusdX04Bi6dXrf+PsPedvant4=;
 b=cyrZMAam7oWk0mfw8dtVvO+aFH9HrvSWuwau3MaPvOx8cDFH+WCvqppLJQKu+WP380JvkLQ8H6mpmGqTGz/Z7SjOh4WYa22vnecJXAV62W07E4eTS/yv0mm5q8xVfXSGUoki6VFywJEd3PzGhQWqjZRLonKHxCLWxVckN2z43C4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by SN7PR12MB7132.namprd12.prod.outlook.com (2603:10b6:806:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 4 Jul
 2025 09:55:05 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 09:55:05 +0000
Content-Type: multipart/alternative;
 boundary="------------ZMkmS6G0zdtkIfK3yKSjKkHM"
Message-ID: <d7a75d56-ed55-4b97-89f2-2e4c4afb8d3b@amd.com>
Date: Fri, 4 Jul 2025 17:54:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] virtio: introduce SUSPEND and RESUME feature
To: Parav Pandit <parav@nvidia.com>, "mst@redhat.com" <mst@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Ray.Huang@amd.com" <Ray.Huang@amd.com>
References: <20250702085421.342224-1-lingshan.zhu@amd.com>
 <20250702085421.342224-4-lingshan.zhu@amd.com>
 <CY8PR12MB719508FFEF43584586B6CFDDDC40A@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@amd.com>
In-Reply-To: <CY8PR12MB719508FFEF43584586B6CFDDDC40A@CY8PR12MB7195.namprd12.prod.outlook.com>
X-ClientProxiedBy: SG2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:4:188::8) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|SN7PR12MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 142a2e6d-7578-4116-2d51-08ddbae0d9ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2t3Z1BGR2xlQWtnYlI4czdJRDlmN1BPc1ZHeGppQWRGT2hqU2tqQllQOEla?=
 =?utf-8?B?QjRSR3NHdWs3b042c0JvTnZaTGdxcU9BTllOMjVJQ2UwS1FnYWpXWWJSTi80?=
 =?utf-8?B?aThTSDg3S1pzbUh0ZU02QUFtclRVQ3FFRVh1SWtMRG5waWVQOWlFZGtBUllk?=
 =?utf-8?B?L0lldGJZNk5qejE2TitJUWlmRjhvdThLT1NVTkl2UzlQeWJ1MCt5ckpHRWhQ?=
 =?utf-8?B?ZE1yMGU5MVVoRHRjQUhtejBVMGJzamVUUXpJSnc2cGVpZTZPQWN3ZDZ2Mi85?=
 =?utf-8?B?RC9UUlZmeW5LKzZwKy9qOHlMMFBiaHdnUjVWN1RjMDZjd0NSTk9XWkVmUXkw?=
 =?utf-8?B?LzFvOTdBUjdzRitPcGJTdnEza2JPbGI5c0xVbFRrQml1RW14SHFWN1ZWeHNn?=
 =?utf-8?B?ZXRmZGpnRTA1YmNwNDNJajBScHVRcjIvTDA5blo2aWxyR2lsSGpUUit0aHcv?=
 =?utf-8?B?U0FuN1JkYUVTRC8xQ3BROGxTbUVuUFIwNG9CcWJWNmgzRmViaXJKbVFFSGJO?=
 =?utf-8?B?VjZvVksyZmVwUnlSbFhvdjRHVVZOYmZCWVBwWGxJQ3ZkU1FQS0xsMUdJS3B3?=
 =?utf-8?B?ZXFueW5oSjVSOTFyWTFBR1JFTjNwU243UGNydC9oM1NLdXZLRFhZNzNEdW1G?=
 =?utf-8?B?L1pBMzh4R09EQXl3MUE5VmNCMU9oM1pYU2R5SjUxdVc1ZVR2SGtmWkV1djhv?=
 =?utf-8?B?N1hGdklmUnRFandXWmJua2VCMFpxZ3djSEoyMW44cmxUZ0EvSjYwcUUrZFor?=
 =?utf-8?B?MkIwNU9tTTVxeVM1K3UyOWdGdlNTWkhXZHIzUkEzQU5IU2hRVWFIVWxGYUF6?=
 =?utf-8?B?TXAzZU5ha1Q5ekFpL1VLcWNrbFk1SCs3NWFBek43OGdwWUFvQTVIWnkvSkJO?=
 =?utf-8?B?Y0JjWUp1NGlMR0ZYM0xqcThFYUdsdlNxcnRNaUN5bm4xcmtucFExTEhNYit3?=
 =?utf-8?B?VTJKNFVMVXlFWVNtdURPb1JNOVRmaW1jRlhTQ0NIbXZLTTRHZm1YQXR5UWM0?=
 =?utf-8?B?aVlNMHFrV0tQVHZDYW5STmduM292RjMwa29acEh1SThwSW1BelcxdkIzVlNE?=
 =?utf-8?B?MHAvaks2QVNSMHBRMDZXelkzSUtiNjRjMnl3aEZOeVFLN0JYQXhmUUVoL1FG?=
 =?utf-8?B?ZjNIVCtDajB5b0JIck5jMGE5SGxtYjJTTkxTMWhKUGY5NWdwRm9xaWJwNnVi?=
 =?utf-8?B?c2JyOW9CbWJkYXo5S1U3YXl4b2V5MU5oNEdLWnlQeC95eERXakJIQ1owL2Zn?=
 =?utf-8?B?djgwbmJERnA3bW84d0lDV0VNS1RtZmRmTUUxcXpJZGNVWTNIZ1BUelVTdHNB?=
 =?utf-8?B?TWZndlpWaW1McWtFZ2hIcEgrc0JwTnVsODNkd29lekpYQzZObnkyT3ZseWRa?=
 =?utf-8?B?a3RaT2dMeTh1VTU5V1AyV29ucE9iUWdueDhYVmN2c212T2EwMWMxYmlBeU9R?=
 =?utf-8?B?dklyaVl0UDRPSTVtY1JpUTBDeUhmK2pqemF2UXNlOFpVbjFHQXphVURNelZ6?=
 =?utf-8?B?ZWpzNUVvSEpBeTY1MFJXM0ljdkxxL090K3BwMjZ6M0pNQzdzY2o0ZnhiZjNY?=
 =?utf-8?B?UzFUM3BZTkFRenVSMVdTc1czeUNJUzZEQVF4S3Q1clUyM1lhVFFtZDhGRWVJ?=
 =?utf-8?B?UDJBaGhyUGFjb2JicXZCdVVoelJVNHNPVjZ5WlFjRWZLcGRmc0J1dlpCTXZR?=
 =?utf-8?B?akhiZDhBUzdVbjEwMHVTdksrMkVEUXc4OC9ZdTJOaGdRYWxGQWNzTmV5QkVt?=
 =?utf-8?B?RDRJTTZlRVgxa0g4N0JJOWtCSkVlVG1GMHRwZlZKVGc2YWFpMVRYZHhOTGxP?=
 =?utf-8?B?WUUzU0VlREEySnJSd25BRnJSZUt1cy8vM282RW9ZZStMVUk0MTZsOXNrTmNE?=
 =?utf-8?B?Szk3a04rb1ljVVhOM041WENkYlBYdCs4Y011MS83VzArYnp3TkhHcVNNNTBs?=
 =?utf-8?Q?doU8ukXzW6o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVp1VHlMcE1maVhnczVJcWRCVmJhNXNPZGQ3Sitja3V2NXZjNUUzekY3c0VP?=
 =?utf-8?B?WWJYQStaZWRTTzc1bElTZUNiQ3U5VlM3ZEhJanhSTUNYMHFVaXpWK25WQ0pV?=
 =?utf-8?B?Vm04MnpwS0tQVHZzU1JwZ0dsaE9LTWFkcmhkTWZhNzBvVitGWlI4dHJkM0Za?=
 =?utf-8?B?ZU5oNXdHRW1KZmtNdGtySGhadXY2czJ0UjZIc05OVkNyU3RaV05aYXN3d0Nz?=
 =?utf-8?B?TUtZM2JGeWR6a2k2d3lQckdXZDJSK053Zk45MTFYTHBFUE5iUFNwOHdqN2Vt?=
 =?utf-8?B?NHVneXlDcEU0UXVPQmdzcXZsS2UzcGg4cUpYaytZdGdPQkJMb0RSQzhiS2dK?=
 =?utf-8?B?TVBtLzhHeGl4YW1ZbGJEVjluem4rcmN1S25iaWduTXo0TURSbUhiZi8xL3lX?=
 =?utf-8?B?eGh2cHhJcW1QK3ZkQlVBR3dTZ1llOGNtN0NmOU14aXROcncyWk52QlA1R3BC?=
 =?utf-8?B?RlQxSy9zMk9NeDlhNmFDZVl3bHZkcWovNkUyWW94aXA2RnJ3aXlUMHg5VHRR?=
 =?utf-8?B?OTlmTE9VT0hBV2Z4TGcrc01oTFhnOWJSSld3eXVFVC82Ymp4MU44N1ZieDZK?=
 =?utf-8?B?bDdTL1RUdXRURWlHNkV5OW8xVUFrSFZlQmc3K2kzWmcvQktTUzN3eHd3RU14?=
 =?utf-8?B?eHFnMnBsN3lOOWhVVTlYT1U2L1owSXd0S2krelR1bFRnZ2dyUEVqTndOTnlw?=
 =?utf-8?B?am15U2J6bENianBmYVBUNVpBektmaTlsVVh1MEl6cmkrZFl6aUJKN3hNcDN1?=
 =?utf-8?B?RC9KVHVDUTJWMUtGeGRJMjMrTE1pRjJPcTIyaWFvcndQQVlvQmN1YlFCMzJG?=
 =?utf-8?B?M09ld0JSeW41Y3Z1REk3b041WVgwVUlXblBpMjVQVy82ZllTWjFqR2phY01L?=
 =?utf-8?B?RUZjTWxOaWhQYWpmbitRVGVjWkYzUzZUbFBNeTBUMGNEdUh3SDJaakNxd2NR?=
 =?utf-8?B?R0U2ZS8vd3BLd01BbnZUYWdtcmJmQWFQdkY2SytSUWhjeWtJWEIrZ2NWVW1n?=
 =?utf-8?B?cUdyYks1eWlndmRsUTRlRzZtbXJNSFAweFFFamVGZm9FL3Q3c0oxaXlFVENy?=
 =?utf-8?B?Ry96OUk4Qy9Wc1IxMWdDZWFmTmhtVjFoT29ZZjZ2WE00azI1Z1VaR01VdWpT?=
 =?utf-8?B?VjZHdXp4MnRWZWVHU01BZGpHRVRTSUZKejh1aTNkS1QwZng3RGFhTytUZ0NH?=
 =?utf-8?B?Q0pFYW81eU0rMGphUGFTM0ZndGRXYm1FcFNoUEttcUpockFoMkxuSDd2Rmdt?=
 =?utf-8?B?djcvaU5LbXQwWmUxY1hHNmwvVEEzaFZsblZkRDlNalBzZmhGUzVIT3BCcVph?=
 =?utf-8?B?dk9rTkRuUGhLWUVHNGhvVlo4eXQ4Y1RIaUphY3JOQkhXdi80ZmlwZ1l2ZGtv?=
 =?utf-8?B?TDFmc2x4YjgrUkxUY01uSmNoRDhQbFhIajNiemxEeE5qK2RlWmJGVnJSeDN5?=
 =?utf-8?B?VExNTXVXMk5Yc054QVBTWFN6OFR2TFhQNE9DRU9hMW93dDNWMm9MRktONWhl?=
 =?utf-8?B?dENndnNnYlpxSzZmSUpyZnZRUEViUVJjd1BTZ0o2WjRCdE5hNFFxYnc3V0Jj?=
 =?utf-8?B?M2xnTWlRTlNkWXBhaUxFbmVISlNic0I4Nk5UZCtxOTg2YXpJWUw3cy9scndP?=
 =?utf-8?B?elZxQTRGL0lRWGNRY3FjSjdqRkI1c1U1TitNWnFtcC9INDJxYXU5TlZRTWhP?=
 =?utf-8?B?WHFjRXREbjNZVk82SUNOOVB5eXVEMDVoQ3NaSkk4OWwvaWU0ZHF2M3FHVnl6?=
 =?utf-8?B?Tk9jRC9yYjdZY1k2M0dkR3VHOHJzWmlNQ3V3Y1E4KytEMktUZnlhd2FORzd6?=
 =?utf-8?B?N1RHVmJBK2lrU3lHU3NnaUNiM245a2ljNEZkaWkyaVUrNDFYdGw4ZE9MbFpr?=
 =?utf-8?B?RmtLZEtlVTZyRjdUMUpFOWovUy80VHRYYmN1NmZ0Y2ZLeHNZaFVuKzR1Skcz?=
 =?utf-8?B?TkVWb1dpbXgvQ2F1cjlUWVpEWHJ3Q3NQQ2hwcVNTUkZneWUyaXNDTFc1bGo1?=
 =?utf-8?B?TnhwdE1kTFcvQXFldU5RREd4cndBcVhrRjhBbFBNQUpISnZRRGwrR2JWcU5O?=
 =?utf-8?B?ZGwyVUVBV21XY1YyeGE0UU5pWVN6VWhhSWRqQmY4VUU5WjR1K0ZwKzRWR0xE?=
 =?utf-8?Q?L0RJzeDB0RSqMuqGSfsTttnii?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142a2e6d-7578-4116-2d51-08ddbae0d9ee
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:55:05.1227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arTBziuZVI1mmDlbQBTMFznCaj0/HX4FSf5pyqvO7tbeQqvBR7wi4lmdUc41tXcOx0OQvT/7+HSrsx5chndBVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7132

--------------ZMkmS6G0zdtkIfK3yKSjKkHM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/2025 7:53 PM, Parav Pandit wrote:

>
>> From: Zhu Lingshan<lingshan.zhu@amd.com>
>> Sent: 02 July 2025 02:24 PM
>>
>> This commit allows the driver to suspend the device through a new device
>> status bit SUSPEND and resume the device running by re-setting DRIVER_OK bit
>> in device status.
>>
>> Signed-off-by: Zhu Lingshan<lingshan.zhu@amd.com>
>> Signed-off-by: Jason Wang<jasowang@redhat.com>
>> Fixes:https://github.com/oasis-tcs/virtio-spec/issues/229
>> ---
>>   content.tex | 59
>> +++++++++++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 57 insertions(+), 2 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index 9213dc0..32cabfa 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -42,6 +42,9 @@ \section{\field{Device Status} Field}\label{sec:Basic
>> Facilities of a Virtio Dev  \item[FEATURES_OK (8)] Indicates that the driver has
>> acknowledged all the
>>     features it understands, and feature negotiation is complete.
>>
>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that
>> +the
>> +  device has been suspended by the driver.
>> +
>>   \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>>     an error from which it can't recover.
>>
>> @@ -99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a
>> Virtio Device / Feature B  \begin{description}
>>   \item[0 to 23, 41, 42 and 50 to 127] Feature bits for the specific device type
>>
>> -\item[24 to 40] Feature bits reserved for extensions to the queue and
>> +\item[24 to 40, and 43] Feature bits reserved for extensions to the
>> +queue and
>>     feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>>
>> -\item[43 to 49, and 128 and above] Feature bits reserved for future
>> extensions.
>> +\item[44 to 49, and 128 and above] Feature bits reserved for future
>> extensions.
>>   \end{description}
>>
>>   \begin{note}
>> @@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
>> Initialization And Device Operation /
>>
>>   Thus a driver MUST ensure a virtqueue isn't live (by device reset) before
>> removing exposed buffers.
>>
>> +\section{Device Suspend}\label{sec:General Initialization And Device
>> +Operation / Device Suspend}
>> +
>> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the device
>> by setting the SUSPEND bit in \field{device status} to 1, and the device sets the
>> DRIVER_OK bit to 0 once it has been suspended.
>> +
>> +If the device has been suspended, the driver can resume the device running by
>> setting the DRIVER_OK bit in \field{device status} to 1, and the device sets the
>> SUSPEND bit to 0 once it resumes running.
>> +
>> +\drivernormative{\subsection}{Device Suspend}{General Initialization
>> +And Device Operation / Device Suspend}
>> +
>> +The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or
>> VIRTIO_F_SUSPEND is not negotiated.
>> +
>> +Once the driver sets SUSPEND bit in \field{device status} to 1:
>> +\begin{itemize}
>> +\item The driver MUST verify whether the device has been suspended by re-
>> reading \field{device status}, examining whether the SUSPEND bit is set to 1
>> and the DRIVER_OK bit is set to 0.
>> +\item The driver MUST NOT make any more buffers available to the device.
>> +\item The driver MUST NOT send notifications for any virtqueues.
>> +\item The driver MUST NOT make any changes to Device Configuration Space
>> except for \field{device status} if it is part of the Configuration Space.
>> +\end{itemize}
>> +
> I missed to suggest this before or suggested, don't recall exactly.
>
> You should add the similar normative here to indicate what are the requirements on:
>
> Once the driver sets DRIVER_OK to 1 when suspended, the driver must wait for SUSPEND bit to turn 0 and DRIVER_OK to 1.

OK, since MST suggest we repeat and emphasize some key requirements in 
the normative sections. And I think what you mean is: "When the device 
has been suspended, once the driver sets DRIVER_OK bit in \field{device 
status} to 1, the driver MUST wait for the SUSPEND bit in \field{device 
status} to turn 0 and DRIVER_OK bit in \field{device_status} to turn 1 
before any normal operations." Thanks

>
> (you have described this in the description, just the normative is missing).
> Though it is not a blocker to me.
>
>> +\devicenormative{\subsection}{Device Suspend}{General Initialization
>> +And Device Operation / Device Suspend}
>> +
>> +The device MUST ignore any operations on the SUSPEND bit from the
>> +driver if the device has not been completely initialized by the
>> +procedures in \ref{sec:General Initialization And Device Operation /
>> +Device Initialization}
>> +
>> +The device SHOULD ignore any write access to its Configuration Space
>> +while suspended, except for \field{device status} if it is part of the
>> Configuration Space.
>> +
>> +A device MUST NOT send any notifications for any virtqueues, access any
>> +virtqueues, or modify any fields in its Configuration Space while
>> +suspended.
>> +
>> +If changes occur in the Configuration Space during suspended period,
>> +the device MUST NOT send any configuration change notifications.
>> +Instead, the device MUST send the notification when it resumes running.
>> +
>> +If the driver sets the SUSPEND bit in \field{device status} to 1, the
>> +device MUST either suspend itself or set the DEVICE_NEEDS_RESET bit in
>> \field{device status} to 1 when it fails to suspend.
>> +
>> +If the device has been suspended and the driver resumes the device
>> +running by setting the DRIVER_OK bit in \field{device status} to 1, the device
>> MUST either resume normal operation or set the DEVICE_NEEDS_RESET bit in
>> \field{device status} to 1 when it fails to resume.
>> +
>> +When the driver sets the SUSPEND bit to 1, the device SHOULD perform
>> +the following actions before presenting the SUSPEND bit as 1 and DRIVER_OK
>> bit as 0 in the \field{device status}:
>> +
>> +\begin{itemize}
>> +\item Stop consuming more buffers of any virtqueues.
>> +\item Wait until all buffers that are being processed have been used.
>> +\item Send used buffer notifications to the driver.
>> +\end{itemize}
>> +
>>   \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>>
>>   Virtio can use various different buses, thus the standard is split @@ -872,6
>> +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>   	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
>> for
>>   	handling features reserved for future use.
>>
>> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
>> +   suspend the device by set the SUSPEND bit to 1.
>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>> +
>>   \end{description}
>>
>>   \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>> --
>> 2.49.0
>>
> If you happen to send v5, please add above suggested requirement, if not it can be added later as well right after this as additional patch for same github issue 229.
>
> Reviewed-by: Parav Pandit<parav@nvidia.com>
--------------ZMkmS6G0zdtkIfK3yKSjKkHM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font face="monospace">On 7/2/2025 7:53 PM, Parav Pandit wrote:</font></p>
    <blockquote type="cite" cite="mid:CY8PR12MB719508FFEF43584586B6CFDDDC40A@CY8PR12MB7195.namprd12.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Zhu Lingshan <a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@amd.com">&lt;lingshan.zhu@amd.com&gt;</a>
Sent: 02 July 2025 02:24 PM

This commit allows the driver to suspend the device through a new device
status bit SUSPEND and resume the device running by re-setting DRIVER_OK bit
in device status.

Signed-off-by: Zhu Lingshan <a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@amd.com">&lt;lingshan.zhu@amd.com&gt;</a>
Signed-off-by: Jason Wang <a class="moz-txt-link-rfc2396E" href="mailto:jasowang@redhat.com">&lt;jasowang@redhat.com&gt;</a>
Fixes: <a class="moz-txt-link-freetext" href="https://github.com/oasis-tcs/virtio-spec/issues/229">https://github.com/oasis-tcs/virtio-spec/issues/229</a>
---
 content.tex | 59
+++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 9213dc0..32cabfa 100644
--- a/content.tex
+++ b/content.tex
@@ -42,6 +42,9 @@ \section{\field{Device Status} Field}\label{sec:Basic
Facilities of a Virtio Dev  \item[FEATURES_OK (8)] Indicates that the driver has
acknowledged all the
   features it understands, and feature negotiation is complete.

+\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that
+the
+  device has been suspended by the driver.
+
 \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
   an error from which it can't recover.

@@ -99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a
Virtio Device / Feature B  \begin{description}
 \item[0 to 23, 41, 42 and 50 to 127] Feature bits for the specific device type

-\item[24 to 40] Feature bits reserved for extensions to the queue and
+\item[24 to 40, and 43] Feature bits reserved for extensions to the
+queue and
   feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}

-\item[43 to 49, and 128 and above] Feature bits reserved for future
extensions.
+\item[44 to 49, and 128 and above] Feature bits reserved for future
extensions.
 \end{description}

 \begin{note}
@@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
Initialization And Device Operation /

 Thus a driver MUST ensure a virtqueue isn't live (by device reset) before
removing exposed buffers.

+\section{Device Suspend}\label{sec:General Initialization And Device
+Operation / Device Suspend}
+
+If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the device
by setting the SUSPEND bit in \field{device status} to 1, and the device sets the
DRIVER_OK bit to 0 once it has been suspended.
+
+If the device has been suspended, the driver can resume the device running by
setting the DRIVER_OK bit in \field{device status} to 1, and the device sets the
SUSPEND bit to 0 once it resumes running.
+
+\drivernormative{\subsection}{Device Suspend}{General Initialization
+And Device Operation / Device Suspend}
+
+The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or
VIRTIO_F_SUSPEND is not negotiated.
+
+Once the driver sets SUSPEND bit in \field{device status} to 1:
+\begin{itemize}
+\item The driver MUST verify whether the device has been suspended by re-
reading \field{device status}, examining whether the SUSPEND bit is set to 1
and the DRIVER_OK bit is set to 0.
+\item The driver MUST NOT make any more buffers available to the device.
+\item The driver MUST NOT send notifications for any virtqueues.
+\item The driver MUST NOT make any changes to Device Configuration Space
except for \field{device status} if it is part of the Configuration Space.
+\end{itemize}
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I missed to suggest this before or suggested, don't recall exactly.

You should add the similar normative here to indicate what are the requirements on:

Once the driver sets DRIVER_OK to 1 when suspended, the driver must wait for SUSPEND bit to turn 0 and DRIVER_OK to 1.</pre>
    </blockquote>
    <pre><font face="monospace">OK, since MST suggest we repeat and emphasize some key requirements in the normative sections.

And I think what you mean is:
&quot;When the device has been suspended, once the driver sets DRIVER_OK bit in \field{device status} to 1,
the driver MUST wait for the SUSPEND bit in \field{device status} to turn 0 and DRIVER_OK bit in \field{device_status} to turn 1
before any normal operations.&quot;

Thanks</font></pre>
    <blockquote type="cite" cite="mid:CY8PR12MB719508FFEF43584586B6CFDDDC40A@CY8PR12MB7195.namprd12.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

(you have described this in the description, just the normative is missing).
Though it is not a blocker to me.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+\devicenormative{\subsection}{Device Suspend}{General Initialization
+And Device Operation / Device Suspend}
+
+The device MUST ignore any operations on the SUSPEND bit from the
+driver if the device has not been completely initialized by the
+procedures in \ref{sec:General Initialization And Device Operation /
+Device Initialization}
+
+The device SHOULD ignore any write access to its Configuration Space
+while suspended, except for \field{device status} if it is part of the
Configuration Space.
+
+A device MUST NOT send any notifications for any virtqueues, access any
+virtqueues, or modify any fields in its Configuration Space while
+suspended.
+
+If changes occur in the Configuration Space during suspended period,
+the device MUST NOT send any configuration change notifications.
+Instead, the device MUST send the notification when it resumes running.
+
+If the driver sets the SUSPEND bit in \field{device status} to 1, the
+device MUST either suspend itself or set the DEVICE_NEEDS_RESET bit in
\field{device status} to 1 when it fails to suspend.
+
+If the device has been suspended and the driver resumes the device
+running by setting the DRIVER_OK bit in \field{device status} to 1, the device
MUST either resume normal operation or set the DEVICE_NEEDS_RESET bit in
\field{device status} to 1 when it fails to resume.
+
+When the driver sets the SUSPEND bit to 1, the device SHOULD perform
+the following actions before presenting the SUSPEND bit as 1 and DRIVER_OK
bit as 0 in the \field{device status}:
+
+\begin{itemize}
+\item Stop consuming more buffers of any virtqueues.
+\item Wait until all buffers that are being processed have been used.
+\item Send used buffer notifications to the driver.
+\end{itemize}
+
 \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}

 Virtio can use various different buses, thus the standard is split @@ -872,6
+923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
for
 	handling features reserved for future use.

+  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
+   suspend the device by set the SUSPEND bit to 1.
+   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
+
 \end{description}

 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
--
2.49.0

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">If you happen to send v5, please add above suggested requirement, if not it can be added later as well right after this as additional patch for same github issue 229.

Reviewed-by: Parav Pandit <a class="moz-txt-link-rfc2396E" href="mailto:parav@nvidia.com">&lt;parav@nvidia.com&gt;</a>
</pre>
    </blockquote>
  </body>
</html>

--------------ZMkmS6G0zdtkIfK3yKSjKkHM--
