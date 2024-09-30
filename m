Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D936B17839C
	for <virtio-comment@lists.linux.dev>; Mon, 30 Sep 2024 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727678573; cv=fail; b=Qxzt3QKoPIcA2ulbsoxWEQ3oB8QXGz8H7+bnVi4s1eetD1JP6J4hIqnEk4JTVDe77vWfVHuXdn/MLPjk/NlJtJHc+h6k6uKxYsl4djJB5qB6FqHK+INkBqq7JhEg2kFyX/mjlHiKCrB8cAtFgPvQ2Ky039Q5PNDpJhG12y/MPYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727678573; c=relaxed/simple;
	bh=0q4rDAAzUmyqajjTbG72kvExN7lpps4fna+GEn4Asds=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EKGt0yZ36pJaWpykKxBXAea30cDbyjufIicJ8+iMpyn6jbV2FX+xXSZZQMx0HQw/UGQs+LhnWjfuPyrcb4STYR4ecCExZIVF4eaqSQ3eHyhcbp3HwjyuLpEA6WxseqoNZgwXyiLQ3e+gcOBEJs3EXiw/IehmuNP0ZvlhhoweFhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4xeWib/3; arc=fail smtp.client-ip=40.107.244.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4xeWib/3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTkEbGbGgwYFxmuMzkUUNPouoyDDd9N8vRPiB6yrrZtspB1rRXDhVZm5NAb6fRK4BHGu3CAEcCV9PfnMAd7TV8FP6OhJapmFqScCU214KR/IlHZPLpGKaiclSzw1m7TEus7PsAIRw9YBXV4o0FDAHJAXBHzkTa9dbJ7xG+giUs6Xh19gSQuvqWU7lR4D6abbh3R2kXzDJ3OLu+fPbHjkD2gfcq6v5bZoyAxWHtrsiESjdMGEuEgFNHYi2H5rh+M7PteTSmVxp682F1DWsEh6QWhuMVShasppl8juAQWhRNEjDIzlEEta8KAFKHvGntLMuTMB4Jj/u/1HkXh8LbOZPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nM6k2CQUQIO6Pnk91ySJpK/5Q5aS35Ln3Bbu+e8diZM=;
 b=wIY7f7QyKipbjTBdpsqIwtzmNsP6DI0PG8A0lX3zYTtaHMb+m9JeL+u8pLPlRIkHCgCiIo7Up26NJkpP+fuyUZLKA/dZ/r0T+3JspKnnHiqgpcpBjp1/ryqTMrxl8TflU5/B+CIguCuJWqYWYDQXXEQEU4gljZRjpJ60Z/vVltEzwrtKkJPIee0XlcSEGYaNk6mpgX3Pe5+3hOl3M2k2wXg80jDD4Vc5RnxWa1WSmwI0EoyzKOPKiRGaVL58p5NfEWWBwws4AVQL1KThqVFxfwXp8JgMbrSKa/DQ2ggaNc3zWQu1IvzWXK9AINnZwhKRIKGO/aL5ElgbSVoqbpaI1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nM6k2CQUQIO6Pnk91ySJpK/5Q5aS35Ln3Bbu+e8diZM=;
 b=4xeWib/34GvKVb1tA05rK2iDylG82GyzXLi9rfAcsygDdYgWik62s0CsNZDg3eb2dR92L9K98qhPyH5TTHL+etDqIKr4QyZLDEWJHUg3fCt7kNDV2VA+UhSl0H8m6ys8cLVhUmCgcnWKN6czQVe3+fEvxPUf1Oj8ic7CLK9NeGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by PH0PR12MB7888.namprd12.prod.outlook.com (2603:10b6:510:28b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 06:42:47 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 06:42:47 +0000
Message-ID: <8f7a2626-f066-4a49-af09-9b83e95ca0a6@amd.com>
Date: Mon, 30 Sep 2024 14:42:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] transport-pci: Add MSI support
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "mie@igel.co.jp" <mie@igel.co.jp>
References: <20240712140144.12066-1-manivannan.sadhasivam@linaro.org>
 <20240724162143.GH3349@thinkpad> <20240903053218.7lapwvllgz4xk4se@thinkpad>
 <IA0PR12MB8713D97523757F1FDD6D3525DC762@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240930022818-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240930022818-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::13) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|PH0PR12MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f915ec-c478-4d7b-4660-08dce11b1887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEVOTmFmTmpyZ3BtQUNOeWhwUkpqWkpPZGpFNlJlTUViY2doSVczLyt2RWxL?=
 =?utf-8?B?MXBHRVVCVU5IM1QwMHpVcmd1K1NRSUtsZ3dnZTJQQTVHS1JOZG9BeG1yWjFP?=
 =?utf-8?B?ZGxZR1ZOcG51eDgyaFdPK2VBbGhRRTBqWjRvUEwwSHFVNHQ1dUplczFOVkx1?=
 =?utf-8?B?NXB3Uml6cGgyWE9xV24wZDRhMDNxM1BFQ1UzREh4UXBSNm9QR1ZOT3cwM2Zh?=
 =?utf-8?B?ZTZjSTFReXFiamVsM1VYSFF1ODhqeGluVmwraTVkTmQzeTBoSXA1eTVPNTN4?=
 =?utf-8?B?YWRaMmNWTDJIZ1FXeDQzMWQ1Q1lVVG5pVnhtcThiTEhRVVhUc0Q1QThoYTEw?=
 =?utf-8?B?eW4zUW45SkRnN0IyTHVXZXFFZzVnTjUvRmRRbmMwU2VubVRrUUVlUkJZMGxD?=
 =?utf-8?B?TGJRUklsZC9yL1VMTHg0K2tleCtMa2FSRy9LbnNHOVZjUlcvRENvaURCYm9C?=
 =?utf-8?B?NDRkLzZTMUxWaWd2UEVDT1lEcFppZzlpWWF0RDlkSXpwTmEwRzlYblRybk5q?=
 =?utf-8?B?UzRQaENKbjBvSkp5NTgrRTFPbUxOMGV3amR6MGc4NzIwNFJsMzgvWXFDV1pD?=
 =?utf-8?B?WlBuVUVqVTNoUk44a1ZDamQzVlZ4SURXRUx5THpybG5qMG12SUYrYmdvODVk?=
 =?utf-8?B?OVpidFdoOUt6dFNsZjd1QVNaUXRGd3ZxV0ExM2VJVVIxM0g3WDNQRW9lU3V3?=
 =?utf-8?B?OHR2bkY0ZFUySzJjTEh4YUk0cGJta01JYjdVbjdPZGZPQklnajRybGRGR2VQ?=
 =?utf-8?B?ZVBsWEF1c2g2N1Zaa3RCb2RteThNRm9zTGhOQkQxVlZzRjJ2Zkt0eEhUZnZn?=
 =?utf-8?B?UTdoTnROR3FQTEx5YmhKSjhjbW1kVzZXR2x6TEtNMXlVMkhhNHBPQ0dYUVkv?=
 =?utf-8?B?MlVNbENOUkJxcmVsM3ZwalFoVllqc2xIbHVUaHE3QmJ6U0R6alhMZFozZWxQ?=
 =?utf-8?B?WVFIaU1PNHdKRVU0M3BlK2NvZDRyb1EwZFhnYk9LZUJSUnhJTHBLWUdHMk9m?=
 =?utf-8?B?ODBnS1RVdWdoZDk3L3JNbEE4Nk9jMnZCM0VMS3Jwc25jazZGWXl4OVJaMWV4?=
 =?utf-8?B?OHdwM1NzNXdVa0p5UmhTSXNpZEhMNi85c1ZPbEVZM3RsVWZmalhZaFVqbGRY?=
 =?utf-8?B?RnZUZUJCR2NsYTAzY0wwcll6UmZwRFM1S2thcFJzbEJ0UG5aL2RLdm51Nk1r?=
 =?utf-8?B?RDd6YmxBTi9RTmRGR01zdDdZOERDVkI4NzRmd3JjQjl4Zk9ZTkNBVnYxbURG?=
 =?utf-8?B?UnFrTXdhSHQ1MjU0b0ZuRStac1V0QnBicVlxc0pRVXJKbE1HVGgzUFd5VlRz?=
 =?utf-8?B?bitzVEw3RXgydXJCTnFxcVJWZGlnOUxMU0JDemx5TXNkYmxHT2RCQXJlQ2ty?=
 =?utf-8?B?aE1ITTJHY2RHa0RqOEFSOFVkNlFnL0o3SlFkREpONHN0TGNkcE5xQmZMYXBs?=
 =?utf-8?B?MmJ6SnJNbXMrcHF4aDJkQmd5M0l0ZEJXdXZJdHhVSC8zWGtXZ0NhZGdROGFa?=
 =?utf-8?B?QjErNjRGNm9sSEhRWU5XMElEeGRJU1Q3SHE3QlNKZVgwN0lTUnozV2tNRXA4?=
 =?utf-8?B?M1FiUGpDUUJYZUFnMXRvZmcrUzRSZGtUaGFZd3E3UTlpYnIyM0NPUEJncGRX?=
 =?utf-8?B?dkowTnk5Umh5NjdKQjg4THZPK3Yzc0sxQllLZThtd3pGS2kwUnpmb3B2dnJV?=
 =?utf-8?B?QjFpZzhGcU8waGpnVVg0NlpFVnY1cXlJT0wzZ1ZwbDBuOE9XbjRra3g2bVdW?=
 =?utf-8?B?dmhxYU80NWRlTlJraDllb2FPL3ljcmpuNFNGVjlWbk9neGFtVHllRGlKM0FQ?=
 =?utf-8?B?bm90bVcycmplelJGVnVqUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RngyTW9WK2JISzJRRnJFWHgrOEJ2dENpc3B6aGRYSHJ2Zkw3RnF0TEl0VTd1?=
 =?utf-8?B?amgxUzRTMTJBZDIwMTZvcFFtaXdxL2J1Z21vZG1iSWc1VE9nODY5WTRCVWRn?=
 =?utf-8?B?a010ckhLZUdvalgrdFJvbGJZb0hJQ0xWNHMwVUVWdHRRTTZ0dkorRUc4a05I?=
 =?utf-8?B?bWswTWhLeXZYMldYTVlZT1hhWi9DNTNvVzA5NmErS3d0RHhMMDMyN2t3dkFr?=
 =?utf-8?B?UEM2dmRZdjdFL0JuVFdNdnk2b1VPdEExK3NZZmVubi8yczdCRkZIOXpRT1JP?=
 =?utf-8?B?U3Z3WklWMk1uVGxETXdUVFlvRXVSSDIvZUhIQ0pXVng1THN2RUtoNE91d3ZK?=
 =?utf-8?B?N0d6WTY3NzA2eFZIRzlVaTZQVjR5WHNIS2crUkMzVkxoZHowblZ3NWVCMjkr?=
 =?utf-8?B?bUNkdXFpc0JJV2FtOU5lQkZpZ1d6d0FkN0w5NWJOMTBJK2tEbkEvaFJ6YXNO?=
 =?utf-8?B?Uk11S0xwUitjcXlxOXZ3dzlRRURBaTJDL2EzdTA5QWJBbzh4RzRrQVgrczBm?=
 =?utf-8?B?RzU0d3liUXIwVFlINFhrdUJRbE52RUNZcXFCSEpjZVdKUzF3dFpPc1AyRFpI?=
 =?utf-8?B?WVllbDR4bVlwMktiYURiaGVsampRcmtjOEs5VVZ3S1lMS0NSb2xubUg3MWxl?=
 =?utf-8?B?a0tneEdVc2RrbmJLaVorcFZSbFl4ejY4N29ZMlNBMTJ3S2NNNDYxVkZLV2Jr?=
 =?utf-8?B?d2drZFlMclRxa05nVElEZGlTL2lFM2ZLTzN4VGlZNUR6TEg4SnpIYTlhd1l1?=
 =?utf-8?B?cnZUTzhXNGZVdFltaHhsUjluYnlFQlhvRGtySlBkMWd0SWxlUWJVY1FmQU9Q?=
 =?utf-8?B?NG9uWmdPeTZEWVU0dG44QVBQZ0swZnpJbWZwSUxzZStXdUY1QmtscnZaVk81?=
 =?utf-8?B?YkkyRkdLeEVkOFRnWjA5Qk5nYUFIMFc3T0pLTml3ZlJidEZoQlRYbXVaeWx2?=
 =?utf-8?B?WFVZN0tqK3AvQjlHd3N5bWN2a0pEdUtNT1h2dnZWclZzZUhjUHNnZmUyNUwy?=
 =?utf-8?B?QmpwM0N1Q3NnZTRHTDVYQWZPK0NiQ2JmU2tGZjYxQ1ZmdlVxV3oybXFIQUs0?=
 =?utf-8?B?YnFEbFp2aWcxYzliZUc2ZmYxVS9sZmdlaVl3N1g1U0c5NlI4aDBmRTRnL2lU?=
 =?utf-8?B?ZW4zQUxOTmU4T1p4cTF0c3JCMlNXN3ZhQUNwQTBVQ3pWdmJxSzdxY2U1YlZR?=
 =?utf-8?B?YnF2Z0RrZjFxdE9jL2lydDl4Q2FBR3dDZ2RFelZLTTY0emxUMSs5eldTa3B5?=
 =?utf-8?B?YzVYaGdjaUVySFdSbmo5TUVwcVN3QnVCQ0tZNEU3aHRDRjhtS1NsUVc5VW5x?=
 =?utf-8?B?cUFSUHF0YkllQ0Zxa25ZV25ieVN4bTkvU0tnUURBZ3VodjBRejZRQlcrcEVB?=
 =?utf-8?B?aGMzU0lVYnpUSlNoTW5hS281cklFQk1KeGpOZ1pOeFZ5bmxEeVhyYlY4eGp6?=
 =?utf-8?B?NEQrblhRUXo2NlNUVG1XbFdjY3ZXcklnSTR5V21HMHgxeHNRbzhsMVpiZ1NS?=
 =?utf-8?B?VXlOSE05QXdkZjBHcXNUbTQvRFN4UkFMM3NXbUdKNU05OEZ2bW1sUXZFMlZa?=
 =?utf-8?B?L1R3SU9lUnJDOTJJY1VsT2lYOU5QcldHTi9JUDN1MEh3UFlvSHJqRUJZaEZj?=
 =?utf-8?B?RERZT2VTUlAyeTBaU1VYODFCNnF1cm1yRElrNmo2bG4wVVdUaXk4Sit3b1dI?=
 =?utf-8?B?a2pTaExDd25pTmhBTFFmUUpjOEVxUDdUbklnWlluVUVXaXVCMlBBV1JGdkVr?=
 =?utf-8?B?bEVMSlRPUHhZb3FxWmJVZUhzYS8zc1pRZ2xKVktHdm15ZkJOUTJoSHBpRUNR?=
 =?utf-8?B?QitSNHpmSXJQb0FGclJEK3NkR1lkRjFnMVVOQ2UzQjhORHVRclRnOVFha0pL?=
 =?utf-8?B?WnhmMFZ5cGJMRmRxd3BQT2tjSm50bVM0REgwcWdJR2piRWhCSUpsQm9tYnNX?=
 =?utf-8?B?TjhFQmsxc2tJTEw5VEZNREhvN21JdUZCeVMySDlXcXVqS0hJcVllTXFUaUh4?=
 =?utf-8?B?d29YcU1xVzNiZXdqKzgwS2RaNFJOc0xPUGRBMGJiTEQrZTdnTzV6QW9JVTVK?=
 =?utf-8?B?MnhQMjZlam9vQmt2dys5SG5uQmd1dWsrS1o0SGVvU1gzY2ZrRjF6b1o2Zi9N?=
 =?utf-8?Q?CZF3TRFxxS6LPJgvF58pP2cDb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f915ec-c478-4d7b-4660-08dce11b1887
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 06:42:47.3623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bK+tstoFpzt/4k7ejaACwNYJHmb1is6FuFKXrPclsnG2OGy4YyuGj6erR4bGXDNk0C5WU/MqhjpUi1OjWA6Tqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7888

On 9/30/2024 2:30 PM, Michael S. Tsirkin wrote:
> On Mon, Sep 30, 2024 at 05:45:48AM +0000, Parav Pandit wrote:
>>
>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> Sent: Tuesday, September 3, 2024 11:02 AM
>>>
>>> On Wed, Jul 24, 2024 at 09:51:43PM +0530, Manivannan Sadhasivam wrote:
>>>> On Fri, Jul 12, 2024 at 07:31:44PM +0530, Manivannan Sadhasivam wrote:
>>>>> MSI is the predecessor of MSI-X that allows PCIe devices to send
>>>>> interrupts to the host. Compared to MSI-X, MSI supports only a
>>>>> maximum of 32 vectors per PCIe function. But MSI has been widely
>>>>> supported by the PCIe devices requiring fewer interrupts such as
>>> Modems, WLAN cards etc...
>>>>> Currently, Virtio spec only documents MSI-X and INTX interrupt
>>>>> mechanisms for the PCI transport. So if a Virtio device based on PCI
>>>>> transport supports only MSI, then the driver on the guest will only
>>>>> use INTX for receiving the interrupts. This is really sub-optimal
>>>>> and affects the performance of the device. Because with MSI, the
>>>>> device can use one vector per queue (max of 32 vectors) thus
>>>>> avoiding the overhead associated with a shared INTX vector.
>>>>>
>>>>> Hence, add support for MSI to the Virtio PCI transport. MSI support
>>>>> is added such a way that it reuses the existing infrastructure of
>>>>> MSI-X, like the config_msix_vector/queue_msix_vector fields of the
>>>>> Virtio common config structure. This makes it easy for the Virtio
>>>>> drivers to add MSI support without any disruptive changes.
>>>>>
>>>> Gentle ping!
>>>>
>>> Ping again. Virtio maintainers, can you please share some feedback?
>>>
>> Overall looks to me.
>> A small comment below on single MSI vector.
>>
>>  
>>> - Mani
>>>
>>>> - Mani
>>>>
>>>>> Signed-off-by: Manivannan Sadhasivam
>>>>> <manivannan.sadhasivam@linaro.org>
>>>>> ---
>>>>>
>>>>> Changes in v2:
>>>>>
>>>>> * Fixed a spelling mistake in commit message
>>>>> * Removed update to legacy interface
>>>>> * Used 'MSI vector' consistently
>>>>>
>>>>>  transport-pci.tex | 115
>>>>> ++++++++++++++++++++++++++++++++++++----------
>>>>>  1 file changed, 92 insertions(+), 23 deletions(-)
>>>>>
>>>>> diff --git a/transport-pci.tex b/transport-pci.tex index
>>>>> a5c6719..fd92641 100644
>>>>> --- a/transport-pci.tex
>>>>> +++ b/transport-pci.tex
>>>>> @@ -347,7 +347,7 @@ \subsubsection{Common configuration structure
>>> layout}\label{sec:Virtio Transport
>>>>>          Driver Feature Bits selected by \field{driver_feature_select}.
>>>>>
>>>>>  \item[\field{config_msix_vector}]
>>>>> -        Set by the driver to the MSI-X vector for configuration change
>>> notifications.
>>>>> +        Set by the driver to the MSI/MSI-X vector for configuration change
>>> notifications.
>>>>>  \item[\field{num_queues}]
>>>>>          The device specifies the maximum number of virtqueues supported
>>> here.
>>>>> @@ -371,7 +371,7 @@ \subsubsection{Common configuration structure
>>> layout}\label{sec:Virtio Transport
>>>>>          A 0 means the queue is unavailable.
>>>>>
>>>>>  \item[\field{queue_msix_vector}]
>>>>> -        Set by the driver to the MSI-X vector for virtqueue notifications.
>>>>> +        Set by the driver to the MSI/MSI-X vector for virtqueue
>>> notifications.
>>>>>  \item[\field{queue_enable}]
>>>>>          The driver uses this to selectively prevent the device from executing
>>> requests from this virtqueue.
>>>>> @@ -631,11 +631,11 @@ \subsubsection{ISR status
>>>>> capability}\label{sec:Virtio Transport Options / Virti  in
>>>>> \field{ISR status} before sending a device configuration  change
>>> notification to the driver.
>>>>> -If MSI-X capability is disabled, the device MUST set the Queue
>>>>> +If MSI/MSI-X capability is disabled, the device MUST set the Queue
>>>>>  Interrupt bit in \field{ISR status} before sending a virtqueue
>>>>> notification to the driver.
>>>>>
>>>>> -If MSI-X capability is disabled, the device MUST set the Interrupt
>>>>> Status
>>>>> +If MSI/MSI-X capability is disabled, the device MUST set the
>>>>> +Interrupt Status
>>>>>  bit in the PCI Status register in the PCI Configuration Header of
>>>>> the device to the logical OR of all bits in \field{ISR status} of
>>>>> the device.  The device then asserts/deasserts INT\#x interrupts
>>>>> unless masked @@ -645,7 +645,7 @@ \subsubsection{ISR status
>>>>> capability}\label{sec:Virtio Transport Options / Virti
>>>>>
>>>>>  \drivernormative{\paragraph}{ISR status capability}{Virtio
>>>>> Transport Options / Virtio Over PCI Bus / PCI Device Layout / ISR
>>>>> status capability}
>>>>>
>>>>> -If MSI-X capability is enabled, the driver SHOULD NOT access
>>>>> +If MSI/MSI-X capability is enabled, the driver SHOULD NOT access
>>>>>  \field{ISR status} upon detecting a Queue Interrupt.
>>>>>
>>>>>  \subsubsection{Device-specific configuration}\label{sec:Virtio
>>>>> Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>>>>> Device-specific configuration} @@ -1017,7 +1017,7 @@
>>>>> \subsubsection{Device Initialization}\label{sec:Virtio Transport
>>>>> Options / Virti  \drivernormative{\subparagraph}{MSI-X Vector
>>>>> Configuration}{Virtio Transport Options / Virtio Over PCI Bus /
>>>>> PCI-specific Initialization And Device Operation / Device
>>>>> Initialization / MSI-X Vector Configuration}
>>>>>
>>>>>  Driver MUST support device with any MSI-X Table Size 0 to 0x7FF.
>>>>> -Driver MAY fall back on using INT\#x interrupts for a device
>>>>> +Driver MAY fall back on using MSI or INT\#x interrupts for a device
>>>>>  which only supports one MSI-X vector (MSI-X Table Size = 0).
>>>>>
>>>>>  Driver MAY interpret the Table Size as a hint from the device @@
>>>>> -1034,6 +1034,75 @@ \subsubsection{Device
>>>>> Initialization}\label{sec:Virtio Transport Options / Virti  the
>>>>> driver MAY retry mapping with fewer vectors, disable MSI-X  or report
>>> device failure.
>>>>> +\paragraph{MSI Vector Configuration}\label{sec:Virtio Transport
>>>>> +Options / Virtio Over PCI Bus / PCI-specific Initialization And
>>>>> +Device Operation / Device Initialization / MSI Vector
>>>>> +Configuration}
>>>>> +
>>>>> +When MSI capability is present and enabled in the device (through
>>>>> +standard PCI configuration space) \field{config_msix_vector} and
>>>>> +\field{queue_msix_vector} are used to map configuration change and
>>> queue interrupts to MSI vectors. In this case, the ISR Status is unused.
>>>>> +
>>>>> +Writing a valid MSI vector, 0 to 0x1F, to
>>>>> +\field{config_msix_vector}/\field{queue_msix_vector} maps
>>>>> +interrupts triggered by the configuration change/selected queue
>>>>> +events respectively to the corresponding MSI vector. To disable
>>>>> +interrupts for an event type, the driver unmaps this event by
>>>>> +writing a special NO_VECTOR
>>>>> +value:
>>>>> +
>>>>> +\begin{lstlisting}
>>>>> +/* Vector value used to disable MSI for queue */
>>>>> +#define VIRTIO_MSI_NO_VECTOR            0xffff
>>>>> +\end{lstlisting}
>>>>> +
>>>>> +Note that mapping an event to vector might require device to
>>>>> +allocate internal device resources, and thus could fail.
>>>>> +
>>>>> +\devicenormative{\subparagraph}{MSI Vector Configuration}{Virtio
>>>>> +Transport Options / Virtio Over PCI Bus / PCI-specific
>>>>> +Initialization And Device Operation / Device Initialization / MSI
>>>>> +Vector Configuration}
>>>>> +
>>>>> +A device that has an MSI capability SHOULD support at least 2 and
>>>>> +at most 0x20 MSI vectors.
>>>>> +Device MUST report the number of vectors supported in
>>>>> +\field{Multiple Message Capable} field in the MSI Capability as
>>>>> +specified in \hyperref[intro:PCI]{[PCI]}.
>>>>> +The device SHOULD restrict the reported MSI Multiple Message
>>>>> +Capable field to a value that might benefit system performance.
>>>>> +\begin{note}
>>>>> +For example, a device which does not expect to send interrupts at a
>>>>> +high rate might only specify 2 MSI vectors.
>>>>> +\end{note}
>>>>> +Device MUST support mapping any event type to any valid vector 0 to
>>>>> +number of MSI vectors specified in \field{Multiple Message Capable}
>>> field.
>>>>> +Device MUST support unmapping any event type.
>>>>> +
>>>>> +The device MUST return vector mapped to a given event, (NO_VECTOR
>>>>> +if unmapped) on read of
>>> \field{config_msix_vector}/\field{queue_msix_vector}.
>>>>> +The device MUST have all queue and configuration change events
>>>>> +unmapped upon reset.
>>>>> +
>>>>> +Devices SHOULD NOT cause mapping an event to vector to fail unless
>>>>> +it is impossible for the device to satisfy the mapping request.
>>>>> +Devices MUST report mapping failures by returning the NO_VECTOR
>>>>> +value when the relevant
>>>>> +\field{config_msix_vector}/\field{queue_msix_vector} field is read.
>>>>> +
>>>>> +\drivernormative{\subparagraph}{MSI Vector Configuration}{Virtio
>>>>> +Transport Options / Virtio Over PCI Bus / PCI-specific
>>>>> +Initialization And Device Operation / Device Initialization / MSI
>>>>> +Vector Configuration}
>>>>> +
>>>>> +Driver MUST support device with any MSI vector from 0 to 0x1F.
>>>>> +Driver MAY fall back on using INT\#x interrupts for a device which
>>>>> +only supports one MSI vector (MSI Multiple Message Capable = 0).
>>>>> +
>> A single MSI (and MSI-X) vector is still far more optimal than INTx due to the inefficiency of the INTx delivery on PCIe transport.
> And lack of support on VFs.
>
>> And for sw based devices, it anyway doesnt matter a lot either.
>>
>> So when a new functionality like MSI is added, it does not need to continue what MSI-X has done.
>>
>> So I request you to remove this guidance of INTx fallback on single MSI vector.
> Let's provide an alternative guidance then.
> Device SHOULD implement at least 2 MSI vectors?
I think one MSI vector is enough for functionalities, just shared by all interrupts.

Thanks
Zhu Lingshan
>
>> Rest all looks fine to me.
>

