Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2043.outbound.protection.outlook.com [40.107.101.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788C651C4A
	for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 04:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726027211; cv=fail; b=rHg1B7pW5nbUqw+cC/W9e0vplpfM3Eqfb2JBT7JE7kSn4DtCjcPQdlCLdzRUCAU+T53HYppTd6DSoBfAWK6NXMfUSjx30JkdtE3Dbv72Ysm3VPo04bkZueHWWuGzWLWXl2mHCcRnlxkSqgUFj0IhNIoeQY+fJ8J0aLT2zl2pzfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726027211; c=relaxed/simple;
	bh=HQrXGfvhQmWlSO7FoiP2OIRjFlpv+UxCUVfU5fPkr7U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rBAG7hg9KWkHZltVjx7J4H8L/DAsK50F91I0YUkkCDQ9MzaQzwN8fUn0rQPDWcvygjyenrqrX+8kSVGxkup1JzruLVUv+JFRilYbo+di7ZTSfrVDIXETshbIJUyZNzhKw+aeKhrHCLxnZ7b4Ub8+pM+5M74EYYYSRCC35AuIUGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WTkmqFoT; arc=fail smtp.client-ip=40.107.101.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WTkmqFoT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfSApY2rCQYtzpnEoYvo9yamruWyv0QMwPprYF+ewb9hNbVkxsQR6BbFvcs7nItTPSs9T9agZxLyR3oFoUdMI5OepKQjU2a3ZjzS3wKnofuGjFfF/tPbqWzmqD6U5qX/C+ZABgEhJ+FFGtbH8cJ+rkTEsoaozXP141iGfbmrSbFrr+M7K8TNoaldLkgjCtkIVKVBobNyJCQl2N/OECRKOfw3Tv9qAV5+O0XXsvrlcINHNFKrxPSHFUw1EuTsd2HJv24bFkl48J+RCdLhoRBI63JRtP+nQQN/Bs6ot0L+1wytWbKM2+Bv4G+1ZGW+nQaZXffnHKrs7Qc2wZlBRjl6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7NoyJ3r0OvNs0i/E8UTcSNofyc9xTYzRtPaHhHH8IY=;
 b=nFyWL7+3Rp61zZIxigrdfhA6VRth/FzpRZH/+9ZGhlmmR6nqrWoAQ5hGm9irwyzMIRukNHvqLk1UkIPKw20UwAHGKQ7C+Lg7GUmvpdrsRz4VQxZrCb85/UP2gBIVKVLMnuHyU0vS/+njGUDXAayvGt1+QlXlSSQ6CP+MHEC05SyzYjR/aibzWMC0oMcX9GVBGr0J7em+cq9UQhvxc1LdD/1lCiP7AaJyYftcAZVRQ9+VEJxg53G9LwJpq+aJyQkgMLEvhq0XSvjChzntGxOBBiShcSyQrJ+BJ8wjkrz59n4xlntnfnUWnwb2NzO/bLxivV2oefyZ1Z7Ha5NemyRfvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7NoyJ3r0OvNs0i/E8UTcSNofyc9xTYzRtPaHhHH8IY=;
 b=WTkmqFoTKVfSf0phIdBwcjugLhaeCNqcwLsTL63bQXZnkPn1qQ/VOdFtgjtS2nh9AnuD7q7Mlszj/PK1YJH6Z8q1c1YWXsnCllbxfCY1hpFF9mzTR5oUnhRk1ZDAe1ovbsyhEQ79xH1K4W5ACPQ84oFp/TVt4KIApLPwc8yEXIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by IA0PR12MB8423.namprd12.prod.outlook.com (2603:10b6:208:3dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Wed, 11 Sep
 2024 04:00:04 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 04:00:04 +0000
Message-ID: <8a42e214-59b1-4085-aec0-0f31be885525@amd.com>
Date: Wed, 11 Sep 2024 11:59:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] admin: Enable driver to send admin commands before
 DRIVER_OK
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "cohuck@redhat.com" <cohuck@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
References: <20240910170723.44537-1-parav@nvidia.com>
 <20240910142850-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87136FC9671ABFF7123A82CADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910162247-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713AC1D273671DF459FA254DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <IA0PR12MB8713AC1D273671DF459FA254DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::14) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|IA0PR12MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c70a9d5-979b-424e-23d5-08dcd21637a4
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?YlQ1WEt3NU12SWVDbndtaHlsMnJyWEFNQ29UaWlCd293SVNVamJCRUl2RHNo?=
 =?utf-8?B?YTFYWmpEbFpXTkpnVVFZQmltMkhYT0xVNlMweHZBK3N2Z1pxbzZJM055cmJj?=
 =?utf-8?B?eHVZRnlvTzFXWnlUd3NvRExMRy9rQkhlZE1LMEt3cG1UMk9YM3NXSFdGa1BQ?=
 =?utf-8?B?bFVxb1J0cFlwS28yMXBnQjZMOW0xQmg4OGU5ZWY1aTk1aG9idE9uNVZvZVMw?=
 =?utf-8?B?bEliTXNiSWwyMDNmYkR4ZGI5NHh1VkYzeEpKVnZxMitVYXgzbXc0NUJvU0NK?=
 =?utf-8?B?RkdGUkF1MXVlUFREWktZQWZVdFk2aGpOdW1Ja01GeUNzQzB1YVd4L2FYbFNZ?=
 =?utf-8?B?akYyZ09GVGRQTnRGRlBiRUJta2NjaWZVeVMyZUlBYTltZXFVWFViVGVTVE1p?=
 =?utf-8?B?V09uSGY1V0tHYUMvYmFxUHFsMHlhdTk5VVNzeVU0KzdmOTVCTWdXSklVcUxa?=
 =?utf-8?B?Qm5DMjlaT2k0Mm5ZRThrY3B2QnMzRldZZjRpNTRpREEyYldxSDhKemxrN1Zk?=
 =?utf-8?B?cEhiS1hNNVJ4Ris5UHMzcHJ4TDNVbnozU2dQcHVQenVQbXhQT0JqaEZ4d2g0?=
 =?utf-8?B?NjRpY0Zxc2pJekxOanBsaWlEc3lmSytWMG5hS0RwQ240MUd2QmlaNUpDUHJO?=
 =?utf-8?B?SGtMZm5Oai9sdWx1V2VXc0ZiMjZ3dnEyZVNVa1JseUZpSGtCQVU4bUhFUzJ4?=
 =?utf-8?B?cWpSOFl3TUczWGxKR1FOdFA1SUptZWt5NGxGRUQxem5WajhtWnprOXZPNld0?=
 =?utf-8?B?K0grNFV5bkRjZDV4Njh6Q3g2czFOVmp4NUdzUGY2b0tkOUFwcnZoMlVoVm50?=
 =?utf-8?B?TVpQaU5nRGY4bmFvNmFWeWFpNVNYczlTZXlINHNWdXZmTEcxSG51N0hHcFpF?=
 =?utf-8?B?TEZBTHdVOGh6RW1TaU4zZ1pnR0FQYnlTQkNRZWFHVmxtcjNvSVlRWWtZdnNO?=
 =?utf-8?B?ZlU1dk9KSUdxWFAvTmFUVFhjeCtqRlg3eEFZbVBYOXpoOXUvV3lmS2pKMHpD?=
 =?utf-8?B?ZUhkakJLbCtlQW94bmFiUDluUStuNkM3RjRwWFJQM2xlMUw5c21HTXpBZGlW?=
 =?utf-8?B?ZUJHMVJsMWhFaXQvTUtiMHh5Nnlxb1pGYWdkOW9vVXRURHJLL0dySUdJS3VW?=
 =?utf-8?B?VmwvNFV0bWx1V2lNbzZDSEoveWM5dkgvRDYwVWJ2NTV6M0VSdEJyYUlSSGF1?=
 =?utf-8?B?QkhxNjdyckdyNTRienpzcW4yQ2hRZHlOZEs1VGZrc284NzR1V3BJQ3UxWFFF?=
 =?utf-8?B?ZVRtQUMrb0hWT2xVdlM5TnZjblNMa0dJdlk5VlFVMFduckpYZGVwRVFnMDBT?=
 =?utf-8?B?NUNrUXJPeitsazlxMWxFemZYeWdYTVZVNXAyN3NKRVJLN051R0VZbWhJcDd1?=
 =?utf-8?B?Uyt5VmE1ZitIRXl4cVF5d3F6RzNZbDlkdXE3QnNXQmJYMm5BbEhTZFY3QWhl?=
 =?utf-8?B?T0srMFRDU3AwVGd5VE5ydWVVZXo1WWhDZy9jT0U1eVFtdnk2MFpSWkk5MG82?=
 =?utf-8?B?SlF6cWFxdUNFeHJobG5JbjBLR29lV3NtN0tOVWkvTVp3UHBWd0RSZlNQQUd3?=
 =?utf-8?B?UHBHZmNXUzBwTWpGRTJQTSsybXZUT1Npc3U2R2IwSW4xcENIdm5xbmdkdmVa?=
 =?utf-8?B?aEpkbzJuV3lRYzZiV29GeW8vZ01VQ3ZoVlA4TTViWm5wTFhnZTNYaEdBNDYr?=
 =?utf-8?B?VVNsbGZFRmlOQnpBNVhlRFRGVWN2RXp4SEtYSHM5d2NibFB4c21jRmJXK3U5?=
 =?utf-8?B?UzZEVzZ0VDgxR0ZuV1FzeGhmUW1vbU80VWxwN00xUDJSWDNKcytNYjFHY3Jm?=
 =?utf-8?B?TkR6V1NjK3VsdnZUZG10dz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WGg5aFNXeUc4eFBobHBVWVEvdGc2TW10MVJXanJCblkyVHF2dUR3Ry92Nm1K?=
 =?utf-8?B?U2djeDhZUnIxdjdEOERTc21yaC8rMy9hdW5YbEZUWVlEUkIxeGtsNnJ4Sys0?=
 =?utf-8?B?Z0FlSVFLQTdjZnlWZG16NmhkWGtqNkkyMy83TFQzSUo3VlE1QjQ4NFN5eDB0?=
 =?utf-8?B?RUZlRHNZWGtiTTIycjZUUmpRNXExZE9tR1hlVnBtOUR4M1dhWHF0elVEdlM5?=
 =?utf-8?B?MkFDRW9Ob2hsVDIyT0l1SkdkTWsvNVUwMFd1N2RaVUEvak1CK0JoQ3RURmZZ?=
 =?utf-8?B?VU54UmNiM0FCLzNnaEZZMEFwbkZraU1MN3I0STNKU285TzRrVlJPa1cvS0tB?=
 =?utf-8?B?dDVUUlB1K2NBUGlOS3M2NkthNHhQTzZDN2ZVRlFEMk55MUwxeERNc3FrcVRw?=
 =?utf-8?B?c0RlRGFzcFM0UEt6WFp2RzkxVS9BdWFmWGE1NHEvV3hVU2g4Q2dJS1pEaUFU?=
 =?utf-8?B?NkRnVmVjV0s2YU1jMzJkOC8zaWFWU2IxcEN0VkNoZERRRlQ4UzVaa0h0ajlk?=
 =?utf-8?B?b1pQUjc0S3ZPd0MzNHZTalFhdDE3ZlFiMjJ0eEp2dExOMXprTk1ac3RpNGpU?=
 =?utf-8?B?bHVWS255b0NWczdCM2xCUjlWYXRseUlSOENneHpJdHNVWWZCbDJ5MXcyRnNS?=
 =?utf-8?B?c09Vb2pYN3ZTUnAxeThiVEpFWithQXdhWUIvejhmbnlKbnVrYllpTHFqaE5B?=
 =?utf-8?B?L1VRL0FyTXlCVnhtc1AvaXdMQWoxUk1UMFRJSEtkUE5GRjY0KzNWWWh6RjI2?=
 =?utf-8?B?dUZVQVArekFDeDFRVlVTQWdzZDBRdHVFaGJHZGtOd1V3bGltLzFxbW9keFBT?=
 =?utf-8?B?V2o3WWVJQUkzK1haZzNBSmhRdVFUVHR6T2oxREl6WENYUTE0bTU3QTl1RXVh?=
 =?utf-8?B?cWorR2N0WWRRQU50OCtEWk5pd2orQnhUREI3RCtWT1FkdWdFb1J5TFNRK25Z?=
 =?utf-8?B?TlZsQS8xTFR4VEQ4UmovczV1MWtyZy9RR0FGZm5YRGdkYnAvcGFkbGdGbnhC?=
 =?utf-8?B?ZHpERU1aSzRNNERzYkpJQ3UveGpOK3lRWnk5OHM1NlM4cFk4MFVWdzB4bm1G?=
 =?utf-8?B?cm1BbGRzRjl4bjNZay9VVitIbGhpY2JsNlQ2UVNKTW5lVmlmSDVwNG4zRXJ0?=
 =?utf-8?B?QUpQdVl5NElEb3QrNU41MXgvakhvclh6dzhMSGRqQnFUT0x3MUJXYkowazlm?=
 =?utf-8?B?QjR5V0JEKzJRNXVwM0FBYWV3bFJMNTZSVk51b0xIMHV0WjZZS1hpcnBtbGpF?=
 =?utf-8?B?SFVZWmZKWEZIc0hVanBDSjFoMmJER3NYOXJwZWczVERZbzhkWUJBTjF3d21h?=
 =?utf-8?B?d2oxYmMvQ2dIZ1pVMTNnNVM0TzQvNWJFelU5QUl2VXROdkNJQlRwSHI0T2h6?=
 =?utf-8?B?QktCSk5mKzVOZFBpR2p0QWpqMXlMcFhZSVNENjVDNk5iS1EvYnpWa041OGFU?=
 =?utf-8?B?dFNhVWExVEtEMldwZHJNbkpTNmR1UmV2Ni9Ob3J3S1JoM0FCM2loc0EvR0RW?=
 =?utf-8?B?cUN3M0J6ZE84bzVCTDVuVGM4OXlQN2dacy9Gcng3ODFxZHJ2aS9PSGF3aUxu?=
 =?utf-8?B?eGlPRzY3Y2Q3T05GTkN4dm5pWUJyR3FHOS96RVVCSkhFeE5WS1ZCZW1MaUNE?=
 =?utf-8?B?ZlVmVEM3Y2VmQXZoZDJsaGV4RkJ1d2p5bC9tY3hEMGRNc0hQeiszd1lkOVFO?=
 =?utf-8?B?RVgrUVlKT0pBQVNqUjYrd0JiU1JMZk1IZWQzMkZzSmRaRFFqYitJT3gxd0dm?=
 =?utf-8?B?QlJIb29hNWRlRWdwSEVSaFRCNGNmNkE3ZUJ2YmRibEt1dFVJOTZZVUE1RmpW?=
 =?utf-8?B?Y1c4MTNnY3RJL01tTUoxeEN5anowdVpueTc4MGk1OUYzSXNxakJCU1dROFdv?=
 =?utf-8?B?bVJtSnB4UVV5Yi9PWmNNTSthOTI5N0Uva3oyRDVhK01rWFlGTHhtbEZGajdI?=
 =?utf-8?B?alQzUmh5M2RrSnhmdDFMZTRyNDd0VXNIMmNpRkJEbCtaVmNpV1V4S0JjSFU5?=
 =?utf-8?B?a0hiTmtXemdkbkRQVm5RdUhnZzBoY0VyVHZReVJIa2NIK05SRUtuVTJ5RnNi?=
 =?utf-8?B?RFlmdXBSb29aWkNHKzJ4aEdKQURyUjkvWEdzQTBpWUNXcUdvWEdMdE42dE9P?=
 =?utf-8?Q?iYQA04JfHGN8mDCkJxx6VIp86?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c70a9d5-979b-424e-23d5-08dcd21637a4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 04:00:04.6718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4sNXG2tj7mjzNrsZ0FPloQMQLxousVUTi1ER1rPObAsXkl7KSM0PYTvk6emlt6ORPxXunf1qVJ12t3crjxToA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8423



On 9/11/2024 11:37 AM, Parav Pandit wrote:
>
>> From: Michael S. Tsirkin <mst@redhat.com>
>> Sent: Wednesday, September 11, 2024 2:06 AM
>>
>> On Tue, Sep 10, 2024 at 07:01:08PM +0000, Parav Pandit wrote:
>>>
>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>> Sent: Wednesday, September 11, 2024 12:02 AM
>>>>
>>>> On Tue, Sep 10, 2024 at 08:07:23PM +0300, Parav Pandit wrote:
>>>>> Currently the driver can operate administration commands using
>>>>> administration virtqueues. Administration virtqueues must be
>>>>> enabled before it reached DRIVER_OK stage similar to all other
>>>>> queues. This is a limiting factor.
>>>>>
>>>>> Many of the device functionalties needs to be discovered and
>>>>> configured early enough before the driver reaches the DRIVER_OK
>> stage.
>>>>> Some examples are:
>>>>>
>>>>> a. driver wants to dynamically create the virtqueues of virtio-net
>>>>>    device with more parameters, for example header data split,
>>>>>    multiple physical addresses.
>>>>>    Here, the driver needs to tell PCI device early enough that it no
>>>>>    longer uses queue_* registers for non admin queues.
>>>>>
>>>>> b. driver wants to discover these features and related attributes
>>>>>    early enough so it has chance to decide to proceed via admin
>>>>>    cmd interface or proceed to DRIVER_OK and follow the current flow.
>>>>>
>>>>> To overcome these limitations, introduce a feature bit that
>>>>> enables the driver to send capabilities related admin commands
>>>>> before DRIVER_OK via the available interface such as administration
>> virtqueue.
>>>>> Signed-off-by: Parav Pandit <parav@nvidia.com>
>>>>
>>>> We were there in 1.0 and it's messy. And next thing you do, you will
> Also if you can explain what exactly is the mess, if there is one?
As far as I can see, the spec says:
Set the DRIVER_OK status bit. At this point the device is “live”.

And no vqs are active before DRIVER_OK. How can the device assume that
the driver is ready before DRIVER_OK? Why admin vq is special?
The common config space is not enough to init a device?
If you see a gap, how about fix it in the common cfg?

Thanks

>
>>>> want it before features ok, and we will keep piling up hacks.
>>> I don't see any motivation to do before feature bit.
>> I do. 
> Can you please share the motivation, why one wants to enable the AQ before features_ok?
> And how would it configure all the basic things to operate a AQ before, for example, PACKED, VERSION, PLATFORM?
>
> If the motivation to negotiate device specific features via admin command, then that is still possible with current proposal.
>
>> And I keep saying, we need to be proactive, address more than one
>> problem with each feature and try to predict what will be needed,
>> otherwise it will be a mess of a million conflicting features.
>>
> Sure. make sense.
>
>>> Never before features ok, feature negotiation is two ways communication
>> that indicates device, that queue notification is coming.
>>>> I think that if we want
>>>> to do admin commands before VQs are active, we should just add a
>> capability
>>>> with registers for that. People wanted that anyway.
>>>>
>>> We discussed before that pci-sig discourages piling up vendor specific caps.
>>> So better to avoid that.
>> Well, that's a separate issue. Actually pci endpoint guys already want
>> a way to access device without messing up with capabilities.
>> So we'll likely create a way to put capabilities in a BAR.
>>
> So lets take the base line design requirement and see what more options do we have.
>
> a. do not extend pci capability
> b. utilize the current q config registers
> c. have bidirectional negotiation if driver will use the AQ early enough or not.
>
> With that what do you propose?
> A new register in the BAR instead of feature bits?
> How does the driver tell the device after reset and before features ok?
>
>>> An alternative would be to bump up the pci revision_id, which would align
>> to pci-sig and its known early enough.
>>> Though it does not take away the feature bit because device preparation is
>> needed to setup early admin commands.
>>> And feature bit can be a good hint to inform that.
>>> Only revision_id (from device to driver) is not good enough as there can be
>> large sw stack which may never use it and no point in enabling this in the
>> device without driver using it.
>>> So feature bit proposed here is self-contained, and its early enough.
>>
>> I don't really get what this revision_id discussion is about.
>>
> I will pause explaining the issue with rev_id for a moment and see what is the efficient way than proposed?
>  
>>>>
>>>>
>>>>
>>>>> ---
>>>>>  admin.tex         | 16 ++++++++++++++++
>>>>>  content.tex       | 13 ++++++++++++-
>>>>>  transport-pci.tex |  6 ++++++
>>>>>  3 files changed, 34 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/admin.tex b/admin.tex
>>>>> index 39fc072..95054ed 100644
>>>>> --- a/admin.tex
>>>>> +++ b/admin.tex
>>>>> @@ -334,6 +334,11 @@ \subsection{Group administration
>>>>> commands}\label{sec:Basic Facilities of a Virti  supporting multiple
>>>>> group types, the list of supported commands  might differ between
>>>> different group types.
>>>>> +When the driver has negotiated the feature
>>>>> +VIRTIO_F_EARLY_CAP_ADMIN_CMD, the driver can use administration
>>>>> +commands VIRTIO_ADMIN_CMD_LIST_QUERY,
>>>> VIRTIO_ADMIN_CMD_LIST_USE and
>>>>> +commands related to device and driver capabilities listed in
>> \ref[sec:Basic
>>>> Facilities of a Virtio Device / Device groups / Group administration
>> commands
>>>> / Device and driver capabilities]{device and driver capabilities} for the self-
>>>> group type before the driver indicates DRIVER_OK status to the device.
>>>>> +
>>>>>  \input{admin-cmds-legacy-interface.tex}
>>>>>  \input{admin-cmds-capabilities.tex}
>>>>>  \input{admin-cmds-resource-objects.tex}
>>>>> @@ -608,6 +613,14 @@ \section{Administration
>>>>> Virtqueues}\label{sec:Basic Facilities of a Virtio Devic  or
>>>>> VIRTIO_ADMIN_STATUS_ENOMEM, then the command MUST NOT
>> have
>>>> any side effects, making it safe to retry.
>>>>> +If VIRTIO_F_EARLY_CAP_ADMIN_CMD feature is negotiated, the device
>>>>> +MUST process administration commands related to device and driver
>>>>> +capabilities before the driver indicates DRIVER_OK to the device.
>>>>> +
>>>>> +If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_CAP_ADMIN_CMD
>> features
>>>> are
>>>>> +negotiated, the device MUST be able to generate notifications related
>>>>> +to the administration virtqueue before the driver indicates DRIVER_OK
>> to
>>>> the device.
>>>>> +
>>>>>  \drivernormative{\subsection}{Group administration commands}{Basic
>>>>> Facilities of a Virtio Device / Administration virtqueues}
>>>>>
>>>>>  The driver MAY supply device-readable or device-writeable parts @@
>>>>> -641,3 +654,6 @@ \section{Administration Virtqueues}\label{sec:Basic
>>>>> Facilities of a Virtio Devic
>>>>>
>>>>>  The driver SHOULD retry a command that completed with
>> \field{status}
>>>>> VIRTIO_ADMIN_STATUS_EAGAIN.
>>>>> +
>>>>> +When the VIRTIO_F_EARLY_ADMIN_CMD feature is negotiated, the
>> driver
>>>>> +MAY send commands only to the first administration queue defined by
>>>> the specific transport.
>>>>> diff --git a/content.tex b/content.tex index c32c218..12f9224 100644
>>>>> --- a/content.tex
>>>>> +++ b/content.tex
>>>>> @@ -540,6 +540,8 @@ \section{Device Initialization}\label{sec:General
>>>> Initialization And Device Oper
>>>>>     device, optional per-bus setup, reading and possibly writing the
>>>>>     device's virtio configuration space, and population of virtqueues.
>>>>>
>>>>> +\item\label{itm:General Initialization And Device Operation / Device
>>>> Initialization / Capabilities Access} Optionally get device capabilities and
>> set
>>>> driver capabilities if VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
>>>>> +
>>>>>  \item\label{itm:General Initialization And Device Operation / Device
>>>> Initialization / Set DRIVER-OK} Set the DRIVER_OK status bit.  At this point
>> the
>>>> device is
>>>>>     ``live''.
>>>>>  \end{enumerate}
>>>>> @@ -550,7 +552,9 @@ \section{Device Initialization}\label{sec:General
>>>>> Initialization And Device Oper  driver MUST NOT continue initialization
>> in
>>>> that case.
>>>>>  The driver MUST NOT send any buffer available notifications to -the
>>>>> device before setting DRIVER_OK.
>>>>> +the device before setting DRIVER_OK; however, the driver MAY send
>>>>> +buffer available notifications before setting DRIVER_OK if
>>>>> +VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
>>>>>
>>>>>  \subsection{Legacy Interface: Device
>>>>> Initialization}\label{sec:General Initialization And Device Operation
>>>>> / Device Initialization / Legacy Interface: Device Initialization}  Legacy
>>>> devices did not support the FEATURES_OK status bit, and thus did @@ -
>> 879,6
>>>> +883,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature
>>>> Bits}
>>>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
>>>> for
>>>>>  	handling features reserved for future use.
>>>>>
>>>>> +  \item[VIRTIO_F_EARLY_CAP_ADMIN_CMD(42)] This feature indicates
>>>> that the device
>>>>> +   exposes an administration command interface which is accessible to
>> the
>>>> driver
>>>>> +   before the driver indicates DRIVER_OK device status. When this
>> feature
>>>> is
>>>>> +   negotiated, once the the administration commands interface is
>>>> configured, it can be
>>>>> +   used by the driver to issue administration commands related to
>> device
>>>> and driver
>>>>> +   capabilities.
>>>>> +
>>>>>  \end{description}
>>>>>
>>>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
>>>>> Bits} diff --git a/transport-pci.tex b/transport-pci.tex index
>>>>> 95b08b8..a612b34 100644
>>>>> --- a/transport-pci.tex
>>>>> +++ b/transport-pci.tex
>>>>> @@ -495,6 +495,12 @@ \subsubsection{Common configuration
>> structure
>>>>> layout}\label{sec:Virtio Transport  to ensure that indices of valid
>>>>> admin queues fit into  a 16 bit range beyond all other virtqueues.
>>>>>
>>>>> +If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_ADMIN_CMD has been
>>>>> +negotiated, the device MUST support administration commands
>> through
>>>>> +the administration virtqueue identified by the
>>>>> +\field{admin_queue_index} after the administration virtqueue is
>>>>> +enabled and before the driver sets DRIVER_OK to the
>>>> \field{device_status}.
>>>>> +
>>>>>  \drivernormative{\paragraph}{Common configuration structure
>>>>> layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device
>>>>> Layout / Common configuration structure layout}
>>>>>
>>>>>  The driver MUST NOT write to \field{device_feature},
>>>>> \field{num_queues},
>>>>> --
>>>>> 2.34.1
>

