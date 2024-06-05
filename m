Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD75E63D
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 01:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717552238; cv=fail; b=kgcEJzWLNXZ77JH7xWjH/xdCX50QXgCoRd0B1RbDvnJkmgIopvPJv5tIBBkuXU8XupRnytbDKThkYuELBMaiABSeSa6gIM6uzzSk4qAi1pz2oJH9nzQzCxT1/hPMz/XWqzmYmBmRTKNIdIeoek7Y+0kDyZVUI9DodKivFMau0iY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717552238; c=relaxed/simple;
	bh=FynXYE5qYQLqyEX8d1T48b9PbBEnOSjFSSgl0dBavYc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PMiLvsdMHK/So71mgkyOl/u+AoAV1QDBLD+tA9vCgmEMjDFfIirewVTFo+K+aQrXmr2wfo5GLPhXibOxis0gwgbzLFaQ1iaWA9/Sah+Hqo2jF+R3xo5AN5muB4/T56DG2B983xg+wsUIt2JK+jW3okSQ5/PjjOw17jPsX8r79CA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q49M1pzI; arc=fail smtp.client-ip=40.107.237.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q49M1pzI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Smg72JmvMKnH40NZjqDYyL/qbJwdB2V/Qa4xfSX/3q9QqRHhHeZYFacCkwwQl32S29643e/AGCQEU7QMb4Jv3yWVdld7eYk1rtKShLYrwammN3eYh6BAEn1+2QcV23eT61hE7J0xcNmuHE2VLJ7dNfqgzfI3rp6Uxtogi7yTLdai4qagPjqu10v3Gi6/lQg/+cUoYHrdt09eTOTUDbOshuaK2hvHXui7XVdQJdBatk0+xuJ2yZcdiKdm4/vEtggwD0kTiDnt1hIkpVQV7TrNW6cWGr+2YkmepM+x2uYGQYfeUJ7TlsaPT/WfrCVUGC0ixbEKmBsf8QU4Rk7YUdUZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FynXYE5qYQLqyEX8d1T48b9PbBEnOSjFSSgl0dBavYc=;
 b=VSK3nZr+cDZnmvYxECylmT7Hwv2a/sPTZRNZWodsjdsJb7VSoMz6AMsoSz7JDaUNGPx/8w7mQT/TTtuyoQJ/9PbipHS0xjmXxcs4fztm8s3NlSToFwLJs0ylp29bxDgCnav8PIlT1IuAUVVYCJCa2y45jw+RvD8+GxZmLaJ3CO0tf6JUWjlxJrgnDquB5v2o3xFNq5/JcmgQRl1ox1ms6q+YSdpYH06F81uLedE8OSo8cwN85O2nBP2mUwX89E6ikmwlyy9ruU7rwKrPYzvezfC0QhZzKkO6MHP/OZMCHuKvjkVHIFGYBsQb9L+5TFl8hZDU6Q4wc4eQJLzVg5e0Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FynXYE5qYQLqyEX8d1T48b9PbBEnOSjFSSgl0dBavYc=;
 b=q49M1pzIDcAuH+cepFSMuSgoFQsAxB9PZW6WiZh6sjsqWVYKor5cb13h4AyE9RVI86ow1veLw5h4PqhZ3W+fVzmfvEPI68OXM82AIGBKtCgmNyB7SAowaqji5zbyDpfZaJcmaFzN2Z0wG5FxXGl5VYIXeFWO/EbcROGPKZlt8ls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by DS0PR12MB7971.namprd12.prod.outlook.com (2603:10b6:8:14e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 01:50:34 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 01:50:33 +0000
Message-ID: <a819df4a-a8ea-4fc3-9aef-569a077b0772@amd.com>
Date: Wed, 5 Jun 2024 09:50:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [V4] virtio: introduce SUSPEND bit in device status
To: Daniel Verkamp <dverkamp@chromium.org>
Cc: mst@redhat.com, cohuck@redhat.com, jasowang@redhat.com,
 virtio-comment@lists.linux.dev, Zhu Lingshan <lingshan.zhu@intel.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
References: <20240604090344.225934-1-lingshan.zhu@amd.com>
 <CABVzXAk1kmOwgWEEDrxoEJcf7r=Hp=ki9q0Kka9kzN6Q+04zBA@mail.gmail.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <CABVzXAk1kmOwgWEEDrxoEJcf7r=Hp=ki9q0Kka9kzN6Q+04zBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::7) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|DS0PR12MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 502812e5-9ac3-4da3-f43d-08dc8501e36c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0NUR3Y3WlM4WGlOVlhYQUZTSkdtbHBVZ2JqVUw0SXFBckNZMjlFQkZEUUs5?=
 =?utf-8?B?WDRhZjhOZUI1ZXVwWEx4cHdRNWZTRkV3b3NWSWxFbng4L1BIcGJVSVV4cEVj?=
 =?utf-8?B?M0p3cDBQdSttU1k1akJ4ZW1WNCtOWEJrSGxCWjVwb25JZEgwdHJpWlBkSmxT?=
 =?utf-8?B?MDNaaEJGOVJPbkI0N2JjYVZ6WWErQVJnWFk5bWh3VzVDblVSaDZEbTlWRm5s?=
 =?utf-8?B?Y2JscHFHNjFlYUJvNWpPMlNVbGZmS0ZCTkozNkNQeURBZThkS1ZucW5ReEVS?=
 =?utf-8?B?ek5JM1JqckpXVDVodkZZSko2YUwvTzFkM2dnME9RS001eC9vWXdPbTFFazZt?=
 =?utf-8?B?UFZHN2l3Vk1LcmtXT0Rqb2ZYMVhOQjQvOFVFRW41azBETmJRTzhRckt2d055?=
 =?utf-8?B?VEdEbm5GMzV5NDVzbHFzQU9GeEQ0NUY3WmwzUUtyeitWQjZqd0YyWUdkS0FI?=
 =?utf-8?B?b0Z5a3FKQlpDWldHY1ZXN2Q5eTZuN3dEWmZNUzU5NXQ5Nkd4b3lWVFRuN0tN?=
 =?utf-8?B?dWowbFBUb1VLK2ZvT3ZQazVLcWt0UXgyd0ZlVWNJNVY3Q3BQbmVyemJ5dW1p?=
 =?utf-8?B?a3Y0bjZRWGgyRWFtWGxyeUs3TnIzNFZJcDVUUS9MVkdPc0JvYm83TDNBQ2Q3?=
 =?utf-8?B?OEJUZlQ3VnBaVWUxZkVqaVV0a2RvRlpaKzlBOWk3eVdJOGxrdWZzNy8vNml0?=
 =?utf-8?B?ZjNFNWcyTFpPOFBRUlJZYlhQWHJaU1pzenREMkZsUkZNQXpIbk4xb0krVlFy?=
 =?utf-8?B?RzVhemh1RjAweUpaVHc3cVNVREhlYTNoUzhaR21yL1cwKytZNE1IcnByaXRV?=
 =?utf-8?B?bUFJTytNdk16a3BFcHVKZ2pCSEdPYk1kNWZXUFpaYXppREt5RkFtNWQxSThZ?=
 =?utf-8?B?ZjVROUYxSFY5b2hFU0Z1aE1wWXgwZXdPdnh6UmlyWUpHZnhQWXZJZW9OSXZt?=
 =?utf-8?B?T1R1QU9jbE01dVZSODNmR2xSaEV1UW45bHprenU1NUUzWDFjMGhxZ2tHSU5l?=
 =?utf-8?B?QXdrQW9UbWJnRkpCZWNzSVh6R0VhSlNCcFFGekJOWEZ2cFEwUStqMm40bkdn?=
 =?utf-8?B?S2RRb25ScDY4OHExS3kxSzVRQlBGQjZHZUNMQzN5Wmx0M1E1d2gxRkZKMWJx?=
 =?utf-8?B?cW5KM0JFNk1JZm5UVWdPbUtuK3MrVVlTTXlxclordU5IczE1S0RVMm9Zc0JJ?=
 =?utf-8?B?NDJPVE9BaElVWnB2Vm9lOXE3NVdYZC9UTEExbnR6dUlyZWhCa3dUVUhxM2R6?=
 =?utf-8?B?SUpzYWlWR3Y4TSt6ai93bUIxRVhueVlPWENWQ04yOHhCeDFjdG9VeTJnckM0?=
 =?utf-8?B?THBTYytZTmlsWGJoRGhHRjBlelhzSG9kaUp1VnJYUGt5aEhsNTVEbGpIdjVK?=
 =?utf-8?B?MTJrWlBaY1Nqb0NqaXhzaGdEYnI5RmdVNVcwcHhFZ29tdU90bXFNR0pzMlND?=
 =?utf-8?B?dnNxSmJrU3lOVFU3ODNaeXFCQW9zclZIaFkzeDBGUnBNa084YTRDR1lRc1dV?=
 =?utf-8?B?L2k3bFJOOFhhSmxGMmJ6REVTV1BQazhSNDV2TURXNjB4Q3pERlRvZFJWMVFM?=
 =?utf-8?B?bnNjTkpNL2MxMjVsQXllS1ZqUXNvdml4SlVSWVJyclg0QkQxMXl6V1YvcDlP?=
 =?utf-8?B?Q2tlM1VseHhyOW9KZml0VW52VjBsQzcxRENYMVp1QjVXb092Y3BIcVZLT0J6?=
 =?utf-8?B?VlJma3RBSjR3RyszL1BPeDJmb2k1OS9JK1RIakVQUThIenBjR3hLYnRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHNYS0Y3aUM2bUdnSnpnZ0dZamV5U2QrRlRRZ3NrK0tBQVJyaDZVQnRKTmR0?=
 =?utf-8?B?cW9xQlBUd2NFRjhsQVY1RmZYY2VhSitiUUlhNXQ3SFZNTWRMKzdZL1NieC9O?=
 =?utf-8?B?R2VvelN1NDh5YVlKc3pOL0F4ZUpUVFdoZVRiQTFNZEg1dnlhV2pQa1MwZHNw?=
 =?utf-8?B?TmcrcDh2NWZnanBuUVhsUHJrTkRXYmhYS2wrc3NHeVNnV0VYekxyU0pKTjN3?=
 =?utf-8?B?eURpbkxYaXcvazJOaEM0Tnh0MnFQWkUrbnJuQVpab3B4WE9vYTFVUGM3cDBQ?=
 =?utf-8?B?akk1L3E5WVJFcXFMSUdTU2o1UG51azUrVlpkRnRiT2lFUUtaUGhNK05mU0FJ?=
 =?utf-8?B?bFNFVUZSNk1QVnBnVUlEdVB4Y2Fob3FHeDZRQWlZejZidjFWRjArZ1Q2ZkFx?=
 =?utf-8?B?UC9iSkdyV0hTWlNYamFYTEVtWmVMbGhwclcvZDkzbHZZZS9vNXNnUXJGRSt5?=
 =?utf-8?B?SmkxSEhFakhBZTdSQ05aMzUyb3pweVdCZUUvZ09vUXA2OWlqQVQ1ZkhBWEFY?=
 =?utf-8?B?VzUwSWZuZ1ZsTHpTR09WVU54clFVZW5LSG1jWDZ4bTFkMlZLWUladVhwVWIy?=
 =?utf-8?B?OEx5Y3pyV1hEOHlSUUxHQ1RQS1lNQlFrd2VnZ01NV3g0YUFCd05oUGx4bEcz?=
 =?utf-8?B?cGNYdVpxWTN6RXI0NTk2cDJsRTRyeFhoSGhLNlhxcTlGd1hGSmJpUHBUUm9Q?=
 =?utf-8?B?VFNTZG9seHk2Q2o2eENvbHhqMG1rU2dhcGZIK0V5SUpsTlBKOXZ4U0RvT0Ix?=
 =?utf-8?B?NEJoeStJU1piZzdrTlZnTmtUU3ZDZmFWUXE4a0M5T056aDQwQ1lteEhoQ1RB?=
 =?utf-8?B?SGVTQVorUUJ1ekVVTFR3RTlENjJpeEIxa09ZZG1iRWs4T3J6dFFoQk1yWE9S?=
 =?utf-8?B?S1J2bzVPMGJIZ0U3bFNGdUprWGx5dXdvSEh0WG4vSXdGc2lyZVNERGtyMGps?=
 =?utf-8?B?ZXlPVEw4K3VjcjlwcGQvVkJON2VDSlM4eGU0ZkZneVcraFBUVkhMeEVibFdI?=
 =?utf-8?B?b0ZiVzY5MmErOXFXUFgzRytjUlBtNjROZzVMVHRVNVA1YXJXeUhpUERvQkYv?=
 =?utf-8?B?YTJDeVNZKzJWd2xqN29CZ1k4bzJpeWFSbGcyNDRIZkFVRjlRQTRQc3g4Wkw5?=
 =?utf-8?B?SDdROTFwUjJLY0FjQ1lzSE02ajVPQXhjem9vNlJiUjM3TklZb0xJMXoyNHVY?=
 =?utf-8?B?b0p2azJOcWFiRGY4RGJhZGxsZHlJcGN2dy84RDFleFpZNzdCVHBYVFI2MFdX?=
 =?utf-8?B?REZVZU4yU3V0a3pvQzlDUXo5T0plQ2NvYkgwVVpIa2FYeGVxTXoxeitiZVNF?=
 =?utf-8?B?dWdyK0pnWGRMNXFmSGsrN0ZLdXlKUjZPdkRUdTRWTHpEdUZqcndQeGpzbU02?=
 =?utf-8?B?c3dsYk9MSEN6QWVSN3VtUWNuZHl1Vi80Y0l6eENYY1cvZDdSV3JqaGZrZVp4?=
 =?utf-8?B?RkhmQzdIVVV0VldMYXp2MnA1K3VHQXJ3M1A2dFpaUXRReXlvL2tYN0NMWmJz?=
 =?utf-8?B?WFUyeTNWbGFSVHVVYU1YWWpsaExEOVFHS2g5OGpxNi9zZ2UzeHZMS3JLeDFZ?=
 =?utf-8?B?S08wcm43bEpJelFKMEpQOWc5TWlOYzB2REs0VzA4SVV4biswOEhaUHpRbEx1?=
 =?utf-8?B?d3RSaml3QmMxOVRSTjNQdFF2VkVMTHU4WUFLaWtJa3RDOXVqdWlLT1BOTzRU?=
 =?utf-8?B?UTZOdnZQbURHQjkzZkNLbXdkWTlIUzVCSDU2SitzZ2ptU3hWNFJKeHNhVzd6?=
 =?utf-8?B?Unhwb3dFRGZYOVBaVzY3YUxrWlg0VVdBVHZCOTRheU80YTRJcVo4dUU2ZE1u?=
 =?utf-8?B?SEFjTHpLVU9LcHczY3lJdElYQTBqNE80eTZFU1FBcmVIN0xWdWlDSHNzOVhD?=
 =?utf-8?B?Q2pTK1dHOGpiK1NrQkk5UDJjbUNIamUzWm9ZMDh2TSsyQ2xnSHpBeC9EK0Ur?=
 =?utf-8?B?WTNHL1JkNEJiMVlUMFlyMGt1WHFsMkl4OEFSenJja0kyeGJYVXpzbHU4ckpv?=
 =?utf-8?B?MnpwQjJKMGp2VkcraVJIMWhseEdzbGpuWU10K1c4VDFrem1JL3B1aUw1d0xs?=
 =?utf-8?B?c2pHQmN2TWtLRkdxWUh5eGZnNmIySDdyMm4rc0FlSjluTFBCWXBkMG95ejBk?=
 =?utf-8?Q?ZPzDt4yI+KCd2TN3OVtTZAmxS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 502812e5-9ac3-4da3-f43d-08dc8501e36c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 01:50:33.8944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S230g+WmmrkwA7ALSvJ8c1XwK30NK+nWicmj/Ob3AgfuBo25vP4/j563Lx+vQnYtgGIMlrSyEcnFPbk9NwvG5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7971


On 6/5/2024 3:04 AM, Daniel Verkamp wrote:
> On Tue, Jun 4, 2024 at 2:04 AM Zhu Lingshan <lingshan.zhu@amd.com> wrote:
>> This commit allows the driver to suspend the device by
>> introducing a new status bit SUSPEND in device_status.
>>
>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
>> which indicating whether the device support SUSPEND.
>>
>> This SUSPEND bit is transport-independent.
> [...]
>> +\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
>> +
>> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
>> +SUSPEND bit in \field{device status} to suspend a device, and can
>> +clear the SUSPEND bit to resume a suspended device.
>> +
>> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>> +
>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
>> +
>> +Once the driver sets SUSPEND to \field{device status} of the device:
>> +\begin{itemize}
>> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
>> +If not, the device does not support the SUSPEND feature.
>> +\item The driver MUST NOT make any more buffers available to the device.
>> +\item The driver MUST NOT access any fields of any virtqueues or kick any virtqueues.
> nit: "kick" is not the terminology used in the spec; perhaps this
> could be something like:
> "The driver MUST NOT notify the device."
yeah, that's true, will be "notify" in V5. Thanks!
>
> Thanks,
> -- Daniel

