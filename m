Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5CB152178
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718094402; cv=fail; b=bHsvAw3HTNayJFKvlhrYWkYP7EE18+jX8OuEGhC5gsVaU+KChCwhnx3jUpx8k9zEB8QX4SqWVOEyWyjtLVcpm9Xu7nuYb2Su/DTrIHjGr4tR6PQU6lFf8QlPYj9T99kMR6EJYEJKeM92M+VGv7JjdcWt9vd3Js9rEd8ve9lBx80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718094402; c=relaxed/simple;
	bh=DzZMqW83Nup+ZkY+1GrHYidTOIrmd4+1qs7kkndiRpA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EzVLn0rW8xwtfgz/mZnxuF6eB7w8xndr7qM9YiLJdb8SNBtdwV2lDAwfCe46Xc+3fwzsGEd/lfHyo6d8kA0g0suaad2uLoZ9eS6SbO30CpDtKSP8zys8ZWEavS3ZqIXUzdVDeG+bciznKQUogy3DSg89NRqY1QGGEZ99yUhXSUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OqBCECXy; arc=fail smtp.client-ip=40.107.244.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OqBCECXy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBSr3tBsKfpCo0J00Kkn3nr9bQ/878JlerXz1TfHYEpPmh1pjtbDGY285UTF+3gZC2hxrmUQ6ZrsdWWc0mWMY9TpoQhPKN0qUDGSzqeIw0xqG4fAdRagY+nOtL8t1heijZzkiNi36DqwVg09gWvHxrsBCg4gDu8ht2PzaKWM+ukORzt9hmgJuJArL72nNRT8aRI7LwUzcmjQNk8HfmAnyG0/OHP1/A5vWyNZlZtKmJQ37Iz5gmNFsyUGGkqkN5BdFUkaBy3TgIi6qO7Xu87GQ48aKVi+/Lwn+lMStyP/0DvVi+iMNoFGjLr7yGt2AfVFQ09qwshvRPszCizlgbMNBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlRQBjphs8D5o+Jq0Ew6FRd3tT6LNDkbyrbWFqiqkiY=;
 b=N+qqWlaE/BEAPsxLoaVbUFd0ApwwMXK2p1Fd97ZP9Q3/hKeey4IQijIe+rJa9tEW0ijH1Rpt5FIW9P23uPdCPYUCAJrn08ucvKT7MW+I3sW0dFE7y99MUnByNONIdfmvNUodLdnG7DKxEeeFc8uCM8hDPme7vsVPux//m/HB6K18Go5y2hxkANolhda/MSpasM0ohtidC/15rlsRxj7ZinWnZXnIq+safHw+HV4JpEgW3mrGpRoXQOX/GVyitx7i1AMYZd78V+j2YZocLmY0531JRRwoFP3xVANGcMMUy954R1j6yx9/dmtwLYh/xeGLy40cGWkchza7tvJILVLrNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlRQBjphs8D5o+Jq0Ew6FRd3tT6LNDkbyrbWFqiqkiY=;
 b=OqBCECXyqQs8gnRriQkjLy1DoDdh/Ll4tRiIaa+4tIY9MnyrBIXqKBIXMdR6VmLt3GmeiMBP3nVtEFG+tuWQMiZY1c+9zKlNwYZHMpRb1ONZE2PkwIrWkgUPHPw4cYVKNTf5dIIA6gEEEzz3A87yynNFZvfw7oXpe9I0qYkWNmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by DS0PR12MB7945.namprd12.prod.outlook.com (2603:10b6:8:153::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 08:26:38 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 08:26:38 +0000
Message-ID: <3319f7da-5c1f-48ff-916d-03791edf1783@amd.com>
Date: Tue, 11 Jun 2024 16:26:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
To: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <20240607074246.7647-1-lingshan.zhu@amd.com>
 <87zfrskcmq.fsf@redhat.com>
 <PH0PR12MB548111206A0EEB7EE62421FADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <PH0PR12MB548111206A0EEB7EE62421FADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYWP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::19) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|DS0PR12MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f52ab27-ce78-4ef5-45b7-08dc89f0368d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUtQVDhyZkt5N0gwc1RiRkJ2RUdkazR4KzRkc1pGL1lvS3BPNnQ5bW9jMUE2?=
 =?utf-8?B?TE1NbHlFcjdVMjNsVjByQ0tYWUZhZjlxZEpYV0ZHc3dZR1k1WjZXcmttSWM3?=
 =?utf-8?B?OG5XWDI2NWFzRytZMDJSd3V5ZnlNNGlsVlFlQ0RHdDQ5SWVnSkhIRGVTUGp4?=
 =?utf-8?B?L0RwaTF3WEZJUnVWVEZiRnZCWHBPdTVVNzRQOEo5NW0ySFgyV2twTzdUTEVj?=
 =?utf-8?B?cnF2YzExRzEyOUN3anBzODJLd2grVFk1cDRWb0dpMzA4QXlGMmJoMHFOZVJz?=
 =?utf-8?B?cndRSHlXdGYzZE5vR0E4UXRSbGNyUHhkdG0wS29ubTFGUlBRM05JYi9pS0gx?=
 =?utf-8?B?NTZobHZwWmxJYmh5Y1RHZVhTOFFnbzFER1lBTnZMdjNxUm5hbkVrQXdqcWJq?=
 =?utf-8?B?cEo2YXg1Tng1Tll1YW5EQkVvZ1hISmRmQkxHbFB6UHI5alZKV2xWQnk2UUhF?=
 =?utf-8?B?QVRSeG92QnJCcUxKSDVZU1ljaXd0bEdGVjZ6blVNYW9VeDJ2R2U5M1dVU3VE?=
 =?utf-8?B?RGd1eEZ2VDVtYXhRbmEvMy9NNUNKMmFWY3VCSm0zazlWL2ZBWVgwK3ZRNVdK?=
 =?utf-8?B?OEIxYyt3aE9lc0NudGRMODgwOXhLeGxGV0RYVkxGRmJjeFF2RjczeDV4Y3hq?=
 =?utf-8?B?V1dpQkRDY3l2b1orcjB0SnQ4bW1ybGMvR0NFNFBTS3o0dFpFNUZpV1QzOXY2?=
 =?utf-8?B?SFhMbzhRVEZHMGcrWTBPSm1PSXZDSFhBUmFtdG1KcUFpYVFTY1p4NmRtZTN4?=
 =?utf-8?B?VVk2WXAyT1NxK1d4SGZUTnlhQ2FOSEYxOUxnM051Y0ozREtWVzRjb2Urd2ZF?=
 =?utf-8?B?ekF1QU8razBEcGRwQTYxNEdUT2pkbk5lbmtid1AxUFdLbjBqM1d3aHEvRzY4?=
 =?utf-8?B?b1luOW1GLzNUYzRSYitmQkc0RENNbWYyb3pGaVVCdGxoVWlScld3a2piNG5x?=
 =?utf-8?B?TCtQWVE4NHhJa01aSHNua2FBelBQZ1V0OVNtNUJqQk1YdDMwZTExNk5mUE9P?=
 =?utf-8?B?WWE2ZHNTMWx6aHpCR09NYnBPWVNPU2dxMUpacTA4U1M1ZmZJSWtHajU3cjBD?=
 =?utf-8?B?SUZON3lvbks1Ung1QmJBV2JtWG51UXk1V3h4ZnhIVnNuU3EvT0hmT1hsbThm?=
 =?utf-8?B?aTRpSlZLYXM4SHBrUkZaZ0dFQTdYTmtqdzBIbUFITGM3VEJodUtQT3N6aXlz?=
 =?utf-8?B?bnZQTE5RODVCMWJHZHdNRnQvOExxeDUvVVB2K2FPSlhBK2lYbTk3T0IxRW1D?=
 =?utf-8?B?a3NYM01zVmJKcTU0NC9DUnljUUlhUlRzcmZkNmpEL1NJdmJVVDUwY0J1Z015?=
 =?utf-8?B?S0dReXlhUUJSdDNHV0ZWYkNwcmhmNUYrK1JmeWdwci9qRFhUZmhlYVFqNVJq?=
 =?utf-8?B?QWhZNktzUjFkKzB6UjRRYnRHaE1oTHlNTUcyYUxiNElyQjMxQzZ0b2d0enhU?=
 =?utf-8?B?dElpQ1Q1Z0J2QkdvS1NCa2FOb3V6czhkdVg3Y2JXZUxQMy9uSE1SRFZvaGhv?=
 =?utf-8?B?WnNLKzdPRlJueWExUFdYU3dPTWdScEJQYTcyNDg5cDdFN2VjNDczYXQya2JV?=
 =?utf-8?B?eHVCOUVGV3FLWEZyTUI5ZFN4UFlMdnYyZ2NqQzhRMFB3VHduZEgxSUNRSFF1?=
 =?utf-8?B?NmRnZXVGRURTNlR5My9Kc0JlaE44RzFycThHOGxLU1hXamlOeW4vOEFIWFBK?=
 =?utf-8?B?OEpiL0wwL2hDN3FSWEo0Ry9TRWhzbkZ5SUVpU0kzbnhLeWZLb1dPQ04razZy?=
 =?utf-8?Q?Eda7iNm1aEp3d3wlmjdmvHCR1fDEUuMYKMCqK8+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk5BS2lCM0JRdDErcnNJaWhjc2pwRjM0VXhlN2xySzI3Sm1PTmo1V0pjVURQ?=
 =?utf-8?B?bWVoSzd0TjlaQnU3Vmk3ZnVrcy9oQW9pbStvYlpTcUhjRjMyWUF6R2IwQ2tz?=
 =?utf-8?B?NEEyNGFvZHQ1eDY3NjNGNnlvYSs5ZnJaenhCZ0R0Z3M1R3QzdTUzRmVVNXk0?=
 =?utf-8?B?UGJOaDB2MHg1MHZCSHgxQWoxODF0YWNZUEl3VjBHcXN6cWFoMWNESE9tQ05F?=
 =?utf-8?B?NHp6TmRRM0dKa0wrUkQwdnIxQVF1NWo5Z0dJczdGTnp1bGZtRHRNd3NCbHEr?=
 =?utf-8?B?MEh6dGRybFpxWDlpWThRdFk1UU9OdUZwQjVYR29ZdjQ2NVhvWFlVK3BJZERT?=
 =?utf-8?B?bTBiVWdHVkJIeVRIMVM2dTcrczJDMkErRXVtdVJWOXpzVnB5bXpkN3RIZFpi?=
 =?utf-8?B?VE9XTnVOY3JGb0d5Rlk5dTFleHFrRHlZTUlKRWlCaFJHNUY3TjVWU0xtV3NY?=
 =?utf-8?B?YVZoY0o4dDRHTG9TeXdlVGIzSnc1UUFZSlJmNC9jYUNnbmVLaTZKeGlJNGZ6?=
 =?utf-8?B?OU9kYXlXTENGVWkxUEo5NVJKRXBBU2FtNnJnSEJDaE5IT1BqaFNkakJGTlVn?=
 =?utf-8?B?TWJuL243cmpoenN2TGs0cWlzeDhzZXN2TWJxS2FWZkVpc1p0bTJTbFFQY0x0?=
 =?utf-8?B?cEVZRDNGejJlVEVBSFhUMDdCam5PNHFTYlpxVktNRCtSTWMyU2FHMnlZcGNR?=
 =?utf-8?B?ZmRTQ1gyaUZUWktSWlQwMERUaVVURE96cnhZR3VTR3h0M0lqMkp4aXF1U3Vq?=
 =?utf-8?B?Si9aS0V0Z0NtYzZMaGlDb0t3OEo3ckQvYWhwWEwvbHZ1OUdtbGhCOFpWS0hJ?=
 =?utf-8?B?SElnUzg1UVVjRlRFM1djODhaaTlJZVBxQjlnYWhuK0Vza084Nk9Uc1BVeTJq?=
 =?utf-8?B?bzJoTkNZWk5YN0UzMHdmUlpKcUpBNkowalBjaDRtT3ZBTVo3RXhsZ080dHBP?=
 =?utf-8?B?bFdwKzlOdTdWQ2RFc3YvZ0tmaSs3anZSd3ZaZXU4SytxZGFWYjZuRjY4RGc3?=
 =?utf-8?B?eWVGejNMaFNzb2tyYm5ZN0ZjTENvRU1NR3VuaGRuS0tlMENvUGhGTjlNK0tX?=
 =?utf-8?B?RXVkZi9rTU1vZW1rY3BKc0xMaElLYTZZN0ZuSTJTd05OaXYvU2k5NzZESXBD?=
 =?utf-8?B?K3ZIVVdtY1lTNThCc3lwZFVZNGQxT0RtTTNzNVNrWW55cklKRHpRMCtGaDZa?=
 =?utf-8?B?ck1vM3hiUmxWQXRsVDFwQUt2UTdJdVJ5WGFJVVdGZjlSbHRQdlZpY1liODlF?=
 =?utf-8?B?T05FYzNBenhFTTVrdTRMTVNZWVlwckpOR3JsZ0w0VjBxUFFJVTJESzdscTha?=
 =?utf-8?B?ZlFUQmROcmtUd3pUUWR1eTUxcWs3bUhLMjNkNW8wV05sUEVDSUhhYWFjR2gw?=
 =?utf-8?B?eitrRisyWGErdHpmRVM3UXJ5THZTTlpvYXB6MHdsRllwM2ZMbCtUa1lwNDVk?=
 =?utf-8?B?c21teG9GTDN2NVRjTlNvQnBPY2xjdmp6MTFIZWtYUzVCaXJ1a28wTUFRa1g1?=
 =?utf-8?B?VHpIdDBIODJ3NzNGaWV0VXdFbjhJSW1EUVdRQjZsK0FGMHV3WXVhVEU5NTVp?=
 =?utf-8?B?Ui80VVpyZUJGTENyMGFuQ3R2bmtxak9nQ1pBb1lUanNrKzJiWm11Vlc2alZE?=
 =?utf-8?B?Z2R3dkZxZEtmYVRMc0xvalBER2xOeGhDcWtXZU1oS1JsQ2M3ODNZY2FXNEpl?=
 =?utf-8?B?L0tQamZkRFBlUElmbWFHY1hnTTM5NTMxM1Y5WVBicWE5SmpScFFJbVUwU3E0?=
 =?utf-8?B?WFBkU01neis5TzcrRmt1NkVaYkJidzU4OFlLdjd6ZWZnUmxLbkVrQVNMN3Vq?=
 =?utf-8?B?S0VleU9pSHFMNmZMdnhCazBDcXVGcDVjd2F5Rm4yZndlWnFaZnprRGJtUGlv?=
 =?utf-8?B?YzRaV0NWbUt0WDA4R29lWlNxdDBKMnVzR3FxaDlDdWFPVnYwOWI5bnk5cHR2?=
 =?utf-8?B?MHMwNzZ4V0lxNCs2cFZ4SkdmdmV6aTluZGFmKzd5VW9UKzl5TkdFRDRxZEY4?=
 =?utf-8?B?MVB0aUNGUlZyTGdtNVhPbDRkdUJFaFBiNUdHK2crc2xGM0xiR1VZN1A1M0FL?=
 =?utf-8?B?TGlvSUxaUm43M3pGS2ZBRE01RzRhNUxQMFBrd2JaanpGSUVZWVkxa0VUTW9G?=
 =?utf-8?Q?+5EDJw0K36xH/07CX746Fnn+a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f52ab27-ce78-4ef5-45b7-08dc89f0368d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 08:26:38.2006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFEoazB5fTXEoxXs603Tp0ZiP91KwFDD/2Dv0Y2Jep3Ky41sRQKsBMBRIt0NlnXv2ET/rDWd97OuiAinsd9qww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7945



On 6/11/2024 1:17 PM, Parav Pandit wrote:
> Hi Lingshan, David,
>
>> From: Cornelia Huck <cohuck@redhat.com>
>> Sent: Monday, June 10, 2024 9:34 PM
>>
>> On Fri, Jun 07 2024, Zhu Lingshan <lingshan.zhu@amd.com> wrote:
>>
>>> This commit allows the driver to suspend the device by introducing a
>>> new status bit SUSPEND in device_status.
>>>
>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND which
>>> indicating whether the device support SUSPEND.
>>>
>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>> ---
>>>  content.tex | 69
>>> +++++++++++++++++++++++++++++++++++++++++++++--------
>>>  1 file changed, 59 insertions(+), 10 deletions(-)
>> Can you please add a changelog? Especially as some of the previous discussion
>> has been lost due to the broken old mailing lists...
>>
>> (...)
>>
>>> +\drivernormative{\subsection}{Device Suspend}{General Initialization
>>> +And Device Operation / Device Suspend}
>>> +
>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or
>> VIRTIO_F_SUSPEND is not negotiated.
>>> +
>>> +Once the driver sets SUSPEND to \field{device status} of the device:
>>> +\begin{itemize}
>>> +\item The driver MUST re-read \field{device status} to verify whether the
>> SUSPEND bit is set.
>>> +If not, the device does not support the SUSPEND feature.
>> That sentence is a bit weird: I'd expect the device to not offer
>> VIRTIO_F_SUSPEND in the first place in that case... could this rather happen if
>> the device is not able to handle the request at a specific point in time?
>>
>>> +\item The driver MUST NOT make any more buffers available to the device.
>>> +\item The driver MUST NOT access any fields of any virtqueues or notify
>> any virtqueues.
>>
>> "send notifications for any virtqueues"?
>>
>>> +\item The driver MUST NOT access Device Configuration Space.
>> ...except for the status field, if it is part of the config space?
>>
>>> +\end{itemize}
>>> +
>>> +\devicenormative{\subsection}{Device Suspend}{General Initialization
>>> +And Device Operation / Device Suspend}
>>> +
>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
>> VIRTIO_F_SUSPEND is not negotiated.
>>> +
>>> +The device MUST ignore all access to its Configuration Space while
>>> +suspended, except for \field{device status}.
>> ...if it is part of the configuration space.
>>
>>> +
>>> +A device MUST NOT send any notifications, access any virtqueues, or
>>> +modify any fields in its configuration space while suspended.
>>> +
>>> +If SUSPEND is set in \field{device status}, when the driver clears
>>> +SUSPEND,
>> "subsequently clears SUSPEND"?
>>
>>> +the device MUST either resume normal operation or set
>> DEVICE_NEEDS_RESET.
>>> +
>>> +When the driver sets SUSPEND,
>>> +the device SHOULD perform the following actions before presenting
>> SUSPEND bit in the \field{device status}:
>>> +
>>> +\begin{itemize}
>>> +\item Stop processing more buffers of any virtqueues \item Wait until
>>> +all buffers that are being processed have been used.
>>> +\item Send used buffer notifications to the driver.
>>> +\end{itemize}
>> So, is there any opportunity for the device to fail setting SUSPEND? I mean, if
>> the driver is supposed to look whether it sticks, there should be conditions for
>> when the device might clear it again...
>>
> Additionally, a suspend operation usually involves saving things to a slow memory (or media).
> This is because the device implementation wouldn’t know when exactly the device will be resumed.
> Few examples, are:
> a. A gpu device with 128MB of video RAM when suspended, QEMU needs to store this into a (for example) rotating hard disk as 1msec IO latency.
>
> b. a NIC may need to store its RSS, queues, flow filters configuration for several tens of KBs to some slow memory.
>
> c. A block device may prefer to complete some IOs to a threshold level instead of maintaining large list of outstanding IOs in some suspended memory.
>
> d. May be more in future.
>
> Additionally, suspend operation needs to be synchronized with certain data path hardware engines to suspend DMA operations (read and write both) which are inflight.
> (without causing DMA errors). Same would apply to the sw backend implementations too.
>
> Therefore, the suspend operation that is initiated by the driver, should get the acknowledgement back from the device that it has been suspend.
>
> Some of the good examples if you prefer to follow, a driver<->device interface needs a suspend register which should behave like below queue reset register.
>
> Spec snippet:
> "The device MUST reset the queue when 1 is written to queue_reset. The device MUST continue to present
> 1 in queue_reset as long as the queue reset is ongoing. The device MUST present 0 in both queue_reset
> and queue_enable when queue reset has completed."
>
> At minimum, we need, something implementable like,
>
> The device MUST suspend the device when 1 is written to the device_suspend_ctlr. The device MUST continue to present 1 in device_suspend_ctrl as the suspend operation is ongoing in the device.
> The device MUST present 0 in the device_suspend_ctlr register when device has completely suspended the device.
>
> The device MUST resume the device when 2 is written to the device_suspend_ctrl. The device MUST continue to present 2 in the device_suspend_ctrl as the resume operation may not have yet completed.
> The device MUST present 0 in the device_suspend_ctrl register when the device has completely resumed the device.
> At this point, the driver may resume notifying the device and accessing the configuration space.
>
> Can you please enhance this part?
Hi Parav

Yes they are necessary contents and we will address them in the following patches.

This patch focus on the basic facility virito suspending, not transport or device types, this is
to make this chageset focused and small.

Thanks,
Zhu Linghsan
>
>
>>> +
>>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport
>>> Options}
>>>
>>>  Virtio can use various different buses, thus the standard is split @@
>>> -872,6 +917,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
>> Feature Bits}
>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
>> for
>>>  	handling features reserved for future use.
>>>
>>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
>>> +   set SUSPEND to the device.
>> "that the driver can trigger suspending the device via the SUSPEND flag"?
>>
>>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>>> +
>>>  \end{description}
>>>
>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
>>> Bits}

