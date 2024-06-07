Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7A612B73
	for <virtio-comment@lists.linux.dev>; Fri,  7 Jun 2024 01:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717724939; cv=fail; b=i/oDvu0Jqdl+gr60j2adcySaZrizqcjkSl+2WJhsY93D/qZu+mP4nMpuu2EYJsvkYTZ8FP8QxI4VZujHCKVH5S4bU6lWK7jdBkpe0ygiWbli+ADXmyes02JxulHkMOszNynbww+v4K5ytf0gD46nsW/lOcsrnDTr5ngfkxLqRkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717724939; c=relaxed/simple;
	bh=2OJgFnZXo7ZZWMrzFBaXaNtR0I2HrxxzdJvdlGWb3Ck=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=Jdt6NNC5XHU+RolYRy5Cf1Ky3nIjhviiUT50p4NOIi18CqJ8Bm03UOTN3naSHwOYxbpolwI/WwzIsz3hGHqnxMkYyYHYxMNn4YjVr56L1p6lfIO371cm0JyNT4YLhldb6xfxHw+XAi+Es9nBp2T4L9teF7CE1fYVcytQCn3htwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5eRypitc; arc=fail smtp.client-ip=40.107.93.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5eRypitc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFc2J5AHYdPeCZD0k+8yRiLdvzc34PuGmoBhcqlHlOvIMOJ7+5bsZkSDYJ6lrZxNBhqk2E0oMdh88iJpITipqVvwRx+4hC1vT6fsG+vUK9avxkIce2iLc6Vdajqh7/bJfiaJAO/faRegZyEgYmA8rO87Z9guOVXSGPf5IT5rZCbEA1BNHGDIYXXtsResBO3Hxwvk+v+qM29wwqkx5IjgjEWe2wALnJY+JzJ/53mw2NEKLo9tzCnrbkagc8Cl58OdnmzAFNHQwA1chYnwFoeXiQTewJ+3CpoHVYF8ZueSH1RyKWoA+HOVIqsgagbtm9WYgW8qemoTCw7x/YyHq/3xBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OJgFnZXo7ZZWMrzFBaXaNtR0I2HrxxzdJvdlGWb3Ck=;
 b=K25A3mpc+31y2XX10YiKAnKvY24XXE7kbfjftRdfdFEtKNCAyew8JvoQlnbbhvYAnAP9KD+weIkf5gSnctn+M5/7bYXbvw1hTmerS7PAiyO5s1f5v6D8ysqIabIVgq5Un7bfXW3GTvYiEScww+JU1DFMauUtDMnz3E1iVo5Pc3lBva36tbd2RPCOKD/qt0K9/vW8bkZUJX1/04QT6beA3vL3s9fMjY25arMOvUSvUAgzgKB8/ZdpocQNdNBWAWFPaYHa82wuOnPDztbau95PZ1oyuiikATr6UWNkPkkcX2pCmAMNBKGJU/BU9Lf6lQiZ+htgsxFh0HFfGce+6WL5IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OJgFnZXo7ZZWMrzFBaXaNtR0I2HrxxzdJvdlGWb3Ck=;
 b=5eRypitcWJOrjBCMi3pAb+wk45891OFVOHc6Z5jfpZG53QjuZ+rcLIM6bPLwgmT35lBcC3Cq+KbhtcHGXogurlBloor6xiNDyJgcgfa8pNpsTPFe8TNFpFM37gsOb+7hDFuhwlgKSU8shl1c3sLceyvdTiIFVdlqrb/ctXkSuFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH0PR12MB7840.namprd12.prod.outlook.com (2603:10b6:510:28a::16)
 by SN7PR12MB7227.namprd12.prod.outlook.com (2603:10b6:806:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 7 Jun
 2024 01:48:55 +0000
Received: from PH0PR12MB7840.namprd12.prod.outlook.com
 ([fe80::dbe7:2850:c5de:b17f]) by PH0PR12MB7840.namprd12.prod.outlook.com
 ([fe80::dbe7:2850:c5de:b17f%7]) with mapi id 15.20.7633.018; Fri, 7 Jun 2024
 01:48:55 +0000
Message-ID: <1f4e0199-ba54-44b1-a060-91acb002bb62@amd.com>
Date: Fri, 7 Jun 2024 09:48:48 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com
Cc: virtio-comment@lists.linux.dev
From: Zhu Lingshan <lingshan.zhu@amd.com>
Subject: Request voting rights
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::20) To PH0PR12MB7840.namprd12.prod.outlook.com
 (2603:10b6:510:28a::16)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7840:EE_|SN7PR12MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 05638c7d-45d6-4231-67e4-08dc8693fd96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHpwdDR4QTh0ZlgzMjNSN0xVc3ZnbkRXclkwS1ozaWdLdXIrL3JjT2hZMWFJ?=
 =?utf-8?B?QWZxRGM4WUl3QlZqaE10cUtIekJURVV3bTFyRndyZUpwM2xzNDNzbHZKSjlo?=
 =?utf-8?B?T21XRUJXaVNwUjdNUnM2TUJvTkppWEw1aGpYb2pKbjVZck5LR0FUQWJuLzhu?=
 =?utf-8?B?SDN4aWMvQ1NCUFY5MmZDYTZEdXM2dm9sYmRXeHJRY2I2Tm8waURQMFBaaU95?=
 =?utf-8?B?SHNZaXlNbW9UblNFTVJJekdWNnMrcE1QTU9FYXVxZUN0clg5RUpLNXdEWjR4?=
 =?utf-8?B?ZldHRmhFRDI1Tm1rYkZxazBVcFAyTHg2ck9qV2tvNllJNFl3RkhoWENQMVNB?=
 =?utf-8?B?aE9TQ2cxSVhIekYvTExDaHU3UGd5Smc1eXhpSTMxYll0MXhNdUgzQUc1Vk9j?=
 =?utf-8?B?QnNLVndmdmRtZ0tDTWhkK292L2V2QTVlVGNmQnljMldsOFp5SHBoYTgrMmZY?=
 =?utf-8?B?alczSjRYQ0Y2VStKQWM3eGVUUEhBZzFUZnQxWEczZDM4bEdzZ1hEY21wQWFN?=
 =?utf-8?B?RFZWcnV3NE1vdkd2Zkl4OGJVR01IMlM0VHNwbTRKYVBlQU5UWEZuOTRmZU1j?=
 =?utf-8?B?emd2a1FoclRzQjEvdk9SRFNwanNkSjM0M2tOcjdGUjRTVDR6RmJlZW5Wckpj?=
 =?utf-8?B?WDdzemduTWhaUGVlYzFaWE1aZ1h2c1BWcmpKMmlQTDdOdFEzMzc2bGlTTWlJ?=
 =?utf-8?B?WjBYMkZTMFp3SkpjNmpzMFZGNkdDTm5LSmtHeE4wWHhEanQrT2FIa21rNFMx?=
 =?utf-8?B?K1ZucUR5RHVkbzFYT2JHaG9UUVhTSjlpUHhlSHA1T3hDbnRVTUw2YVRvWHlZ?=
 =?utf-8?B?ZlJScXBhVzBVSkJ0SWo2VEh5QXo0UXlIbUd6V0dNL2EwNGc0dUlWZm55RWhN?=
 =?utf-8?B?YkNITmQ4aVVXeW5qUDVpdGQ1ekhjNGpIMUNBZkVjcFVVNVVmSEt1ZTNCeTR4?=
 =?utf-8?B?SWdpN3ZRR1lRdkRSTmlpRnpNSUJiaTZHd0MrNUlmOW9CM0dRenI1VWNpTVI0?=
 =?utf-8?B?amxud3ZCL1VSdUZtNDkyU2MreWVhVldaTENjSVY2YjlDTkoza2t4WHdUWXZO?=
 =?utf-8?B?Yk9NTWdQQy9GM3NwMkZxeDd4Ly9nOEN6ZW5xWVdyMFJFaytLZ3c1ZE1vMEVJ?=
 =?utf-8?B?cnY3STVieXp4MkNBRlJkcnFLTXFIMzU1Y3dPRWUxYkg3WnpVM08wNVNzbHlK?=
 =?utf-8?B?aVhCWUJJY3J3RlY2UEROMStXT1lYSlhzenVFbkpHdUJ6TDM0NHBqUWF1OGF1?=
 =?utf-8?B?bWpMc2gvL0lHN0M0Njh4bDU3Z05hZGNvS0VQdGxLZU9mR1pQSjllbUNOKytQ?=
 =?utf-8?B?Y01mV285RnV3aWhUV3FwUjVOLzBCUGhRYkE5cWZIZnhtZVlJejZFMzBrOVM4?=
 =?utf-8?B?MnpJOGc5UmJoNzVNNkd0Wmp1emlJVlFiVVkxcmZwYUZQNUlJdzZXZjlKMTda?=
 =?utf-8?B?TWFUY2tpWnhVaVZwMit4TlBoUFVteE8xT2E1TmFYSFJyZHNqdGxmL3dYNURl?=
 =?utf-8?B?VmpudzdZMFRkWFVJWnBGbTBNMXVhZ3JpMWFYd2pXWVdCNzdtVlpvOVkxZlY1?=
 =?utf-8?B?eGUvNnNWa0FGUlFqQVl5ZTVRSjVNRHJpcEJSYzdld2JncGhuRWF4RFgyeCtz?=
 =?utf-8?B?d0VxMjh0VG5DdUhScm55NW4xV1FKT0NoVmxkbEI4emZIeDNtOHJad3NjK0lM?=
 =?utf-8?B?bGxBRm5Za3gyMVpWR3hueVp5dlI4NkVsaFBwR1dMdDhXUmJTM2RtaHozMTZO?=
 =?utf-8?Q?4bH6LxXeo8YBIGZUDUUtEVtLHWhSodXOmsSKpCD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7840.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnQrUmhkRVF6d2lXRlMrNm1EUFRiRzJFUjh1VjlyYlkrMlhXUTBoQlBZTzlv?=
 =?utf-8?B?UlFGOUllczFGQmdhaENkbTc1eitwS05abmFURXoxSGlGeUwzNVREKzZraWo2?=
 =?utf-8?B?MGNscThWRWd3ZUs5a21OR2pabEVDRVdpa1h3WlFLckI5TCtPVW5vcDBKWTk3?=
 =?utf-8?B?SVBaWk5reXRpTEhLaGhUWVlKMnhDQjhOUG5SRXRCR2gzMXRoVmQ2VE9kVGE5?=
 =?utf-8?B?ekV6ZmVEdEVVNjBSUkUvK3JCblNDMlRkVzZNa0hsNWlRVDQ5b3h3aGJPQ0NK?=
 =?utf-8?B?ZThGQmhiblFmZXp5d0M5ajB0VlVFczQ0Qnp0UWNTbkg0c1pkZU0rd2F0SGpZ?=
 =?utf-8?B?aEFpQUdadHMwNHlMeHN6dTZvMnlzcmc2WDFVeXVDVmkzM2VCVFNjYVNlN1hH?=
 =?utf-8?B?dytEM1JFcEdiN09UYkxaVGVWc0cwSzJxeGQ1dmJzOW40ZEF3ZjhJNjBzWTNY?=
 =?utf-8?B?RFRpS0xHL1ZGQWcvT3pPcFFrVjE1c1FEOVUySi9KbEw4K0pRZXdCc3phb3hF?=
 =?utf-8?B?ejBJblFHTFlBajdocjdsSlY1Z0F3NHVYTzNkdmxTaGVNTlhZUEpEdlFnL0U2?=
 =?utf-8?B?ajBINzJ1UUxma1RQakdnajlhVWFqbWwzdTlPMFV4VDZmTmtqbHJUeEtrbnRX?=
 =?utf-8?B?Qm96MUY1UUt5cGtNVU8rSG9Fc3l3Wml1QTU3QVVlTEh5bmlZZDNMREN2YWY2?=
 =?utf-8?B?M2NsZmpWbFVrRHpUcTNUbUZlaFpxNFJXVEZJRU9BL0tiUTNEWC93ZWNaeldw?=
 =?utf-8?B?cnpzSlN2OGkzTnV2N3dLZHRDbFBHSW54TmsxVUhRM0tTWXU3cUVzNlNkRWhL?=
 =?utf-8?B?Mjh1WW12b1hhT1VXc05XY3RtM3hDQUpQOURrL3hpeS9sU2YxUTRNemtiSCt0?=
 =?utf-8?B?Z1l4WDRCNFJuSWd1bEdlMkNURE5JRlJsNkxYZXpBV0ZWaGpJZmNDaVhBaUlo?=
 =?utf-8?B?V0hUQTNYVFdWaU40RUxBdkViVDZ1eHozYksrbjA5ZlBmcWlOZmxnaXJnYlBo?=
 =?utf-8?B?MklFZktQMDBOdnkxMmpwekswU2VWdWVnWmY5TG8rM0FEcGszdnhBM3VZek9M?=
 =?utf-8?B?aU94NnMrR2pnVXpwaHFEdXVLNzl5TUNSVW5DRit3WG1nN2t6amRQeFRJd0cv?=
 =?utf-8?B?Nm9La1dHYTdGRUduZGNEd0RYRiszT1VmZG1zMGthdUhkTFdqSGJjNkdrYk5k?=
 =?utf-8?B?SEFUdHBUd0lrOHJGMWN1T2VOUEFyNENqZWo0T0pwV0NGL3UyaTNudlVYTFNG?=
 =?utf-8?B?MzdVSExNeThoWWthc21pZFpzeitpZjNIWFpNdTBLOHp0d0tQWndVOWtZODhx?=
 =?utf-8?B?NTRpQzlSMFNTakRKc3JwRGtQSTJleXdEVUlRWk1ITlREWXhsb0VNNVN0OWpu?=
 =?utf-8?B?VWhnV21OT1FWL21NMlJDTUVRaGFxajBUY2lFbmtTQVBQTEdYd29XZjh4KzVz?=
 =?utf-8?B?MGh1L05PR2RDVFRKd2paYkpTZ0tZT2RkTEdZQ1dJZ2JqQXJ0UktlN3VDMW1T?=
 =?utf-8?B?SHBQeEJhKzg5dmh1WU9aR1lZVTIra3RNc2RZNEJVSmYrTlB5bzlVZXd5dWNB?=
 =?utf-8?B?b0pJaFJJMDRsb3FWNXpkNm1CYUs5VC8zUXlTd053NGhzRyttT3FldjJYSEN1?=
 =?utf-8?B?RFhpbnVJbUxsempsT3ErejFjRUZhY2tLcHk1S3R0cTNiVWJkWGhRMndiK1R0?=
 =?utf-8?B?NmRiN2ZpZWh2VC9CS21pdHJWaFpZTmdRNGZOa2tRN09tQy9oQUl4NXlNTkJj?=
 =?utf-8?B?L29mNUxOOHMxL1FkdnM5bXdCSU15WStDSXFwOHhTOUpXSndNSmlaak90SVlt?=
 =?utf-8?B?NzVSdVEzQXJid3N1MFQ3RXVUQndtci9wRXR1M2RpcFAybmxoNFZLeDR5eklZ?=
 =?utf-8?B?eDdiVjVta1hjODR5bnBZNzBiekhOMnVUaHhhTGRDQVp4d1VTaEFadE5EVlM4?=
 =?utf-8?B?a3VoaURIVTJuSHNoT3NlNEZ0Mkg1b0JLdW9LV2JUYkZkbXcxQ2ZyeTdvM2tu?=
 =?utf-8?B?RWYyZ3V4WjVIV2xVTm5uK0t5Q3o5QVJXTWRFVW4vNXllLzFLOHhJUFpnRWRD?=
 =?utf-8?B?eGhXMHJEN2p6anFPOXdSanJ2aHNaVmRGN05nM2FtM2x4V3MvRyt0OUZESlJH?=
 =?utf-8?Q?UN1JJsg1ViIrWiuxz8sgGm3Wp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05638c7d-45d6-4231-67e4-08dc8693fd96
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7840.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 01:48:55.5448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hdY62eP2bR1xmKU2aBh6w7an3Mr8eoh1/bEMndEiMd8JzlVhzF7qr0RyHIB3KjV7gqJ3uZwGe/zo3aNQIypew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7227

Hello Chairs

This is Lingshan who re-joined virtio TC last month.
Prior to AMD, I was a voting member on behalf of Intel (lingshan.zhu@intel.com) for two years.
I humbly request to be a voting member, please kindly help grant voting rights for me.

Thanks
Zhu Lingshan

