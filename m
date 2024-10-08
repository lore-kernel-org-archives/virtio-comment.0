Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D220208B8
	for <virtio-comment@lists.linux.dev>; Tue,  8 Oct 2024 03:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728358430; cv=fail; b=Di/8iP1TxcLBe4xJOyfVqa0R5Lih/tzkgaqSeH+RgZXYfLfTz/7VZMc+n6iXk1rHAVrirOUThA4uprxD+0PfKit/1dwDrfR0uwb4/jMXCtPC1j8SIH9xNrhJDJEgeY3+HFwKVwfJyPThVnIKyEX1MB6iUZK57xAyzfeAUnKDLbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728358430; c=relaxed/simple;
	bh=WLhMDzY1xe3TPYY+1tuolmhbCwCpJsaKdUA1YLUhcOY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ex+rgWL0AshmSaBQ6nNNZBt6hMFAkNyx8gbV/jUgA3cXUQ36SbmvRnq3ISMB57GUyP8XNY3xo0mZ9C9AsY55mdAMtc3nHOsknB2dgfMt/RvilEAZ5Oa6zxOaAnQzZLmQR+mjV17dak6IrM2+4OYyU2FigCmPSyuJVgPIIETk+lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mObuc8qs; arc=fail smtp.client-ip=40.107.93.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mObuc8qs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzUTaf//St0RmyhZLZ8W9K1klt6UuxuXAwYoikHIAicEObYgj4MokdCajGX70RRt5p8liLDzNG2DkgrJswisqKV0X3KlmHlA9RgR5rfRds6BUVp8UTRGxNH92ytnJgigLFMbqt4SM5PCFn4wmuJVFCNIYWkPo4tdRosSkrJiwwHPQ6SAFzMeUB1xto+I9+6IiMpj73b4twwYCQDkB8JPZC5TyIfkA9r8DqU8aiDrEqomV19z1Mm4ZfIE47r9M3W5otxIzKN1+Vc5eSTrqZeQzKOtoiSAgfL9wUzromCodPHW+K9uusRbL8xbUYsZQA6PyBkRz0KQUKNCJoL41E5mwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ky920KL1th45ojUF2Hq3jO/HGO7h31tYRQykYIt+q8o=;
 b=aU5nJlQZDx019gJZxjfMO/pXtf3dqfbwTV0Lsfl/f3jXKTgvvGxKQf+BfUUCEYA+px47NNFpxe1cVy4vm1RSSmWGLCo2NzsdqOd2GW3U7bozaTGkyjc5FIWAWs+KrKteTtjBx0a1yZSN+2Lsjj6L/pZGDL/TWBjGFI00w5aHEFAdNiUsdg5zp28RpYBBXah+bFE022UKQwjZ8SeC96VvmIBE7+KaV8WuHGWBdUdm3cwMoGljeuDL1kyM8Eb2OA5cCR4K1xHs56Wj/8z9LuiuhDyyDAiu19k1frC97RuopUmOznsU6Sy0VRZtxL9k0iUEBBHvviEsbLcXNqkumRJgGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ky920KL1th45ojUF2Hq3jO/HGO7h31tYRQykYIt+q8o=;
 b=mObuc8qszyVbMtS+O/qiGWGtmd7kYGSMWFtGz3R5Hb0HSOm+sR4FjGw3GWczy5H3wMpmR8eJv+h7/xEsQvSULe4IyLOIBxrfJNocejOfvmGe1Y788NcTPzODFoVTqUWfrIVn1wgrBcCPjSON8EpmKX769fRiFS/RgRJDrzO5aHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by PH7PR12MB7233.namprd12.prod.outlook.com (2603:10b6:510:204::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 03:33:44 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 03:33:44 +0000
Message-ID: <56046b85-4eab-4699-b2ea-8c950db40468@amd.com>
Date: Tue, 8 Oct 2024 11:33:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] transport-pci: Add MSI support
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "mie@igel.co.jp" <mie@igel.co.jp>
References: <20240712140144.12066-1-manivannan.sadhasivam@linaro.org>
 <20240724162143.GH3349@thinkpad> <20240903053218.7lapwvllgz4xk4se@thinkpad>
 <IA0PR12MB8713D97523757F1FDD6D3525DC762@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240930022818-mutt-send-email-mst@kernel.org>
 <8f7a2626-f066-4a49-af09-9b83e95ca0a6@amd.com>
 <20240930095245-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240930095245-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0154.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::14) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|PH7PR12MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d14fab-50de-4e1e-4d91-08dce74a0300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3NQTWthclB0WEs3Ky8vK25ZYXVFSTlBQk9tSkMzbkpKckhlOW9lMkl3Mm0w?=
 =?utf-8?B?SXNYR1F3VGFLY212U1NhVmV1dU1ZRFJKbTZTbmtZd1c4RE5CQkJLK2Q4SlFo?=
 =?utf-8?B?YUdFWGswQnJ1bVZhaFBpUFROcVZwZ3g3Y28xOXJ1N2dCM2hkTGJnM1VRNGxy?=
 =?utf-8?B?UllRYXFCYW1IaTRCTFYxMU1iTmFVd0kwK0dFeGZYRStKaGlZV0puZS82YWF0?=
 =?utf-8?B?QWdOZ3JHK1NIbjl5YjRGNm8raS95MjRUTVRDUzdSWDJsOUJqQkl4azJaYTJh?=
 =?utf-8?B?NmY2RWpDejhULzM0Z1FyYXhmSUNXbDYyL056Mm9pT2J2c0phemcxQ05EdHdN?=
 =?utf-8?B?Z0Q2YW1qU3VwbkNhZlVXdXJqNDdCZVlBZVRUTE81RzB3L1hyeHh2K0UzeFVR?=
 =?utf-8?B?TTVyWm40YVVsd1JwZklYVFhpU3NhN0lRd1dZU3RFRjJXZERHNk5weGFpNjU1?=
 =?utf-8?B?YjNnWFJqckY4NFFTbE5jZXJvVVJlQ1RSRkI4ZWtBTm5BdTlwdzVYUVRiRUVw?=
 =?utf-8?B?TnRjZ1g3S3c1R2MwWWJZQ2FvZHR0ZzlNNGVyeldjNXVlNERSNFduZ2FFalRB?=
 =?utf-8?B?R1NNMG12bThQTGlWTVRJMDl1eUQ1bndkYStnYzlyUlNDYWxBWWpiU3RJYkVK?=
 =?utf-8?B?TXhVRXNoK09RWUljMFUrNElCRlBkeVc1OEViL3N4dU41YWNLRFcyOXQrZ051?=
 =?utf-8?B?WXhldE5KS3NqQWVjdHVMQUs0ZzZ4TmxFdmkvcG15aE1QMkxZelJRYU9GOHNt?=
 =?utf-8?B?cE1oWVRScHdOVFNEaDd4WUJJMnZVUmtZNkJmTk15eks0QWwwelB4K3dGaTJX?=
 =?utf-8?B?SUM0Y3NMUnNzQ2RQMHNTYWdBMVRUbStLaHJQWHBFd0wrRHgyaXh0SGFsNXVr?=
 =?utf-8?B?N0ZaTGFxbE41MWdOYlUwWHh1VkpYSVlIR1NRTENXTm4zblZ6VEpFR0ZsZHVp?=
 =?utf-8?B?S3Z2cE8yTnVkaW5BVjh0ZWhUNHltNnRGcnVudlNZaEw1S3UyOVJ5YXVjYVI2?=
 =?utf-8?B?WjJkRzZ0d0tSSWRselBTeWdrODN2U0NXZWQwbXFNeGJ0bjBRaHNDTkZRRUdh?=
 =?utf-8?B?dGZ3MU1vc2VhbTNlQVV6UCtBQ0RkbGpyOFF2elR1MjVVYkpUclVSeWVVVlNZ?=
 =?utf-8?B?bytUUEdtSGJ0YnBWdkE0VGV4cS9VQWlxVnNOOVkyVm42UUx4dk9JaU51bFdK?=
 =?utf-8?B?V0dSQ3BYS0NiRjRoRFdzMVFsZ2UyZHZTNkJmeXByVzYxZURkWGJPRlFMbElz?=
 =?utf-8?B?MGtvbmJ1UDZscDdSaTQzTTJxNGRnQmJyVjlVbWczSGZDS1dQZG5kbzllS0tK?=
 =?utf-8?B?RUNwNmp5Vys4UUYwWExRUGlydlVOOG1KbS9RWW1UeUJVNlBsU0d0b095aTRJ?=
 =?utf-8?B?ZmJpQ2dsL0VQUHlWRDA1VVdaNENEMUtGRzh3NlRqanFmS3JkVWJPRUFkTkdT?=
 =?utf-8?B?aS9CNjZUUHFVeEczYVlScnd6YXlWY2lkQktWa2lvRGRoazdNY040V0QvSDFj?=
 =?utf-8?B?M0lZN1ZCSnJhVXFJUjV0QnZ1bTBDd3lCaVB3OGZ5cmRXSTZXUExzdlpVODVz?=
 =?utf-8?B?V2ZObDh2R0QySE5kOW8wQjhFaWFkK2o3blZocGVLaVRVNk1MWktJVFUxUmZn?=
 =?utf-8?B?S01aTHp4ZWxhblJNK3hyZGFUaCtXU1FKaFVZeEVrUVYyeEt0cmJVdFJ4WVhl?=
 =?utf-8?B?Q1FYdm8rWmJpRHhycGtDZWV4ZCtsTDhKeHpsSEZDd1pJdWY1dWRWbE13PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFY3c01aWXNBN25ENlJQTXhwc0dZOUFNNDJySGpNZ0JIQVVnaUJONDZNZXh3?=
 =?utf-8?B?RzVacHd4NXltMG1vYTRZL1c4VjRtOGJUOXkxclFVcnZ6cmRucU1IckV6bVFL?=
 =?utf-8?B?TE42TnJKZU9DaE9JME9pR2RoK01qQ2Y4YXBYUFJhU0pMSUNNaUpUa0Rwc0N2?=
 =?utf-8?B?ZEY5bDlObTVUdVhDeHNIRXIxYS9tQmd5NDE3NXRyS2pRcDYrb0tGUXJHTlFn?=
 =?utf-8?B?UVM5KzU2dVVkYjZIV1pobmcyWEpoV2pIeGlxU3V6ZVBPRjg5bW1HNmg3TWc3?=
 =?utf-8?B?dC9rbkZRYmc4UUVnaXhPTFJtZkNFS0JJL1Q5bmM3ZDZtdWJGYVhkOGdJSTdE?=
 =?utf-8?B?a3R2L2szaDRic3h3eWpXb0xrbzN1OVJGZFI0MU92eGpTRFNjYlMyc3FpLzRs?=
 =?utf-8?B?MlFNbzk0T1BqRGJkQmk4enl5MG5GazlQc083WEZjWVQxZUhUQmRzU0kxY3o2?=
 =?utf-8?B?RWNaZElaaGx5ci9iZEErZ3RYRmlPcXFvbzh6U1M1S3hxekwvOWRLYUdFYlhi?=
 =?utf-8?B?My9OQ3dxV1kyUXlGMExVdFUzdzFVSVNYa1pBSEw1cHlYc0tRemI5WDlYeHdV?=
 =?utf-8?B?aWMxZS9CNDJNMERYTW9LYlByUXdKM3grd005enF5bnNPNllKbElQSzNIUEc3?=
 =?utf-8?B?ODlYYy8za04zM21wZHhwbDRnMHozTERDOEdXNkRRcE9QNlFCKy8xNHFxcUp6?=
 =?utf-8?B?dTBGMEVvZEdycForUjI2YmhJaUd5VUJjODlvZTRXamdtSFhMb09iUHRaVVBa?=
 =?utf-8?B?cWN3QjgrSGN0WUR6N3NlZTNTcmdaTnlndW5DMlFMMkRGVTdTemg3eWFXSXNH?=
 =?utf-8?B?a2pJUHM1cVZNT2dKQitUNXRua2F2ck5pL3FCU2o2U2ViMUN6NWQrSC9RNzFG?=
 =?utf-8?B?TFVzc0FNWUlXMnZMRFZMVkV5Rmp2dEgzZ1R2WkMwVW96TnlNRjFSUWdPdzc4?=
 =?utf-8?B?d2dxT3VRT1FYSUw2alBtOEdEYmo0SmRmTTNYd3ZydEkyVzR3Yks3RzdRaXE3?=
 =?utf-8?B?MEtBaE9DbmJPSzh0OXZQUVFXVnVIcE5jTUhpcGpBZFIyUmJvVGNJdUlVcmtT?=
 =?utf-8?B?YWY4dlRyTU5rcEdkbDNnQmFNbEdaREplL0NYT1RzREt1VUVRaXVMam96WGdr?=
 =?utf-8?B?ckU2ODdKR01HWlh2WHhNU2NkV0g1RktMVW4zcHdLT0dpbVZlbW5RWUtRTHg4?=
 =?utf-8?B?MXBxN1U4bko4WWg0d3pEYy9tdFNJellCNnFvam4vY2t3VkhUTzd3ay8vRVli?=
 =?utf-8?B?VmpSVFFGZ0E1MGFCaGNmWjdjT0JHbHhsb2ZmQ2MycHoyU0hwdnNYSUpMc0tG?=
 =?utf-8?B?YWNDaGFWUEh1YkpDMm1JNHIvVmdZai9uYXBqNnlOWG1JV2RocU9ua1J1VVBs?=
 =?utf-8?B?VHYyOFczTkNUOEFONElRZ3htM2UrYS9sZ0EyaE5QTHc5WXdqaSsxQWF2RHN2?=
 =?utf-8?B?L1FZUnN6bWNJRDFZMzNSR3d5WVZrSS81R2Eva1lKZjRjdVJXcnJwT0VJWStC?=
 =?utf-8?B?eEJkN3RXNURLU0phNVEyV3FMTG1EMkRlOUhMRU1oRHlldm9FL0ZUb2JQYTZW?=
 =?utf-8?B?NndPdisrMURVbkcwNGF1VUxuWWIrbE9uaFduOS9ubm9tSExyVWNpTmR2UjRh?=
 =?utf-8?B?UVlWallHVG8rdnIwZ2lueUh3RCtQbmJrZVV0OHI0SXg4c0ZqNHhkaS9OUHpm?=
 =?utf-8?B?NzQyVm54TzRncXk3RlNVbW9IWmkwOS9sUnA1WTIrMElnS1pXSFM4NXBsckpM?=
 =?utf-8?B?ZmFwaUxYN1Y4dXZ3NmdIUU1FOTIzeG1lelg3dE43QW9VRTFlYjNDWXhUUlFo?=
 =?utf-8?B?N1FydVZKdlV5K3A4Z2ljbTZxUG93cU8wTTlsU29McGxqWGNjUzJZSEhSeDIy?=
 =?utf-8?B?SU13aUVVOFJsa0dDZnlobThYcnJQS1Qzb3llakR2dTROT3NHWG9mYTNKUmhx?=
 =?utf-8?B?MklUamdrOTM1QllGbXk1QXZLdEVBQ0d5ZFM4S0ZVcHMrWG85NWJheGY1OVc3?=
 =?utf-8?B?NEJGSmFDZnhmOGs4VXVSWjh3NEtxS0xSYXYwR3VZblNrMFNFVDNOeklpNTk5?=
 =?utf-8?B?WnBDRmVqUDJvVGNSN0cyMEtBNGJHakNWOEk0SVBzdjVMd0NVdVMvSU5QaWcy?=
 =?utf-8?Q?2a8xlcDyfAuNS1aZnFUHmcziZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d14fab-50de-4e1e-4d91-08dce74a0300
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 03:33:44.5879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Udzziu1v8OzKsRSCuzC3q9U5u0wtQSGMwVDPhuME7VCArG4OU7ScKpTcllx0VSsP42cpRhtm0nuGsT9lMGe+2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7233

On 9/30/2024 9:53 PM, Michael S. Tsirkin wrote:
> On Mon, Sep 30, 2024 at 02:42:40PM +0800, Zhu Lingshan wrote:
>> On 9/30/2024 2:30 PM, Michael S. Tsirkin wrote:
>>> On Mon, Sep 30, 2024 at 05:45:48AM +0000, Parav Pandit wrote:
>>>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>>> Sent: Tuesday, September 3, 2024 11:02 AM
>>>>>
>>>>> On Wed, Jul 24, 2024 at 09:51:43PM +0530, Manivannan Sadhasivam wrote:
>>>>>> On Fri, Jul 12, 2024 at 07:31:44PM +0530, Manivannan Sadhasivam wrote:
>>>>>>> MSI is the predecessor of MSI-X that allows PCIe devices to send
>>>>>>> interrupts to the host. Compared to MSI-X, MSI supports only a
>>>>>>> maximum of 32 vectors per PCIe function. But MSI has been widely
>>>>>>> supported by the PCIe devices requiring fewer interrupts such as
>>>>> Modems, WLAN cards etc...
>>>>>>> Currently, Virtio spec only documents MSI-X and INTX interrupt
>>>>>>> mechanisms for the PCI transport. So if a Virtio device based on PCI
>>>>>>> transport supports only MSI, then the driver on the guest will only
>>>>>>> use INTX for receiving the interrupts. This is really sub-optimal
>>>>>>> and affects the performance of the device. Because with MSI, the
>>>>>>> device can use one vector per queue (max of 32 vectors) thus
>>>>>>> avoiding the overhead associated with a shared INTX vector.
>>>>>>>
>>>>>>> Hence, add support for MSI to the Virtio PCI transport. MSI support
>>>>>>> is added such a way that it reuses the existing infrastructure of
>>>>>>> MSI-X, like the config_msix_vector/queue_msix_vector fields of the
>>>>>>> Virtio common config structure. This makes it easy for the Virtio
>>>>>>> drivers to add MSI support without any disruptive changes.
>>>>>>>
>>>>>> Gentle ping!
>>>>>>
>>>>> Ping again. Virtio maintainers, can you please share some feedback?
>>>>>
>>>> Overall looks to me.
>>>> A small comment below on single MSI vector.
>>>>
>>>>  
>>>>> - Mani
>>>>>
>>>>>> - Mani
>>>>>>
>>>>>>> Signed-off-by: Manivannan Sadhasivam
>>>>>>> <manivannan.sadhasivam@linaro.org>
>>>>>>> ---
>>>>>>>
>>>>>>> Changes in v2:
>>>>>>>
>>>>>>> * Fixed a spelling mistake in commit message
>>>>>>> * Removed update to legacy interface
>>>>>>> * Used 'MSI vector' consistently
>>>>>>>
>>>>>>>  transport-pci.tex | 115
>>>>>>> ++++++++++++++++++++++++++++++++++++----------
>>>>>>>  1 file changed, 92 insertions(+), 23 deletions(-)
>>>>>>>
>>>>>>> diff --git a/transport-pci.tex b/transport-pci.tex index
>>>>>>> a5c6719..fd92641 100644
>>>>>>> --- a/transport-pci.tex
>>>>>>> +++ b/transport-pci.tex
>>>>>>> @@ -347,7 +347,7 @@ \subsubsection{Common configuration structure
>>>>> layout}\label{sec:Virtio Transport
>>>>>>>          Driver Feature Bits selected by \field{driver_feature_select}.
>>>>>>>
>>>>>>>  \item[\field{config_msix_vector}]
>>>>>>> -        Set by the driver to the MSI-X vector for configuration change
>>>>> notifications.
>>>>>>> +        Set by the driver to the MSI/MSI-X vector for configuration change
>>>>> notifications.
>>>>>>>  \item[\field{num_queues}]
>>>>>>>          The device specifies the maximum number of virtqueues supported
>>>>> here.
>>>>>>> @@ -371,7 +371,7 @@ \subsubsection{Common configuration structure
>>>>> layout}\label{sec:Virtio Transport
>>>>>>>          A 0 means the queue is unavailable.
>>>>>>>
>>>>>>>  \item[\field{queue_msix_vector}]
>>>>>>> -        Set by the driver to the MSI-X vector for virtqueue notifications.
>>>>>>> +        Set by the driver to the MSI/MSI-X vector for virtqueue
>>>>> notifications.
>>>>>>>  \item[\field{queue_enable}]
>>>>>>>          The driver uses this to selectively prevent the device from executing
>>>>> requests from this virtqueue.
>>>>>>> @@ -631,11 +631,11 @@ \subsubsection{ISR status
>>>>>>> capability}\label{sec:Virtio Transport Options / Virti  in
>>>>>>> \field{ISR status} before sending a device configuration  change
>>>>> notification to the driver.
>>>>>>> -If MSI-X capability is disabled, the device MUST set the Queue
>>>>>>> +If MSI/MSI-X capability is disabled, the device MUST set the Queue
>>>>>>>  Interrupt bit in \field{ISR status} before sending a virtqueue
>>>>>>> notification to the driver.
>>>>>>>
>>>>>>> -If MSI-X capability is disabled, the device MUST set the Interrupt
>>>>>>> Status
>>>>>>> +If MSI/MSI-X capability is disabled, the device MUST set the
>>>>>>> +Interrupt Status
>>>>>>>  bit in the PCI Status register in the PCI Configuration Header of
>>>>>>> the device to the logical OR of all bits in \field{ISR status} of
>>>>>>> the device.  The device then asserts/deasserts INT\#x interrupts
>>>>>>> unless masked @@ -645,7 +645,7 @@ \subsubsection{ISR status
>>>>>>> capability}\label{sec:Virtio Transport Options / Virti
>>>>>>>
>>>>>>>  \drivernormative{\paragraph}{ISR status capability}{Virtio
>>>>>>> Transport Options / Virtio Over PCI Bus / PCI Device Layout / ISR
>>>>>>> status capability}
>>>>>>>
>>>>>>> -If MSI-X capability is enabled, the driver SHOULD NOT access
>>>>>>> +If MSI/MSI-X capability is enabled, the driver SHOULD NOT access
>>>>>>>  \field{ISR status} upon detecting a Queue Interrupt.
>>>>>>>
>>>>>>>  \subsubsection{Device-specific configuration}\label{sec:Virtio
>>>>>>> Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>>>>>>> Device-specific configuration} @@ -1017,7 +1017,7 @@
>>>>>>> \subsubsection{Device Initialization}\label{sec:Virtio Transport
>>>>>>> Options / Virti  \drivernormative{\subparagraph}{MSI-X Vector
>>>>>>> Configuration}{Virtio Transport Options / Virtio Over PCI Bus /
>>>>>>> PCI-specific Initialization And Device Operation / Device
>>>>>>> Initialization / MSI-X Vector Configuration}
>>>>>>>
>>>>>>>  Driver MUST support device with any MSI-X Table Size 0 to 0x7FF.
>>>>>>> -Driver MAY fall back on using INT\#x interrupts for a device
>>>>>>> +Driver MAY fall back on using MSI or INT\#x interrupts for a device
>>>>>>>  which only supports one MSI-X vector (MSI-X Table Size = 0).
>>>>>>>
>>>>>>>  Driver MAY interpret the Table Size as a hint from the device @@
>>>>>>> -1034,6 +1034,75 @@ \subsubsection{Device
>>>>>>> Initialization}\label{sec:Virtio Transport Options / Virti  the
>>>>>>> driver MAY retry mapping with fewer vectors, disable MSI-X  or report
>>>>> device failure.
>>>>>>> +\paragraph{MSI Vector Configuration}\label{sec:Virtio Transport
>>>>>>> +Options / Virtio Over PCI Bus / PCI-specific Initialization And
>>>>>>> +Device Operation / Device Initialization / MSI Vector
>>>>>>> +Configuration}
>>>>>>> +
>>>>>>> +When MSI capability is present and enabled in the device (through
>>>>>>> +standard PCI configuration space) \field{config_msix_vector} and
>>>>>>> +\field{queue_msix_vector} are used to map configuration change and
>>>>> queue interrupts to MSI vectors. In this case, the ISR Status is unused.
>>>>>>> +
>>>>>>> +Writing a valid MSI vector, 0 to 0x1F, to
>>>>>>> +\field{config_msix_vector}/\field{queue_msix_vector} maps
>>>>>>> +interrupts triggered by the configuration change/selected queue
>>>>>>> +events respectively to the corresponding MSI vector. To disable
>>>>>>> +interrupts for an event type, the driver unmaps this event by
>>>>>>> +writing a special NO_VECTOR
>>>>>>> +value:
>>>>>>> +
>>>>>>> +\begin{lstlisting}
>>>>>>> +/* Vector value used to disable MSI for queue */
>>>>>>> +#define VIRTIO_MSI_NO_VECTOR            0xffff
>>>>>>> +\end{lstlisting}
>>>>>>> +
>>>>>>> +Note that mapping an event to vector might require device to
>>>>>>> +allocate internal device resources, and thus could fail.
>>>>>>> +
>>>>>>> +\devicenormative{\subparagraph}{MSI Vector Configuration}{Virtio
>>>>>>> +Transport Options / Virtio Over PCI Bus / PCI-specific
>>>>>>> +Initialization And Device Operation / Device Initialization / MSI
>>>>>>> +Vector Configuration}
>>>>>>> +
>>>>>>> +A device that has an MSI capability SHOULD support at least 2 and
>>>>>>> +at most 0x20 MSI vectors.
>>>>>>> +Device MUST report the number of vectors supported in
>>>>>>> +\field{Multiple Message Capable} field in the MSI Capability as
>>>>>>> +specified in \hyperref[intro:PCI]{[PCI]}.
>>>>>>> +The device SHOULD restrict the reported MSI Multiple Message
>>>>>>> +Capable field to a value that might benefit system performance.
>>>>>>> +\begin{note}
>>>>>>> +For example, a device which does not expect to send interrupts at a
>>>>>>> +high rate might only specify 2 MSI vectors.
>>>>>>> +\end{note}
>>>>>>> +Device MUST support mapping any event type to any valid vector 0 to
>>>>>>> +number of MSI vectors specified in \field{Multiple Message Capable}
>>>>> field.
>>>>>>> +Device MUST support unmapping any event type.
>>>>>>> +
>>>>>>> +The device MUST return vector mapped to a given event, (NO_VECTOR
>>>>>>> +if unmapped) on read of
>>>>> \field{config_msix_vector}/\field{queue_msix_vector}.
>>>>>>> +The device MUST have all queue and configuration change events
>>>>>>> +unmapped upon reset.
>>>>>>> +
>>>>>>> +Devices SHOULD NOT cause mapping an event to vector to fail unless
>>>>>>> +it is impossible for the device to satisfy the mapping request.
>>>>>>> +Devices MUST report mapping failures by returning the NO_VECTOR
>>>>>>> +value when the relevant
>>>>>>> +\field{config_msix_vector}/\field{queue_msix_vector} field is read.
>>>>>>> +
>>>>>>> +\drivernormative{\subparagraph}{MSI Vector Configuration}{Virtio
>>>>>>> +Transport Options / Virtio Over PCI Bus / PCI-specific
>>>>>>> +Initialization And Device Operation / Device Initialization / MSI
>>>>>>> +Vector Configuration}
>>>>>>> +
>>>>>>> +Driver MUST support device with any MSI vector from 0 to 0x1F.
>>>>>>> +Driver MAY fall back on using INT\#x interrupts for a device which
>>>>>>> +only supports one MSI vector (MSI Multiple Message Capable = 0).
>>>>>>> +
>>>> A single MSI (and MSI-X) vector is still far more optimal than INTx due to the inefficiency of the INTx delivery on PCIe transport.
>>> And lack of support on VFs.
>>>
>>>> And for sw based devices, it anyway doesnt matter a lot either.
>>>>
>>>> So when a new functionality like MSI is added, it does not need to continue what MSI-X has done.
>>>>
>>>> So I request you to remove this guidance of INTx fallback on single MSI vector.
>>> Let's provide an alternative guidance then.
>>> Device SHOULD implement at least 2 MSI vectors?
>> I think one MSI vector is enough for functionalities, just shared by all interrupts.
>>
>> Thanks
>> Zhu Lingshan
>
> Within a VM, this forces an vmexit to check ISR on each interrupt.
> Not good.
True, but one vector mode is still the minimal requirements even with some
performance overhead. This mode has been verified on ifcvf and virtio should
not fail when the platform can provide only one vector.

Thanks
Zhu Lingshan
>
>>>> Rest all looks fine to me.

