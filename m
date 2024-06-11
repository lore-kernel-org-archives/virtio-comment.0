Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E0617997D
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718107978; cv=fail; b=D+iRGxp5GSVAAWOIEmE193KqiBVS/EjiSl7ONH0yeeZ5djguMz6DjnFlUP3TTCG2kSMChHy105gy4gbPgdBtfNl4hMSNijQH8uRETFi0NZGglLMrCOPwd3YLzT/sHI+Ep5ksdX5ED70+dNjBaIg30xiOmC8VioAbRIcBOFCZk6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718107978; c=relaxed/simple;
	bh=AmxuSCns1iLQXPUUQ518O7z5Y/ykx7nPMRLCNeqlcRM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QjLZn3jVzcKB83MbPtUJoF9a+3XbFcpEItET4vfogo7yZgI+PzT4//U5+vvpy5JBGEXtn5vcCmJMx/nUjPcvAHPxDSBZIOIEwptKlZ6ZpN/AcZpatIQdXFbZ2jvnObkcPKBRGOAfqYOQ7o/WB+bBMq3u8ydI1+NPxSnRNTHk51Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=bclchSzR; arc=fail smtp.client-ip=18.185.115.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="bclchSzR"
Received: from 104.47.11.169_.trendmicro.com (unknown [172.21.181.109])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 0D03A10001D1F;
	Tue, 11 Jun 2024 12:12:53 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1718107967.255000
X-TM-MAIL-UUID: c20c8d64-4e75-42c2-93f2-8bc4bf24f305
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.169])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 3E78F10000312;
	Tue, 11 Jun 2024 12:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn3iib15a4ULJKEqz35+RQz84IJU9AMfHki3UbJYxuz2L06Slx0evNNN1KxRqz8FNgtAA8SwWcgHTDbtSmLFHY6Q15RniPqO2c38OuKIoERx9bmJnpFYwLpQcyFISp3QePGStu2JMX0hT2rvi/vZLo+H6SvvqyxnwRniqWHg9iqBMIqFIBsaMod6kXgqCL92f23BscBSxDocr1KyIc1wJbXbA1M5EM8kChX0Rw3Zw2pJO3H0WZ9VatURtbZuNZgAeex3Fr7j9lDT7/we9cFIrxi0OoQ8uxCwLyFWJAxR251rW1hNFuCOJRR7DKgu5/sxN7IbJI0wjRvR46gevoMfnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Mivn0gXKQUK2vvYEdbuguZEZJ6Fuggu0vmgLXFZTFM=;
 b=igo2GQwuOUniZqU5PNHHn7FNhshSjWhYypTnYj/Iy3JmGSfVv68tZgmLbssdohyyEZLxmwSAtdCjnDmZcv7mWoRZOkr1NF+K3LWAhZXtlDrdaX1IjbFrV2183xm2H3ITAtX8ufJ88HwOKGy4LEDwkQTutV0IYtx8i7QbAsUTGo42+cZzc4B0URSIUlNwMHTGQZRTqbEqFzu21xxGqHYb0wrMJx5+2MFhcAMT9UTNvyJ1scFhvrOlYSwKh3+hVTYpog3AYYNixRkGWeSGrBrqevj/jNhRnxcVCT/y19wmvfiBFKrmICYKuYg+WSe/a8ZHcLDqOWKv3ArAhvoz7oBRWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <92964190-81d0-4419-833a-65e254abc0df@opensynergy.com>
Date: Tue, 11 Jun 2024 14:12:42 +0200
Subject: Re: [PATCH v2 0/1] virtio-media: Add device specification
To: Albert Esteve <aesteve@redhat.com>, virtio-comment@lists.linux.dev
Cc: changyeon@google.com, eballetb@redhat.com, daniel.almeida@collabora.com,
 ribalda@google.com, acourbot@chromium.org, mst@redhat.com,
 gurchetansingh@google.com, Matti.Moell@opensynergy.com, cohuck@redhat.com,
 nicolas.dufresne@collabora.com, alex.bennee@linaro.org,
 Alexander Gordeev <agordeev@qti.qualcomm.com>
References: <20240607133508.1400529-1-aesteve@redhat.com>
 <CADSE00K5RjuLY1UKfPiAMXv=HWJC3hdp9yvo_t7yr9HqhAVotw@mail.gmail.com>
Content-Language: en-US
From: Alexander Gordeev <alexander.gordeev@opensynergy.com>
In-Reply-To: <CADSE00K5RjuLY1UKfPiAMXv=HWJC3hdp9yvo_t7yr9HqhAVotw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::15) To BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEXP281MB0183:EE_|BEVP281MB3711:EE_
X-MS-Office365-Filtering-Correlation-Id: f07edc4a-c63a-44f1-362f-08dc8a0fcd43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QU9jV0VTQjV3VE41ejB5VFBtVktDN1BOZSttREVFWXRVcVVKenNUUVZwSmpS?=
 =?utf-8?B?UTNvMGhrRmc4S3BuaEsrTG1QVXBlbXErQXU2ZG1lV0FEa3YvcVNjMTFMbm1p?=
 =?utf-8?B?MUkveWZ2ZGhNeWl1QlcwWjZNeVJnWXBVYXFma1RQL2pScHhmUXV3dmJ0Yk5r?=
 =?utf-8?B?YjM3QThTUjkyQXRpeUR0RXcxTVJDZ2pWS1JHd2VrenNzN1U2cDdlMlpoWnpV?=
 =?utf-8?B?aHF2YlVCOFRXMEhoTzJVYXFWU3krZWJBaVdPamY0U2lzUnlBQWpxanl1R2ND?=
 =?utf-8?B?U01wVm5JOG1kbGVqVVJENnFTeHd5RkJMTVFkSXdSd2g0NkkwcXJhcVZoa0Fz?=
 =?utf-8?B?R2Z4VGJzL0JUSmVPdjJlSWp4WW9FMXZBaUZmK1h1QlFRaGJWY3B4WjZUVGIw?=
 =?utf-8?B?d0ZJSmZUWm4veHpEWlcvNThVUlBEM0p6MGREV2R2aVZOdFRtQytmSnhZQjhO?=
 =?utf-8?B?RUwxL1ViNGdkK3BjbmFZUGFBV05CSlBZQmloSUtlOCtlZUhyUE8zaVFyVTh4?=
 =?utf-8?B?blBIT1NIZTcwUE1oYlhKWTlMOEhjakFGU1BoV0o0YnRwOXZnQSs2RDA2TEtL?=
 =?utf-8?B?dE8yOUdQdENBRDVEMUdtRGM0dzh1ZmdPbFFJTjh5eWhRMnpKdWowOFYzRWVE?=
 =?utf-8?B?T1F2SjN2SXRUcHZYWmtDWkk3aGR0YnRpMnQ2M1Y2RDhoR3dnd1ptUCsvTjd5?=
 =?utf-8?B?a09SbVp6UGJiSVhHeHRHeFRiN0xqbnNTSCtZNzdiWTdORSszNGs4MWlNSUMr?=
 =?utf-8?B?RUsxS3psTzQzRmZyUE13T2pJZmlvMWN2YUpzWXp1TmhXVG5CWUpid1V4bGVR?=
 =?utf-8?B?KzlkeVZ3VjJoNCtBODdBdVF0VmY2eURlb3ZXbnlxOUdjYjQ4TEVFcnpOYkFp?=
 =?utf-8?B?YjVCb0pPOUVseFoxUDFka1VCMUtXSWdETDNyVGxNMS9NOGRKOEJIYTdrajhL?=
 =?utf-8?B?QjROd1NPckx4ZkJOaFhmNG52RG5IY3g1QzI1Z0s3aEtXaFpYbU5tN05rQzBh?=
 =?utf-8?B?dWxCN0srSmljYmtLK2phSVpMQWlYelBIMkhVVG9zZCtIZElVU2t0SWFGR2Y2?=
 =?utf-8?B?bmdKUnNEcVVPemRaRy9sRFowbnZuM1ZySGx4ZTdIa0w0V200N0dLVkdKa2g3?=
 =?utf-8?B?QlF4OFRRUGxKRXVDVVM5NzZEMWZiRThtRU1qZTgvUi9Jd3dZQ2hrVHc2N3RP?=
 =?utf-8?B?b1YxTGVuUEQ5VGhwekx2TUFSbi9OekhKdndZYkhzSnlvYlBOdlBMcU8xbDFD?=
 =?utf-8?B?UlVnMmoySEJKdDF3UFRKbmVMVlNFelRrM0JDM2VLQ1lXQnZvZjk3NElaSzAw?=
 =?utf-8?B?WGFtYjlFczVqNjZJS1JsUFppM2prM2Ixb0Q1RkhXcHBmbkRoWTJpUU1EdE96?=
 =?utf-8?B?eTl4U1lYZXdMcDF3bGdqM3RQbFFJMkp6Z2hzbmp2bnROSis2NTAxT09BWW5m?=
 =?utf-8?B?N0FHVENPNGZPZE5vaVlFTjJraGN2NHJwR1NVTE1taFJ2SEN4bE41TEt4TUZU?=
 =?utf-8?B?cnY5YmdMSTRqQnRGNEx2eGx0RG5pWS9oZjgxd2VPcTdKV3BKay90YnJLejlz?=
 =?utf-8?B?SzNVTkV4MkJwb0NGd0F0WXZzNCtJMWlxMW90NE9Sei9sZnBDU29FQ3Rza0hG?=
 =?utf-8?B?UTZ0VTB0M283dXROYjdnWmZ2V3NCVTNURW9UZEFwcFRXUzE2cVZCSGRRaGZu?=
 =?utf-8?B?WS9ZRGJuRktZRlpzRWZxWlNoS0wyU0p6UnpIcE5mSVlBZEZMNFdBUHR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3VoSzVJUjdrZkRhRklIVWNWNk94R01XNEJYSjl5dm1TUCswTXBEcnh3Zzd1?=
 =?utf-8?B?cnRBODEzZXlCMDB0K0VncVhpczBTQXVOOXZrK3lzSGUyN2RJa25PMVA2eG5u?=
 =?utf-8?B?Qjdqd2NPeDAxMG1kRHgrdHh5bzBELy9YeFU2dVhUZnFoRFlGMmc0UUxyeVcy?=
 =?utf-8?B?QUJQTG1uMUFmdHhObWR6Q0RzTG9TZ0hURmxYU3p2TlRQZC9CNjI4TnB1QXJN?=
 =?utf-8?B?bWJzcDVMbHBRU2Q0emhONGZZZ0RLa2kyUGpSOFpuTnR2cVYvWHNXdlh1QnZT?=
 =?utf-8?B?MVNWbVgxZmphaVRtSjUvcTFRTEpuOUlJUzREN0NDZ3JpUC9taG1LZktQcmlt?=
 =?utf-8?B?aVZzbXVYbGxaY0JMczVWQ09YTDltd0l0ZlYyamhHUk1iZmR2UU9UcVgrV3Yr?=
 =?utf-8?B?NmhUR1JUbkhtZVU5MWNpQkprL2ZwLzk2WlNtampaenhxMWFYSk9NeGhzbHFC?=
 =?utf-8?B?M2FrOHZKOTQxR0s3RFZKdkVHWG9pUEYyenZMOUFUWjFjd3MxZVVERXFBdVJF?=
 =?utf-8?B?MGtldjJYK2ZrL21sSjk3Rk5PT1dSOWkzaWJlZTV3cE5FTG1CbndrMUpJcnlm?=
 =?utf-8?B?L3JTRXRUcE5BQ3JGNCtIbERRWkNSU0hGcXpQeVJ0NmRiOHNKaEVzZ21EK3Yy?=
 =?utf-8?B?RFdhM3hCSkIrSlE3NFFyeGprUW9URERSZVAzY3VEMmZ6YmF2THBFUm9hczI5?=
 =?utf-8?B?Wjg4TjJrUHVqL0huam1qeXJSeHk4UlNCQUNFMFMwcTdKN3JVWDRYa0wvS0lJ?=
 =?utf-8?B?NHFUZm1HU3pJeUFvTFlNVDlvVUJQM0xTaEFyOFlTa1BSNk1pRVFYQWV6b3A1?=
 =?utf-8?B?TTVTWFVQSEgwUjdKWVNuRlRwamJ5UUEzY0tEU0I4Q1d5QVcvdDZqMWF3RXI3?=
 =?utf-8?B?ZlZ1dXVueFM0d2xBQ0tqVENzZ3J5cU94UmM3bk5Ca3pPMFhhWEFma0ZJdW13?=
 =?utf-8?B?SkpyVkNtWGExaENIM21MMm1WY3BJaTNGdXBxSUlrMFlHSTU2WjU4dkhRYzlR?=
 =?utf-8?B?RkFVQ1NsQWsrOG8vNjdtb0d3SWxwMjJSeEdMUDhIUlVLencrZ2o3UEo1NWRy?=
 =?utf-8?B?SE9WMHNTRVBtdVVFRmd0Zk9mTkNwZjUrbHp4OGZFZTI5RVVyUXJyaWZxclJT?=
 =?utf-8?B?Q0ZEMnZqZFRPMmlSTGZlTHp0blk2RUsyU2V3TWZMN0hrdE5LY1VJT2hxZ0RG?=
 =?utf-8?B?SXRuTXg4MG5WNWhKRHlTQkV6ZHMxZFgxSk9pSnNnMVpHYnIxcmd4MEg0eXdM?=
 =?utf-8?B?T3FWNkMrSUx0YXRzWGcwa01SKzk1VlN2Q1pvdDR4eDVqeXlUMmFtQ1V0bkVm?=
 =?utf-8?B?RkFHWUl3bjMxRzNqbW8vQWRHMGFZYXJsQUV6NzhSTUVYOWg0VzFjd1BZZ21y?=
 =?utf-8?B?MGNQTU9VSnowV0p2dnR1RXA1V1JGOHBiM2VDTzdUZVBGbmdzUUZXYW1RUGwv?=
 =?utf-8?B?dm9MVXlqWVJLSnB3UHhlTkR2SStUYlBGYmlMeDF5YkJFQk1UaVBhaEI5cE1o?=
 =?utf-8?B?YS9oazJrdFliNHFJWjI4aDVYR3BMdE9WTVlPTUxVYkdtWUpUb2gvRnp6YWll?=
 =?utf-8?B?b2hvWUVjdGZWZFZtOXIrUlRhNTJ1TVVWZVFRNDlqbDNzM2ZUalRPMWJTRUtI?=
 =?utf-8?B?VzJoclJuTVdMcjgvQ1M0TWdtWkdmaFNhN09pSzZIbzV5MWhXMHVtaHNsdTdr?=
 =?utf-8?B?Q3NCSDdJSW03ZG9IbGFZSW1INkJUenZvWkgzUWRndk5mNU5JSjQ4aERrdEZL?=
 =?utf-8?B?VmhWaTRleklEQjAyTHhVekRVNEpid0RIUHQ1UHBOcGtVeC9zOURzblV5TXNa?=
 =?utf-8?B?OFJ5T1pNcldMZjNzV0NhZU1SS25tSERBR1ZTNnhJUko1Y2RKS2prWkcrNFhG?=
 =?utf-8?B?QUVCRnF0UVdEK3gvbHdFZ3FiSVdxdVB2UnA2bUgvTmhuK3g4bG5Ed3YvVXFJ?=
 =?utf-8?B?UkQ2YVJjTHJKbTZHWUNkd1VlZ0luRWUvZFJ4WGM1QkVmb2RuQ1hmck1TeTBH?=
 =?utf-8?B?aGxKaTh2Y3Vtd0lqaU02TCttc2NjNzhHUjNWei8vVk9LOHQ2Tis1OW1FaUpB?=
 =?utf-8?B?VFM1TFFQajJNTHlQOUFpTm4rRFhzRWdicWFndFlxUXFMOVVUVUpPVEpUTDcv?=
 =?utf-8?Q?KkA3bW3CxxoGjb5tjzH6ZtYD5?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f07edc4a-c63a-44f1-362f-08dc8a0fcd43
X-MS-Exchange-CrossTenant-AuthSource: BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 12:12:45.4399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uI2QFG9uh/MNO/HOLfxkqMXHLswG1jaEPzQirRM6CeMegYd2OiIiavpBKjcAnVxDsEx66RGDDcdQpw0U8xk47Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEVP281MB3711
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28446.007
X-TMASE-Result: 10--31.936200-4.000000
X-TMASE-MatchedRID: fcW4EIiZv5LEeENaa6f3ipQ/7SF2k7HSDDgMha/WNJWmiVeoNe/DCiYT
	bgrOn8f59OHlkbnWpEtFiIQ0fcK1gKHPFgWlaynL+OcAPV6Y2394lyF1lyvUre9t4soC0O2Gzw0
	R57pZjQDoTYG8HWQfFLNghAygOidTNb48t5/TrpJ4KjjH0UCbNaL4Wcpf/sJ3aRrjP4hMuEYl8S
	rfdliWg7eTiR13vOFkLuv1cEkV4WAj6sUXK5XZvaHKPyAQr7R3I2nKN0pwPwEcK+SyylF3jmV4i
	RXEyBMDBeiUOoyjEIXdKbiAr8HyMSIS8upQaHxLYmeOGdFPXFwWbtwMeTYKvCvkJiQEiRlhu4BK
	JTmsbGG/UdZR4seaahx9nu6wk5ciOdhWvIT1F6MtC1eAkW8MEvsIJ9FNjq1IokNoZKXFZ3Rpfe0
	v3QYRxDz8ct5VB76jTjIGX7g+Gw+FFNhT+7VbhgRAI+5lcBn2Ag14iYqOshlWxfPUiOS+i5i72y
	WdXfPqbTUZFIxrWlAfbGiTpwYY0PrGCHHLLz/1pCkfTcAJL1Zvc+XY7KtzsC1rrhO3mWzM39wXR
	wfvZB0/7GR1xx6lbObD7rUjUO+UobiawA6H9QnnoT3K/ZInmnUGwgMpBsfkit+OL4KsxprRMmjQ
	L0VUPiaF/8FqEYw2KPDFKDrKfJObRfnf3ZIRT7z/2DYXtPX2YBS4BO08ckN2mZ9PFamf91LdWGd
	seePmZp/hu1+kRXgXybWGqJwuaSJlmC4fDnDLWCzbDdlFUpM4cJHZUX1PGVIzqo1F8yQSdSTkMW
	dhf0Zv8KFov0EWt7vqAeDjxUHIApg73XH0fv3rhpwxi7CLzzmoMBkrmuf/mCYM4MaoFU97wQPQv
	9XohUiWqV2CUL6T0PrEu9fgzgiXT8BXyLUBWllks+Ha40i4YppqMItbEgPjZrmGw5xz1ag7Zo5U
	OBRpoli4ZoiOHT8g4pZYxslhbQ40qJRZ9yNbA/3R8k/14e0=
X-TMASE-XGENCLOUD: 37a3c4b2-f756-4acd-a6da-b22b84882236-0-0-200-0
X-TM-Deliver-Signature: 610A59265C8EB067EFA9B8A7EB9A907C
X-TM-Addin-Auth: e41tZObsA1ccn5pCv4czRS5wavQ0XO2d1CpL9XtbOyD58Eo+6xKBh4fU3eS
	SyTmmRQBFY3q3eIbxdAiru5MFHXRRx7GcCwgTcS2etV8wPRtY01FAv5GvVI51oju0bUGzyF3fSc
	vWAY7CtMBEpXZ1D6UuC9iaPtGDKRZ19A0i0WdfTFqFiNRyQht7iTfOHQT442+KVBllTIR7qCrSE
	UrzVcB8HVSEMWIPkvSfwekBXr6BFYkbbZHGh+QhgkqOCHZ4dL3GvgBLPqbqR8FgJrRwLzGbAtSu
	I33AAPgrzt5IPiQ=.ACbojHksxFYE12OCO33Zxce5MBwSGggtIC1Ha3AZkYst6hAAjLfgUmLx2E
	so8uEKA6pbM+BhD8vCfCHr4ackqEF8wJxrQUuD0z7A9l0mQYyEfQLbr00oN/JxGPRV/mkVZc8YG
	MoolyxalTESIMTvsFO3XO9knjsdtoo9i/rRFMDhw5sLGQ0Tnq18JVJdcafDIqkPM6OiuXaoGYeX
	sLYbnwl/Tjz0n/FmJKFXJ/7XDa4I5LIc+sAC6uEgd8wp+prARxlpVazW+aHG8nfOQzzmcgDNXVe
	Pvt+8CnObOtFlDDiLpPV3UZHtdgIYo+oQB98Lmgewl1Dsan1tQ7CnHPUp2g==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1718107972;
	bh=AmxuSCns1iLQXPUUQ518O7z5Y/ykx7nPMRLCNeqlcRM=; l=6598;
	h=Date:To:From;
	b=bclchSzR6IjiaxFlicPlxDZrWGF1ejhq61tmmqlolDu8Nbpdgq0D8e4tGWX+YEya8
	 JwzVHLA4p9CwwH77Cmr5l7AF3MUUxD4/9UPkyS9ehs/7AI1vMWDM3OLGqkkH5hG/oH
	 FReHho+ZPyouKP3tWqZ+GkO8fJdPtSBCTjJuvbqQrQ60WdaUbe0e2dvrJ7BQM/R6n7
	 pWjNqeqQgUZdpW34mxWVjb2alY4V5y/LYseZemDb9oty8Qz51H0IjerEkbafzftqQB
	 DNZAtgMJPVLq6WQ+Zb6v/m4Tr6a5q1Pys6cNEssQ9m6Y7N4038FYaj1xQ5Wlsq3O0b
	 R/JIc+v08mCxw==

Hi Albert,

On 10.06.24 11:09, Albert Esteve wrote:
> Hi Alex, allow me to recover your message to repond.
> 
> On Fri, Jun 7, 2024 at 3:29 PM Alexander Gordeev 
> <alexander.gordeev@opensynergy.com 
> <mailto:alexander.gordeev@opensynergy.com>> wrote:
> 
>     Hi Albert,
> 
> 
>     I'd like to add some general considerations:
> 
>     1. virtio-media device capability discovery is very chatty
> 
>     V4L2 requires potentially hundreds of system calls to get the full view
>     of the device capabilities. This is inherited by virtio-media.
>     AFAIU V4L2 developers agree there is room for enhancement here, see [1],
>     [2]. Also I've been told VIDIOC_G_EXT_CTRLS/VIDIOC_S_EXT_CTRLS were
>     added for similar reasons.
> 
>       From the point of view of virtualization developers like my colleagues
>     and me hundreds of hypervisor "exits" are excessive and costly. It can
>     noticeably increase boot times, which is something we fight against in
>     automotive. AFAIU other virtio developers agree with this, see [3]. 
> 
> 
>     In contrast virtio-video has been doing this in one command from day
>     one. Yes, the data was incomplete. That's why in draft v9 I added TLV as
>     a way to store all possible capabilities. I hope the linux-media folks
>     could take a look on it. Maybe this is something, that can be adopted in
>     V4L2?
> 
> 
>     2. virtio-media has a hard dependency on V4L2
> 
>     There are certainly some "patches" on top of V4L2 in virtio-media, like
>     the representation of the extended controls (which actually looks
>     similar to the representation of the controls in virtio-video) or
>     VIRTIO_MEDIA_EVT_DQBUF. But how far can this go? Is it OK to add your
>     own ioctl ids in virtio-media?
> 
>     AFAIK the linux-media maintainers have been overloaded for years, see
>     [4]. Would they be happy to deal with the additional requirements? Would
>     virtio community like to have a dependency here?
> 
>     2.1. an example: format modifiers
> 
>     There is a patchset aiming at unifying V4L2 pixel formats and extending
>     them with DRM format modifiers. It is now at version 7 submitted in
>     2023, see [5]. The first version was submitted in 2019, see [6]. Not
>     merged yet AFAIK.
> 
>     In virtio-video I just added them in draft v9.
> 
>     I'm absolutely not trying to criticize here. I just try to highlight
>     that there is a lot of legacy and the process is painful. Right now we
>     have an opportunity to design a new API according to the current state
>     of the art of the stateful codecs.
> 
>     3. uncertainty with cameras
> 
>     AFAIK there is still no agreement about how cameras should be
>     virtualized, see [3], [7], [8], [9]. virtio-media provides support for
>     cameras in a specific way, which might not be desirable.
> 
>     4. (minor) is it possible/hard to implement the device in hardware/on a
>     micro controller?
> 
>     This is something I thought about recently, there might be a use-case
>     for it in the future. One of the concerns is that dynamic memory
>     allocations are IMHO inevitable in virtio-media or virtio-video up to
>     draft v8. I think multiple virtqueues in virtio-video draft v9 would
>     help here. Not sure yet...
> 
>     There are also other minor concerns, that are probably tolerable.
> 
>     [1]
>     https://lore.kernel.org/linux-media/20230922100303.GF19112@pendragon.ideasonboard.com/
>     [2] Page 6 in
>     https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Hsia-Jun%20Li%20-%20V4L2%20M2M%20EXT%20API%20enhancement.pdf
>     [3]
>     https://old.linaro.org/blog/the-challenges-of-abstracting-virtio/
>     [4]
>     https://lore.kernel.org/linux-media/4b6b1355-9baa-ff1e-e1c0-89dfdc83ad04@xs4all.nl/
>     [5]
>     https://lore.kernel.org/linux-media/20230206043308.28365-2-ayaka@soulik.info/
>     [6]
>     https://lore.kernel.org/linux-media/20190319145243.25047-1-boris.brezillon@collabora.com/
>     [7] https://lore.kernel.org/virtio-dev/87354dtp30.fsf@linaro.org/
>     [8]
>     https://lore.kernel.org/linux-media/00f53c06-e66d-aa46-ca4f-c3baab6cf455@xs4all.nl/
>     [9]
>     https://lore.kernel.org/virtio-dev/CAAFQd5BrhDZtFX3vdhBVSLXthe8CykYsZzVQ9ddZxVNvNS3ArA@mail.gmail.com/
> 
> 
> As I mentioned in the previous drop of the specs, I prefer not to
> re-open the debate video vs media. Most of the points raised here
> were already discussed previously, and yet it led nowhere as there
> was not real agreement.

Sorry, I don't agree, that it led nowhere. Now we have a more advanced 
specification that is aiming for standardization waiting for review and 
a new version of the driver with all the patches made by two teams 
merged together. And also (from my PoV) a compatibility solution ready 
for use. I think we achieved much more during the last year compared to 
two years before that.

> Personally, I think there are big advantages relying on a well 
> established API
> and lessons learned from v4l2, and using them for virtualizing a video
> device. That allowed to produce code for the driver and a reusable device,
> already available in the spec source repository for anyone to try:
> https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md

I also think there are big advantages relying on V4L2 for most things. 
That's what I tried to do in virtio-video too. The driver is also 
available, but it needs updating. I'm actively working on this. 
Unfortunately I can't provide a device implementation at the moment. 
Maybe it is time to discuss this again internally, but likely the answer 
would still be no. Still I'd be happy to work closely with you or anyone 
else, who is willing to implement an open source device.

> Also, new devices with new requisites appear, and the V4L2 API is forced to
> evolve fast. The virtio-media approach makes the spec less volatile, as it
> lets v4l2 do the heavy lifting for adapting.
> 
> But really, this is mainly to avoid having virtio-media as a downstream-only
> device. It also opens the spec to feedback from experts, and makes it
> more visible. There were already changes from v1 to v2 following the
> feedback, and these changes are also already reflected in the available
> driver and device implementations.

IMO virtio-media shouldn't be considered ready without discussing 
(again) and addressing the points above.

-- 
Alexander Gordeev
Senior Software Engineer
