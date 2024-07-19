Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E371A28D
	for <virtio-comment@lists.linux.dev>; Fri, 19 Jul 2024 04:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721361616; cv=fail; b=H2q7g+5SuOtxqlR+AvCN/jNCx99Oz7sNx1K5G7zVlpxpqT6Dw9LDFdZyhYxJvfqOwohORp6Y6BSFssqd/qgbfvES56//kmISUmE/Z5ydoVMS4rkqdieNmMxdlDwMoLMggiwkMWfmArJV4eWQmC6WhHxvaEBGSrtO9EiFuxsPZow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721361616; c=relaxed/simple;
	bh=7peBitQNSFDuE2pMnUeorJVy3yy7vaZjJFHGzYROHqU=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GAw+9uKUi9WUEIQ7OEvlf7/1eW/f3wg+N/0ZXC4pg/Yn9E4zyNwCrQY0/8eWh+2IQX8WbjeVG1TwAiG2AG6OFDi2kfWB1QgsMzCPJAOUB3AaE6r9tgeY4b778rpEIXoNXMM5QFNlt+Pvamgla5Z9Cm/7gp5YCJiHm8g3MnPGji8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RAscp81V; arc=fail smtp.client-ip=40.107.236.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RAscp81V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHXOx76hBAeogOZaqXxzZh1fvXepXcssoympVaGM4mhE7cecObRcF7WbIMnKFGF8NNGYlhBBTuwYhoTUuONUXQntea2U4a22UAc/JRbOlTAFN8RiYU/LkVhKvGvVa9LStIPdwWHO1QRopLQIJKc+f2mTOlcMgLoaJjOc+MZhj0O/vryzdqgw5f39jhmsjqkOl8bOkc0GU8rFQY/sVC5WLr5k3OJLAQU0Pcmyx1X18wCCbH3P+egFcQVS/JaFf9axXueTejI/niK+0d/CWx+OzGXZhJRcltjT7ESsvJ7l8eu0A9JuD2LLsdRPKifM4xXZWuebCYbO1td1Ob2OkQVG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7peBitQNSFDuE2pMnUeorJVy3yy7vaZjJFHGzYROHqU=;
 b=ypGl8eRSOvmOuQKLxEw3wD+B7FcrRvPTPLaUu8tuFGRPcmY/Z+93lkoikl0Uguao6ups+c5vNjbM8G6OlY3UEq1KLSzZiozhNSy/wjkmRaUCOsadLiEBeGKpNautTPutAS8WFrYj+n0JFk1JLmuu+GC5f3LGMOzwjY4XNT0nSWRzLScHl7v5uNX74tUCq0r5e/Wev7BKT3pXWlw/7i1MsuKCpOX5geDLHJLGXmwLx19fPduKQJzBimYck6VP+NNmme5JOXaVlMR+FYYfmflrdIMl5alMQfiOrquSiArGwruqwC4Egn2c4SCW5SQbzdWkHQaGlVed3W/7yFPkG8mfwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7peBitQNSFDuE2pMnUeorJVy3yy7vaZjJFHGzYROHqU=;
 b=RAscp81VzBzh4gLgTV2FHC+VVDcAMMU2AGP0oFEWEd5up5hsLQavsQjAeYEXhJrxKtVAe48neIw3SXk79DJLrKAUmCFBNH+njSELIfOfpxTfab8hmvfG35d3gDkbZ6my742J8ZURJBOHE/UVnf8a91/ElnQNZSUPuU7xi+l7cT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by MN0PR12MB6001.namprd12.prod.outlook.com (2603:10b6:208:37d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 19 Jul
 2024 04:00:12 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 04:00:12 +0000
Message-ID: <45f9408e-5e7d-4e20-b20b-2fecd986986f@amd.com>
Date: Fri, 19 Jul 2024 12:00:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Request voting rights
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com
Cc: virtio-comment@lists.linux.dev
References: <1f4e0199-ba54-44b1-a060-91acb002bb62@amd.com>
 <aa5e581b-a8a5-4196-b274-79887242734b@amd.com>
Content-Language: en-US
In-Reply-To: <aa5e581b-a8a5-4196-b274-79887242734b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0086.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::12) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|MN0PR12MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: e91462c9-4ef3-4e1d-1b76-08dca7a74990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2s2RFNGMlpuLzZVMjE1VWhUNjZ4aHVvUWhQWDNOaTltWFhiL211ZkgrSEFO?=
 =?utf-8?B?Q3BxNVZzRUlCWElBSXhkUERqUUN5cmxXTE4xUUZzT0pjMzZYYUR3UmZyMFox?=
 =?utf-8?B?ZTl0L1RvNkVGcFJBd2V5UnE2c3E2KzRIRy9aOURtUlBFRGlhTWxHVmpiaVVV?=
 =?utf-8?B?VTQrUXhoUGd0aDZDbmtVZHZTT05SRGhRZDJIa3ZmQU9Wclh1TGN5RFMwa1Mz?=
 =?utf-8?B?c3FnTUlVTGdzaVlNMHFhRy9VVXJ3NDVFaWdvTDNXTERVTjJQUk1vV1hJZFJk?=
 =?utf-8?B?SGhFV1M4RTJBZ3VhZnREMk9aZS90bmk2V25Vck9manducDVvSnpDRmFMRzA2?=
 =?utf-8?B?dlNvL0poVGViRFNFVGNYWFExUjRBa09rRkJiMmNsRGV1bit0cU1DWjNJQ0Fz?=
 =?utf-8?B?QWVBZFgvUGtCWjR4KzNCY3JIZUFtZmUxaFFtdTV4Y25tOTN5RTVwUWVJb0pw?=
 =?utf-8?B?MDh1ei93NUtoNnEvb3ZZMWM4YVZBOWZCWlorQWxQUmZRS2QvcnJBMWVnVXB5?=
 =?utf-8?B?YVVDVVhpRnZNcng3WlBOdEdlQ2Y0N2Nrb1BZdlEyWE1scHpnZ3ZJWnAwa3ZZ?=
 =?utf-8?B?WnhIY2N2aFJhN2FEKzVjeGV6b1RHbkhyelZMcXdrQlBZdXlnaU1nRVYzeXRT?=
 =?utf-8?B?MzVCK2ltMm1SeTVIS0x5emJYTmdyRnM0bjA2TkNLZUp1L3JUazZWdCsrZ1Bw?=
 =?utf-8?B?bU9ZZmdEeXNKeUs0MjF5cFJqZEQrZWpQYkdoUGdEQ0toc3NlZGZiNFRPZXNO?=
 =?utf-8?B?WGxJdFNiNlBNNzRiM2tEOVpkV2VvV1BSK2RHeUwwMDM2UXh1OGxseE42Y3R4?=
 =?utf-8?B?S1U3bWl5aDlZVk8vTklwTWgyT1YzY0p1dTh2UDRsd0JwcDhqZXBScjhpaU54?=
 =?utf-8?B?aVRVaExLMmMxTUFRU2lUTkZsYWNHcVJJUFJTbE81YWJPNDIzNFg4RHlLQzVn?=
 =?utf-8?B?OFQ1UW9iUHlIV1l0SnlzK0x1T1BYWWJCaUt3a2hGdXZrSzI1Q1k5MThZN2lv?=
 =?utf-8?B?K2xMb1lJa3JwOVJTZ1RHUXVIRTJmd1BTSHUrUE9wUktXNzdiVzA2SVdtL3RN?=
 =?utf-8?B?NXVsdHl2R2ljdzFGdVZlUUxDblNhUG1uc0dWRlMvS1ZCNkZjaWdrdXJJZTVt?=
 =?utf-8?B?bU9FWnYwMEVVaURRa3docC8wVUt5eUlsbHVSRUZYczF5TzNkVEZ5OGtaYWxu?=
 =?utf-8?B?amF4ZTFUcFNpZlZPRWQvTTNYMEJMZW9tejIvVjA2TU16aFlYQ0tXQUcxZXdo?=
 =?utf-8?B?aXdKY0NNbTNhRXBFenpjRVE3NnhYck92Sm9GUGMvRzNYUzFKakFWZjNHN1Va?=
 =?utf-8?B?cWtRZmhoaUlsRHVwUlV0VFN1c3FSYmZXMlJGNllnSkNjS2dxOUNTL1NMaUpP?=
 =?utf-8?B?SjJJREF2ZGJ4UUZldENaS2txM3N6TXNGcGI4TThMTC9SV0dXWFdjTkNKdDBj?=
 =?utf-8?B?WlRmZGppYkEybW9OTlVSY2tPZzRNaksrZndqMldsQWlNRWJFc3R0L3JqUWxv?=
 =?utf-8?B?VjNDNkl4d0VKZGhFWG1USzdWWnhsK1ZkMHZVVnU4cmhtck11cjhpcmFhdENQ?=
 =?utf-8?B?SVR3NWFISzdCYnhhYVhuUXE4NjVWbHF6S211ZG9zRmxHVjdEQkhrTTU2L3Rx?=
 =?utf-8?B?TlJpekZBNDhacXkzVnlqTzBqWUp0Yys0RTlCcFd3R0dxdmJucEt3ejhkckp5?=
 =?utf-8?B?M2xjVk5lS1g4STltY1pZZjB3b055clpqUzlaTlNxWkhtT0hMYlZQc3Vzcy9R?=
 =?utf-8?B?dTljSjhsU3JzZEtNQUNCSXVyWTUxMFpvbmRyV2IxK2ZBN0cxQnQvdXRybzJN?=
 =?utf-8?B?c0lFaUptb2YzSDc0R0FaQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXpHRXlxemxSeTBlVGRzUFFjOGJ6Ym1Qd2lJdjFoNkFkNVNyVUYxdnlVSWlQ?=
 =?utf-8?B?Rm1MQmJwLzYxYXFVc3dweXR0VGdMVXF5SVJuV29zOU95THJTSWNtTnBWcTV4?=
 =?utf-8?B?STNTR3A5TkdHdE1JNm93eHNMbUFLTjdPbm96R2JaaVJ2RDdHMzFRenZ3c3VW?=
 =?utf-8?B?c0N4WmQxU1Z4Zm53V1J3Mk43T1hjbnIreld2N3k5Y1A2RDBCSFNUbnIxNDZQ?=
 =?utf-8?B?MGpHQUFBR3VjUHYxdlZRUmhvQytqWm9QTzZiT3ZWMTZibHJkRzR4M2NmN2hK?=
 =?utf-8?B?dXdYeWJGcUdEZXBUM1oxOHBLdjd1cmtEUTgzYnRpYW1OUDh2ZFNwZnllNjlR?=
 =?utf-8?B?ZFhCYjhtb0c2QVI4SUwzMCs5M3BoV1M2czlSMWdRMGNwS2RBNkJoSVJnbzVL?=
 =?utf-8?B?cDZYWG1CcnhlalVXVmxWZGx3ekptQnEvMlpKdXdvQlNSdHYyaHd1aHVpajNU?=
 =?utf-8?B?SE0vdENaeE9Iak43WXQrUTFyelVzU3pLZWI3VnFwbGt5eCtzbk5lVEJoMDNY?=
 =?utf-8?B?eUxmeDVZNWoweG8vRUFoWmdCSkh3RFhqSnFCUUlXU2dBZk0vVVozM1lQSElB?=
 =?utf-8?B?U04vM3NacVF1M0pyWE01S0lONFNITFdoU05vY2x4ci9YSm4rNG16STg0M0xs?=
 =?utf-8?B?b1hJdDRVZ2laeXJVeVpDQm9OM1NUWUxVSDFFZVg4RmVPdFpMWkxVRUROclYy?=
 =?utf-8?B?VXNlRXpucE0zN1c4RXJraTkzcWUvcEx0VXA4UUNJQmdmWElnRU1NVUdVa2Fy?=
 =?utf-8?B?dXNQemRDak9GOGtmMTF1T05aU0lIblVQVGR6QVl3RjdhVVorVE9nelMvdUpr?=
 =?utf-8?B?NUFlMWdOQUptdWozaGpoN3BzdHFoR2Z3cWxVckFZc29lR2RDR3ZOSkZhMG1N?=
 =?utf-8?B?T3VWeWQyTTJ4QlJQMmc0RG9La2FpM2JUcVdmbTVlSlYrRml6R1UxbjN3Qzdj?=
 =?utf-8?B?TUFya0F5cjZ5U2Q2WmNhb3JOQ25NcHdEZmRsS0RweElxdVZkZm92STRMNFZB?=
 =?utf-8?B?NmgyV29IWTRhTXIwR1FlckZvZW9NSVM5WFJsS3VvTmVTQWdONDE4aXpGeDhT?=
 =?utf-8?B?N200cEVzZHhpNU1hUmQyeVhLbFBoVnl3R1lpTStNT2I4eXMxL3JlWmdXTEdz?=
 =?utf-8?B?L2RaL3lsTHkwYy96d1V3SGlITVJpTDJFU0pJamhWR2ltT1VnblBiM3ZOVHJj?=
 =?utf-8?B?aHM5dXRzYU5reUpBT09aMTdTMThncnVraDFXb1FSeUE2L3RHdWFvUzRLa3pt?=
 =?utf-8?B?QWJLZ3ZWR2EyYWJITFZqVHBqdWEzWVROZTczRHYvajVKTlBwc2ZqRnVJQkp1?=
 =?utf-8?B?cVhuVWdKT3VEdGdzcUZobGV1RHdTOXUwcUdaV1ZkMnozbzBjRG8zemw3ZlJk?=
 =?utf-8?B?ODk0ckIreU5oQU1nelAvQTBxSnpOVzBtWkc4S3RJcTd5bWFOam9kVy9mNkpp?=
 =?utf-8?B?bTdpK1RuMUhmRm1EdE9CK2ZFSHR3UGViTWx1UkZLNldnMkNCR0JNYkU2WXRv?=
 =?utf-8?B?K0xPZnljN052UUZEYjV5UklGZzhXTTl0Slp0clZQOXlpckpGYkU4NG16dTQy?=
 =?utf-8?B?RXQzbEJ3R0ZBOGdjaHF2L25yNHNoLzVkWXZZS1JlV1ZBejBqYWxMbkd5eHJM?=
 =?utf-8?B?OEZrdUJVQ29HejBEUmNwYTVSMnVROEhGYXEwZ0ViYUZLVGpkSVFKYkNKMHd5?=
 =?utf-8?B?WVk0UGtlQ2VNeCtnbkJWQ2F0azlySlowRU8reXIzY3JybEpLQmFzMUdFM2pD?=
 =?utf-8?B?QzZ4eUVPb0Nmcy9lTC9JeDJQeWcycFZmR0RneTZSSkhzWHJERHh0UFFKeSsr?=
 =?utf-8?B?ODE5OGkrWC92NStlNXNIN2NYY3dBTkRXQkIzZExrbGNVTUE4Y281b2ZxMHZT?=
 =?utf-8?B?UkNPTUZYQW9TVVQrUS9BR2I4NzBEdlhqR0RpZ1lHMUo4S3NYcmM2ZCtHd1ly?=
 =?utf-8?B?UmcwcjBJQndBeVcrcXFpM1NVMThSaU45MXpGdnlVWUVXeUhwZmpSMFhqTzVO?=
 =?utf-8?B?SFE0KzVudXFESTI5ZW01TEE5c254eGNFS3RsSjZSbDVGT0FEcitHdnIxbjZP?=
 =?utf-8?B?ZHBEVHBsczdjVUFZeGszVjRJYWZuMFA4YzNIMWh4MjJDL1U1SnRUeVh2M3NF?=
 =?utf-8?Q?NXCuY7gS/BM6+1Lv85HtA365k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e91462c9-4ef3-4e1d-1b76-08dca7a74990
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 04:00:11.9678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqpNqjvam3bfrsXxPItOLHI3urxfcXiyS2CjCLJkPNErkLUpcezNHT8o9csgAlrk5ZQPi9I+m1Tncd7nm2c/Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6001

Gentle Ping Chairs.

On 6/28/2024 5:28 PM, Zhu Lingshan wrote:
> Hello Chairs
>
> Gentle Ping
>
> On 6/7/2024 9:48 AM, Zhu Lingshan wrote:
>> Hello Chairs
>>
>> This is Lingshan who re-joined virtio TC last month.
>> Prior to AMD, I was a voting member on behalf of Intel (lingshan.zhu@intel.com) for two years.
>> I humbly request to be a voting member, please kindly help grant voting rights for me.
>>
>> Thanks
>> Zhu Lingshan
>>

