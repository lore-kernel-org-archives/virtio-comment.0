Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D281428E5
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720774519; cv=fail; b=qIQTdloWcx2xRsF9nXY2XgpVqWituYzc3akcmOgsYp18Wc6q1ddw03UDgg8UYERlQ2oqKaYccIZV7ipP47Tj1w6GAnAvayWC+tY6r9oP/6k2I7ScAQer/VKTJieJZLFFwVXwCACUEC/Ti6GFN0ohWzawP22An4KRzc1PFD/5JfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720774519; c=relaxed/simple;
	bh=r7TUe96n14cLeuMd+phdrlrTgIH4TQTr537TAZ1QdjI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=olkSvpqGEEL+00UBgcnIkd44iNvpDbwPmj19Ymop0pngSY0Ett88ukte6rXFZ3pJjuH78nfBfzi42rprf8cBaQL3zX9I1URA0zrj2OFtnYXSBI/VCcj1SDrAiHlZlDmjDDjTU2QnwBSkwCrjnzsR+HKLs+fsy77wV9uXaP6wYIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oaYWREDn; arc=fail smtp.client-ip=40.107.93.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oaYWREDn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhyIuEQSGAEaM6MYykxEQ29xiP9TUrkgfkBqjTar4YYsqZRpED4FEz4MLwp8xhX0V6CKbkAjKTnwZUiaSevi+4U/HXVkDw3MFIqS2vZWDa5jNwtV4eoL+6SHMSI/ev7MQ5A6a7DAXDpGZ/uuANkKz9+Ed+Tm2PHpeYmfr35MH4UASohiYkt2IsoE8/uQPBBBey4JqQqnDeUm2twC+b6c4MRq3Fd5lFTcDV7GthDbsCEVYfuQb2Gmrl2MgIhPKyV8QeraH/AayJnsYIkSRwHhMXNgFxvwAtLFaH6IWC3dHIt5UdrPyW81UzBz2nnzTRAZiB/vDd4ZDSwk/K+8gRZ61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6ztoBkPb+bq20b4Nswc8rBP2EH76b+7N2njMy6KxL0=;
 b=TpQLktQwUfqb8XCHToUpFQQwq2SGFet0Kn4E4o3f+Bj+bG8aLB+SKlaiFzZn7UFePlHraK2gdGmMdAVmk3lrgossspjWJ1iXQilYvydg6mZgbhbm+KP8AyJLL7syLM54T6qzN3y5qY5tCgKiTw+hizdDNI5Ry591mpwII+h9K2l+GArXNMcd2dww8chsMGUSjo1+rN/LYo9/vT79d0Wma1PyOvoASCaJS6K5vr/egWxzKG7OgGkmqBN6D0w1WF1f7YbylJev4Gks7C2kvGJd6Gr1sKQ5JUzOOq8xyL2AZoO64BLB0/3LRAcCHHAx4uADi5CfE7N1XV6LtkXAINfjEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6ztoBkPb+bq20b4Nswc8rBP2EH76b+7N2njMy6KxL0=;
 b=oaYWREDnPwBiX8fWo+WCHnnOAeeMfQHDcfuFfG2ztHSZWQ/OVNyyGcfWCQKaK7RxpC5EmMA07XryjuinSjrZyMJyrB/kau+vumRLAS/xrWvQemgzkbz9RSNFh+BQIRdbVZoorVC9+zuQUudz5hJ31WCIxnMNDRxyWgwkj4pPXPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by SA1PR12MB6871.namprd12.prod.outlook.com (2603:10b6:806:25f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19; Fri, 12 Jul
 2024 08:55:13 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7741.027; Fri, 12 Jul 2024
 08:55:13 +0000
Message-ID: <c5b01b82-0db7-449b-bd76-553356ae80db@amd.com>
Date: Fri, 12 Jul 2024 16:55:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v6] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: cohuck@redhat.com, jasowang@redhat.com, virtio-comment@lists.linux.dev,
 Zhu Lingshan <lingshan.zhu@intel.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, David Stevens <stevensd@chromium.org>
References: <20240703031057.37565-1-lingshan.zhu@amd.com>
 <20240703044005-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240703044005-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:404:56::22) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|SA1PR12MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc8c6bd-bbfa-4297-dcc3-08dca25057a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ym1GNjArQldGNFdlbDh5cFVUbXM3aW1PVy9oSUlzTGdFOTRLWlp0ZXpaL2FG?=
 =?utf-8?B?aXhxQi9hTVJNV1MyRVVNQUlGQ3FYbmpMSzQvdVRGVVFWempwRVFjcVpyVVVw?=
 =?utf-8?B?TDZFOVlKT05kTXRVRktPY1ZMWlJuZ3dvY3BYVWkxY2tVUTNYbEt5ZmJjcmhp?=
 =?utf-8?B?MzBtVUkvdzlueG9EVWdVTEpJWFhCcTNxeWdZZy8wUGh2SHhwUzRZUEg3MExl?=
 =?utf-8?B?ZHZnWlRnVExzMlg0Ny84WjdYQjVOWndHTStjQXBuaWxlMDlGTzRPT2VrSk9N?=
 =?utf-8?B?QWFuRTh0TDIvYXpiK1NBeFdiMHk5UFZBTzA2QjhzVi9zV0dBSG5LQVZRTHlw?=
 =?utf-8?B?c2x3TzVIQVVKeFdVTFZWcjRuU0F3N3NVRlkvSU5xQWtnNzZyd3pNKzBpaEZH?=
 =?utf-8?B?dEhsWThZZytUWkRyYlIrZlNLRk9PYldCNWNScytkWE9GSEJ4WmNEMXpLM2Rx?=
 =?utf-8?B?TENJRjVTVFF0QnRFWXQzUDYxOGZCNGhmZ0toZU5PRnFwN3puRHZMYnhMeWZW?=
 =?utf-8?B?dXpPYzRSSjNoallCSncxTUJ0RC9Da3FJeE9KU2FLeFNwZG9WMVlMOUl0ZVZH?=
 =?utf-8?B?a0VibHhNUHhTeGRkQ0dPZUR2UnFlaUZwNDBadTcvQVdDYXNBRi93Vkc4TUV2?=
 =?utf-8?B?OHBvR1VUS2YvVURLRGxCMFJTZGZLeFpTYUQ2U1o1cjU2eDBkVS9nM0QzdDBT?=
 =?utf-8?B?TTZQd2N6SFBNcFdsdXdnY2ozVnFMcjFBbnZGNWVUVUR5UUxmZ1FFOVhnS2ow?=
 =?utf-8?B?RFczSXRLNFRXRFFNeUFtd1dLWVFhZitMbFE2RmdMUTBiWklvM3ArV0VHZ0xB?=
 =?utf-8?B?UFNod3pFcHphb0VlbXVMdG1tb2d5V3ZyK3hOSEVBQUpPZzFaNXV4KzZySmds?=
 =?utf-8?B?c2c2cS9WallWbWVEY0lwWFNMNmQrbEJVZEgxWjJwYTFtc2hja1ZlQ2N4RVAv?=
 =?utf-8?B?Y1AvUWNrWTgzSGt1YXVCWERHM2NTZUNmYUxEcm8vRGxSR0dYTjBSMk9uNE4v?=
 =?utf-8?B?UXhObmJUZWtpL1dHTi9pRkV4QnNYWlo0UVk3Rzc2WkNVUUZRb3pSMjdQakdw?=
 =?utf-8?B?eExLQ2ZBYW15WWM1MVZjd2tmbGxsY1pvZUJPM2VZbUFSWERDeTBOR25lUlFW?=
 =?utf-8?B?ZERMVkxFR3MzMitDdUVraEsyVEgxUVY5aFRTZHk0R1Q2UjNiYVFXWkJ1dGJp?=
 =?utf-8?B?M3czdzdIUXNjMWl4ZlR5TWEvVVBOR0ZzTUxjWW1nQStIcGZMblNkNnkrcVE4?=
 =?utf-8?B?QnpBanBiQURLWUNHaU5wVTcyWW1VVDE2ZVpCVTBEelVKL2xHbGVoa0owbjVk?=
 =?utf-8?B?ZzlESU1iSjZPcy90UlFkUGN4bzFjTlNpbWNWN3pDVk1MdzdBdzNqMW8zTE5y?=
 =?utf-8?B?MFFlS3BlOWo1SWRSOFhKZVRRYWRkVWtYQ1h4L082ZzhQNDZrbzRRKzg2VEVq?=
 =?utf-8?B?MWhuYnl1RTU5Q243SnpZMG04ZENZdEpJSzlmMkFIYS9MK0wrSW9hallyWkU2?=
 =?utf-8?B?azdabmptV05iUWtMZnhCY2Vzdm9yaE0xUmVHZ0Z3eFJrTnFreE50ZnIrbVNr?=
 =?utf-8?B?S2Vib1BZMEpYOEYycnkwUkRDQ2Vmb3VoWnRVMTZqN3Z6KzgyeVQ3Y0RaNkdE?=
 =?utf-8?B?QTRXb0RSc1dvL3dBdDE0RXZRb3h0a0Q2V0tDTVZMYnpyTXVmdjF0c21QK0NI?=
 =?utf-8?B?VE9nZmZzREJ2OThEY3JjZkFtc1R5RTJiVGFLZEpTcXZQTWkweWlnMzhCN0Nl?=
 =?utf-8?B?amd3SkFFVHN1Ym44WlRHMy85V0RRc0o2REEzS3QrZllkYWlsQzBlRDd6b3pr?=
 =?utf-8?B?NG9hemlxTDhNdnplYjdTZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkFWeSt1ZnJIc1NHK0JRY1pHcWlJZ1BXVm8ya0ZFYnRNU3U0TExEL2NYeVl3?=
 =?utf-8?B?ZW5CK0duNGk0UnFUUDNoUzBxeGF1T0RBb0d0N0tRWlVUTGltSDdXRmJ0ZUU3?=
 =?utf-8?B?bm1NSzZJVjFueXNMVTRnaEJqd3o4aktrekVYY0RKNUNaZWFpY1dMTzZPVUVR?=
 =?utf-8?B?dndRVUJWWjFWZUJhV1ZzRTNIcXNRZVVOUERFdzZLaEpscDVVbGVhSTNYbW4r?=
 =?utf-8?B?UWJiV3dtbUZEUHpoRks0UnRQV1R1aEZHQ2o1OXp6Q01DNTFvU0N4ZFVZNW9t?=
 =?utf-8?B?bW5DQ25BcWRRS0tOdnJaWTJOL1FaVEd3UDRjQXpSdVRMbnZiOWtURy9SY1Jo?=
 =?utf-8?B?WE9Lb2V3Z2tnU3FJMjRadkdzZkw5eng4RlZ1cjVDcklybWhqalZ5VTY3bzNu?=
 =?utf-8?B?NGkyMUdqbnBjVHh2aFgrcVlWUWZRTUwvRTJWY1gzNUZ0QVpqVFN4WEowQ2Jo?=
 =?utf-8?B?U2pDZTZmODNXTzhTTUJwRjVkdUNzNlNmTE1pU2E2NUowSzI2ejZoRkFIQnVs?=
 =?utf-8?B?WU9XcEJOOHdPNWxLZ2FkUzBoaTQ5V1hORDJOM3NtUm9xc2QrWk1qeUc5cjd5?=
 =?utf-8?B?WHZFZm9QcGFuVTNaY0hJek1xTUMyK1p0UXBEWnFnSzNYL1AzRmZHRmRMV1py?=
 =?utf-8?B?eGlMUXR3c2pyaTd3U2tvV0NiVStGdWZJeWlzU0EyTndDemxyeER6M3ZIYVJj?=
 =?utf-8?B?ZFY3ZTFCRSswcFp3eTFSYlM4cEhUQmFvTzVrR3JOR0kyUDNmTnBDOG1QK0Qx?=
 =?utf-8?B?SndScTVDM20wVWN0Wi91QlRiL01jc0MzM2lEUEFDN1laL0t1TVhVU2lTeEMr?=
 =?utf-8?B?RjZ6SGJkOG1pWFBJMTBpKzVWMVhqSThBTWFMdjlJdEpTaDV5S3V6b1I5VlRI?=
 =?utf-8?B?bXB6MDhMRjVDUEpuRUxWUVlRd28rWmlRTGhVSmdSUXNTRCt2UGRlSUl3bVZS?=
 =?utf-8?B?WWtkd3BpckZqM3pYbFRhYjVHZm1hR1dCc3E5UkxrRU8wRWxSNVk1NS9EbXM5?=
 =?utf-8?B?THJFMlpRd3NXeGJKT0xEQXdqbFdtMmxwRTFDZ3dtV3NkOE5sZXRFSXhwaTBD?=
 =?utf-8?B?dk13QnY5MHA2T0xEK1JvRkRQTDMrMWkwWE5kY2d4RXhnbnVkRnlBYXVXYmFh?=
 =?utf-8?B?NTRWcVN6cTlENkd2c0dVNDhBL1hZa2R2dFpMRlRrVWZWKzc3OFdnNEhqcjdQ?=
 =?utf-8?B?WFllYUZMc1V6YmNIbk9WUFY0ajdnL2FXUm9iUm1ZUEM2R3ZXREhPWGF6WHNI?=
 =?utf-8?B?Zkkyc2NHRXl3aWlXcnBFUjQ4V1FLZExncEY0N0ZwNExOZE1CTFhmTnh6cG1O?=
 =?utf-8?B?R3NOMmdHU0hKL0dJczl1TjRIaDEyWHA4Ym0xRStUb0cwS05SYkdzZmthKzRn?=
 =?utf-8?B?R1FKT0NYWjFaYUdsSFNPbWVZVjI0NGRYVW5WZEU2S3c5WmlFVGJRNjlXajdK?=
 =?utf-8?B?N1FnNEthUFQwRzU2MGRGaG0wSHNORjJCV0pybUE1VE5TZ2hOZjlXWmppbVlH?=
 =?utf-8?B?V3UxVXpOZU02Rlpybmd4NVAvZE5ka0tHSkRFNGlhUEZFcmwwb1hwK0UrbWlE?=
 =?utf-8?B?SWt6eXZKQ0N2aFhwWFJGYmV6ZVdHOFJNZGxSQ0F1R2JqeDh4NlRIaWNMUHZV?=
 =?utf-8?B?ZHBsSVBxVFpXK3hvODJYTU9aL2tZUFd3cXlkTUoxaUtkdklqT1NhTzlZZUtx?=
 =?utf-8?B?N2wwT0o1OWhna0oxT0Z2bjFlOWg2bFd6eVRnbUtUSXhwRVNRUW93MnBhZ1FQ?=
 =?utf-8?B?ck5RVjRyU1N4QVllWnNiSEp5L3lrQWtRVy9rdWdWWVg2YTdocHZZeU9BeUhY?=
 =?utf-8?B?WWlSS2ZwRDRpTXRsSm1NYXNzR3RGckVHblBOQm1pVWxFek9HWEtESFpON3A3?=
 =?utf-8?B?SDhPY3BqY2Ric3IrRERIam1MOXBVeGZMSDZKbG4wREh4ci9haHMzYkYwU1B6?=
 =?utf-8?B?WitYVXZkMzF3Qi9HVm4xcHpnbHRlTWpMc1ZGOE04dnBCc0dDb0wwTHFPUWY4?=
 =?utf-8?B?UTVVeDFNU3ZMN3lucVJpdUs2eGphVjhac3N4c2wwM2IvT1BubVBMSUl6Q3ZV?=
 =?utf-8?B?QVRJM1Zkc3lPOFhvdDNmYjl1aGdFUWdQeFZjeXJ3NU4rdHdER0RIeFdDWXlv?=
 =?utf-8?Q?v9S67FKMtI02nKhOQvDSdEfCc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc8c6bd-bbfa-4297-dcc3-08dca25057a9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 08:55:13.4627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pVLuRxRnt1LQedxrns9gTjOzW2Bca5kkufuPBRlWOLJvQEcpo2+g+ZWWehQF45Mq6giibn5rrzIE4Kj7cm71w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6871



On 7/3/2024 5:01 PM, Michael S. Tsirkin wrote:
> On Wed, Jul 03, 2024 at 11:10:57AM +0800, Zhu Lingshan wrote:
>> This commit allows the driver to suspend the device by
>> introducing a new status bit SUSPEND in device_status.
>>
>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
>> which indicating whether the device support SUSPEND.
>>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>> Signed-off-by: David Stevens <stevensd@chromium.org>
> Your signature would normally be last.
>
>
>> ---
>>  content.tex | 71 +++++++++++++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 61 insertions(+), 10 deletions(-)
> At a high level, I think this is somewhat overspecified.
> Generally e.g. if driver is forbidden from accessing
> a field, then we do not also add specific requirements for
> devices - with no driver doing this, such functionality will
> remain untested and unused, and when we finally decide we need
> it it's not going to be there.
> Similarly for when device is not touching a field - no
> reason for driver not to touch it.
>
>
>> diff --git a/content.tex b/content.tex
>> index 0a62dce..8c974d3 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
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
>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
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
>>  The \field{device status} field starts out as 0, and is reinitialized to 0 by
>> @@ -60,8 +63,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>>  initialization sequence specified in
>>  \ref{sec:General Initialization And Device Operation / Device
>>  Initialization}.
>> -The driver MUST NOT clear a
>> -\field{device status} bit.  If the driver sets the FAILED bit,
>> +The driver MUST NOT clear a \field{device status} bit other than SUSPEND
>> +except when setting \field{device status} to 0 as a transport-specific way to
>> +initiate a reset. If the driver sets the FAILED bit,
>>  the driver MUST later reset the device before attempting to re-initialize.
>>  
>>  The driver SHOULD NOT rely on completion of operations of a
>> @@ -99,10 +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>>  \begin{description}
>>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>>  
>> -\item[24 to 41] Feature bits reserved for extensions to the queue and
>> +\item[24 to 42] Feature bits reserved for extensions to the queue and
>>    feature negotiation mechanisms
>>  
>> -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
>> +\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
>>  \end{description}
>>  
>>  \begin{note}
>> @@ -629,6 +633,49 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
>>  
>>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) before removing exposed buffers.
>>  
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
> If it's not set, then what? Device error, have to reset?
below in this patch:
"When the driver sets SUSPEND, the device MUST either suspend itself or set DEVICE_NEEDS_RESET if failed to suspend"
>
>
>> +\item The driver MUST NOT make any more buffers available to the device.
>> +\item The driver MUST NOT access any fields of any virtqueues or send notifications for any virtqueues.
> what are these "fields"? the area in memory where the vq lives? why is
> doing that a problem - you want device to be able to write something
> there?
To stabilize the vq states once suspended.

So how about change "fields" to "Descriptor Area and Driver Area", or just "virtqueues"?
>
>> +\item The driver MUST NOT access Device Configuration Space except for the field \field {device status},
>> +if it is implemented in the Config Space.
> what is "the Config Space"? device status is never in
> a device configuration space, it is part of the common configuration.
> so what exactly are you forbidding here?
"common configuration" is PCI specific and actually "device status" and "device configuration space"
are two separate sections in the spec.

And also for PCI, the device status is implemented in "common configuration".

Do you suggest we fall back to the last version:"The driver MUST NOT access Device Configuration Space"?
>
>> +\end{itemize}
>> +
>> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>> +
>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> what does must ignore SUSPEND mean? what do you want the device to do and when?
Do nothing and "ignore" is existing language in this spec:

The device MUST ignore the write-only flag (flags&VIRTQ_DESC_F_WRITE) in the descriptor that refers
to an indirect table.
>
>
>> +The device MUST ignore all access to its Configuration Space while
>> +suspended, except for \field{device status} if it is part of the Configuration Space.
> again what does ignore mean? Configuration Space here means
> Device Configuration Space?
>
>> +
>> +A device MUST NOT send any notifications, access any virtqueues, or modify
>> +any fields in its Configuration Space while suspended.
> If a tree falls in a forest, and no one is around to hear it, does
> it still make a sound?
> I think what matters is that if a configuration space changes while
> SUSPEND is set, then the device must not send a configuration change
> notification, and it must send a configuration change notification
> after SUSPEND bit has been cleared.
I will add this in V7.
>
>
>> +When the driver sets SUSPEND, the device MUST either suspend itself or set DEVICE_NEEDS_RESET if failed to suspend.
>> +
>> +If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
>> +the device MUST either resume normal operation or set DEVICE_NEEDS_RESET.
>> +
>> +When the driver sets SUSPEND,
>> +the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:
> what does "before presenting" mean here? that a driver reading status
> will see 0 in this bit?
Presenting SUSPEND means setting the bit to 1. This is also existing spec language:
"device_feature The device uses this to report which feature bits it is offering to the driver: the driver writes to device_feature_select to select which feature bits are presented"

Is it clear if we say "presenting 1 in the SUSPEND bit"?
>
>> +\begin{itemize}
>> +\item Stop processing more buffers of any virtqueues
>> +\item Wait until all buffers that are being processed have been used.
>> +\item Send used buffer notifications to the driver.
>> +\end{itemize}
> Is there anything here that has not been said before, but as a MUST?
> Saying same thing twice once a MUST once a SHOULD is confusing IMHO.
We have similar statements in the driver parts, but here is device normative section.
>
>
>> +
>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>>  
>>  Virtio can use various different buses, thus the standard is split
>> @@ -872,6 +919,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
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

