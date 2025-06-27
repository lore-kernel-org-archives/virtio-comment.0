Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2900E2F1FE1
	for <virtio-comment@lists.linux.dev>; Fri, 27 Jun 2025 01:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750989437; cv=fail; b=JTfooMHsoneNVqnUWtg0mbQEJhGHz34fiWwXYTF3+gD1WInDTDOBI7HTGwTjh1+pIEP7hoVD2IFV6DlEeZgoSLPIlES44xUL4hMToCo4cP2YHbKCQXANocAXoE1PZspDU3Q9PGY5aKLW75HFOOeQYyET+4U3RF+uh2pYNCUODQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750989437; c=relaxed/simple;
	bh=tYI23XXG7TE1etrAj2agjB4SGc4f1L8nJitfY+Sdvg0=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=QLrZFAccMy2mdPmGQRQiF4Pa8bcFL9BF6Rhj8khgSYzqCFCCPUfPwwM71rMVYZlmNxAw207sbvJccjNuNPo2cVpYIBEB0YyBagmlKAloirzGKuch6y66rZKy3v+1cI16lShS18OkhIw5Aesc2hAgoIDvjd7aX2AmmUChY3JaY8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fAPlqm6G; arc=fail smtp.client-ip=40.107.243.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fAPlqm6G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sC2QYWztcGnFJJd1xL3mP9O6xsLd/3wk56i+E/Yv/p4kVppLotuKkjpYbMDtW4IU1NDaThERDcWRICVm/oVEkOrUlGOUzoMqSWAuHq15WS7zYYEiRl8awkR1EFhEof9DpAEsHWV/zWT6DgiDIWOLv3A2YeA6zDO6YqnUM8Eo9FFqFpRf/hzHr9VwhxX4nnsJG0+FQr6vU9Nyl25crO6Q+MT3iEDSGP0LFN1W7ibX5w72qRIF0vnKr7XcX8NNVt+YH9nRN2Au0t2ss9SfN9kfXdt0R0ajV361pQyaOltqTiIuc0g4LWKDt3BQ437kKdOzO+QSyW3vIS9YW0A9gTohwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zR9s3/nWENtJWrZjsJ0aeHS+nUoWtKrcerjdXyYo30Q=;
 b=oHnxhL54GbRoLChW3TtPGh1lrrSiStSaech3E9MYC7ChC+DtOeOXSpnc6eQP7P1HxzrjApzFYNLilW//46YCpelThPpGzaZ823YCnNv+1mpVDRm0M26jwy1CjzP0VaIY1mJkJTZJr19FYJX4d0h7rIht3vQKg3LYC4koMbgP2QOgNwcOisP7PKew2KuL+ajq3Otd6dO7I/aj9K3dJvusOYxJhpoJX+uV/KE2o5oTHDjVBd81SphN658AQs6T+ebQUT1eEM7NpCMJIkb2ju3W2TP+okemoyJ6ZGgud5V9S7Se02u6/KiEcVKuDrgaaReeCZGvi6CyCVD0QhLJZZ+keg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zR9s3/nWENtJWrZjsJ0aeHS+nUoWtKrcerjdXyYo30Q=;
 b=fAPlqm6Gd4nb8/AK90bpnqdGImcl7SuEPqd2A0/uPpZ/nmSdA9ZvRYcbWQwUhK/E1lL4cFP1P48/PnXIjlc6dLP0QpMjWv/sohmV4VeFD1w8tPgCeyhQi9kEpQ7awdx0V6+31UT/h+uaw4GFH+w4vNEQHNJlwAQKgl5YyiiT7X8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by CH3PR12MB9100.namprd12.prod.outlook.com (2603:10b6:610:1a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 01:57:13 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 01:57:13 +0000
Content-Type: multipart/alternative;
 boundary="------------FPkEYsMjo2d2zi8MygwaTOyB"
Message-ID: <eddf7e8e-5197-4278-9669-572c51682613@amd.com>
Date: Fri, 27 Jun 2025 09:57:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
To: Parav Pandit <parav@nvidia.com>, "mst@redhat.com" <mst@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Ray.Huang@amd.com" <Ray.Huang@amd.com>
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
 <20250623083637.296041-4-lingshan.zhu@amd.com>
 <CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <092e01c6-1756-4293-8183-8efea6720548@amd.com>
 <CY8PR12MB7195279118F1D536979C12E3DC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@amd.com>
In-Reply-To: <CY8PR12MB7195279118F1D536979C12E3DC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
X-ClientProxiedBy: SG2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::18)
 To SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|CH3PR12MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: bf59d6bc-3dc3-4259-53b3-08ddb51def50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THVJTEgrbjczVUpPdjM4NFczZzJnN0pTVEMzK0czYWwxMUJOcmxZWnh6VTBE?=
 =?utf-8?B?bnRScTNiSkFyMHlabC9pK2tvN2tGb2R1NVlqNkJWN2g3RGoydGxXelZjL0Yz?=
 =?utf-8?B?cjd5YnphQWs4QVFWdTh2RkxGMjFmSzJKeHlMeGxqc1YzL2lBS0FCZjlUUnZY?=
 =?utf-8?B?OU1DSUNuSTVNMnpWQWxPamgvV2FtSjN4UHVtYTYyK0FWK2xCYlRVSTFlWFlF?=
 =?utf-8?B?N3VBM3pOZzhnc0QvUEpiWHZRNzlheEltWDQ3TVZmdGtHV0l1UElzQ2R2NCtx?=
 =?utf-8?B?OEVCTWVPQXZkZy92T1FjUXo1WVhGZm1FNlp5aW03WkswTUc1UXBNK3RuT1h0?=
 =?utf-8?B?dUIvZ2txdFdXZ1RJc280Rkl4UURqS21pS3Z5MnBiMXdLTk5zL3FNb0haalZZ?=
 =?utf-8?B?UlU3L2h0NVZCQ3VObnd1ZkdhSytRdVlFT1BaR3RZZ21DejljWWRvUXIvQm9W?=
 =?utf-8?B?T09SSEZROFlMZ2lwMVF5L3JSQlJ0WTQrVW5Lc0dhZDVlS3M1NFYxaTdyenpI?=
 =?utf-8?B?UnhqemVkY1lwTnBsb29reTlHbEhvTnVyZDlSemlGcE11bmpPUUNEaFZNazFO?=
 =?utf-8?B?b1EyYmMxWm1iRWswUDRsM3pLYnlXb2tOZkltU3Y1SlFxRi82ek5DelRvNTBx?=
 =?utf-8?B?UkIvTFhZWWVLR1c3aTVSNEp5OXh2VzVTWHQ2bUtnUFkwQWNTOXZ2ejZMcWR2?=
 =?utf-8?B?SUlUQ2YvdE52MmFDZFBUckZxVy91VnIvNkZkTWdacWp6Q2JGektPQkdKdVcz?=
 =?utf-8?B?Y0xPajFReWVSWGJqM2lJeWdrc3RRSm1BaVJtSGYxQ1NQZnJ6MGtGdkhkTURG?=
 =?utf-8?B?N01LOHRvcGNydmxnamRDcHdkblowaFRPTFJNYUpmQm9RcExMclU5Q0NGTVVG?=
 =?utf-8?B?dVpOcVNiZzZYT3FrMnNCbmRMN09hQjBESXNkaG8ySzJRMWRoelFmSEUyQ3pv?=
 =?utf-8?B?UUFGYmZpWjhqbzBPZnYrVGxKVmh6a1JTY1kxMys5Z291NThBSENsVkl5d0RW?=
 =?utf-8?B?UlJqa09MSmVFQ0tXd3dVVTVBSjN1MU4zajhjRDZBQWRJNXJXSk84VnpOOU0v?=
 =?utf-8?B?Z0tqVE1ZTUViS1ZmeHRCWjRLZVBFMzhYZCtYb1huUnRFaUFiR0ZrQ1NxeEJz?=
 =?utf-8?B?bkoweVNQQnk5R0tLdkdLZm5TeTRpQXp2MkRoWldodU42dm51bUQyQmtRTGlr?=
 =?utf-8?B?OFUzbXZIaEp3RTNoMkZTTURtdHdUQ1NGYzJQWnNzUW5heFlIL3A3L052cVps?=
 =?utf-8?B?bjRLcmZJREwxcnJteGh4Nmk4Unpmbzg4VlI5ZlVFNEE3YlRZNnVvSmFSOVcy?=
 =?utf-8?B?UmpZaytFeUc4UkM0ZEJLdnZLRGk4WlpWMllXcW5TTUlMeTRRNWdMaHNHL1Fj?=
 =?utf-8?B?QXFLYkpwVWtjV051MHkrc2lhamZtOHc5M3ZOZ2YwTzNoU250N3E3TGlMS2g2?=
 =?utf-8?B?bzVpMEJCQWxTcjQybU5xMTFuQXFhaDYwb01lYmxIYVNaaWd2STF5NXdmTlhN?=
 =?utf-8?B?WmNrdkg2d3pZakJ4dy9pSWRzcWVZV3Exa1l5Z2JXY2ZLVUtqUzh1bS9yTi82?=
 =?utf-8?B?TkVRTysvRzV5MExZYUZaWVVScUxvRENpdmNlK0JzVmxYT05FRzQvQndLWHZq?=
 =?utf-8?B?RFA4L2dOcmpjRGtXcEwwNWdHOFVyajVrUFZZL1VIQUJxd01paE4vcmN6VEpJ?=
 =?utf-8?B?L0lUdWlvSUpscmU4RkhxZE5vRWJheS9WeGlnaW1uRi9SS20zOWhERmV4NWl6?=
 =?utf-8?B?VisvTEt2Nzk1QnpQenNuZzJkajk1N0N4RkJRTi85ekZTY3ByeVpCSDJnQzRn?=
 =?utf-8?B?L1ppL05Na1p3Z1lFWUprdGhFaVV4K1EvQ01aYW9SZUZYNTZKd0tVWmhWUlVJ?=
 =?utf-8?Q?SmvufjSG8anxj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjRUYXNjc0ZRN3htR0p2ZUh0VXk3cW9jYmZoNTJDRlNlL0gwVFRnZDlOVXVp?=
 =?utf-8?B?bksyU1pYM2JXL3dSMFRBV2hOUldvc013L1Q5SERReU9GMGpRNzlkRW10Mm54?=
 =?utf-8?B?b0s4Q2xOQlZDSWxRVVNyalg3MnpsQUt6UG9Ic3ZZNndtOEc5ZTQ3OTNKclI2?=
 =?utf-8?B?dmFLSU8ySXRnYjFoWjRXYitSOUVnZlVOOFZNWi8rN0xOa0FOS0dMNHlJZW9Y?=
 =?utf-8?B?L0tsOFgxaHhBU01ETmFxdG92Y0xMUzNEUStuNTlPSjU2ZURNWXI1bG1Qa3FV?=
 =?utf-8?B?OWRxem1paktJZDJIeGNsSzQwUjZiUCt4TEVaZTB2c3dFZHBLWHFGcjdPZlNo?=
 =?utf-8?B?eVo2WUNtbHRLazhRbFdpdm1zaVRqbERrd3pHRzVaZHNRNzNlUHViZGtkVnlM?=
 =?utf-8?B?a0VoK21PMXNGQ3VOQUtyOWl3dXd0QmtzQlpaandEL2N4NGVZSENOL1l2R0JO?=
 =?utf-8?B?NkMrSnN6NG4rdWozK0phK3JvZG1uSXhEa0dGVmFvWVBhYkJJdER1Y0ljSWdo?=
 =?utf-8?B?S2pKbUV4MWpwcUt5cHZnWkQrWFBFdmlKaVFwNTJhQVFObnE0angrTWYxdVMx?=
 =?utf-8?B?cUNLMElreHp1MXZvMTIzdlQ2aXBuaUl1MVdqMnNjbkw5ZHZ5dTFXR0poZ1ZO?=
 =?utf-8?B?NnV3aENnZmdWQVZTOVJoR085VFF0L2VsNXkzZGRFWmNkQjBJVU0weWVGb044?=
 =?utf-8?B?QmQ4VmFjVTJsZXNUMHVYK3ZVeXlxR0h6VGp2bUhLVnVydnpjUjhUMWg4UDdP?=
 =?utf-8?B?NkVWVnBrNzVFeEZ4a0pSekNkVmVCVkJCcERPZVBqbFBiTmRyRXJCc2l1cDJR?=
 =?utf-8?B?aER0KzNoZkVHVUVMY01tVTRvSVV3TFRoOXYvNGhOVnczSitQd1FNRjYrZU4v?=
 =?utf-8?B?V0lHVUl2NVRnbXZRNXFVdmhacHpPYjVLekJKWk9UMDNlek9QZGxYb1hOcWlv?=
 =?utf-8?B?QWRwRWRmelE2Z2szc1RzN2F3alh3bUl0amlOV0xqc2c3dXdRbE0wNERDZC9y?=
 =?utf-8?B?enpBdzIvU2RsalNxdi8ySFlwWDRSM25qbUpyc3ZNWXJHWFRweGowVDVTdmJt?=
 =?utf-8?B?NFVqMmN1amZIM3kySGpoeXlNdDRJTDJZMkVwVldHVmQrOExDSVpKNXYybnFB?=
 =?utf-8?B?bkZmc3dTaWg5SnlWY2pFZlY4NFJ6SDN1QVJFbG1MS3ZidlA1TnlTdUFjaHlq?=
 =?utf-8?B?eEhaYjdzNi8wdzNGeDFZUlZKYWdJRUpRMmRYbGplUUhwalA0UjhJSFJiVWF1?=
 =?utf-8?B?YVJSb3U5dHIxc1ZzbWRHWFBJQUZYK09NbFU1Rk9QR1hFeXFDSTVHeEhkUi91?=
 =?utf-8?B?UEN5VVZFN3JWSVFqK0lLWE01YjJDVWJ2ckc3cVhqMVZqaHhwSEFSdE9EaEFy?=
 =?utf-8?B?QVowV05kZDRLcGtWTGVXODNZQnU1VTM2dkFlV0ZjOHVsRjJjZHhXNXRsTzND?=
 =?utf-8?B?SEVyVjFxQlE5UTFiVDZmcjZONlpCT3dWRkR6US8ybWkxSkkwaGNERmVvaElQ?=
 =?utf-8?B?WitFMjIwTFVCOG5RMHIwUTlpcDJtbUF1WGQxNFJBRlh6MDB1ZnRkdDVhNG9n?=
 =?utf-8?B?NUp4WFZlOW93dVhNTkczek1sSjlITlp0WEtnVUY5YWNIMTVOM2xncWJlU09X?=
 =?utf-8?B?aTdoOFI3MnRjRVE2MFJ0RWxtUTMrSzI3cytEZW5wa1ZvK3F3QUs0TGJlSE90?=
 =?utf-8?B?TkUwaFV0UnJTcmoxMVVIcXM3dzlPSDZMblRlUVoyNzAzRDN5eEhNV0NuenZK?=
 =?utf-8?B?dlJCRjlwanVhUlpnd2oyeTBvdmxzSk1JcUpBd3pPWG1DdHVZNDk2NlhnbXNx?=
 =?utf-8?B?dWxiVmd5dVVxekVWL2V5QzVXbS9JZ2JwREJ0MFVBbnpORlpWTERJOCt5NHJR?=
 =?utf-8?B?ZUF4ekJCbi9KVWJCREFTV2paVVQzUTI2dzFjekRKNDVVR01aK243K1dWaFlz?=
 =?utf-8?B?V0NZR1YxWm5mdFA3Uy9PbDBHZHNxMjRSOUJVelR6TGdGRHRUNTZGaVRVbEcw?=
 =?utf-8?B?bWdrMGc2dHFldE9JY3BMc0lXS01oQnE2MzJrNUx4QkRMRGc2NjBxUzJlWkUw?=
 =?utf-8?B?RkU5NEpHblV1bTNpb29JR0wySUNOcHM3eDJGMHpNeUU5S0cwLy80dG11c3g3?=
 =?utf-8?Q?wweC14CLLWPTEJmDzw1RsRNxB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf59d6bc-3dc3-4259-53b3-08ddb51def50
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 01:57:13.3204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSAFQQbACSpH4Ij3T6CMdTChDtRD7rj5+SEOFa1sxnVH3P+uHlZOAj+WDYa6pc9Wm5uoWk53FJdIXlugh9MbMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9100

--------------FPkEYsMjo2d2zi8MygwaTOyB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/2025 9:40 PM, Parav Pandit wrote:

>> From: Zhu, Lingshan<lingshan.zhu@amd.com> 
>> Sent: 26 June 2025 06:56 PM
> [....]
>
> I wont be able to reply to this non text format inline.
> So please find the reply here.
>
> I will not be able to take RFC 2119 keywords sprinkled in general description into the spec.
>
> Even worse, they are sprinkled non-consistently sometimes "SHOULD" and sometimes "should" in your patch.
>
> Virtio spec restricts usage of those keywords only in the requirements section.
> Existing spec is an example of it in all the sections.

do you find any sections documenting this restriction?
If we want this rule, we should document it first in the spec.

>
> Please refer to the rest of the spec for such nomenclature.
> The reasons are also explained in [1]. Please refer [1].
>
> You didn't answer 'why is it so hard for your patch to follow the current spec nomenclature.'
> i.e. to change 4 words...
> If there is no reason, I do not want to debate on this anymore.
> Both of us have more important things to do in virtio and otherwise. :)
>
> And I didn't ignore your comments, I replied with [2], which the last email in the thread.
>
> [1]https://lore.kernel.org/virtio-comment/CY8PR12MB71957FB8A0337FB62A1CDB41DC6AA@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m3ea175d50e7ffc9816a322384e6766492215469f
> [2]https://lore.kernel.org/virtio-comment/CY8PR12MB71957FB8A0337FB62A1CDB41DC6AA@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m5d09faabdaf91a97b5844b040a19f5700c377870
--------------FPkEYsMjo2d2zi8MygwaTOyB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font face="monospace">On 6/26/2025 9:40 PM, Parav Pandit wrote:</font></p>
    <blockquote type="cite" cite="mid:CY8PR12MB7195279118F1D536979C12E3DC7AA@CY8PR12MB7195.namprd12.prod.outlook.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Zhu, Lingshan <a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@amd.com">&lt;lingshan.zhu@amd.com&gt;</a> 
Sent: 26 June 2025 06:56 PM
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[....]

I wont be able to reply to this non text format inline.
So please find the reply here.

I will not be able to take RFC 2119 keywords sprinkled in general description into the spec.

Even worse, they are sprinkled non-consistently sometimes &quot;SHOULD&quot; and sometimes &quot;should&quot; in your patch.

Virtio spec restricts usage of those keywords only in the requirements section.
Existing spec is an example of it in all the sections.</pre>
    </blockquote>
    <pre>do you find any sections documenting this restriction?
If we want this rule, we should document it first in the spec.</pre>
    <blockquote type="cite" cite="mid:CY8PR12MB7195279118F1D536979C12E3DC7AA@CY8PR12MB7195.namprd12.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

Please refer to the rest of the spec for such nomenclature.
The reasons are also explained in [1]. Please refer [1].

You didn't answer 'why is it so hard for your patch to follow the current spec nomenclature.' 
i.e. to change 4 words...
If there is no reason, I do not want to debate on this anymore.
Both of us have more important things to do in virtio and otherwise. :)

And I didn't ignore your comments, I replied with [2], which the last email in the thread.

[1] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/virtio-comment/CY8PR12MB71957FB8A0337FB62A1CDB41DC6AA@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m3ea175d50e7ffc9816a322384e6766492215469f">https://lore.kernel.org/virtio-comment/CY8PR12MB71957FB8A0337FB62A1CDB41DC6AA@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m3ea175d50e7ffc9816a322384e6766492215469f</a>
[2] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/virtio-comment/CY8PR12MB71957FB8A0337FB62A1CDB41DC6AA@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m5d09faabdaf91a97b5844b040a19f5700c377870">https://lore.kernel.org/virtio-comment/CY8PR12MB71957FB8A0337FB62A1CDB41DC6AA@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m5d09faabdaf91a97b5844b040a19f5700c377870</a>
</pre>
    </blockquote>
  </body>
</html>

--------------FPkEYsMjo2d2zi8MygwaTOyB--
