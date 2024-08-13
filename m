Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7622D05E
	for <virtio-comment@lists.linux.dev>; Tue, 13 Aug 2024 05:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723527908; cv=fail; b=jANs4/SeYNT+pze2x3qEtStfxzWtD4Kk4N42rGnAX/5/00tRedTL25Pr+mIOA+PYcdYv2TOlPQLfqs/+Ot/7jJPEPUhkyWBWdLn0TdoGKW5PfRFPRCqbr0CfG9b7XG/e46y5d54gC0BcXP5Gj4L3U1DIq3utKNO/oLhc3/Vv2d4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723527908; c=relaxed/simple;
	bh=DKUW1rG6Pyl7zO69waq1MgLZ1SUJLMz8XxAUXCnmeoo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eI6T/VSZJs75DbrLmLw+OB9NiaBfmgvT2ScxGJXD3CW+mDN1dxP7x7HtfbyuvHROUsmPEOsg7Wu3TA7V7BkjeOUn65U17s+4t/fHnNMwo1Wj8rjtO58W3JVixSTUjQomi510/n9wPjMGrpTvbD9WVueRqZxuOnPd8UQaDQy33Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=k1I5T+eL; arc=fail smtp.client-ip=40.107.243.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k1I5T+eL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZMUfQqaWjVhdYYPDfe44AyZJhXhduYSued8Ezb2NI5f/GWyxH7a6f/+qmWAx/YAcPj4w1A9xV+vkAdfOSTkOcXow358Xbn1WbCohTRAfrfZZUXRbXgGPfgGkmzFr366RyTq3sGHVNnV/3z5gYbZ3fc67tAtA7x3q7S4vCjceogFUeIi6btQ3NEAfuf6h0syRX4OuNGhtJ7k9oGHr9kQAfMVPmN1CT5jdTwv4LemL/TW2AT9byBIZM0t3Bp26MjYF6OYytjJgb6KYDCkIAlpT7sOD2qDqSmrKM7hOse1QYYq3ln+gxYA1VmtnCKfLVdqpAbEUYU+eRhS6moYG46vJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WidyCxaKUe23SU1GasldsQs2yH1eV9fhR0InbTgPGh4=;
 b=CtwIe019YxqMkXVWNLndMvI5tmCS3hQkaAkUVusCJbQckwpLizcNuuMLGOQbo/wmp5ACtfoRsEce0hjntd4QWmtlalAr4orAOEuVoEVSkLX56pKnkIhoGWAXWyOqPWqDvLtIvr7TIuaVFvP5j3m0cJpSJRLSUCHzDmK18iHKiiOxTu1XnbyCEmr3nz2sJXCFVp4sDL3OAK8Wmm8yum2IdAw9RpuSDFlQstAqtm7qgd3crfN/GTqAyr+J///HGo7M4Rvu/Nvz18Ogt6GqMrWRdhbf5a6XflI/soDy9qi2rnT7OerhrYNA5AknrBVw13mgSWn9M4O1ROQ3Mvkn4YvKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WidyCxaKUe23SU1GasldsQs2yH1eV9fhR0InbTgPGh4=;
 b=k1I5T+eLm8y0EDqA2bt3ARNcPbjepiZl1OEkVPZuC6KXM3HV0OlluKb0+8CTE3sWB+IIYLrCVAyQAd1FoDHfisyvMRf34NLgj5zUAtKLHvpdBri0sNJJwHR9sjixilbYqDiVr7+CC5ohur+n7m1uJnVGdjbEIvsSxUXlWds3aYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by PH8PR12MB6723.namprd12.prod.outlook.com (2603:10b6:510:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 05:45:02 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 05:45:01 +0000
Message-ID: <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
Date: Tue, 13 Aug 2024 13:44:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: Parav Pandit <parav@nvidia.com>, "mst@redhat.com" <mst@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 Zhu Lingshan <lingshan.zhu@intel.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, David Stevens <stevensd@chromium.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:404:56::32) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|PH8PR12MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ebb347d-6067-4f4d-b022-08dcbb5b12e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ei8yYnFLN0EwSXM1WUhhalZLTlJQZlpWZHNKTzBmZUI5MHNQc3ZuU3k1c2kz?=
 =?utf-8?B?NWJBc2U0N3M1bkZwTnVOeW1FMi9UZSt2dHJhL3MwTVprRDJqS3k1dHN4WEJY?=
 =?utf-8?B?dGNHMHhadkNkRUgyTEV2SHR4SDYyK0NWWDdhbGg4K2o5TXlWaDNlWVRoVE9R?=
 =?utf-8?B?K0RyQVRYUVZ2UUdaV053TjFsbU1TUEdRN0p6aUFWbUxQenBxU2hMWmM4OHNn?=
 =?utf-8?B?bzhINHJpSVZxVVU3TXp1N1podC93Qk1VNEpsSkg5MFRBbEIzZUw4RW1oTlRv?=
 =?utf-8?B?ZkllejFRb3Z0MlFHSnovRVgxd1pzU1dGWWhEYjJBalhiWTQ3NDRBQlV3SVBi?=
 =?utf-8?B?T2JIWEpncEZQaGNXZjNlby9heEZITEhqM3gvekZzUkowOTBWYUt6Y0ZoRkZ6?=
 =?utf-8?B?Rk1NV2pnOUFzeTRsMko5Y1hTdW8xbDI4Y0h3OU9pb3dHS2xBYTIwZUtNa1lz?=
 =?utf-8?B?TG8yZmhraWo4NWxrVHc2UW9BVVFXQ3hwQWFBNmI0dllrTWhPNUNoVHlCVmlZ?=
 =?utf-8?B?SHUvN2Y0TjkzUVlkbTFTcHRrRWhxY1RRTVpiTW1xYWdIMGg1SjZtNHJxSXR3?=
 =?utf-8?B?cUZpTy9CaUs5bDd6Z2pUT3NxN01hQXlGdllxYnFzOW1ZcnUyREo0bjA0R0dZ?=
 =?utf-8?B?blZjWjRyc2VHRURIK1FlT2hUVDI2M3UrV2w0MkdjMDBIbDVEdG4wYnZaRGpH?=
 =?utf-8?B?MEw3d0pvYjlvMmpnZnpWYmRyNzJDRzFIUFBvNnhHNjVOb2Y3NHoxblAydUhq?=
 =?utf-8?B?bElkV2Q4VVptQmdiVzFRbVBxRFBxd0ZwSGRiYUNsVVVhcXZLdDVXclRpdERa?=
 =?utf-8?B?WjBJMGJsRGpsYUo4NGhGb3NmMVl0VjRLWURtdC83YXBQNmVnQTBWYWNyaW1X?=
 =?utf-8?B?YS9UbnhEUVZFTE50SU9qSDRQenNYZ1cyNTlVZHhEajQ5SU9sY2ErTm1ObzVC?=
 =?utf-8?B?bmlzaEl1ckxac2dHOWtLTjhoNmttdjd1NHB6Nkd2RG1UU1NZcGJxUW9qZ0hU?=
 =?utf-8?B?NGNhRk9wNkYxaFI2eCtEbnJnRm0wN0xFZndLTDRsRnhIb0gzekZIRVBuQzFr?=
 =?utf-8?B?a3g1N20wUktUbVNDcHFETVNBb3RYMHVNMFVyUGxHejdBbTlFN1REejhLQVQ4?=
 =?utf-8?B?ZE5XdlVKSlhwMUlYYWh3YmhKVE1qQVFIQ1gvRzhUZ25RaWJVL2NPRVoxaUZL?=
 =?utf-8?B?dWVkY0tDeVVDMStBNXZQbUVkUkVETWMxNW1IVUhnUE14eVBhcFNNR3NkbVd1?=
 =?utf-8?B?ZnVoT2xIQkF1Rlp6c0E5VzFBMng2UzgyNmx6TG1qQlVCLzlzQUJaWHhRWEpC?=
 =?utf-8?B?UlhleFk2cDJzUlk5UFZ3ZHJKRkJOWll4bjYwVUhBYjFNcEdkc3EwMG5hNzhL?=
 =?utf-8?B?QUFXQUhKQXF2cFFMYmFkOUduRGRvenFvQ1hBbXk3SWxLY0R4aCtXcDJ6T0dk?=
 =?utf-8?B?a3RJT2kwc2IxODVPdWdyOHJpNWZVMVRlUmF1am9nR09mRm9ITXB1V0hzRGxo?=
 =?utf-8?B?bXI4OEp3d1JCS2x5NnhlVXJMajltbkl1RzRDZTE5anlGYUZvV2MyZXpORFFP?=
 =?utf-8?B?NzJ6ZmRld0hUWGZ2R3RMdWRwVFBqZnZTRXRFVUdVUERtVXpJRFN0WEVEcjNF?=
 =?utf-8?B?OVFrT3dsY1B5aEFnYmtxMUVRMDlXb2c2RE81SWtsbEJlS01teXUxQVB5TFJx?=
 =?utf-8?B?djhxUnl0bFUrSS9HVEVxc1hyeDU5eXA4SE5WY1I4MGtLSHNnNWt4OUNjVjdp?=
 =?utf-8?B?S2Q0OUd6c3pLVUZDeW05MmZIL3hsWUFncEpUaGxvOFJNaHZqeWREQllaUThL?=
 =?utf-8?B?My92MTZIcy81ZTExbmdXdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWNDT2svWU1OT05HTDh6ODBmQ3grREJsdzZwdDN3NFJiVTk0RlFTWU8xdVhV?=
 =?utf-8?B?eFJQbG9aY0JncXpHd3V6alRraFNqQ2o2Yk93WXgrYStVeUlMQUJKbUdWME5H?=
 =?utf-8?B?NkpXbGFZNnk1MGFJNWpvM3dOZnlWM3dOQVR6RzB1NUQxM3NlZ3B2VFpVRy9u?=
 =?utf-8?B?dk8xc1NlZmFUWWozYVVzd2tuMkZMemNOMzAvY2FGS0pLVGIyb2tjdjFPd2FN?=
 =?utf-8?B?OWVPVklZU1hidFpsSVZ6RXoxZm1IRGloTWFYVkJzUk1RZWt1c01DbThIUFcr?=
 =?utf-8?B?TlZUMXJTQmgwME4zU2c0K3NKY1ZtNzhQUjdsZmRvbHhKbWR1VkNXRjJQTWV6?=
 =?utf-8?B?RU9vcE1YSTdFZURNeTBrTW5KczRhYTZ3VitkMjZIa21tYkxQWVZudForYVg3?=
 =?utf-8?B?M3BpMjRJRFBSbWZtN3NxYW1RKzVWSW1nTGNBUHIwWHViU2ptSXZIQzdDOEF1?=
 =?utf-8?B?ZnRiblpZWVZNaEh1T0RKa294KzlVUjZ3WUppNHpPKzBpWlBBSUx4Z21IYkw0?=
 =?utf-8?B?eWVZQ09HOVFXTUlJQVBCaVNJeHBjbnVZSVovbjNobENzRlgrUVZDdjZ0UHoz?=
 =?utf-8?B?QnBqZWtEdHdPVFM3dmcxZ0RVUUlvaTFvQzk2V1kvY1h6RmNZTW52ZEtYdFFo?=
 =?utf-8?B?NWJCNGJhMmw4SU9MZjFhR0tySEVJMWJsQjhNQ1VrWGZXT0xrTnpxNDFLalR4?=
 =?utf-8?B?RWRCeExhMWpDTGptWVVwTjhtSGFURFAyQlFtOE13bGJCVzlLY1pOVlF1b3VB?=
 =?utf-8?B?VUhsRVcrRUg2SE1rekFYRGMwcEZCZjM1a2MzRm9pcUE4ZnozQytrY2RsZkMv?=
 =?utf-8?B?QzRRaGc1T3Axb0I4ZHgzWDlyTjE1RWpMS1NEREhZZVNBam5XNTIyRFVWWWM5?=
 =?utf-8?B?RnZGUGxnaGxNOUx0eW5XRFhDSS9YWnFXUU9jVzJZNHluWTFJaVpHdVJSYjkz?=
 =?utf-8?B?Tk5GbXBlMUMrRENhdVVucVV4U3dvQXdtZ0lBc1lTbXhBcTFtengzcVJWM0FT?=
 =?utf-8?B?eWRHWDVxV21mUklHamtST21TbVZPbE1hR2ZnMkJobE9qNmo3Wm12eEJNMzZM?=
 =?utf-8?B?VTF4bXQ4Y2dETnZpZVl6czdySnZRTHN0S0xhT05rMmFYL1g1cElJSVQ2N3Vn?=
 =?utf-8?B?c0d3QkZVaHhnYmc0cXNzOWtDK0lieHc2aVBWa2s4RkFZUGRUR1RSQ3hxZTdZ?=
 =?utf-8?B?dlpRaDBCU2xrVTNxRlc5SlpSUWZoQWxoZzZlLzVSQlBCRjE2RSs0TXBSTW03?=
 =?utf-8?B?T0N3MHpwaHB1S0tTNjRSYmhRR2syVE0yVWN0SkN5NlplRnFkbFRQdnhkSjFt?=
 =?utf-8?B?NjZDNkZSbktqaFNrSmN2SlhBYVRrSHo4eG1ObCtsdTIzd1JJcVZ6RnZsYm9a?=
 =?utf-8?B?T2pJdHhrdHY3dll5RWlnUnV2WGR5WmxCdnJ2K09jUUhnY3IrTWxQaFFGVmRR?=
 =?utf-8?B?Q0lrTEwvbTlzZytCaXR6WTZIQWdYZGErSmxaWVNPd2tNYklZWVlqNngvelll?=
 =?utf-8?B?cHRYaityK3pCSUpQaXBrbFpweVZ2dllhYWtPMUVEcjlMRnFNVXA0b3IveVFh?=
 =?utf-8?B?dWU2bkMvSlhlNkxaeTZuNENxM05Hd20xN0V0WTI0Y3p0djBxOUovYm1vdjY1?=
 =?utf-8?B?NXVkejlaaWc4WGkxVWZnVWFIdEtNajFiNXd5Q21BOXIrUzhVU0crUWhnV3Vl?=
 =?utf-8?B?eTNFZXJaSERPakRiOEpObWRaMnE4UUdId3JCVTZPVm4xY2F3eUoycmNDcXFu?=
 =?utf-8?B?Y1hWSGdvR3Blb0hNdHgzcE5DdTVWK3JTVnB5Mk5EbHoyb3RWSXllbGJteTY5?=
 =?utf-8?B?NGtqdzdIdWYrMmRkOXYrQjF2RUlEOVViQTRLS3lpeWJqeU1oNTRCekhzZ1Nt?=
 =?utf-8?B?ZnZYYzQ0dGhTWE00Sm5hWHBiczZVd2cyZE8xS2E0WGNtVmxmcXR6R0RoVTFY?=
 =?utf-8?B?eUlWczIrak9PeU10NVJ3dEJsOE1iNUxXWDJWa0l5b0NFR1JZY1Q5eHptNndN?=
 =?utf-8?B?Nk1nNkNjSi9HVjE0UnRHb3hKOVdqdXpXVHpmSU85ZzRKOVFXMTZYakJvS0Nk?=
 =?utf-8?B?cFF5YTlrTVNaRHBzRnNqRUJqWVc1NjNOSk5YL0c5Q0lUZmd1NThSd1RFZk0v?=
 =?utf-8?Q?IVzH5PoCFmU6pV08RQfpA/cnZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ebb347d-6067-4f4d-b022-08dcbb5b12e8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 05:45:01.5563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nc4KMMZKXFVYxm7PfJDtEu3Gyz3kg47CaePCeQdLY92SInK2d6sVicGTMPr7TutV7m9VcAqOuNaLik6z91yTDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6723

On 8/13/2024 12:42 PM, Parav Pandit wrote:
> Hi Lingshan, David,
>
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Thursday, August 1, 2024 5:05 PM
>>
>> This commit allows the driver to suspend the device by introducing a new
>> status bit SUSPEND in device_status.
>>
>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND which
>> indicating whether the device support SUSPEND.
>>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>> Signed-off-by: David Stevens <stevensd@chromium.org>
>> ---
>>  content.tex | 75 ++++++++++++++++++++++++++++++++++++++++++++++-----
>> --
>>  1 file changed, 65 insertions(+), 10 deletions(-)
>>
>> Changes from V6:
>> - the device should hold its config interrupt while SUSPEND,  and send config
>> interrupt when the SUSPEND bit is cleared.
>> - while SUSPEND, the driver MUST NOT access Device Configuration Space
>> - minor changes.
>>
>> Changes from V5:
>> - the device should present NEEDS_RESET if failed to suspend
>> - allow the driver access device status in the config space when
>>   suspended if it is implemented in config space.
>> - language improvements
>>
>> Changes from V4:
>> - re-order the device status bits section
>> - kick vqs --> notify vqs
>>
>> Changes from V3:
>> - allow the driver clearing the SUSPEND bit to resume the device.
>> - disallow access to config space while suspended.
>>
>> diff --git a/content.tex b/content.tex
>> index 0a62dce..2d1bee8 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Basic
>> Facilities of a Virtio Dev
>>      this bit.  For example, under Linux, drivers can be loadable modules.
>>    \end{note}
>>
>> -\item[FAILED (128)] Indicates that something went wrong in the guest,
>> -  and it has given up on the device. This could be an internal
>> -  error, or the driver didn't like the device for some reason, or
>> -  even a fatal error during device operation.
>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>> +  drive the device.
>>
>>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
>>    features it understands, and feature negotiation is complete.
>>
>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>> -  drive the device.
>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that
>> +the
>> +  device has been suspended by the driver.
>>
>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>>    an error from which it can't recover.
>> +
>> +\item[FAILED (128)] Indicates that something went wrong in the guest,
>> +  and it has given up on the device. This could be an internal
>> +  error, or the driver didn't like the device for some reason, or
>> +  even a fatal error during device operation.
>>  \end{description}
>>
>>  The \field{device status} field starts out as 0, and is reinitialized to 0 by @@ -
>> 60,8 +63,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities
>> of a Virtio Dev  initialization sequence specified in  \ref{sec:General
>> Initialization And Device Operation / Device  Initialization}.
>> -The driver MUST NOT clear a
>> -\field{device status} bit.  If the driver sets the FAILED bit,
>> +The driver MUST NOT clear a \field{device status} bit other than
>> +SUSPEND except when setting \field{device status} to 0 as a
>> +transport-specific way to initiate a reset. If the driver sets the
>> +FAILED bit,
>>  the driver MUST later reset the device before attempting to re-initialize.
>>
>>  The driver SHOULD NOT rely on completion of operations of a @@ -99,10
>> +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device
>> / Feature B  \begin{description}
>>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>>
>> -\item[24 to 41] Feature bits reserved for extensions to the queue and
>> +\item[24 to 42] Feature bits reserved for extensions to the queue and
>>    feature negotiation mechanisms
>>
>> -\item[42 to 49, and 128 and above] Feature bits reserved for future
>> extensions.
>> +\item[43 to 49, and 128 and above] Feature bits reserved for future
>> extensions.
>>  \end{description}
>>
>>  \begin{note}
>> @@ -629,6 +633,53 @@ \section{Device Cleanup}\label{sec:General
>> Initialization And Device Operation /
>>
>>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) before
>> removing exposed buffers.
>>
>> +\section{Device Suspend}\label{sec:General Initialization And Device
>> +Operation / Device Suspend}
>> +
>> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the SUSPEND bit
>> +in \field{device status} to suspend a device, and can clear the SUSPEND
>> +bit to resume a suspended device.
>> +
>> +\drivernormative{\subsection}{Device Suspend}{General Initialization
>> +And Device Operation / Device Suspend}
>> +
>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or
>> VIRTIO_F_SUSPEND is not negotiated.
>> +
>> +Once the driver sets SUSPEND to \field{device status} of the device:
>> +\begin{itemize}
>> +\item The driver MUST re-read \field{device status} to verify whether the
>> SUSPEND bit is set.
>> +\item The driver MUST NOT make any more buffers available to the device.
>> +\item The driver MUST NOT access any virtqueues or send notifications for
>> any virtqueues.
>> +\item The driver MUST NOT access Device Configuration Space.
>> +\end{itemize}
>> +
Hi Parva
> Do we agree that 
> a. suspending a device is non frequent operation (in order of N operations/sec, where N is roughly in range of 10 or 100) per device?
Ideally it should not be often in normal operations, but remember we can not restrict the behaviors of the driver, so we must be able
to handle the scenario in which SUSPENDING is often.
> b. A software-based device may not always want to force VM_EXIT on read and write on the device_status register?
Trap and Emulation is the basic of virtualization, and how to pass-through a device is out of this spec.

Thanks
Zhu Lingshan
>
>
>> +\devicenormative{\subsection}{Device Suspend}{General Initialization
>> +And Device Operation / Device Suspend}
>> +
>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
>> VIRTIO_F_SUSPEND is not negotiated.
>> +
>> +The device MUST ignore all access to its Configuration Space while
>> +suspended, except for \field{device status} if it is part of the Configuration
>> Space.
>> +
>> +A device MUST NOT send any notifications for any virtqeuues, access any
>> +virtqueues, or modify any fields in its Configuration Space while
>> +suspended.
>> +
>> +If changes occur in the Configuration Space while the SUSPEND bit is
>> +set, the device MUST NOT send any configuration change notifications.
>> +Instead, the device MUST send the notification after the SUSPEND bit has
>> been cleared.
>> +
>> +When the driver sets SUSPEND, the device MUST either suspend itself or set
>> DEVICE_NEEDS_RESET if failed to suspend.
>> +
>> +If SUSPEND is set in \field{device status}, when the driver clears
>> +SUSPEND, the device MUST either resume normal operation or set
>> DEVICE_NEEDS_RESET.
>> +
>> +When the driver sets SUSPEND,
>> +the device SHOULD perform the following actions before presenting that
>> the SUSPEND bit is set to 1 in the \field{device status}:
>> +
>> +\begin{itemize}
>> +\item Stop processing more buffers of any virtqueues \item Wait until
>> +all buffers that are being processed have been used.
>> +\item Send used buffer notifications to the driver.
>> +\end{itemize}
>> +
>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>>
>>  Virtio can use various different buses, thus the standard is split @@ -872,6
>> +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature
>> Bits}
>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
>> for
>>  	handling features reserved for future use.
>>
>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
>> +   trigger suspending the device via the SUSPEND flag
>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>> +
>>  \end{description}
>>
>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>> --
>> 2.45.2
>>

