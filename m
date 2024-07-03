Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2088.outbound.protection.outlook.com [40.107.100.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAC813D88E
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 03:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719976114; cv=fail; b=Ie7/P++htE6dKIQNCBvtQVflaxVmEGI4gDLsufJtBW+b9wDSNwdnfeWHwIH6DbXRnTmpDArPcPcZDUUCJSpLKlKBojgNfgHGTXWNYcSIIsODuUI12hCglC6XV562JXaIq1+WKd1ovCBLrhlzNXwXMW4EBLK12T6H+ytK0qoOKEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719976114; c=relaxed/simple;
	bh=/MgMYMcUbCQpAA1FDyaJ6yYJvGAUqToLIBWHIRPXcgI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lKC7I8Rx1M2X5ksJHTN7U5aawX7CDrpc+r48oroanuYVQisInMGMCPy6uJNqLBkAIhmK/dPLogGmmFdjqm3nUXreyyEwafYwBcpbQWuZRyu0wBxDL9aMccIe9jUKEHyAXvi9Ff53fjiZlnlO+p2fNuuidOKXkl0iRnj1uVW+k2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1+eWil3n; arc=fail smtp.client-ip=40.107.100.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1+eWil3n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2kDRmfHuFTi4kBHh200XJAVnnShxe5L2kQD1rYFzk7ZL2Wnmkn3Mr1pm2BZevtz0HUcdF0Eeld6E2ZO+dhF7LlXkKcSjv/CdCh2GovI9KMZqyYxOypuzIHAm/XTlDHpadHyOVCZT0DHS55Vl4r8GcU+v6OwGDosF6s4kUm4pPplRUtDbQrVrzOQTELJDMdcfp8/l2aTia8ptXvSYI5tYQRpwFXQRShEiH1PH/FPChHF3QvJh8labhQhSrsdhJrlDPWCWQlLbZxPrCwEIPwO/Ic1ZbeOR59RLowmhdrvM3PqQ+3fOIsCP0OCCBbuLRhljp4WU43UXWRjUOqBueky7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0DQNvaNCOEyQ7EzcXi+TlhA/sQ1HT0jmEyOx7Xiet0=;
 b=PkkFxHSYOJe6okdw0E49HDxzmMv18eWOZCZNzc9rbJC859FtzTsbiKdI42ljZrRpsOnxBIX7Yx2DekC+JXbbgtgFvVj61hylVyPmHv/NLNpebv43jQbtH1w8ItdEZ/TWoxcTwS9APzFRELLBtcQs789p5ooEB856CvJX+ig/BpK66cdpGDuOPcO/Co2L7wdJxQaAMRAOAsZ/qHnmm6QMhT1z09HZzvrvvyDhzKlJCHBtEpAOXk6QstYF9fWDpug4MH0UfQBpyoGQd1SBSPqjZQuX0ebVJASTh87hUGtE0O0WcGTPi+c6BHQ3PLIsLAQA8n6P7zXsOA3vCuGL/5CA9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0DQNvaNCOEyQ7EzcXi+TlhA/sQ1HT0jmEyOx7Xiet0=;
 b=1+eWil3n5PjpFnKCTpxOCXZSNY/rxcI9b0+q4DQL6RvdVldNA5W3wna+1D21LvK09I+DyinoVkGKX31JP94N4/0zfJ+NN79C9bSG27K6tzzT9VBBe4YyUqaBvLHTlU38opmTWn+E/FO1Vh0/B4d6SUrsgUBo4CRTS/IIY38Yi54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by IA1PR12MB8310.namprd12.prod.outlook.com (2603:10b6:208:3ff::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Wed, 3 Jul
 2024 03:08:28 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7719.028; Wed, 3 Jul 2024
 03:08:28 +0000
Message-ID: <96e8f1fd-8bca-4903-98e9-c2cddf1c9232@amd.com>
Date: Wed, 3 Jul 2024 11:08:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] virtio: introduce SUSPEND bit in device status
To: mst@redhat.com, cohuck@redhat.com, jasowang@redhat.com
Cc: virtio-comment@lists.linux.dev, Zhu Lingshan <lingshan.zhu@intel.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
References: <20240628092600.30365-1-lingshan.zhu@amd.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240628092600.30365-1-lingshan.zhu@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP301CA0072.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::17) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|IA1PR12MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5f1a0f-3e46-4d8f-23d9-08dc9b0d692b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXBySTQxeWEzeFVxMGNHdjE2eGgxcFFUS0VFZEFObUVwSHZ5VTBQMHFRMlVF?=
 =?utf-8?B?LzcxVk9aZnVEbXJCZHNCRk5uVmNuZXUwYUJlRUxaeSt2SFU4a01yZmhERURk?=
 =?utf-8?B?a0h6RzRaV0xVSERPS2xQR2pLVitGcVpSTUF2TUt4MEw0RHFiVXVQc2wvTE1X?=
 =?utf-8?B?M2tPQWJjL1BtZVlqcDgzWEY3STJmcnZvaGdYekFQQ1l6NUFkR1VObGo2UlF6?=
 =?utf-8?B?SmFmOFkzZ0tGM0V2Z2lpcXBBc2dCTFdrUnBCM3UxRHN5ZEhucDJqL2JSYVR2?=
 =?utf-8?B?eEwwMDNtYmttOVJTQ2czcERKam00MGU4VmQyVnBxUjN0SHJwZG9hZXJURE52?=
 =?utf-8?B?dDROeEZwSkdTbTlPLzBtQnJSdWZXNjhBZHY0M28ySVd5SXBYQlB0NjhLQzZr?=
 =?utf-8?B?ZGZVWDRFZzdhZS90N3JkYjVDVU5hNkdSbTNuanQ1N0dPQUVyWTFmRVQyZUly?=
 =?utf-8?B?MEVsSEZpMUdhSzE2cENvbkJYSklDbmZSNFl6aXhmR1VnTm1MTFhLTFYvUXpI?=
 =?utf-8?B?QXo0QlNZWEV0UUxCeVFKRHIrSHBGYWdPaWJKRU8xZnZ0S0p5RW9sWnAzdUpV?=
 =?utf-8?B?V0NtSWdmUVNVZDdxdG1rL0xoQUd5cW11c2YvaTVlT0dacndVKzVOZWV1dksw?=
 =?utf-8?B?YXRIQVJwYkJhZm9ubktDZnFrMUgwcGlXRmlIQnQ1R091WnJVU29lc25oV0dH?=
 =?utf-8?B?MHNFUEVmNCt2ZzFpTmNWMGJLck9jL0R5TEhTVTd3NXYyZGNRRVA3WG5iRy9j?=
 =?utf-8?B?SHU5QlZvSG1TemJrNWR3d2lLWDRBdWx2ZDZJN21KRFAwWFRFWTl1OURiK0ww?=
 =?utf-8?B?TjhtYVVGM1R6VkhIaSs0ZzhrWU1RN0VocDlFNGxIK0JjYmR1U3BHQ3BLOFow?=
 =?utf-8?B?VUV4VjRkNStCRGRhZ1l3WDlTak1CMC9EbUFRSnZST2NwSENmMGhCN0FOY0hi?=
 =?utf-8?B?YS9UVTZQM3JSWmNPT1ZUK0tqNTFlTkYrd0tIck12VUpTQXFSQXk3NVBZTjNL?=
 =?utf-8?B?Sk5BRVpJem1VSS8renBQTEt1clYwU2RhSW82NjVvOHdTVDltbXd5S2tJOUFi?=
 =?utf-8?B?Rkw5R1hqSzYxQkpCNktzSjlPbU5vNDJsNGFGV2gyR1U4UTRqd05wWlArS0kv?=
 =?utf-8?B?d0hyalB4OGJlemxLbDZrSDJDbTJPOWhDM2pxV2dOYW03Z2t6K0JYdkR3bmRl?=
 =?utf-8?B?V0s3SVdXNXlNeXgxRzVsU0ZDTkJrNVJHUXRLRnAyNlVOa3hzR3h1Uk9wYlMx?=
 =?utf-8?B?L2FKdEpxR1NiajdnNGc1cThpS1YwZUZpTzhZbzdoNTM1bWJJcncxK0lDb1Yw?=
 =?utf-8?B?WHFhUEVYM3lKT2dBandOYnJNbVU3NHFER2dWUnlHRUNiclFvTzdnUzdrMWVD?=
 =?utf-8?B?MGFseCt3Tk1rbHQvUndmVmZOaXFjc1VTMlVLSU11VWRocWtZbkFaQ2Vka0M0?=
 =?utf-8?B?Vnh6L2cxeVpWZDVPaUZlL1J5Y1FpRWdlWm42VE9KbUtmai82UDF0cVBXRExH?=
 =?utf-8?B?elBvYXlwUFdPWjhUekZJTDRPaWk0UmNkK3VwMWhFeThQdVkvNUZ1MVJtRlRN?=
 =?utf-8?B?cHpUMGpXYWpyeitITTFIYkh4enNYRWZyN2hDeEFzT2JsbG9ObFFTQk1HeDN0?=
 =?utf-8?B?SDYxWjdsOWcvNjdNVTQ5S0tXTWMrMmxHYXRBbmc5TWtKeXAwSTJHUEdlZlU5?=
 =?utf-8?B?cGo3KzBWRDRsaHkzR2hsa1V2ZkdhdjltUXU3L2lhQVA5anQrZW53OUxCRkFw?=
 =?utf-8?B?MWNvZE5NRjhoNmphdVUxQkRaOWhCWVlHOWgzNUhUdUJJYW1SY1BrTEtFSlpJ?=
 =?utf-8?B?NVNiM0pnSFRpYnZzMUVxUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG9WN1NhcG1HdEE3dVpQL3prOWFPWG1tVVpwbk1BeFFKNU5nUWVhTmEySEYv?=
 =?utf-8?B?T2ViY0k2MERGV21lR09ISi8wbkFxSFRYUUJIa1JIOFkwc2N3VnBGNlFNbWRo?=
 =?utf-8?B?cEZWVlF3end2WUpjQ2loWWxoQ3M5Ni9RcklYKzRqUmtpZUFKVWg1N3FTNzBp?=
 =?utf-8?B?Q01weWpXY3JFZmlXallVc2UwYWtMOUlCU2tsalFMWjZIdWhpa3Ixem1SV3F4?=
 =?utf-8?B?b3FXV3g5eHFHdWloRXlxbEUzY2tnNEpsL0I3SjBrdXZlUkYvaHBVKzFHTGlh?=
 =?utf-8?B?TUljMjNTWGpjWWdPUkQ0NjZ2Sjl5VmNpZ0xZQ0xTNGk0cHNrenNPcXJFaFd2?=
 =?utf-8?B?OFpIeEV3S1RxenhRYTUva0QxZDk3UTF0NzhoaW81eldmekk3RkI4bVNZZVNK?=
 =?utf-8?B?WXJ0ckFBNlNtaE1zODBxVVhyWGR2T1dxekZlVjRLQlhmdU94cXQvSkwxMExG?=
 =?utf-8?B?VHhDNzJ1U240WEhucVVLSmJFTHNic1NrdjdBT01LVCttOGFlZ1NxUkFud2Js?=
 =?utf-8?B?UjJqazYwUU8xRHcyNW9JcG14b2hGMjVQcEdub1RpMy9rOTRPMVY1WVd1RC81?=
 =?utf-8?B?ODRQa1F4ZmJhd0xxWGFTVmExTFBZNTFkNUptR29PN0JRQldFNW0zN3ZhS0J5?=
 =?utf-8?B?SS90TXRjRVgwbWhzWTNDSXZYTmtOV2pqTUtGMXlmYnc0RUJ1ZWlLWFNDQ0RW?=
 =?utf-8?B?MTdkdkpGdHc1SFFNbGRxaWhhNlRsV0E1K2tSbzdsSnlwN2R6TDRWeDZGYzdY?=
 =?utf-8?B?cU5OTDNoY0ViT0hpYTYzRmp4UnFRbmV1eGQ0SlV1c1NEdFdPL2lKbXQ2THpE?=
 =?utf-8?B?Yk5SUkdueHV3aVZjUXQyZUdRYVJSV25rTlk2T21hbCtScWdzeFkvRkczZ1ZT?=
 =?utf-8?B?dDg0aDJ2Zis2RnBWSzhLSEgxSEg5Z0d4aG5OUG1UdUtidHRSeDJpQ2ZWR1dU?=
 =?utf-8?B?RkxpQ1ZzeXVqS0tuT1RUMGhISVZOQUN0TjN0Z3M2VFpoQjgvQWl0WTRwZkk3?=
 =?utf-8?B?T2VIb2VZOW1mbWtIa1RjczliSzg4YVdHZ2RPd3Jzdi9nWldsQ2plZ3dGbWEx?=
 =?utf-8?B?NzVMNW1jeituMWFaSUUwNFlxczd5eTBpak9UaVlaeXMxTXNMVkJraklGK2hB?=
 =?utf-8?B?dk83bUhPVmNZSm9vRWFhWCtUVnVMa0kyeXJPUWhycEtBVkVvbEgvZnVCZVZN?=
 =?utf-8?B?cFhXaXhic1JZbmZKU1U2TEhacXZXQnBMR3U5cnVDTGVjMzd0UXRXT3A4cVZx?=
 =?utf-8?B?WUFVZ2dDT0FlQVpiVkFQWjNvT05tdGdKQm5oZ3pVKy83a1N4TmV4SzNaZVll?=
 =?utf-8?B?K1RRdnNtZEhxR2NVeFJmWDcyVUpNeCsrRWo2c2dJY2hkVDFLa3dESjVRa3Ni?=
 =?utf-8?B?b0hibHZxWFBHQTZLZFE3REJUNEU5QnozVmRacGptem43bTBvek1IZEVQR2wv?=
 =?utf-8?B?Rzd2VHFXeEFMMER6aTI5M3pNVlpCY3dSSitQQ2wvOGhtZGJPVnhGYVFMMkVq?=
 =?utf-8?B?N1lWc1B3YVNOUWdYaGx5Q1MzTTd2bGNETU1oQnBiRSsyOTN0d3A1aGtQUElU?=
 =?utf-8?B?VVc3ZUJLdFFiVU1EaWk2UzlzUi8xQnBGeFJscUdaRlppRHc2dExaMUJ1RDhu?=
 =?utf-8?B?ajhNTXBHODM1RndmM002MVJKOC9wT0tzQnNYK3JvU1BLMU1sNlFhdEpuc3VE?=
 =?utf-8?B?UytCYVNpTjdGTUF5dUtFVTlSL3NYc20xVE9RK0JrMUxyUGpFVGxvMGpzWlJ3?=
 =?utf-8?B?eCtRL05SbVpudVM4cVVVKy9HYnd4V0twL3lLRUd6MXhwUG9aZ2VwN3BrZndi?=
 =?utf-8?B?Skw4TEp0all6K3h6L3hWd0RPbHRvaW5raXhXSGlJTnBlODQ4bFRGMEdGRGdl?=
 =?utf-8?B?aGE4OTVGaWFheXdXTy9JVjRrL0lYU3EzZTBJVTF4TWYzZmxqalNBNHVtRk9z?=
 =?utf-8?B?SUwzV2dJRlNJRGRHbk9ubDNsb2RQL1pzS3p5TWc5UDlWZnJCL3dFNXJkVmVq?=
 =?utf-8?B?S3lsYW9uQVZxV01OSWJiTWloNmlmZFBUcGl2U3ZvQ2RtRFNVeVVGTzJpS3VI?=
 =?utf-8?B?SzlhQmZzUDk4SUxXYklZRVkyYmljVENMZlVqM3MxQi9yeEYzRXhWMC92emd5?=
 =?utf-8?Q?Ppf/wt4LHP5OqvPyc2yr8gpv0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5f1a0f-3e46-4d8f-23d9-08dc9b0d692b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 03:08:28.3614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYKAnLmmXsvTL7LQ/sKTJegUe9VnQT5qsAp9+Ics9rw2D/gcG1jVghg+LfVSa1OBEYrmPTIiwhi4Ax+9D4p9jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8310

Oh, I forgot to add David's SOB, will resend

On 6/28/2024 5:26 PM, Zhu Lingshan wrote:
> This commit allows the driver to suspend the device by
> introducing a new status bit SUSPEND in device_status.
>
> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
> which indicating whether the device support SUSPEND.
>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> ---
>  content.tex | 71 +++++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 61 insertions(+), 10 deletions(-)
>
> Changes from V5:
> - the device should present NEEDS_RESET if failed to suspend
> - allow the driver access device status in the config space when
>   suspended if it is implemented in config space.
> - language improvements
>
> Changes from V4:
> - re-order the device status bits section
> - kick vqs --> notify vqs
>
> Changes from V3:
> - allow the driver clearing the SUSPEND bit to resume the device.
> - disallow access to config space while suspended.
>
> diff --git a/content.tex b/content.tex
> index 0a62dce..8c974d3 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>      this bit.  For example, under Linux, drivers can be loadable modules.
>    \end{note}
>  
> -\item[FAILED (128)] Indicates that something went wrong in the guest,
> -  and it has given up on the device. This could be an internal
> -  error, or the driver didn't like the device for some reason, or
> -  even a fatal error during device operation.
> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> +  drive the device.
>  
>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
>    features it understands, and feature negotiation is complete.
>  
> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> -  drive the device.
> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
> +  device has been suspended by the driver.
>  
>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>    an error from which it can't recover.
> +
> +\item[FAILED (128)] Indicates that something went wrong in the guest,
> +  and it has given up on the device. This could be an internal
> +  error, or the driver didn't like the device for some reason, or
> +  even a fatal error during device operation.
>  \end{description}
>  
>  The \field{device status} field starts out as 0, and is reinitialized to 0 by
> @@ -60,8 +63,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>  initialization sequence specified in
>  \ref{sec:General Initialization And Device Operation / Device
>  Initialization}.
> -The driver MUST NOT clear a
> -\field{device status} bit.  If the driver sets the FAILED bit,
> +The driver MUST NOT clear a \field{device status} bit other than SUSPEND
> +except when setting \field{device status} to 0 as a transport-specific way to
> +initiate a reset. If the driver sets the FAILED bit,
>  the driver MUST later reset the device before attempting to re-initialize.
>  
>  The driver SHOULD NOT rely on completion of operations of a
> @@ -99,10 +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>  \begin{description}
>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>  
> -\item[24 to 41] Feature bits reserved for extensions to the queue and
> +\item[24 to 42] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms
>  
> -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
> +\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
>  \end{description}
>  
>  \begin{note}
> @@ -629,6 +633,49 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
>  
>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) before removing exposed buffers.
>  
> +\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
> +
> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
> +SUSPEND bit in \field{device status} to suspend a device, and can
> +clear the SUSPEND bit to resume a suspended device.
> +
> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> +
> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> +
> +Once the driver sets SUSPEND to \field{device status} of the device:
> +\begin{itemize}
> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
> +\item The driver MUST NOT make any more buffers available to the device.
> +\item The driver MUST NOT access any fields of any virtqueues or send notifications for any virtqueues.
> +\item The driver MUST NOT access Device Configuration Space except for the field \field {device status},
> +if it is implemented in the Config Space.
> +\end{itemize}
> +
> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> +
> +The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> +
> +The device MUST ignore all access to its Configuration Space while
> +suspended, except for \field{device status} if it is part of the Configuration Space.
> +
> +A device MUST NOT send any notifications, access any virtqueues, or modify
> +any fields in its Configuration Space while suspended.
> +
> +When the driver sets SUSPEND, the device MUST either suspend itself or set DEVICE_NEEDS_RESET if failed to suspend.
> +
> +If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
> +the device MUST either resume normal operation or set DEVICE_NEEDS_RESET.
> +
> +When the driver sets SUSPEND,
> +the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:
> +
> +\begin{itemize}
> +\item Stop processing more buffers of any virtqueues
> +\item Wait until all buffers that are being processed have been used.
> +\item Send used buffer notifications to the driver.
> +\end{itemize}
> +
>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>  
>  Virtio can use various different buses, thus the standard is split
> @@ -872,6 +919,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>  	handling features reserved for future use.
>  
> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
> +   trigger suspending the device via the SUSPEND flag
> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}

